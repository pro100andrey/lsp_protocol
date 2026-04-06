import 'package:args/command_runner.dart';
import 'package:cli_async_redux/cli_async_redux.dart';
import 'package:mason_logger/mason_logger.dart';

import '../redux/redux.dart';
import 'commands/generate.dart';

Future<int> run(List<String> args) async {
  final logger = Logger();

  try {
    final store = Store<AppState>(
      initialState: AppState.initial(),
      actionObservers: [AppActionLogger(logger: logger)],
      errorObserver: AppErrorObserver(logger: logger),
      globalWrapError: AppGlobalWrapError(),
      // wrapReduce: GuardsWrapReduce(),
    );

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
          ..addCommand(GenerateCommand(store: store));

    final result = runner.parse(args);
    store.setProp(logger);

    logger.detail('Logger instance stored');

    // Run the command
    final runResult = await Future.sync(() => runner.runCommand(result));

    if (runResult case int()) {
      return runResult;
    }

    return 0;
  } on Object catch (e) {
    if (e case ReduxException(:final exitCode?)) {
      return exitCode;
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
