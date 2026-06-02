import 'package:json_rpc_2/json_rpc_2.dart' show RpcException;

/// LSP error codes as defined in the LSP specification.
///
/// These are a subset of the JSON-RPC 2.0 error codes extended with
/// LSP-specific values.
abstract final class LspErrorCodes {
  // JSON-RPC standard codes
  static const parseError = -32700;
  static const invalidRequest = -32600;
  static const methodNotFound = -32601;
  static const invalidParams = -32602;
  static const internalError = -32603;

  // LSP-specific codes (server error range)
  static const serverNotInitialized = -32002;
  static const unknownErrorCode = -32001;
  static const lspReservedErrorRangeStart = -32099;
  static const lspReservedErrorRangeEnd = -32000;

  // Request cancellation and content modification
  static const requestCancelled = -32800;
  static const contentModified = -32801;
}

/// An LSP-aware exception that carries a numeric [code] and optional [data].
///
/// Throw this inside any handler to send a structured JSON-RPC error response
/// to the client.
///
/// ```dart
/// server.textDocument.onHover((params) async {
///   if (!initialized) throw LspException.serverNotInitialized('Not ready');
///   return computeHover(params);
/// });
/// ```
final class LspException implements Exception {
  const LspException(this.code, this.message, [this.data]);

  final int code;
  final String message;
  final Object? data;

  /// Converts to a [RpcException] suitable for [json_rpc_2].
  RpcException toRpcException() => RpcException(code, message, data: data);

  factory LspException.parseError(String message, [Object? data]) =>
      LspException(LspErrorCodes.parseError, message, data);

  factory LspException.invalidRequest(String message, [Object? data]) =>
      LspException(LspErrorCodes.invalidRequest, message, data);

  factory LspException.methodNotFound(String message, [Object? data]) =>
      LspException(LspErrorCodes.methodNotFound, message, data);

  factory LspException.invalidParams(String message, [Object? data]) =>
      LspException(LspErrorCodes.invalidParams, message, data);

  factory LspException.internalError(String message, [Object? data]) =>
      LspException(LspErrorCodes.internalError, message, data);

  factory LspException.serverNotInitialized(String message, [Object? data]) =>
      LspException(LspErrorCodes.serverNotInitialized, message, data);

  factory LspException.requestCancelled(String message, [Object? data]) =>
      LspException(LspErrorCodes.requestCancelled, message, data);

  factory LspException.contentModified(String message, [Object? data]) =>
      LspException(LspErrorCodes.contentModified, message, data);

  @override
  String toString() => 'LspException($code): $message';
}
