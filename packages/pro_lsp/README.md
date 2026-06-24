<!-- markdownlint-disable-file MD004 -->
# pro_lsp

Unified **LSP 3.18** Dart bindings and a typed server/client framework. `pro_lsp`
is lightweight, transport-agnostic, and strictly type-safe — build Language
Servers and Language Clients in Dart without hand-writing JSON-RPC plumbing.

```dart
import 'package:pro_lsp/pro_lsp.dart';

void main() async {
  final server = LspServer();

  server.general.onInitialize((params, context) async {
    return const InitializeResult(
      capabilities: ServerCapabilities(hoverProvider: .bool(true)),
      serverInfo: ServerInfo(name: 'my-dart-lsp', version: '1.0.0'),
    );
  });

  server.textDocument.onHover((params, context) async {
    return Hover(
      contents: HoverContents.markupContent(
        MarkupContent(kind: .markdown, value: '`${params.textDocument.uri}`'),
      ),
    );
  });

  // Blocks until the client exits. `shutdown`/`exit` are handled for you.
  await server.listen();
}
```

> **Never write to `stdout` from a stdio server.** On stdio, `stdout` *is* the
> protocol channel — a stray `print()` corrupts the JSON-RPC stream. Log to
> `stderr` or a file, and set `server.onError`. See
> [Building a server → Logging](doc/guides/server.md#logging-and-debugging).

---

## Why pro_lsp

* **Complete LSP 3.18 surface**, generated from the official Microsoft
  meta-model: Freezed structures (`copyWith`, value equality, JSON),
  `extension type` unions, and open/closed enums.
* **Typed, symmetric API** — incoming messages are *handlers*
  (`server.textDocument.onHover(...)`); outgoing messages are *senders*
  (`server.client.window.showMessage(...)`). The client mirrors the server.
* **Lifecycle handled for you** — an enforced state machine
  (uninitialized → initialized → shuttingDown → exited) with sensible
  `shutdown`/`exit` defaults.
* **Cancellation both ways** via `CancellationToken`, plus `timeout` on outgoing
  requests.
* **Typed errors** — everything surfaces as `LspException`; you never touch the
  transport's `RpcException`.
* **Pluggable & extensible** — modular `LspFeature`s, middleware, and a built-in
  service container (DI).
* **Transport-agnostic framing** over stdio, TCP, or any byte stream via
  `LspByteStreamChannel`.

---

## Install

```bash
dart pub add pro_lsp
```

Requires **Dart SDK `^3.10`** — the generated API uses recent language features,
including *dot-shorthands* for enums and union factories (`.bool(true)`,
`.markdown`). Where the target type is known, you can drop the type name and
start with `.`.

---

## Documentation

The full guide lives in [**`doc/`**](doc/README.md). Start there for concepts,
end-to-end walkthroughs, and a **per-method tutorial** covering every LSP request
and notification with "what / when / example".

**Guides**

* [Getting started](doc/getting-started.md) — install, first server, first client
* [Core concepts](doc/concepts.md) — handlers, senders, context, lifecycle
* [Building a server](doc/guides/server.md) — capabilities, talking back, lifecycle, logging
* [Building a client](doc/guides/client.md) — handshake, calling the server, receiving messages
* [Working with models](doc/guides/models.md) — Freezed structures, unions, enums
* [Error handling](doc/guides/errors.md) — `LspException`, error codes
* [Cancellation](doc/guides/cancellation.md) — incoming and outgoing
* [Testing](doc/guides/testing.md) — in-memory client↔server
* [Transports](doc/guides/transports.md) — stdio, sockets, custom framing
* [Advanced](doc/guides/advanced.md) — features, dependency injection, middleware

**Method reference** ([catalog](doc/methods/README.md))

* [Lifecycle & protocol](doc/methods/lifecycle.md) — initialize, shutdown, progress, trace
* [Document sync](doc/methods/text-document-sync.md) — didOpen / didChange / didClose / save
* [Language features](doc/methods/language-features.md) — hover, definition, completion, …
* [Call & type hierarchy](doc/methods/hierarchies.md)
* [Workspace](doc/methods/workspace.md) — symbols, commands, files, configuration, refresh
* [Window](doc/methods/window.md) — messages, progress, show document
* [Notebooks](doc/methods/notebooks.md)

---

## License

MIT — see [`LICENSE`](LICENSE) for details.
