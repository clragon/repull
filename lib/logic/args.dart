import 'package:args/args.dart';
import 'package:repull/models/args.dart';

final argsParser = ArgParser()
  ..addOption(
    'config',
    abbr: 'c',
    defaultsTo: 'repull.yaml',
    help: 'Path to the configuration file.',
  )
  ..addFlag(
    'now',
    abbr: 'n',
    negatable: false,
    help: 'Execute immediately without delay.',
  )
  ..addFlag(
    'help',
    abbr: 'h',
    negatable: false,
    help: 'Displays this help information.',
  );

RepullArgs parseArgs(List<String> arguments) {
  final args = argsParser.parse(arguments);

  return RepullArgs(
    config: args['config'],
    now: args['now'],
    help: args['help'],
  );
}

void printHelp() {
  print('Usage: repull [options]');
  print('Options:');
  print(argsParser.usage);
}
