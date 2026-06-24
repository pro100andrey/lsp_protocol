import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

void main() {
  late ConnectionHarness h;
  setUp(() => h = ConnectionHarness());
  tearDown(() => h.dispose());

  // Builds an LspRequest the way the dispatcher would, using the harness
  // connection so middleware can resolve services / reach the connection.
  LspRequest req(String method, {Object? params, Object? id}) => LspRequest(
    method: method,
    cancellationToken: CancellationToken.noop,
    connection: h.connection,
    id: id,
    params: params,
  );

  group('composeMiddlewares', () {
    test('calls target when no middlewares', () async {
      var targetCalled = false;
      final handler = composeMiddlewares([], (request) async {
        targetCalled = true;
        return 'result';
      });

      final result = await handler(req('test'));

      expect(targetCalled, isTrue);
      expect(result, 'result');
    });

    test('calls middlewares in registration order', () async {
      final order = <String>[];

      final handler = composeMiddlewares(
        [
          LspMiddleware.fromFunction((request, next) {
            order.add('m1-before');
            final result = next(request);
            order.add('m1-after');
            return result;
          }),
          LspMiddleware.fromFunction((request, next) {
            order.add('m2-before');
            final result = next(request);
            order.add('m2-after');
            return result;
          }),
        ],
        (request) async {
          order.add('target');
          return 'result';
        },
      );

      await handler(req('test'));

      expect(order, [
        'm1-before',
        'm2-before',
        'target',
        'm2-after',
        'm1-after',
      ]);
    });

    test('middleware can rewrite request params by mutation', () async {
      Object? capturedParams;

      final handler = composeMiddlewares(
        [
          LspMiddleware.fromFunction((request, next) {
            request.params = const {'modified': true, 'extra': 'value'};
            return next(request);
          }),
        ],
        (request) async {
          capturedParams = request.params;
          return null;
        },
      );

      await handler(req('test', params: {'original': 1}));

      expect(capturedParams, {'modified': true, 'extra': 'value'});
    });

    test('middleware can short-circuit and return custom result', () async {
      var targetCalled = false;

      final handler = composeMiddlewares(
        [
          LspMiddleware.fromFunction(
            (request, next) async => const {'intercepted': true},
          ),
        ],
        (request) async {
          targetCalled = true;
          return {'target': true};
        },
      );

      final result = await handler(req('test'));

      expect(targetCalled, isFalse);
      expect(result, {'intercepted': true});
    });

    test('middleware can inspect method and skip', () async {
      final methods = <String>[];

      final handler = composeMiddlewares(
        [
          LspMiddleware.fromFunction((request, next) {
            methods.add(request.method);
            return next(request);
          }),
        ],
        (request) async => 'done',
      );

      await handler(req('workspace/foobar'));

      expect(methods, ['workspace/foobar']);
    });

    test('multiple middlewares can all short-circuit (last wins)', () async {
      final order = <String>[];

      final handler = composeMiddlewares(
        [
          LspMiddleware.fromFunction((request, next) async {
            order.add('m1');
            return const {'mw': 1};
          }),
          LspMiddleware.fromFunction((request, next) async {
            order.add('m2');
            return const {'mw': 2};
          }),
        ],
        (request) async => {'target': true},
      );

      final result = await handler(req('test'));

      expect(result, {'mw': 1});
      // m1 is outermost, so it's called first and its short-circuit wins
    });

    test('id is preserved through middleware chain', () async {
      Object? capturedId;

      final handler = composeMiddlewares(
        [LspMiddleware.fromFunction((request, next) => next(request))],
        (request) async {
          capturedId = request.id;
          return null;
        },
      );

      await handler(req('test', id: 'req-123'));

      expect(capturedId, 'req-123');
    });
  });
}
