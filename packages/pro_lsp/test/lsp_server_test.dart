import 'dart:async';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp/pro_lsp_client.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

class _MockFeature extends LspFeature {
  var _isRegistered = false;
  var _isDisposed = false;

  @override
  void register(LspServer server) {
    _isRegistered = true;
  }

  @override
  void dispose() {
    _isDisposed = true;
  }
}

class _AsyncDisposeFeature extends LspFeature {
  var _disposeCompleted = false;

  @override
  void register(LspServer server) {}

  @override
  Future<void> dispose() async {
    await Future<void>.delayed(const Duration(milliseconds: 10));
    _disposeCompleted = true;
  }
}

class _FailingFeature extends LspFeature {
  @override
  void register(LspServer server) {}

  @override
  void dispose() {
    throw StateError('Simulated dispose failure');
  }
}

class _ThrowingRegisterFeature extends LspFeature {
  var _disposeCalled = false;

  @override
  void register(LspServer server) {
    throw StateError('Simulated register failure');
  }

  @override
  void dispose() {
    _disposeCalled = true;
  }
}

void main() {
  group('LspServer Feature Lifecycle', () {
    test(
      'registerFeature registers the feature and close() disposes it',
      () async {
        final controller = StreamChannelController<List<int>>();
        final server = LspServer.fromChannel(controller.local);

        final feature = _MockFeature();
        expect(feature._isRegistered, isFalse);
        expect(feature._isDisposed, isFalse);

        server.registerFeature(feature);
        expect(feature._isRegistered, isTrue);
        expect(feature._isDisposed, isFalse);

        await server.close();
        expect(feature._isDisposed, isTrue);
      },
    );

    test('registerFeature throws StateError after listen()', () async {
      final controller = StreamChannelController<List<int>>();
      final server = LspServer.fromChannel(controller.local);

      // Start listening
      unawaited(server.listen());

      final feature = _MockFeature();
      expect(() => server.registerFeature(feature), throwsStateError);

      await server.close();
    });

    test('registerFeature rolls back if register throws', () async {
      final controller = StreamChannelController<List<int>>();
      final server = LspServer.fromChannel(controller.local);

      final throwingFeature = _ThrowingRegisterFeature();
      expect(
        () => server.registerFeature(throwingFeature),
        throwsStateError,
      );

      // Verify the feature was removed from the server's list by checking
      // that close() does not trigger its dispose()
      await server.close();
      expect(throwingFeature._disposeCalled, isFalse);
    });

    test('close() awaits asynchronous dispose() calls', () async {
      final controller = StreamChannelController<List<int>>();
      final server = LspServer.fromChannel(controller.local);

      final asyncFeature = _AsyncDisposeFeature();
      server.registerFeature(asyncFeature);

      await server.close();
      expect(asyncFeature._disposeCompleted, isTrue);
    });

    test(
      'LspServer close forwards failing feature dispose to onError',
      () async {
        final controller = StreamChannelController<List<int>>();
        final server = LspServer.fromChannel(controller.local);

        final failingFeature = _FailingFeature();
        server.registerFeature(failingFeature);

        Object? caughtError;
        server.onError = (error, stack) {
          caughtError = error;
        };

        await server.close();
        expect(caughtError, isStateError);
      },
    );
  });

  group('LspServer Middlewares', () {
    test('middlewares list is unmodifiable', () {
      final controller = StreamChannelController<List<int>>();
      final server = LspServer.fromChannel(controller.local);

      expect(
        () => server.middlewares.add(
          LspMiddleware.fromFunction((req, next) => next(req)),
        ),
        throwsUnsupportedError,
      );
    });

    test('addMiddleware appends to the middlewares list', () {
      final controller = StreamChannelController<List<int>>();
      final server = LspServer.fromChannel(controller.local);

      final middleware = LspMiddleware.fromFunction((req, next) => next(req));
      server.addMiddleware(middleware);

      expect(server.middlewares, contains(middleware));
    });
  });

  group('LspClient Double Listen', () {
    test('LspClient listen() or start() twice throws StateError', () async {
      final controller = StreamChannelController<List<int>>();
      final client = LspClient.fromChannel(controller.local);

      unawaited(client.listen());

      // Second listen call must throw
      expect(client.listen, throwsStateError);

      await client.close();
    });
  });
}
