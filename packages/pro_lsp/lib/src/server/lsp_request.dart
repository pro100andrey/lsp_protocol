import '../connection/lsp_connection.dart';
import 'cancellation_token.dart';

/// Context for an incoming LSP request.
///
/// Provides access to metadata about the request and a [cancellationToken]
/// to handle client-side cancellation.
final class LspRequest {
  LspRequest({
    required this.method,
    required this.cancellationToken,
    required this.connection,
    this.id,
  });

  /// The name of the LSP method.
  final String method;

  /// A token that signals if the request has been cancelled by the client.
  final CancellationToken cancellationToken;

  /// The JSON-RPC 2.0 request ID. This is null for notifications.
  final Object? id;

  /// Whether this request is a notification (i.e. has no request ID).
  bool get isNotification => id == null;

  /// The underlying connection that received this request.
  final LspConnection connection;

  /// Resolves a dependency registered on the connection.
  T resolve<T extends Object>() => connection.resolve<T>();

  /// Tries to resolve a dependency registered on the connection.
  T? tryResolve<T extends Object>() => connection.tryResolve<T>();
}
