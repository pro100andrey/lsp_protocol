import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart' as log;
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('SemanticTokensBuilder', () {
    test('constructs delta-encoded list correctly', () {
      final builder = SemanticTokensBuilder()
        // Add absolute tokens out of order to test sorting
        ..add(line: 2, char: 5, length: 3, tokenTypeIndex: 1)
        ..add(
          line: 1,
          char: 10,
          length: 5,
          tokenTypeIndex: 2,
          tokenModifiersBitmask: 1,
        )
        ..add(line: 1, char: 2, length: 4, tokenTypeIndex: 0);

      final result = builder.build();

      // Expected sorted:
      // 1. Line 1, Char 2, Len 4, Type 0, Mod 0. DeltaLine=1, DeltaChar=2
      // 2. Line 1, Char 10, Len 5, Type 2, Mod 1. DeltaLine=0, DeltaChar=8
      // 3. Line 2, Char 5, Len 3, Type 1, Mod 0. DeltaLine=1, DeltaChar=5
      expect(result, [
        1,
        2,
        4,
        0,
        0,
        0,
        8,
        5,
        2,
        1,
        1,
        5,
        3,
        1,
        0,
      ]);
    });

    test('addNamed maps types and modifiers correctly', () {
      final builder =
          SemanticTokensBuilder(
            legendTypes: ['class', 'function', 'variable'],
            legendModifiers: ['declaration', 'static'],
          )..addNamed(
            line: 1,
            char: 2,
            length: 4,
            type: 'function',
            modifiers: ['static'],
          );

      final result = builder.build();
      // DeltaLine=1, DeltaChar=2, Length=4, Type=1 (function),
      // Mod=2 (1 << 1 for static)
      expect(result, [1, 2, 4, 1, 2]);
    });
  });

  group('WorkspaceFoldersManager', () {
    test('tracks and adds/removes folders', () async {
      final clientIncoming = StreamController<List<int>>.broadcast();
      final clientOutgoing = StreamController<List<int>>.broadcast();
      final serverChannel = StreamChannel<List<int>>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      final server = LspServer.fromChannel(serverChannel);
      final manager = WorkspaceFoldersManager();

      expect(manager.folders, isEmpty);

      final initial = [
        const WorkspaceFolder(uri: 'file:///project1', name: 'proj1'),
      ];
      manager.setInitialFolders(initial);
      expect(manager.folders, hasLength(1));
      expect(manager.folders.first.name, 'proj1');

      await manager.dispose();
      server.close().ignore();
      clientIncoming.close().ignore();
      clientOutgoing.close().ignore();
    });
  });

  group('ClientLoggingFeature', () {
    test('adapts log record to showMessage', () async {
      final clientIncoming = StreamController<List<int>>.broadcast();
      final clientOutgoing = StreamController<List<int>>.broadcast();
      final serverChannel = StreamChannel<List<int>>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      final server = LspServer.fromChannel(serverChannel);
      final adapter = ClientLoggingFeature()..level = log.Level.INFO;

      final completer = Completer<void>();
      clientOutgoing.stream.listen((bytes) {
        if (!completer.isCompleted) {
          completer.complete();
        }
      });

      server.registerFeature(adapter);

      log.Logger('test-logger').info('test message');

      await Future.any([
        completer.future,
        Future<void>.delayed(const Duration(milliseconds: 100)),
      ]);

      await adapter.dispose();
      await server.close();
      await clientIncoming.close();
      await clientOutgoing.close();
    });
  });

  group('FileLoggingFeature', () {
    test('writes log record to file', () async {
      final tempDir = Directory.systemTemp.createTempSync();
      final logFile = File('${tempDir.path}/test_server.log');

      final feature = FileLoggingFeature(
        logFile: logFile,
        level: log.Level.INFO,
      );

      final server = LspServer()..registerFeature(feature);

      log.Logger('test-file-logger').info('file log message');

      // Allow async write to complete
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(logFile.existsSync(), isTrue);
      final content = logFile.readAsStringSync();
      expect(content, contains('file log message'));
      expect(content, contains('[INFO]'));

      await feature.dispose();
      await server.close();
      tempDir.deleteSync(recursive: true);
    });
  });

  group('WatchedFilesManager', () {
    test('throws UnsupportedError if dynamic watch is not supported', () async {
      final clientIncoming = StreamController<List<int>>.broadcast();
      final clientOutgoing = StreamController<List<int>>.broadcast();
      final serverChannel = StreamChannel<List<int>>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      final server = LspServer.fromChannel(serverChannel);
      final manager = WatchedFilesManager(server);

      // Register InitializeParams indicating dynamicRegistration is false
      const mockParams = InitializeParams(
        processId: null,
        rootUri: null,
        capabilities: ClientCapabilities(
          workspace: WorkspaceClientCapabilities(
            didChangeWatchedFiles: DidChangeWatchedFilesClientCapabilities(
              dynamicRegistration: false,
            ),
          ),
        ),
      );
      server.register<InitializeParams>(mockParams);

      expect(manager.isSupported, isFalse);
      expect(
        () => manager.register(watchers: []),
        throwsA(isA<UnsupportedError>()),
      );

      await server.close();
      await clientIncoming.close();
      await clientOutgoing.close();
    });
  });
}
