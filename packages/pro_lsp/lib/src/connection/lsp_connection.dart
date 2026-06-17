import 'dart:async';
import 'dart:collection';

import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:stream_channel/stream_channel.dart';

import '../../pro_lsp.dart' show LspServer;
import '../generated/models/methods.dart';
import '../server/cancellation_token.dart';
import '../server/lsp_request.dart';
import '../server/lsp_state.dart';
import '../server/middleware.dart';
import 'lsp_exception.dart';

/// Signature for multicast notification handlers.
typedef LspNotificationHandler =
    Future<void> Function(Object? params, LspRequest context);

/// Low-level LSP connection backed by a [Peer].
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
            if (decoded is List) {
              // Batch requests are received as a JSON list. We iterate and map
              // each individual request ID and handle batch cancellation
              // requests.
              for (final item in decoded) {
                if (item case {
                  'id': final Object id,
                  'params': final Object params,
                }) {
                  if (params case Map() || List()) {
                    _requestIds[_IdentityKey(params)] = id;
                  }
                } else if (item case {
                  'method': final String method,
                  'params': {'id': final Object cancelId},
                } when method == NotificationMethod.cancelRequest.value) {
                  _cancelRequest(cancelId);
                }
              }
            } else if (decoded case {
              'id': final Object id,
              'method': String _,
            }) {
              // Single request: Map request ID using identity key so handlers
              // can map it to cancellation reliably (Expando uses weak refs
              // which can be GC'd before lookup).
              final params = decoded['params'];
              if (params case Map() || List()) {
                _requestIds[_IdentityKey(params)] = id;
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

    _peer = Peer.withoutJson(
      StreamChannel<Object?>(decodedStream, channel.sink),
      idGenerator: _generateOutgoingId,
    );

    _peer.registerFallback(_handleUnknownMethod);

    // Register $/cancelRequest handler so json_rpc_2 doesn't treat it as
    // unknown. The actual cancellation is intercepted on the raw stream
    // before it reaches the peer.
    registerNotificationHandler(
      NotificationMethod.cancelRequest,
      (params, context) async {},
    );
  }

  /// Maps request parameter objects to their JSON-RPC request IDs.
  ///
  /// Used to correlate `$/cancelRequest` notifications with the original
  /// request so handlers can check cancellation status.
  final _requestIds = <_IdentityKey, Object>{};

  /// The underlying JSON-RPC 2.0 peer used for sending and receiving messages.
  late final Peer _peer;

  /// Monotonic counter for outgoing JSON-RPC request IDs.
  var _outgoingIdCounter = 0;

  /// ID assigned to the most recently generated outgoing request.
  ///
  /// [Peer] calls [_generateOutgoingId] synchronously inside `sendRequest`
  /// before it returns, so [sendRequest] can read this immediately afterwards
  /// to learn the request's wire ID and cancel it via `$/cancelRequest`.
  late Object _lastOutgoingId;

  /// ID generator passed to [Peer.withoutJson]; records [_lastOutgoingId].
  Object _generateOutgoingId() => _lastOutgoingId = _outgoingIdCounter++;

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
  final _notificationHandlers = <String, List<LspNotificationHandler>>{};

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
    // Fast path: .initialized allows all requests (except initialize) and
    // all notifications. This is the most common state.
    if (_state == .initialized) {
      return;
    }

    // Custom (non-spec) methods are not part of the typed state machine, so
    // `method is! RequestMethod/NotificationMethod` for them. Outside the
    // `.initialized` fast path above they are treated as not-yet-allowed, which
    // surfaces as serverNotInitialized (requests) or invalidRequest
    // (notifications) — custom traffic is only valid once initialized.
    if (isNotification) {
      if (method is! NotificationMethod ||
          !_state.isNotificationAllowed(method)) {
        throw LspException.invalidRequest(
          'Notification $method is not allowed in state $_state',
        );
      }
    } else {
      if (method is! RequestMethod || !_state.isRequestAllowed(method)) {
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

  /// Optional error callback to intercept unhandled exceptions.
  ///
  /// If not set, exceptions from request handlers will still be sent to the
  /// client as JSON-RPC errors, but exceptions from notification handlers
  /// might go unnoticed (since notifications do not return a response).
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
  /// For requests: registers a single handler dispatched via
  /// [_dispatchRequest]. For notifications: supports multicast by maintaining a
  /// list of handlers per method name, dispatched via [_dispatchNotification].
  ///
  /// Returns an unregistration function for notifications (`null` for
  /// requests).
  void Function()? _registerHandler(
    LSPMethod method, {
    required bool isRequest,
    required Future<Object?> Function(Object? params, LspRequest context)
    handler,
  }) {
    final methodStr = method.value;
    _registeredMethods.add(method);

    if (isRequest) {
      _peer.registerMethod(
        methodStr,
        (Parameters params) =>
            _dispatchRequest(method, methodStr, params.value, handler),
      );
      return null;
    }

    // For notifications, JSON-RPC only permits a single registered method
    // handler. We register the first listener on the peer; subsequent listeners
    // are appended to _notificationHandlers and picked up on dispatch.
    final list = _notificationHandlers.putIfAbsent(methodStr, () => []);
    Future<void> multicastItem(Object? params, LspRequest context) async {
      await handler(params, context);
    }

    list.add(multicastItem);

    if (list.length == 1) {
      _peer.registerMethod(
        methodStr,
        (Parameters params) =>
            _dispatchNotification(method, methodStr, params.value),
      );
    }

    return () {
      final current = _notificationHandlers[methodStr];
      if (current != null) {
        current.remove(multicastItem);
        if (current.isEmpty) {
          _notificationHandlers.remove(methodStr);
          _registeredMethods.remove(method);
        }
      }
    };
  }

  /// Dispatches an incoming *request* to [handler] with full cancellation,
  /// state-machine, and middleware support.
  Future<Object?> _dispatchRequest(
    LSPMethod method,
    String methodStr,
    Object? rawVal,
    Future<Object?> Function(Object? params, LspRequest context) handler,
  ) async {
    Object? requestId;
    if (rawVal case Map() || List()) {
      requestId = _requestIds.remove(_IdentityKey(rawVal));
    }

    final token = CancellationToken();
    if (requestId != null) {
      _activeCancellations[requestId] = token;
    }

    final context = LspRequest(
      method: methodStr,
      cancellationToken: token,
      id: requestId,
      connection: this,
    );

    try {
      _verifyState(method, isNotification: false);

      _state = switch (method) {
        RequestMethod.initialize => .initializing,
        RequestMethod.shutdown => .shuttingDown,
        _ => _state,
      };

      // Bind the cancellation token to the Zone so nested async operations can
      // obtain it via CancellationToken.current.
      final response = await runZoned(
        () {
          if (_middlewares.isEmpty) {
            return handler(rawVal, context);
          }

          final request = LspIncomingRequest(
            method: methodStr,
            params: rawVal,
            requestId: requestId,
          );

          return composeMiddlewares(
            _middlewares,
            (req) => handler(req.params, context),
          )(request);
        },
        zoneValues: {#cancellationToken: token},
      );

      if (method == RequestMethod.initialize) {
        _state = .initialized;
      }

      return response;
    } on LspException catch (e) {
      _revertStateOnFailure(method, isRequest: true);
      throw e.toRpcException();
    } catch (e, stackTrace) {
      _revertStateOnFailure(method, isRequest: true);
      onError?.call(e, stackTrace);
      throw RpcException(
        LspErrorCodes.internalError,
        'Internal error processing request: $e',
      );
    } finally {
      // requestId was already removed from _requestIds above; only the active
      // cancellation entry and the token still need releasing.
      if (requestId != null) {
        _activeCancellations.remove(requestId);
      }
      token.dispose();
    }
  }

  /// Dispatches an incoming *notification* to every registered multicast
  /// handler. Notifications are not cancelable, so there is no per-request
  /// token or Zone — keeping this path allocation-light for high-frequency
  /// traffic (`didChange`, `didOpen`, …).
  Future<Object?> _dispatchNotification(
    LSPMethod method,
    String methodStr,
    Object? rawVal,
  ) async {
    final context = LspRequest(
      method: methodStr,
      cancellationToken: CancellationToken.noop,
      connection: this,
    );

    try {
      _verifyState(method, isNotification: true);

      if (method == NotificationMethod.exit) {
        _state = .exited;
      }

      final handlers = _notificationHandlers[methodStr] ?? const [];
      if (_middlewares.isEmpty) {
        await _runNotificationHandlers(handlers, rawVal, context);
      } else {
        final request = LspIncomingRequest(
          method: methodStr,
          params: rawVal,
        );
        await composeMiddlewares(_middlewares, (req) async {
          await _runNotificationHandlers(handlers, req.params, context);
          return null;
        })(request);
      }

      if (method == NotificationMethod.exit) {
        await close();
      }

      return null;
    } on LspException catch (e) {
      throw e.toRpcException();
    } catch (e, stackTrace) {
      onError?.call(e, stackTrace);
      throw RpcException(
        LspErrorCodes.internalError,
        'Internal error processing notification: $e',
      );
    }
  }

  /// Runs each multicast notification handler in sequence, isolating
  /// per-handler errors to [onError] so one failing listener doesn't stop the
  /// others.
  Future<void> _runNotificationHandlers(
    List<LspNotificationHandler> handlers,
    Object? params,
    LspRequest context,
  ) async {
    for (final h in handlers) {
      try {
        await h(params, context);
      } on Object catch (e, stackTrace) {
        onError?.call(e, stackTrace);
      }
    }
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
  /// Return value is ignored by the protocol. Throwing an exception
  /// inside a notification handler will not send an error response to
  /// the client (as notifications have no ID), but will trigger the
  /// [onError] callback.
  ///
  /// Returns a function to unregister this handler.
  void Function() registerNotificationHandler(
    NotificationMethod method,
    Future<void> Function(Object? params, LspRequest context) handler,
  ) => _registerHandler(
    method,
    isRequest: false,
    handler: _asRequestHandler(handler),
  )!;

  /// Registers a handler for a *custom* (non-spec) request method.
  ///
  /// Escape hatch for proprietary protocol extensions (e.g. `$/myExtension`)
  /// that are not part of the generated [RequestMethod] enum. Provide any
  /// [LSPMethod] implementation whose [LSPMethod.value] is the wire method
  /// name. Custom requests are only accepted once the connection is
  /// [LspState.initialized]; before that they are rejected as
  /// `serverNotInitialized`.
  ///
  /// For spec methods, prefer the typed namespace handlers on `LspServer`.
  void registerCustomRequestHandler(
    LSPMethod method,
    Future<Object?> Function(Object? params, LspRequest context) handler,
  ) => _registerHandler(method, isRequest: true, handler: handler);

  /// Registers a handler for a *custom* (non-spec) notification method.
  ///
  /// Escape hatch for proprietary protocol extensions not present in the
  /// generated [NotificationMethod] enum. Like spec notifications, this
  /// supports multicast — returns a function that unregisters this handler.
  /// Custom notifications are only accepted once [LspState.initialized].
  void Function() registerCustomNotificationHandler(
    LSPMethod method,
    Future<void> Function(Object? params, LspRequest context) handler,
  ) => _registerHandler(
    method,
    isRequest: false,
    handler: _asRequestHandler(handler),
  )!;

  /// Adapts a `void`-returning notification [handler] to the
  /// `Object?`-returning shape [_registerHandler] expects (notifications have
  /// no response value).
  static Future<Object?> Function(Object? params, LspRequest context)
  _asRequestHandler(
    Future<void> Function(Object? params, LspRequest context) handler,
  ) => (params, context) async {
    await handler(params, context);
    return null;
  };

  // Outgoing

  /// Sends a notification to the client (no response expected).
  void sendNotification(NotificationMethod method, [Object? params]) =>
      _peer.sendNotification(method.value, params);

  /// Sends a *custom* (non-spec) notification by its wire [method] name.
  ///
  /// Escape hatch for proprietary extensions; counterpart to
  /// [registerCustomNotificationHandler].
  void sendCustomNotification(String method, [Object? params]) =>
      _peer.sendNotification(method, params);

  /// Sends a request to the other side and returns the decoded response value.
  ///
  /// Pass [token] to make the request cancelable: when the token fires, a
  /// `$/cancelRequest` notification is sent with the request's wire ID, and the
  /// returned future completes with [LspException.requestCancelled] once the
  /// peer acknowledges the cancellation.
  ///
  /// Pass [timeout] to abort automatically after a duration; this also sends
  /// `$/cancelRequest` and throws [LspException.requestCancelled].
  ///
  /// Error responses from the peer surface as [LspException] (carrying the
  /// JSON-RPC `code`, `message`, and `data`), never as the underlying
  /// `RpcException` from the transport.
  Future<Object?> sendRequest(
    RequestMethod method,
    Object? params, {
    CancellationToken? token,
    Duration? timeout,
  }) => _sendRequest(method.value, params, token: token, timeout: timeout);

  /// Sends a *custom* (non-spec) request by its wire [method] name.
  ///
  /// Escape hatch for proprietary extensions; counterpart to
  /// [registerCustomRequestHandler]. Cancellation and [timeout] behave exactly
  /// as in [sendRequest].
  Future<Object?> sendCustomRequest(
    String method,
    Object? params, {
    CancellationToken? token,
    Duration? timeout,
  }) => _sendRequest(method, params, token: token, timeout: timeout);

  Future<Object?> _sendRequest(
    String method,
    Object? params, {
    CancellationToken? token,
    Duration? timeout,
  }) async {
    final responseFuture = _peer.sendRequest(method, params);
    // _generateOutgoingId ran synchronously inside sendRequest above, so this
    // is exactly this request's wire ID.
    final id = _lastOutgoingId;

    StreamSubscription<void>? cancelSub;
    if (token != null) {
      if (token.isCancelled) {
        _sendCancel(id);
      } else {
        cancelSub = token.onCancelled.listen((_) => _sendCancel(id));
      }
    }

    try {
      if (timeout == null) {
        return await responseFuture;
      }
      return await responseFuture.timeout(
        timeout,
        onTimeout: () {
          _sendCancel(id);
          throw LspException.requestCancelled(
            'Request $method timed out after $timeout',
          );
        },
      );
    } on RpcException catch (e) {
      throw LspException(e.code, e.message, e.data);
    } finally {
      await cancelSub?.cancel();
    }
  }

  /// Sends a `$/cancelRequest` notification for the outgoing request [id].
  ///
  /// No-op once the connection is closed.
  void _sendCancel(Object id) {
    if (_closed) {
      return;
    }
    _peer.sendNotification(NotificationMethod.cancelRequest.value, {
      'id': id,
    });
  }

  // Lifecycle

  /// Whether [close] has been called.
  var _closed = false;

  /// Starts processing incoming messages.  Returns when the channel closes.
  Future<void> listen() => _peer.listen();

  /// Closes the underlying channel and stops processing.
  Future<void> close() {
    _closed = true;
    _requestIds.clear();
    _activeCancellations.clear();
    _notificationHandlers.clear();
    _registeredMethods.clear();
    _middlewares.clear();
    _services.clear();
    return _peer.close();
  }

  void _revertStateOnFailure(LSPMethod method, {required bool isRequest}) {
    if (isRequest) {
      if (method == RequestMethod.initialize) {
        _state = .uninitialized;
      } else if (method == RequestMethod.shutdown) {
        _state = .initialized;
      }
    }
  }

  // Fallback

  /// Fallback handler for unknown methods.
  ///
  /// Throws an [LspException] with code [LspErrorCodes.methodNotFound].
  void _handleUnknownMethod(Parameters params) {
    final rawVal = params.value;
    if (rawVal case Map() || List()) {
      _requestIds.remove(_IdentityKey(rawVal));
    }

    throw LspException.methodNotFound(
      'Method not found: ${params.method}',
    ).toRpcException();
  }
}

/// Identity-based key wrapper for reliable request ID lookups.
///
/// Unlike [Expando] which uses weak references and can return null after GC,
/// this uses strong references with identity-based equality.
final class _IdentityKey {
  const _IdentityKey(this._obj);

  final Object? _obj;

  @override
  int get hashCode => _obj == null ? 0 : identityHashCode(_obj);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _IdentityKey && identical(_obj, other._obj);
}
