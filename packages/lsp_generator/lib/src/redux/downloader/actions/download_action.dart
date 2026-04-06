import '../../common.dart';

final class DownloadAction extends BaseAction {
  @override
  Future<AppState?> reduce() async {
    final version = select.lspVersion;

    logger.info(
      'Downloading the Language Server Protocol (LSP) version $version...',
    );

    return null;
  }
}
