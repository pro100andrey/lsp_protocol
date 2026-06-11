import 'package:pro_lsp/src/server/middleware.dart';
import 'package:test/test.dart';

void main() {
  group('LspIncomingRequest', () {
    test('stores method, params, and requestId', () {
      final request = LspIncomingRequest(
        method: 'textDocument/hover',
        params: {
          'position': {'line': 0, 'character': 0},
        },
        requestId: 42,
      );

      expect(request.method, 'textDocument/hover');
      expect(
        request.params,
        equals({
          'position': {'line': 0, 'character': 0},
        }),
      );
      expect(request.requestId, 42);
    });

    test('requestId is null for notifications', () {
      final request = LspIncomingRequest(
        method: 'window/logMessage',
        params: {'message': 'hello'},
      );

      expect(request.requestId, isNull);
    });
  });

  group('composeMiddlewares', () {
    test('calls target when no middlewares', () async {
      var targetCalled = false;
      final handler = composeMiddlewares([], (request) async {
        targetCalled = true;
        return 'result';
      });

      final result = await handler(
        LspIncomingRequest(method: 'test', params: null),
      );

      expect(targetCalled, isTrue);
      expect(result, 'result');
    });

    test('calls middlewares in registration order', () async {
      final order = <String>[];

      final handler = composeMiddlewares(
        [
          (request, next) {
            order.add('m1-before');
            final result = next(request);
            order.add('m1-after');
            return result;
          },
          (request, next) {
            order.add('m2-before');
            final result = next(request);
            order.add('m2-after');
            return result;
          },
        ],
        (request) async {
          order.add('target');
          return 'result';
        },
      );

      await handler(LspIncomingRequest(method: 'test', params: null));

      expect(order, [
        'm1-before',
        'm2-before',
        'target',
        'm2-after',
        'm1-after',
      ]);
    });

    test('middleware can modify request params', () async {
      Object? capturedParams;

      final handler = composeMiddlewares(
        [
          (request, next) {
            final modified = LspIncomingRequest(
              method: request.method,
              params: {'modified': true, 'extra': 'value'},
              requestId: request.requestId,
            );
            return next(modified);
          },
        ],
        (request) async {
          capturedParams = request.params;
          return null;
        },
      );

      await handler(
        LspIncomingRequest(method: 'test', params: {'original': 1}),
      );

      expect(capturedParams, {'modified': true, 'extra': 'value'});
    });

    test('middleware can short-circuit and return custom result', () async {
      var targetCalled = false;

      final handler = composeMiddlewares(
        [
          (request, next) async => {'intercepted': true},
        ],
        (request) async {
          targetCalled = true;
          return {'target': true};
        },
      );

      final result = await handler(
        LspIncomingRequest(method: 'test', params: null),
      );

      expect(targetCalled, isFalse);
      expect(result, {'intercepted': true});
    });

    test('middleware can inspect method and skip', () async {
      final methods = <String>[];

      final handler = composeMiddlewares(
        [
          (request, next) {
            methods.add(request.method);
            return next(request);
          },
        ],
        (request) async => 'done',
      );

      await handler(
        LspIncomingRequest(method: 'workspace/foobar', params: null),
      );

      expect(methods, ['workspace/foobar']);
    });

    test('multiple middlewares can all short-circuit (last wins)', () async {
      final order = <String>[];

      final handler = composeMiddlewares(
        [
          (request, next) async {
            order.add('m1');
            return {'mw': 1};
          },
          (request, next) async {
            order.add('m2');
            return {'mw': 2};
          },
        ],
        (request) async => {'target': true},
      );

      final result = await handler(
        LspIncomingRequest(method: 'test', params: null),
      );

      expect(result, {'mw': 1});
      // m1 is outermost, so it's called first and its short-circuit wins
    });

    test('requestId is preserved through middleware chain', () async {
      Object? capturedRequestId;

      final handler = composeMiddlewares(
        [(request, next) => next(request)],
        (request) async {
          capturedRequestId = request.requestId;
          return null;
        },
      );

      await handler(
        LspIncomingRequest(
          method: 'test',
          params: null,
          requestId: 'req-123',
        ),
      );

      expect(capturedRequestId, 'req-123');
    });
  });
}
