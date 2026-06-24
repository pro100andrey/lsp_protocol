# Changelog

## 0.3.0

* **Upgraded the generated bindings to LSP 3.18.** Models are now generated from
  the LSP 3.18 meta-model. Highlights:
  * **New requests** — dynamic text document content
    (`workspace/textDocumentContent` and `workspace/textDocumentContent/refresh`).
  * **New enumerations** — `LanguageKind` (typed language identifiers, including
    `d` and `pascal`), `TraceValue`, `CodeActionTag`, `ApplyKind`.
  * **New structures** — `SnippetTextEdit`, `WorkspaceEditMetadata`,
    `CodeActionKindDocumentation`, `CompletionItemApplyKinds`, the
    `TextDocumentContent*` family, structured `TextDocumentFilter*` /
    `NotebookDocumentFilter*` (relative-pattern support), and named
    `Client*`/`Server*` capability options promoted from inline literals
    (`ClientInfo`, `ServerInfo`, …).
  * **New properties** — `Command.tooltip`, `CompletionList.applyKind`,
    `CodeAction.tags`, `CodeLensClientCapabilities.resolveSupport`,
    `WorkspaceEditClientCapabilities.{metadataSupport,snippetEditSupport}`,
    `ApplyWorkspaceEditParams.metadata`,
    `DiagnosticClientCapabilities.markupMessageSupport`,
    `WorkspaceClientCapabilities.textDocumentContent`, and more.
* **Breaking (3.18 API shape changes consumers must adopt):**
  * `InitializeResult.serverInfo` / `InitializeParams.clientInfo` (and
    `LspClient.start(clientInfo:)`) now take the named `ServerInfo` / `ClientInfo`
    structures instead of anonymous records.
  * `TextDocumentItem.languageId` is now `LanguageKind` instead of `String`.
  * `Diagnostic.message` is now the `DiagnosticMessage` union (string or markup)
    to support `markupMessageSupport`.
  * `SignatureHelp.activeParameter` / `SignatureInformation.activeParameter` are
    now nullable.
  * Union accessors renamed where the underlying members became named structures
    (e.g. `TextDocumentContentChangeEvent` and `WorkspaceSymbolLocation`).
* **Breaking (middleware API): unified the request context.** `LspMiddleware`
  now receives the same `LspRequest` that handlers do, gaining `resolve<T>()` /
  `tryResolve<T>()`, `cancellationToken`, `connection`, and `isNotification`. The
  separate `LspIncomingRequest` type (passed to middleware since 0.1.0) is
  removed, and its `requestId` field is now `id`. Rewrite params by mutating
  `request.params` before calling `next()`; the request is sealed read-only once
  the handler runs. **Migration:** change
  `call(LspIncomingRequest request, LspNext next)` to
  `call(LspRequest request, LspNext next)`, `request.requestId` to `request.id`,
  and any params rewrite from constructing a new request object to mutating
  `request.params`.
* **Fuller `@since` history** — structures with a multi-version `sinceTags`
  history (e.g. `ServerInfo`, `ClientInfo`) now document every version
  (`@since 3.15.0` *and* `@since 3.18.0 …`) instead of only the latest.
* **Generator hygiene** — doc-comment formatting regexes are compiled once; an
  unrecognized LSP base type now warns instead of silently passing through;
  union nullability is derived from a single `containsNull` source of truth on
  the type IR; the client/server API generators share one configurable
  implementation; and union-shape analysis and property flattening are split
  into focused, unit-tested helpers.

## 0.2.1

* **Fixed: nullable-union request results crashed on a `null` response.** Typed
  senders for results whose union includes `null` (e.g. `textDocument/definition`,
  `completion`, `implementation`, `typeDefinition`, `declaration`,
  `documentSymbol`, `inlineCompletion`, `semanticTokens/full/delta`,
  `workspace/symbol`) cast the raw payload as non-null `Object` before
  `fromJson`. When the server legitimately returned `null` (e.g. nothing
  resolves under the cursor) this threw `type 'Null' is not a subtype of type
  'Object'`. The code generator now casts `raw as Object?` for unions whose
  representation is nullable, so a `null` response decodes to the union's null
  variant. Non-nullable union results (`textDocument/diagnostic`,
  `prepareRename`) are unchanged. Generated code only — no API change.

## 0.2.0

* **Fixed (behavior change): `LspClient` now receives server→client messages.**
  Previously the connection's lifecycle state advanced only on an *incoming*
  `initialize` request (the server role). A client drives the handshake by
  *sending* `initialize`, so its state stayed `uninitialized` and every incoming
  server→client message (`textDocument/publishDiagnostics`, `window/*`,
  `$/progress`, `workspace/configuration`, `window/showMessageRequest`,
  `client/registerCapability`, …) was rejected by the state machine and silently
  dropped — handlers were never invoked. `LspClient.start()` now advances its own
  state after the handshake, so these handlers fire as expected. If you relied on
  the previous (broken) behavior of these notifications never arriving, this is a
  behavior change.
* **Added:** `LspConnection.markInitialized()` — marks a connection
  `initialized` from the *client* side (the state machine only auto-advances on
  an incoming `initialize`, which a client never receives). Called automatically
  by `LspClient.start()`; exposed for callers that drive the handshake manually
  via the low-level `listen()`.
* **Added:** `LspClient.telemetry` namespace getter
  (`ClientTelemetryHandlers`), completing the set of incoming server→client
  handler namespaces on the client. Previously `telemetry/event` could only be
  handled by reaching into `connection` directly.
* Documentation restructured: `README.md` is now a concise overview (pitch,
  quick start, install) that links into a new [`doc/`](doc/README.md) tree —
  task-oriented guides plus a per-method reference covering every LSP request
  and notification with "what / when / example". Examples are distilled from the
  package's end-to-end tests, so they track the current API.
* Generated model files that contain LSP-mandated `@Deprecated` members again
  carry `ignore_for_file: remove_deprecations_in_breaking_versions`. The 0.1.2
  removal was premature — that lint only fires on a breaking version bump, which
  this release is; the deprecations come from the LSP meta-model and cannot be
  dropped. The generator now emits the ignore only for the model files that
  actually contain a deprecated member. Generated code only; no API change.

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
* **Breaking:** `LspClient.start` no longer takes an untyped `clientInfo`
  `Map`. Pass a typed `clientInfo: (name: ..., version: ...)` record and the
  new `processId` argument separately (previously `processId` was smuggled
  inside the map). This removes a runtime cast that could throw on a malformed
  map.
* Custom (non-spec) protocol methods are now supported via
  `LspConnection.registerCustomRequestHandler` /
  `registerCustomNotificationHandler` and `sendCustomRequest` /
  `sendCustomNotification`. The typed enum-based handlers remain the
  recommended path for spec methods.
* Feature-disposal errors with no `onError` configured are now written to
  `stderr` instead of `stdout` — printing to `stdout` corrupts the JSON-RPC
  stream on the stdio transport.
* Documentation fixes: corrected the `onError` description (errors are not
  logged to stdout), the `LspFeature` example (removed a non-compiling
  custom-method snippet), and clarified that `LspClient.start` and `listen`
  are mutually exclusive entry points.

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
