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
      config = LspConfigurationManager(server);
    });

    tearDown(() async {
      config.close();
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

      config.close();

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

      unawaited(server.listen());
      config.bind();

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

    test('unbind() cancels server notification subscription', () async {
      server.general.onInitialize(
        (params, _) async =>
            const InitializeResult(capabilities: ServerCapabilities()),
      );

      unawaited(server.listen());
      config.bind();

      // Send initialize to transition state
      const initReq =
          '{"jsonrpc":"2.0","id":1,"method":"initialize",'
          '"params":{"capabilities":{},"processId":null,"rootUri":null,'
          '"workspaceFolders":null}}';
      clientIncoming.add(
        utf8.encode('Content-Length: ${initReq.length}\r\n\r\n$initReq'),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      // Unbind
      config.unbind();

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
  });
}
