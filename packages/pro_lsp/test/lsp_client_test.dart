import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspClient handshake', () {
    test(
      'start performs the handshake and records server capabilities',
      () async {
        final controller = StreamChannelController<List<int>>();
        final server = LspServer.fromChannel(controller.local)
          ..general.onInitialize(
            (params, context) async => const InitializeResult(
              capabilities: ServerCapabilities(hoverProvider: .bool(true)),
              serverInfo: ServerInfo(name: 'test-server', version: '1.0.0'),
            ),
          );
        unawaited(server.listen());
        addTearDown(server.close);

        final client = LspClient.fromChannel(controller.foreign);
        final result = await client.start(
          capabilities: const ClientCapabilities(),
          clientInfo: const ClientInfo(name: 'test-client', version: '0.1.0'),
          processId: 4321,
          initializationOptions: <String, dynamic>{'trace': 'verbose'},
        );

        expect(result.serverInfo?.name, 'test-server');
        expect(client.serverCapabilities, isNotNull);
        expect(client.serverCapabilities?.hoverProvider, isNotNull);

        await client.close();
      },
    );

    test('start rethrows when the server rejects initialize', () async {
      final controller = StreamChannelController<List<int>>();
      final server = LspServer.fromChannel(controller.local)
        ..general.onInitialize(
          (params, context) async =>
              throw LspException.internalError('init refused'),
        );
      unawaited(server.listen());
      addTearDown(server.close);

      final client = LspClient.fromChannel(controller.foreign);

      await expectLater(
        client.start(capabilities: const ClientCapabilities()),
        throwsA(
          isA<LspException>().having(
            (e) => e.code,
            'code',
            LspErrorCodes.internalError,
          ),
        ),
      );

      // The failed handshake must leave the client able to be closed cleanly.
      await client.close();
    });

    test(
      'client receives server→client notifications after the handshake',
      () async {
        final controller = StreamChannelController<List<int>>();
        final server = LspServer.fromChannel(controller.local)
          ..general.onInitialize(
            (params, context) async =>
                const InitializeResult(capabilities: ServerCapabilities()),
          );
        unawaited(server.listen());
        addTearDown(server.close);

        final received = Completer<PublishDiagnosticsParams>();
        final client = LspClient.fromChannel(controller.foreign)
          ..textDocument.onPublishDiagnostics((params, context) async {
            received.complete(params);
          });

        await client.start(capabilities: const ClientCapabilities());

        // After start() the client's own connection must be `initialized`,
        // otherwise _verifyState rejects every incoming server→client message.
        expect(client.state, LspState.initialized);

        server.client.textDocument.publishDiagnostics(
          const PublishDiagnosticsParams(
            uri: 'file:///main.dart',
            diagnostics: [],
          ),
        );

        final params = await received.future.timeout(
          const Duration(seconds: 5),
        );
        expect(params.uri, 'file:///main.dart');

        await client.close();
      },
    );

    test('start twice throws StateError', () async {
      final controller = StreamChannelController<List<int>>();
      final server = LspServer.fromChannel(controller.local)
        ..general.onInitialize(
          (params, context) async =>
              const InitializeResult(capabilities: ServerCapabilities()),
        );
      unawaited(server.listen());
      addTearDown(server.close);

      final client = LspClient.fromChannel(controller.foreign);
      await client.start(capabilities: const ClientCapabilities());

      await expectLater(
        client.start(capabilities: const ClientCapabilities()),
        throwsStateError,
      );

      await client.close();
    });
  });

  group('LspClient delegation', () {
    late StreamChannelController<List<int>> controller;
    late LspClient client;

    setUp(() {
      controller = StreamChannelController<List<int>>();
      client = LspClient.fromChannel(controller.local);
    });

    tearDown(() => client.close());

    test('state reflects the underlying connection', () {
      expect(client.state, LspState.uninitialized);
    });

    test('addMiddleware adds to the unmodifiable middlewares list', () {
      final middleware = LspMiddleware.fromFunction((req, next) => next(req));
      client.addMiddleware(middleware);

      expect(client.middlewares, contains(middleware));
      expect(
        () => client.middlewares.add(middleware),
        throwsUnsupportedError,
      );
    });

    test('onError getter returns the configured callback', () {
      void handler(Object error, StackTrace stack) {}
      client.onError = handler;
      expect(client.onError, same(handler));
    });

    test('listen twice throws StateError', () {
      unawaited(client.listen());
      expect(client.listen, throwsStateError);
    });
  });
}
