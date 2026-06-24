# ADR-0001 — The request context is a single mutable handle, not a freezed value object

- **Status:** Accepted
- **Date:** 2026-06-24
- **Scope:** `packages/pro_lsp` runtime — `LspRequest`, `LspMiddleware`, `LspConnection` dispatch

## Context

Incoming LSP messages were modelled by **two** types:

- `LspRequest` (`server/lsp_request.dart`) — the context handed to every **handler**: carries `method`, `id`, `cancellationToken`, `connection`, and `resolve<T>()`/`tryResolve<T>()`. No `params`.
- `LspIncomingRequest` (`server/middleware.dart`) — the context handed to every **middleware**: carries `method`, `params`, `requestId`. No `cancellationToken`, no `connection`, no service resolution.

This fragmented one concept — "an incoming request" — across two modules. Middleware were second-class: they could not resolve registered services or observe cancellation, so cross-cutting middleware (auth against a registered service, cancellation-aware timing) had to side-channel an `LspConnection` reference through their constructor, leaking the connection across the very seam it was meant to hide. The wire id was even named twice (`id` vs `requestId`).

Crucially, the dispatcher already constructs the full `LspRequest` *before* the middleware chain runs, and only then built a separate, narrower `LspIncomingRequest` — so the richer context was already in hand at the point middleware are invoked.

A natural suggestion is to model the unified context as a **freezed value object**, matching the rest of `lib/src/generated/models/`, which is uniformly freezed.

## Decision

1. **Unify to one type.** `LspMiddleware` and handlers both receive the same `LspRequest`. `LspIncomingRequest` is removed. `LspNext` becomes `Future<Object?> Function(LspRequest)`. The wire id field is named `id` everywhere.

2. **`LspRequest` is a mutable handle, NOT a freezed/immutable value object.** Exactly one field — `params` — is mutable; everything else (`method`, `id`, `cancellationToken`, `connection`) is `final`. Middleware rewrite the request by mutating `request.params` before calling `next()`.

3. **Constraints on the mutable field:**
   - **Seal:** the dispatcher calls `@internal LspRequest.seal()` at the point of entry into the handler, in **all four** dispatch paths (request/notification × with/without middleware). After sealing, writing `params` throws `StateError`. params is a middleware-chain rewrite hook, not a handler/return-path scratchpad.
   - **Type guard:** the `params` setter `assert`s the value is `Map`, `List`, or `null` (the JSON-RPC wire shape), mirroring the existing check in `_recordRequestId`.

### Why not freezed

`freezed` was deliberately rejected for `LspRequest`, even though it is the house style for generated wire DTOs:

- **It is not a value object.** It holds live, identity-bearing members — a stateful `LspConnection` and a mutable `CancellationToken`. freezed's generated structural `==`/`hashCode` over those fields is meaningless (and would attempt to compare connections/tokens).
- **It is mostly behaviour.** `resolve<T>()`, `tryResolve<T>()`, `isNotification` — a freezed data class is the wrong shape for a type that is 3/5 methods.
- **freezed forces full immutability**, which would push us to immutable + `copyWith`. We want exactly one mutable field (`params`); `final` on everything else is the contract, encoded in the type, that *only* `params` is rewritable — `method`/`id` already chose the route before middleware run, and rewriting `connection`/`cancellationToken` is nonsensical.
- **It would introduce build_runner codegen into the hitherto codegen-free hand-written runtime layer**, for a single small class whose only freezed draws (`copyWith`, `toString`) are cheap to hand-write or unneeded. `freezed` in this repo is reserved for generated wire models.

## Consequences

- **Leverage:** middleware gain `resolve<T>()`/`tryResolve<T>()`, `cancellationToken`, `connection`, and `isNotification` — the same surface handlers have. Auth/timing/cache middleware become first-class without constructor wiring.
- **Locality:** one module answers "what does code know about an incoming request?" instead of two that silently differ by role.
- **Testability cost (accepted):** `composeMiddlewares` was previously unit-testable in isolation because `LspIncomingRequest` had no dependencies. The unified `LspRequest` requires a `connection`, so isolated composition tests now build one via the existing `test/support/connection_harness.dart`. Considered acceptable: middleware that resolve services are more honestly tested with services registered.
- **No deprecation needed:** `0.3.0` was unreleased when this landed, so `LspIncomingRequest` never shipped — clean break, no version bump, no CHANGELOG breaking-note.
- **Convention divergence (intentional):** `LspRequest` is plain-Dart and mutable while `models/` is freezed. This ADR exists so future architecture reviews do not re-suggest making it a freezed value object.
