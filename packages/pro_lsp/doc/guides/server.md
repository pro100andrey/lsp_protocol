<!-- markdownlint-disable-file MD004 -->
# Building a server

`LspServer` is the server side of `pro_lsp`. You register typed handlers for
incoming messages, declare what you support, and push messages back to the
client — all without touching JSON-RPC. This guide covers the full surface; for
the underlying mental model see [concepts](../concepts.md).

---

## Registering handlers

Every LSP method is a typed handler under a namespace:
`server.<namespace>.on<Feature>(handler)`. Request handlers return the result
type (`T?`); notification handlers return `void Function()` — an unregister
callback.

| Namespace | Access | Covers |
| --------- | ------ | ------ |
| `general` | `server.general` | Lifecycle & protocol: `initialize`, `initialized`, `shutdown`, `exit`, `$/progress`, `$/setTrace`, `$/cancelRequest` |
| `textDocument` | `server.textDocument` | The bulk of LSP: completion, hover, definition/declaration/references, formatting, diagnostics, semantic tokens, code actions/lenses, inlay hints, folding, document sync (`onDidOpen`, `onDidChange`, …) |
| `workspace` | `server.workspace` | Symbol search, `executeCommand`, configuration & file-watch events, workspace folders, file operations, pull diagnostics |
| `callHierarchy` / `typeHierarchy` | `server.callHierarchy` … | Prepare + incoming/outgoing calls; supertypes/subtypes |
| `notebookDocument` | `server.notebookDocument` | Notebook open/change/save/close |
| `completionItem`, `codeAction`, `codeLens`, `documentLink`, `inlayHint`, `workspaceSymbol` | `server.completionItem` … | `onResolve()` for lazily-resolved item data |
| `window` | `server.window` | `onWorkDoneProgressCancel` |
| `client` | `server.client` | **Outgoing** proxy — send to the client (see [Talking back to the client](#talking-back-to-the-client)) |

This is the whole catalog; for the exact method names and types in any
namespace, rely on your IDE's autocomplete and the dartdoc — `server.textDocument.on`
will list everything available. The full reference also lives in
[methods](../methods/README.md).

```dart
server.textDocument.onCompletion((params, context) async {
  // CompletionResult is a union: a plain item list, a CompletionList, or null.
  return .completionItemList([CompletionItem(label: 'print')]);
});

// Notification handlers return an unregister function.
final unregister = server.textDocument.onDidChange((params, context) async {
  documents[params.textDocument.uri] = params.contentChanges;
});
```

Document-sync notifications arrive in order, exactly as the client sent them:

```dart
server.textDocument
  ..onDidOpen((params, context) async {
    documents[params.textDocument.uri] = params.textDocument.text;
  })
  ..onDidChange((params, context) async {
    applyChanges(params.textDocument.uri, params.contentChanges);
  })
  ..onDidClose((params, context) async {
    documents.remove(params.textDocument.uri);
  });
```

---

## Declaring capabilities

`ServerCapabilities` tells the client what you support. Return it from
`onInitialize`:

```dart
server.general.onInitialize((params, context) async {
  return InitializeResult(
    capabilities: ServerCapabilities(
      hoverProvider: .bool(true),
      completionProvider: CompletionOptions(
        resolveProvider: false,
        triggerCharacters: ['.', ':'],
      ),
      definitionProvider: .bool(true),
      documentSymbolProvider: .bool(true),
      workspaceSymbolProvider: .bool(true),
    ),
    serverInfo: (name: 'my-dart-lsp', version: '1.0.0'),
  );
});
```

The client stores these in `client.serverCapabilities` once `start()` returns,
so it can branch on what you advertised.

---

## Talking back to the client

The server can push notifications and make requests to the client via
`server.client`:

```dart
// Notification — fire and forget.
server.client.textDocument.publishDiagnostics(
  PublishDiagnosticsParams(uri: docUri, diagnostics: [...]),
);

server.client.window.showMessage(
  const ShowMessageParams(type: MessageType.info, message: 'Analysis done'),
);

// Request — returns a typed result.
final result = await server.client.workspace.applyEdit(
  ApplyWorkspaceEditParams(edit: WorkspaceEdit(changes: {...})),
);
if (!result.applied) { /* client rejected the edit */ }

// Ask the client for configuration or a user choice.
final config = await server.client.workspace.configuration(
  const ConfigurationParams(items: []),
);
final action = await server.client.window.showMessageRequest(
  const ShowMessageRequestParams(type: MessageType.info, message: 'pick one'),
);
```

Request senders also accept an optional `token` and `timeout` — see
[cancellation](../guides/cancellation.md). Notifications take neither (there is
no response).

> Server→client messages are only accepted once the client is fully
> `initialized`. A safe trigger is to send them from a handler that can only run
> post-handshake (e.g. `onDidOpen`), rather than from inside `onInitialize`.

---

## Lifecycle and state machine

`pro_lsp` enforces the LSP lifecycle automatically, so out-of-order messages are
rejected for you:

* **Before initialization** — any request other than `initialize` is rejected
  with `serverNotInitialized` (`-32002`); your handlers never run.
* **Initializing** — while `onInitialize` runs, the connection is in
  `initializing`.
* **Shutting down** — after `shutdown`, further requests are rejected.
* **Exit** — `exit` closes the connection and returns `listen()`.

You can inspect the current state via `server.state` (an `LspState`):
`uninitialized` → `initialized` → `shuttingDown` → `exited`.

**Defaults:** if you don't register them, `pro_lsp` provides a spec-compliant
`shutdown` (succeeds) and `exit` (closes the connection). Register your own to
override — for example to flush state on shutdown:

```dart
server.general.onShutdown((context) async {
  await saveCaches();
});

// You may also override onExit; if you do, you are responsible for closing.
server.general.onExit((context) async {
  await flushLogs();
});
```

See [lifecycle](../methods/lifecycle.md) for the full sequence and the exact
error codes.

---

## Logging and debugging

Handler and feature-disposal errors are routed to `server.onError`, which is
**unset by default** — so notification-handler errors are silently swallowed
(request-handler errors are still returned to the client as JSON-RPC errors).
Set it to surface them, and log to `stderr`, **never `stdout`** — on a stdio
server `stdout` *is* the protocol channel, so writing there corrupts the
JSON-RPC stream:

```dart
server.onError = (error, stack) {
  stderr.writeln('[lsp] $error\n$stack'); // stderr is safe; stdout is not
};
```

The same rule applies to your own logging: use `stderr`, a file, or the
`window/logMessage` notification — never `print()` on a stdio transport.

```dart
// Surface a log line in the client instead of writing to a stream.
server.client.window.logMessage(
  const LogMessageParams(type: MessageType.log, message: 'indexing started'),
);
```

For cross-cutting logging and timing, prefer middleware over scattering
`stderr.writeln` through handlers — see [advanced](../guides/advanced.md).
