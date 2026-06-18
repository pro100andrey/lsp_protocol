import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/e2e_harness.dart';

/// A throwaway [Range] reused across fixtures.
const _range = Range(
  start: Position(line: 0, character: 0),
  end: Position(line: 0, character: 1),
);

void main() {
  final connect = e2eHarness();

  group('E2E workspace requests', () {
    test('symbol round-trips a SymbolInformation list', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onSymbol(
            (params, context) async => SymbolResult.symbolInformationList(
              const [
                SymbolInformation(
                  name: 'C',
                  kind: SymbolKind.class$,
                  location: Location(uri: 'file:///a.dart', range: _range),
                ),
              ],
            ),
          );
        },
      );

      final r = await client.server.workspace.symbol(
        const WorkspaceSymbolParams(query: 'foo'),
      );

      expect(r.asSymbolInformationList!.first.name, 'C');
    });

    test('executeCommand round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onExecuteCommand(
            (params, context) async => const LSPAny.string('ok'),
          );
        },
      );

      final r = await client.server.workspace.executeCommand(
        const ExecuteCommandParams(command: 'my.cmd'),
      );

      expect(r!.asString, 'ok');
    });

    test('diagnostic round-trips a workspace report', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onDiagnostic(
            (params, context) async => WorkspaceDiagnosticReport(
              items: [
                .workspaceFullDocumentDiagnosticReport(
                  const WorkspaceFullDocumentDiagnosticReport(
                    items: [],
                    uri: 'file:///a.dart',
                    version: null,
                  ),
                ),
              ],
            ),
          );
        },
      );

      final r = await client.server.workspace.diagnostic(
        const WorkspaceDiagnosticParams(
          previousResultIds: [
            PreviousResultId(uri: 'file:///a.dart', value: 'p'),
          ],
        ),
      );

      expect(
        r.items.first.asWorkspaceFullDocumentDiagnosticReport!.uri,
        'file:///a.dart',
      );
    });

    test('willCreateFiles round-trips a WorkspaceEdit', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onWillCreateFiles(
            (params, context) async => const WorkspaceEdit(
              changes: {
                'file:///a.dart': [TextEdit(range: _range, newText: 'x')],
              },
            ),
          );
        },
      );

      final r = await client.server.workspace.willCreateFiles(
        const CreateFilesParams(files: [FileCreate(uri: 'file:///n.dart')]),
      );

      expect(r!.changes!['file:///a.dart']!.first.newText, 'x');
    });

    test('willRenameFiles round-trips a WorkspaceEdit', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onWillRenameFiles(
            (params, context) async => const WorkspaceEdit(
              changes: {
                'file:///a.dart': [TextEdit(range: _range, newText: 'x')],
              },
            ),
          );
        },
      );

      final r = await client.server.workspace.willRenameFiles(
        const RenameFilesParams(
          files: [
            FileRename(oldUri: 'file:///o.dart', newUri: 'file:///n.dart'),
          ],
        ),
      );

      expect(r!.changes!['file:///a.dart']!.first.newText, 'x');
    });

    test('willDeleteFiles round-trips a WorkspaceEdit', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspace.onWillDeleteFiles(
            (params, context) async => const WorkspaceEdit(
              changes: {
                'file:///a.dart': [TextEdit(range: _range, newText: 'x')],
              },
            ),
          );
        },
      );

      final r = await client.server.workspace.willDeleteFiles(
        const DeleteFilesParams(files: [FileDelete(uri: 'file:///o.dart')]),
      );

      expect(r!.changes!['file:///a.dart']!.first.newText, 'x');
    });
  });

  group('E2E callHierarchy requests', () {
    test('incomingCalls round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.callHierarchy.onIncomingCalls(
            (params, context) async => const [
              CallHierarchyIncomingCall(
                from: CallHierarchyItem(
                  name: 'f',
                  kind: SymbolKind.function,
                  uri: 'file:///a.dart',
                  range: _range,
                  selectionRange: _range,
                ),
                fromRanges: [_range],
              ),
            ],
          );
        },
      );

      final r = await client.server.callHierarchy.incomingCalls(
        const CallHierarchyIncomingCallsParams(
          item: CallHierarchyItem(
            name: 'f',
            kind: SymbolKind.function,
            uri: 'file:///a.dart',
            range: _range,
            selectionRange: _range,
          ),
        ),
      );

      expect(r![0].from.name, 'f');
    });

    test('outgoingCalls round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.callHierarchy.onOutgoingCalls(
            (params, context) async => const [
              CallHierarchyOutgoingCall(
                to: CallHierarchyItem(
                  name: 'g',
                  kind: SymbolKind.function,
                  uri: 'file:///a.dart',
                  range: _range,
                  selectionRange: _range,
                ),
                fromRanges: [_range],
              ),
            ],
          );
        },
      );

      final r = await client.server.callHierarchy.outgoingCalls(
        const CallHierarchyOutgoingCallsParams(
          item: CallHierarchyItem(
            name: 'g',
            kind: SymbolKind.function,
            uri: 'file:///a.dart',
            range: _range,
            selectionRange: _range,
          ),
        ),
      );

      expect(r![0].to.name, 'g');
    });
  });

  group('E2E typeHierarchy requests', () {
    test('supertypes round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.typeHierarchy.onSupertypes(
            (params, context) async => const [
              TypeHierarchyItem(
                name: 'C',
                kind: SymbolKind.class$,
                uri: 'file:///a.dart',
                range: _range,
                selectionRange: _range,
              ),
            ],
          );
        },
      );

      final r = await client.server.typeHierarchy.supertypes(
        const TypeHierarchySupertypesParams(
          item: TypeHierarchyItem(
            name: 'C',
            kind: SymbolKind.class$,
            uri: 'file:///a.dart',
            range: _range,
            selectionRange: _range,
          ),
        ),
      );

      expect(r![0].name, 'C');
    });

    test('subtypes round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.typeHierarchy.onSubtypes(
            (params, context) async => const [
              TypeHierarchyItem(
                name: 'D',
                kind: SymbolKind.class$,
                uri: 'file:///a.dart',
                range: _range,
                selectionRange: _range,
              ),
            ],
          );
        },
      );

      final r = await client.server.typeHierarchy.subtypes(
        const TypeHierarchySubtypesParams(
          item: TypeHierarchyItem(
            name: 'D',
            kind: SymbolKind.class$,
            uri: 'file:///a.dart',
            range: _range,
            selectionRange: _range,
          ),
        ),
      );

      expect(r![0].name, 'D');
    });
  });

  group('E2E resolve requests', () {
    test('inlayHint.resolve round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.inlayHint.onResolve(
            (params, context) async => const InlayHint(
              position: Position(line: 0, character: 0),
              label: InlayHintLabel.string('y'),
            ),
          );
        },
      );

      final r = await client.server.inlayHint.resolve(
        const InlayHint(
          position: Position(line: 0, character: 0),
          label: InlayHintLabel.string('x'),
        ),
      );

      expect(r.label.asString, 'y');
    });

    test('completionItem.resolve round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.completionItem.onResolve(
            (params, context) async =>
                const CompletionItem(label: 'f', detail: 'd'),
          );
        },
      );

      final r = await client.server.completionItem.resolve(
        const CompletionItem(label: 'f'),
      );

      expect(r.detail, 'd');
    });

    test('codeAction.resolve round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.codeAction.onResolve(
            (params, context) async =>
                const CodeAction(title: 'Fix', isPreferred: true),
          );
        },
      );

      final r = await client.server.codeAction.resolve(
        const CodeAction(title: 'Fix'),
      );

      expect(r.isPreferred, isTrue);
    });

    test('workspaceSymbol.resolve round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.workspaceSymbol.onResolve(
            (params, context) async => WorkspaceSymbol(
              name: 'C',
              kind: SymbolKind.class$,
              location: WorkspaceSymbolLocation.uri(uri: 'file:///a.dart'),
              containerName: 'x',
            ),
          );
        },
      );

      final r = await client.server.workspaceSymbol.resolve(
        WorkspaceSymbol(
          name: 'C',
          kind: SymbolKind.class$,
          location: WorkspaceSymbolLocation.uri(uri: 'file:///a.dart'),
        ),
      );

      expect(r.containerName, 'x');
    });

    test('codeLens.resolve round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.codeLens.onResolve(
            (params, context) async => const CodeLens(
              range: _range,
              command: Command(title: 't', command: 'c'),
            ),
          );
        },
      );

      final r = await client.server.codeLens.resolve(
        const CodeLens(range: _range),
      );

      expect(r.command!.title, 't');
    });

    test('documentLink.resolve round-trips', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.documentLink.onResolve(
            (params, context) async =>
                const DocumentLink(range: _range, target: 'https://x'),
          );
        },
      );

      final r = await client.server.documentLink.resolve(
        const DocumentLink(range: _range),
      );

      expect(r.target, 'https://x');
    });
  });
}
