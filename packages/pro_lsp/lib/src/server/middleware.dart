import 'dart:async';

/// Represents an incoming LSP request or notification.
final class LspIncomingRequest {
  LspIncomingRequest({
    required this.method,
    required this.params,
    this.requestId,
  });

  /// The JSON-RPC method name.
  final String method;

  /// The raw JSON parameters of the request/notification.
  final Object? params;

  /// The JSON-RPC request ID (null for notifications).
  final Object? requestId;
}

/// Function signature for invoking the next step in the middleware chain.
typedef LspNext = Future<Object?> Function(LspIncomingRequest request);

/// Interface for class-based LSP middleware / request interceptors.
abstract class LspMiddleware {
  /// Invokes the middleware with the incoming [request] and the [next] handler
  /// in the chain.
  Future<Object?> call(LspIncomingRequest request, LspNext next);

  /// Wraps a function signature into an [LspMiddleware] instance for backward
  /// compatibility.
  static LspMiddleware fromFunction(
    Future<Object?> Function(LspIncomingRequest request, LspNext next) fn,
  ) => _FunctionalMiddleware(fn);
}

final class _FunctionalMiddleware implements LspMiddleware {
  _FunctionalMiddleware(this._fn);
  final Future<Object?> Function(LspIncomingRequest request, LspNext next) _fn;

  @override
  Future<Object?> call(LspIncomingRequest request, LspNext next) =>
      _fn(request, next);
}

/// Composes a list of [LspMiddleware] into a single handler function.
Future<Object?> Function(LspIncomingRequest) composeMiddlewares(
  List<LspMiddleware> middlewares,
  Future<Object?> Function(LspIncomingRequest) target,
) {
  var handler = target;
  for (var i = middlewares.length - 1; i >= 0; i--) {
    final middleware = middlewares[i];
    final currentHandler = handler;
    handler = (request) => middleware(request, currentHandler);
  }

  return handler;
}
