import 'dart:async';
import 'dart:convert';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  group('LspConnection', () {
    late StreamController<String> clientIncoming;
    late StreamController<String> clientOutgoing;
    late StreamChannel<String> serverChannel;
    late LspConnection connection;

    setUp(() {
      clientIncoming = StreamController<String>.broadcast();
      clientOutgoing = StreamController<String>.broadcast();
      serverChannel = StreamChannel<String>(
        clientIncoming.stream,
        clientOutgoing.sink,
      );
      connection = LspConnection(serverChannel);
    });

    tearDown(() async {
      await clientIncoming.close();
      await clientOutgoing.close();
    });

    group('Lifecycle', () {
      test('rejects requests before initialization', () async {
        final listenFuture = connection.listen();
        var handlerCalled = false;
        connection.registerRequestHandler(
          'textDocument/hover',
          (params) async {
            handlerCalled = true;
            return null;
          },
        );

        // Send a request
        final request = jsonEncode(<String, dynamic>{
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'textDocument/hover',
          'params': <String, dynamic>{},
        });

        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);
        clientIncoming.add(request);

        // Wait a bit for processing
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(handlerCalled, isFalse);
        expect(responses, hasLength(1));
        final resp = jsonDecode(responses.first) as Map<String, dynamic>;
        final error = resp['error'] as Map<String, dynamic>;
        expect(error['code'], -32002); // serverNotInitialized
        expect(error['message'], contains('not initialized'));

        await connection.close();
        await listenFuture;
      });

      test('allows initialize and transitions state', () async {
        connection
          ..registerRequestHandler(
            'initialize',
            (params) async => <String, dynamic>{
              'capabilities': <String, dynamic>{},
            },
          )
          ..registerRequestHandler(
            'textDocument/hover',
            (params) async => <String, dynamic>{'contents': 'Hover result'},
          );

        final listenFuture = connection.listen();

        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        expect(connection.state, LspState.uninitialized);

        // Send initialize
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'initialize',
            'params': <String, dynamic>{},
          }),
        );

        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(connection.state, LspState.initialized);
        expect(responses, hasLength(1));

        // Now send hover, which should be allowed
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 2,
            'method': 'textDocument/hover',
            'params': <String, dynamic>{},
          }),
        );

        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(responses, hasLength(2));
        final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
        final result = hoverResp['result'] as Map<String, dynamic>;
        expect(result['contents'], 'Hover result');

        await connection.close();
        await listenFuture;
      });

      test('rejects requests after shutdown', () async {
        connection
          ..registerRequestHandler(
            'initialize',
            (params) async => <String, dynamic>{
              'capabilities': <String, dynamic>{},
            },
          )
          ..registerRequestHandler('shutdown', (params) async => null)
          ..registerRequestHandler(
            'textDocument/hover',
            (params) async => null,
          );

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // 1. Initialize
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'initialize',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        // 2. Shutdown
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 2,
            'method': 'shutdown',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(connection.state, LspState.shuttingDown);

        // 3. Try to hover (should be rejected)
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 3,
            'method': 'textDocument/hover',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(responses, hasLength(3));
        final hoverResp = jsonDecode(responses[2]) as Map<String, dynamic>;
        final error = hoverResp['error'] as Map<String, dynamic>;
        expect(error['code'], -32600); // invalidRequest
        expect(error['message'], contains('not allowed'));

        await connection.close();
        await listenFuture;
      });
    });

    group('Cancellation', () {
      test('correctly cancels token inside zone', () async {
        final handlerCompleter = Completer<Object?>();
        CancellationToken? capturedToken;

        connection
          ..registerRequestHandler(
            'initialize',
            (params) async => <String, dynamic>{},
          )
          ..registerRequestHandler('textDocument/hover', (params) async {
            capturedToken = CancellationToken.current;
            // Wait for cancellation
            await handlerCompleter.future;
            capturedToken?.throwIfCancelled();
            return 'Hover Success';
          });

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // Initialize first
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'initialize',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        // Send hover request
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 42,
            'method': 'textDocument/hover',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(capturedToken, isNotNull);
        expect(capturedToken!.isCancelled, isFalse);

        // Send cancel request
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'method': r'$/cancelRequest',
            'params': <String, dynamic>{'id': 42},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(capturedToken!.isCancelled, isTrue);

        // Complete the handler
        handlerCompleter.complete(null);
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(
          responses,
          hasLength(2),
        ); // Initialize response + Hover error response
        final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
        final error = hoverResp['error'] as Map<String, dynamic>;
        expect(error['code'], -32800); // RequestCancelled

        await connection.close();
        await listenFuture;
      });
    });

    group('Middleware', () {
      test('intercepts requests and can modify or measure execution', () async {
        final methodsCalled = <String>[];

        // Middleware 1: logs methods
        connection.middlewares.add((request, next) {
          methodsCalled.add(request.method);
          return next(request);
        });

        // Middleware 2: overrides response for textDocument/hover
        connection.middlewares.add((request, next) async {
          if (request.method == 'textDocument/hover') {
            return <String, dynamic>{'contents': 'Intercepted Hover'};
          }
          return next(request);
        });

        connection
          ..registerRequestHandler(
            'initialize',
            (params) async => <String, dynamic>{},
          )
          ..registerRequestHandler(
            'textDocument/hover',
            (params) async => <String, dynamic>{'contents': 'Original Hover'},
          );

        final listenFuture = connection.listen();
        final responses = <String>[];
        clientOutgoing.stream.listen(responses.add);

        // Initialize
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'initialize',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        // Hover
        clientIncoming.add(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'id': 2,
            'method': 'textDocument/hover',
            'params': <String, dynamic>{},
          }),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(methodsCalled, equals(['initialize', 'textDocument/hover']));
        expect(responses, hasLength(2));
        final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
        final result = hoverResp['result'] as Map<String, dynamic>;
        expect(result['contents'], 'Intercepted Hover');

        await connection.close();
        await listenFuture;
      });
    });

    group('Error Handling', () {
      test(
        'triggers onError and returns InternalError on unhandled crashes',
        () async {
          Object? caughtError;
          connection
            ..onError = (err, stack) {
              caughtError = err;
            }
            ..registerRequestHandler(
              'initialize',
              (params) async => <String, dynamic>{},
            )
            ..registerRequestHandler('textDocument/hover', (
              params,
            ) {
              throw StateError('Simulated crash in handler');
            });

          final listenFuture = connection.listen();
          final responses = <String>[];
          clientOutgoing.stream.listen(responses.add);

          // Initialize
          clientIncoming.add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': 1,
              'method': 'initialize',
              'params': <String, dynamic>{},
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          // Hover
          clientIncoming.add(
            jsonEncode(<String, dynamic>{
              'jsonrpc': '2.0',
              'id': 2,
              'method': 'textDocument/hover',
              'params': <String, dynamic>{},
            }),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(caughtError, isA<StateError>());
          expect(responses, hasLength(2));
          final hoverResp = jsonDecode(responses[1]) as Map<String, dynamic>;
          final error = hoverResp['error'] as Map<String, dynamic>;
          expect(error['code'], -32603); // InternalError
          expect(error['message'], contains('Simulated crash'));

          await connection.close();
          await listenFuture;
        },
      );
    });

    group('LspServer', () {
      late StreamController<List<int>> clientIncoming;
      late StreamController<List<int>> clientOutgoing;
      late StreamChannel<List<int>> serverChannel;
      late LspServer server;
      late StreamChannel<String> clientLspChannel;
      late Stream<String> clientLspStream;

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
        clientLspStream = clientLspChannel.stream.asBroadcastStream();
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
          (params) async =>
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

      group('Documents', () {
        test('synchronizes documents', () async {
          await performInitialization();

          expect(server.documents.all, isEmpty);

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

          final doc = server.documents.get('file:///test.dart');
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

          final updatedDoc = server.documents.get('file:///test.dart');
          expect(updatedDoc!.text, 'void main() { print("Hello"); }');
          expect(updatedDoc.version, 2);

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

          expect(server.documents.get('file:///test.dart'), null);
        });
      });

      group('Diagnostics', () {
        test('publishes diagnostics with debouncing', () async {
          await performInitialization();

          server.diagnostics.debounceDuration = const Duration(
            milliseconds: 100,
          );
          final receivedMessages = <String>[];
          clientLspStream.listen(receivedMessages.add);

          // Publish diagnostics
          server.diagnostics.publish('file:///test.dart', [
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

          final diagParams =
              jsonDecode(receivedMessages.first) as Map<String, dynamic>;
          expect(diagParams['method'], 'textDocument/publishDiagnostics');
          final params = diagParams['params'] as Map<String, dynamic>;
          expect(params['uri'], 'file:///test.dart');
          expect(params['diagnostics'] as List, hasLength(1));

          // Clear diagnostics (should publish immediately)
          server.diagnostics.clear('file:///test.dart');
          await Future<void>.delayed(const Duration(milliseconds: 20));

          expect(receivedMessages, hasLength(2));
          final clearParams =
              jsonDecode(receivedMessages.last) as Map<String, dynamic>;
          final clearParamsParams =
              clearParams['params'] as Map<String, dynamic>;
          expect(clearParamsParams['diagnostics'] as List, isEmpty);
        });
      });

      group('Configuration', () {
        test('queries and caches configs', () async {
          await performInitialization();

          var configResponse = <String, dynamic>{'editor.tabSize': 4};

          // Listen for workspace/configuration request from server and respond
          clientLspStream.listen((msg) {
            final json = jsonDecode(msg) as Map<String, dynamic>;
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

          // 1. Fetch config (should request from client)
          final tabSize1 = await server.config.getSection<Map<String, dynamic>>(
            'editor',
          );
          expect(tabSize1, equals({'editor.tabSize': 4}));

          // 2. Fetch again (should return cached value)
          configResponse = <String, dynamic>{'editor.tabSize': 2};
          final tabSize2 = await server.config.getSection<Map<String, dynamic>>(
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
          final tabSize3 = await server.config.getSection<Map<String, dynamic>>(
            'editor',
          );
          expect(tabSize3, equals({'editor.tabSize': 2}));
        });
      });

      group('Capabilities', () {
        test('registers and unregisters dynamically', () async {
          await performInitialization();

          final receivedMessages = <String>[];
          clientLspStream.listen((msg) {
            receivedMessages.add(msg);
            // Respond success to registration request
            final json = jsonDecode(msg) as Map<String, dynamic>;
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

          // Register hover
          final regId = await server.capabilities.register(
            method: 'textDocument/hover',
          );
          expect(regId, startsWith('dynamic-registration-'));
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(receivedMessages, hasLength(1));
          final regReq =
              jsonDecode(receivedMessages.first) as Map<String, dynamic>;
          expect(regReq['method'], 'client/registerCapability');
          final regParams = regReq['params'] as Map<String, dynamic>;
          final registrations = regParams['registrations'] as List<dynamic>;
          final firstReg = registrations.first as Map<String, dynamic>;
          expect(firstReg['id'], regId);

          // Unregister
          await server.capabilities.unregister(
            registrationId: regId,
            method: 'textDocument/hover',
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(receivedMessages, hasLength(2));
          final unregReq =
              jsonDecode(receivedMessages.last) as Map<String, dynamic>;
          expect(unregReq['method'], 'client/unregisterCapability');
          final unregParams = unregReq['params'] as Map<String, dynamic>;
          final unregistrations =
              unregParams['unregisterations'] as List<dynamic>;
          final firstUnreg = unregistrations.first as Map<String, dynamic>;
          expect(firstUnreg['id'], regId);
        });
      });
    });
  });
}
