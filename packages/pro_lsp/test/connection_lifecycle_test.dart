import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspConnection', () {
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

    group('Lifecycle', () {
      test('rejects requests before initialization', () async {
        final listenFuture = connection.listen();
        var handlerCalled = false;
        connection.registerRequestHandler(
          RequestMethod.hover,
          (params, _) async {
            handlerCalled = true;
            return null;
          },
        );

        // Send a request
        final request = jsonEncode(<String, dynamic>{
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'textDocument/hover',
          'params': <String, dynamic>{},
        });

        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);
        clientIncoming.add(request);

        // Wait a bit for processing
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(handlerCalled, isFalse);
        expect(responses, hasLength(1));
        final resp = jsonDecode(responses.first) as Map<String, dynamic>;
        final error = resp['error'] as Map<String, dynamic>;
        expect(error['code'], -32002); // serverNotInitialized
        expect(error['message'], contains('not initialized'));

        await connection.close();
        await listenFuture;
      });

      test('allows initialize and transitions state', () async {
        connection
          ..registerRequestHandler(
            RequestMethod.initialize,
            (params, _) async => <String, dynamic>{
              'capabilities': <String, dynamic>{},
            },
          )
          ..registerRequestHandler(
            RequestMethod.hover,
            (params, _) async => <String, dynamic>{'contents': 'Hover result'},
          );

        final listenFuture = connection.listen();

        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        expect(connection.state, LspState.uninitialized);

        // Send initialize
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'initialize',
            'params': <String, dynamic>{},
          }),
        );

        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(connection.state, LspState.initialized);
        expect(responses, hasLength(1));

        // Now send hover, which should be allowed
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 2,
            'method': 'textDocument/hover',
            'params': <String, dynamic>{},
          }),
        );

        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(responses, hasLength(2));
        final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
        final result = hoverResp['result'] as Map<String, dynamic>;
        expect(result['contents'], 'Hover result');

        await connection.close();
        await listenFuture;
      });

      test('rejects requests after shutdown', () async {
        connection
          ..registerRequestHandler(
            RequestMethod.initialize,
            (params, _) async => <String, dynamic>{
              'capabilities': <String, dynamic>{},
            },
          )
          ..registerRequestHandler(
            RequestMethod.shutdown,
            (params, _) async => null,
          )
          ..registerRequestHandler(
            RequestMethod.hover,
            (params, _) async => null,
          );

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // 1. Initialize
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'initialize',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        // 2. Shutdown
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 2,
            'method': 'shutdown',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(connection.state, LspState.shuttingDown);

        // 3. Try to hover (should be rejected)
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 3,
            'method': 'textDocument/hover',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(responses, hasLength(3));
        final hoverResp = jsonDecode(responses[2]) as Map<String, dynamic>;
        final error = hoverResp['error'] as Map<String, dynamic>;
        expect(error['code'], -32600); // invalidRequest
        expect(error['message'], contains('not allowed'));

        await connection.close();
        await listenFuture;
      });
    });

    group('Cancellation', () {
      test(
        'correctly cancels token and provides metadata in context',
        () async {
          final handlerCompleter = Completer<Object?>();
          CancellationToken? capturedToken;
          Object? capturedId;
          String? capturedMethod;

          connection
            ..registerRequestHandler(
              RequestMethod.initialize,
              (params, _) async => <String, dynamic>{},
            )
            ..registerRequestHandler(RequestMethod.hover, (
              params,
              context,
            ) async {
              capturedToken = context.cancellationToken;
              capturedId = context.id;
              capturedMethod = context.method;

              // Verify context matches static CancellationToken.current
              expect(capturedToken, same(CancellationToken.current));

              // Wait for cancellation
              await handlerCompleter.future;
              capturedToken?.throwIfCancelled();
              return 'Hover Success';
            });

          final listenFuture = connection.listen();
          final responses = <String>[];
          clientOutgoing.stream.listen(responses.add);

          // Initialize first
          clientIncoming.add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': 1,
              'method': 'initialize',
              'params': <String, dynamic>{},
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          // Send hover request
          clientIncoming.add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': 42,
              'method': 'textDocument/hover',
              'params': <String, dynamic>{},
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(capturedToken, isNotNull);
          expect(capturedToken!.isCancelled, isFalse);
          expect(capturedId, 42);
          expect(capturedMethod, 'textDocument/hover');

          // Send cancel request
          clientIncoming.add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'method': r'$/cancelRequest',
              'params': <String, dynamic>{'id': 42},
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(capturedToken!.isCancelled, isTrue);

          // Complete the handler
          handlerCompleter.complete(null);
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(
            responses,
            hasLength(2),
          ); // Initialize response + Hover error response
          final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
          final error = hoverResp['error'] as Map<String, dynamic>;
          expect(error['code'], -32800); // RequestCancelled

          await connection.close();
          await listenFuture;
        },
      );
    });

    group('Middleware', () {
      test('intercepts requests and can modify or measure execution', () async {
        final methodsCalled = <String>[];

        connection
          ..addMiddleware(
            LspMiddleware.fromFunction((request, next) {
              methodsCalled.add(request.method);
              return next(request);
            }),
          )
          ..addMiddleware(
            LspMiddleware.fromFunction((request, next) async {
              if (request.method == 'textDocument/hover') {
                return <String, dynamic>{'contents': 'Intercepted Hover'};
              }
              return next(request);
            }),
          )
          ..registerRequestHandler(
            RequestMethod.initialize,
            (params, _) async => <String, dynamic>{},
          )
          ..registerRequestHandler(
            RequestMethod.hover,
            (params, _) async => <String, dynamic>{
              'contents': 'Original Hover',
            },
          );

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // Initialize
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'initialize',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        // Hover
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 2,
            'method': 'textDocument/hover',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(methodsCalled, equals(['initialize', 'textDocument/hover']));
        expect(responses, hasLength(2));
        final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
        final result = hoverResp['result'] as Map<String, dynamic>;
        expect(result['contents'], 'Intercepted Hover');

        await connection.close();
        await listenFuture;
      });
    });

    group('Error Handling', () {
      test(
        'triggers onError and returns InternalError on unhandled crashes',
        () async {
          Object? caughtError;
          connection
            ..onError = (err, stack) {
              caughtError = err;
            }
            ..registerRequestHandler(
              RequestMethod.initialize,
              (params, _) async => <String, dynamic>{},
            )
            ..registerRequestHandler(RequestMethod.hover, (
              params,
              _,
            ) {
              throw StateError('Simulated crash in handler');
            });

          final listenFuture = connection.listen();
          final responses = <String>[];
          clientOutgoing.stream.listen(responses.add);

          // Initialize
          clientIncoming.add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': 1,
              'method': 'initialize',
              'params': <String, dynamic>{},
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          // Hover
          clientIncoming.add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': 2,
              'method': 'textDocument/hover',
              'params': <String, dynamic>{},
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(caughtError, isA<StateError>());
          expect(responses, hasLength(2));
          final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
          final error = hoverResp['error'] as Map<String, dynamic>;
          expect(error['code'], -32603); // InternalError
          expect(error['message'], contains('Simulated crash'));

          await connection.close();
          await listenFuture;
        },
      );
    });
  });
}
