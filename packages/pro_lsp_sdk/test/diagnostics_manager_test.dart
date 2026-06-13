import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('DiagnosticsManager', () {
    late StreamController<List<int>> clientIncoming;
    late StreamController<List<int>> clientOutgoing;
    late StreamChannel<List<int>> serverChannel;
    late LspServer server;
    late DiagnosticsManager diagnostics;
    late StreamChannel<Object?> clientLspChannel;
    late Stream<Map<String, dynamic>> clientLspStream;

    setUp(() {
      clientIncoming = StreamController<List<int>>.broadcast();
      clientOutgoing = StreamController<List<int>>.broadcast();
      serverChannel = StreamChannel<List<int>>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      server = LspServer.fromChannel(serverChannel);
      diagnostics = DiagnosticsManager(server);

      final clientByteChannel = StreamChannel<List<int>>(
        clientOutgoing.stream,
        clientIncoming.sink,
      );
      clientLspChannel = LspByteStreamChannel.fromByteChannel(
        clientByteChannel,
      );
      clientLspStream = clientLspChannel.stream
          .cast<Map<String, dynamic>>()
          .asBroadcastStream();
    });

    tearDown(() async {
      diagnostics.close();
      await server.close();
      await clientIncoming.close();
      await clientOutgoing.close();
    });

    test('close() cancels all timers', () {
      // Publish a diagnostic with a long debounce
      diagnostics
        ..debounceDuration = const Duration(seconds: 10)
        ..publish('file:///test.dart', [
          const Diagnostic(
            range: Range(
              start: Position(line: 0, character: 0),
              end: Position(line: 0, character: 5),
            ),
            message: 'error',
          ),
        ])
        // Close should cancel the timer
        ..close();
    });

    test('multiple URIs are tracked independently', () async {
      final messages = <Map<String, dynamic>>[];
      final sub = clientLspStream.listen(messages.add);

      // Publish diagnostics for two different URIs with short debounce
      diagnostics
        ..debounceDuration = const Duration(milliseconds: 10)
        ..publish('file:///a.dart', [
          const Diagnostic(
            range: Range(
              start: Position(line: 0, character: 0),
              end: Position(line: 0, character: 5),
            ),
            message: 'error a',
          ),
        ])
        ..publish('file:///b.dart', [
          const Diagnostic(
            range: Range(
              start: Position(line: 1, character: 0),
              end: Position(line: 1, character: 10),
            ),
            message: 'error b',
          ),
        ]);

      // Wait for debounce
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await sub.cancel();

      expect(messages, hasLength(2));

      final msgA = messages[0];
      final msgB = messages[1];

      final paramsA = msgA['params'] as Map<String, dynamic>;
      final paramsB = msgB['params'] as Map<String, dynamic>;

      expect(paramsA['uri'], 'file:///a.dart');
      expect(paramsB['uri'], 'file:///b.dart');
    });

    test('clearing after publish sends empty diagnostics', () async {
      final messages = <Map<String, dynamic>>[];
      final sub = clientLspStream.listen(messages.add);

      diagnostics
        ..debounceDuration = const Duration(milliseconds: 10)
        ..publish('file:///test.dart', [
          const Diagnostic(
            range: Range(
              start: Position(line: 0, character: 0),
              end: Position(line: 0, character: 5),
            ),
            message: 'error',
          ),
        ])
        // Clear immediately (before debounce fires)
        ..clear('file:///test.dart');

      await Future<void>.delayed(const Duration(milliseconds: 50));
      await sub.cancel();

      expect(messages, hasLength(1));
      final msg = messages.first;
      final params = msg['params'] as Map<String, dynamic>;
      expect(params['diagnostics'], isEmpty);
    });

    test('publish with zero debounce sends immediately', () async {
      final messages = <Map<String, dynamic>>[];
      final sub = clientLspStream.listen(messages.add);

      diagnostics
        ..debounceDuration = Duration.zero
        ..publish('file:///test.dart', [
          const Diagnostic(
            range: Range(
              start: Position(line: 0, character: 0),
              end: Position(line: 0, character: 5),
            ),
            message: 'error',
          ),
        ]);

      // Wait a tiny bit for the zero-duration timer
      await Future<void>.delayed(const Duration(milliseconds: 5));
      await sub.cancel();

      expect(messages, hasLength(1));
    });
  });
}
