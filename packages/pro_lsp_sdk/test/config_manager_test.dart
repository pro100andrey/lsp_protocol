import 'dart:async';

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
  });
}
