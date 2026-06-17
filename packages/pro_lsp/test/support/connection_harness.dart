import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';

/// Deterministic in-memory harness around an [LspConnection].
///
/// Wires the connection to broadcast string controllers, decodes the outgoing
/// frames, and lets tests *await specific outgoing messages* instead of relying
/// on arbitrary `Future.delayed` sleeps.
///
/// Because the outgoing stream is broadcast and does not buffer, always create
/// the awaited future (e.g. via [responseFor]) **before** triggering the action
/// that produces the message.
final class ConnectionHarness {
  ConnectionHarness() {
    _incoming = StreamController<String>.broadcast();
    _outgoing = StreamController<String>.broadcast();
    final channel = StreamChannel<String>(_incoming.stream, _outgoing.sink);
    connection = LspConnection(channel.transform(jsonDocument));
    listenFuture = connection.listen();
  }

  late final StreamController<String> _incoming;
  late final StreamController<String> _outgoing;

  /// The connection under test.
  late final LspConnection connection;

  /// Completes when the connection stops listening (after [dispose]).
  late final Future<void> listenFuture;

  /// The id used by [initialize]; tests should use other ids themselves.
  static const initializeId = 0;

  /// Decoded outgoing messages, assuming each frame is a JSON object.
  Stream<Map<String, dynamic>> get outgoing =>
      _outgoing.stream.map((s) => jsonDecode(s) as Map<String, dynamic>);

  /// Decoded outgoing frames without assuming object shape (e.g. batch arrays).
  Stream<Object?> get rawOutgoing => _outgoing.stream.map(jsonDecode);

  /// The next outgoing message satisfying [predicate].
  ///
  /// Create the returned future before the triggering action.
  Future<Map<String, dynamic>> nextWhere(
    bool Function(Map<String, dynamic>) predicate,
  ) => outgoing.firstWhere(predicate);

  /// The outgoing response carrying [id].
  Future<Map<String, dynamic>> responseFor(Object id) =>
      nextWhere((m) => m['id'] == id);

  /// The next outgoing message with the given [method].
  Future<Map<String, dynamic>> messageFor(String method) =>
      nextWhere((m) => m['method'] == method);

  /// Feeds a raw value to the connection (a `Map` for a single message, a
  /// `List` for a JSON-RPC batch).
  void feed(Object message) => _incoming.add(jsonEncode(message));

  /// Feeds an incoming request and returns its response, awaited
  /// deterministically.
  Future<Map<String, dynamic>> sendRequest(
    Object id,
    String method, [
    Object? params,
  ]) {
    final response = responseFor(id);
    feed(<String, dynamic>{
      'jsonrpc': '2.0',
      'id': id,
      'method': method,
      'params': params ?? const <String, dynamic>{},
    });
    return response;
  }

  /// Feeds an incoming notification (no response expected).
  void sendNotification(String method, [Object? params]) {
    feed(<String, dynamic>{
      'jsonrpc': '2.0',
      'method': method,
      'params': params ?? const <String, dynamic>{},
    });
  }

  /// Registers a no-op `initialize` handler and drives the connection into
  /// [LspState.initialized].
  Future<void> initialize() async {
    connection.registerRequestHandler(
      RequestMethod.initialize,
      (params, context) async => <String, dynamic>{
        'capabilities': <String, dynamic>{},
      },
    );
    await sendRequest(initializeId, 'initialize');
  }

  /// Closes the connection and the underlying controllers.
  Future<void> dispose() async {
    await connection.close();
    await _incoming.close();
    await _outgoing.close();
    await listenFuture;
  }
}
