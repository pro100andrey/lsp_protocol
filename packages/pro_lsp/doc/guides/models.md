<!-- markdownlint-disable-file MD004 -->
# Working with models

Every LSP structure in `pro_lsp` is generated from the official Microsoft
meta-model, so you never hand-write JSON. The generated types come in three
shapes: **Freezed structures**, **`extension type` unions**, and **enums**
(closed and open). This guide shows how to construct, inspect, and serialize
each.

See also [Core concepts](../concepts.md) for the handler/sender mental model and
[Language features](../methods/language-features.md) for the result types of
specific requests.

---

## Freezed structures

All structures are [Freezed](https://pub.dev/packages/freezed) classes. You get
value equality, JSON serialization (`fromJson` / `toJson`), and non-destructive
`copyWith` for free:

```dart
const caps = ServerCapabilities(hoverProvider: .bool(true));

// Value equality — two structurally equal instances compare equal.
assert(caps == const ServerCapabilities(hoverProvider: .bool(true)));

// Non-destructive copy.
final updated = caps.copyWith(
  textDocumentSync: .textDocumentSyncOptions(
    const TextDocumentSyncOptions(openClose: true, change: .full),
  ),
);

// JSON round-trip.
final json = updated.toJson();
final back = ServerCapabilities.fromJson(json);
assert(back == updated);
```

`fromJson` / `toJson` matter when you receive a result typed as raw JSON. For
example, `textDocument/codeAction` returns `List<Object?>` on the wire, so you
re-hydrate each element yourself:

```dart
final raw = await client.server.textDocument.codeAction(params);
final action = CodeAction.fromJson(raw![0] as Map<String, dynamic>);
```

---

## Unions

LSP `A | B` types are modeled as zero-cost `extension type`s over the underlying
value. Each union exposes:

* **Named factories** to construct it (`.location(...)`, `.locationList(...)`).
* **`isX` getters** — boolean checks for the active variant.
* **`asX` getters** — typed accessors that are **nullable** (`null` when the
  union does not hold that variant).

`Definition`, for instance, is `Location | Location[]`:

```dart
// Construct.
final d = Definition.location(myLocation);
// or: Definition.locationList([loc1, loc2]);

// Inspect — `asX` getters return null for the wrong variant.
if (d.isLocation) {
  use(d.asLocation!);        // Location?
} else if (d.isLocationList) {
  useAll(d.asLocationList!); // List<Location>?
}
```

> **`asX` getters are nullable.** They return `null` both when the union is not
> the requested variant *and* when the underlying value is absent. Once you have
> confirmed the variant (via `isX` or because you know the shape), `!` is safe.

### Unpacking nested unions

Results are frequently unions wrapping unions, so you chain `asX!` to drill down.
These examples are taken verbatim from the package's e2e tests, so they compile:

```dart
// textDocument/hover — Hover.contents is HoverContents (a union).
final hover = await client.server.textDocument.hover(params);
expect(hover!.contents.asMarkupContent!.value, '**doc**');

// textDocument/definition — DefinitionResult wraps Definition wraps Location.
final result = await client.server.textDocument.definition(params);
expect(result.isDefinition, isTrue);
expect(result.asDefinition!.asLocation!.uri, 'file:///b.dart');

// Other location-shaped features unwrap the same way.
final impl = await client.server.textDocument.implementation(params);
expect(impl.asDefinition!.asLocation!.uri, 'file:///b.dart');

// Semantic tokens delta is a union of full tokens or a delta.
final delta = await client.server.textDocument.semanticTokensFullDelta(params);
expect(delta.asSemanticTokens!.data, [0, 0, 3, 1, 0]);
```

Construct the matching results on the server side with the same factories:

```dart
server.textDocument.onDefinition(
  (params, context) async => DefinitionResult.definition(
    Definition.location(target),
  ),
);
```

---

## Enums

Generated enums come in two flavors, matching how the spec defines them.

### Closed enums

Fixed value sets are real Dart `enum`s. Each carries its wire `value` and a
null-returning `decode`:

```dart
const kind = MarkupKind.markdown;              // wire value: 'markdown'
final parsed = MarkupKind.decode('plaintext'); // MarkupKind? — null if unknown
```

Because they are real enums you can `switch` over them exhaustively. Other
closed enums you will meet often: `MessageType`, `SymbolKind`,
`DocumentHighlightKind`, `CompletionItemKind`.

### Open enums

Where the spec allows custom values, the type is an `extension type` over the
primitive. It exposes the known members as constants while still accepting
arbitrary values:

```dart
const known = SemanticTokenTypes.function;
const custom = SemanticTokenTypes('myCustomType'); // also valid
```

Treat the constants as a convenience for the standard set; never assume a value
received over the wire is one of them.

---

## Where to go next

* [Error handling](./errors.md) — `LspException` and the standard codes.
* [Building a server](./server.md) — returning these models from handlers.
* [Language features](../methods/language-features.md) — the result type for
  every request.
