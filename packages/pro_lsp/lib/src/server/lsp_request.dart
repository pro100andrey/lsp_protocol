import 'cancellation_token.dart';

/// Context for an incoming LSP request.
///
/// Provides access to metadata about the request and a [cancellationToken]
/// to handle client-side cancellation.
final class LspRequest {
  const LspRequest({
    required this.method,
    required this.cancellationToken,
    this.id,
  });

  /// The name of the LSP method.
  final String method;

  /// A token that signals if the request has been cancelled by the client.
  final CancellationToken cancellationToken;

  /// The JSON-RPC 2.0 request ID, if applicable.
  final Object? id;
}
