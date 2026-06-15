import '../connection/lsp_connection.dart';
import 'cancellation_token.dart';

/// Context object provided to every LSP request and notification handler.
///
/// [LspRequest] carries metadata about the incoming message and provides
/// access to cancellation handling, dependency resolution, and the
/// underlying [LspConnection].
///
/// ## Usage
///
/// Every handler receives an [LspRequest] as its second parameter:
///
/// ```dart
/// server.textDocument.onCompletion((params, context) async {
///   // Access the method name
///   print('Handling: ${context.method}');
///
///   // Check for cancellation
///   context.cancellationToken.throwIfCancelled();
///
///   // Resolve dependencies
///   final config = context.resolve<MyConfig>();
///
///   // Access the connection for advanced operations
///   context.connection.sendNotification(
///     NotificationMethod.windowLogMessage,
///     ...,
///   );
///
///   return CompletionList(items: []);
/// });
/// ```
///
/// ## Cancellation
///
/// For long-running handlers, check for cancellation at natural abort points:
///
/// ```dart
/// for (final item in items) {
///   context.cancellationToken.throwIfCancelled();
///   await process(item);
/// }
/// ```
///
/// ## Request vs Notification
///
/// Use [isNotification] to distinguish between requests (which expect a
/// response) and notifications (which don't). Notifications always have
/// a `null` [id].
final class LspRequest {
  LspRequest({
    required this.method,
    required this.cancellationToken,
    required this.connection,
    this.id,
  });

  /// The LSP method name (e.g. `'textDocument/completion'`).
  ///
  /// Matches the `method` field of the JSON-RPC request or notification.
  final String method;

  /// Token for handling client-side request cancellation.
  ///
  /// When the client sends a `$ /cancelRequest` notification, this token
  /// is cancelled. Handlers should check [CancellationToken.isCancelled]
  /// or call [CancellationToken.throwIfCancelled] at natural abort points
  /// to respect cancellation.
  final CancellationToken cancellationToken;

  /// The JSON-RPC 2.0 request ID, or `null` for notifications.
  ///
  /// Request IDs are used to correlate requests with responses and
  /// cancellation notifications.
  final Object? id;

  /// Returns `true` if this is a notification (no request ID).
  ///
  /// Notifications don't expect a response and always have a `null` [id].
  bool get isNotification => id == null;

  /// The underlying connection that received this request.
  ///
  /// Provides access to the connection's service container, middleware
  /// list, and methods for sending outgoing messages.
  final LspConnection connection;

  /// Resolves a dependency registered on the connection.
  ///
  /// Throws [StateError] if no service of type [T] is registered.
  /// Prefer [tryResolve] when the service may not be present.
  T resolve<T extends Object>() => connection.resolve<T>();

  /// Tries to resolve a dependency registered on the connection.
  ///
  /// Returns `null` if no service of type [T] is registered.
  T? tryResolve<T extends Object>() => connection.tryResolve<T>();
}
