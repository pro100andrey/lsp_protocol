import 'dart:async';

import 'package:stream_channel/stream_channel.dart';

import '../connection/lsp_connection.dart';
import '../generated/client/client_api.dart';
import '../server/lsp_state.dart';
import '../server/middleware.dart';
import '../transport/lsp_byte_stream_channel.dart';

export '../generated/client/client_api.dart';

/// Top-level LSP client.
///
/// Provides namespace-grouped handler registration (incoming from server) and a
/// [server] proxy for outgoing messages.
final class LspClient {
  /// Creates a client using stdin/stdout as the byte transport.
  LspClient() : _connection = LspConnection(LspByteStreamChannel.fromStdio());

  /// Creates a client from an arbitrary byte [StreamChannel].
  LspClient.fromChannel(StreamChannel<List<int>> channel)
    : _connection = LspConnection(
        LspByteStreamChannel.fromByteChannel(channel),
      );

  final LspConnection _connection;

  // -------------------------------------------------------------------------
  // Incoming (server → client) handler namespaces
  // -------------------------------------------------------------------------

  /// Handlers for protocol-level (`$/`) methods.
  late final general = GeneralHandlers(_connection);

  /// Handlers for `window/*` server→client notifications.
  late final window = WindowHandlers(_connection);

  /// Handlers for `client/*` server→client notifications.
  late final client = ClientHandlers(_connection);

  /// Handlers for `textDocument/*` (e.g. `publishDiagnostics`).
  late final textDocument = TextDocumentHandlers(_connection);

  /// Handlers for `workspace/*` (e.g. `applyEdit`).
  late final workspace = WorkspaceHandlers(_connection);

  // -------------------------------------------------------------------------
  // Outgoing (client → server)
  // -------------------------------------------------------------------------

  /// Proxy for all outgoing (client → server) messages.
  late final server = ClientToServerProxy(_connection);

  // -------------------------------------------------------------------------
  // Lifecycle & State
  // -------------------------------------------------------------------------

  /// Registered middleware list for request/notification interception.
  List<LspMiddleware> get middlewares => _connection.middlewares;

  /// Gets the current lifecycle state of the LSP client.
  LspState get state => _connection.state;

  /// Gets the error callback triggered on unhandled exceptions in handlers.
  void Function(Object error, StackTrace stackTrace)? get onError =>
      _connection.onError;

  /// Sets the error callback triggered on unhandled exceptions in handlers.
  set onError(void Function(Object error, StackTrace stackTrace)? value) =>
      _connection.onError = value;

  /// Starts processing incoming messages.
  Future<void> listen() => _connection.listen();

  /// Closes the connection and stops processing.
  Future<void> close() => _connection.close();
}
