# Spec docs & sync map

Where this repo's specifications live, and which spec a given kind of change updates.
The `writing-specs` skill reads this — keep it current as the docs evolve.

## Specs

The `pro_lsp` package carries the project's living specification as a documentation
tree under `packages/pro_lsp/doc/`. Two halves:

**Guides** (`packages/pro_lsp/doc/guides/`) — conceptual and task-oriented walkthroughs:

- `packages/pro_lsp/doc/getting-started.md` — install, first server, connect a client
- `packages/pro_lsp/doc/concepts.md` — mental model: handlers vs. senders, `LspRequest`, lifecycle state machine
- `packages/pro_lsp/doc/guides/server.md` — registering handlers, declaring capabilities, pushing to the client, lifecycle, logging
- `packages/pro_lsp/doc/guides/client.md` — the handshake, calling the server, handling server→client messages
- `packages/pro_lsp/doc/guides/models.md` — Freezed structures, `extension type` unions, open/closed enums
- `packages/pro_lsp/doc/guides/errors.md` — `LspException`, throwing from handlers, `LspErrorCodes`
- `packages/pro_lsp/doc/guides/cancellation.md` — incoming `CancellationToken`, outgoing `token` / `timeout`
- `packages/pro_lsp/doc/guides/testing.md` — wiring a client and server together in memory
- `packages/pro_lsp/doc/guides/transports.md` — stdio, TCP sockets, custom byte streams
- `packages/pro_lsp/doc/guides/advanced.md` — pluggable `LspFeature`s, dependency injection, middleware

**Method reference** (`packages/pro_lsp/doc/methods/`) — per-message catalog, grouped by area:

- `packages/pro_lsp/doc/methods/README.md` — A–Z index of all methods (keep counts/links in sync)
- `packages/pro_lsp/doc/methods/lifecycle.md` — `initialize`, `initialized`, `shutdown`, `exit`, `$/setTrace`, `$/logTrace`, `$/progress`, `$/cancelRequest`
- `packages/pro_lsp/doc/methods/text-document-sync.md` — `didOpen`, `didChange`, `didClose`, `didSave`, `willSave`, `willSaveWaitUntil`
- `packages/pro_lsp/doc/methods/language-features.md` — hover, definition, references, completion, code action, formatting, rename, semantic tokens, … (and their `*/resolve` methods)
- `packages/pro_lsp/doc/methods/hierarchies.md` — call & type hierarchy (`prepareCallHierarchy`, `incomingCalls`, `supertypes`, …)
- `packages/pro_lsp/doc/methods/workspace.md` — workspace symbol, `executeCommand`, pull diagnostics, file operations, configuration, file watching, folders, refresh
- `packages/pro_lsp/doc/methods/window.md` — `showMessage`, `logMessage`, `showMessageRequest`, `showDocument`, work-done progress
- `packages/pro_lsp/doc/methods/notebooks.md` — notebook `didOpen` / `didChange` / `didSave` / `didClose`

**House style:** mirror the existing docs.

- Each method entry has a fixed shape: a **direction & type** line (`client → server · request`,
  `server → client · notification`, …), a one-or-two-sentence **When to use it**, and an **example**
  with `Handle it` (register a handler) and `Call it` / `Send it` (invoke it) as compiling Dart.
- Examples are distilled from the package's own end-to-end tests (`packages/pro_lsp/test/e2e_*.dart`),
  so they compile against the current API — update the example when the API shifts, don't invent calls.
- Dot-shorthand (`.markdown`, `.bool(true)`) is used where the target type is inferable; the full form
  always works.
- The generated LSP models (structures, unions, enums) come from `lsp_generator` reading
  `metaModel.json` — model *generation* is not hand-edited; `guides/models.md` documents how to *use* them.

## Change → doc map

Which spec doc must follow a given kind of behaviour change. Used by the
`writing-specs` sync branch. An unmapped change is a signal to add a row — or that
the change needs no spec.

| Change in code | Update |
| --- | --- |
| New / changed LSP method handler or sender (the wire surface) | the matching `methods/<area>.md` entry, plus the index in `methods/README.md` |
| New transport or change to stdio/TCP/custom byte-stream behaviour | `guides/transports.md` |
| Error codes, `LspException`, or throw-from-handler behaviour | `guides/errors.md` |
| Cancellation / `timeout` / `CancellationToken` semantics | `guides/cancellation.md` |
| Server-side: handler registration, capability declaration, lifecycle, logging | `guides/server.md` (and `concepts.md` if the mental model shifts) |
| Client-side: handshake, calling the server, server→client handling | `guides/client.md` |
| Model representation (Freezed structures, `extension type` unions, enums) | `guides/models.md` |
| Pluggable `LspFeature`s, dependency injection, middleware | `guides/advanced.md` |
| In-memory test harness / client+server wiring helpers | `guides/testing.md` |
| New user-facing onboarding step or first-run flow | `getting-started.md` |

**Behaviour-preserving refactors update nothing** — they are no-ops for the spec.
Regenerating models from a new `metaModel.json` updates the generated code, not these
docs, unless the public usage shape changes.
