import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LSP Server Improvements', () {
    late StreamController<String> clientIncoming;
    late StreamController<String> clientOutgoing;
    late StreamChannel<String> serverChannel;
    late LspConnection connection;

    setUp(() {
      clientIncoming = StreamController<String>.broadcast();
      clientOutgoing = StreamController<String>.broadcast();
      serverChannel = StreamChannel<String>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      connection = LspConnection(serverChannel);
    });

    tearDown(() async {
      await clientIncoming.close();
      await clientOutgoing.close();
    });

    group('Lifecycle State Machine', () {
      test('rejects requests before initialization', () async {
        var handlerCalled = false;
        connection.registerRequestHandler('textDocument/hover', (params) async {
          handlerCalled = true;
          return null;
        });

        // Run the listener in background
        final listenFuture = connection.listen();

        // Send a request
        final request = jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'textDocument/hover',
          'params': {}
        });

        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);
        clientIncoming.add(request);

        // Wait a bit for processing
        await Future.delayed(const Duration(milliseconds: 50));

        expect(handlerCalled, isFalse);
        expect(responses, hasLength(1));
        final resp = jsonDecode(responses.first);
        expect(resp['error']['code'], -32002); // serverNotInitialized
        expect(resp['error']['message'], contains('not initialized'));

        await connection.close();
        await listenFuture;
      });

      test('allows initialize and transitions state', () async {
        connection.registerRequestHandler('initialize', (params) async {
          return {'capabilities': {}};
        });

        connection.registerRequestHandler('textDocument/hover', (params) async {
          return {'contents': 'Hover result'};
        });

        final listenFuture = connection.listen();

        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        expect(connection.state, LspState.uninitialized);

        // Send initialize
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'initialize',
          'params': {}
        }));

        await Future.delayed(const Duration(milliseconds: 50));
        expect(connection.state, LspState.initialized);
        expect(responses, hasLength(1));

        // Now send hover, which should be allowed
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 2,
          'method': 'textDocument/hover',
          'params': {}
        }));

        await Future.delayed(const Duration(milliseconds: 50));
        expect(responses, hasLength(2));
        final hoverResp = jsonDecode(responses[1]);
        expect(hoverResp['result']['contents'], 'Hover result');

        await connection.close();
        await listenFuture;
      });

      test('rejects requests after shutdown', () async {
        connection.registerRequestHandler('initialize', (params) async {
          return {'capabilities': {}};
        });
        connection.registerRequestHandler('shutdown', (params) async {
          return null;
        });
        connection.registerRequestHandler('textDocument/hover', (params) async {
          return null;
        });

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // 1. Initialize
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'initialize',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        // 2. Shutdown
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 2,
          'method': 'shutdown',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));
        expect(connection.state, LspState.shuttingDown);

        // 3. Try to hover (should be rejected)
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 3,
          'method': 'textDocument/hover',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        expect(responses, hasLength(3));
        final hoverResp = jsonDecode(responses[2]);
        expect(hoverResp['error']['code'], -32600); // invalidRequest
        expect(hoverResp['error']['message'], contains('not allowed'));

        await connection.close();
        await listenFuture;
      });
    });

    group('Request Cancellation', () {
      test('correctly cancels token inside zone', () async {
        final handlerCompleter = Completer<Object?>();
        CancellationToken? capturedToken;

        connection.registerRequestHandler('initialize', (params) async {
          return {};
        });

        connection.registerRequestHandler('textDocument/hover', (params) async {
          capturedToken = CancellationToken.current;
          // Wait for cancellation
          await handlerCompleter.future;
          capturedToken?.throwIfCancelled();
          return 'Hover Success';
        });

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // Initialize first
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'initialize',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        // Send hover request
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 42,
          'method': 'textDocument/hover',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        expect(capturedToken, isNotNull);
        expect(capturedToken!.isCancelled, isFalse);

        // Send cancel request
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'method': r'$/cancelRequest',
          'params': {'id': 42}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        expect(capturedToken!.isCancelled, isTrue);

        // Complete the handler
        handlerCompleter.complete(null);
        await Future.delayed(const Duration(milliseconds: 50));

        expect(responses, hasLength(2)); // Initialize response + Hover error response
        final hoverResp = jsonDecode(responses[1]);
        expect(hoverResp['error']['code'], -32800); // RequestCancelled

        await connection.close();
        await listenFuture;
      });
    });

    group('Middleware Stack', () {
      test('intercepts requests and can modify or measure execution', () async {
        final methodsCalled = <String>[];

        // Middleware 1: logs methods
        connection.middlewares.add((request, next) async {
          methodsCalled.add(request.method);
          return await next(request);
        });

        // Middleware 2: overrides response for textDocument/hover
        connection.middlewares.add((request, next) async {
          if (request.method == 'textDocument/hover') {
            return {'contents': 'Intercepted Hover'};
          }
          return await next(request);
        });

        connection.registerRequestHandler('initialize', (params) async {
          return {};
        });

        connection.registerRequestHandler('textDocument/hover', (params) async {
          return {'contents': 'Original Hover'};
        });

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // Initialize
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'initialize',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        // Hover
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 2,
          'method': 'textDocument/hover',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        expect(methodsCalled, equals(['initialize', 'textDocument/hover']));
        expect(responses, hasLength(2));
        final hoverResp = jsonDecode(responses[1]);
        expect(hoverResp['result']['contents'], 'Intercepted Hover');

        await connection.close();
        await listenFuture;
      });
    });

    group('Error Boundary', () {
      test('triggers onError and returns InternalError on unhandled crashes', () async {
        Object? caughtError;
        connection.onError = (err, stack) {
          caughtError = err;
        };

        connection.registerRequestHandler('initialize', (params) async {
          return {};
        });

        connection.registerRequestHandler('textDocument/hover', (params) async {
          throw StateError('Simulated crash in handler');
        });

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // Initialize
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'initialize',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        // Hover
        clientIncoming.add(jsonEncode({
          'jsonrpc': '2.0',
          'id': 2,
          'method': 'textDocument/hover',
          'params': {}
        }));
        await Future.delayed(const Duration(milliseconds: 50));

        expect(caughtError, isA<StateError>());
        expect(responses, hasLength(2));
        final hoverResp = jsonDecode(responses[1]);
        expect(hoverResp['error']['code'], -32603); // InternalError
        expect(hoverResp['error']['message'], contains('Simulated crash'));

        await connection.close();
        await listenFuture;
      });
    });
  });
}
