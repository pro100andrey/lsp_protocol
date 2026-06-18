import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/e2e_harness.dart';

/// Additional end-to-end coverage for the remaining client→server
/// notifications and server→client requests/notifications that the primary
/// e2e suite does not exercise. Each test wires a real server/client pair via
/// the shared harness and verifies a single message round-trips end to end.
void main() {
  final connect = e2eHarness();

  /// Sends `textDocument/didOpen` so the server can trigger a server→client
  /// message while both endpoints are fully `initialized`.
  void openDoc(LspClient client) {
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
  }

  const timeout = Duration(seconds: 5);

  group('E2E client→server notifications', () {
    test('didSave reaches the server', () async {
      final got = Completer<DidSaveTextDocumentParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidSave(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.textDocument.didSave(
        const DidSaveTextDocumentParams(
          textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.textDocument.uri, 'file:///a.dart');
    });

    test('willSave reaches the server', () async {
      final got = Completer<WillSaveTextDocumentParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onWillSave(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.textDocument.willSave(
        const WillSaveTextDocumentParams(
          textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
          reason: TextDocumentSaveReason.manual,
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.reason, TextDocumentSaveReason.manual);
    });

    test('didChangeWorkspaceFolders reaches the server', () async {
      final got = Completer<DidChangeWorkspaceFoldersParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onDidChangeWorkspaceFolders(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.workspace.didChangeWorkspaceFolders(
        const DidChangeWorkspaceFoldersParams(
          event: WorkspaceFoldersChangeEvent(
            added: [WorkspaceFolder(uri: 'file:///w', name: 'w')],
            removed: [],
          ),
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.event.added.single.name, 'w');
    });

    test('didCreateFiles reaches the server', () async {
      final got = Completer<CreateFilesParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onDidCreateFiles(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.workspace.didCreateFiles(
        const CreateFilesParams(files: [FileCreate(uri: 'file:///a.dart')]),
      );
      final p = await got.future.timeout(timeout);
      expect(p.files.single.uri, 'file:///a.dart');
    });

    test('didRenameFiles reaches the server', () async {
      final got = Completer<RenameFilesParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onDidRenameFiles(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.workspace.didRenameFiles(
        const RenameFilesParams(
          files: [
            FileRename(oldUri: 'file:///o.dart', newUri: 'file:///n.dart'),
          ],
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.files.single.newUri, 'file:///n.dart');
    });

    test('didDeleteFiles reaches the server', () async {
      final got = Completer<DeleteFilesParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onDidDeleteFiles(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.workspace.didDeleteFiles(
        const DeleteFilesParams(files: [FileDelete(uri: 'file:///a.dart')]),
      );
      final p = await got.future.timeout(timeout);
      expect(p.files.single.uri, 'file:///a.dart');
    });

    test('didChangeConfiguration reaches the server', () async {
      final got = Completer<DidChangeConfigurationParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onDidChangeConfiguration(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.workspace.didChangeConfiguration(
        const DidChangeConfigurationParams(
          settings: LSPAny.lSPObject({'k': LSPAny.string('v')}),
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.settings.value, isNotNull);
    });

    test('didChangeWatchedFiles reaches the server', () async {
      final got = Completer<DidChangeWatchedFilesParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onDidChangeWatchedFiles(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.workspace.didChangeWatchedFiles(
        const DidChangeWatchedFilesParams(
          changes: [
            FileEvent(uri: 'file:///a.dart', type: FileChangeType.changed),
          ],
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.changes.single.type, FileChangeType.changed);
    });

    test('setTrace reaches the server', () async {
      final got = Completer<SetTraceParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.general.onSetTrace(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.general.setTrace(
        const SetTraceParams(value: TraceValues.messages),
      );
      final p = await got.future.timeout(timeout);
      expect(p.value, TraceValues.messages);
    });

    test('notebookDocument/didOpen reaches the server', () async {
      final got = Completer<DidOpenNotebookDocumentParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.notebookDocument.onDidOpen(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.notebookDocument.didOpen(
        const DidOpenNotebookDocumentParams(
          notebookDocument: NotebookDocument(
            uri: 'file:///n.ipynb',
            notebookType: 'jupyter',
            version: 1,
            cells: [
              NotebookCell(
                kind: NotebookCellKind.code,
                document: 'file:///c0.py',
              ),
            ],
          ),
          cellTextDocuments: [
            TextDocumentItem(
              uri: 'file:///c0.py',
              languageId: 'python',
              version: 1,
              text: '',
            ),
          ],
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.notebookDocument.uri, 'file:///n.ipynb');
    });

    test('notebookDocument/didChange reaches the server', () async {
      final got = Completer<DidChangeNotebookDocumentParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.notebookDocument.onDidChange(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.notebookDocument.didChange(
        const DidChangeNotebookDocumentParams(
          notebookDocument: VersionedNotebookDocumentIdentifier(
            uri: 'file:///n.ipynb',
            version: 2,
          ),
          change: NotebookDocumentChangeEvent(),
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.notebookDocument.version, 2);
    });

    test('notebookDocument/didSave reaches the server', () async {
      final got = Completer<DidSaveNotebookDocumentParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.notebookDocument.onDidSave(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.notebookDocument.didSave(
        const DidSaveNotebookDocumentParams(
          notebookDocument: NotebookDocumentIdentifier(uri: 'file:///n.ipynb'),
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.notebookDocument.uri, 'file:///n.ipynb');
    });

    test('notebookDocument/didClose reaches the server', () async {
      final got = Completer<DidCloseNotebookDocumentParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.notebookDocument.onDidClose(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.notebookDocument.didClose(
        const DidCloseNotebookDocumentParams(
          notebookDocument: NotebookDocumentIdentifier(uri: 'file:///n.ipynb'),
          cellTextDocuments: [
            TextDocumentIdentifier(uri: 'file:///c0.py'),
          ],
        ),
      );
      final p = await got.future.timeout(timeout);
      expect(p.notebookDocument.uri, 'file:///n.ipynb');
    });

    test('workDoneProgressCancel reaches the server', () async {
      final got = Completer<WorkDoneProgressCancelParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.window.onWorkDoneProgressCancel(
            (params, context) async => got.complete(params),
          );
        },
      );
      client.server.window.workDoneProgressCancel(
        const WorkDoneProgressCancelParams(token: ProgressToken.string('p')),
      );
      final p = await got.future.timeout(timeout);
      expect(p.token, const ProgressToken.string('p'));
    });
  });

  group('E2E server→client requests', () {
    test('showDocument round-trips', () async {
      final result = Completer<ShowDocumentResult>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            result.complete(
              await server.client.window.showDocument(
                const ShowDocumentParams(uri: 'file:///a.dart'),
              ),
            );
          });
        },
        configureClient: (client) {
          client.window.onShowDocument(
            (params, context) async => const ShowDocumentResult(success: true),
          );
        },
      );
      openDoc(client);
      final r = await result.future.timeout(timeout);
      expect(r.success, isTrue);
    });

    test('workDoneProgressCreate round-trips', () async {
      final created = Completer<void>();
      final done = Completer<void>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            await server.client.window.workDoneProgressCreate(
              const WorkDoneProgressCreateParams(
                token: ProgressToken.string('p'),
              ),
            );
            done.complete();
          });
        },
        configureClient: (client) {
          client.window.onWorkDoneProgressCreate((params, context) async {
            created.complete();
          });
        },
      );
      openDoc(client);
      await created.future.timeout(timeout);
      await done.future.timeout(timeout);
    });

    test('unregisterCapability round-trips', () async {
      final got = Completer<UnregistrationParams>();
      final done = Completer<void>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            await server.client.client.unregisterCapability(
              const UnregistrationParams(
                unregisterations: [
                  Unregistration(id: '1', method: 'textDocument/hover'),
                ],
              ),
            );
            done.complete();
          });
        },
        configureClient: (client) {
          client.client.onUnregisterCapability((params, context) async {
            got.complete(params);
          });
        },
      );
      openDoc(client);
      final p = await got.future.timeout(timeout);
      expect(p.unregisterations.single.id, '1');
      await done.future.timeout(timeout);
    });

    test('applyEdit round-trips', () async {
      final result = Completer<ApplyWorkspaceEditResult>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            result.complete(
              await server.client.workspace.applyEdit(
                const ApplyWorkspaceEditParams(edit: WorkspaceEdit()),
              ),
            );
          });
        },
        configureClient: (client) {
          client.workspace.onApplyEdit(
            (params, context) async =>
                const ApplyWorkspaceEditResult(applied: true),
          );
        },
      );
      openDoc(client);
      final r = await result.future.timeout(timeout);
      expect(r.applied, isTrue);
    });

    test('workspaceFolders round-trips', () async {
      final result = Completer<List<WorkspaceFolder>?>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            result.complete(
              await server.client.workspace.workspaceFolders(),
            );
          });
        },
        configureClient: (client) {
          client.workspace.onWorkspaceFolders(
            (context) async =>
                const [WorkspaceFolder(uri: 'file:///w', name: 'w')],
          );
        },
      );
      openDoc(client);
      final r = await result.future.timeout(timeout);
      expect(r!.single.name, 'w');
    });

    test('refresh requests round-trip', () async {
      final folding = Completer<void>();
      final semantic = Completer<void>();
      final inlineValue = Completer<void>();
      final inlayHint = Completer<void>();
      final diagnostic = Completer<void>();
      final codeLens = Completer<void>();
      final done = Completer<void>();

      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            await server.client.workspace.foldingRangeRefresh();
            await server.client.workspace.semanticTokensRefresh();
            await server.client.workspace.inlineValueRefresh();
            await server.client.workspace.inlayHintRefresh();
            await server.client.workspace.diagnosticRefresh();
            await server.client.workspace.codeLensRefresh();
            done.complete();
          });
        },
        configureClient: (client) {
          client.workspace
            ..onFoldingRangeRefresh((context) async => folding.complete())
            ..onSemanticTokensRefresh((context) async => semantic.complete())
            ..onInlineValueRefresh((context) async => inlineValue.complete())
            ..onInlayHintRefresh((context) async => inlayHint.complete())
            ..onDiagnosticRefresh((context) async => diagnostic.complete())
            ..onCodeLensRefresh((context) async => codeLens.complete());
        },
      );
      openDoc(client);

      await folding.future.timeout(timeout);
      await semantic.future.timeout(timeout);
      await inlineValue.future.timeout(timeout);
      await inlayHint.future.timeout(timeout);
      await diagnostic.future.timeout(timeout);
      await codeLens.future.timeout(timeout);
      await done.future.timeout(timeout);
    });
  });

  group('E2E server→client notifications', () {
    test('logTrace reaches the client', () async {
      final got = Completer<LogTraceParams>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            server.client.general.logTrace(
              const LogTraceParams(message: 'm'),
            );
          });
        },
        configureClient: (client) {
          client.general.onLogTrace(
            (params, context) async => got.complete(params),
          );
        },
      );
      openDoc(client);
      final p = await got.future.timeout(timeout);
      expect(p.message, 'm');
    });

    test('telemetry/event reaches the client', () async {
      final got = Completer<LSPAny>();
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDidOpen((params, context) async {
            server.client.telemetry.event(
              const LSPAny.lSPObject({'e': LSPAny.string('x')}),
            );
          });
        },
        configureClient: (client) {
          client.telemetry.onEvent(
            (params, context) async => got.complete(params),
          );
        },
      );
      openDoc(client);
      final p = await got.future.timeout(timeout);
      expect(p.value, isNotNull);
    });
  });
}
