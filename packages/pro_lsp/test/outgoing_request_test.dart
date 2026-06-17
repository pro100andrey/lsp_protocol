import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

/// Tests for outgoing [LspConnection.sendRequest]: cancellation, timeout, and
/// typed error mapping.
///
/// The test acts as the remote peer: it reads the request the connection emits
/// on `outgoing`, then pushes a response/error back on `incoming`.
void main() {
  group('LspConnection.sendRequest (outgoing)', () {
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

    /// Decoded view of the messages the connection sends.
    Stream<Map<String, dynamic>> outMessages() =>
        outgoing.stream.map((s) => jsonDecode(s) as Map<String, dynamic>);

    /// A future for the first outgoing message whose `method` matches [method].
    /// Must be created *before* the action that triggers the message, since the
    /// channel is broadcast and does not buffer.
    Future<Map<String, dynamic>> nextMessage(String method) =>
        outMessages().firstWhere((m) => m['method'] == method);

    test(
      'maps a peer error response to LspException with code/message/data',
      () async {
        final requestSent = nextMessage('textDocument/hover');
        final future = connection.sendRequest(RequestMethod.hover, {'a': 1});

        final req = await requestSent;
        incoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': req['id'],
            'error': <String, dynamic>{
              'code': -32603,
              'message': 'boom',
              'data': <String, dynamic>{'k': 'v'},
            },
          }),
        );

        await expectLater(
          future,
          throwsA(
            isA<LspException>()
                .having((e) => e.code, 'code', -32603)
                .having((e) => e.message, 'message', 'boom')
                .having((e) => e.data, 'data', {'k': 'v'}),
          ),
        );
      },
    );

    test(
      r'token cancellation sends $/cancelRequest with the request id',
      () async {
        final token = CancellationToken();
        final requestSent = nextMessage('textDocument/hover');
        final future = connection.sendRequest(
          RequestMethod.hover,
          {'a': 1},
          token: token,
        );

        final req = await requestSent;

        final cancelSent = nextMessage(r'$/cancelRequest');
        token.cancel();
        final cancel = await cancelSent;
        expect((cancel['params'] as Map)['id'], req['id']);

        // The peer acknowledges with a requestCancelled error response.
        incoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': req['id'],
            'error': <String, dynamic>{'code': -32800, 'message': 'cancelled'},
          }),
        );

        await expectLater(
          future,
          throwsA(isA<LspException>().having((e) => e.code, 'code', -32800)),
        );
      },
    );

    test(
      r'timeout sends $/cancelRequest and throws requestCancelled',
      () async {
        final cancelSent = nextMessage(r'$/cancelRequest');
        final future = connection.sendRequest(
          RequestMethod.hover,
          {'a': 1},
          timeout: const Duration(milliseconds: 30),
        );

        await expectLater(
          future,
          throwsA(
            isA<LspException>().having(
              (e) => e.code,
              'code',
              LspErrorCodes.requestCancelled,
            ),
          ),
        );
        expect((await cancelSent)['method'], r'$/cancelRequest');
      },
    );

    test('a successful response is returned undecoded', () async {
      final requestSent = nextMessage('textDocument/hover');
      final future = connection.sendRequest(RequestMethod.hover, {'a': 1});

      final req = await requestSent;
      incoming.add(
        jsonEncode(<String, dynamic>{
          'jsonrpc': '2.0',
          'id': req['id'],
          'result': <String, dynamic>{'ok': true},
        }),
      );

      expect(await future, {'ok': true});
    });

    test(
      'concurrent requests get distinct ids and resolve independently',
      () async {
        final firstSent = nextMessage('textDocument/hover');
        final secondSent = nextMessage('textDocument/definition');
        final hover = connection.sendRequest(RequestMethod.hover, {'a': 1});
        final def = connection.sendRequest(RequestMethod.definition, {'b': 2});

        final reqA = await firstSent;
        final reqB = await secondSent;
        expect(reqA['id'], isNot(reqB['id']));

        incoming
          ..add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': reqB['id'],
              'result': <String, dynamic>{'which': 'definition'},
            }),
          )
          ..add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': reqA['id'],
              'result': <String, dynamic>{'which': 'hover'},
            }),
          );

        expect(await hover, {'which': 'hover'});
        expect(await def, {'which': 'definition'});
      },
    );
  });
}
