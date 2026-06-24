import 'dart:async';

import 'lsp_request.dart';

/// Function signature for invoking the next step in the middleware chain.
///
/// When middleware calls the `next` function, it passes control to the
/// next middleware in the chain (or the target handler if this is the last).
///
/// Example:
/// ```dart
/// class TimingMiddleware implements LspMiddleware {
///   @override
///   Future<Object?> call(LspRequest request, LspNext next) async {
///     final stopwatch = Stopwatch()..start();
///     final result = await next(request);
///     stopwatch.stop();
///     print('${request.method} took ${stopwatch.elapsedMilliseconds}ms');
///     return result;
///   }
/// }
/// ```
typedef LspNext = Future<Object?> Function(LspRequest request);

/// Interface for class-based LSP middleware / request interceptors.
///
/// Middleware allows you to intercept and process every incoming request
/// or notification before it reaches its target handler. Common use cases
/// include:
///
/// - **Logging** — Record method names, parameters, and response times
/// - **Authentication** — Validate tokens or permissions
/// - **Rate limiting** — Throttle requests from specific clients
/// - **Error handling** — Catch and transform errors
/// - **Caching** — Return cached responses for repeated requests
///
/// ## Middleware Chain
///
/// Middleware are executed in the order they are added to the server.
/// Each middleware calls `next` to pass control to the next middleware
/// in the chain. The result of `next` is the response from the target
/// handler (or the next middleware in the chain).
///
/// ```
/// Request → Middleware1 → Middleware2 → Target Handler
///           ↑ next()        ↑ next()
/// Response ← Middleware1 ← Middleware2 ← Target Handler
/// ```
///
/// ## Creating Middleware
///
/// **Class-based middleware:**
/// ```dart
/// class MyMiddleware implements LspMiddleware {
///   @override
///   Future<Object?> call(LspRequest request, LspNext next) async {
///     // Pre-processing
///     final result = await next(request);
///     // Post-processing
///     return result;
///   }
/// }
/// ```
///
/// **Function-based middleware:**
/// ```dart
/// server.addMiddleware(LspMiddleware.fromFunction(
///   (request, next) async {
///     print('Handling: ${request.method}');
///     return next(request);
///   },
/// ));
/// ```
///
/// ## Short-circuiting
///
/// To skip the target handler, return a response without calling `next`:
/// ```dart
/// class CacheMiddleware implements LspMiddleware {
///   final Map<String, Object?> _cache = {};
///
///   @override
///   Future<Object?> call(LspRequest request, LspNext next) async {
///     final cached = _cache[request.method];
///     if (cached != null) return cached;
///
///     final result = await next(request);
///     _cache[request.method] = result;
///     return result;
///   }
/// }
/// ```
abstract class LspMiddleware {
  /// Invokes the middleware with the incoming [request] and the [next] handler
  /// in the chain.
  ///
  /// To pass control to the next middleware or target handler, call [next]
  /// with the [request]. To short-circuit the chain, return a response
  /// without calling [next].
  ///
  /// The return value is the response that will be sent back to the client.
  Future<Object?> call(LspRequest request, LspNext next);

  /// Wraps a function signature into an [LspMiddleware] instance for backward
  /// compatibility.
  ///
  /// Useful for quick middleware without creating a full class:
  /// ```dart
  /// server.addMiddleware(LspMiddleware.fromFunction(
  ///   (request, next) async {
  ///     print('Handling: ${request.method}');
  ///     return next(request);
  ///   },
  /// ));
  /// ```
  static LspMiddleware fromFunction(
    Future<Object?> Function(LspRequest request, LspNext next) fn,
  ) => _FunctionalMiddleware(fn);
}

final class _FunctionalMiddleware implements LspMiddleware {
  _FunctionalMiddleware(this._fn);

  final Future<Object?> Function(LspRequest request, LspNext next) _fn;

  @override
  Future<Object?> call(LspRequest request, LspNext next) =>
      _fn(request, next);
}

/// Composes a list of [LspMiddleware] into a single handler function.
///
/// Middleware are composed in reverse order, so the first middleware added
/// is the first to receive the request. The [target] function is called
/// last (after all middleware have had a chance to process the request).
///
/// The returned function takes an [LspRequest] and returns a
/// [Future] containing the response.
///
/// Example composition:
/// ```
/// Middleware1 → Middleware2 → Middleware3 → Target
///     ↑ next        ↑ next       ↑ next
/// Middleware1 ← Middleware2 ← Middleware3 ← Target
/// ```
Future<Object?> Function(LspRequest) composeMiddlewares(
  List<LspMiddleware> middlewares,
  Future<Object?> Function(LspRequest) target,
) {
  var handler = target;
  for (var i = middlewares.length - 1; i >= 0; i--) {
    final middleware = middlewares[i];
    final currentHandler = handler;
    handler = (request) => middleware(request, currentHandler);
  }

  return handler;
}
