import 'dart:async';

import '../connection/lsp_exception.dart';

/// A token that can signal cancellation to an asynchronous operation.
final class CancellationToken {
  CancellationToken();

  bool _isCancelled = false;
  final _onCancelled = StreamController<void>.broadcast();

  /// Whether the operation has been cancelled.
  bool get isCancelled => _isCancelled;

  /// A stream that fires when this token is cancelled.
  Stream<void> get onCancelled => _onCancelled.stream;

  /// Cancels the operation.
  void cancel() {
    if (_isCancelled) return;
    _isCancelled = true;
    _onCancelled.add(null);
    _onCancelled.close();
  }

  /// Throws an [LspException.requestCancelled] if the token has been cancelled.
  void throwIfCancelled() {
    if (_isCancelled) {
      throw LspException.requestCancelled('Request cancelled by the client');
    }
  }

  /// Returns the cancellation token associated with the current [Zone].
  ///
  /// Returns `null` if the current context is not running inside a request zone
  /// that supports cancellation.
  static CancellationToken? get current =>
      Zone.current[#cancellationToken] as CancellationToken?;
}
