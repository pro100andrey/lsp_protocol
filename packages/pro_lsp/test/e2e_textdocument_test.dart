import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/e2e_harness.dart';

/// End-to-end round-trip tests for the remaining `textDocument/*`
/// client→server requests (hover/definition live in `e2e_test.dart`). Each test
/// registers a typed server handler returning a non-empty result, invokes the
/// matching client method, and asserts on the unpacked value — exercising the
/// full serialize/transport/deserialize path.
void main() {
  final connect = e2eHarness();

  const doc = TextDocumentIdentifier(uri: 'file:///a.dart');
  const position = Position(line: 0, character: 0);
  const range = Range(
    start: Position(line: 0, character: 0),
    end: Position(line: 0, character: 3),
  );
  const options = FormattingOptions(tabSize: 2, insertSpaces: true);
  const edit = TextEdit(range: range, newText: 'x');

  group('E2E textDocument requests', () {
    test('implementation round-trips a Location', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onImplementation(
            (params, context) async => ImplementationResult.definition(
              Definition.location(
                const Location(uri: 'file:///b.dart', range: range),
              ),
            ),
          );
        },
      );

      final r = await client.server.textDocument.implementation(
        const ImplementationParams(textDocument: doc, position: position),
      );

      expect(r.asDefinition!.asLocation!.uri, 'file:///b.dart');
    });

    test('typeDefinition round-trips a Location', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onTypeDefinition(
            (params, context) async => TypeDefinitionResult.definition(
              Definition.location(
                const Location(uri: 'file:///b.dart', range: range),
              ),
            ),
          );
        },
      );

      final r = await client.server.textDocument.typeDefinition(
        const TypeDefinitionParams(textDocument: doc, position: position),
      );

      expect(r.asDefinition!.asLocation!.uri, 'file:///b.dart');
    });

    test('declaration round-trips a Location', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDeclaration(
            (params, context) async => DeclarationResult.declaration(
              Declaration.location(
                const Location(uri: 'file:///b.dart', range: range),
              ),
            ),
          );
        },
      );

      final r = await client.server.textDocument.declaration(
        const DeclarationParams(textDocument: doc, position: position),
      );

      expect(r.asDeclaration!.asLocation!.uri, 'file:///b.dart');
    });

    test('references round-trips a list of Locations', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onReferences(
            (params, context) async => const [
              Location(uri: 'file:///b.dart', range: range),
            ],
          );
        },
      );

      final r = await client.server.textDocument.references(
        const ReferenceParams(
          textDocument: doc,
          position: position,
          context: ReferenceContext(includeDeclaration: true),
        ),
      );

      expect(r![0].uri, 'file:///b.dart');
    });

    test('semanticTokensFull round-trips token data', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onSemanticTokensFull(
            (params, context) async =>
                const SemanticTokens(data: [0, 0, 3, 1, 0]),
          );
        },
      );

      final r = await client.server.textDocument.semanticTokensFull(
        const SemanticTokensParams(textDocument: doc),
      );

      expect(r!.data, [0, 0, 3, 1, 0]);
    });

    test('semanticTokensFullDelta round-trips full tokens', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onSemanticTokensFullDelta(
            (params, context) async =>
                SemanticTokensFullDeltaResult.semanticTokens(
                  const SemanticTokens(data: [0, 0, 3, 1, 0]),
                ),
          );
        },
      );

      final r = await client.server.textDocument.semanticTokensFullDelta(
        const SemanticTokensDeltaParams(
          textDocument: doc,
          previousResultId: 'prev',
        ),
      );

      expect(r.asSemanticTokens!.data, [0, 0, 3, 1, 0]);
    });

    test('semanticTokensRange round-trips token data', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onSemanticTokensRange(
            (params, context) async =>
                const SemanticTokens(data: [0, 0, 3, 1, 0]),
          );
        },
      );

      final r = await client.server.textDocument.semanticTokensRange(
        const SemanticTokensRangeParams(textDocument: doc, range: range),
      );

      expect(r!.data, [0, 0, 3, 1, 0]);
    });

    test('linkedEditingRange round-trips ranges', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onLinkedEditingRange(
            (params, context) async =>
                const LinkedEditingRanges(ranges: [range]),
          );
        },
      );

      final r = await client.server.textDocument.linkedEditingRange(
        const LinkedEditingRangeParams(textDocument: doc, position: position),
      );

      expect(r!.ranges, hasLength(1));
    });

    test('diagnostic round-trips a full report', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDiagnostic(
            (params, context) async =>
                DocumentDiagnosticReport.relatedFullDocumentDiagnosticReport(
                  const RelatedFullDocumentDiagnosticReport(items: []),
                ),
          );
        },
      );

      final r = await client.server.textDocument.diagnostic(
        const DocumentDiagnosticParams(textDocument: doc),
      );

      expect(r.asRelatedFullDocumentDiagnosticReport!.kind, 'full');
    });

    test('inlineCompletion round-trips items', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onInlineCompletion(
            (params, context) async =>
                InlineCompletionResult.inlineCompletionItemList(
                  const [
                    InlineCompletionItem(
                      insertText: InlineCompletionItemInsertText.string('xyz'),
                    ),
                  ],
                ),
          );
        },
      );

      final r = await client.server.textDocument.inlineCompletion(
        const InlineCompletionParams(
          textDocument: doc,
          position: position,
          context: InlineCompletionContext(
            triggerKind: InlineCompletionTriggerKind.automatic,
          ),
        ),
      );

      expect(r.asInlineCompletionItemList, hasLength(1));
    });

    test('signatureHelp round-trips signatures', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onSignatureHelp(
            (params, context) async => const SignatureHelp(
              signatures: [SignatureInformation(label: 'f()')],
            ),
          );
        },
      );

      final r = await client.server.textDocument.signatureHelp(
        const SignatureHelpParams(textDocument: doc, position: position),
      );

      expect(r!.signatures.single.label, 'f()');
    });

    test('documentSymbol round-trips symbols', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDocumentSymbol(
            (params, context) async => DocumentSymbolResult.documentSymbolList(
              const [
                DocumentSymbol(
                  name: 'C',
                  kind: SymbolKind.class$,
                  range: range,
                  selectionRange: range,
                ),
              ],
            ),
          );
        },
      );

      final r = await client.server.textDocument.documentSymbol(
        const DocumentSymbolParams(textDocument: doc),
      );

      expect(r.asDocumentSymbolList!.single.name, 'C');
    });

    test('prepareRename round-trips a range', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onPrepareRename(
            (params, context) async => PrepareRenameResult.range(range),
          );
        },
      );

      final r = await client.server.textDocument.prepareRename(
        const PrepareRenameParams(textDocument: doc, position: position),
      );

      expect(r!.asRange, range);
    });

    test('rename round-trips a WorkspaceEdit', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onRename(
            (params, context) async => const WorkspaceEdit(
              changes: {
                'file:///a.dart': [edit],
              },
            ),
          );
        },
      );

      final r = await client.server.textDocument.rename(
        const RenameParams(
          textDocument: doc,
          position: position,
          newName: 'y',
        ),
      );

      expect(r!.changes!['file:///a.dart']!.single.newText, 'x');
    });

    test('foldingRange round-trips ranges', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onFoldingRange(
            (params, context) async => const [
              FoldingRange(startLine: 0, endLine: 10),
            ],
          );
        },
      );

      final r = await client.server.textDocument.foldingRange(
        const FoldingRangeParams(textDocument: doc),
      );

      expect(r!.single.endLine, 10);
    });

    test('documentHighlight round-trips highlights', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDocumentHighlight(
            (params, context) async => const [
              DocumentHighlight(
                range: range,
                kind: DocumentHighlightKind.read,
              ),
            ],
          );
        },
      );

      final r = await client.server.textDocument.documentHighlight(
        const DocumentHighlightParams(textDocument: doc, position: position),
      );

      expect(r!.single.kind, DocumentHighlightKind.read);
    });

    test('documentColor round-trips color information', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDocumentColor(
            (params, context) async => const [
              ColorInformation(
                range: range,
                color: Color(red: 1, green: 0, blue: 0, alpha: 1),
              ),
            ],
          );
        },
      );

      final r = await client.server.textDocument.documentColor(
        const DocumentColorParams(textDocument: doc),
      );

      expect(r.single.color.red, 1);
    });

    test('colorPresentation round-trips presentations', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onColorPresentation(
            (params, context) async => const [ColorPresentation(label: '#f00')],
          );
        },
      );

      final r = await client.server.textDocument.colorPresentation(
        const ColorPresentationParams(
          textDocument: doc,
          color: Color(red: 1, green: 0, blue: 0, alpha: 1),
          range: range,
        ),
      );

      expect(r.single.label, '#f00');
    });

    test('codeAction round-trips a CodeAction', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onCodeAction(
            (params, context) async => const [CodeAction(title: 'Fix it')],
          );
        },
      );

      final r = await client.server.textDocument.codeAction(
        const CodeActionParams(
          textDocument: doc,
          range: range,
          context: CodeActionContext(diagnostics: []),
        ),
      );

      final action = CodeAction.fromJson(r![0] as Map<String, dynamic>);
      expect(action.title, 'Fix it');
    });

    test('codeLens round-trips lenses', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onCodeLens(
            (params, context) async => const [CodeLens(range: range)],
          );
        },
      );

      final r = await client.server.textDocument.codeLens(
        const CodeLensParams(textDocument: doc),
      );

      expect(r!.single.range, range);
    });

    test('documentLink round-trips links', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onDocumentLink(
            (params, context) async => const [
              DocumentLink(range: range, target: 'https://x'),
            ],
          );
        },
      );

      final r = await client.server.textDocument.documentLink(
        const DocumentLinkParams(textDocument: doc),
      );

      expect(r!.single.target, 'https://x');
    });

    test('formatting round-trips text edits', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onFormatting(
            (params, context) async => const [edit],
          );
        },
      );

      final r = await client.server.textDocument.formatting(
        const DocumentFormattingParams(textDocument: doc, options: options),
      );

      expect(r!.single.newText, 'x');
    });

    test('rangeFormatting round-trips text edits', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onRangeFormatting(
            (params, context) async => const [edit],
          );
        },
      );

      final r = await client.server.textDocument.rangeFormatting(
        const DocumentRangeFormattingParams(
          textDocument: doc,
          range: range,
          options: options,
        ),
      );

      expect(r!.single.newText, 'x');
    });

    test('onTypeFormatting round-trips text edits', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onOnTypeFormatting(
            (params, context) async => const [edit],
          );
        },
      );

      final r = await client.server.textDocument.onTypeFormatting(
        const DocumentOnTypeFormattingParams(
          textDocument: doc,
          position: position,
          ch: ';',
          options: options,
        ),
      );

      expect(r!.single.newText, 'x');
    });

    test('selectionRange round-trips ranges', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onSelectionRange(
            (params, context) async => const [SelectionRange(range: range)],
          );
        },
      );

      final r = await client.server.textDocument.selectionRange(
        const SelectionRangeParams(
          textDocument: doc,
          positions: [position],
        ),
      );

      expect(r!.single.range, range);
    });

    test('inlayHint round-trips hints', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onInlayHint(
            (params, context) async => const [
              InlayHint(
                position: position,
                label: InlayHintLabel.string('x'),
              ),
            ],
          );
        },
      );

      final r = await client.server.textDocument.inlayHint(
        const InlayHintParams(textDocument: doc, range: range),
      );

      expect(r!.single.position, position);
    });

    test('prepareCallHierarchy round-trips items', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onPrepareCallHierarchy(
            (params, context) async => const [
              CallHierarchyItem(
                name: 'f',
                kind: SymbolKind.function,
                uri: 'file:///a.dart',
                range: range,
                selectionRange: range,
              ),
            ],
          );
        },
      );

      final r = await client.server.textDocument.prepareCallHierarchy(
        const CallHierarchyPrepareParams(
          textDocument: doc,
          position: position,
        ),
      );

      expect(r!.single.name, 'f');
    });

    test('prepareTypeHierarchy round-trips items', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onPrepareTypeHierarchy(
            (params, context) async => const [
              TypeHierarchyItem(
                name: 'C',
                kind: SymbolKind.class$,
                uri: 'file:///a.dart',
                range: range,
                selectionRange: range,
              ),
            ],
          );
        },
      );

      final r = await client.server.textDocument.prepareTypeHierarchy(
        const TypeHierarchyPrepareParams(
          textDocument: doc,
          position: position,
        ),
      );

      expect(r!.single.name, 'C');
    });

    test('moniker round-trips monikers', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onMoniker(
            (params, context) async => const [
              Moniker(
                scheme: 'dart',
                identifier: 'x',
                unique: UniquenessLevel.global,
                kind: MonikerKind.import,
              ),
            ],
          );
        },
      );

      final r = await client.server.textDocument.moniker(
        const MonikerParams(textDocument: doc, position: position),
      );

      expect(r!.single.identifier, 'x');
    });

    test('completion round-trips a CompletionList', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onCompletion(
            (params, context) async => CompletionResult.completionList(
              const CompletionList(
                isIncomplete: false,
                items: [CompletionItem(label: 'print')],
              ),
            ),
          );
        },
      );

      final r = await client.server.textDocument.completion(
        const CompletionParams(textDocument: doc, position: position),
      );

      expect(r.asCompletionList!.items.single.label, 'print');
    });

    test('rangesFormatting round-trips text edits', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onRangesFormatting(
            (params, context) async => const [edit],
          );
        },
      );

      final r = await client.server.textDocument.rangesFormatting(
        const DocumentRangesFormattingParams(
          textDocument: doc,
          ranges: [range],
          options: options,
        ),
      );

      expect(r!.single.newText, 'x');
    });

    test('inlineValue round-trips inline values', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onInlineValue(
            (params, context) async => [
              InlineValue.text(const InlineValueText(range: range, text: '42')),
            ],
          );
        },
      );

      final r = await client.server.textDocument.inlineValue(
        const InlineValueParams(
          textDocument: doc,
          range: range,
          context: InlineValueContext(frameId: 1, stoppedLocation: range),
        ),
      );

      expect(r!.single.asText!.text, '42');
    });

    test('willSaveWaitUntil round-trips text edits', () async {
      final (:server, :client) = await connect(
        configureServer: (server) {
          server.textDocument.onWillSaveWaitUntil(
            (params, context) async => const [edit],
          );
        },
      );

      final r = await client.server.textDocument.willSaveWaitUntil(
        const WillSaveTextDocumentParams(
          textDocument: doc,
          reason: TextDocumentSaveReason.manual,
        ),
      );

      expect(r!.single.newText, 'x');
    });
  });
}
