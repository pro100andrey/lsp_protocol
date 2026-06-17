import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

void main() {
  group('LspConnection request-id correlation does not leak', () {
    late ConnectionHarness h;

    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    test('malformed requests the peer rejects pre-dispatch are not '
        'recorded', () async {
      await h.initialize();
      expect(h.connection.pendingRequestIdCount, 0);

      // All three are request-shaped (id + method + object params) but are
      // rejected by json_rpc_2's strict validation BEFORE any handler/fallback
      // runs — exactly the path that used to leak a _requestIds entry forever.
      h
        ..feed(<String, dynamic>{
          // missing "jsonrpc"
          'id': 100,
          'method': 'textDocument/hover',
          'params': <String, dynamic>{'x': 1},
        })
        ..feed(<String, dynamic>{
          'jsonrpc': '1.0', // wrong version
          'id': 101,
          'method': 'textDocument/hover',
          'params': <String, dynamic>{'x': 1},
        })
        ..feed(<String, dynamic>{
          'jsonrpc': '2.0',
          'id': <int>[1, 2], // invalid id type
          'method': 'textDocument/hover',
          'params': <String, dynamic>{'x': 1},
        });

      // A valid request flushes the pipeline (stream order guarantees the
      // malformed ones were processed first) and is itself recorded then
      // removed on dispatch.
      h.connection.registerRequestHandler(
        RequestMethod.hover,
        (params, context) async => <String, dynamic>{'contents': 'ok'},
      );
      await h.sendRequest(200, 'textDocument/hover', <String, dynamic>{'x': 1});

      // None of the rejected messages left a dangling correlation entry.
      expect(h.connection.pendingRequestIdCount, 0);
    });

    test(r'a dispatched request still correlates $/cancelRequest', () async {
      await h.initialize();

      final started = <void>[];
      h.connection.registerRequestHandler(RequestMethod.hover, (
        params,
        context,
      ) async {
        started.add(null);
        // Block until cancelled so the cancellation has something to hit.
        await context.cancellationToken.onCancelled.first;
        context.cancellationToken.throwIfCancelled();
        return <String, dynamic>{'contents': 'unreachable'};
      });

      final response = h.responseFor(7);
      h.feed(<String, dynamic>{
        'jsonrpc': '2.0',
        'id': 7,
        'method': 'textDocument/hover',
        'params': <String, dynamic>{'x': 1},
      });

      // Let the handler start so the id is registered as active.
      await Future<void>.delayed(Duration.zero);
      expect(started, hasLength(1));

      h.feed(<String, dynamic>{
        'jsonrpc': '2.0',
        'method': r'$/cancelRequest',
        'params': <String, dynamic>{'id': 7},
      });

      final r = await response;
      expect((r['error'] as Map)['code'], LspErrorCodes.requestCancelled);
      // The completed request released its correlation entry.
      expect(h.connection.pendingRequestIdCount, 0);
    });
  });
}
