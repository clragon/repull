import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:repull/client.dart';
import 'package:repull/source.dart';
import 'package:repull/lock.dart';
import 'package:repull/logs.dart';
import 'package:repull/release.dart';
import 'package:repull/yaml.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';
import 'package:path/path.dart' as paths;

Future<void> main() {
  return runWithLogs(
    () async {
      const String configFile = 'repull.yaml';
      const String lockFile = 'repull.lock';

      final logger = Logger('repull');

      List<RepullSource> sources = [];

      try {
        String content = File(configFile).readAsStringSync();
        final config = yamlToDart(loadYaml(content));
        for (final source in config['sources']) {
          sources.add(RepullSource.fromJson(source));
        }
        logger.info('Loaded ${sources.length} sources');
      } on FileSystemException catch (e) {
        logger.severe('Error reading config file:\n$e');
        throw ExitException(1);
      } on YamlException catch (e) {
        logger.severe('Error parsing config file:\n$e');
        throw ExitException(1);
      }

      List<RepullLock> locks = [];

      try {
        File file = File(lockFile);
        if (!file.existsSync()) {
          file.createSync();
        } else {
          String content = file.readAsStringSync();
          final lock = yamlToDart(loadYaml(content));
          if (lock != null) {
            for (final source in lock['locks']) {
              locks.add(RepullLock.fromJson(source));
            }
            logger.info('Loaded ${locks.length} locks');
          }
        }
      } on FileSystemException catch (e) {
        logger.warning('Error reading lock file:\n$e');
      } on YamlException catch (e) {
        logger.severe('Error parsing lock file:\n$e');
        throw ExitException(1);
      }

      Map<String, (RepullSource, RepullLock)> tasks = {};

      for (final source in sources) {
        RepullLock lock = locks.firstWhere(
          (e) => e.repo == source.repo,
          orElse: () => RepullLock(repo: source.repo),
        );

        tasks[source.repo] = (source, lock);
      }

      final client = Client();

      Future<void> writeLock(RepullLock lock) async {
        locks.removeWhere((e) => e.repo == lock.repo);
        locks.add(lock);

        try {
          File(lockFile).writeAsStringSync(
            YAMLWriter().write({
              'locks': locks.map((e) => e.toJson()).toList(),
            }),
          );
          logger.info('Updated lock file');
        } on FileSystemException catch (e) {
          logger.severe('Error writing lock file:\n$e');
          exit(1);
        }
      }

      List<Future<void>> futures = [];

      for (final task in tasks.entries) {
        futures.add(
          runLoop(
            task.value.$1,
            task.value.$2,
            client,
            writeLock,
          ),
        );
      }

      await futures.wait;
    },
  );
}

Future<void> runLoop(
  RepullSource source,
  RepullLock lock,
  Client client,
  void Function(RepullLock) updateLock,
) async {
  final logger = Logger('repull:loop:${source.repo}');

  while (true) {
    int intervall = source.intervall * 1000;
    int sinceLastUpdate =
        DateTime.now().millisecondsSinceEpoch - (lock.lastUpdate ?? 0);

    int remaining = intervall - sinceLastUpdate;

    if (remaining > 0) {
      logger.info(
        'Waiting $remaining ms '
        'before checking for new release. ',
      );
      await Future.delayed(Duration(milliseconds: remaining));
    }

    logger.info(
      'Checking for new release. '
      'Update intervall is $intervall ms. ',
    );

    if (lock.lastUpdate == null) {
      logger.info(
        'Updating for the first time. ',
      );
    } else {
      logger.info(
        'Updating as it has been $sinceLastUpdate ms '
        'since the last update. ',
      );
    }

    RepullLock newLock = await update(source, lock, client);

    if (newLock != lock) {
      updateLock(newLock);
      lock = newLock;
    }
  }
}

Future<RepullLock> update(
  RepullSource source,
  RepullLock lock,
  Client client,
) async {
  final logger = Logger('repull:update:${source.repo}');

  SourceRelease release;

  lock = lock.copyWith(
    lastUpdate: DateTime.now().millisecondsSinceEpoch,
  );

  try {
    release = await client.getLatestAssets(source.repo);
    logger.info('Found release ${release.tag}');
  } on ClientException catch (e) {
    logger.severe('Error fetching latest assets:\n$e');
    return lock;
  }

  if (release.tag == lock.tag) {
    logger.info(
      'No new release found. '
      'Skipping update. ',
    );
    return lock;
  }

  lock = lock.copyWith(tag: release.tag);

  if (release.assets.isEmpty) {
    logger.warning('No assets found for ${release.tag}');
    return lock;
  }

  Directory sourceDir = Directory(source.repo.split('/').last);
  sourceDir.createSync();

  for (final asset in release.assets) {
    String path = paths.join(sourceDir.path, asset.name);
    logger.info('Downloading ${asset.name} to $path');
    try {
      await client.downloadAsset(asset.url, path);
    } on ClientException catch (e) {
      logger.severe('Error downloading ${asset.name}:\n$e');
      return lock;
    }
  }

  Duration timeout = Duration(seconds: 60);

  ProcessResult result;

  File? deployScript;

  try {
    if (Platform.isWindows) {
      deployScript = File(paths.join(sourceDir.path, '.deploy.bat'));
      deployScript.writeAsStringSync(source.deploy);
      print(deployScript.path);
      result = await Process.run(
        'cmd',
        [paths.basename(deployScript.path)],
        workingDirectory: sourceDir.path,
      ).timeout(timeout);
    } else if (Platform.isMacOS || Platform.isLinux) {
      deployScript = File(paths.join(sourceDir.path, '.deploy.sh'));
      deployScript.writeAsStringSync(source.deploy);
      result = await Process.run(
        'sh',
        [paths.basename(deployScript.path)],
        workingDirectory: sourceDir.path,
      ).timeout(timeout);
    } else {
      logger.severe(
        'Script execution is not supported '
        'on ${Platform.operatingSystem}',
      );
      throw ExitException(1);
    }
  } on TimeoutException {
    logger.severe(
      'Error deploying ${release.tag}:\n'
      'Process timed out after $timeout',
    );
    throw ExitException(1);
  } finally {
    deployScript?.deleteSync();
  }

  if (result.exitCode != 0) {
    logger.severe(
      'Error deploying ${release.tag}:\n'
      '${result.stderr}',
    );
    throw ExitException(result.exitCode);
  }

  return lock;
}
