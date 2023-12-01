import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:logging/logging.dart';

Future<void> runWithLogs(FutureOr Function() fn) async {
  Logger.root.onRecord.listen((record) {
    StringBuffer buffer = StringBuffer();
    buffer.write(record.time.toIso8601String());
    buffer.write('[${record.level.name.toLowerCase()}]');
    if (record.loggerName != Logger.root.name) {
      buffer.write('[${record.loggerName}]');
    }
    buffer.write(' ${record.message}');
    if (record.error != null) {
      buffer.write('\n${record.error}');
    }
    if (record.stackTrace != null) {
      buffer.write('\n${record.stackTrace}');
    }
    String message = buffer.toString();

    if (record.level >= Level.WARNING) {
      stderr.writeln(r'\033[31m' + message + r'\033[0m');
    } else {
      stdout.writeln(message);
    }
  });

  await runZonedGuarded(fn, (error, stack) {
    Logger.root.severe(error, stack);
    int exitCode = 1;
    if (error is ExitException) {
      exitCode = error.exitCode;
    }

    Isolate.current.pause();
    exit(exitCode);
  });
}

/// Signals the main isolate to exit with the given [exitCode].
class ExitException implements Exception {
  ExitException(this.exitCode);

  final int exitCode;

  @override
  String toString() => 'ExitException: Process exited with code $exitCode';
}
