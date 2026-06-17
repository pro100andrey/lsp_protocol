import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

void main() {
  group('LspConnection notifications', () {
    late ConnectionHarness h;

    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    /// Registers a request handler and uses a round-trip as a processing
    /// barrier: once its response arrives, all previously-fed notifications
    /// have been handled (messages are processed in order).
    Future<void> barrier() async {
      await h.sendRequest(9999, 'textDocument/hover');
    }

    setUp(() {
      h.connection.registerRequestHandler(
        RequestMethod.hover,
        (params, context) async => null,
      );
    });

    test('invokes a single notification handler', () async {
      final seen = <Object?>[];
      h.connection.registerNotificationHandler(
        NotificationMethod.didChangeConfiguration,
        (params, context) async => seen.add(params),
      );

      await h.initialize();
      h.sendNotification('workspace/didChangeConfiguration', <String, dynamic>{
        'settings': 1,
      });
      await barrier();

      expect(seen, [
        {'settings': 1},
      ]);
    });

    test('multicast: all handlers run in registration order', () async {
      final order = <int>[];
      for (var i = 0; i < 3; i++) {
        h.connection.registerNotificationHandler(
          NotificationMethod.didChangeConfiguration,
          (params, context) async => order.add(i),
        );
      }

      await h.initialize();
      h.sendNotification('workspace/didChangeConfiguration');
      await barrier();

      expect(order, [0, 1, 2]);
    });

    test('the unregister function removes only its own handler', () async {
      final seen = <String>[];
      h.connection.registerNotificationHandler(
        NotificationMethod.didChangeConfiguration,
        (params, context) async => seen.add('first'),
      );
      // The second registration returns the multicast-list unregister closure.
      final removeSecond = h.connection.registerNotificationHandler(
        NotificationMethod.didChangeConfiguration,
        (params, context) async => seen.add('second'),
      );

      removeSecond();

      await h.initialize();
      h.sendNotification('workspace/didChangeConfiguration');
      await barrier();

      expect(seen, ['first']);
    });

    test('removing the last handler clears the method registration', () {
      final remove = h.connection.registerNotificationHandler(
        NotificationMethod.didChangeConfiguration,
        (params, context) async {},
      );
      expect(
        h.connection.registeredMethods,
        contains(NotificationMethod.didChangeConfiguration),
      );

      remove();

      expect(
        h.connection.registeredMethods,
        isNot(contains(NotificationMethod.didChangeConfiguration)),
      );
    });

    test('a throwing handler is isolated and reported via onError', () async {
      final seen = <String>[];
      final errors = <Object>[];
      h.connection.onError = (error, stack) => errors.add(error);

      h.connection
        ..registerNotificationHandler(
          NotificationMethod.didChangeConfiguration,
          (params, context) {
            seen.add('first');
            throw StateError('boom');
          },
        )
        ..registerNotificationHandler(
          NotificationMethod.didChangeConfiguration,
          (params, context) async => seen.add('second'),
        );

      await h.initialize();
      h.sendNotification('workspace/didChangeConfiguration');
      await barrier();

      // The crash in the first handler does not stop the second.
      expect(seen, ['first', 'second']);
      expect(errors, hasLength(1));
      expect(errors.single, isA<StateError>());
    });

    test('notifications pass through middleware', () async {
      final methodsSeen = <String>[];
      h.connection
        ..addMiddleware(
          LspMiddleware.fromFunction((request, next) {
            methodsSeen.add(request.method);
            return next(request);
          }),
        )
        ..registerNotificationHandler(
          NotificationMethod.didChangeConfiguration,
          (params, context) async {},
        );

      await h.initialize();
      h.sendNotification('workspace/didChangeConfiguration');
      await barrier();

      expect(methodsSeen, contains('workspace/didChangeConfiguration'));
    });

    test(
      'handler crashes are isolated even when middleware is present',
      () async {
        final seen = <String>[];
        final errors = <Object>[];
        h.connection.onError = (error, stack) => errors.add(error);

        h.connection
          ..addMiddleware(
            LspMiddleware.fromFunction((request, next) => next(request)),
          )
          ..registerNotificationHandler(
            NotificationMethod.didChangeConfiguration,
            (params, context) {
              seen.add('first');
              throw StateError('boom');
            },
          )
          ..registerNotificationHandler(
            NotificationMethod.didChangeConfiguration,
            (params, context) async => seen.add('second'),
          );

        await h.initialize();
        h.sendNotification('workspace/didChangeConfiguration');
        await barrier();

        expect(seen, ['first', 'second']);
        expect(errors.single, isA<StateError>());
      },
    );
  });
}
