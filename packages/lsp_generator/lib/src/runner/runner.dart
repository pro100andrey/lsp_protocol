import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import '../common/user_exception.dart';
import 'commands/generate.dart';

Future<int> run(List<String> args) async {
  final logger = Logger();

  try {
    final runner =
        CommandRunner(
            'lsp_generator',
            'A command-line tool for generating code for the '
                'Language Server Protocol (LSP).',
          )
          ..argParser.addFlag(
            'verbose',
            abbr: 'v',
            help: 'Enable verbose logging output.',
            negatable: false,
            callback: (value) =>
                logger.level = value ? Level.verbose : Level.info,
          )
          ..addCommand(GenerateCommand(logger: logger));

    final result = runner.parse(args);

    logger.detail('Logger instance stored');

    // Run the command
    final runResult = await Future.sync(() => runner.runCommand(result));

    if (runResult case int()) {
      return runResult;
    }

    return 0;
  } on Object catch (e) {
    if (e case UserException(:final code?)) {
      return code;
    }

    if (e case UsageException() || ArgumentError()) {
      logger
        ..err(e.toString())
        ..err('Rerun with --help for usage information.');

      return 64; // EX_USAGE
    }

    rethrow;
  }
}
