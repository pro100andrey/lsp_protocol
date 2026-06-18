<!-- markdownlint-disable-file MD004 -->
# Cancellation

LSP cancellation works **both ways**, and `pro_lsp` exposes it through one type,
`CancellationToken`. Incoming requests carry a token in their context; outgoing
requests accept a `token` and/or a `timeout`. On cancel, the framework speaks
`$/cancelRequest` for you and surfaces `requestCancelled`.

See also [Lifecycle & protocol](../methods/lifecycle.md) for `$/cancelRequest`
and [Error handling](./errors.md) for the `requestCancelled` code.

---

## Incoming requests

Every handler's `context` carries a `cancellationToken` that is cancelled when
the peer sends `$/cancelRequest` for that request. There are two ways to react.

### `throwIfCancelled()` at abort points

For loop-driven work, check the token at natural boundaries. When it fires, the
handler stops and the peer receives a standard `requestCancelled` error:

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

`throwIfCancelled()` throws `LspException.requestCancelled(...)`, which
propagates through the middleware chain and is converted to the JSON-RPC error
response automatically.

### `onCancelled` for async work

For work that does not poll — where you are blocked on a `Future` — listen to
the token's `onCancelled` broadcast stream and abort imperatively. This pattern
is taken from the package's e2e cancellation test:

```dart
server.textDocument.onHover((params, context) {
  final completer = Completer<Hover?>();
  context.cancellationToken.onCancelled.listen((_) {
    if (!completer.isCompleted) {
      completer.completeError(
        LspException.requestCancelled('cancelled by peer'),
      );
    }
  });
  return completer.future;
});
```

You can also race the cancellation against your work:

```dart
final cancelled = context.cancellationToken.onCancelled.first;
await Future.any([longRunningWork(), cancelled]);
```

`CancellationToken` also exposes `isCancelled` (a `bool` that latches `true`
after the first cancel) for one-off checks.

> Notification handlers are not cancelable. Their context carries the no-op
> token, so `throwIfCancelled()` does nothing and `onCancelled` never emits.

---

## Outgoing requests

Pass a `token` and/or a `timeout` to any request sender. On cancel or timeout,
`pro_lsp` sends `$/cancelRequest` with the request's wire id and your `Future`
completes with `LspException.requestCancelled`:

```dart
final token = CancellationToken();
cancelButton.onPressed = token.cancel;

final symbols = await client.server.workspace.symbol(
  WorkspaceSymbolParams(query: 'build'),
  token: token,
  timeout: const Duration(seconds: 10),
);
```

Cancelling the token mid-flight surfaces as a typed `LspException` whose `code`
is `requestCancelled` — exactly what the e2e test asserts:

```dart
final token = CancellationToken();
final pending = client.server.textDocument.hover(params, token: token);

token.cancel();

await expectLater(
  pending,
  throwsA(
    isA<LspException>().having(
      (e) => e.code,
      'code',
      LspErrorCodes.requestCancelled,
    ),
  ),
);
```

Notification senders take neither `token` nor `timeout` — there is no response
to cancel.

---

## Where to go next

* [Error handling](./errors.md) — `LspException` and `LspErrorCodes`.
* [Lifecycle & protocol](../methods/lifecycle.md) — `$/cancelRequest`.
* [Testing](./testing.md) — driving cancellation in tests.
