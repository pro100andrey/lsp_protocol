<!-- markdownlint-disable-file MD004 -->
# pro_lsp

Unified LSP 3.17 Dart bindings and a typed server/client framework. `pro_lsp` is lightweight, transport-agnostic, and strictly type-safe — build Language Servers and Language Clients in Dart without hand-writing JSON-RPC plumbing.

---

## Highlights

* **Complete LSP 3.17 surface**, generated from the official Microsoft meta-model: Freezed structures (`copyWith`, value equality, JSON), `extension type` unions, and open/closed enums.
* **Typed, symmetric API**: incoming messages are *handlers* (`server.textDocument.onHover(...)`); outgoing messages are *senders* (`server.client.window.showMessage(...)`).
* **Lifecycle handled for you**: an enforced state machine (uninitialized → initialized → shuttingDown → exited) plus default `shutdown`/`exit` behavior out of the box.
* **Cancellation in both directions** via `CancellationToken`, including `timeout` for outgoing requests.
* **Typed errors**: everything surfaces as `LspException` — you never touch the transport's `RpcException`.
* **Pluggable & extensible**: modular `LspFeature`s, middleware, and a built-in service container (DI).
* **Transport-agnostic framing** over stdio, TCP, or any byte stream via `LspByteStreamChannel`.

---

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Quick start](#quick-start)
- [Core concepts](#core-concepts)
- [Building a server](#building-a-server)
  - [Registering handlers](#registering-handlers)
  - [Declaring capabilities](#declaring-capabilities)
  - [Talking back to the client](#talking-back-to-the-client)
  - [Lifecycle and state machine](#lifecycle-and-state-machine)
  - [Logging and debugging](#logging-and-debugging)
- [Building a client](#building-a-client)
- [Testing](#testing)
- [Working with models](#working-with-models)
- [Error handling](#error-handling)
- [Cancellation](#cancellation)
- [Advanced](#advanced)
  - [Pluggable features](#pluggable-features)
  - [Dependency injection](#dependency-injection)
  - [Middleware](#middleware)
- [Transports](#transports)
- [License](#license)

---

## Requirements

* **Dart SDK `^3.10`.** The generated API leans on recent language features. In particular, examples use *dot-shorthand* for enums and union factories: `.bool(true)` is `ServerCapabilitiesHoverProvider.bool(true)`, `.markdown` is `MarkupKind.markdown`, and so on. Where the target type is known, you can drop the type name and start with `.`.

---

## Installation

```bash
dart pub add pro_lsp
```

Or add it manually to `pubspec.yaml`:

```yaml
dependencies:
  pro_lsp: ^0.1.2
```

---

## Quick start

A minimal Language Server over stdio:

```dart
import 'package:pro_lsp/pro_lsp.dart';

void main() async {
  final server = LspServer();

  // Advertise capabilities during the handshake.
  server.general.onInitialize((params, context) async {
    return const InitializeResult(
      capabilities: ServerCapabilities(hoverProvider: .bool(true)),
      serverInfo: (name: 'my-dart-lsp', version: '1.0.0'),
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

> **Never write to `stdout` from a stdio server.** On stdio, `stdout` *is* the protocol channel — a stray `print()` corrupts the JSON-RPC stream. Log to `stderr` or a file, and set `server.onError` (see [Logging and debugging](#logging-and-debugging)).

---

## Core concepts

`pro_lsp` is symmetric: `LspServer` and `LspClient` expose the same shape, differing only in message direction. The mental model is small:

| Concept | What it is | How you reach it |
| ------- | ---------- | ---------------- |
| **Handler** | Code that runs when a message *arrives* | `server.<namespace>.on<Feature>(handler)` |
| **Sender** | A call you *make* to the other side | `server.client.<namespace>.<method>(...)` / `client.server.<namespace>.<method>(...)` |
| **`LspRequest`** | Per-message context passed to every handler | the handler's second argument |
| **`LspConnection`** | The low-level JSON-RPC connection | `server.connection` (rarely needed directly) |

Requests return a typed result; notifications return nothing. The same split holds for senders (a request sender returns `Future<Result>`, a notification sender returns `void`).

---

## Building a server

### Registering handlers

Every LSP method is a typed handler under a namespace: `server.<namespace>.on<Feature>(handler)`. Request handlers return the result type (`T?`); notification handlers return `void Function()` — an unregister callback.

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

This is the whole catalog; for the exact method names and types in any namespace, rely on your IDE's autocomplete and the dartdoc — `server.textDocument.on` will list everything available.

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

### Declaring capabilities

`ServerCapabilities` tells the client what you support. Return it from `onInitialize`:

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
  );
});
```

### Talking back to the client

The server can push notifications and make requests to the client via `server.client`:

```dart
// Notification — fire and forget.
server.client.textDocument.publishDiagnostics(
  PublishDiagnosticsParams(uri: docUri, diagnostics: [...]),
);

// Request — returns a typed result.
final result = await server.client.workspace.applyEdit(
  ApplyWorkspaceEditParams(edit: WorkspaceEdit(changes: {...})),
);
if (!result.applied) { /* client rejected the edit */ }
```

Request senders also accept an optional `token` and `timeout` — see [Cancellation](#cancellation). Notifications take neither (there is no response).

### Lifecycle and state machine

`pro_lsp` enforces the LSP lifecycle automatically, so out-of-order messages are rejected for you:

* **Before initialization** — any request other than `initialize` is rejected with `serverNotInitialized` (`-32002`); your handlers never run.
* **Initializing** — while `onInitialize` runs, the connection is in `initializing`.
* **Shutting down** — after `shutdown`, further requests are rejected.
* **Exit** — `exit` closes the connection and returns `listen()`.

**Defaults:** if you don't register them, `pro_lsp` provides a spec-compliant `shutdown` (succeeds) and `exit` (closes the connection). Register your own to override — for example to flush state on shutdown:

```dart
server.general.onShutdown((context) async {
  await saveCaches();
});
// You may also override onExit; if you do, you are responsible for closing.
```

### Logging and debugging

Handler and feature-disposal errors are routed to `server.onError`, which is **unset by default** — so notification-handler errors are silently swallowed (request-handler errors are still returned to the client as JSON-RPC errors). Set it to surface them, and log to `stderr`, **never `stdout`** — on a stdio server `stdout` *is* the protocol channel, so writing there corrupts the JSON-RPC stream:

```dart
server.onError = (error, stack) {
  stderr.writeln('[lsp] $error\n$stack'); // stderr is safe; stdout is not
};
```

The same rule applies to your own logging: use `stderr`, a file, or the `window/logMessage` notification — never `print()` on a stdio transport.

---

## Building a client

`LspClient` implements the client side — useful for editor integrations and for testing servers. `start(...)` performs the full handshake for you:

1. sends `initialize` with your capabilities,
2. stores the returned `ServerCapabilities` in `client.serverCapabilities`,
3. sends `initialized`,
4. begins listening.

```dart
final client = LspClient.fromChannel(channel);

final initResult = await client.start(
  capabilities: const ClientCapabilities(),
  rootUri: 'file:///my/project',
);

print('Hover supported: ${client.serverCapabilities?.hoverProvider}');

// Call the server through the `server` proxy.
final hover = await client.server.textDocument.hover(
  HoverParams(
    textDocument: const TextDocumentIdentifier(uri: 'file:///main.dart'),
    position: const Position(line: 10, character: 4),
  ),
);
```

---

## Testing

Because everything is transport-agnostic, you can wire a client and server together in memory — no sockets, no subprocess:

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

---

## Working with models

All structures are [Freezed](https://pub.dev/packages/freezed) classes — you get value equality, JSON (`fromJson`/`toJson`), and non-destructive `copyWith`:

```dart
final updated = capabilities.copyWith(
  textDocumentSync: .textDocumentSyncOptions(
    const TextDocumentSyncOptions(openClose: true, change: .full),
  ),
);
```

**Unions** (LSP `A | B` types) are zero-cost `extension type`s with `isX` checks and `asX` accessors, plus named factories. For example `Definition` is `Location | Location[]`:

```dart
// Construct
final d = Definition.location(myLocation);
// or: Definition.locationList([loc1, loc2]);

// Inspect
if (d.isLocation) {
  use(d.asLocation!);           // Location?
} else if (d.isLocationList) {
  useAll(d.asLocationList!);    // List<Location>?
}
```

**Enums** come in two flavors:

* *Closed* enums (fixed value sets) are real Dart `enum`s with a `value` field and a null-returning `decode`:

  ```dart
  const kind = MarkupKind.markdown;       // wire value: 'markdown'
  final parsed = MarkupKind.decode('plaintext'); // MarkupKind? (null if unknown)
  ```

* *Open* enums (the spec allows custom values) are `extension type`s over the primitive, exposing the known members as constants while still accepting custom ones:

  ```dart
  const known = SemanticTokenTypes.function;
  const custom = SemanticTokenTypes('myCustomType'); // also valid
  ```

---

## Error handling

Errors flow through a single type, `LspException`, in **both** directions — you never handle the transport's `RpcException`.

Throw one inside a handler to send a structured JSON-RPC error back; named factories cover the standard codes:

```dart
server.textDocument.onHover((params, context) async {
  final doc = documents[params.textDocument.uri];
  if (doc == null) {
    throw LspException.invalidParams('Unknown document: ${params.textDocument.uri}');
  }
  return computeHover(doc, params.position);
});
```

When you call the other side, any error response is re-thrown as an `LspException` carrying the JSON-RPC `code`, `message`, and `data`:

```dart
try {
  final result = await client.server.general.initialize(initParams);
} on LspException catch (e) {
  print('initialize failed (${e.code}): ${e.message}');
  // Some requests attach a structured payload in `e.data` (e.g. initialize may
  // return an InitializeError); deserialize it with that model's `fromJson`.
}
```

`LspErrorCodes` enumerates every standard code (`parseError`, `invalidParams`, `requestCancelled`, `contentModified`, …) so you can branch on `e.code` without magic numbers.

---

## Cancellation

LSP cancellation works **both ways**, and `pro_lsp` exposes it through one type, `CancellationToken`.

**Incoming requests.** Every handler's context carries a token that is cancelled when the client sends `$/cancelRequest`. Check it at natural abort points:

```dart
server.textDocument.onReferences((params, context) async {
  final results = <Location>[];
  for (final file in workspaceFiles) {
    context.cancellationToken.throwIfCancelled(); // aborts with requestCancelled
    results.addAll(await findReferencesInFile(file, params.position));
  }
  return results;
});
```

When `throwIfCancelled()` fires, the handler stops and the client receives a standard `requestCancelled` error.

**Outgoing requests.** Pass a `token` and/or a `timeout` to any request sender. On cancel or timeout, `pro_lsp` sends `$/cancelRequest` with the request's wire id and your `Future` completes with `LspException.requestCancelled`:

```dart
final token = CancellationToken();
cancelButton.onPressed = token.cancel;

final symbols = await client.server.workspace.symbol(
  WorkspaceSymbolParams(query: 'build'),
  token: token,
  timeout: const Duration(seconds: 10),
);
```

---

## Advanced

### Pluggable features

Split a large server into cohesive modules by extending `LspFeature`. The server manages each feature's register/dispose lifecycle:

```dart
class HoverFeature extends LspFeature {
  @override
  void register(LspServer server) {
    server.textDocument.onHover((params, context) async {
      return Hover(
        contents: HoverContents.markupContent(
          MarkupContent(
            kind: .plainText,
            value: 'Hovering ${params.textDocument.uri}',
          ),
        ),
      );
    });
  }

  @override
  FutureOr<void> dispose() {
    // Cancel subscriptions, flush caches, etc.
  }
}

server.registerFeature(HoverFeature());
```

### Dependency injection

Register shared services at startup and resolve them from any handler context:

```dart
server.register(AnalysisEngine(config));

server.textDocument.onCompletion((params, context) async {
  final engine = context.resolve<AnalysisEngine>();
  return CompletionList(items: await engine.complete(params));
});
```

### Middleware

Wrap every request/notification — for logging, timing, auth, or error capture. Middlewares can be classes or built from a function with `LspMiddleware.fromFunction`. Throwing an `LspException` short-circuits with an error response.

```dart
class LoggingMiddleware extends LspMiddleware {
  @override
  Future<Object?> call(LspIncomingRequest request, LspNext next) async {
    final sw = Stopwatch()..start();
    stderr.writeln('[lsp] -> ${request.method}');
    try {
      return await next(request);
    } finally {
      stderr.writeln('[lsp] <- ${request.method} (${sw.elapsedMilliseconds}ms)');
    }
  }
}

server.addMiddleware(LoggingMiddleware());
```

---

## Transports

`server.listen()` defaults to `stdin`/`stdout`. To run over a socket or any other byte stream, hand the raw `StreamChannel<List<int>>` to `LspServer.fromChannel` — it applies LSP byte-framing for you, and `close()` releases the transport:

```dart
import 'dart:io';
import 'package:stream_channel/stream_channel.dart';
import 'package:pro_lsp/pro_lsp.dart';

void main() async {
  final serverSocket = await ServerSocket.bind('localhost', 3000);
  await for (final socket in serverSocket) {
    // A Socket is both a Stream<Uint8List> and an IOSink.
    final channel = StreamChannel<List<int>>(socket, socket);

    final server = LspServer.fromChannel(channel);
    // register handlers...
    await server.listen(); // closes (and releases the socket) when the peer exits
  }
}
```

> For lower-level control you can frame a channel yourself with `LspByteStreamChannel.fromByteChannel(channel)` and drive an `LspConnection` directly; remember to call the returned `cleanup()` when done. Most servers should prefer `LspServer.fromChannel`.

---

## License

MIT — see [`LICENSE`](LICENSE) for details.
