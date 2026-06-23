<!-- markdownlint-disable-file MD004 -->
# Building a client

`LspClient` implements the client side of `pro_lsp` — useful for editor
integrations and, just as importantly, for testing servers in process. It is the
mirror image of `LspServer`: you call the server through one proxy and handle
server→client messages through namespace handlers. See [concepts](../concepts.md)
for that symmetry.

---

## What `LspClient` is

A client has two halves:

- **Outgoing** (`client.server.*`) — the proxy you use to call the server:
  requests like `hover`, notifications like `didOpen`.
- **Incoming** (`client.<namespace>.on*`) — handlers for messages the *server*
  sends to you: diagnostics, window messages, configuration requests, and so on.

Construct one from stdio (`LspClient()`) or from any byte stream
(`LspClient.fromChannel(channel)`), which applies LSP framing for you.

---

## Starting the client

`start(...)` performs the full handshake for you. It is the recommended entry
point because it handles the mandatory protocol sequence automatically:

1. sends `initialize` with your capabilities,
2. stores the returned `ServerCapabilities` in `client.serverCapabilities`,
3. sends `initialized`,
4. begins listening.

```dart
final client = LspClient.fromChannel(channel);

final initResult = await client.start(
  capabilities: const ClientCapabilities(),
  rootUri: 'file:///my/project',
  clientInfo: ClientInfo(name: 'my-editor', version: '1.0.0'),
  processId: pid,
);

print('Hover supported: ${client.serverCapabilities?.hoverProvider}');
```

`start()` begins listening internally, so do **not** also call `listen()` — the
two are mutually exclusive entry points (calling either after the client is
already listening throws a `StateError`). `processId` defaults to the current
process id; `clientInfo`, `rootUri`, `workspaceFolders`, and
`initializationOptions` are all optional.

Register your server→client handlers **before** calling `start()`, so they are
ready before the server can send anything back.

---

## Calling the server

Reach the server through the `client.server` proxy. Requests return a typed
result; notifications return `void`.

```dart
final hover = await client.server.textDocument.hover(
  const HoverParams(
    textDocument: TextDocumentIdentifier(uri: 'file:///main.dart'),
    position: Position(line: 10, character: 4),
  ),
);

// Notifications are fire-and-forget.
client.server.textDocument.didOpen(
  const DidOpenTextDocumentParams(
    textDocument: TextDocumentItem(
      uri: 'file:///main.dart',
      languageId: LanguageKind.dart,
      version: 1,
      text: 'void main() {}',
    ),
  ),
);
```

Request senders also accept an optional `token` and `timeout`. Any error
response from the server is re-thrown as an `LspException`.

---

## Receiving server→client messages

The server pushes notifications and makes requests of its own. You handle these
with `client.<namespace>.on*`, mirroring the way a server registers handlers.
The incoming namespaces are:

| Namespace | Access | Examples |
| --------- | ------ | -------- |
| `window` | `client.window` | `onShowMessage`, `onLogMessage`, `onShowMessageRequest` |
| `textDocument` | `client.textDocument` | `onPublishDiagnostics` |
| `workspace` | `client.workspace` | `onConfiguration`, `onApplyEdit` |
| `client` | `client.client` | `onRegisterCapability`, `onUnregisterCapability` |
| `general` | `client.general` | `onProgress`, protocol (`$/`) methods |
| `telemetry` | `client.telemetry` | `onEvent` (the `telemetry` getter exists) |

```dart
client.textDocument.onPublishDiagnostics((params, context) async {
  render(params.uri, params.diagnostics);
});

client.window
  ..onShowMessage((params, context) async {
    showToast(params.message);
  })
  ..onShowMessageRequest((params, context) async {
    // Return the action the user picked (or null).
    return const MessageActionItem(title: 'OK');
  });

// Server requests that expect a reply: return the value.
client.workspace.onConfiguration(
  (params, context) async => [const LSPAny.bool(true)],
);

client.general.onProgress((params, context) async {
  updateProgress(params.token, params.value);
});
```

Notification handlers return a `void Function()` you can call to unregister;
request handlers (like `onConfiguration`, `onShowMessageRequest`) return the
result the server is waiting for.

---

## Low-level: driving the handshake yourself

`listen()` is the lower-level alternative to `start()`: it begins processing
incoming messages **without** performing the handshake. Use it only when you want
to send the `initialize` request and `initialized` notification yourself (e.g.
to customize the sequence). Most callers should prefer `start()`.

```dart
final client = LspClient.fromChannel(channel);
unawaited(client.listen()); // no handshake performed

final result = await client.server.general.initialize(
  InitializeParams(processId: pid, capabilities: const ClientCapabilities()),
);
client.serverCapabilities = result.capabilities;
client.server.general.initialized(const InitializedParams());
```

Calling `listen()` after the client is already listening (including after
`start()`) throws a `StateError`.

---

## Next steps

- [Concepts](../concepts.md) — the handler/sender model and message direction.
- [Methods reference](../methods/README.md) — the full catalog of LSP methods.
- [Testing](../guides/testing.md) — wiring a client and server together in
  memory.
