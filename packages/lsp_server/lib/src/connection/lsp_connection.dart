import 'dart:async';

import 'package:json_rpc_2/json_rpc_2.dart' as rpc;
import 'package:stream_channel/stream_channel.dart';

import '../server/lsp_server.dart';
import 'lsp_exception.dart';

/// Low-level LSP connection backed by a [rpc.Peer].
///
/// Wraps a [StreamChannel<String>] carrying JSON-RPC 2.0 messages and exposes
/// typed helpers for registering method handlers and sending outgoing messages.
///
/// [LspConnection] is the single dependency injected into all generated
/// handler and sender classes. You rarely interact with it directly — the
/// typed [LspServer] API is the preferred entry point.
final class LspConnection {
  LspConnection(StreamChannel<String> channel) : _peer = rpc.Peer(channel) {
    _peer.registerFallback(_handleUnknownMethod);
  }

  final rpc.Peer _peer;

  // ---------------------------------------------------------------------------
  // Handler registration
  // ---------------------------------------------------------------------------

  /// Registers a handler for an LSP *request* (client → server).
  ///
  /// [handler] receives the raw JSON value of the params field ([Object?]) and
  /// must return a JSON-encodable value or null.  Throw [LspException] to send
  /// a structured error response to the client.
  void registerRequestHandler(
    String method,
    Future<Object?> Function(Object? params) handler,
  ) {
    _peer.registerMethod(method, (rpc.Parameters params) async {
      try {
        return await handler(params.value);
      } on LspException catch (e) {
        throw e.toRpcException();
      }
    });
  }

  /// Registers a handler for an LSP *notification* (client → server).
  ///
  /// [handler] receives the raw JSON value of the params field ([Object?]).
  /// Return value is ignored by the protocol.  Throw [LspException] to
  /// propagate as an RpcException (visible in logs on the sender side).
  void registerNotificationHandler(
    String method,
    Future<void> Function(Object? params) handler,
  ) {
    _peer.registerMethod(method, (rpc.Parameters params) async {
      try {
        await handler(params.value);
      } on LspException catch (e) {
        // Notifications have no response channel; escalate so the peer logs it.
        throw e.toRpcException();
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Outgoing
  // ---------------------------------------------------------------------------

  /// Sends a notification to the client (no response expected).
  void sendNotification(String method, [Object? params]) =>
      _peer.sendNotification(method, params);

  /// Sends a request to the client and returns the decoded response value.
  Future<Object?> sendRequest(String method, [Object? params]) =>
      _peer.sendRequest(method, params);

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  /// Starts processing incoming messages.  Returns when the channel closes.
  Future<void> listen() => _peer.listen();

  /// Closes the underlying channel and stops processing.
  Future<void> close() => _peer.close();

  // ---------------------------------------------------------------------------
  // Fallback
  // ---------------------------------------------------------------------------

  void _handleUnknownMethod(rpc.Parameters params) {
    // Respond with MethodNotFound for any unregistered method.
    throw rpc.RpcException(
      LspErrorCodes.methodNotFound,
      'Method not found: ${params.method}',
    );
  }
}
