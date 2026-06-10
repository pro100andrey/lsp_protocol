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

/// A function type for LSP middleware / request interceptors.
typedef LspMiddleware = Future<Object?> Function(
  LspIncomingRequest request,
  Future<Object?> Function(LspIncomingRequest request) next,
);

/// Composes a list of [LspMiddleware] into a single handler function.
Future<Object?> Function(LspIncomingRequest) composeMiddlewares(
  List<LspMiddleware> middlewares,
  Future<Object?> Function(LspIncomingRequest) target,
) {
  var handler = target;
  for (final middleware in middlewares.reversed) {
    final currentHandler = handler;
    handler = (request) => middleware(request, currentHandler);
  }
  
  return handler;
}
