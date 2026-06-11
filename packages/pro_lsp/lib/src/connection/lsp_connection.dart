import 'dart:async';
import 'dart:convert';

import 'package:json_rpc_2/json_rpc_2.dart' as rpc;
import 'package:stream_channel/stream_channel.dart';

import '../../pro_lsp.dart' show LspServer;
import '../generated/models/methods.dart';
import '../server/cancellation_token.dart';
import '../server/lsp_request.dart';
import '../server/lsp_server.dart' show LspServer;
import '../server/lsp_state.dart';
import '../server/middleware.dart';
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
  LspConnection(StreamChannel<String> channel) {
    // Intercept incoming stream to extract request IDs and handle cancelRequest
    final mappedStream = channel.stream.map((event) {
      try {
        final decoded = jsonDecode(event);
        if (decoded is Map<String, Object?>) {
          final id = decoded['id'];
          final method = decoded['method'];
          if (id != null && method is String) {
            // Request: Inject request ID so handlers can map it to cancellation
            final params = decoded['params'];
            final cleanParams = params is Map<String, Object?>
                ? Map<String, Object?>.of(params)
                : <String, Object?>{};
            cleanParams['_requestId'] = id;
            decoded['params'] = cleanParams;
            return jsonEncode(decoded);
          } else if (id == null &&
              method == NotificationMethod.cancelRequest.value) {
            final params = decoded['params'];
            if (params is Map<String, Object?>) {
              final cancelId = params['id'];
              if (cancelId != null) {
                _cancelRequest(cancelId);
              }
            }
          }
        }
      } on Object catch (_) {}
      return event;
    });

    _peer = rpc.Peer(StreamChannel<String>(mappedStream, channel.sink));
    _peer.registerFallback(_handleUnknownMethod);

    // Register $/cancelRequest handler so json_rpc_2 doesn't treat it as unknown
    registerNotificationHandler(
      NotificationMethod.cancelRequest,
      (params, context) async {},
    );
  }

  late final rpc.Peer _peer;

  /// The set of LSP methods that have a registered handler.
  final Set<LSPMethod> registeredMethods = {};

  // ---------------------------------------------------------------------------
  // Lifecycle & State
  // ---------------------------------------------------------------------------

  LspState _state = LspState.uninitialized;

  /// Gets the current lifecycle state of this connection.
  LspState get state => _state;

  void _verifyState(String method, {required bool isNotification}) {
    if (isNotification) {
      if (!_state.isNotificationAllowed(method)) {
        throw LspException.invalidRequest(
          'Notification $method is not allowed in state $_state',
        );
      }
    } else {
      if (!_state.isRequestAllowed(method)) {
        if (_state == LspState.uninitialized ||
            _state == LspState.initializing) {
          throw LspException.serverNotInitialized(
            'Server is not initialized. Request: $method',
          );
        }
        throw LspException.invalidRequest(
          'Request $method is not allowed in state $_state',
        );
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Middleware & Error Handling
  // ---------------------------------------------------------------------------

  final List<LspMiddleware> _middlewares = [];

  /// Gets the list of registered middlewares.
  List<LspMiddleware> get middlewares => _middlewares;

  /// The error callback triggered on unhandled exceptions in handlers.
  void Function(Object error, StackTrace stackTrace)? onError;

  // ---------------------------------------------------------------------------
  // Cancellation Tracking
  // ---------------------------------------------------------------------------

  final _activeCancellations = <Object, CancellationToken>{};

  void _cancelRequest(Object id) {
    _activeCancellations[id]?.cancel();
  }

  // ---------------------------------------------------------------------------
  // Handler registration
  // ---------------------------------------------------------------------------

  /// Registers a handler for an LSP *request* (client → server).
  ///
  /// [handler] receives the raw JSON value of the params field ([Object?]) and
  /// must return a JSON-encodable value or null.  Throw [LspException] to send
  /// a structured error response to the client.
  void registerRequestHandler(
    LSPMethod method,
    Future<Object?> Function(Object? params, LspRequest context) handler,
  ) {
    registeredMethods.add(method);
    _peer.registerMethod(method.value, (rpc.Parameters params) async {
      final rawVal = params.value;
      Object? requestId;
      if (rawVal is Map) {
        requestId = rawVal['_requestId'];
      }

      final token = CancellationToken();
      if (requestId != null) {
        _activeCancellations[requestId] = token;
      }

      final context = LspRequest(
        method: method.value,
        cancellationToken: token,
        id: requestId,
      );

      try {
        // 1. Verify state permissions
        _verifyState(method.value, isNotification: false);

        // 2. Lifecycle state changes
        if (method == RequestMethod.initialize) {
          _state = LspState.initializing;
        } else if (method == RequestMethod.shutdown) {
          _state = LspState.shuttingDown;
        }

        final request = LspIncomingRequest(
          method: method.value,
          params: rawVal,
          requestId: requestId,
        );

        final response = await composeMiddlewares(
          _middlewares,
          (req) => runZoned(
            () => handler(req.params, context),
            zoneValues: {#cancellationToken: token},
          ),
        )(request);

        if (method == RequestMethod.initialize) {
          _state = LspState.initialized;
        }

        return response;
      } on LspException catch (e) {
        if (method == RequestMethod.initialize) {
          _state = LspState.uninitialized; // Reset on initialization failure
        }
        throw e.toRpcException();
      } catch (e, stackTrace) {
        if (method == RequestMethod.initialize) {
          _state = LspState.uninitialized; // Reset on initialization failure
        }

        onError?.call(e, stackTrace);

        throw rpc.RpcException(
          LspErrorCodes.internalError,
          'Internal error processing request: $e',
          data: {'stackTrace': stackTrace.toString()},
        );
      } finally {
        if (requestId != null) {
          _activeCancellations.remove(requestId);
        }
      }
    });
  }

  /// Registers a handler for an LSP *notification* (client → server).
  ///
  /// [handler] receives the raw JSON value of the params field ([Object?]).
  /// Return value is ignored by the protocol.  Throw [LspException] to
  /// propagate as an RpcException (visible in logs on the sender side).
  void registerNotificationHandler(
    LSPMethod method,
    Future<void> Function(Object? params, LspRequest context) handler,
  ) {
    registeredMethods.add(method);
    _peer.registerMethod(method.value, (rpc.Parameters params) async {
      final rawVal = params.value;

      final context = LspRequest(
        method: method.value,
        cancellationToken: CancellationToken(),
      );

      try {
        // 1. Verify state permissions
        _verifyState(method.value, isNotification: true);

        if (method == NotificationMethod.exit) {
          _state = LspState.exited;
        }

        final request = LspIncomingRequest(
          method: method.value,
          params: rawVal,
        );

        await composeMiddlewares(_middlewares, (req) async {
          await handler(req.params, context);
          return null;
        })(request);

        if (method == NotificationMethod.exit) {
          await close();
        }
      } on LspException catch (e) {
        throw e.toRpcException();
      } catch (e, stackTrace) {
        onError?.call(e, stackTrace);

        throw rpc.RpcException(
          LspErrorCodes.internalError,
          'Internal error processing notification: $e',
          data: {'stackTrace': stackTrace.toString()},
        );
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Outgoing
  // ---------------------------------------------------------------------------

  /// Sends a notification to the client (no response expected).
  void sendNotification(LSPMethod method, [Object? params]) =>
      _peer.sendNotification(method.value, params);

  /// Sends a request to the client and returns the decoded response value.
  Future<Object?> sendRequest(LSPMethod method, [Object? params]) =>
      _peer.sendRequest(method.value, params);

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
    throw rpc.RpcException(
      LspErrorCodes.methodNotFound,
      'Method not found: ${params.method}',
    );
  }
}
