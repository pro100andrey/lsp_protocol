<!-- markdownlint-disable-file MD004 -->
# Advanced

Three extension points let you structure larger servers: **pluggable features**
to split handlers into modules, **dependency injection** to share services, and
**middleware** to wrap every request and notification.

See also [Building a server](./server.md) for the core handler/sender API and
[Error handling](./errors.md) for how middleware short-circuiting surfaces.

---

## Pluggable features

Split a large server into cohesive modules by extending `LspFeature`. The server
manages each feature's register/dispose lifecycle, so a feature is a self-
contained bundle of handlers plus its own setup and teardown:

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

`register` runs immediately, wiring the feature's handlers into the server.
`dispose` runs when the server shuts down — errors thrown there are routed to
`server.onError`.

---

## Dependency injection

The server has a built-in service container. Register shared services at startup
with `server.register(...)`, then resolve them from any handler context with
`context.resolve<T>()`:

```dart
server.register(AnalysisEngine(config));

server.textDocument.onCompletion((params, context) async {
  final engine = context.resolve<AnalysisEngine>();
  return CompletionList(items: await engine.complete(params));
});
```

This keeps handlers free of global state and makes services easy to swap in
tests — register a fake before `listen()` and every handler resolves it.

---

## Middleware

Middleware wraps **every** request and notification — for logging, timing, auth,
or error capture. Middleware run in the order they are added; each calls `next`
to pass control down the chain to the target handler.

### Class-based

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

`LspIncomingRequest` gives you the `method` name, the raw `params`, and the
`requestId` (`null` for notifications).

### Function-based

For quick middleware, build one from a function with
`LspMiddleware.fromFunction`:

```dart
server.addMiddleware(LspMiddleware.fromFunction((request, next) async {
  stderr.writeln('[lsp] ${request.method}');
  return next(request);
}));
```

### Short-circuiting

To skip the target handler, return a value **without** calling `next` — useful
for caching. Throwing an `LspException` short-circuits the chain with an error
response, so middleware is a natural place for cross-cutting validation or auth:

```dart
server.addMiddleware(LspMiddleware.fromFunction((request, next) async {
  if (!isAuthorized(request)) {
    throw LspException.invalidRequest('unauthorized: ${request.method}');
  }
  return next(request);
}));
```

---

## Where to go next

* [Building a server](./server.md) — the handler/sender surface.
* [Error handling](./errors.md) — `LspException` and short-circuiting.
* [Dependency injection](#dependency-injection) — sharing services with features.
