import 'package:args/command_runner.dart';
import 'package:cli_async_redux/cli_async_redux.dart';

import '../../redux/app_state.dart';
import '../../redux/downloader/downloader.dart';
import 'with_store.dart';

final class GenerateCommand extends Command with WithStore {
  GenerateCommand({required this.store});

  @override
  final name = 'generate';

  @override
  final description = 'Generates code for the Language Server Protocol (LSP).';

  @override
  final Store<AppState> store;

  @override
  Future<void> run() async {
    await dispatchAndWait(DownloadAction());
  }
}
