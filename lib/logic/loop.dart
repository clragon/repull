import 'package:logging/logging.dart';
import 'package:repull/logic/client.dart';
import 'package:repull/logic/update.dart';
import 'package:repull/models/lock.dart';
import 'package:repull/models/source.dart';

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

    RepullLock newLock = await runUpdate(source, lock, client);

    if (newLock != lock) {
      updateLock(newLock);
      lock = newLock;
    }
  }
}
