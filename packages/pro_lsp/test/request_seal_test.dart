import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

final class _CustomMethod implements LSPMethod {
  const _CustomMethod(this.value);
  @override
  final String value;
}

void main() {
  late ConnectionHarness h;
  setUp(() => h = ConnectionHarness());
  tearDown(() => h.dispose());

  LspRequest build() => LspRequest(
    method: 'test',
    cancellationToken: CancellationToken.noop,
    connection: h.connection,
  );

  group('LspRequest.params constraints', () {
    test('writing params after seal throws StateError', () {
      final request = build()
        ..params = const {'ok': true}
        ..seal();
      expect(() => request.params = const {'late': true}, throwsStateError);
    });

    test('setter accepts Map, List, and null', () {
      final request = build();
      expect(() => request.params = const {'a': 1}, returnsNormally);
      expect(() => request.params = const [1, 2], returnsNormally);
      expect(() => request.params = null, returnsNormally);
    });

    test('setter rejects a non Map/List/null value', () {
      final request = build();
      expect(
        () => request.params = 'not-wire-shaped',
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('seal fires at handler entry in every dispatch path', () {
    test('request, no middleware: handler cannot rewrite params', () async {
      h.connection.registerCustomRequestHandler(
        const _CustomMethod(r'$/req'),
        (params, context) async {
          context.params = const {'too': 'late'};
          return 'unreachable';
        },
      );
      await h.initialize();
      final resp = await h.sendRequest(1, r'$/req');
      expect(
        resp['error'],
        containsPair('code', LspErrorCodes.internalError),
      );
    });

    test('request, with middleware: handler cannot rewrite params', () async {
      h.connection.addMiddleware(
        LspMiddleware.fromFunction((request, next) => next(request)),
      );
      h.connection.registerCustomRequestHandler(
        const _CustomMethod(r'$/req2'),
        (params, context) async {
          context.params = const {'too': 'late'};
          return 'unreachable';
        },
      );
      await h.initialize();
      final resp = await h.sendRequest(2, r'$/req2');
      expect(
        resp['error'],
        containsPair('code', LspErrorCodes.internalError),
      );
    });

    test('notification, no middleware: handler cannot rewrite', () async {
      final errored = Completer<Object>();
      h.connection.onError = (e, _) {
        if (!errored.isCompleted) {
          errored.complete(e);
        }
      };
      h.connection.registerCustomNotificationHandler(
        const _CustomMethod(r'$/note'),
        (params, context) async => context.params = const {'too': 'late'},
      );
      await h.initialize();
      h.sendNotification(r'$/note');
      expect(await errored.future, isStateError);
    });

    test('notification, with middleware: handler cannot rewrite', () async {
      final errored = Completer<Object>();
      h.connection.onError = (e, _) {
        if (!errored.isCompleted) {
          errored.complete(e);
        }
      };
      h.connection.addMiddleware(
        LspMiddleware.fromFunction((request, next) => next(request)),
      );
      h.connection.registerCustomNotificationHandler(
        const _CustomMethod(r'$/note2'),
        (params, context) async => context.params = const {'too': 'late'},
      );
      await h.initialize();
      h.sendNotification(r'$/note2');
      expect(await errored.future, isStateError);
    });
  });

  group('multicast notifications share one sealed request', () {
    test('every multicast handler sees params already sealed', () async {
      final errors = <Object>[];
      h.connection.onError = (e, _) => errors.add(e);
      const method = _CustomMethod(r'$/multi');
      h.connection.registerCustomNotificationHandler(
        method,
        (params, context) async => context.params = const {'a': 1},
      );
      h.connection.registerCustomNotificationHandler(
        method,
        (params, context) async => context.params = const {'b': 2},
      );
      final secondDone = Completer<void>();
      h.connection.registerCustomNotificationHandler(
        method,
        (params, context) async => secondDone.complete(),
      );
      await h.initialize();
      h.sendNotification(r'$/multi');
      await secondDone.future;
      expect(errors, hasLength(2));
      expect(errors.every((e) => e is StateError), isTrue);
    });
  });
}
