<!-- markdownlint-disable-file MD004 -->
# Window methods

These methods drive the client's UI on the server's behalf: surfacing
messages, opening documents, and reporting long-running work. Everything in the
`window/*` family is **server → client** — the call site is on
`server.client.window` and the handler on the client as `client.window.on…`
(the one exception, `window/workDoneProgress/cancel`, runs the other way).

This file also covers two closely related server → client notifications that
live in their own namespaces: `telemetry/event` and
`textDocument/publishDiagnostics`.

For sending progress *updates* (as opposed to creating a progress token), see
`$/progress` in [./lifecycle.md](./lifecycle.md). See also
[../guides/client.md](../guides/client.md) for handler wiring.

---

## Messages & documents

### `window/showMessage` — Show Message

**server → client · notification**

When to use it: Fire-and-forget UI notification (info / warning / error / log)
shown to the user. No reply.

Send it (server):

```dart
server.client.window.showMessage(
  const ShowMessageParams(type: MessageType.info, message: 'opened'),
);
```

Handle it (client):

```dart
client.window.onShowMessage((params, context) async {
  // params.type, params.message
});
```

### `window/logMessage` — Log Message

**server → client · notification**

When to use it: Append a line to the client's output/log channel. Like
`showMessage` but destined for the log rather than a popup. No reply.

Send it (server):

```dart
server.client.window.logMessage(
  const LogMessageParams(type: MessageType.log, message: 'log line'),
);
```

Handle it (client):

```dart
client.window.onLogMessage((params, context) async {
  // params.type, params.message
});
```

### `window/showMessageRequest` — Show Message Request

**server → client · request** (→ `MessageActionItem?`)

When to use it: A message that offers actions (buttons). The client returns the
`MessageActionItem` the user picked, or `null` if they dismissed it.

Send it (server):

```dart
final action = await server.client.window.showMessageRequest(
  const ShowMessageRequestParams(
    type: MessageType.info,
    message: 'pick one',
  ),
);
// action?.title
```

Handle it (client):

```dart
client.window.onShowMessageRequest(
  (params, context) async => const MessageActionItem(title: 'OK'),
);
```

### `window/showDocument` — Show Document

**server → client · request** (→ `ShowDocumentResult`)

When to use it: The server asks the client to open a document or URL (in the
editor, or externally in a browser). The result's `success` flag reports
whether the client honored the request.

Send it (server):

```dart
final r = await server.client.window.showDocument(
  const ShowDocumentParams(uri: 'file:///a.dart'),
);
// r.success
```

Handle it (client):

```dart
client.window.onShowDocument(
  (params, context) async => const ShowDocumentResult(success: true),
);
```

---

## Work-done progress

Long-running work is reported in three steps: the server *creates* a progress
token, *streams* updates through `$/progress`, and the client may *cancel* it.

### `window/workDoneProgress/create` — Create Work-Done Progress

**server → client · request** (→ void)

When to use it: The server asks the client to set up a progress indicator,
naming a `ProgressToken`. Once it completes you may stream begin/report/end
payloads through `$/progress` using that same token.

Send it (server):

```dart
await server.client.window.workDoneProgressCreate(
  const WorkDoneProgressCreateParams(token: ProgressToken.string('p')),
);
// Then report progress under that token:
server.client.general.progress(
  const ProgressParams(
    token: ProgressToken.string('p'),
    value: LSPAny.string('begin'),
  ),
);
```

Handle it (client):

```dart
client.window.onWorkDoneProgressCreate((params, context) async {
  // params.token — prepare a progress UI for this token
});
```

See `$/progress` in [./lifecycle.md](./lifecycle.md) for the update payloads
that follow.

### `window/workDoneProgress/cancel` — Cancel Work-Done Progress

**client → server · notification**

When to use it: The user cancelled the progress UI. The client notifies the
server (by token) so it can stop the corresponding work. This one runs
client → server, so the handler lives on the server.

Handle it (server):

```dart
server.window.onWorkDoneProgressCancel((params, context) async {
  // params.token — stop the work for this token
});
```

Call it (client):

```dart
client.server.window.workDoneProgressCancel(
  const WorkDoneProgressCancelParams(token: ProgressToken.string('p')),
);
```

---

## Diagnostics & telemetry

### `textDocument/publishDiagnostics` — Publish Diagnostics

**server → client · notification**

When to use it: The push model for diagnostics. The server proactively sends
the full set of diagnostics for a document each time they change. (Contrast the
pull model via `workspace/diagnostic` and `textDocument/diagnostic`.) Replacing
the previous set for that `uri` is the client's job; send an empty list to
clear.

Send it (server):

```dart
server.client.textDocument.publishDiagnostics(
  const PublishDiagnosticsParams(uri: 'file:///a.dart', diagnostics: []),
);
```

Handle it (client):

```dart
client.textDocument.onPublishDiagnostics((params, context) async {
  // params.uri, params.diagnostics
});
```

### `telemetry/event` — Telemetry Event

**server → client · notification**

When to use it: The server emits an arbitrary telemetry payload (`LSPAny`) for
the client to log or forward. Opaque to the protocol; no reply.

Send it (server):

```dart
server.client.telemetry.event(
  const LSPAny.lSPObject({'e': LSPAny.string('x')}),
);
```

Handle it (client):

```dart
client.telemetry.onEvent((params, context) async {
  // params is LSPAny
});
```
