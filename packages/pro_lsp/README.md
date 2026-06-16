# pro_lsp

Unified LSP 3.17 Dart bindings and server API implementation. `pro_lsp` is a lightweight, transport-agnostic, and strictly type-safe framework for building Language Servers and Language Clients in Dart.

---

## Features

* **Complete LSP 3.17 Specification (Freezed-backed)**: Type-safe Dart models generated directly from the official Microsoft LSP meta-model (structures, unions, enums, scalar unions) supporting `copyWith`, deep equality checks (`==`), and JSON mapping.
* **Pluggable Architecture (`LspFeature`)**: Decouple large servers into cohesive, modular feature components (e.g., Hover, Completion, Diagnostics).
* **Connection Lifecycle Management**: Automatic state machine tracking (uninitialized, initializing, initialized, shuttingDown, exited) to reject out-of-order messages according to the LSP spec.
* **Middleware Support**: Intercept, measure, modify, or log requests and notifications before they hit your handlers.
* **Built-in Service Registry (DI)**: Register dependencies directly on the server connection and resolve them inside the handler context.
* **Framing & Transport Agnostic**: Runs on standard I/O streams, TCP sockets, or custom byte streams out of the box using `LspByteStreamChannel`.

---

## Getting Started

Add `pro_lsp` to your `pubspec.yaml`:

```yaml
dependencies:
  pro_lsp:
    path: path/to/pro_lsp
```

Run `dart pub get` to install.

---

## Basic Usage

Here is how to set up a basic Language Server running over standard I/O:

```dart
import 'package:pro_lsp/pro_lsp.dart';

void main() async {
  final server = LspServer();

  // 1. Connection Initialization
  server.general.onInitialize((params, context) async {
    return const InitializeResult(
      capabilities: ServerCapabilities(
        hoverProvider: .bool(true),
      ),
      serverInfo: (name: 'my-dart-lsp', version: '1.0.0'),
    );
  });

  // 2. Register a Hover Handler
  server.textDocument.onHover((params, context) async {
    return Hover(
      contents: MarkupContent(
        kind: .markdown,
        value: '### Symbol Info\n\nFile: `${params.textDocument.uri}`',
      ),
    );
  });

  // 3. Start listening on Stdio
  await server.listen();
}
```

### Sending Messages to the Client

You can send notifications and make requests back to the client using the `client` proxy:

```dart
// Show an info dialog in the editor
server.client.window.showMessage(
  ShowMessageParams(
    type: .info,
    message: 'Welcome to My Language Server!',
  ),
);
```

---

## Core Entities: LspServer & LspClient

`pro_lsp` is designed symmetrically. `LspServer` manages server execution and processes incoming client requests, while `LspClient` serves as a language client proxy (perfect for editor integrations or integration testing).

### 1. `LspServer` (Building a Server)

The `LspServer` is the orchestrator for the server side.

#### Handler Namespaces

Handlers for incoming client requests and notifications are grouped into spec-compliant namespaces:

* **`general`**: Lifecycle methods (`onInitialize`, `onInitialized`, `onShutdown`, `onExit`) and protocol notifications (`onCancelRequest`, `onProgress`).
* **`textDocument`**: Document-scoped events (`onDidOpen`, `onDidChange`, `onHover`, `onCompletion`, `onDefinition`, `onReferences`, `onDocumentSymbol`, `onSemanticTokensFull`, `onFormatting`, etc.).
* **`workspace`**: Workspace-wide actions and queries (`onSymbol`, `onExecuteCommand`, `onDidChangeConfiguration`, `onDidChangeWatchedFiles`, `onWillRenameFiles`, etc.).
* **`window`**: UI notifications from the client (`onWorkDoneProgressCancel`).
* **`callHierarchy`**: Call hierarchy providers (`onPrepareCallHierarchy`, `onIncomingCalls`, `onOutgoingCalls`).
* **`typeHierarchy`**: Type hierarchy providers (`onPrepareTypeHierarchy`, `onSupertypes`, `onSubtypes`).
* **`notebookDocument`**: Notebook-specific lifecycle events (`onDidOpen`, `onDidChange`, `onDidSave`, `onDidClose`).
* **`completionItem`**: Lazy resolution for completion items (`onResolve`).
* **`codeAction`**: Lazy resolution for code actions (`onResolve`).
* **`codeLens`**: Lazy resolution for code lenses (`onResolve`).
* **`documentLink`**: Lazy resolution for document links (`onResolve`).
* **`inlayHint`**: Inlay hint resolution (`onInlayHint`, `onResolve`).
* **`workspaceSymbol`**: Workspace symbol resolution (`onResolve`).

#### Capability Inference (via `pro_lsp_sdk`)

Setting up `ServerCapabilities` manually is tedious and error-prone. If you use the companion SDK package `pro_lsp_sdk`, it provides an `inferCapabilities()` extension method on `LspServer` that automatically scans all registered handlers and populates the `ServerCapabilities` tree:

```dart
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';

server.general.onInitialize((params, context) async {
  return InitializeResult(
    capabilities: server.inferCapabilities(
      // Pass extra options like trigger characters that cannot be inferred
      completionTriggerCharacters: ['.', ':'],
    ),
  );
});
```

#### Outgoing Messages (`client` Proxy)

The server can interact with the client actively via `server.client`:

```dart
// Send diagnostic results
server.client.textDocument.publishDiagnostics(
  PublishDiagnosticsParams(uri: docUri, diagnostics: [...]),
);

// Apply edits to the workspace
server.client.workspace.applyEdit(
  ApplyWorkspaceEditParams(edit: WorkspaceEdit(changes: {...})),
);
```

---

### 2. `LspClient` (Building a Client or Writing Integration Tests)

The `LspClient` implements the client-side protocol and simplifies integration tests.

#### Automated Handshake (`start`)

To prevent protocol state errors, calling `client.start(...)` automatically performs the initialization sequence:

1. Sends `initialize` request with client capabilities.
2. Receives and stores `ServerCapabilities` inside `client.serverCapabilities`.
3. Sends `initialized` notification.
4. Starts listening to incoming messages asynchronously.

```dart
final client = LspClient.fromChannel(channel);

final initResult = await client.start(
  capabilities: const ClientCapabilities(),
  rootUri: 'file:///my/project',
);

print('Server capability for Hover: ${client.serverCapabilities?.hoverProvider}');
```

#### Writing Integration Tests

`LspClient` makes it trivial to write integration tests for your LSP server:

```dart
import 'package:test/test.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:pro_lsp/pro_lsp.dart';

void main() {
  test('LSP Hover Integration Test', () async {
    // Create an in-memory loopback transport channel
    final controller = StreamChannelController<List<int>>();
    
    // Spawn server and client on each side of the channel
    final server = LspServer.fromChannel(controller.local);
    final client = LspClient.fromChannel(controller.foreign);
    
    // Register feature on server
    server.textDocument.onHover((params, context) async {
      return Hover(
        contents: MarkupContent(kind: .plainText, value: 'Hello'),
      );
    });

    // Start client and perform handshake
    await client.start(capabilities: const ClientCapabilities());

    // Send a hover request from the client and verify the server's response
    final hover = await client.server.textDocument.hover(
      HoverParams(
        textDocument: const TextDocumentIdentifier(uri: 'file:///test.txt'),
        position: const Position(line: 0, character: 0),
      ),
    );

    expect(hover?.contents.value, contains('Hello'));

    // Clean up
    await client.close();
    await server.close();
  });
}
```

---

## Model Manipulation with Freezed (`copyWith`)

All generated data structures (such as `InitializeResult`, `TextDocumentItem`, `Hover`, etc.) are built using [Freezed](https://pub.dev/packages/freezed), meaning you get type safety, value equality comparisons, and deep copying out of the box.

This is particularly useful when modifying client capabilities or editing document state:

```dart
// Modify nested capabilities using copyWith
final customized = capabilities.copyWith(
  textDocumentSync: const TextDocumentSyncOptions(
    openClose: true,
    change: TextDocumentSyncKind.full,
  ),
);
```

---

## Advanced Concepts

### 1. Pluggable Features (`LspFeature`)

Instead of registration in a single file, divide your server into separate modules by extending `LspFeature`. The server will automatically manage their register and dispose lifecycles.

```dart
class HoverFeature extends LspFeature {
  @override
  void register(LspServer server) {
    server.textDocument.onHover((params, context) async {
      return Hover(
        contents: MarkupContent(
          kind: MarkupKind.plainText,
          value: 'Hovering over ${params.textDocument.uri}',
        ),
      );
    });
  }

  @override
  FutureOr<void> dispose() {
    // Cancel subscriptions or clean up analysis cache here
  }
}

// In your ServerRunner:
server.registerFeature(HoverFeature());
```

### 2. Dependency Injection / Service Container

Register shared analyzer services, indexers, or linter configurations at startup and resolve them inside any request context.

```dart
// Register service at startup
server.register(AnalysisEngine(config));

// Resolve inside a handler
server.textDocument.onCompletion((params, context) async {
  final engine = context.resolve<AnalysisEngine>();
  final completions = await engine.getCompletions(params);
  
  return CompletionList(items: completions);
});
```

### 3. Middleware

Register middlewares to intercept request inputs/outputs. Great for logging, performance profiling, error catching, and authorization checks.

Middlewares can be class-based or created from a function using `LspMiddleware.fromFunction`.

```dart
class LoggingMiddleware extends LspMiddleware {
  @override
  Future<Object?> call(
    LspIncomingRequest request,
    LspNext next,
  ) async {
    final stopwatch = Stopwatch()..start();
    print('[LSP] Incoming request: ${request.method}');
    try {
      final response = await next(request);
      print('[LSP] Completed in ${stopwatch.elapsedMilliseconds}ms');
      return response;
    } catch (e) {
      print('[LSP] Error: $e');
      rethrow;
    }
  }
}

server.connection.addMiddleware(LoggingMiddleware());
```

### 4. Handler Context (`LspRequest`)

Every handler receives an `LspRequest` object as its second parameter. This object provides:

* **`method`**: The LSP method name (e.g., `'textDocument/hover'`).
* **`id`**: The JSON-RPC request ID (null for notifications).
* **`isNotification`**: Boolean flag to check if the message is a notification.
* **`cancellationToken`**: Used to check if the client cancelled the request.
* **`connection`**: Access to the underlying `LspConnection`.
* **`resolve<T>()` / `tryResolve<T>()`**: Resolve dependencies from the service container.

### 5. Request Cancellation (`CancellationToken`)

For long-running operations (such as finding references, compiling workspace symbols, or building complex autocompletions), the client editor can send a `$/cancelRequest` notification to abort the computation.

You can monitor cancellation by accessing `context.cancellationToken` inside any handler:

```dart
server.textDocument.onReferences((params, context) async {
  final results = <Location>[];

  for (final file in workspaceFiles) {
    // Check if client cancelled the request and abort immediately
    context.cancellationToken.throwIfCancelled();

    final matches = await findReferencesInFile(file, params.position);
    results.addAll(matches);
  }

  return results;
});
```

When `throwIfCancelled()` is triggered, the server automatically stops executing the handler, frees resources, and returns a standard `LspErrorCodes.requestCancelled` error to the client.

### 6. Connection Lifecycle State Machine

The LSP specification strictly mandates a lifecycle sequence (`uninitialized` -> `initializing` -> `initialized` -> `shuttingDown` -> `exited`). Under the hood, `pro_lsp` tracks this connection state automatically:

* **Before Initialization**: If the client sends any request other than `initialize` (e.g. `textDocument/hover`), the server rejects it with an `LspErrorCodes.serverNotInitialized` (`-32002`) error and does not trigger your handlers.
* **Initialization**: While processing the `initialize` request, the server is in the `initializing` state.
* **After Shutdown**: Once the `shutdown` request is processed, the server moves to the `shuttingDown` state. Subsequent requests are rejected with a JSON-RPC error.
* **Exit**: When the client sends the `exit` notification, the server moves to the `exited` state, terminates connection processing, and closes the streams cleanly.

---

## Custom Transports (TCP / WebSockets)

By default, `server.listen()` binds to `stdin` and `stdout`. For unit testing or running over custom connections like TCP sockets, wrap the stream channel with `LspByteStreamChannel`:

```dart
import 'dart:io';
import 'package:stream_channel/stream_channel.dart';
import 'package:pro_lsp/pro_lsp.dart';

void main() async {
  final serverSocket = await ServerSocket.bind('localhost', 3000);
  await for (final socket in serverSocket) {
    // Socket is a Stream<Uint8List> and an IOSink (StreamConsumer<List<int>>)
    final channel = StreamChannel<List<int>>(socket.cast<List<int>>(), socket);
    final framed = LspByteStreamChannel.fromByteChannel(channel);

    final server = LspServer.fromChannel(framed.channel);
    
    try {
      // Set up handlers and listen
      await server.listen();
    } finally {
      await framed.cleanup();
    }
  }
}
```

---

## License

This project is licensed under the MIT License - see the `License-code.txt` file for details.
