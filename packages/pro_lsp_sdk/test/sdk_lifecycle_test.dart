import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('SDK Integration Lifecycle', () {
    late StreamController<List<int>> clientIncoming;
    late StreamController<List<int>> clientOutgoing;
    late StreamChannel<List<int>> serverChannel;
    late LspServer server;
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
      await server.close();
      await clientIncoming.close();
      await clientOutgoing.close();
    });

    void sendClientMessage(String msg) {
      final bodyBytes = utf8.encode(msg);
      final headerStr = 'Content-Length: ${bodyBytes.length}\r\n\r\n';
      clientIncoming.add([...ascii.encode(headerStr), ...bodyBytes]);
    }

    Future<void> performInitialization() async {
      server.general.onInitialize(
        (params, _) async =>
            const InitializeResult(capabilities: ServerCapabilities()),
      );

      unawaited(server.listen());

      // Send initialize
      sendClientMessage(
        jsonEncode(<String, dynamic>{
          'jsonrpc': '2.0',
          'id': 100,
          'method': 'initialize',
          'params': <String, dynamic>{
            'capabilities': <String, dynamic>{},
            'processId': null,
            'rootUri': null,
            'workspaceFolders': null,
          },
        }),
      );

      // Wait for response
      await clientLspStream.first;
    }

    group('Documents sync via DI', () {
      test(
        'synchronizes document lifecycle using TextDocumentManager',
        () async {
          final documents = TextDocumentManager();
          server.register<TextDocumentManager>(documents);
          documents.bind(server);

          await performInitialization();

          // didOpen
          sendClientMessage(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'method': 'textDocument/didOpen',
              'params': <String, dynamic>{
                'textDocument': <String, dynamic>{
                  'uri': 'file:///test.dart',
                  'languageId': 'dart',
                  'version': 1,
                  'text': 'void main() {}',
                },
              },
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          final resolvedDocs = server.resolve<TextDocumentManager>();
          final doc = resolvedDocs.get('file:///test.dart');
          expect(doc, isNotNull);
          expect(doc!.text, 'void main() {}');
          expect(doc.languageId, 'dart');
          expect(doc.version, 1);

          // didChange (Full Sync)
          sendClientMessage(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'method': 'textDocument/didChange',
              'params': <String, dynamic>{
                'textDocument': <String, dynamic>{
                  'uri': 'file:///test.dart',
                  'version': 2,
                },
                'contentChanges': <dynamic>[
                  <String, dynamic>{'text': 'void main() { print("Hello"); }'},
                ],
              },
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          final updatedDoc = resolvedDocs.get('file:///test.dart');
          expect(updatedDoc!.text, 'void main() { print("Hello"); }');
          expect(updatedDoc.version, 2);

          // didChange (Incremental Sync)
          sendClientMessage(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'method': 'textDocument/didChange',
              'params': <String, dynamic>{
                'textDocument': <String, dynamic>{
                  'uri': 'file:///test.dart',
                  'version': 3,
                },
                'contentChanges': <dynamic>[
                  <String, dynamic>{
                    'range': <String, dynamic>{
                      'start': <String, dynamic>{'line': 0, 'character': 21},
                      'end': <String, dynamic>{'line': 0, 'character': 26},
                    },
                    'text': 'World',
                  },
                ],
              },
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          final incrementalDoc = resolvedDocs.get('file:///test.dart');
          expect(incrementalDoc!.text, 'void main() { print("World"); }');
          expect(incrementalDoc.version, 3);

          // didClose
          sendClientMessage(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'method': 'textDocument/didClose',
              'params': <String, dynamic>{
                'textDocument': <String, dynamic>{
                  'uri': 'file:///test.dart',
                },
              },
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(resolvedDocs.get('file:///test.dart'), null);
        },
      );
    });

    group('Diagnostics via DI', () {
      test('publishes diagnostics with debouncing', () async {
        final diagnostics = DiagnosticsManager(server);
        server.register<DiagnosticsManager>(diagnostics);

        await performInitialization();

        final resolvedDiag = server.resolve<DiagnosticsManager>()
          ..debounceDuration = const Duration(milliseconds: 100);

        final receivedMessages = <Map<String, dynamic>>[];
        final subscription = clientLspStream.listen(receivedMessages.add);

        // Publish diagnostics
        resolvedDiag.publish('file:///test.dart', [
          const Diagnostic(
            range: Range(
              start: Position(line: 0, character: 0),
              end: Position(line: 0, character: 5),
            ),
            message: 'Error message',
          ),
        ]);

        // Wait 50ms (less than debounce)
        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(receivedMessages, isEmpty);

        // Wait another 100ms (total 150ms)
        await Future<void>.delayed(const Duration(milliseconds: 100));
        expect(receivedMessages, hasLength(1));

        final diagParams = receivedMessages.first;
        expect(diagParams['method'], 'textDocument/publishDiagnostics');
        final params = diagParams['params'] as Map<String, dynamic>;
        expect(params['uri'], 'file:///test.dart');
        expect(params['diagnostics'] as List, hasLength(1));

        // Clear diagnostics (should publish immediately)
        resolvedDiag.clear('file:///test.dart');
        await Future<void>.delayed(const Duration(milliseconds: 20));

        expect(receivedMessages, hasLength(2));
        final clearParams = receivedMessages.last;
        final clearParamsParams = clearParams['params'] as Map<String, dynamic>;
        expect(clearParamsParams['diagnostics'] as List, isEmpty);

        resolvedDiag.close();
        await subscription.cancel();
      });
    });

    group('Configuration via DI', () {
      test('queries and caches configs', () async {
        final config = LspConfigurationManager(server);
        server.register<LspConfigurationManager>(config);
        config.bind();

        await performInitialization();

        var configResponse = <String, dynamic>{'editor.tabSize': 4};

        // Listen for workspace/configuration request from server and respond
        final subscription = clientLspStream.listen((msg) {
          final json = msg;
          if (json['method'] == 'workspace/configuration') {
            sendClientMessage(
              jsonEncode(<String, dynamic>{
                'jsonrpc': '2.0',
                'id': json['id'],
                'result': <dynamic>[configResponse],
              }),
            );
          }
        });

        final resolvedConfig = server.resolve<LspConfigurationManager>();

        // 1. Fetch config (should request from client)
        final tabSize1 = await resolvedConfig.getSection<Map<String, dynamic>>(
          'editor',
        );
        expect(tabSize1, equals({'editor.tabSize': 4}));

        // 2. Fetch again (should return cached value)
        configResponse = <String, dynamic>{'editor.tabSize': 2};
        final tabSize2 = await resolvedConfig.getSection<Map<String, dynamic>>(
          'editor',
        );
        expect(tabSize2, equals({'editor.tabSize': 4})); // cached

        // 3. Send didChangeConfiguration notification from client
        sendClientMessage(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'method': 'workspace/didChangeConfiguration',
            'params': <String, dynamic>{'settings': <String, dynamic>{}},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        // 4. Fetch config again (should fetch new value)
        final tabSize3 = await resolvedConfig.getSection<Map<String, dynamic>>(
          'editor',
        );
        expect(tabSize3, equals({'editor.tabSize': 2}));

        resolvedConfig.close();
        await subscription.cancel();
      });
    });

    group('Capabilities via DI', () {
      test('registers and unregisters dynamically', () async {
        final capabilities = CapabilityManager(server);
        server.register<CapabilityManager>(capabilities);

        await performInitialization();

        final receivedMessages = <Map<String, dynamic>>[];
        final subscription = clientLspStream.listen((msg) {
          receivedMessages.add(msg);
          // Respond success to registration request
          final json = msg;
          if (json['id'] != null) {
            sendClientMessage(
              jsonEncode(<String, dynamic>{
                'jsonrpc': '2.0',
                'id': json['id'],
                'result': null,
              }),
            );
          }
        });

        final resolvedCaps = server.resolve<CapabilityManager>();

        // Register hover
        final regId = await resolvedCaps.register(
          method: 'textDocument/hover',
        );
        expect(regId, startsWith('dynamic-registration-'));
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(receivedMessages, hasLength(1));
        final regReq = receivedMessages.first;
        expect(regReq['method'], 'client/registerCapability');
        final regParams = regReq['params'] as Map<String, dynamic>;
        final registrations = regParams['registrations'] as List<dynamic>;
        final firstReg = registrations.first as Map<String, dynamic>;
        expect(firstReg['id'], regId);

        // Unregister
        await resolvedCaps.unregister(
          registrationId: regId,
          method: 'textDocument/hover',
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(receivedMessages, hasLength(2));
        final unregReq = receivedMessages.last;
        expect(unregReq['method'], 'client/unregisterCapability');
        final unregParams = unregReq['params'] as Map<String, dynamic>;
        final unregistrations =
            unregParams['unregisterations'] as List<dynamic>;
        final firstUnreg = unregistrations.first as Map<String, dynamic>;
        expect(firstUnreg['id'], regId);

        await subscription.cancel();
      });
    });
  });
}
