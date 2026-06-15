import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspConfigurationManager', () {
    late StreamController<List<int>> clientIncoming;
    late StreamController<List<int>> clientOutgoing;
    late StreamChannel<List<int>> serverChannel;
    late LspServer server;
    late LspConfigurationManager config;

    setUp(() {
      clientIncoming = StreamController<List<int>>.broadcast();
      clientOutgoing = StreamController<List<int>>.broadcast();
      serverChannel = StreamChannel<List<int>>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      server = LspServer.fromChannel(serverChannel);
      config = LspConfigurationManager();
    });

    tearDown(() async {
      await config.dispose();
      await server.close();
      await clientIncoming.close();
      await clientOutgoing.close();
    });

    test('close() closes the change stream', () async {
      final done = Completer<void>();
      config.onChange.listen(
        (event) {},
        onDone: done.complete,
      );

      await config.dispose();

      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(done.isCompleted, isTrue);
    });

    test('onChange stream exists and is broadcast', () {
      var emitted = 0;
      config.onChange.listen((event) => emitted++);
      config.onChange.listen((event) => emitted++);

      // Should be able to listen multiple times (broadcast)
      expect(emitted, 0);
    });

    test('getSection cooldown and invalidation on failure', () async {
      var requestCount = 0;
      final sub = clientOutgoing.stream.listen((bytes) {
        final raw = utf8.decode(bytes);
        if (raw.contains('"method":"workspace/configuration"')) {
          requestCount++;
          // Find the ID
          final idMatch = RegExp(r'"id":\s*(\d+)').firstMatch(raw);
          if (idMatch != null) {
            final id = idMatch.group(1);
            final resp =
                '{"jsonrpc":"2.0","id":$id,'
                '"error":{"code":-32601,"message":"Unsupported"}}';
            clientIncoming.add(
              utf8.encode('Content-Length: ${resp.length}\r\n\r\n$resp'),
            );
          }
        }
      });

      server.general.onInitialize(
        (params, _) async =>
            const InitializeResult(capabilities: ServerCapabilities()),
      );

      server.registerFeature(config);
      unawaited(server.listen());

      // Send initialize request from client to transition state to initialized
      const initReq =
          '{"jsonrpc":"2.0","id":1,"method":"initialize",'
          '"params":{"capabilities":{},"processId":null,"rootUri":null,'
          '"workspaceFolders":null}}';
      clientIncoming.add(
        utf8.encode('Content-Length: ${initReq.length}\r\n\r\n$initReq'),
      );

      // Wait a moment for initialize to complete and state to transition
      await Future<void>.delayed(const Duration(milliseconds: 50));

      // First call: fails (should request client)
      final val1 = await config.getSection<bool>('testSection');
      expect(val1, isNull);
      expect(requestCount, 1);

      // Second call: on cooldown (should NOT request client)
      final val2 = await config.getSection<bool>('testSection');
      expect(val2, isNull);
      expect(requestCount, 1);

      // Invalidate configuration
      const changeNotification =
          '{"jsonrpc":"2.0","method":"workspace/didChangeConfiguration","params":{}}';
      clientIncoming.add(
        utf8.encode(
          'Content-Length: ${changeNotification.length}'
          '\r\n\r\n$changeNotification',
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      // Third call: cooldown cleared, should request client again
      final val3 = await config.getSection<bool>('testSection');
      expect(val3, isNull);
      expect(requestCount, 2);

      await sub.cancel();
    });

    test('dispose() cancels server notification subscription', () async {
      server.general.onInitialize(
        (params, _) async =>
            const InitializeResult(capabilities: ServerCapabilities()),
      );

      server.registerFeature(config);
      unawaited(server.listen());

      // Send initialize to transition state
      const initReq =
          '{"jsonrpc":"2.0","id":1,"method":"initialize",'
          '"params":{"capabilities":{},"processId":null,"rootUri":null,'
          '"workspaceFolders":null}}';
      clientIncoming.add(
        utf8.encode('Content-Length: ${initReq.length}\r\n\r\n$initReq'),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      // Dispose the config
      await config.dispose();

      // Now send workspace/didChangeConfiguration, should NOT trigger onChange stream
      var onChangeTriggered = false;
      final sub = config.onChange.listen((_) => onChangeTriggered = true);

      const changeNotification =
          '{"jsonrpc":"2.0","method":"workspace/didChangeConfiguration","params":{}}';
      clientIncoming.add(
        utf8.encode(
          'Content-Length: ${changeNotification.length}'
          '\r\n\r\n$changeNotification',
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(onChangeTriggered, isFalse);
      await sub.cancel();
    });

    test('getSection de-duplicates concurrent in-flight requests', () async {
      var requestCount = 0;
      final sub = clientOutgoing.stream.listen((bytes) {
        final raw = utf8.decode(bytes);
        if (raw.contains('"method":"workspace/configuration"')) {
          requestCount++;
          final idMatch = RegExp(r'"id":\s*(\d+)').firstMatch(raw);
          if (idMatch != null) {
            final id = idMatch.group(1);
            // Wait 20ms before sending response to keep it in-flight
            Future.delayed(const Duration(milliseconds: 20), () {
              final resp =
                  '{"jsonrpc":"2.0","id":$id,"result":[{"tabSize":4}]}';
              clientIncoming.add(
                utf8.encode('Content-Length: ${resp.length}\r\n\r\n$resp'),
              );
            });
          }
        }
      });

      server.general.onInitialize(
        (params, _) async =>
            const InitializeResult(capabilities: ServerCapabilities()),
      );

      server.registerFeature(config);
      unawaited(server.listen());

      // Transition to initialized
      const initReq =
          '{"jsonrpc":"2.0","id":1,"method":"initialize",'
          '"params":{"capabilities":{},"processId":null,"rootUri":null,'
          '"workspaceFolders":null}}';
      clientIncoming.add(
        utf8.encode('Content-Length: ${initReq.length}\r\n\r\n$initReq'),
      );
      await Future<void>.delayed(const Duration(milliseconds: 10));

      // Trigger two concurrent requests
      final futures = await Future.wait([
        config.getSection<Map<String, dynamic>>('editor'),
        config.getSection<Map<String, dynamic>>('editor'),
      ]);

      expect(futures[0], equals({'tabSize': 4}));
      expect(futures[1], equals({'tabSize': 4}));
      expect(requestCount, 1); // Only one network request was triggered

      await sub.cancel();
    });

    test(
      'getSection supports scopeUri and tracks them independently',
      () async {
        final requestedScopes = <String?>[];
        final sub = clientOutgoing.stream.listen((bytes) {
          final raw = utf8.decode(bytes);
          if (raw.contains('"method":"workspace/configuration"')) {
            final scopeMatch =
                RegExp(r'"scopeUri":\s*"([^"]+)"').firstMatch(raw);
            requestedScopes.add(scopeMatch?.group(1));

            final idMatch = RegExp(r'"id":\s*(\d+)').firstMatch(raw);
            if (idMatch != null) {
              final id = idMatch.group(1);
              final val = scopeMatch != null ? scopeMatch.group(1) : 'global';
              final resp =
                  '{"jsonrpc":"2.0","id":$id,"result":["value-$val"]}';
              clientIncoming.add(
                utf8.encode('Content-Length: ${resp.length}\r\n\r\n$resp'),
              );
            }
          }
        });

        server.general.onInitialize(
          (params, _) async =>
              const InitializeResult(capabilities: ServerCapabilities()),
        );

        server.registerFeature(config);
        unawaited(server.listen());

        // Transition to initialized
        const initReq =
            '{"jsonrpc":"2.0","id":1,"method":"initialize",'
            '"params":{"capabilities":{},"processId":null,"rootUri":null,'
            '"workspaceFolders":null}}';
        clientIncoming.add(
          utf8.encode('Content-Length: ${initReq.length}\r\n\r\n$initReq'),
        );
        await Future<void>.delayed(const Duration(milliseconds: 10));

        // Query global and scoped configs
        final valGlobal = await config.getSection<String>('editor');
        final valDocA = await config.getSection<String>(
          'editor',
          scopeUri: 'file:///a.dart',
        );
        final valDocB = await config.getSection<String>(
          'editor',
          scopeUri: 'file:///b.dart',
        );

      expect(valGlobal, equals('value-global'));
      expect(valDocA, equals('value-file:///a.dart'));
      expect(valDocB, equals('value-file:///b.dart'));

      expect(requestedScopes, equals([null, 'file:///a.dart', 'file:///b.dart']));

      await sub.cancel();
    });
  });
}
