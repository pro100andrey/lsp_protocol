import '../app_state.dart';

extension type Selectors(AppState state) {
  /// LSP Version
  String get lspVersion => state.downloader.version;

  /// LSP MetaModel URI
  Uri get lspMetaModelUri => Uri.parse(
    'https://microsoft.github.io/'
    'language-server-protocol/specifications/'
    'lsp/$lspVersion/metaModel/metaModel.json',
  );

  /// LSP License URI
  Uri get lspLicenseUri => Uri.parse(
    'https://microsoft.github.io/anguage-server-protocol/License-code.txt',
  );
}
