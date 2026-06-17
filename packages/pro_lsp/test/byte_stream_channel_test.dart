import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspByteStreamChannel', () {
    late StreamController<List<int>> incomingController;
    late StreamController<List<int>> outgoingController;
    late StreamChannel<List<int>> byteChannel;
    late StreamChannel<Object?> lspChannel;
    late LspByteStreamChannelResult result;

    setUp(() {
      incomingController = StreamController<List<int>>.broadcast();
      outgoingController = StreamController<List<int>>.broadcast();
      byteChannel = StreamChannel<List<int>>(
        incomingController.stream,
        outgoingController.sink,
      );
      result = LspByteStreamChannel.fromByteChannel(byteChannel);
      lspChannel = result.channel;
    });

    tearDown(() async {
      await incomingController.close();
      await outgoingController.close();
    });

    test('parses a standard message with Content-Length', () async {
      const message = '{"jsonrpc":"2.0","method":"test"}';
      final bodyBytes = utf8.encode(message);
      final headerStr = 'Content-Length: ${bodyBytes.length}\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      final received = <Object?>[];
      final done = lspChannel.stream.forEach(received.add);

      incomingController.add([...headerBytes, ...bodyBytes]);
      await incomingController.close();
      await done;

      expect(received, hasLength(1));
      expect(received[0], jsonDecode(message));
    });

    test('parses a message with lowercase content-length', () async {
      const message = '{"jsonrpc":"2.0","method":"test-lower"}';
      final bodyBytes = utf8.encode(message);
      final headerStr = 'content-length: ${bodyBytes.length}\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      final received = <Object?>[];
      final done = lspChannel.stream.forEach(received.add);

      incomingController.add([...headerBytes, ...bodyBytes]);
      await incomingController.close();
      await done;

      expect(received, hasLength(1));
      expect(received[0], jsonDecode(message));
    });

    test('parses multiple headers in framing', () async {
      const message = '{"jsonrpc":"2.0","method":"test-multi-headers"}';
      final bodyBytes = utf8.encode(message);
      final headerStr =
          'Content-Type: application/vscode-jsonrpc; charset=utf-8\r\n'
          'Content-Length: ${bodyBytes.length}\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      final received = <Object?>[];
      final done = lspChannel.stream.forEach(received.add);

      incomingController.add([...headerBytes, ...bodyBytes]);
      await incomingController.close();
      await done;

      expect(received, hasLength(1));
      expect(received[0], jsonDecode(message));
    });

    test('parses multiple sequential messages', () async {
      const message1 = '{"id":1,"method":"first"}';
      const message2 = '{"id":2,"method":"second"}';

      final bodyBytes1 = utf8.encode(message1);
      final headerStr1 = 'Content-Length: ${bodyBytes1.length}\r\n\r\n';
      final frame1 = [...ascii.encode(headerStr1), ...bodyBytes1];

      final bodyBytes2 = utf8.encode(message2);
      final headerStr2 = 'Content-Length: ${bodyBytes2.length}\r\n\r\n';
      final frame2 = [...ascii.encode(headerStr2), ...bodyBytes2];

      final received = <Object?>[];
      final done = lspChannel.stream.forEach(received.add);

      // Send in parts to test buffer accumulation
      incomingController
        ..add(frame1.sublist(0, 10))
        ..add(frame1.sublist(10))
        ..add(frame2);

      await incomingController.close();
      await done;

      expect(received, hasLength(2));
      expect(received[0], jsonDecode(message1));
      expect(received[1], jsonDecode(message2));
    });

    test('encodes and writes outgoing messages with header', () async {
      const messageMap = {'jsonrpc': '2.0', 'result': 'ok'};
      final message = jsonEncode(messageMap);
      final writtenBytesList = <List<int>>[];
      outgoingController.stream.listen(writtenBytesList.add);

      lspChannel.sink.add(messageMap);
      await lspChannel.sink.close();

      // Concatenate all chunks written to the channel
      final allBytes = writtenBytesList.expand((x) => x).toList();
      final decoded = utf8.decode(allBytes);

      final bodyBytes = utf8.encode(message);
      final expectedHeader = 'Content-Length: ${bodyBytes.length}\r\n\r\n';

      expect(decoded, '$expectedHeader$message');
    });

    test('throws FormatException and cancels subscription '
        'if Content-Length exceeds limit', () async {
      const headerStr = 'Content-Length: 52428801\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      Object? caughtError;
      final completer = Completer<void>();
      lspChannel.stream.listen(
        (_) {},
        onError: (Object e) {
          caughtError = e;
        },
        onDone: completer.complete,
      );

      incomingController.add(headerBytes);
      await incomingController.close();

      await completer.future;
      expect(
        caughtError,
        isA<FormatException>().having(
          (e) => e.toString(),
          'message',
          contains('exceeds limit'),
        ),
      );
    });

    test('throws FormatException and cancels subscription '
        'on malformed header', () async {
      const headerStr = 'Content-Length: abc\r\n\r\n';
      final headerBytes = ascii.encode(headerStr);

      Object? caughtError;
      final completer = Completer<void>();
      lspChannel.stream.listen(
        (_) {},
        onError: (Object e) {
          caughtError = e;
        },
        onDone: completer.complete,
      );

      incomingController.add(headerBytes);
      await incomingController.close();

      await completer.future;
      expect(caughtError, isA<FormatException>());
    });

    test(
      'parses a large message that outgrows the initial 4KB buffer',
      () async {
        final message = jsonEncode(<String, dynamic>{
          'jsonrpc': '2.0',
          'method': 'big',
          'params': <String, dynamic>{'data': 'x' * 10000},
        });
        final bodyBytes = utf8.encode(message);
        final frame = [
          ...ascii.encode('Content-Length: ${bodyBytes.length}\r\n\r\n'),
          ...bodyBytes,
        ];

        final received = <Object?>[];
        final done = lspChannel.stream.forEach(received.add);

        // Feed in small chunks to force buffer growth and compaction.
        for (var i = 0; i < frame.length; i += 1000) {
          incomingController.add(
            frame.sublist(i, math.min(i + 1000, frame.length)),
          );
        }
        await incomingController.close();
        await done;

        expect(received, hasLength(1));
        expect(received[0], jsonDecode(message));
      },
    );

    test(
      'emits a FormatException for an invalid body but keeps parsing',
      () async {
        const bad = '{not valid json';
        final badBody = utf8.encode(bad);
        final badFrame = [
          ...ascii.encode('Content-Length: ${badBody.length}\r\n\r\n'),
          ...badBody,
        ];

        const good = '{"jsonrpc":"2.0","method":"recovered"}';
        final goodBody = utf8.encode(good);
        final goodFrame = [
          ...ascii.encode('Content-Length: ${goodBody.length}\r\n\r\n'),
          ...goodBody,
        ];

        final received = <Object?>[];
        final errors = <Object>[];
        final done = Completer<void>();
        lspChannel.stream.listen(
          received.add,
          onError: errors.add,
          onDone: done.complete,
        );

        incomingController
          ..add(badFrame)
          ..add(goodFrame);
        await incomingController.close();
        await done.future;

        expect(errors, hasLength(1));
        expect(errors.single, isA<FormatException>());
        // The parser recovers and still delivers the following valid message.
        expect(received, [jsonDecode(good)]);
      },
    );

    test('sink.addStream frames every message', () async {
      final written = <List<int>>[];
      outgoingController.stream.listen(written.add);

      await lspChannel.sink.addStream(
        Stream<Object?>.fromIterable(<Object?>[
          <String, dynamic>{'id': 1},
          <String, dynamic>{'id': 2},
        ]),
      );

      final decoded = utf8.decode(written.expand((x) => x).toList());
      expect(RegExp('Content-Length:').allMatches(decoded), hasLength(2));
      expect(decoded, contains('"id":1'));
      expect(decoded, contains('"id":2'));
    });

    test('sink.addError forwards to the underlying byte sink', () async {
      final gotError = Completer<Object>();
      outgoingController.stream.listen(
        (_) {},
        onError: gotError.complete,
      );

      lspChannel.sink.addError(const FormatException('boom'));

      expect(await gotError.future, isA<FormatException>());
    });
  });
}
