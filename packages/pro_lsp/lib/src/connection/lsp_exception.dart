import 'package:json_rpc_2/json_rpc_2.dart' show RpcException;

/// LSP error codes as defined in the LSP specification.
///
/// These are a subset of the JSON-RPC 2.0 error codes extended with
/// LSP-specific values.
abstract final class LspErrorCodes {
  // JSON-RPC standard codes

  /// Invalid JSON was received (`-32700`).
  static const parseError = -32700;

  /// The JSON sent is not a valid request object (`-32600`).
  static const invalidRequest = -32600;

  /// The requested method does not exist or is unavailable (`-32601`).
  static const methodNotFound = -32601;

  /// Invalid method parameters (`-32602`).
  static const invalidParams = -32602;

  /// Internal JSON-RPC error (`-32603`).
  static const internalError = -32603;

  // LSP-specific codes (server error range)

  /// A request arrived before the `initialize` handshake completed (`-32002`).
  static const serverNotInitialized = -32002;

  /// Reserved LSP error code for an otherwise-unclassified error (`-32001`).
  static const unknownErrorCode = -32001;

  /// Inclusive start of the LSP-reserved server error range (`-32099`).
  static const lspReservedErrorRangeStart = -32099;

  /// Inclusive end of the LSP-reserved server error range (`-32000`).
  static const lspReservedErrorRangeEnd = -32000;

  // Request cancellation and content modification

  /// The request was cancelled by the client via `$/cancelRequest` (`-32800`).
  static const requestCancelled = -32800;

  /// The document content changed and the result is no longer valid
  /// (`-32801`).
  static const contentModified = -32801;
}

/// An LSP-aware exception that carries a numeric [code] and optional [data].
///
/// Throw this inside any handler to send a structured JSON-RPC error response
/// to the client.
///
/// ```dart
/// server.textDocument.onHover((params, context) async {
///   final doc = documents[params.textDocument.uri];
///   if (doc == null) throw LspException.invalidParams('Unknown document');
///   return computeHover(doc, params.position);
/// });
/// ```
final class LspException implements Exception {
  /// Creates an exception with a raw JSON-RPC [code], a [message], and optional
  /// structured [data]. Prefer the named factories for the standard codes.
  const LspException(this.code, this.message, [this.data]);

  /// An [LspErrorCodes.parseError] (`-32700`).
  factory LspException.parseError(String message, [Object? data]) =>
      LspException(LspErrorCodes.parseError, message, data);

  /// An [LspErrorCodes.invalidRequest] (`-32600`).
  factory LspException.invalidRequest(String message, [Object? data]) =>
      LspException(LspErrorCodes.invalidRequest, message, data);

  /// An [LspErrorCodes.methodNotFound] (`-32601`).
  factory LspException.methodNotFound(String message, [Object? data]) =>
      LspException(LspErrorCodes.methodNotFound, message, data);

  /// An [LspErrorCodes.invalidParams] (`-32602`).
  factory LspException.invalidParams(String message, [Object? data]) =>
      LspException(LspErrorCodes.invalidParams, message, data);

  /// An [LspErrorCodes.internalError] (`-32603`).
  factory LspException.internalError(String message, [Object? data]) =>
      LspException(LspErrorCodes.internalError, message, data);

  /// An [LspErrorCodes.serverNotInitialized] (`-32002`).
  factory LspException.serverNotInitialized(String message, [Object? data]) =>
      LspException(LspErrorCodes.serverNotInitialized, message, data);

  /// An [LspErrorCodes.requestCancelled] (`-32800`).
  factory LspException.requestCancelled(String message, [Object? data]) =>
      LspException(LspErrorCodes.requestCancelled, message, data);

  /// An [LspErrorCodes.contentModified] (`-32801`).
  factory LspException.contentModified(String message, [Object? data]) =>
      LspException(LspErrorCodes.contentModified, message, data);

  /// The numeric JSON-RPC error code (see [LspErrorCodes]).
  final int code;

  /// Human-readable error message.
  final String message;

  /// Optional structured payload attached to the error response.
  final Object? data;

  /// Converts to a [RpcException] suitable for json_rpc_2.
  RpcException toRpcException() => RpcException(code, message, data: data);

  @override
  String toString() => 'LspException($code): $message';
}

/// Parses JSON parameters using the provided `fromJson` deserializer.
/// Throws an [LspException.invalidParams] if parsing fails.
T parseParams<T>(dynamic json, T Function(Map<String, dynamic> json) fromJson) {
  try {
    final map = json == null
        ? const <String, dynamic>{}
        : json as Map<String, dynamic>;
    return fromJson(map);
  } catch (e) {
    throw LspException.invalidParams(
      'Invalid parameters for $T: $e',
    );
  }
}
