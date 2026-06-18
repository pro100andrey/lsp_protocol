<!-- markdownlint-disable-file MD004 -->
# Language features

Language features are the `textDocument/*` requests that turn a flat text buffer
into a navigable, intelligent document: jump-to-definition, hover, completion,
diagnostics, semantic highlighting, and so on. Each request carries a
`TextDocumentIdentifier` (and usually a `Position` or `Range`), and the server
answers from its analysis of that document.

Every feature is opt-in through `ServerCapabilities` declared at `initialize`
time — a client only sends a request if the server advertised the matching
provider (`hoverProvider`, `definitionProvider`, `completionProvider`,
`semanticTokensProvider`, `diagnosticProvider`, …). On the server you register a
typed handler with `server.textDocument.on<Feature>(...)`; on the client you
invoke `client.server.textDocument.<feature>(...)`.

Some features are **two-phase**: the list request returns lightweight items, and
a `*/resolve` request lazily fills in expensive fields (documentation, edits,
commands, tooltips) only for the item the user actually focuses. Those resolve
methods live on their own proxy namespace
(`client.server.completionItem.resolve`, `server.completionItem.onResolve`, …)
and are documented alongside their parent feature below.

See also: [hierarchies](./hierarchies.md) for the prepare→calls/types pattern,
[workspace](./workspace.md) for workspace-wide variants and `*/refresh`
requests, and the [server guide](../guides/server.md) for capability
declaration.

---

## Navigation

Position-driven "go to" requests. Most return a `Location`, a list of
`Location`s, or `LocationLink`s wrapped in a small result union — unpack with the
`as*` getters (nullable, so use `!` once you know the variant).

### `textDocument/definition` — Go to Definition

**client → server · request**

When to use it: resolve the symbol under the cursor to where it is defined.
The canonical "F12 / go to definition" jump.

Handle it (server):

```dart
server.textDocument.onDefinition(
  (params, context) async => DefinitionResult.definition(
    Definition.location(
      const Location(uri: 'file:///b.dart', range: range),
    ),
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.definition(
  const DefinitionParams(textDocument: doc, position: position),
);
final uri = result.asDefinition!.asLocation!.uri;
```

### `textDocument/declaration` — Go to Declaration

**client → server · request**

When to use it: jump to the symbol's declaration, which in some languages
differs from its definition (e.g. a forward declaration vs. the implementation).

Handle it (server):

```dart
server.textDocument.onDeclaration(
  (params, context) async => DeclarationResult.declaration(
    Declaration.location(
      const Location(uri: 'file:///b.dart', range: range),
    ),
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.declaration(
  const DeclarationParams(textDocument: doc, position: position),
);
final uri = result.asDeclaration!.asLocation!.uri;
```

### `textDocument/typeDefinition` — Go to Type Definition

**client → server · request**

When to use it: jump from a variable or expression to the definition of its
*type* rather than the symbol itself.

Handle it (server):

```dart
server.textDocument.onTypeDefinition(
  (params, context) async => TypeDefinitionResult.definition(
    Definition.location(
      const Location(uri: 'file:///b.dart', range: range),
    ),
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.typeDefinition(
  const TypeDefinitionParams(textDocument: doc, position: position),
);
final uri = result.asDefinition!.asLocation!.uri;
```

### `textDocument/implementation` — Go to Implementation

**client → server · request**

When to use it: from an interface, abstract method, or base class, find the
concrete implementations.

Handle it (server):

```dart
server.textDocument.onImplementation(
  (params, context) async => ImplementationResult.definition(
    Definition.location(
      const Location(uri: 'file:///b.dart', range: range),
    ),
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.implementation(
  const ImplementationParams(textDocument: doc, position: position),
);
final uri = result.asDefinition!.asLocation!.uri;
```

### `textDocument/references` — Find All References

**client → server · request**

When to use it: list every usage of the symbol under the cursor. Set
`includeDeclaration` in the `ReferenceContext` to also include the declaration
site. Returns a nullable `List<Location>`.

Handle it (server):

```dart
server.textDocument.onReferences(
  (params, context) async => const [
    Location(uri: 'file:///b.dart', range: range),
  ],
);
```

Call it (client):

```dart
final refs = await client.server.textDocument.references(
  const ReferenceParams(
    textDocument: doc,
    position: position,
    context: ReferenceContext(includeDeclaration: true),
  ),
);
final first = refs![0].uri;
```

### `textDocument/documentHighlight` — Document Highlights

**client → server · request**

When to use it: highlight all occurrences of the symbol under the cursor within
the *current* document (e.g. read/write usages of a local variable). Cheaper and
document-scoped, unlike `references`.

Handle it (server):

```dart
server.textDocument.onDocumentHighlight(
  (params, context) async => const [
    DocumentHighlight(range: range, kind: DocumentHighlightKind.read),
  ],
);
```

Call it (client):

```dart
final highlights = await client.server.textDocument.documentHighlight(
  const DocumentHighlightParams(textDocument: doc, position: position),
);
final kind = highlights!.single.kind;
```

### `textDocument/moniker` — Moniker

**client → server · request**

When to use it: obtain stable, project-external identifiers ("monikers") for the
symbol under the cursor, used for cross-repository code navigation and indexing
(LSIF). Returns a nullable `List<Moniker>`.

Handle it (server):

```dart
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
```

Call it (client):

```dart
final monikers = await client.server.textDocument.moniker(
  const MonikerParams(textDocument: doc, position: position),
);
final id = monikers!.single.identifier;
```

---

## Reading

Requests that surface information about a position or the whole document without
changing it: tooltips, signatures, structure, folding, colors.

### `textDocument/hover` — Hover

**client → server · request**

When to use it: show documentation/type info for the symbol under the cursor on
mouse-hover or keyboard focus. Contents are a `MarkupContent` union; an optional
`range` tells the editor what to underline.

Handle it (server):

```dart
server.textDocument.onHover(
  (params, context) async => Hover(
    contents: HoverContents.markupContent(
      const MarkupContent(kind: MarkupKind.markdown, value: '**doc**'),
    ),
    range: Range(start: params.position, end: params.position),
  ),
);
```

Call it (client):

```dart
final hover = await client.server.textDocument.hover(
  const HoverParams(textDocument: doc, position: position),
);
final value = hover!.contents.asMarkupContent!.value;
```

### `textDocument/signatureHelp` — Signature Help

**client → server · request**

When to use it: while the user types inside a call's argument list, show the
function signature(s) and highlight the active parameter.

Handle it (server):

```dart
server.textDocument.onSignatureHelp(
  (params, context) async => const SignatureHelp(
    signatures: [SignatureInformation(label: 'f()')],
  ),
);
```

Call it (client):

```dart
final help = await client.server.textDocument.signatureHelp(
  const SignatureHelpParams(textDocument: doc, position: position),
);
final label = help!.signatures.single.label;
```

### `textDocument/documentSymbol` — Document Symbols

**client → server · request**

When to use it: power the outline/breadcrumb view — the symbols defined in a
document. Prefer the hierarchical `DocumentSymbol` form (with nested `children`)
over the flat `SymbolInformation` form. The result is a union; unpack with
`asDocumentSymbolList` (or `asSymbolInformationList`).

Handle it (server):

```dart
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
```

Call it (client):

```dart
final result = await client.server.textDocument.documentSymbol(
  const DocumentSymbolParams(textDocument: doc),
);
final name = result.asDocumentSymbolList!.single.name;
```

### `textDocument/selectionRange` — Selection Ranges

**client → server · request**

When to use it: implement "expand/shrink selection" — for each input position,
the server returns a nested `SelectionRange` chain (the token, its statement, its
block, …).

Handle it (server):

```dart
server.textDocument.onSelectionRange(
  (params, context) async => const [SelectionRange(range: range)],
);
```

Call it (client):

```dart
final ranges = await client.server.textDocument.selectionRange(
  const SelectionRangeParams(textDocument: doc, positions: [position]),
);
final r = ranges!.single.range;
```

### `textDocument/foldingRange` — Folding Ranges

**client → server · request**

When to use it: tell the editor which line spans can be collapsed (functions,
imports, regions, comments). Returns a nullable `List<FoldingRange>`.

Handle it (server):

```dart
server.textDocument.onFoldingRange(
  (params, context) async => const [FoldingRange(startLine: 0, endLine: 10)],
);
```

Call it (client):

```dart
final ranges = await client.server.textDocument.foldingRange(
  const FoldingRangeParams(textDocument: doc),
);
final end = ranges!.single.endLine;
```

### `textDocument/documentColor` — Document Colors

**client → server · request**

When to use it: locate color literals in a document so the editor can render
swatches and color pickers. Returns a `List<ColorInformation>` (each pairing a
`Range` with a normalized `Color`).

Handle it (server):

```dart
server.textDocument.onDocumentColor(
  (params, context) async => const [
    ColorInformation(
      range: range,
      color: Color(red: 1, green: 0, blue: 0, alpha: 1),
    ),
  ],
);
```

Call it (client):

```dart
final colors = await client.server.textDocument.documentColor(
  const DocumentColorParams(textDocument: doc),
);
final red = colors.single.color.red;
```

### `textDocument/colorPresentation` — Color Presentations

**client → server · request**

When to use it: the follow-up to `documentColor` — given a `Color` and a
`Range`, return how to *write* that color in this language (e.g. `#f00`,
`rgb(...)`), as `ColorPresentation`s the user can pick from.

Handle it (server):

```dart
server.textDocument.onColorPresentation(
  (params, context) async => const [ColorPresentation(label: '#f00')],
);
```

Call it (client):

```dart
final presentations = await client.server.textDocument.colorPresentation(
  const ColorPresentationParams(
    textDocument: doc,
    color: Color(red: 1, green: 0, blue: 0, alpha: 1),
    range: range,
  ),
);
final label = presentations.single.label;
```

### `textDocument/linkedEditingRange` — Linked Editing Ranges

**client → server · request**

When to use it: return ranges that should be edited together (e.g. an HTML open
and close tag) so renaming one updates the others live as the user types.

Handle it (server):

```dart
server.textDocument.onLinkedEditingRange(
  (params, context) async => const LinkedEditingRanges(ranges: [range]),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.linkedEditingRange(
  const LinkedEditingRangeParams(textDocument: doc, position: position),
);
final count = result!.ranges.length;
```

---

## Editing

Requests that produce edits the editor applies: completion, inline completion,
rename, and the various formatting flavors. Formatting returns a nullable
`List<TextEdit>`.

### `textDocument/completion` — Completion

**client → server · request**

When to use it: the core autocomplete request, fired as the user types or on
demand. The result union is either a bare `List<CompletionItem>`
(`asCompletionItemList`) or a `CompletionList` with an `isIncomplete` flag
(`asCompletionList`). Keep items lightweight and defer the heavy fields to
`completionItem/resolve`.

Handle it (server):

```dart
server.textDocument.onCompletion(
  (params, context) async => CompletionResult.completionItemList(
    const [CompletionItem(label: 'foo')],
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.completion(
  const CompletionParams(textDocument: doc, position: position),
);
final items = result.asCompletionItemList ?? result.asCompletionList!.items;
```

### `completionItem/resolve` — Resolve Completion Item

**client → server · request**

When to use it: lazily fill in a single completion item's expensive fields
(`detail`, `documentation`, `additionalTextEdits`) only when the user highlights
it in the list. Lives on the `completionItem` proxy, not `textDocument`.

Handle it (server):

```dart
server.completionItem.onResolve(
  (params, context) async => const CompletionItem(label: 'f', detail: 'd'),
);
```

Call it (client):

```dart
final resolved = await client.server.completionItem.resolve(
  const CompletionItem(label: 'f'),
);
final detail = resolved.detail;
```

### `textDocument/inlineCompletion` — Inline Completion

**client → server · request**

When to use it: AI/ghost-text style inline suggestions shown at the cursor. The
result union exposes `asInlineCompletionItemList`. `insertText` is itself a
union (`string` or a `StringValue` snippet).

Handle it (server):

```dart
server.textDocument.onInlineCompletion(
  (params, context) async => InlineCompletionResult.inlineCompletionItemList(
    const [
      InlineCompletionItem(
        insertText: InlineCompletionItemInsertText.string('xyz'),
      ),
    ],
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.inlineCompletion(
  const InlineCompletionParams(
    textDocument: doc,
    position: position,
    context: InlineCompletionContext(
      triggerKind: InlineCompletionTriggerKind.automatic,
    ),
  ),
);
final items = result.asInlineCompletionItemList;
```

### `textDocument/rename` — Rename

**client → server · request**

When to use it: rename a symbol everywhere. Returns a `WorkspaceEdit`; read
`changes` (per-URI `List<TextEdit>`) or `documentChanges`. Pair with
`prepareRename` to validate first.

Handle it (server):

```dart
server.textDocument.onRename(
  (params, context) async => const WorkspaceEdit(
    changes: {
      'file:///a.dart': [edit],
    },
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.rename(
  const RenameParams(textDocument: doc, position: position, newName: 'y'),
);
final newText = result!.changes!['file:///a.dart']!.single.newText;
```

### `textDocument/prepareRename` — Prepare Rename

**client → server · request**

When to use it: before showing the rename input box, ask the server whether the
position is renameable and what range/placeholder to use. The result union
exposes `asRange` (and richer variants).

Handle it (server):

```dart
server.textDocument.onPrepareRename(
  (params, context) async => PrepareRenameResult.range(range),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.prepareRename(
  const PrepareRenameParams(textDocument: doc, position: position),
);
final r = result!.asRange;
```

### `textDocument/formatting` — Format Document

**client → server · request**

When to use it: format the entire document. Returns a nullable `List<TextEdit>`.

Handle it (server):

```dart
server.textDocument.onFormatting(
  (params, context) async => const [edit],
);
```

Call it (client):

```dart
final edits = await client.server.textDocument.formatting(
  const DocumentFormattingParams(textDocument: doc, options: options),
);
final newText = edits!.single.newText;
```

### `textDocument/rangeFormatting` — Format Range

**client → server · request**

When to use it: format a single selected `Range` rather than the whole document.

Handle it (server):

```dart
server.textDocument.onRangeFormatting(
  (params, context) async => const [edit],
);
```

Call it (client):

```dart
final edits = await client.server.textDocument.rangeFormatting(
  const DocumentRangeFormattingParams(
    textDocument: doc,
    range: range,
    options: options,
  ),
);
final newText = edits!.single.newText;
```

### `textDocument/rangesFormatting` — Format Ranges

**client → server · request**

When to use it: format several disjoint ranges in one request (e.g. all selected
regions in a multi-cursor selection). Like `rangeFormatting` but takes a
`List<Range>`. Returns a nullable `List<TextEdit>`.

Handle it (server):

```dart
server.textDocument.onRangesFormatting(
  (params, context) async => const [edit],
);
```

Call it (client):

```dart
final edits = await client.server.textDocument.rangesFormatting(
  const DocumentRangesFormattingParams(
    textDocument: doc,
    ranges: [range],
    options: options,
  ),
);
final newText = edits!.single.newText;
```

### `textDocument/onTypeFormatting` — On-Type Formatting

**client → server · request**

When to use it: format as the user types a trigger character (`ch`), e.g.
re-indenting when `;` or `}` is entered. The trigger characters are declared in
`ServerCapabilities`.

Handle it (server):

```dart
server.textDocument.onOnTypeFormatting(
  (params, context) async => const [edit],
);
```

Call it (client):

```dart
final edits = await client.server.textDocument.onTypeFormatting(
  const DocumentOnTypeFormattingParams(
    textDocument: doc,
    position: position,
    ch: ';',
    options: options,
  ),
);
final newText = edits!.single.newText;
```

---

## Code intelligence

Higher-level, often actionable annotations: quick-fixes, lenses, links, and
inlay hints. Each has a lightweight list request and (except inlay-only cases) a
lazy `*/resolve`. Several pair with a `workspace/*/refresh` server→client
request — see [workspace](./workspace.md).

### `textDocument/codeAction` — Code Actions

**client → server · request**

When to use it: provide quick-fixes and refactorings for a `Range` (the
lightbulb menu). The `CodeActionContext` carries the diagnostics in scope.
Return `CodeAction`s and/or `Command`s; defer expensive `edit` computation to
`codeAction/resolve`.

Handle it (server):

```dart
server.textDocument.onCodeAction(
  (params, context) async => const [CodeAction(title: 'Fix it')],
);
```

Call it (client):

```dart
final result = await client.server.textDocument.codeAction(
  const CodeActionParams(
    textDocument: doc,
    range: range,
    context: CodeActionContext(diagnostics: []),
  ),
);
final action = CodeAction.fromJson(result![0] as Map<String, dynamic>);
```

### `codeAction/resolve` — Resolve Code Action

**client → server · request**

When to use it: compute the `edit`/`command` for a code action only when the
user selects it. Lives on the `codeAction` proxy.

Handle it (server):

```dart
server.codeAction.onResolve(
  (params, context) async => const CodeAction(title: 'Fix', isPreferred: true),
);
```

Call it (client):

```dart
final resolved = await client.server.codeAction.resolve(
  const CodeAction(title: 'Fix'),
);
final preferred = resolved.isPreferred;
```

### `textDocument/codeLens` — Code Lens

**client → server · request**

When to use it: return actionable annotations rendered inline above lines ("3
references", "Run test"). Return lenses with just a `range` and resolve the
`command` lazily. Returns a nullable `List<CodeLens>`.

Handle it (server):

```dart
server.textDocument.onCodeLens(
  (params, context) async => const [CodeLens(range: range)],
);
```

Call it (client):

```dart
final lenses = await client.server.textDocument.codeLens(
  const CodeLensParams(textDocument: doc),
);
final r = lenses!.single.range;
```

### `codeLens/resolve` — Resolve Code Lens

**client → server · request**

When to use it: attach the `command` to a code lens only when it becomes
visible. Lives on the `codeLens` proxy.

Handle it (server):

```dart
server.codeLens.onResolve(
  (params, context) async => const CodeLens(
    range: range,
    command: Command(title: 't', command: 'c'),
  ),
);
```

Call it (client):

```dart
final resolved = await client.server.codeLens.resolve(
  const CodeLens(range: range),
);
final title = resolved.command!.title;
```

When the server's lenses become stale, it can ask the client to re-query them
all via the `workspace/codeLens/refresh` server→client request — see
[workspace](./workspace.md).

### `textDocument/documentLink` — Document Links

**client → server · request**

When to use it: detect clickable links in a document (imports, URLs, file
paths). Return links with a `range` and resolve the `target` lazily. Returns a
nullable `List<DocumentLink>`.

Handle it (server):

```dart
server.textDocument.onDocumentLink(
  (params, context) async => const [
    DocumentLink(range: range, target: 'https://x'),
  ],
);
```

Call it (client):

```dart
final links = await client.server.textDocument.documentLink(
  const DocumentLinkParams(textDocument: doc),
);
final target = links!.single.target;
```

### `documentLink/resolve` — Resolve Document Link

**client → server · request**

When to use it: compute a link's `target` only when the user activates it. Lives
on the `documentLink` proxy.

Handle it (server):

```dart
server.documentLink.onResolve(
  (params, context) async =>
      const DocumentLink(range: range, target: 'https://x'),
);
```

Call it (client):

```dart
final resolved = await client.server.documentLink.resolve(
  const DocumentLink(range: range),
);
final target = resolved.target;
```

### `textDocument/inlayHint` — Inlay Hints

**client → server · request**

When to use it: render inline annotations for a `Range` — inferred types,
parameter names, etc. `label` is a union (`string` or a list of
`InlayHintLabelPart`s). Defer tooltips/edits to `inlayHint/resolve`. Returns a
nullable `List<InlayHint>`.

Handle it (server):

```dart
server.textDocument.onInlayHint(
  (params, context) async => const [
    InlayHint(position: position, label: InlayHintLabel.string('x')),
  ],
);
```

Call it (client):

```dart
final hints = await client.server.textDocument.inlayHint(
  const InlayHintParams(textDocument: doc, range: range),
);
final pos = hints!.single.position;
```

### `inlayHint/resolve` — Resolve Inlay Hint

**client → server · request**

When to use it: fill in a hint's `tooltip`, `textEdits`, or label-part details
only when it is hovered. Lives on the `inlayHint` proxy.

Handle it (server):

```dart
server.inlayHint.onResolve(
  (params, context) async => const InlayHint(
    position: Position(line: 0, character: 0),
    label: InlayHintLabel.string('y'),
  ),
);
```

Call it (client):

```dart
final resolved = await client.server.inlayHint.resolve(
  const InlayHint(
    position: Position(line: 0, character: 0),
    label: InlayHintLabel.string('x'),
  ),
);
final value = resolved.label.asString;
```

The server can invalidate all visible hints via the
`workspace/inlayHint/refresh` server→client request — see
[workspace](./workspace.md).

### `textDocument/inlineValue` — Inline Values

**client → server · request**

When to use it: during a debug session, show variable values inline at the line
where execution is stopped. The `InlineValueContext` carries the debugger
`frameId` and `stoppedLocation`. Each `InlineValue` is a union
(`text` / `variableLookup` / `evaluatableExpression`). Returns a nullable
`List<InlineValue>`.

Handle it (server):

```dart
server.textDocument.onInlineValue(
  (params, context) async => const [
    InlineValue.text(InlineValueText(range: range, text: 'x = 1')),
  ],
);
```

Call it (client):

```dart
final values = await client.server.textDocument.inlineValue(
  const InlineValueParams(
    textDocument: doc,
    range: range,
    context: InlineValueContext(
      frameId: 0,
      stoppedLocation: range,
    ),
  ),
);
```

The server can refresh inline values via the `workspace/inlineValue/refresh`
server→client request — see [workspace](./workspace.md).

---

## Semantic tokens

Token-level syntax/semantic highlighting. The server emits a flat, delta-encoded
`List<int>` (`SemanticTokens.data`, 5 ints per token) decoded against the legend
declared in `ServerCapabilities`. Three flavors trade off payload size: full
document, full-with-delta, and a single range.

### `textDocument/semanticTokens/full` — Semantic Tokens (Full)

**client → server · request**

When to use it: highlight the whole document. Returns a nullable
`SemanticTokens` with the encoded `data` and an optional `resultId` used as the
delta baseline.

Handle it (server):

```dart
server.textDocument.onSemanticTokensFull(
  (params, context) async => const SemanticTokens(data: [0, 0, 3, 1, 0]),
);
```

Call it (client):

```dart
final tokens = await client.server.textDocument.semanticTokensFull(
  const SemanticTokensParams(textDocument: doc),
);
final data = tokens!.data;
```

### `textDocument/semanticTokens/full/delta` — Semantic Tokens (Delta)

**client → server · request**

When to use it: after an edit, send only the change from a previous result.
Pass the prior `previousResultId`; the result union is either full
`SemanticTokens` (`asSemanticTokens`) or `SemanticTokensDelta`
(`asSemanticTokensDelta`).

Handle it (server):

```dart
server.textDocument.onSemanticTokensFullDelta(
  (params, context) async => SemanticTokensFullDeltaResult.semanticTokens(
    const SemanticTokens(data: [0, 0, 3, 1, 0]),
  ),
);
```

Call it (client):

```dart
final result = await client.server.textDocument.semanticTokensFullDelta(
  const SemanticTokensDeltaParams(textDocument: doc, previousResultId: 'prev'),
);
final data = result.asSemanticTokens!.data;
```

### `textDocument/semanticTokens/range` — Semantic Tokens (Range)

**client → server · request**

When to use it: highlight only a visible `Range` — useful for large files where
full tokenization is too costly. Returns a nullable `SemanticTokens`.

Handle it (server):

```dart
server.textDocument.onSemanticTokensRange(
  (params, context) async => const SemanticTokens(data: [0, 0, 3, 1, 0]),
);
```

Call it (client):

```dart
final tokens = await client.server.textDocument.semanticTokensRange(
  const SemanticTokensRangeParams(textDocument: doc, range: range),
);
final data = tokens!.data;
```

The server can invalidate all token sets via the
`workspace/semanticTokens/refresh` server→client request — see
[workspace](./workspace.md).

---

## Diagnostics (pull model)

In the **pull** model the client requests diagnostics on demand
(`textDocument/diagnostic`) rather than waiting for the server to push them. The
server must advertise a `diagnosticProvider`.

### `textDocument/diagnostic` — Document Diagnostics (Pull)

**client → server · request**

When to use it: pull diagnostics for a single document. The result union is
either a `RelatedFullDocumentDiagnosticReport` (`kind: 'full'`, with `items`) or
an unchanged report (`kind: 'unchanged'`, referencing a prior `resultId`). Unpack
with `asRelatedFullDocumentDiagnosticReport` /
`asRelatedUnchangedDocumentDiagnosticReport`.

Handle it (server):

```dart
server.textDocument.onDiagnostic(
  (params, context) async =>
      DocumentDiagnosticReport.relatedFullDocumentDiagnosticReport(
    const RelatedFullDocumentDiagnosticReport(items: []),
  ),
);
```

Call it (client):

```dart
final report = await client.server.textDocument.diagnostic(
  const DocumentDiagnosticParams(textDocument: doc),
);
final kind = report.asRelatedFullDocumentDiagnosticReport!.kind;
```

The workspace-wide counterpart is `workspace/diagnostic`, and the server can ask
the client to re-pull everything via the `workspace/diagnostic/refresh`
server→client request — both covered in [workspace](./workspace.md).

> Push model: in the alternative **push** model the server sends
> `textDocument/publishDiagnostics` notifications (server → client) without a
> request. That message is part of the server→client surface — see
> [window](./window.md). The two models are mutually exclusive per server.
