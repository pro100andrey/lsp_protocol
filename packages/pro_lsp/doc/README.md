<!-- markdownlint-disable-file MD004 -->
# pro_lsp documentation

Full documentation for [`pro_lsp`](../README.md) — a typed LSP 3.18 server/client
framework for Dart.

New here? Read the guides top to bottom. Looking for a specific message? Jump to
the [method reference](methods/README.md).

---

## Guides

Conceptual and task-oriented walkthroughs.

| Guide | What it covers |
| ----- | -------------- |
| [Getting started](getting-started.md) | Install, build your first server, connect a client |
| [Core concepts](concepts.md) | The mental model: handlers vs. senders, `LspRequest`, the lifecycle state machine |
| [Building a server](guides/server.md) | Registering handlers, declaring capabilities, pushing to the client, lifecycle, logging |
| [Building a client](guides/client.md) | The handshake, calling the server, handling server→client messages |
| [Working with models](guides/models.md) | Freezed structures, `extension type` unions, open/closed enums |
| [Error handling](guides/errors.md) | `LspException`, throwing from handlers, `LspErrorCodes` |
| [Cancellation](guides/cancellation.md) | Incoming (`CancellationToken` in context) and outgoing (`token` / `timeout`) |
| [Testing](guides/testing.md) | Wiring a client and server together in memory |
| [Transports](guides/transports.md) | stdio, TCP sockets, and custom byte streams |
| [Advanced](guides/advanced.md) | Pluggable `LspFeature`s, dependency injection, middleware |

---

## Method reference

Every LSP request and notification, grouped by area. Each entry states the
**direction** (client→server or server→client), the **type** (request or
notification), **what it does and when to use it**, and a runnable **example**
for both the handler and the caller.

Start at the [**method catalog**](methods/README.md) for the full A–Z index, or
jump to a group:

| Group | Messages |
| ----- | -------- |
| [Lifecycle & protocol](methods/lifecycle.md) | `initialize`, `initialized`, `shutdown`, `exit`, `$/setTrace`, `$/logTrace`, `$/progress`, `$/cancelRequest` |
| [Document sync](methods/text-document-sync.md) | `didOpen`, `didChange`, `didClose`, `didSave`, `willSave`, `willSaveWaitUntil` |
| [Language features](methods/language-features.md) | hover, definition, declaration, type definition, implementation, references, document highlight, document symbol, completion, signature help, code action, code lens, document link, formatting, rename, folding, selection range, semantic tokens, inlay hint, inline completion, inline value, linked editing, moniker, color |
| [Call & type hierarchy](methods/hierarchies.md) | `prepareCallHierarchy`, `incomingCalls`, `outgoingCalls`, `prepareTypeHierarchy`, `supertypes`, `subtypes` |
| [Workspace](methods/workspace.md) | symbol, `executeCommand`, pull diagnostics, file operations, configuration, file watching, workspace folders, refresh requests |
| [Window](methods/window.md) | `showMessage`, `logMessage`, `showMessageRequest`, `showDocument`, work-done progress |
| [Notebooks](methods/notebooks.md) | notebook `didOpen` / `didChange` / `didSave` / `didClose` |

> **Resolve requests** (`completionItem/resolve`, `codeAction/resolve`, …) are
> documented next to the feature they complete in
> [Language features](methods/language-features.md).

---

## Conventions used in these docs

* **Direction** — `client → server` means the client sends and the server
  handles; `server → client` is the reverse. The API is symmetric: the *sender*
  side calls `*.server.*` / `*.client.*`, the *handler* side registers
  `*.on<Feature>(...)`.
* **Dot-shorthand** — examples use `.bool(true)`, `.markdown`, etc. where the
  target type is inferable. The full form (`MarkupKind.markdown`) always works.
* **Examples** are distilled from the package's own end-to-end tests
  (`test/e2e_*.dart`), so they compile against the current API.
