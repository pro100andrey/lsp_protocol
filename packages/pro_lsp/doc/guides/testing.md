<!-- markdownlint-disable-file MD004 -->
# Testing

Because everything is transport-agnostic, you can wire a client and a server
together **in memory** — no sockets, no subprocess. This makes round-trip tests
fast and deterministic.

See also [Building a client](./client.md) and [Building a server](./server.md)
for the APIs exercised below.

---

## In-memory wiring with `StreamChannelController`

A `StreamChannelController<List<int>>` gives you two linked channels — `local`
and `foreign`. Hand one to the server and the other to the client, and they
talk to each other directly:

```dart
import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  test('hover round-trip', () async {
    final controller = StreamChannelController<List<int>>();
    final server = LspServer.fromChannel(controller.local);
    final client = LspClient.fromChannel(controller.foreign);

    server.general.onInitialize(
      (params, context) async =>
          const InitializeResult(capabilities: ServerCapabilities()),
    );
    server.textDocument.onHover((params, context) async {
      return Hover(
        contents: HoverContents.markupContent(
          MarkupContent(kind: .plainText, value: 'Hello'),
        ),
      );
    });

    unawaited(server.listen());
    await client.start(capabilities: const ClientCapabilities());

    final hover = await client.server.textDocument.hover(
      HoverParams(
        textDocument: const TextDocumentIdentifier(uri: 'file:///test.dart'),
        position: const Position(line: 0, character: 0),
      ),
    );

    expect(hover?.contents.asMarkupContent?.value, contains('Hello'));

    await client.close();
    await server.close();
  });
}
```

Two ordering rules keep this reliable:

* Register server handlers **before** `server.listen()`.
* Register the client's incoming (server→client) handlers **before**
  `client.start()`, so they are ready before the server can send anything.

---

## The reusable harness (recommended)

Wiring, handshake, and teardown are the same in every test, so the package ships
a reusable harness in `test/support/e2e_harness.dart`. Its `e2eHarness()`
function installs a `tearDown` and returns a `connect` helper that:

* creates a linked `StreamChannelController` pair over the real LSP byte
  transport (Content-Length framing),
* registers a baseline `onInitialize`, lets you layer on more via
  `configureServer` / `configureClient`,
* completes the full `initialize` / `initialized` handshake, and
* **auto-closes** every server and client it created when the test ends.

Call `e2eHarness()` once at the top of `main()`, then `connect(...)` per test.
This is the best practical pattern — a test reads as just "configure handlers,
then exercise them":

```dart
import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/e2e_harness.dart';

void main() {
  final connect = e2eHarness();

  test('hover round-trips a typed result', () async {
    final (:server, :client) = await connect(
      configureServer: (server) {
        server.textDocument.onHover(
          (params, context) async => Hover(
            contents: HoverContents.markupContent(
              const MarkupContent(kind: MarkupKind.markdown, value: '**doc**'),
            ),
          ),
        );
      },
    );

    final hover = await client.server.textDocument.hover(
      const HoverParams(
        textDocument: TextDocumentIdentifier(uri: 'file:///a.dart'),
        position: Position(line: 1, character: 2),
      ),
    );

    expect(hover!.contents.asMarkupContent!.value, '**doc**');
    // No manual close() — the harness tears both endpoints down for you.
  });
}
```

`connect` returns a record `({LspServer server, LspClient client})`, so you can
destructure it with `final (:server, :client) = await connect(...)`.

### Testing both directions

Because `configureClient` runs before `client.start()`, you can register
server→client handlers and assert that pushes arrive. A common pattern is to use
a `Completer` to await an async notification:

```dart
final diagnostics = Completer<PublishDiagnosticsParams>();

final (:server, :client) = await connect(
  configureServer: (server) {
    server.textDocument.onDidOpen((params, context) async {
      server.client.textDocument.publishDiagnostics(
        const PublishDiagnosticsParams(uri: 'file:///a.dart', diagnostics: []),
      );
    });
  },
  configureClient: (client) {
    client.textDocument.onPublishDiagnostics(
      (params, context) async => diagnostics.complete(params),
    );
  },
);

client.server.textDocument.didOpen(/* ... */);

final received = await diagnostics.future.timeout(const Duration(seconds: 5));
expect(received.uri, 'file:///a.dart');
```

The same harness drives lifecycle, error, and cancellation tests — see
[Cancellation](./cancellation.md) and [Error handling](./errors.md) for those
round-trip examples.

---

## Where to go next

* [Building a client](./client.md) — the `start` / `close` lifecycle.
* [Building a server](./server.md) — registering handlers.
* [Transports](./transports.md) — running over real sockets in production.
