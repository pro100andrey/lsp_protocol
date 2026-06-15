import 'dart:async';

import '../connection/lsp_exception.dart';

/// A token that signals cancellation to an asynchronous operation.
///
/// Used in LSP to support the `$ /cancelRequest` notification. When a client
/// sends a cancellation request, the associated [CancellationToken] is
/// cancelled, allowing long-running handlers to check [isCancelled] or call
/// [throwIfCancelled] to abort early.
///
/// ## Usage Pattern
///
/// In middleware or handlers, check for cancellation at natural abort points:
///
/// ```dart
/// Future<void> myHandler(params, context) async {
///   for (final item in items) {
///     context.cancellationToken.throwIfCancelled();
///     await process(item);
///   }
/// }
/// ```
///
/// Or listen to [onCancelled] for async cancellation:
///
/// ```dart
/// Future<void> myHandler(params, context) async {
///   final cancelFuture = context.cancellationToken.onCancelled.first;
///   await Future.any([longRunningWork(), cancelFuture]);
/// }
/// ```
///
/// Tokens are created per-request by the handler registration logic
/// and stored in the current [Zone] via [CancellationToken.current]
/// for easy access.
abstract final class CancellationToken {
  /// Creates a new cancellation token for a request.
  factory CancellationToken() = DefaultCancellationToken;

  /// No-op token for notifications that don't support cancellation.
  static final CancellationToken noop = _NoopCancellationToken._();

  /// Whether [cancel] has been called on this token.
  ///
  /// Once `true`, it remains `true` for the lifetime of the token.
  bool get isCancelled;

  /// A broadcast stream that emits a value when [cancel] is called.
  ///
  /// Multiple listeners can attach to this stream. The stream is closed
  /// automatically when [cancel] is invoked.
  Stream<void> get onCancelled;

  /// Cancels this token, notifying all [onCancelled] listeners.
  ///
  /// This method is idempotent — calling it multiple times has no additional
  /// effect after the first call.
  void cancel();

  /// Disposes the token, closing the [onCancelled] stream controller.
  ///
  /// Must be called when the token is no longer needed to prevent resource
  /// leaks. In the LSP connection, this is done automatically in the `finally`
  /// block of the handler registration.
  void dispose();

  /// Throws an [LspException.requestCancelled] if [cancel] has been called.
  ///
  /// Use this at natural abort points in long-running operations to respect
  /// cancellation requests from the client. When thrown, the exception
  /// propagates through the middleware chain and is handled by the LSP
  /// error handler.
  ///
  /// ```dart
  /// token.throwIfCancelled(); // throws if cancelled
  /// await processItem(item);
  /// ```
  void throwIfCancelled();

  /// Returns the cancellation token associated with the current [Zone].
  ///
  /// Each incoming request gets its own [CancellationToken] stored in the
  /// zone set up during request handling. This allows handlers and middleware
  /// to access the token without threading it through every method signature.
  ///
  /// Returns `null` if the current zone does not have an associated token,
  /// which means this code is not running inside a request handler.
  static CancellationToken? get current =>
      Zone.current[#cancellationToken] as CancellationToken?;
}

/// Default implementation of [CancellationToken].
final class DefaultCancellationToken implements CancellationToken {
  var _isCancelled = false;

  final _onCancelled = StreamController<void>.broadcast();

  @override
  bool get isCancelled => _isCancelled;

  @override
  Stream<void> get onCancelled => _onCancelled.stream;

  @override
  void cancel() {
    if (_isCancelled) {
      return;
    }
    _isCancelled = true;
    _onCancelled.add(null);
    _onCancelled.close().ignore();
  }

  @override
  void dispose() {
    unawaited(_onCancelled.close());
  }

  @override
  void throwIfCancelled() {
    if (_isCancelled) {
      throw LspException.requestCancelled('Request cancelled by the client');
    }
  }
}

/// No-op implementation of [CancellationToken] for notifications.
final class _NoopCancellationToken implements CancellationToken {
  _NoopCancellationToken._();

  @override
  bool get isCancelled => false;

  @override
  Stream<void> get onCancelled => const Stream<void>.empty();

  @override
  void cancel() {}

  @override
  void dispose() {}

  @override
  void throwIfCancelled() {}
}
