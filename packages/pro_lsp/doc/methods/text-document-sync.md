<!-- markdownlint-disable-file MD004 -->
# Text document synchronization

Document sync keeps the server's view of open files in step with the editor.
The client streams open/change/close events plus optional save notifications;
the server tracks content from them. What the server receives depends on the
`textDocumentSync` field of its `ServerCapabilities` (a
`TextDocumentSyncOptions`): whether changes arrive as full text or incremental
ranges, and whether `willSave` / `willSaveWaitUntil` / `didSave` are enabled.

All of these are `textDocument/*` methods on the `textDocument` namespace.
Notifications return `void` (no `await`); `willSaveWaitUntil` is a request.

---

## Synchronization messages

### `textDocument/didOpen` — Did Open

**client → server · notification**

When to use it: The editor opened a document. Carries the full initial text,
language id, and version. The server now owns this document's content until a
matching `didClose`.

Handle it (server):

```dart
server.textDocument.onDidOpen((params, context) async {
  // params.textDocument.uri / .languageId / .version / .text
});
```

Call it (client):

```dart
client.server.textDocument.didOpen(
  const DidOpenTextDocumentParams(
    textDocument: TextDocumentItem(
      uri: 'file:///a.dart',
      languageId: LanguageKind.dart,
      version: 1,
      text: 'void main() {}',
    ),
  ),
);
```

---

### `textDocument/didChange` — Did Change

**client → server · notification**

When to use it: The document's content changed. `contentChanges` is full text
or incremental ranges per the negotiated sync kind; `version` increases
monotonically.

Handle it (server):

```dart
server.textDocument.onDidChange((params, context) async {
  // params.textDocument.version, params.contentChanges
});
```

Call it (client):

```dart
client.server.textDocument.didChange(
  const DidChangeTextDocumentParams(
    textDocument: VersionedTextDocumentIdentifier(
      uri: 'file:///a.dart',
      version: 2,
    ),
    contentChanges: [],
  ),
);
```

---

### `textDocument/didClose` — Did Close

**client → server · notification**

When to use it: The editor closed the document. The server should drop any
state it kept for that URI; on-disk content is once again the source of truth.

Handle it (server):

```dart
server.textDocument.onDidClose((params, context) async {
  // params.textDocument.uri
});
```

Call it (client):

```dart
client.server.textDocument.didClose(
  const DidCloseTextDocumentParams(
    textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
  ),
);
```

---

### `textDocument/didSave` — Did Save

**client → server · notification**

When to use it: The document was saved to disk. Enabled by the `save` option in
`TextDocumentSyncOptions`; may optionally include the saved text.

Handle it (server):

```dart
server.textDocument.onDidSave((params, context) async {
  // params.textDocument.uri
});
```

Call it (client):

```dart
client.server.textDocument.didSave(
  const DidSaveTextDocumentParams(
    textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
  ),
);
```

---

### `textDocument/willSave` — Will Save

**client → server · notification**

When to use it: The editor is about to save (fire-and-forget). `reason`
explains why (`manual`, `afterDelay`, `focusOut`). Use it for cheap,
side-effect-free bookkeeping; it does not let you mutate the document.

Handle it (server):

```dart
server.textDocument.onWillSave((params, context) async {
  // params.reason — TextDocumentSaveReason
});
```

Call it (client):

```dart
client.server.textDocument.willSave(
  const WillSaveTextDocumentParams(
    textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
    reason: TextDocumentSaveReason.manual,
  ),
);
```

---

### `textDocument/willSaveWaitUntil` — Will Save Wait Until

**client → server · request**

When to use it: The editor is about to save and will block briefly for the
server to return `List<TextEdit>?` to apply before writing to disk (e.g.
trailing-whitespace trim, format-on-save). Return `null` to make no edits. Keep
it fast — the save is stalled until you answer.

Handle it (server):

```dart
server.textDocument.onWillSaveWaitUntil((params, context) async {
  return <TextEdit>[
    // edits to apply before the save lands
  ];
});
```

Call it (client):

```dart
final edits = await client.server.textDocument.willSaveWaitUntil(
  const WillSaveTextDocumentParams(
    textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
    reason: TextDocumentSaveReason.manual,
  ),
);
// edits is List<TextEdit>? — null when the server has nothing to apply
```
