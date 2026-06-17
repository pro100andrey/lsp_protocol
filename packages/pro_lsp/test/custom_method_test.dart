import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

/// A custom, non-spec [LSPMethod] used to exercise the escape-hatch API
/// (`registerCustomRequestHandler` / `sendCustomRequest`, etc.).
final class _CustomMethod implements LSPMethod {
  const _CustomMethod(this.value);

  @override
  final String value;
}

void main() {
  group('LspConnection custom (non-spec) methods', () {
    late StreamController<String> incoming; // messages INTO the connection
    late StreamController<String> outgoing; // messages FROM the connection
    late LspConnection connection;
    late Future<void> listenFuture;

    setUp(() {
      incoming = StreamController<String>.broadcast();
      outgoing = StreamController<String>.broadcast();
      final channel = StreamChannel<String>(incoming.stream, outgoing.sink);
      connection = LspConnection(channel.transform(jsonDocument));
      listenFuture = connection.listen();
    });

    tearDown(() async {
      await connection.close();
      await incoming.close();
      await outgoing.close();
      await listenFuture;
    });

    Stream<Map<String, dynamic>> outMessages() =>
        outgoing.stream.map((s) => jsonDecode(s) as Map<String, dynamic>);

    Future<Map<String, dynamic>> responseForId(Object id) =>
        outMessages().firstWhere((m) => m['id'] == id);

    Future<Map<String, dynamic>> nextMessage(String method) =>
        outMessages().firstWhere((m) => m['method'] == method);

    /// Drives the connection into [LspState.initialized] so that custom traffic
    /// is accepted.
    Future<void> initialize() async {
      connection.registerRequestHandler(
        RequestMethod.initialize,
        (params, context) async => <String, dynamic>{
          'capabilities': <String, dynamic>{},
        },
      );
      final initialized = responseForId(0);
      incoming.add(
        jsonEncode(<String, dynamic>{
          'jsonrpc': '2.0',
          'id': 0,
          'method': 'initialize',
          'params': <String, dynamic>{'capabilities': <String, dynamic>{}},
        }),
      );
      await initialized;
    }

    test(
      'incoming custom request reaches its handler once initialized',
      () async {
        const method = _CustomMethod(r'$/myExtension');
        connection.registerCustomRequestHandler(
          method,
          (params, context) async => <String, dynamic>{
            'echo': (params! as Map)['x'],
          },
        );

        await initialize();

        final response = responseForId(1);
        incoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': r'$/myExtension',
            'params': <String, dynamic>{'x': 42},
          }),
        );

        expect((await response)['result'], {'echo': 42});
      },
    );

    test(
      'custom request before initialize is rejected as not-initialized',
      () async {
        const method = _CustomMethod(r'$/myExtension');
        connection.registerCustomRequestHandler(
          method,
          (params, context) async => 'should not run',
        );

        final response = responseForId(1);
        incoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': r'$/myExtension',
            'params': <String, dynamic>{},
          }),
        );

        expect(
          (await response)['error'],
          containsPair('code', LspErrorCodes.serverNotInitialized),
        );
      },
    );

    test(
      'sendCustomRequest emits the wire method and resolves with the result',
      () async {
        final requestSent = nextMessage(r'$/myQuery');
        final future = connection.sendCustomRequest(r'$/myQuery', {'a': 1});

        final req = await requestSent;
        incoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': req['id'],
            'result': <String, dynamic>{'ok': true},
          }),
        );

        expect(await future, {'ok': true});
      },
    );
  });
}
