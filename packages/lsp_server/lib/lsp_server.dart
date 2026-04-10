/// LSP server library — typed handler registration and client sender API.
///
/// Typical use:
/// ```dart
/// import 'package:lsp_server/lsp_server.dart';
/// import 'package:lsp_specification/lsp_specification.dart';
///
/// void main() async {
///   final server = LspServer();
///   server.general.onInitialize((params) async =>
///     InitializeResult(capabilities: ServerCapabilities()));
///   server.textDocument.onHover((params) async => null);
///   await server.listen();
/// }
/// ```
library;

export 'src/connection/lsp_connection.dart';
export 'src/connection/lsp_exception.dart';
export 'src/server/lsp_server.dart';
export 'src/transport/lsp_byte_stream_channel.dart';
