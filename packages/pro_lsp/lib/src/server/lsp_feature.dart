import 'lsp_server.dart';

/// An interface for self-contained LSP feature modules.
///
/// Features allow grouping related LSP handlers into separate classes
/// instead of registering everything in the main entry point.
///
/// Example:
/// ```dart
/// class MyHoverFeature extends LspFeature {
///   @override
///   void register(LspServer server) {
///     server.textDocument.onHover((params, context) async => ...);
///   }
/// }
/// ```
abstract interface class LspFeature {
  /// Registers this feature's handlers with the [server].
  void register(LspServer server);
}
