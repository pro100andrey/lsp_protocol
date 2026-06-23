<!-- markdownlint-disable-file MD004 -->
# Notebook document synchronization

Notebook sync mirrors text-document sync, but for `.ipynb`-style notebooks.
A `NotebookDocument` is a versioned container of `NotebookCell`s; each cell's
content is a normal text document, carried alongside the notebook in
`cellTextDocuments`. The client streams open/change/save/close events; the
server reconstructs the notebook and its cells from them. Whether the server
receives these depends on the `notebookDocumentSync` field of its
`ServerCapabilities`.

All four are `notebookDocument/*` notifications on the `notebookDocument`
namespace and return `void` (no `await`).

---

## Notebook synchronization

### `notebookDocument/didOpen` — Did Open

**client → server · notification**

When to use it: A notebook was opened. Carries the notebook (uri, type,
version, cells) plus the full text of every cell document in
`cellTextDocuments`.

Handle it (server):

```dart
server.notebookDocument.onDidOpen((params, context) async {
  // params.notebookDocument.uri, params.cellTextDocuments
});
```

Call it (client):

```dart
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
        languageId: LanguageKind.python,
        version: 1,
        text: '',
      ),
    ],
  ),
);
```

---

### `notebookDocument/didChange` — Did Change

**client → server · notification**

When to use it: The notebook changed — cell metadata, cell structure
(add/remove/reorder), or the text inside cells. Carries a versioned identifier
and a `NotebookDocumentChangeEvent` describing the delta.

Handle it (server):

```dart
server.notebookDocument.onDidChange((params, context) async {
  // params.notebookDocument.version, params.change
});
```

Call it (client):

```dart
client.server.notebookDocument.didChange(
  const DidChangeNotebookDocumentParams(
    notebookDocument: VersionedNotebookDocumentIdentifier(
      uri: 'file:///n.ipynb',
      version: 2,
    ),
    change: NotebookDocumentChangeEvent(),
  ),
);
```

---

### `notebookDocument/didSave` — Did Save

**client → server · notification**

When to use it: The notebook was saved to disk. Carries only the notebook
identifier.

Handle it (server):

```dart
server.notebookDocument.onDidSave((params, context) async {
  // params.notebookDocument.uri
});
```

Call it (client):

```dart
client.server.notebookDocument.didSave(
  const DidSaveNotebookDocumentParams(
    notebookDocument: NotebookDocumentIdentifier(uri: 'file:///n.ipynb'),
  ),
);
```

---

### `notebookDocument/didClose` — Did Close

**client → server · notification**

When to use it: The notebook was closed. Carries the notebook identifier plus
the identifiers of its cell documents so the server can drop their state.

Handle it (server):

```dart
server.notebookDocument.onDidClose((params, context) async {
  // params.notebookDocument.uri, params.cellTextDocuments
});
```

Call it (client):

```dart
client.server.notebookDocument.didClose(
  const DidCloseNotebookDocumentParams(
    notebookDocument: NotebookDocumentIdentifier(uri: 'file:///n.ipynb'),
    cellTextDocuments: [
      TextDocumentIdentifier(uri: 'file:///c0.py'),
    ],
  ),
);
```
