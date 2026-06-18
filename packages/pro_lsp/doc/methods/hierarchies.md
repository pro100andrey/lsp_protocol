<!-- markdownlint-disable-file MD004 -->
# Hierarchies

Call and type hierarchies use a **two-step** protocol. First a `prepare` request
turns a cursor position into one or more hierarchy *items*
(`CallHierarchyItem` / `TypeHierarchyItem`) — the anchors the UI hangs off of.
Then the client sends follow-up requests, passing an item back in, to walk the
graph one level at a time: incoming/outgoing calls, or super/subtypes. Each step
is lazy, so the editor only expands the branches the user actually opens.

The `prepare` requests live under `textDocument`
(`client.server.textDocument.prepareCallHierarchy`, …). The walk requests live on
their own proxy namespaces: `client.server.callHierarchy.*` and
`client.server.typeHierarchy.*` (server handlers:
`server.callHierarchy.on*`, `server.typeHierarchy.on*`).

Both hierarchies are opt-in via `ServerCapabilities`
(`callHierarchyProvider`, `typeHierarchyProvider`). See also
[language features](./language-features.md) for position-based navigation and
[workspace](./workspace.md) for workspace-wide requests. Examples below are
taken from `test/e2e_workspace_test.dart` and `test/e2e_textdocument_test.dart`.

---

## Call hierarchy

### `textDocument/prepareCallHierarchy` — Prepare Call Hierarchy

**client → server · request**

When to use it: step one of the call hierarchy. Resolve the symbol under the
cursor into `CallHierarchyItem`s to anchor the incoming/outgoing-calls walk.
Returns a nullable `List<CallHierarchyItem>`.

Handle it (server):

```dart
server.textDocument.onPrepareCallHierarchy(
  (params, context) async => const [
    CallHierarchyItem(
      name: 'f',
      kind: SymbolKind.function,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ],
);
```

Call it (client):

```dart
final items = await client.server.textDocument.prepareCallHierarchy(
  const CallHierarchyPrepareParams(textDocument: doc, position: position),
);
final name = items!.single.name;
```

### `callHierarchy/incomingCalls` — Incoming Calls

**client → server · request**

When to use it: step two — given a prepared item, list the callers (who calls
this). Each `CallHierarchyIncomingCall` has a `from` item and `fromRanges`
marking the call sites. Lives on the `callHierarchy` proxy.

Handle it (server):

```dart
server.callHierarchy.onIncomingCalls(
  (params, context) async => const [
    CallHierarchyIncomingCall(
      from: CallHierarchyItem(
        name: 'f',
        kind: SymbolKind.function,
        uri: 'file:///a.dart',
        range: range,
        selectionRange: range,
      ),
      fromRanges: [range],
    ),
  ],
);
```

Call it (client):

```dart
final calls = await client.server.callHierarchy.incomingCalls(
  const CallHierarchyIncomingCallsParams(
    item: CallHierarchyItem(
      name: 'f',
      kind: SymbolKind.function,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ),
);
final caller = calls![0].from.name;
```

### `callHierarchy/outgoingCalls` — Outgoing Calls

**client → server · request**

When to use it: step two in the other direction — given a prepared item, list
the callees (what this calls). Each `CallHierarchyOutgoingCall` has a `to` item
and `fromRanges`. Lives on the `callHierarchy` proxy.

Handle it (server):

```dart
server.callHierarchy.onOutgoingCalls(
  (params, context) async => const [
    CallHierarchyOutgoingCall(
      to: CallHierarchyItem(
        name: 'g',
        kind: SymbolKind.function,
        uri: 'file:///a.dart',
        range: range,
        selectionRange: range,
      ),
      fromRanges: [range],
    ),
  ],
);
```

Call it (client):

```dart
final calls = await client.server.callHierarchy.outgoingCalls(
  const CallHierarchyOutgoingCallsParams(
    item: CallHierarchyItem(
      name: 'g',
      kind: SymbolKind.function,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ),
);
final callee = calls![0].to.name;
```

---

## Type hierarchy

### `textDocument/prepareTypeHierarchy` — Prepare Type Hierarchy

**client → server · request**

When to use it: step one of the type hierarchy. Resolve the type under the
cursor into `TypeHierarchyItem`s to anchor the super/subtypes walk. Returns a
nullable `List<TypeHierarchyItem>`.

Handle it (server):

```dart
server.textDocument.onPrepareTypeHierarchy(
  (params, context) async => const [
    TypeHierarchyItem(
      name: 'C',
      kind: SymbolKind.class$,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ],
);
```

Call it (client):

```dart
final items = await client.server.textDocument.prepareTypeHierarchy(
  const TypeHierarchyPrepareParams(textDocument: doc, position: position),
);
final name = items!.single.name;
```

### `typeHierarchy/supertypes` — Supertypes

**client → server · request**

When to use it: step two — given a prepared item, list its supertypes (base
classes / implemented interfaces). Returns a nullable `List<TypeHierarchyItem>`.
Lives on the `typeHierarchy` proxy.

Handle it (server):

```dart
server.typeHierarchy.onSupertypes(
  (params, context) async => const [
    TypeHierarchyItem(
      name: 'C',
      kind: SymbolKind.class$,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ],
);
```

Call it (client):

```dart
final supertypes = await client.server.typeHierarchy.supertypes(
  const TypeHierarchySupertypesParams(
    item: TypeHierarchyItem(
      name: 'C',
      kind: SymbolKind.class$,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ),
);
final name = supertypes![0].name;
```

### `typeHierarchy/subtypes` — Subtypes

**client → server · request**

When to use it: step two in the other direction — given a prepared item, list
its subtypes (derived classes / implementors). Returns a nullable
`List<TypeHierarchyItem>`. Lives on the `typeHierarchy` proxy.

Handle it (server):

```dart
server.typeHierarchy.onSubtypes(
  (params, context) async => const [
    TypeHierarchyItem(
      name: 'D',
      kind: SymbolKind.class$,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ],
);
```

Call it (client):

```dart
final subtypes = await client.server.typeHierarchy.subtypes(
  const TypeHierarchySubtypesParams(
    item: TypeHierarchyItem(
      name: 'D',
      kind: SymbolKind.class$,
      uri: 'file:///a.dart',
      range: range,
      selectionRange: range,
    ),
  ),
);
final name = subtypes![0].name;
```
