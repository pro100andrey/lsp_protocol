<!-- markdownlint-disable-file MD004 -->
# Error handling

Errors flow through a single type — `LspException` — in **both** directions. You
throw one from a handler to send a structured JSON-RPC error to the peer, and
any error response you receive is re-thrown to you as an `LspException`. You
never touch the transport's `RpcException`.

See also [Lifecycle & protocol](../methods/lifecycle.md) for the lifecycle-level
errors (`serverNotInitialized`) that the framework raises for you.

---

## Throwing from a handler

Throw an `LspException` inside any request handler to send a structured error
response back. Named factories cover the standard codes:

```dart
server.textDocument.onHover((params, context) async {
  final doc = documents[params.textDocument.uri];
  if (doc == null) {
    throw LspException.invalidParams(
      'Unknown document: ${params.textDocument.uri}',
    );
  }
  return computeHover(doc, params.position);
});
```

The available factories mirror the standard codes:

| Factory | Code | When |
| ------- | ---- | ---- |
| `LspException.parseError(...)` | `-32700` | Invalid JSON was received |
| `LspException.invalidRequest(...)` | `-32600` | Not a valid request object |
| `LspException.methodNotFound(...)` | `-32601` | Unknown / unavailable method |
| `LspException.invalidParams(...)` | `-32602` | Bad method parameters |
| `LspException.internalError(...)` | `-32603` | Unexpected internal failure |
| `LspException.serverNotInitialized(...)` | `-32002` | Request before handshake |
| `LspException.requestCancelled(...)` | `-32800` | Operation was cancelled |
| `LspException.contentModified(...)` | `-32801` | Result no longer valid |

Each factory also accepts an optional structured `data` payload:

```dart
throw LspException.invalidParams('bad range', {'line': params.position.line});
```

The raw constructor is available when you need a non-standard code:

```dart
throw const LspException(-32000, 'server busy');
```

> Request-handler errors are always returned to the peer as JSON-RPC errors.
> Notification-handler errors are routed to `server.onError` (unset by default,
> so they are silently swallowed) — set `server.onError` to surface them.

---

## Catching peer errors

When you call the other side, any error response is re-thrown as an
`LspException` carrying the JSON-RPC `code`, `message`, and `data`:

```dart
try {
  final result = await client.server.general.initialize(initParams);
} on LspException catch (e) {
  print('initialize failed (${e.code}): ${e.message}');
  // Some requests attach a structured payload in `e.data` (e.g. initialize may
  // return an InitializeError); deserialize it with that model's `fromJson`.
}
```

This is the same exception type on both ends — a server handler that throws
`LspException.invalidParams('bad position')` surfaces on the client as an
`LspException` whose `code` is `LspErrorCodes.invalidParams`:

```dart
await expectLater(
  client.server.textDocument.hover(params),
  throwsA(
    isA<LspException>().having(
      (e) => e.code,
      'code',
      LspErrorCodes.invalidParams,
    ),
  ),
);
```

---

## `LspErrorCodes`

`LspErrorCodes` enumerates every standard code as a named constant, so you can
branch on `e.code` without magic numbers:

```dart
try {
  await client.server.workspace.symbol(params);
} on LspException catch (e) {
  switch (e.code) {
    case LspErrorCodes.requestCancelled:
      // The request was cancelled — ignore.
      break;
    case LspErrorCodes.contentModified:
      // Document changed under us — retry with fresh state.
      retry();
    default:
      rethrow;
  }
}
```

The constants include `parseError`, `invalidRequest`, `methodNotFound`,
`invalidParams`, `internalError`, `serverNotInitialized`, `unknownErrorCode`,
`requestCancelled`, `contentModified`, and the reserved-range bounds
(`lspReservedErrorRangeStart` / `lspReservedErrorRangeEnd`).

---

## Where to go next

* [Cancellation](./cancellation.md) — `requestCancelled` in context.
* [Lifecycle & protocol](../methods/lifecycle.md) — the enforced state machine.
* [Working with models](./models.md) — deserializing `e.data`.
