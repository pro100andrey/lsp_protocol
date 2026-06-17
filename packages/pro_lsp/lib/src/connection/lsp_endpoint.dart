import 'dart:async';

import '../server/lsp_state.dart';
import '../server/middleware.dart';
import '../transport/lsp_byte_stream_channel.dart';
import 'lsp_connection.dart';

/// Shared base for `LspServer` and `LspClient`.
///
/// Both endpoints wrap an [LspConnection] over an LSP-framed byte transport and
/// expose the same lifecycle surface (middleware, state, error handling, and
/// disposal). This base holds that common wiring so the two concrete classes
/// only carry their endpoint-specific handler namespaces and entry points.
///
/// This type is intentionally not exported; its members are re-exposed on the
/// concrete `LspServer`/`LspClient` subclasses.
abstract base class LspEndpoint {
  LspEndpoint(LspByteStreamChannelResult result)
    : connection = LspConnection(result.channel),
      _cleanup = result.cleanup;

  /// The underlying low-level [LspConnection].
  ///
  /// Provides direct access to the connection's service container, middleware
  /// list, and methods for sending outgoing messages. Prefer the typed handler
  /// namespaces on the concrete endpoint for everyday use.
  final LspConnection connection;

  final FutureOr<void> Function()? _cleanup;

  /// Registered middleware list for request/notification interception.
  List<LspMiddleware> get middlewares => connection.middlewares;

  /// Adds a middleware to this endpoint.
  ///
  /// Middlewares are executed in the order they are added. Each can inspect,
  /// modify, or short-circuit the request/response cycle.
  void addMiddleware(LspMiddleware middleware) =>
      connection.addMiddleware(middleware);

  /// Gets the current lifecycle state of this endpoint.
  LspState get state => connection.state;

  /// Gets the error callback triggered on unhandled exceptions in handlers.
  void Function(Object error, StackTrace stackTrace)? get onError =>
      connection.onError;

  /// Sets the error callback triggered on unhandled exceptions in handlers.
  set onError(void Function(Object error, StackTrace stackTrace)? value) =>
      connection.onError = value;

  /// Hook for subclasses to run their own teardown before the transport is
  /// closed. Runs first inside [close]; the default is a no-op.
  Future<void> beforeClose() async {}

  /// Closes the connection and the underlying byte transport.
  ///
  /// Runs [beforeClose], then closes the [connection], then invokes the
  /// transport cleanup function (cancels the input subscription).
  Future<void> close() async {
    await beforeClose();
    await connection.close();
    await _cleanup?.call();
  }
}
