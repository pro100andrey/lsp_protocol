import 'dart:async';
import 'dart:collection';

import 'package:json_rpc_2/json_rpc_2.dart' as rpc;
import 'package:stream_channel/stream_channel.dart';

import '../../pro_lsp.dart' show LspServer;
import '../generated/models/methods.dart';
import '../server/cancellation_token.dart';
import '../server/lsp_request.dart';
import '../server/lsp_state.dart';
import '../server/middleware.dart';
import 'lsp_exception.dart';

/// Low-level LSP connection backed by a [rpc.Peer].
///
/// Wraps a [StreamChannel<Object?>] carrying JSON-RPC 2.0 messages and exposes
/// typed helpers for registering method handlers and sending outgoing messages.
///
/// ## Lifecycle
///
/// The connection progresses through the following states:
///
/// 1. [LspState.uninitialized] — initial state, no requests allowed
/// 2. [LspState.initializing] — after `initialize` request starts
/// 3. [LspState.initialized] — after `initialize` request completes
/// 4. [LspState.shuttingDown] — after `shutdown` request starts
/// 5. [LspState.exited] — after `exit` notification received
///
/// State transitions are enforced by [_verifyState] which rejects invalid
/// requests based on the current state.
///
/// ## Cancellation
///
/// Request cancellation is tracked via [CancellationToken] instances created
/// per request. When a `$ /cancelRequest` notification arrives, the active
/// token is cancelled automatically.
///
/// ## Services
///
/// [LspConnection] provides a simple service container via [register],
/// [resolve], and [tryResolve]. Services are available to all handlers
/// and middlewares registered on this connection.
///
/// ## Middleware
///
/// Middlewares added via [addMiddleware] wrap all request and notification
/// handlers. They are composed via [composeMiddlewares] and receive
/// [LspIncomingRequest] objects.
///
/// ## Multicast Notifications
///
/// Notifications support multiple handlers. Each call to
/// [registerNotificationHandler] adds a handler, and all registered
/// handlers are invoked sequentially for each notification. The returned
/// unregistration function removes only that specific handler.
///
/// [LspConnection] is the single dependency injected into all generated
/// handler and sender classes. You rarely interact with it directly — the
/// typed [LspServer] API is the preferred entry point.
final class LspConnection {
  LspConnection(StreamChannel<Object?> channel) {
    // Intercept incoming stream to extract request IDs and handle cancelRequest
    final decodedStream = channel.stream
        .map((event) {
          try {
            final decoded = event;
            if (decoded case {'id': final Object id, 'method': String _}) {
              // Request: Map request ID using Expando so handlers can map it to
              // cancellation without mutating parameter maps.
              final params = decoded['params'];
              if (params case Map() || List()) {
                _requestIds[params!] = id;
              }
            } else if (decoded case {
              'method': final String method,
              'params': {'id': final Object cancelId},
            } when method == NotificationMethod.cancelRequest.value) {
              _cancelRequest(cancelId);
            }
            return decoded;
          } on Object catch (e) {
            // Send Parse Error response directly back to the client
            channel.sink.add({
              'jsonrpc': '2.0',
              'error': {
                'code': LspErrorCodes.parseError,
                'message': 'Parse error: $e',
              },
              'id': null,
            });

            return null;
          }
        })
        .where((event) => event != null);

    _peer = rpc.Peer.withoutJson(
      StreamChannel<Object?>(decodedStream, channel.sink),
    );
    _peer.registerFallback(_handleUnknownMethod);

    // Register $/cancelRequest handler so json_rpc_2 doesn't treat it as unknown
    registerNotificationHandler(
      NotificationMethod.cancelRequest,
      (params, context) async {},
    );
  }

  /// Maps request parameter objects to their JSON-RPC request IDs.
  ///
  /// Used to correlate `$/cancelRequest` notifications with the original
  /// request so handlers can check cancellation status.
  final _requestIds = Expando<Object>();

  /// The underlying JSON-RPC 2.0 peer used for sending and receiving messages.
  late final rpc.Peer _peer;

  /// The set of LSP methods that have a registered handler.
  Set<LSPMethod> get registeredMethods =>
      UnmodifiableSetView(_registeredMethods);

  /// Internal set tracking which methods have registered handlers.
  final Set<LSPMethod> _registeredMethods = {};

  /// Simple service container mapping types to their implementations.
  ///
  /// Services are registered via [register] and resolved via [resolve] or
  /// [tryResolve]. Available to all handlers and middlewares.
  final Map<Type, Object> _services = {};

  /// Multicast notification handlers map.
  ///
  /// Maps method names to lists of handler functions. When a notification
  /// arrives, all registered handlers for that method are invoked sequentially.
  final _notificationHandlers =
      <
        String,
        List<Future<void> Function(Object? params, LspRequest context)>
      >{};

  /// Registers a service in the connection context.
  void register<T extends Object>(T service) {
    _services[T] = service;
  }

  /// Resolves a registered service. Throws if not found.
  T resolve<T extends Object>() {
    final service = _services[T];
    if (service == null) {
      throw StateError('Service of type $T is not registered.');
    }
    return service as T;
  }

  /// Tries to resolve a registered service, returns null if not found.
  T? tryResolve<T extends Object>() => _services[T] as T?;

  // Lifecycle & State

  LspState _state = .uninitialized;

  /// Validates that [method] is allowed in the current [_state].
  ///
  /// Throws [LspException.invalidRequest] if the method is not permitted.
  /// Throws [LspException.serverNotInitialized] for requests sent before
  /// the `initialize` handshake completes.
  void _verifyState(LSPMethod method, {required bool isNotification}) {
    if (isNotification) {
      if (!_state.isNotificationAllowed(method as NotificationMethod)) {
        throw LspException.invalidRequest(
          'Notification $method is not allowed in state $_state',
        );
      }
    } else {
      if (!_state.isRequestAllowed(method as RequestMethod)) {
        if (_state == .uninitialized || _state == .initializing) {
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

  /// Gets the current lifecycle state of this connection.
  ///
  /// See the [class-level documentation] for the full
  /// lifecycle description.
  LspState get state => _state;

  // Middleware & Error Handling

  /// List of middleware components that wrap all request/notification handlers.
  final List<LspMiddleware> _middlewares = [];

  /// Gets an unmodifiable list of registered middlewares.
  List<LspMiddleware> get middlewares => List.unmodifiable(_middlewares);

  /// Adds a middleware to this connection.
  void addMiddleware(LspMiddleware middleware) {
    _middlewares.add(middleware);
  }

  /// The error callback triggered on unhandled exceptions in handlers.
  void Function(Object error, StackTrace stackTrace)? onError;

  // Cancellation Tracking

  /// Maps request IDs to their active [CancellationToken] instances.
  final _activeCancellations = <Object, CancellationToken>{};

  /// Cancels the request associated with [id].
  void _cancelRequest(Object id) {
    _activeCancellations[id]?.cancel();
  }

  // Handler registration

  /// Core handler registration logic for both requests and notifications.
  ///
  /// For requests: registers a single handler via the underlying [_peer].
  /// For notifications: supports multicast by maintaining a list of handlers
  /// per method name.
  ///
  /// Returns an unregistration function for notifications (null for requests).
  void Function()? _registerHandler(
    LSPMethod method, {
    required bool isRequest,
    required Future<Object?> Function(Object? params, LspRequest context)
    handler,
  }) {
    _registeredMethods.add(method);

    Future<void> Function(Object? params, LspRequest context)? multicastItem;

    if (!isRequest) {
      final methodStr = method.value;
      final list = _notificationHandlers.putIfAbsent(methodStr, () => []);
      multicastItem = (params, context) => handler(params, context);
      list.add(multicastItem);
      if (list.length > 1) {
        return () {
          list.remove(multicastItem);
        };
      }
    }

    _peer.registerMethod(method.value, (rpc.Parameters params) async {
      final rawVal = params.value;
      Object? requestId;
      if (isRequest) {
        if (rawVal case Map() || List()) {
          requestId = _requestIds[rawVal as Object];
        }
      }

      final token = isRequest && requestId != null
          ? (_activeCancellations[requestId] = CancellationToken())
          : CancellationToken();

      final context = LspRequest(
        method: method.value,
        cancellationToken: token,
        id: requestId,
        connection: this,
      );

      try {
        // 1. Verify state permissions
        _verifyState(method, isNotification: !isRequest);

        // 2. Pre-handler state changes
        if (isRequest) {
          _state = switch (method) {
            RequestMethod.initialize => .initializing,
            RequestMethod.shutdown => .shuttingDown,
            _ => _state,
          };
        } else {
          if (method == NotificationMethod.exit) {
            _state = .exited;
          }
        }

        final Object? response;
        if (isRequest) {
          if (_middlewares.isEmpty) {
            response = await runZoned(
              () => handler(rawVal, context),
              zoneValues: {#cancellationToken: token},
            );
          } else {
            final request = LspIncomingRequest(
              method: method.value,
              params: rawVal,
              requestId: requestId,
            );
            response = await runZoned(
              () => composeMiddlewares(
                _middlewares,
                (req) => handler(req.params, context),
              )(request),
              zoneValues: {#cancellationToken: token},
            );
          }
        } else {
          final handlers = _notificationHandlers[method.value] ?? [];
          if (_middlewares.isEmpty) {
            await runZoned(
              () async {
                for (final h in handlers) {
                  await h(rawVal, context);
                }
              },
              zoneValues: {#cancellationToken: token},
            );
          } else {
            final request = LspIncomingRequest(
              method: method.value,
              params: rawVal,
              requestId: requestId,
            );
            await runZoned(
              () => composeMiddlewares(
                _middlewares,
                (req) async {
                  for (final h in handlers) {
                    await h(req.params, context);
                  }
                  return null;
                },
              )(request),
              zoneValues: {#cancellationToken: token},
            );
          }
          response = null;
        }

        // 3. Post-handler state changes / actions
        if (isRequest) {
          if (method == RequestMethod.initialize) {
            _state = LspState.initialized;
          }
        } else {
          if (method == NotificationMethod.exit) {
            await close();
          }
        }

        return response;
      } on LspException catch (e) {
        if (isRequest && method == RequestMethod.initialize) {
          _state = LspState.uninitialized;
        }
        throw e.toRpcException();
      } catch (e, stackTrace) {
        if (isRequest && method == RequestMethod.initialize) {
          _state = LspState.uninitialized;
        }

        onError?.call(e, stackTrace);

        throw rpc.RpcException(
          LspErrorCodes.internalError,
          'Internal error processing '
          '${isRequest ? "request" : "notification"}: $e',
        );
      } finally {
        if (requestId != null) {
          _activeCancellations.remove(requestId);
        }
        token.dispose();
      }
    });

    if (!isRequest) {
      return () {
        _notificationHandlers[method.value]?.remove(multicastItem);
      };
    }
    return null;
  }

  /// Registers a handler for an LSP *request* (client → server).
  ///
  /// [handler] receives the raw JSON value of the params field ([Object?]) and
  /// must return a JSON-encodable value or null.  Throw [LspException] to send
  /// a structured error response to the client.
  void registerRequestHandler(
    RequestMethod method,
    Future<Object?> Function(Object? params, LspRequest context) handler,
  ) => _registerHandler(method, isRequest: true, handler: handler);

  /// Registers a handler for an LSP *notification* (client → server).
  ///
  /// [handler] receives the raw JSON value of the params field ([Object?]).
  /// Return value is ignored by the protocol.  Throw [LspException] to
  /// propagate as an RpcException (visible in logs on the sender side).
  ///
  /// Returns a function to unregister this handler.
  void Function() registerNotificationHandler(
    NotificationMethod method,
    Future<void> Function(Object? params, LspRequest context) handler,
  ) => _registerHandler(
    method,
    isRequest: false,
    handler: (params, context) async {
      await handler(params, context);
      return null;
    },
  )!;

  // Outgoing

  /// Sends a notification to the client (no response expected).
  void sendNotification(NotificationMethod method, [Object? params]) =>
      _peer.sendNotification(method.value, params);

  /// Sends a request to the client and returns the decoded response value.
  Future<Object?> sendRequest(RequestMethod method, [Object? params]) =>
      _peer.sendRequest(method.value, params);

  // Lifecycle

  /// Starts processing incoming messages.  Returns when the channel closes.
  Future<void> listen() => _peer.listen();

  /// Closes the underlying channel and stops processing.
  Future<void> close() => _peer.close();

  // Fallback

  /// Fallback handler for unknown methods.
  ///
  /// Throws an [LspException] with code [LspErrorCodes.methodNotFound].
  void _handleUnknownMethod(rpc.Parameters params) {
    throw rpc.RpcException(
      LspErrorCodes.methodNotFound,
      'Method not found: ${params.method}',
    );
  }
}
