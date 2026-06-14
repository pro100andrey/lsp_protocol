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
                    _requestIds[params] = id;
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
              // Single request: Map request ID using Expando so handlers can
              // map it to cancellation without mutating parameter maps
              // (GC-safe).
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

    _peer = Peer.withoutJson(
      StreamChannel<Object?>(decodedStream, channel.sink),
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
  final _requestIds = Expando<Object>();

  /// The underlying JSON-RPC 2.0 peer used for sending and receiving messages.
  late final Peer _peer;

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
  /// For requests: registers a single handler via the underlying [_peer].
  /// For notifications: supports multicast by maintaining a list of handlers
  /// per method name.
  ///
  /// Returns an unregistration function for notifications (null for requests).
  /// Helper method to execute a handler inside a Zone with a
  /// [CancellationToken].
  Future<Object?> _runHandler(
    CancellationToken token,
    Future<Object?> Function() body,
  ) => runZoned(body, zoneValues: {#cancellationToken: token});

  void Function()? _registerHandler(
    LSPMethod method, {
    required bool isRequest,
    required Future<Object?> Function(Object? params, LspRequest context)
    handler,
  }) {
    _registeredMethods.add(method);

    LspNotificationHandler? multicastItem;

    if (!isRequest) {
      // For notifications, JSON-RPC only permits a single registered
      // method handler. We register the first listener on the peer,
      // and subsequent listeners are added to _notificationHandlers.
      final methodStr = method.value;
      final list = _notificationHandlers.putIfAbsent(methodStr, () => []);
      multicastItem = (params, context) async {
        await handler(params, context);
      };
      list.add(multicastItem);
      if (list.length > 1) {
        return () {
          list.remove(multicastItem);
          if (list.isEmpty) {
            _notificationHandlers.remove(methodStr);
            _registeredMethods.remove(method);
          }
        };
      }
    }

    _peer.registerMethod(method.value, (Parameters params) async {
      final rawVal = params.value;
      Object? requestId;

      if (isRequest) {
        if (rawVal case Map() || List()) {
          requestId = _requestIds[rawVal as Object];
        }
      }

      final token = CancellationToken();
      if (isRequest && requestId != null) {
        _activeCancellations[requestId] = token;
      }

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
        final handlers = _notificationHandlers[method.value] ?? [];

        // Bind the cancellation token to the Zone so nested async operations
        // can obtain it via CancellationToken.current.
        response = await _runHandler(token, () async {
          if (isRequest) {
            if (_middlewares.isEmpty) {
              return handler(rawVal, context);
            }

            final request = LspIncomingRequest(
              method: method.value,
              params: rawVal,
              requestId: requestId,
            );

            return composeMiddlewares(
              _middlewares,
              (req) => handler(req.params, context),
            )(request);
          } else {
            // Multicast execution: execute all registered notification
            // handlers. Errors in individual handlers are isolated and
            // sent to onError.
            if (_middlewares.isEmpty) {
              for (final h in handlers) {
                try {
                  await h(rawVal, context);
                } on Object catch (e, stackTrace) {
                  onError?.call(e, stackTrace);
                }
              }
            } else {
              final request = LspIncomingRequest(
                method: method.value,
                params: rawVal,
                requestId: requestId,
              );

              await composeMiddlewares(
                _middlewares,
                (req) async {
                  for (final h in handlers) {
                    try {
                      await h(req.params, context);
                    } on Object catch (e, stackTrace) {
                      onError?.call(e, stackTrace);
                    }
                  }

                  return null;
                },
              )(request);
            }

            return null;
          }
        });

        // 3. Post-handler state changes / actions
        if (isRequest) {
          if (method == RequestMethod.initialize) {
            _state = .initialized;
          }
        } else {
          if (method == NotificationMethod.exit) {
            await close();
          }
        }

        return response;
      } on LspException catch (e) {
        // State recovery: if initialize or shutdown request fails, revert
        // state.
        if (isRequest) {
          if (method == RequestMethod.initialize) {
            _state = .uninitialized;
          } else if (method == RequestMethod.shutdown) {
            _state = .initialized;
          }
        }
        throw e.toRpcException();
      } catch (e, stackTrace) {
        // State recovery: if initialize or shutdown request fails, revert
        // state.
        if (isRequest) {
          if (method == RequestMethod.initialize) {
            _state = .uninitialized;
          } else if (method == RequestMethod.shutdown) {
            _state = .initialized;
          }
        }

        onError?.call(e, stackTrace);

        throw RpcException(
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
        final list = _notificationHandlers[method.value];
        if (list != null) {
          list.remove(multicastItem);

          if (list.isEmpty) {
            _notificationHandlers.remove(method.value);
            _registeredMethods.remove(method);
          }
        }
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
  Future<dynamic> sendRequest(RequestMethod method, [Object? params]) =>
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
  void _handleUnknownMethod(Parameters params) {
    throw LspException.methodNotFound(
      'Method not found: ${params.method}',
    ).toRpcException();
  }
}
