import 'dart:async';

import 'package:stream_channel/stream_channel.dart';

import '../connection/lsp_connection.dart';
import '../generated/server/server_api.dart';
import '../transport/lsp_byte_stream_channel.dart';
import 'lsp_state.dart';
import 'middleware.dart';
import 'progress_manager.dart';

export '../generated/server/server_api.dart';
export 'cancellation_token.dart';
export 'lsp_state.dart';
export 'middleware.dart';
export 'progress_manager.dart';

/// Top-level LSP server.
///
/// Provides namespace-grouped handler registration (incoming) and a
/// [client] proxy for outgoing messages.
///
/// **Quick start (stdio transport):**
/// ```dart
/// void main() async {
///   final server = LspServer();
///
///   server.general.onInitialize((params) async {
///     return InitializeResult(
///       capabilities: ServerCapabilities(
///         hoverProvider: true,
///       ),
///     );
///   });
///
///   server.textDocument.onHover((params) async => Hover(
///         contents: MarkupContent(
///           kind: MarkupKind.markdown,
///           value: '**Hi**',
///         ),
///       ));
///
///   await server.listen();
/// }
/// ```
///
/// **Sending messages to the client:**
/// ```dart
/// server.client.window.logMessage(
///   LogMessageParams(type: MessageType.info, message: 'Ready'),
/// );
/// ```
final class LspServer {
  /// Creates a server using stdin/stdout as the byte transport (the
  /// standard LSP process communication model).
  LspServer() : _connection = LspConnection(LspByteStreamChannel.fromStdio());

  /// Creates a server from an arbitrary byte [StreamChannel].
  ///
  /// Useful for testing or alternative transports (TCP, pipes, etc.).
  LspServer.fromChannel(StreamChannel<List<int>> channel)
      : _connection = LspConnection(
          LspByteStreamChannel.fromByteChannel(channel),
        );

  final LspConnection _connection;

  // -------------------------------------------------------------------------
  // Incoming handler namespaces
  // -------------------------------------------------------------------------

  /// Handlers for `initialize`, `shutdown`, `initialized`, `exit`, and
  /// protocol-level (`$/`) methods.
  late final general = GeneralHandlers(_connection);

  /// Handlers for `textDocument/*` requests and notifications.
  late final textDocument = TextDocumentHandlers(_connection);

  /// Handlers for `workspace/*` requests and notifications.
  late final workspace = WorkspaceHandlers(_connection);

  /// Handlers for `callHierarchy/*` requests.
  late final callHierarchy = CallHierarchyHandlers(_connection);

  /// Handlers for `typeHierarchy/*` requests.
  late final typeHierarchy = TypeHierarchyHandlers(_connection);

  /// Handlers for `notebookDocument/*` notifications.
  late final notebookDocument = NotebookDocumentHandlers(_connection);

  /// Handlers for `completionItem/resolve`.
  late final completionItem = CompletionItemHandlers(_connection);

  /// Handlers for `codeAction/resolve`.
  late final codeAction = CodeActionHandlers(_connection);

  /// Handlers for `codeLens/resolve`.
  late final codeLens = CodeLensHandlers(_connection);

  /// Handlers for `documentLink/resolve`.
  late final documentLink = DocumentLinkHandlers(_connection);

  /// Handlers for `inlayHint/resolve`.
  late final inlayHint = InlayHintHandlers(_connection);

  /// Handlers for `workspaceSymbol/resolve`.
  late final workspaceSymbol = WorkspaceSymbolHandlers(_connection);

  /// Handlers for `window/*` client→server notifications.
  late final window = WindowHandlers(_connection);

  // -------------------------------------------------------------------------
  // Outgoing (server → client)
  // -------------------------------------------------------------------------

  /// Proxy for all outgoing (server → client) messages.
  late final client = ServerToClientProxy(_connection);

  // -------------------------------------------------------------------------
  // Additional capabilities
  // -------------------------------------------------------------------------

  /// High-level manager for creating work done progress sessions.
  late final progress = WorkDoneProgressManager(_connection);

  /// Registered middleware list for request/notification interception.
  List<LspMiddleware> get middlewares => _connection.middlewares;

  /// Gets the current lifecycle state of the LSP server.
  LspState get state => _connection.state;

  /// Gets the error callback triggered on unhandled exceptions in handlers.
  void Function(Object error, StackTrace stackTrace)? get onError =>
      _connection.onError;

  /// Sets the error callback triggered on unhandled exceptions in handlers.
  set onError(void Function(Object error, StackTrace stackTrace)? value) =>
      _connection.onError = value;

  // -------------------------------------------------------------------------
  // Lifecycle
  // -------------------------------------------------------------------------

  /// Starts processing incoming messages.
  ///
  /// Returns when the underlying channel closes (e.g. the client exits).
  Future<void> listen() => _connection.listen();

  /// Closes the connection and stops processing.
  Future<void> close() => _connection.close();
}
