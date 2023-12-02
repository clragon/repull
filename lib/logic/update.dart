import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:repull/logic/client.dart';
import 'package:repull/logic/logs.dart';
import 'package:repull/models/lock.dart';
import 'package:repull/models/release.dart';
import 'package:repull/models/source.dart';
import 'package:path/path.dart' as paths;

Future<RepullLock> runUpdate(
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

  List<RegExp>? regexes;

  if (source.regex != null) {
    regexes = source.regex!
        .split('\n')
        .where((e) => e.isNotEmpty)
        .map(RegExp.new)
        .toList();
    if (regexes.isEmpty) {
      regexes = null;
    }
  }

  Iterator<SourceAsset> iterator = release.assets.iterator;

  while (regexes != null && iterator.moveNext()) {
    final asset = iterator.current;
    if (!regexes.any((regex) => regex.hasMatch(asset.name))) {
      logger.info('Skipping ${asset.name} because it does not match any regex');
      release = release.copyWith(
        assets: List.of(release.assets)..remove(asset),
      );
    }
  }

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
      result = await Process.run(
        'cmd',
        ['/c', paths.basename(deployScript.path)],
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
