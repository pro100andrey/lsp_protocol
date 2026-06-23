import 'dart:async';
import 'dart:io';

import 'package:stream_channel/stream_channel.dart';

import '../connection/lsp_endpoint.dart';
import '../generated/client/client_api.dart';
import '../generated/models/structures.dart';
import '../generated/models/unions.dart';
import '../transport/lsp_byte_stream_channel.dart';

export '../generated/client/client_api.dart';

/// Top-level LSP client.
///
/// Provides namespace-grouped handler registration (incoming from server) and a
/// [server] proxy for outgoing messages.
final class LspClient extends LspEndpoint {
  /// Creates a client using stdin/stdout as the byte transport.
  LspClient() : this._(LspByteStreamChannel.fromStdio());

  /// Creates a client from an arbitrary byte [StreamChannel].
  LspClient.fromChannel(StreamChannel<List<int>> channel)
    : this._(LspByteStreamChannel.fromByteChannel(channel));

  LspClient._(super.result);

  var _isListening = false;

  // Incoming (server → client) handler namespaces

  /// Handlers for protocol-level (`$/`) methods.
  late final general = ClientGeneralHandlers(connection);

  /// Handlers for `window/*` server→client notifications.
  late final window = ClientWindowHandlers(connection);

  /// Handlers for `client/*` server→client notifications.
  late final client = ClientClientHandlers(connection);

  /// Handlers for `textDocument/*` (e.g. `publishDiagnostics`).
  late final textDocument = ClientTextDocumentHandlers(connection);

  /// Handlers for `workspace/*` (e.g. `applyEdit`).
  late final workspace = ClientWorkspaceHandlers(connection);

  /// Handlers for `telemetry/*` (e.g. `telemetry/event`).
  late final telemetry = ClientTelemetryHandlers(connection);

  // Outgoing (client → server)

  /// Proxy for all outgoing (client → server) messages.
  late final server = ClientToServerProxy(connection);

  /// Capabilities of the server, populated after [start].
  ServerCapabilities? serverCapabilities;

  // High-level API

  /// Starts the client, performs the `initialize` handshake, and waits for the
  /// server to be ready.
  ///
  /// This is the recommended way to start an LSP client as it handles the
  /// mandatory protocol sequence automatically. It begins listening internally,
  /// so do **not** also call [listen] — the two are mutually exclusive entry
  /// points (calling either after the client is already listening throws a
  /// [StateError]). Use the lower-level [listen] only when you intend to drive
  /// the `initialize`/`initialized` handshake yourself.
  ///
  /// [clientInfo] identifies this client to the server (e.g.
  /// `ClientInfo(name: 'my-editor', version: '1.0.0')`). [processId] is the
  /// parent process ID reported to the server; it defaults to the current
  /// process [pid].
  Future<InitializeResult> start({
    required ClientCapabilities capabilities,
    String? rootUri,
    List<WorkspaceFolder>? workspaceFolders,
    Object? initializationOptions,
    ClientInfo? clientInfo,
    int? processId,
  }) async {
    if (_isListening) {
      throw StateError('Client has already started listening.');
    }
    _isListening = true;

    // Start listening
    unawaited(connection.listen());

    // 1. Send initialize
    InitializeResult result;
    try {
      result = await server.general.initialize(
        InitializeParams(
          processId: processId ?? pid,
          capabilities: capabilities,
          rootUri: rootUri,
          workspaceFolders: workspaceFolders,
          initializationOptions: initializationOptions != null
              ? LSPAny.fromJson(initializationOptions)
              : null,
          clientInfo: clientInfo,
        ),
      );
    } catch (e) {
      _isListening = false;
      await connection.close();
      rethrow;
    }

    serverCapabilities = result.capabilities;

    // 2. Send initialized notification
    server.general.initialized(const InitializedParams());

    // 3. Advance our own connection state so incoming server→client messages
    //    pass _verifyState. The state machine only auto-advances on an
    //    *incoming* initialize request, which a client never receives.
    connection.markInitialized();

    return result;
  }

  // Lifecycle & State

  /// Starts processing incoming messages without performing the handshake.
  ///
  /// Low-level alternative to [start]: use it when you want to send the
  /// `initialize` request and `initialized` notification yourself (e.g. to
  /// customize the sequence). Most callers should use [start] instead. Throws a
  /// [StateError] if the client is already listening (including after [start]).
  Future<void> listen() {
    if (_isListening) {
      throw StateError('Client has already started listening.');
    }
    _isListening = true;
    return connection.listen();
  }

  @override
  Future<void> beforeClose() async {
    _isListening = false;
  }
}
