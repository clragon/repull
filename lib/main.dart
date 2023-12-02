import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:repull/logic/args.dart';
import 'package:repull/logic/client.dart';
import 'package:repull/logic/logs.dart';
import 'package:repull/logic/loop.dart';
import 'package:repull/logic/once.dart';
import 'package:repull/models/args.dart';
import 'package:repull/models/lock.dart';
import 'package:repull/models/source.dart';
import 'package:repull/logic/yaml.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';
import 'package:path/path.dart' as paths;

Future<void> main(List<String> arguments) {
  return runWithLogs(
    () async {
      final logger = Logger('repull');

      RepullArgs args = parseArgs(arguments);

      if (args.help) return printHelp();

      String configFile = args.config;

      logger.info('Using config file $configFile');

      String lockFile = '${paths.basenameWithoutExtension(configFile)}.lock';

      bool runNow = args.now;

      logger.info('Running immediatly: ${runNow ? 'yes' : 'no'}');

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
        if (runNow) {
          futures.add(
            runOnce(
              task.value.$1,
              task.value.$2,
              client,
              writeLock,
            ),
          );
        } else {
          futures.add(
            runLoop(
              task.value.$1,
              task.value.$2,
              client,
              writeLock,
            ),
          );
        }
      }

      await futures.wait;
    },
  );
}
