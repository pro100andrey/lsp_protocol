import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

void main() {
  group('LspConnection', () {
    late ConnectionHarness h;

    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    group('Lifecycle', () {
      test('rejects requests before initialization', () async {
        var handlerCalled = false;
        h.connection.registerRequestHandler(RequestMethod.hover, (
          params,
          context,
        ) async {
          handlerCalled = true;
          return null;
        });

        final response = await h.sendRequest(1, 'textDocument/hover');

        expect(handlerCalled, isFalse);
        expect(response['error'], isNotNull);
        final error = response['error'] as Map<String, dynamic>;
        expect(error['code'], LspErrorCodes.serverNotInitialized);
        expect(error['message'], contains('not initialized'));
      });

      test('allows initialize and transitions state', () async {
        h.connection.registerRequestHandler(
          RequestMethod.hover,
          (params, context) async => <String, dynamic>{
            'contents': 'Hover result',
          },
        );

        expect(h.connection.state, LspState.uninitialized);
        await h.initialize();
        expect(h.connection.state, LspState.initialized);

        final response = await h.sendRequest(2, 'textDocument/hover');
        expect(
          (response['result'] as Map<String, dynamic>)['contents'],
          'Hover result',
        );
      });

      test('rejects requests after shutdown', () async {
        h.connection
          ..registerRequestHandler(
            RequestMethod.shutdown,
            (params, context) async => null,
          )
          ..registerRequestHandler(
            RequestMethod.hover,
            (params, context) async => null,
          );

        await h.initialize();
        await h.sendRequest(2, 'shutdown');
        expect(h.connection.state, LspState.shuttingDown);

        final response = await h.sendRequest(3, 'textDocument/hover');
        final error = response['error'] as Map<String, dynamic>;
        expect(error['code'], LspErrorCodes.invalidRequest);
        expect(error['message'], contains('not allowed'));
      });

      test(
        'exit notification transitions to exited and closes the peer',
        () async {
          // A bare LspConnection has no default `exit` handler (LspServer
          // provides that), so register one to exercise the exit transition.
          h.connection.registerNotificationHandler(
            NotificationMethod.exit,
            (params, context) async {},
          );

          await h.initialize();
          h.sendNotification('exit');

          // The exit handler transitions to `exited` and closes the peer, which
          // completes the listen loop.
          await h.listenFuture.timeout(const Duration(seconds: 2));
          expect(h.connection.state, LspState.exited);
        },
      );

      test('reverts to initialized when a shutdown handler throws', () async {
        h.connection.registerRequestHandler(RequestMethod.shutdown, (
          params,
          context,
        ) {
          throw LspException.internalError('shutdown boom');
        });

        await h.initialize();
        final response = await h.sendRequest(2, 'shutdown');

        expect(
          (response['error'] as Map<String, dynamic>)['code'],
          LspErrorCodes.internalError,
        );
        // Failure must not leave the connection stuck in `shuttingDown`.
        expect(h.connection.state, LspState.initialized);
      });
    });

    group('Dispatch', () {
      test('unknown method returns methodNotFound', () async {
        await h.initialize();
        final response = await h.sendRequest(2, r'$/totallyUnknown');

        final error = response['error'] as Map<String, dynamic>;
        expect(error['code'], LspErrorCodes.methodNotFound);
        expect(error['message'], contains(r'$/totallyUnknown'));
      });

      test('a successful request response carries the result', () async {
        h.connection.registerRequestHandler(
          RequestMethod.hover,
          (params, context) async => <String, dynamic>{'contents': 'ok'},
        );
        await h.initialize();

        final response = await h.sendRequest(2, 'textDocument/hover');
        expect(response['result'], {'contents': 'ok'});
        expect(response.containsKey('error'), isFalse);
      });
    });

    group('Cancellation', () {
      test('cancels the token and surfaces requestCancelled', () async {
        final handlerStarted = Completer<void>();
        final release = Completer<void>();
        CancellationToken? capturedToken;
        Object? capturedId;
        String? capturedMethod;

        h.connection.registerRequestHandler(RequestMethod.hover, (
          params,
          context,
        ) async {
          capturedToken = context.cancellationToken;
          capturedId = context.id;
          capturedMethod = context.method;
          expect(capturedToken, same(CancellationToken.current));
          handlerStarted.complete();

          await release.future;
          context.cancellationToken.throwIfCancelled();
          return 'unreachable';
        });

        await h.initialize();

        final response = h.responseFor(42);
        h.feed(<String, dynamic>{
          'jsonrpc': '2.0',
          'id': 42,
          'method': 'textDocument/hover',
          'params': <String, dynamic>{},
        });

        await handlerStarted.future;
        expect(capturedId, 42);
        expect(capturedMethod, 'textDocument/hover');
        expect(capturedToken!.isCancelled, isFalse);

        h.sendNotification(r'$/cancelRequest', <String, dynamic>{'id': 42});
        // The cancel notification is processed before we release the handler.
        await Future<void>.value();
        release.complete();

        final error = (await response)['error'] as Map<String, dynamic>;
        expect(error['code'], LspErrorCodes.requestCancelled);
        expect(capturedToken!.isCancelled, isTrue);
      });
    });

    group('Middleware', () {
      test('runs in registration order and can short-circuit', () async {
        final methodsSeen = <String>[];

        h.connection
          ..addMiddleware(
            LspMiddleware.fromFunction((request, next) {
              methodsSeen.add(request.method);
              return next(request);
            }),
          )
          ..addMiddleware(
            LspMiddleware.fromFunction((request, next) async {
              if (request.method == 'textDocument/hover') {
                return <String, dynamic>{'contents': 'Intercepted'};
              }
              return next(request);
            }),
          )
          ..registerRequestHandler(
            RequestMethod.hover,
            (params, context) async => <String, dynamic>{
              'contents': 'Original',
            },
          );

        await h.initialize();
        final response = await h.sendRequest(2, 'textDocument/hover');

        expect(methodsSeen, ['initialize', 'textDocument/hover']);
        expect(
          (response['result'] as Map<String, dynamic>)['contents'],
          'Intercepted',
        );
      });
    });

    group('Error handling', () {
      test(
        'forwards handler crashes to onError and returns internalError',
        () async {
          Object? caughtError;
          h.connection.onError = (error, stack) => caughtError = error;
          h.connection.registerRequestHandler(
            RequestMethod.hover,
            (params, context) {
              throw StateError('Simulated crash');
            },
          );

          await h.initialize();
          final response = await h.sendRequest(2, 'textDocument/hover');

          expect(caughtError, isA<StateError>());
          final error = response['error'] as Map<String, dynamic>;
          expect(error['code'], LspErrorCodes.internalError);
          expect(error['message'], contains('Simulated crash'));
        },
      );

      test('a thrown LspException is sent verbatim (not wrapped)', () async {
        h.connection.registerRequestHandler(RequestMethod.hover, (
          params,
          context,
        ) {
          throw LspException.invalidParams('bad params', {'field': 'uri'});
        });

        await h.initialize();
        final response = await h.sendRequest(2, 'textDocument/hover');

        final error = response['error'] as Map<String, dynamic>;
        expect(error['code'], LspErrorCodes.invalidParams);
        expect(error['message'], 'bad params');
        // json_rpc_2 augments error `data` with the originating `request`, so
        // assert our payload is present rather than exact-matching the map.
        expect(error['data'], containsPair('field', 'uri'));
      });
    });
  });
}
