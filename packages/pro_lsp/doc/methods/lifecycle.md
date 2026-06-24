<!-- markdownlint-disable-file MD004 -->
# Lifecycle methods

These methods drive the connection through its state machine: handshake,
trace control, progress, cancellation, and orderly shutdown.

The handshake runs first and in a fixed order:

1. The client sends `initialize` (request) and waits for the server's
   `InitializeResult` (capabilities, server info).
2. The client sends `initialized` (notification) to acknowledge.
3. Normal traffic flows until the client sends `shutdown` (request), then
   `exit` (notification).

In `pro_lsp` the whole handshake is performed for you by `client.start(...)`,
and `shutdown`/`exit` have framework defaults — the server transitions through
`shuttingDown` → `exited` automatically. You only register `onInitialize`
(to advertise capabilities) and optionally `onExit`. See
[../guides/server.md#lifecycle-and-state-machine](../guides/server.md#lifecycle-and-state-machine).

---

## Messages

### `initialize` — Initialize

**client → server · request**

When to use it: The first message of any session. The client announces its
capabilities and the server replies with `InitializeResult` (server
capabilities + info). `client.start(...)` sends this for you.

Handle it (server):

```dart
server.general.onInitialize(
  (params, context) async => const InitializeResult(
    capabilities: ServerCapabilities(
      hoverProvider: .bool(true),
      definitionProvider: .bool(true),
    ),
    serverInfo: ServerInfo(name: 'e2e-server', version: '1.0.0'),
  ),
);
```

Call it (client):

```dart
// Sent automatically by client.start; this drives the handshake.
await client.start(
  capabilities: const ClientCapabilities(),
  clientInfo: ClientInfo(name: 'e2e-client', version: '1.0.0'),
  processId: 1234,
);
```

---

### `initialized` — Initialized

**client → server · notification**

When to use it: Sent by the client right after it receives the
`InitializeResult`, to confirm the handshake is complete and dynamic
registrations may begin. Sent for you by `client.start(...)`.

Handle it (server):

```dart
server.general.onInitialized((params, context) async {
  // Connection is live; safe to register capabilities / start work.
});
```

Call it (client):

```dart
client.server.general.initialized(const InitializedParams());
```

---

### `shutdown` — Shutdown

**client → server · request**

When to use it: Asks the server to release resources but stay alive. After a
successful `shutdown` the server is in `LspState.shuttingDown` and the only
valid follow-up is `exit`. Has a framework default, so a handler is optional.

Handle it (server):

```dart
server.general.onShutdown((context) async {
  // Optional: flush state. The state transition is handled for you.
});
```

Call it (client):

```dart
await client.server.general.shutdown();
// server.state == LspState.shuttingDown
```

---

### `exit` — Exit

**client → server · notification**

When to use it: Sent after `shutdown` to terminate the server process. Moves
the server to `LspState.exited`. Has a framework default; register `onExit`
only if you need to react.

Handle it (server):

```dart
server.general.onExit((context) async {
  // Optional cleanup before the process ends.
});
```

Call it (client):

```dart
client.server.general.exit();
// server.state == LspState.exited
```

---

### `$/setTrace` — Set Trace

**client → server · notification**

When to use it: The client changes the server's tracing verbosity
(`off` / `messages` / `verbose`). The server should echo activity via
`$/logTrace` at the requested level.

Handle it (server):

```dart
server.general.onSetTrace((params, context) async {
  // params.value is a TraceValue, e.g. TraceValue.messages
});
```

Call it (client):

```dart
client.server.general.setTrace(
  const SetTraceParams(value: TraceValue.messages),
);
```

---

### `$/logTrace` — Log Trace

**server → client · notification**

When to use it: The server emits a human-readable trace line. The client only
acts on it when its trace level (set via `$/setTrace`) is not `off`.

Send it (server):

```dart
server.client.general.logTrace(
  const LogTraceParams(message: 'resolving symbols…'),
);
```

Handle it (client):

```dart
client.general.onLogTrace((params, context) async {
  // params.message
});
```

---

### `$/progress` — Progress

**both directions · notification**

When to use it: The general-purpose channel that carries work-done and partial
result progress. Each `ProgressParams` pairs a `token` (established out of band,
e.g. via `window/workDoneProgress/create`) with a `value` payload. Either side
may send it.

Send it (server → client):

```dart
server.client.general.progress(
  const ProgressParams(
    token: ProgressToken.string('tok-1'),
    value: LSPAny.string('begin'),
  ),
);
```

Handle it (client):

```dart
client.general.onProgress((params, context) async {
  // params.token, params.value
});
```

The client→server direction is symmetric:

```dart
client.server.general.progress(/* ProgressParams */);
// server.general.onProgress((params, context) async { ... });
```

---

### `$/cancelRequest` — Cancel Request

**both directions · notification**

When to use it: Never send this by hand. `pro_lsp` manages cancellation
through `CancellationToken`: pass a token to any request and call
`token.cancel()`, and the framework sends `$/cancelRequest` and surfaces a
`requestCancelled` error to the caller. Incoming cancellations flip the
handler's `context.cancellationToken` automatically.

```dart
final token = CancellationToken();
final pending = client.server.textDocument.hover(params, token: token);
token.cancel(); // framework sends $/cancelRequest under the hood
```

See [../guides/cancellation.md](../guides/cancellation.md) for the full model.
