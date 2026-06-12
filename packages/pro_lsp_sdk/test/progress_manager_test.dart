import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspProgress', () {
    late StreamController<List<int>> clientIncoming;
    late StreamController<List<int>> clientOutgoing;
    late StreamChannel<List<int>> serverChannel;
    late LspConnection connection;
    late StreamChannel<String> clientLspChannel;
    late Stream<String> clientLspStream;

    setUp(() {
      clientIncoming = StreamController<List<int>>.broadcast();
      clientOutgoing = StreamController<List<int>>.broadcast();
      serverChannel = StreamChannel<List<int>>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      final lspChannel = LspByteStreamChannel.fromByteChannel(serverChannel);
      connection = LspConnection(lspChannel);

      final clientByteChannel = StreamChannel<List<int>>(
        clientOutgoing.stream,
        clientIncoming.sink,
      );
      clientLspChannel = LspByteStreamChannel.fromByteChannel(
        clientByteChannel,
      );
      clientLspStream = clientLspChannel.stream.asBroadcastStream();
    });

    tearDown(() async {
      await connection.close();
      await clientIncoming.close();
      await clientOutgoing.close();
    });

    test('begin sends correct notification', () async {
      final progress = LspProgress(
        connection,
        const ProgressToken.string('token-1'),
      );
      await progress.begin(
        title: 'Building',
        message: 'Compiling...',
        percentage: 50,
        cancellable: true,
      );

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final messages = <String>[];
      final sub = clientLspStream.listen(messages.add);
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await sub.cancel();

      expect(messages, hasLength(1));
      final msg = jsonDecode(messages.first) as Map<String, dynamic>;
      expect(msg['method'], r'$/progress');
      final params = msg['params'] as Map<String, dynamic>;
      expect(params['token'], 'token-1');
      final value = params['value'] as Map<String, dynamic>;
      expect(value['kind'], 'begin');
      expect(value['title'], 'Building');
      expect(value['message'], 'Compiling...');
      expect(value['percentage'], 50);
      expect(value['cancellable'], true);
    });

    test('report sends correct notification', () async {
      final _ = LspProgress(
        connection,
        const ProgressToken.string('token-1'),
      )..report(message: 'Still working...', percentage: 75);

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final messages = <String>[];
      final sub = clientLspStream.listen(messages.add);
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await sub.cancel();

      expect(messages, hasLength(1));
      final msg = jsonDecode(messages.first) as Map<String, dynamic>;
      expect(msg['method'], r'$/progress');
      final params = msg['params'] as Map<String, dynamic>;
      expect(params['token'], 'token-1');
      final value = params['value'] as Map<String, dynamic>;
      expect(value['kind'], 'report');
      expect(value['message'], 'Still working...');
      expect(value['percentage'], 75);
    });

    test('end sends correct notification', () async {
      final _ = LspProgress(
        connection,
        const ProgressToken.string('token-1'),
      )..end(message: 'Done!');

      final messages = <String>[];
      final sub = clientLspStream.listen(messages.add);
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await sub.cancel();

      expect(messages, hasLength(1));
      final msg = jsonDecode(messages.first) as Map<String, dynamic>;
      expect(msg['method'], r'$/progress');
      final params = msg['params'] as Map<String, dynamic>;
      expect(params['token'], 'token-1');
      final value = params['value'] as Map<String, dynamic>;
      expect(value['kind'], 'end');
      expect(value['message'], 'Done!');
    });

    test('begin without optional fields omits them', () async {
      final progress = LspProgress(
        connection,
        const ProgressToken.string('simple-token'),
      );
      await progress.begin(title: 'Simple');

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final messages = <String>[];
      final sub = clientLspStream.listen(messages.add);
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await sub.cancel();

      expect(messages, hasLength(1));
      final msg = jsonDecode(messages.first) as Map<String, dynamic>;
      final value =
          (msg['params'] as Map<String, dynamic>)['value']
              as Map<String, dynamic>;
      expect(value['title'], 'Simple');
      expect(value.containsKey('percentage'), isFalse);
      expect(value.containsKey('cancellable'), isFalse);
    });
  });
}
