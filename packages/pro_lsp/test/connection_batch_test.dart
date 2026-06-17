import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

void main() {
  group('LspConnection batch requests', () {
    late ConnectionHarness h;

    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    test('processes a JSON-RPC batch and replies with a batch', () async {
      h.connection
        ..registerRequestHandler(
          RequestMethod.hover,
          (params, context) async => <String, dynamic>{'kind': 'hover'},
        )
        ..registerRequestHandler(
          RequestMethod.definition,
          (params, context) async => <String, dynamic>{'kind': 'definition'},
        );
      await h.initialize();

      final batchResponse = h.rawOutgoing.firstWhere((m) => m is List);
      h.feed(<Object?>[
        <String, dynamic>{
          'jsonrpc': '2.0',
          'id': 10,
          'method': 'textDocument/hover',
          'params': <String, dynamic>{},
        },
        <String, dynamic>{
          'jsonrpc': '2.0',
          'id': 11,
          'method': 'textDocument/definition',
          'params': <String, dynamic>{},
        },
      ]);

      final responses = (await batchResponse)! as List;
      expect(responses, hasLength(2));

      final byId = <Object?, Map<String, dynamic>>{
        for (final r in responses.cast<Map<String, dynamic>>()) r['id']: r,
      };
      expect(byId[10]?['result'], {'kind': 'hover'});
      expect(byId[11]?['result'], {'kind': 'definition'});
    });

    test('a batch carrying a cancelRequest is handled without error', () async {
      h.connection.registerRequestHandler(
        RequestMethod.hover,
        (params, context) async => <String, dynamic>{'kind': 'hover'},
      );
      await h.initialize();

      final batchResponse = h.rawOutgoing.firstWhere((m) => m is List);
      h.feed(<Object?>[
        <String, dynamic>{
          'jsonrpc': '2.0',
          'id': 20,
          'method': 'textDocument/hover',
          'params': <String, dynamic>{},
        },
        <String, dynamic>{
          'jsonrpc': '2.0',
          'method': r'$/cancelRequest',
          'params': <String, dynamic>{'id': 999},
        },
      ]);

      final responses = (await batchResponse)! as List;
      final hover = responses.cast<Map<String, dynamic>>().firstWhere(
        (r) => r['id'] == 20,
      );
      // The request still completes; cancelling an unknown id is a no-op.
      expect(hover['result'], {'kind': 'hover'});
    });
  });
}
