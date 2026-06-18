<!-- markdownlint-disable-file MD004 -->
# Concepts

`pro_lsp` is symmetric: `LspServer` and `LspClient` expose the same shape,
differing only in message direction. Once you have this mental model, every
namespace and method follows the same pattern.

---

## The four building blocks

The mental model is small:

| Concept | What it is | How you reach it |
| ------- | ---------- | ---------------- |
| **Handler** | Code that runs when a message *arrives* | `server.<namespace>.on<Feature>(handler)` |
| **Sender** | A call you *make* to the other side | `server.client.<namespace>.<method>(...)` / `client.server.<namespace>.<method>(...)` |
| **`LspRequest`** | Per-message context passed to every handler | the handler's second argument |
| **`LspConnection`** | The low-level JSON-RPC connection | `server.connection` (rarely needed directly) |

A **handler** receives `(params, context)`. The `context` is the per-message
`LspRequest`: it carries things like the cancellation token. A **sender** is the
outgoing direction: you call a typed method and either await a result or fire a
notification.

---

## Symmetry: server and client mirror each other

Both endpoints register *incoming* handlers under namespaces and reach the other
side through an *outgoing* proxy:

| | Incoming handlers | Outgoing proxy |
| --- | --- | --- |
| **Server** | `server.textDocument.onHover(...)` | `server.client.window.showMessage(...)` |
| **Client** | `client.window.onShowMessage(...)` | `client.server.textDocument.hover(...)` |

On the server, `server.<namespace>.on*` handles messages from the client, and
`server.client.*` sends to the client. On the client, `client.<namespace>.on*`
handles messages from the server, and `client.server.*` sends to the server. The
two are exact mirrors.

---

## Message direction

LSP messages flow in both directions, and the namespace you use depends on which
way the message travels.

```text
            client → server (requests & notifications)
   ┌──────────────────────────────────────────────────┐
   │  client.server.textDocument.hover(...)            │  request  → result
   │  client.server.textDocument.didOpen(...)          │  notification
   │                                                   ▼
LspClient                                          LspServer
   │                                                   │
   │  ◄── server.client.window.showMessage(...)        │  notification
   │  ◄── server.client.workspace.applyEdit(...)       │  request  → result
   └──────────────────────────────────────────────────┘
            server → client (requests & notifications)
```

- **client → server** is the bulk of LSP: completion, hover, definition,
  formatting, document sync, and so on. The server handles these with
  `server.<namespace>.on*`; the client sends them with `client.server.*`.
- **server → client** covers things the server pushes or asks: diagnostics,
  `window/showMessage`, `workspace/configuration`, `workspace/applyEdit`,
  `client/registerCapability`, progress. The client handles these with
  `client.<namespace>.on*`; the server sends them with `server.client.*`.

---

## Request vs notification

Two kinds of messages, distinguished by whether they return a value:

- A **request** expects a response. Request *handlers* return the result type
  (`T?`); request *senders* return `Future<Result>`. Errors come back as an
  `LspException`.
- A **notification** is fire-and-forget. Notification *handlers* return a
  `void Function()` — an unregister callback; notification *senders* return
  `void` (there is no response, so no `token`/`timeout`).

```dart
// Request: returns a typed result.
final hover = await client.server.textDocument.hover(params); // Hover?

// Notification: no response.
client.server.textDocument.didOpen(openParams); // void
```

---

## Next steps

- [Building a server](./guides/server.md)
- [Building a client](./guides/client.md)
- [Methods reference](./methods/README.md)
