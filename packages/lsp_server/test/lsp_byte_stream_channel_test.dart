import 'dart:async';
import 'dart:convert';
import 'package:lsp_server/lsp_server.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspByteStreamChannel', () {
    late StreamController<List<int>> incomingController;
    late StreamController<List<int>> outgoingController;
    late StreamChannel<List<int>> byteChannel;
    late StreamChannel<String> lspChannel;

    setUp(() {
      incomingController = StreamController<List<int>>.broadcast();
      outgoingController = StreamController<List<int>>.broadcast();
      byteChannel = StreamChannel<List<int>>(
        incomingController.stream,
        outgoingController.sink,
      );
      lspChannel = LspByteStreamChannel.fromByteChannel(byteChannel);
    });

    tearDown(() async {
      await incomingController.close();
      await outgoingController.close();
    });

    test('parses a standard message with Content-Length', () async {
      final message = '{"jsonrpc":"2.0","method":"test"}';
      final bodyBytes = utf8.encode(message);
      final headerStr = 'Content-Length: ${bodyBytes.length}\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      final List<String> received = [];
      final done = lspChannel.stream.forEach(received.add);

      incomingController.add([...headerBytes, ...bodyBytes]);
      await incomingController.close();
      await done;

      expect(received, hasLength(1));
      expect(received[0], message);
    });

    test('parses a message with lowercase content-length', () async {
      final message = '{"jsonrpc":"2.0","method":"test-lower"}';
      final bodyBytes = utf8.encode(message);
      final headerStr = 'content-length: ${bodyBytes.length}\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      final List<String> received = [];
      final done = lspChannel.stream.forEach(received.add);

      incomingController.add([...headerBytes, ...bodyBytes]);
      await incomingController.close();
      await done;

      expect(received, hasLength(1));
      expect(received[0], message);
    });

    test('parses multiple headers in framing', () async {
      final message = '{"jsonrpc":"2.0","method":"test-multi-headers"}';
      final bodyBytes = utf8.encode(message);
      final headerStr =
          'Content-Type: application/vscode-jsonrpc; charset=utf-8\r\n'
          'Content-Length: ${bodyBytes.length}\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      final List<String> received = [];
      final done = lspChannel.stream.forEach(received.add);

      incomingController.add([...headerBytes, ...bodyBytes]);
      await incomingController.close();
      await done;

      expect(received, hasLength(1));
      expect(received[0], message);
    });

    test('parses multiple sequential messages', () async {
      final message1 = '{"id":1,"method":"first"}';
      final message2 = '{"id":2,"method":"second"}';

      final bodyBytes1 = utf8.encode(message1);
      final headerStr1 = 'Content-Length: ${bodyBytes1.length}\r\n\r\n';
      final frame1 = [...ascii.encode(headerStr1), ...bodyBytes1];

      final bodyBytes2 = utf8.encode(message2);
      final headerStr2 = 'Content-Length: ${bodyBytes2.length}\r\n\r\n';
      final frame2 = [...ascii.encode(headerStr2), ...bodyBytes2];

      final List<String> received = [];
      final done = lspChannel.stream.forEach(received.add);

      // Send in parts to test buffer accumulation
      incomingController.add(frame1.sublist(0, 10));
      incomingController.add(frame1.sublist(10));
      incomingController.add(frame2);

      await incomingController.close();
      await done;

      expect(received, hasLength(2));
      expect(received[0], message1);
      expect(received[1], message2);
    });

    test('encodes and writes outgoing messages with header', () async {
      final message = '{"jsonrpc":"2.0","result":"ok"}';
      final List<List<int>> writtenBytesList = [];
      outgoingController.stream.listen(writtenBytesList.add);

      lspChannel.sink.add(message);
      await lspChannel.sink.close();

      // Concatenate all chunks written to the channel
      final allBytes = writtenBytesList.expand((x) => x).toList();
      final decoded = utf8.decode(allBytes);

      final bodyBytes = utf8.encode(message);
      final expectedHeader = 'Content-Length: ${bodyBytes.length}\r\n\r\n';

      expect(decoded, '$expectedHeader$message');
    });
  });
}
