# Changelog

## 0.1.2

* `LspServer` now provides spec-compliant default `shutdown` and `exit`
  handlers when you don't register your own — `shutdown` succeeds and `exit`
  closes the connection. Register `general.onShutdown` / `general.onExit`
  before `listen()` to override.
* Rewrote the README around a task-oriented structure (Quick start, Core
  concepts, Building a server/client, Testing, Models, Errors, Cancellation)
  and fixed several non-compiling examples (`Hover`/union construction,
  `completionProvider`, custom transports).
* Outgoing requests can now be cancelled and time-bounded: every request sender
  (e.g. `client.server.textDocument.definition(...)`) accepts optional `token`
  (`CancellationToken`) and `timeout` (`Duration`) arguments. On cancel/timeout
  a `$/cancelRequest` notification is sent to the peer automatically.
* Peer error responses are now surfaced as a typed `LspException` (carrying the
  JSON-RPC `code`, `message`, and `data`) instead of the transport's
  `RpcException`.
* **Breaking (low-level):** `LspConnection.sendRequest`'s `params` argument is
  now a required positional parameter, and the method gained named `token` /
  `timeout` parameters. The generated typed senders are the recommended API and
  are unaffected.
* Removed a stale `ignore_for_file: remove_deprecations_in_breaking_versions`
  from the generated model files (it suppressed a lint that never fired).
  Generated code only; no API or behavior change.

## 0.1.1

Update README.md

## 0.1.0

* Initial release of `pro_lsp`.
* Complete LSP 3.17 specification bindings generated from the Microsoft LSP meta-model.
* Pluggable feature modularization architecture (`LspFeature`) with automated register and dispose lifecycles.
* Symmetrical client/server API with namespace-grouped handlers (`general`, `textDocument`, `workspace`, `window`, etc.).
* Connection lifecycle state machine tracking to enforce protocol-compliance.
* Custom middleware support (`LspMiddleware`) for request/notification interception.
* Built-in service container (dependency injection) registry inside connection contexts.
* Stream framing transport implementation (`LspByteStreamChannel`) supporting stdio, TCP sockets, and custom streams.
