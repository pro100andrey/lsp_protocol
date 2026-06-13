import 'dart:async';
import 'dart:io';

import 'package:stream_channel/stream_channel.dart';

import '../connection/lsp_connection.dart';
import '../generated/client/client_api.dart';
import '../generated/models/structures.dart';
import '../generated/models/unions.dart';
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
  var _isListening = false;

  // -------------------------------------------------------------------------
  // Incoming (server → client) handler namespaces
  // -------------------------------------------------------------------------

  /// Handlers for protocol-level (`$/`) methods.
  late final general = ClientGeneralHandlers(_connection);

  /// Handlers for `window/*` server→client notifications.
  late final window = ClientWindowHandlers(_connection);

  /// Handlers for `client/*` server→client notifications.
  late final client = ClientClientHandlers(_connection);

  /// Handlers for `textDocument/*` (e.g. `publishDiagnostics`).
  late final textDocument = ClientTextDocumentHandlers(_connection);

  /// Handlers for `workspace/*` (e.g. `applyEdit`).
  late final workspace = ClientWorkspaceHandlers(_connection);

  // -------------------------------------------------------------------------
  // Outgoing (client → server)
  // -------------------------------------------------------------------------

  /// Proxy for all outgoing (client → server) messages.
  late final server = ClientToServerProxy(_connection);

  /// Capabilities of the server, populated after [start].
  ServerCapabilities? serverCapabilities;

  // -------------------------------------------------------------------------
  // High-level API
  // -------------------------------------------------------------------------

  /// Starts the client, performs the `initialize` handshake, and waits for the
  /// server to be ready.
  ///
  /// This is the recommended way to start an LSP client as it handles the
  /// mandatory protocol sequence automatically.
  Future<InitializeResult> start({
    required ClientCapabilities capabilities,
    String? rootUri,
    List<WorkspaceFolder>? workspaceFolders,
    Object? initializationOptions,
    Map<String, Object?>? clientInfo,
  }) async {
    if (_isListening) {
      throw StateError('Client has already started listening.');
    }
    _isListening = true;

    // Start listening
    unawaited(_connection.listen());

    // 1. Send initialize
    InitializeResult result;
    try {
      result = await server.general.initialize(
        InitializeParams(
          processId: clientInfo?['processId'] as int? ?? pid,
          capabilities: capabilities,
          rootUri: rootUri,
          workspaceFolders: workspaceFolders,
          initializationOptions: initializationOptions != null
              ? LSPAny.fromJson(initializationOptions)
              : null,
          clientInfo: clientInfo != null
              ? (
                  name: clientInfo['name']! as String,
                  version: clientInfo['version'] as String?,
                )
              : null,
        ),
      );
    } catch (e) {
      _isListening = false;
      await _connection.close();
      rethrow;
    }

    serverCapabilities = result.capabilities;

    // 2. Send initialized notification
    server.general.initialized(const InitializedParams());

    return result;
  }

  // -------------------------------------------------------------------------
  // Lifecycle & State
  // -------------------------------------------------------------------------

  /// Registered middleware list for request/notification interception.
  List<LspMiddleware> get middlewares => _connection.middlewares;

  /// Adds a middleware to this client.
  void addMiddleware(LspMiddleware middleware) =>
      _connection.addMiddleware(middleware);

  /// Gets the current lifecycle state of the LSP client.
  LspState get state => _connection.state;

  /// Gets the error callback triggered on unhandled exceptions in handlers.
  void Function(Object error, StackTrace stackTrace)? get onError =>
      _connection.onError;

  /// Sets the error callback triggered on unhandled exceptions in handlers.
  set onError(void Function(Object error, StackTrace stackTrace)? value) =>
      _connection.onError = value;

  /// Starts processing incoming messages.
  Future<void> listen() {
    if (_isListening) {
      throw StateError('Client has already started listening.');
    }
    _isListening = true;
    return _connection.listen();
  }

  /// Closes the connection and stops processing.
  Future<void> close() async {
    _isListening = false;
    await _connection.close();
  }
}
