import 'dart:async';
import 'dart:io';

import 'package:lsp_test_server/src/server_runner.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('lsp_test_server handshake', () {
    tearDown(() {
      // FileLoggingFeature writes to ./.lsp_server.log; keep the tree clean.
      final log = File('.lsp_server.log');
      if (log.existsSync()) {
        log.deleteSync();
      }
    });

    test('initialize advertises capabilities inferred from handlers', () async {
      final controller = StreamChannelController<List<int>>();
      final runner = ServerRunner.fromChannel(controller.local);
      final client = LspClient.fromChannel(controller.foreign);

      unawaited(runner.run());

      final result = await client.start(
        capabilities: const ClientCapabilities(),
      );

      final caps = result.capabilities;

      // Providers derived from registered handlers.
      expect(caps.hoverProvider, isNotNull);
      expect(caps.definitionProvider, isNotNull);
      expect(caps.referencesProvider, isNotNull);
      expect(caps.documentSymbolProvider, isNotNull);
      expect(caps.completionProvider, isNotNull);

      // Filled in by inferCapabilities: sync mode (default) and the semantic
      // tokens provider (from the supplied legend).
      expect(caps.textDocumentSync, isNotNull);
      expect(caps.semanticTokensProvider, isNotNull);

      expect(result.serverInfo?.name, 'lsp-test-server');
      expect(client.serverCapabilities, isNotNull);

      await client.close();
    });
  });
}
