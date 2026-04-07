import '../app_state.dart';
import '../models/protocol.dart';

extension type Selectors(AppState state) {
  /// LSP Version
  String get lspVersion => state.meta.version;

  /// LSP MetaModel URI
  Uri get lspMetaModelUri => Uri.parse(
    'https://microsoft.github.io/'
    'language-server-protocol/specifications/'
    'lsp/$lspVersion/metaModel/metaModel.json',
  );

  /// LSP License URI
  Uri get lspLicenseUri => Uri.parse(
    'https://microsoft.github.io/language-server-protocol/License-code.txt',
  );

  /// LSP MetaModel
  MetaProtocol get protocol => state.meta.protocol!;

  /// Resolved output directory: explicit override or default package path.
  String get resolvedOutputDir =>
      state.meta.outputDir ?? 'packages/lsp_specification';
}
