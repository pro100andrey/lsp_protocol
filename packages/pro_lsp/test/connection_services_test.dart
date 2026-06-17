import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

final class _Service {
  _Service(this.name);
  final String name;
}

final class _Other {}

void main() {
  group('LspConnection service container', () {
    late ConnectionHarness h;

    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    test('resolve returns a registered service', () {
      h.connection.register(_Service('db'));
      expect(h.connection.resolve<_Service>().name, 'db');
    });

    test('tryResolve returns null for an unregistered type', () {
      expect(h.connection.tryResolve<_Other>(), isNull);
      h.connection.register(_Other());
      expect(h.connection.tryResolve<_Other>(), isNotNull);
    });

    test('resolve throws StateError for an unregistered type', () {
      expect(h.connection.resolve<_Other>, throwsStateError);
    });

    test('registering the same type overwrites the previous service', () {
      h.connection
        ..register(_Service('first'))
        ..register(_Service('second'));
      expect(h.connection.resolve<_Service>().name, 'second');
    });
  });

  group('LspConnection introspection', () {
    late ConnectionHarness h;

    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    test('registeredMethods reflects registrations and is unmodifiable', () {
      expect(
        h.connection.registeredMethods,
        contains(NotificationMethod.cancelRequest),
      );

      h.connection.registerRequestHandler(
        RequestMethod.hover,
        (params, context) async => null,
      );
      expect(h.connection.registeredMethods, contains(RequestMethod.hover));

      expect(
        () => h.connection.registeredMethods.add(RequestMethod.definition),
        throwsUnsupportedError,
      );
    });

    test('middlewares getter is unmodifiable', () {
      expect(
        () => h.connection.middlewares.add(
          LspMiddleware.fromFunction((req, next) => next(req)),
        ),
        throwsUnsupportedError,
      );
    });
  });
}
