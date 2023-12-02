import 'package:logging/logging.dart';
import 'package:repull/logic/client.dart';
import 'package:repull/logic/update.dart';
import 'package:repull/models/lock.dart';
import 'package:repull/models/source.dart';

Future<void> runOnce(
  RepullSource source,
  RepullLock lock,
  Client client,
  void Function(RepullLock) updateLock,
) async {
  final logger = Logger('repull:now:${source.repo}');

  logger.info(
    'Checking for new release. '
    'Ignoring update intervall. ',
  );

  RepullLock newLock = await runUpdate(source, lock, client);

  if (newLock != lock) {
    updateLock(newLock);
    lock = newLock;
  }
}
