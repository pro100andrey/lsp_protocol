import 'dart:async';
import 'dart:convert';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspDocument', () {
    test('stores uri, languageId, version, and text', () {
      final doc = LspDocument(
        uri: 'file:///test.dart',
        languageId: 'dart',
        version: 1,
        text: 'void main() {}',
      );

      expect(doc.uri, 'file:///test.dart');
      expect(doc.languageId, 'dart');
      expect(doc.version, 1);
      expect(doc.text, 'void main() {}');
    });

    group('lines', () {
      test('returns split lines', () {
        final doc = LspDocument(
          uri: 'file:///test.dart',
          languageId: 'dart',
          version: 1,
          text: 'line1\nline2\nline3',
        );

        expect(doc.lines, ['line1', 'line2', 'line3']);
      });

      test(r'handles Windows \r\n line endings correctly', () {
        final doc = LspDocument(
          uri: 'file:///test.dart',
          languageId: 'dart',
          version: 1,
          text: 'line1\r\nline2\r\nline3',
        );

        expect(doc.lines, ['line1', 'line2', 'line3']);
      });

      test('caches the result', () {
        final doc = LspDocument(
          uri: 'file:///test.dart',
          languageId: 'dart',
          version: 1,
          text: 'a\nb\nc',
        );

        final lines1 = doc.lines;
        final lines2 = doc.lines;
        expect(identical(lines1, lines2), isTrue);
      });

      test('single line returns one element', () {
        final doc = LspDocument(
          uri: 'file:///test.dart',
          languageId: 'dart',
          version: 1,
          text: 'single',
        );

        expect(doc.lines, ['single']);
      });

      test('empty text returns empty list', () {
        final doc = LspDocument(
          uri: 'file:///test.dart',
          languageId: 'dart',
          version: 1,
          text: '',
        );

        expect(doc.lines, ['']);
      });

      test('trailing newline produces empty last element', () {
        final doc = LspDocument(
          uri: 'file:///test.dart',
          languageId: 'dart',
          version: 1,
          text: 'line1\nline2\n',
        );

        expect(doc.lines, ['line1', 'line2', '']);
      });
    });
  });

  group('TextDocumentManager', () {
    test('get returns null for unknown uri', () {
      final manager = TextDocumentManager();
      expect(manager.get('file:///unknown.dart'), isNull);
    });

    test('all returns empty list when no documents', () {
      final manager = TextDocumentManager();
      expect(manager.all, isEmpty);
    });

    test('unbind() cancels registrations on server', () async {
      final clientIncoming = StreamController<List<int>>.broadcast();
      final clientOutgoing = StreamController<List<int>>.broadcast();
      final serverChannel = StreamChannel<List<int>>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      final server = LspServer.fromChannel(serverChannel);
      final manager = TextDocumentManager();

      server.general.onInitialize(
        (params, _) => Future.value(
          const InitializeResult(capabilities: ServerCapabilities()),
        ),
      );

      unawaited(server.listen());
      manager.bind(server);

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
      manager.unbind();

      // Send didOpen notification
      const openReq =
          '{"jsonrpc":"2.0","method":"textDocument/didOpen",'
          '"params":{"textDocument":{"uri":"file:///test.dart","languageId":"dart","version":1,"text":"void main() {}"}}}';
      clientIncoming.add(
        utf8.encode('Content-Length: ${openReq.length}\r\n\r\n$openReq'),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(manager.get('file:///test.dart'), isNull);

      manager.close();
      await server.close();
      await clientIncoming.close();
      await clientOutgoing.close();
    });
  });
}
