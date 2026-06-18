<!-- markdownlint-disable-file MD004 -->
# Workspace methods

These methods operate at the level of the whole project rather than a single
document: workspace-wide symbol search and command execution, pull-style
diagnostics, file-operation hooks, configuration and file watching, applying
edits across many files, and dynamic capability (un)registration.

Most are client → server requests/notifications. A handful run the other way
(server → client) — configuration reads, `applyEdit`, `workspaceFolders`, the
`refresh` requests, and capability registration. For those the call site lives
on `server.client.workspace` (or `server.client.client`) and the handler on the
client side as `client.workspace.on…` (or `client.client.on…`).

See [../guides/server.md](../guides/server.md) and
[../guides/client.md](../guides/client.md) for how handlers are wired, and
[./lifecycle.md](./lifecycle.md) for the handshake and `$/progress`.

---

## Symbols & commands

### `workspace/symbol` — Workspace Symbol

**client → server · request**

When to use it: Project-wide symbol search. The client passes a query string
and the server returns matching symbols (as `SymbolInformation` or the leaner
`WorkspaceSymbol`, which may defer its `location`).

Handle it (server):

```dart
server.workspace.onSymbol(
  (params, context) async => SymbolResult.symbolInformationList(const [
    SymbolInformation(
      name: 'C',
      kind: SymbolKind.class$,
      location: Location(uri: 'file:///a.dart', range: _range),
    ),
  ]),
);
```

Call it (client):

```dart
final r = await client.server.workspace.symbol(
  const WorkspaceSymbolParams(query: 'foo'),
);
// r.asSymbolInformationList / r.asWorkspaceSymbolList
```

### `workspaceSymbol/resolve` — Resolve Workspace Symbol

**client → server · request**

When to use it: Fills in the deferred parts of a `WorkspaceSymbol` returned by
`workspace/symbol` (most commonly its full `location`). Only valid when the
symbol was returned with a URI-only location.

Handle it (server):

```dart
server.workspaceSymbol.onResolve(
  (params, context) async => WorkspaceSymbol(
    name: 'C',
    kind: SymbolKind.class$,
    location: WorkspaceSymbolLocation.uri(uri: 'file:///a.dart'),
    containerName: 'x',
  ),
);
```

Call it (client):

```dart
final r = await client.server.workspaceSymbol.resolve(
  WorkspaceSymbol(
    name: 'C',
    kind: SymbolKind.class$,
    location: WorkspaceSymbolLocation.uri(uri: 'file:///a.dart'),
  ),
);
// r.containerName
```

### `workspace/executeCommand` — Execute Command

**client → server · request**

When to use it: Runs a server-provided command by name (with optional
arguments). Often paired with code actions / code lenses, whose `Command`
points at a command the server advertised in its capabilities. The result is an
arbitrary `LSPAny?`; many commands answer their side effects via
`workspace/applyEdit`.

Handle it (server):

```dart
server.workspace.onExecuteCommand(
  (params, context) async => const LSPAny.string('ok'),
);
```

Call it (client):

```dart
final r = await client.server.workspace.executeCommand(
  const ExecuteCommandParams(command: 'my.cmd'),
);
// r?.asString
```

---

## Pull diagnostics

### `workspace/diagnostic` — Workspace Diagnostic

**client → server · request**

When to use it: Pull-model diagnostics for the whole workspace (as opposed to
the push model via `textDocument/publishDiagnostics`). The client passes the
`previousResultIds` it already holds so the server can answer `unchanged` for
files that did not change.

Handle it (server):

```dart
server.workspace.onDiagnostic(
  (params, context) async => WorkspaceDiagnosticReport(
    items: [
      WorkspaceDocumentDiagnosticReport
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
```

Call it (client):

```dart
final r = await client.server.workspace.diagnostic(
  const WorkspaceDiagnosticParams(
    previousResultIds: [
      PreviousResultId(uri: 'file:///a.dart', value: 'p'),
    ],
  ),
);
// r.items.first.asWorkspaceFullDocumentDiagnosticReport
```

### `workspace/diagnostic/refresh` — Diagnostic Refresh

**server → client · request** (no params → void)

When to use it: The server tells the client its previously pulled diagnostics
are stale and should be re-requested. See the [Refresh requests](#refresh-requests)
pattern below — it is one of that family.

Send it (server):

```dart
await server.client.workspace.diagnosticRefresh();
```

Handle it (client):

```dart
client.workspace.onDiagnosticRefresh((context) async {
  // Re-pull workspace / document diagnostics.
});
```

---

## File operations (client → server)

These let the server participate in editor file operations. The `will*`
variants are **requests** sent *before* the operation, and may return a
`WorkspaceEdit?` to apply alongside it (e.g. fix up imports on rename). The
`did*` variants are **notifications** sent *after* the operation completed.

### `workspace/willCreateFiles` — Will Create Files

**client → server · request** (→ `WorkspaceEdit?`)

When to use it: Sent before files are created; return edits to apply together
with the creation.

Handle it (server):

```dart
server.workspace.onWillCreateFiles(
  (params, context) async => const WorkspaceEdit(
    changes: {
      'file:///a.dart': [TextEdit(range: _range, newText: 'x')],
    },
  ),
);
```

Call it (client):

```dart
final r = await client.server.workspace.willCreateFiles(
  const CreateFilesParams(files: [FileCreate(uri: 'file:///n.dart')]),
);
// r?.changes
```

### `workspace/willRenameFiles` — Will Rename Files

**client → server · request** (→ `WorkspaceEdit?`)

When to use it: Sent before files are renamed/moved; the classic place to
return import/reference fixups.

Handle it (server):

```dart
server.workspace.onWillRenameFiles(
  (params, context) async => const WorkspaceEdit(
    changes: {
      'file:///a.dart': [TextEdit(range: _range, newText: 'x')],
    },
  ),
);
```

Call it (client):

```dart
final r = await client.server.workspace.willRenameFiles(
  const RenameFilesParams(
    files: [
      FileRename(oldUri: 'file:///o.dart', newUri: 'file:///n.dart'),
    ],
  ),
);
// r?.changes
```

### `workspace/willDeleteFiles` — Will Delete Files

**client → server · request** (→ `WorkspaceEdit?`)

When to use it: Sent before files are deleted; return edits to clean up
references.

Handle it (server):

```dart
server.workspace.onWillDeleteFiles(
  (params, context) async => const WorkspaceEdit(
    changes: {
      'file:///a.dart': [TextEdit(range: _range, newText: 'x')],
    },
  ),
);
```

Call it (client):

```dart
final r = await client.server.workspace.willDeleteFiles(
  const DeleteFilesParams(files: [FileDelete(uri: 'file:///o.dart')]),
);
// r?.changes
```

### `workspace/didCreateFiles` — Did Create Files

**client → server · notification**

When to use it: Sent after files were created, so the server can react (index,
warm caches).

Handle it (server):

```dart
server.workspace.onDidCreateFiles((params, context) async {
  // params.files
});
```

Call it (client):

```dart
client.server.workspace.didCreateFiles(
  const CreateFilesParams(files: [FileCreate(uri: 'file:///a.dart')]),
);
```

### `workspace/didRenameFiles` — Did Rename Files

**client → server · notification**

When to use it: Sent after files were renamed/moved.

Handle it (server):

```dart
server.workspace.onDidRenameFiles((params, context) async {
  // params.files (FileRename: oldUri / newUri)
});
```

Call it (client):

```dart
client.server.workspace.didRenameFiles(
  const RenameFilesParams(
    files: [
      FileRename(oldUri: 'file:///o.dart', newUri: 'file:///n.dart'),
    ],
  ),
);
```

### `workspace/didDeleteFiles` — Did Delete Files

**client → server · notification**

When to use it: Sent after files were deleted.

Handle it (server):

```dart
server.workspace.onDidDeleteFiles((params, context) async {
  // params.files
});
```

Call it (client):

```dart
client.server.workspace.didDeleteFiles(
  const DeleteFilesParams(files: [FileDelete(uri: 'file:///a.dart')]),
);
```

---

## Configuration & watching

### `workspace/didChangeConfiguration` — Did Change Configuration

**client → server · notification**

When to use it: The client notifies the server that user/workspace settings
changed. The payload is the new settings as `LSPAny`.

Handle it (server):

```dart
server.workspace.onDidChangeConfiguration((params, context) async {
  // params.settings (LSPAny)
});
```

Call it (client):

```dart
client.server.workspace.didChangeConfiguration(
  const DidChangeConfigurationParams(
    settings: LSPAny.lSPObject({'k': LSPAny.string('v')}),
  ),
);
```

### `workspace/configuration` — Configuration

**server → client · request** (→ `List<LSPAny>`)

When to use it: The server *pulls* configuration on demand. It asks for one or
more `ConfigurationItem`s and receives a positionally-matched `List<LSPAny>`
back — one entry per requested item.

Send it (server):

```dart
final config = await server.client.workspace.configuration(
  const ConfigurationParams(items: []),
);
// config is List<LSPAny>, aligned with the requested items
```

Handle it (client):

```dart
client.workspace.onConfiguration(
  (params, context) async => [const LSPAny.bool(true)],
);
```

### `workspace/didChangeWatchedFiles` — Did Change Watched Files

**client → server · notification**

When to use it: The client reports filesystem changes (create/change/delete)
for paths the server registered interest in. Each `FileEvent` carries a `uri`
and a `FileChangeType`.

Handle it (server):

```dart
server.workspace.onDidChangeWatchedFiles((params, context) async {
  // params.changes (List<FileEvent>)
});
```

Call it (client):

```dart
client.server.workspace.didChangeWatchedFiles(
  const DidChangeWatchedFilesParams(
    changes: [
      FileEvent(uri: 'file:///a.dart', type: FileChangeType.changed),
    ],
  ),
);
```

### `workspace/didChangeWorkspaceFolders` — Did Change Workspace Folders

**client → server · notification**

When to use it: The client reports that workspace folders were added or
removed (multi-root workspaces). The `event` lists `added` and `removed`
folders.

Handle it (server):

```dart
server.workspace.onDidChangeWorkspaceFolders((params, context) async {
  // params.event.added / params.event.removed
});
```

Call it (client):

```dart
client.server.workspace.didChangeWorkspaceFolders(
  const DidChangeWorkspaceFoldersParams(
    event: WorkspaceFoldersChangeEvent(
      added: [WorkspaceFolder(uri: 'file:///w', name: 'w')],
      removed: [],
    ),
  ),
);
```

### `workspace/workspaceFolders` — Workspace Folders

**server → client · request** (→ `List<WorkspaceFolder>?`)

When to use it: The server asks the client for the current set of workspace
folders (e.g. on startup, before it has seen any change events). A `null`
result means the client has no folder concept; an empty list means no folders
are open.

Send it (server):

```dart
final folders = await server.client.workspace.workspaceFolders();
// List<WorkspaceFolder>?
```

Handle it (client):

```dart
client.workspace.onWorkspaceFolders(
  (context) async => const [WorkspaceFolder(uri: 'file:///w', name: 'w')],
);
```

---

## Apply edit

### `workspace/applyEdit` — Apply Edit

**server → client · request** (→ `ApplyWorkspaceEditResult`)

When to use it: The server asks the client to apply a `WorkspaceEdit` to the
project (rename results, quick fixes, command side effects). The result's
`applied` flag reports whether the client carried the edit out.

Send it (server):

```dart
final r = await server.client.workspace.applyEdit(
  const ApplyWorkspaceEditParams(edit: WorkspaceEdit()),
);
// r.applied
```

Handle it (client):

```dart
client.workspace.onApplyEdit(
  (params, context) async =>
      const ApplyWorkspaceEditResult(applied: true),
);
```

---

## Capability registration

The server can register/unregister capabilities dynamically after the
handshake — for example, to start watching files only once a project is
opened. Both are server → client requests; the client acknowledges by returning
from its handler.

### `client/registerCapability` — Register Capability

**server → client · request**

When to use it: The server registers one or more capabilities at runtime
(`RegistrationParams.registrations`).

Send it (server):

```dart
await server.client.client.registerCapability(
  const RegistrationParams(registrations: []),
);
```

Handle it (client):

```dart
client.client.onRegisterCapability((params, context) async {
  // params.registrations
});
```

### `client/unregisterCapability` — Unregister Capability

**server → client · request**

When to use it: The server tears down a previously registered capability.

> Note: the params field is spelled `unregisterations` — a long-standing
> typo baked into the LSP specification itself. `pro_lsp` mirrors the spec
> verbatim, so the field name is intentional.

Send it (server):

```dart
await server.client.client.unregisterCapability(
  const UnregistrationParams(
    unregisterations: [
      Unregistration(id: '1', method: 'textDocument/hover'),
    ],
  ),
);
```

Handle it (client):

```dart
client.client.onUnregisterCapability((params, context) async {
  // params.unregisterations
});
```

---

## Refresh requests

A small family of server → client requests that all share the same shape: **no
params, return `void`**. The server uses them to tell the client that a class
of previously computed results is stale and should be re-requested. The client
acknowledges by returning from its handler.

| Method | Server call | Client handler |
| --- | --- | --- |
| `workspace/semanticTokens/refresh` | `semanticTokensRefresh()` | `onSemanticTokensRefresh` |
| `workspace/inlayHint/refresh` | `inlayHintRefresh()` | `onInlayHintRefresh` |
| `workspace/inlineValue/refresh` | `inlineValueRefresh()` | `onInlineValueRefresh` |
| `workspace/foldingRange/refresh` | `foldingRangeRefresh()` | `onFoldingRangeRefresh` |
| `workspace/codeLens/refresh` | `codeLensRefresh()` | `onCodeLensRefresh` |
| `workspace/diagnostic/refresh` | `diagnosticRefresh()` | `onDiagnosticRefresh` |

Send it (server):

```dart
await server.client.workspace.semanticTokensRefresh();
await server.client.workspace.inlayHintRefresh();
await server.client.workspace.inlineValueRefresh();
await server.client.workspace.foldingRangeRefresh();
await server.client.workspace.codeLensRefresh();
await server.client.workspace.diagnosticRefresh();
```

Handle it (client):

```dart
client.workspace
  ..onSemanticTokensRefresh((context) async { /* re-request tokens */ })
  ..onInlayHintRefresh((context) async { /* re-request inlay hints */ })
  ..onInlineValueRefresh((context) async { /* re-request inline values */ })
  ..onFoldingRangeRefresh((context) async { /* re-request folding ranges */ })
  ..onCodeLensRefresh((context) async { /* re-request code lenses */ })
  ..onDiagnosticRefresh((context) async { /* re-pull diagnostics */ });
```
