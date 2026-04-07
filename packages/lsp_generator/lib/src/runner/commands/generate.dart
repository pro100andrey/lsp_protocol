import 'package:args/command_runner.dart';
import 'package:cli_async_redux/cli_async_redux.dart';

import '../../redux/app_state.dart';
import '../../redux/emit/emit.dart';
import '../../redux/meta/meta.dart';
import '../../redux/resolved/resolved.dart';
import 'with_store.dart';

final class GenerateCommand extends Command with WithStore {
  GenerateCommand({required this.store}) {
    argParser.addOption(
      'output',
      abbr: 'o',
      help:
          'Output directory for generated files. '
          'Defaults to packages/lsp_specification.',
    );
  }

  @override
  final name = 'generate';

  @override
  final description = 'Generates code for the Language Server Protocol (LSP).';

  @override
  final Store<AppState> store;

  @override
  Future<void> run() async {
    final outputPath = argResults?['output'] as String?;
    if (outputPath != null) {
      dispatchSync(SetOutputDirAction(path: outputPath));
    }

    await dispatchAndWaitAll([
      FetchLSPModelAction(),
      FetchLSPLicenseAction(),
    ]);

    await store.dispatchAndWait(ResolveModelAction());
    await store.dispatchAndWait(GenerateCodeAction());
  }
}
