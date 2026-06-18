import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/e2e_harness.dart';

/// End-to-end tests that wire a real [LspServer] and [LspClient] together over
/// the actual LSP byte transport (Content-Length framing via
/// [LspByteStreamChannel]). Unlike the connection-level harness tests, these
/// exercise the full typed surface in both directions: handshake, client→server
/// requests, server→client notifications/requests, document sync, cancellation,
/// and shutdown — exactly as a production editor↔server pair would behave.
void main() {
  final connect = e2eHarness();

  group('E2E lifecycle', () {
    test('handshake drives both endpoints to initialized', () async {
      final (:server, :client) = await connect();

      expect(client.state, LspState.initialized);
      expect(server.state, LspState.initialized);
      expect(client.serverCapabilities?.hoverProvider, isNotNull);
    });

    test('shutdown then exit transitions the server through its lifecycle',
        () async {
      final exited = Completer<void>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.general.onExit((context) async => exited.complete());
        },
      );

      await client.server.general.shutdown();
      expect(server.state, LspState.shuttingDown);

      client.server.general.exit();
      await exited.future.timeout(const Duration(seconds: 5));
      expect(server.state, LspState.exited);
    });
  });

  group('E2E client→server requests', () {
    test('hover round-trips a typed result', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onHover(
            (params, context) async => Hover(
              contents: HoverContents.markupContent(
                const MarkupContent(
                  kind: MarkupKind.markdown,
                  value: '**doc**',
                ),
              ),
              range: Range(
                start: params.position,
                end: params.position,
              ),
            ),
          );
        },
      );

      final hover = await client.server.textDocument.hover(
        const HoverParams(
          textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
          position: Position(line: 1, character: 2),
        ),
      );

      expect(hover, isNotNull);
      expect(hover!.contents.asMarkupContent!.value, '**doc**');
    });

    test('definition round-trips a Location result', () async {
      const target = Location(
        uri: 'file:///b.dart',
        range: Range(
          start: Position(line: 10, character: 0),
          end: Position(line: 10, character: 5),
        ),
      );
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDefinition(
            (params, context) async => DefinitionResult.definition(
              Definition.location(target),
            ),
          );
        },
      );

      final result = await client.server.textDocument.definition(
        const DefinitionParams(
          textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
          position: Position(line: 1, character: 1),
        ),
      );

      expect(result.isDefinition, isTrue);
      expect(result.asDefinition!.asLocation!.uri, 'file:///b.dart');
    });

    test('a server error surfaces as a typed LspException on the client',
        () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onHover(
            (params, context) async =>
                throw LspException.invalidParams('bad position'),
          );
        },
      );

      await expectLater(
        client.server.textDocument.hover(
          const HoverParams(
            textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
            position: Position(line: 0, character: 0),
          ),
        ),
        throwsA(
          isA<LspException>().having(
            (e) => e.code,
            'code',
            LspErrorCodes.invalidParams,
          ),
        ),
      );
    });
  });

  group('E2E document sync', () {
    test('didOpen / didChange / didClose reach the server in order', () async {
      final events = <String>[];
      final closed = Completer<void>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument
            ..onDidOpen((params, context) async {
              events.add('open:${params.textDocument.uri}');
            })
            ..onDidChange((params, context) async {
              events.add('change:${params.textDocument.version}');
            })
            ..onDidClose((params, context) async {
              events.add('close:${params.textDocument.uri}');
              closed.complete();
            });
        },
      );

      client.server.textDocument.didOpen(
        const DidOpenTextDocumentParams(
          textDocument: TextDocumentItem(
            uri: 'file:///a.dart',
            languageId: 'dart',
            version: 1,
            text: 'void main() {}',
          ),
        ),
      );
      client.server.textDocument.didChange(
        const DidChangeTextDocumentParams(
          textDocument: VersionedTextDocumentIdentifier(
            uri: 'file:///a.dart',
            version: 2,
          ),
          contentChanges: [],
        ),
      );
      client.server.textDocument.didClose(
        const DidCloseTextDocumentParams(
          textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
        ),
      );

      await closed.future.timeout(const Duration(seconds: 5));
      expect(events, [
        'open:file:///a.dart',
        'change:2',
        'close:file:///a.dart',
      ]);
    });
  });

  group('E2E server→client notifications', () {
    test(r'publishDiagnostics, window/*, and $/progress all reach the client',
        () async {
      final diagnostics = Completer<PublishDiagnosticsParams>();
      final showMessage = Completer<ShowMessageParams>();
      final logMessage = Completer<LogMessageParams>();
      final progress = Completer<ProgressParams>();

      final (:server, :client) = await connect(
        configureServer: (server) {
          // Use didOpen as the trigger: the client is fully `initialized` by
          // the time it sends didOpen, so these server→client messages are
          // accepted by the client's state machine.
          server.textDocument.onDidOpen((params, context) async {
            server.client.window.showMessage(
              const ShowMessageParams(
                type: MessageType.info,
                message: 'opened',
              ),
            );
            server.client.window.logMessage(
              const LogMessageParams(
                type: MessageType.log,
                message: 'log line',
              ),
            );
            server.client.general.progress(
              const ProgressParams(
                token: ProgressToken.string('tok-1'),
                value: LSPAny.string('begin'),
              ),
            );
            server.client.textDocument.publishDiagnostics(
              const PublishDiagnosticsParams(
                uri: 'file:///a.dart',
                diagnostics: [],
              ),
            );
          });
        },
        configureClient: (client) {
          client.textDocument.onPublishDiagnostics(
            (params, context) async => diagnostics.complete(params),
          );
          client.window
            ..onShowMessage((params, context) async {
              showMessage.complete(params);
            })
            ..onLogMessage((params, context) async {
              logMessage.complete(params);
            });
          client.general.onProgress(
            (params, context) async => progress.complete(params),
          );
        },
      );

      client.server.textDocument.didOpen(
        const DidOpenTextDocumentParams(
          textDocument: TextDocumentItem(
            uri: 'file:///a.dart',
            languageId: 'dart',
            version: 1,
            text: '',
          ),
        ),
      );

      const timeout = Duration(seconds: 5);
      expect((await diagnostics.future.timeout(timeout)).uri, 'file:///a.dart');
      expect((await showMessage.future.timeout(timeout)).message, 'opened');
      expect((await logMessage.future.timeout(timeout)).message, 'log line');
      expect(
        (await progress.future.timeout(timeout)).token,
        const ProgressToken.string('tok-1'),
      );
    });
  });

  group('E2E server→client requests', () {
    test('configuration, showMessageRequest, and registerCapability '
        'round-trip', () async {
      final results = Completer<({List<LSPAny> config, String? action})>();
      var registered = false;

      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            final config = await server.client.workspace.configuration(
              const ConfigurationParams(items: []),
            );
            final action = await server.client.window.showMessageRequest(
              const ShowMessageRequestParams(
                type: MessageType.info,
                message: 'pick one',
              ),
            );
            await server.client.client.registerCapability(
              const RegistrationParams(registrations: []),
            );
            results.complete((config: config, action: action?.title));
          });
        },
        configureClient: (client) {
          client.workspace.onConfiguration(
            (params, context) async => [const LSPAny.bool(true)],
          );
          client.window.onShowMessageRequest(
            (params, context) async => const MessageActionItem(title: 'OK'),
          );
          client.client.onRegisterCapability((params, context) async {
            registered = true;
          });
        },
      );

      client.server.textDocument.didOpen(
        const DidOpenTextDocumentParams(
          textDocument: TextDocumentItem(
            uri: 'file:///a.dart',
            languageId: 'dart',
            version: 1,
            text: '',
          ),
        ),
      );

      final r = await results.future.timeout(const Duration(seconds: 5));
      expect(r.config, hasLength(1));
      expect(r.action, 'OK');
      expect(registered, isTrue);
    });
  });

  group('E2E cancellation', () {
    test('cancelling an outgoing request surfaces requestCancelled', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          // Handler hangs until the incoming $/cancelRequest cancels its token.
          server.textDocument.onHover((params, context) {
            final completer = Completer<Hover?>();
            context.cancellationToken.onCancelled.listen((_) {
              if (!completer.isCompleted) {
                completer.completeError(
                  LspException.requestCancelled('cancelled by peer'),
                );
              }
            });
            return completer.future;
          });
        },
      );

      final token = CancellationToken();
      final pending = client.server.textDocument.hover(
        const HoverParams(
          textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
          position: Position(line: 0, character: 0),
        ),
        token: token,
      );

      token.cancel();

      await expectLater(
        pending,
        throwsA(
          isA<LspException>().having(
            (e) => e.code,
            'code',
            LspErrorCodes.requestCancelled,
          ),
        ),
      );
    });
  });
}
