<!-- markdownlint-disable-file MD004 -->
# Getting started

This guide takes you from installation to a running Language Server and a
client talking to it. For the mental model behind the API, see
[concepts](./concepts.md); for the full feature walkthroughs see the
[server](./guides/server.md) and [client](./guides/client.md) guides.

---

## Requirements

**Dart SDK `^3.10`.** The generated API leans on recent language features. In
particular, examples use *dot-shorthand* for enums and union factories where
the target type is known: `.bool(true)` is
`ServerCapabilitiesHoverProvider.bool(true)`, `.markdown` is
`MarkupKind.markdown`, and so on. Drop the type name and start with `.`.

---

## Installation

```bash
dart pub add pro_lsp
```

Or add it manually to `pubspec.yaml`:

```yaml
dependencies:
  pro_lsp: ^0.2.0
```

Then import it:

```dart
import 'package:pro_lsp/pro_lsp.dart';
```

---

## A minimal server

A minimal Language Server over stdio:

```dart
import 'package:pro_lsp/pro_lsp.dart';

void main() async {
  final server = LspServer();

  // Advertise capabilities during the handshake.
  server.general.onInitialize((params, context) async {
    return const InitializeResult(
      capabilities: ServerCapabilities(hoverProvider: .bool(true)),
      serverInfo: ServerInfo(name: 'my-dart-lsp', version: '1.0.0'),
    );
  });

  // Handle a request.
  server.textDocument.onHover((params, context) async {
    return Hover(
      contents: HoverContents.markupContent(
        MarkupContent(
          kind: .markdown,
          value: '### Symbol\n\nFile: `${params.textDocument.uri}`',
        ),
      ),
    );
  });

  // Blocks until the client exits. `shutdown` and `exit` are handled for you.
  await server.listen();
}
```

> **Never write to `stdout` from a stdio server.** On stdio, `stdout` *is* the
> protocol channel — a stray `print()` corrupts the JSON-RPC stream. Log to
> `stderr` or a file, and set `server.onError` (see
> [Logging and debugging](./guides/server.md#logging-and-debugging)).

`server.listen()` defaults to `stdin`/`stdout`. To run over a socket or any
other byte stream, hand the raw `StreamChannel<List<int>>` to
`LspServer.fromChannel` — it applies LSP byte-framing for you.

---

## Connecting a client

`LspClient` implements the client side — useful for editor integrations and for
testing servers. `start(...)` performs the full handshake for you: it sends
`initialize` with your capabilities, stores the returned `ServerCapabilities`
in `client.serverCapabilities`, sends `initialized`, and begins listening.

```dart
final client = LspClient.fromChannel(channel);

final initResult = await client.start(
  capabilities: const ClientCapabilities(),
  rootUri: 'file:///my/project',
);

print('Hover supported: ${client.serverCapabilities?.hoverProvider}');

// Call the server through the `server` proxy.
final hover = await client.server.textDocument.hover(
  const HoverParams(
    textDocument: TextDocumentIdentifier(uri: 'file:///main.dart'),
    position: Position(line: 10, character: 4),
  ),
);
```

Since everything is transport-agnostic, you can wire a client and server
together in memory — no sockets, no subprocess. That is exactly how the test
suite works; see the [client guide](./guides/client.md) for a runnable example.

---

## Next steps

- [Concepts](./concepts.md) — the handler/sender mental model and message
  direction.
- [Building a server](./guides/server.md) — handlers, capabilities, lifecycle,
  logging.
- [Building a client](./guides/client.md) — handshake, calling the server,
  receiving server→client messages.
- [Methods reference](./methods/README.md) — the full catalog of LSP methods.
