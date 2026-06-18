<!-- markdownlint-disable-file MD004 -->
# LSP method reference

A per-method catalog of the LSP surface exposed by `pro_lsp`. Each method is
documented with a fixed shape:

- **direction & type** — who sends it and whether it's a request or a
  notification (`client → server · request`, `server → client · notification`,
  and so on).
- **When to use it** — one or two sentences on purpose and timing.
- **example** — `Handle it` (register a handler) and `Call it` / `Send it`
  (invoke it), as compiling Dart. Notifications return `void` (no `await`);
  for `server → client` methods the sides swap (`Send it (server)` via
  `server.client.*`, `Handle it (client)` via `client.<ns>.on*`).

Resolve methods (`completionItem/resolve`, `codeAction/resolve`, …) are
documented next to the feature they complete, in
[./language-features.md](./language-features.md).

The catalog below lists all 89 methods grouped by area. Files marked as written
elsewhere (`language-features.md`, `hierarchies.md`, `workspace.md`,
`window.md`) are linked at the file level.

## A–Z index

For an alphabetical sweep, the per-area tables below are sorted within each
group; the wire name is the canonical identifier (e.g. `textDocument/hover`).

## Lifecycle

→ [./lifecycle.md](./lifecycle.md)

| Method | Purpose |
| --- | --- |
| [`initialize`](./lifecycle.md#initialize--initialize) | Open the session and exchange capabilities |
| [`initialized`](./lifecycle.md#initialized--initialized) | Acknowledge the handshake is complete |
| [`shutdown`](./lifecycle.md#shutdown--shutdown) | Ask the server to release resources but stay alive |
| [`exit`](./lifecycle.md#exit--exit) | Terminate the server process |
| [`$/setTrace`](./lifecycle.md#settrace--set-trace) | Client sets the server's trace verbosity |
| [`$/logTrace`](./lifecycle.md#logtrace--log-trace) | Server emits a trace line |
| [`$/progress`](./lifecycle.md#progress--progress) | Work-done / partial-result progress (both directions) |
| [`$/cancelRequest`](./lifecycle.md#cancelrequest--cancel-request) | Cancel an in-flight request (handled by the framework) |

## Document sync

→ [./text-document-sync.md](./text-document-sync.md)

| Method | Purpose |
| --- | --- |
| [`textDocument/didOpen`](./text-document-sync.md#textdocumentdidopen--did-open) | Editor opened a document |
| [`textDocument/didChange`](./text-document-sync.md#textdocumentdidchange--did-change) | Document content changed |
| [`textDocument/didClose`](./text-document-sync.md#textdocumentdidclose--did-close) | Editor closed a document |
| [`textDocument/didSave`](./text-document-sync.md#textdocumentdidsave--did-save) | Document was saved to disk |
| [`textDocument/willSave`](./text-document-sync.md#textdocumentwillsave--will-save) | Editor is about to save (fire-and-forget) |
| [`textDocument/willSaveWaitUntil`](./text-document-sync.md#textdocumentwillsavewaituntil--will-save-wait-until) | Return edits to apply before the save lands |

## Notebooks

→ [./notebooks.md](./notebooks.md)

| Method | Purpose |
| --- | --- |
| [`notebookDocument/didOpen`](./notebooks.md#notebookdocumentdidopen--did-open) | Notebook opened (notebook + cell documents) |
| [`notebookDocument/didChange`](./notebooks.md#notebookdocumentdidchange--did-change) | Notebook cells / metadata changed |
| [`notebookDocument/didSave`](./notebooks.md#notebookdocumentdidsave--did-save) | Notebook saved to disk |
| [`notebookDocument/didClose`](./notebooks.md#notebookdocumentdidclose--did-close) | Notebook closed |

## Language features

→ [./language-features.md](./language-features.md)

| Method | Purpose |
| --- | --- |
| [`textDocument/hover`](./language-features.md) | Hover documentation at a position |
| [`textDocument/completion`](./language-features.md) | Completion proposals at a position |
| [`completionItem/resolve`](./language-features.md) | Fill in a completion item lazily (resolve) |
| [`textDocument/signatureHelp`](./language-features.md) | Signature help for the call at a position |
| [`textDocument/definition`](./language-features.md) | Jump to definition |
| [`textDocument/declaration`](./language-features.md) | Jump to declaration |
| [`textDocument/typeDefinition`](./language-features.md) | Jump to type definition |
| [`textDocument/implementation`](./language-features.md) | Jump to implementation |
| [`textDocument/references`](./language-features.md) | Find all references |
| [`textDocument/documentHighlight`](./language-features.md) | Highlight occurrences in a document |
| [`textDocument/documentSymbol`](./language-features.md) | Symbol outline for a document |
| [`textDocument/codeAction`](./language-features.md) | Quick fixes / refactorings at a range |
| [`codeAction/resolve`](./language-features.md) | Fill in a code action lazily (resolve) |
| [`textDocument/codeLens`](./language-features.md) | Code lenses for a document |
| [`codeLens/resolve`](./language-features.md) | Fill in a code lens lazily (resolve) |
| [`textDocument/documentLink`](./language-features.md) | Clickable links in a document |
| [`documentLink/resolve`](./language-features.md) | Fill in a document link lazily (resolve) |
| [`textDocument/formatting`](./language-features.md) | Format a whole document |
| [`textDocument/rangeFormatting`](./language-features.md) | Format a range |
| [`textDocument/rangesFormatting`](./language-features.md) | Format multiple ranges |
| [`textDocument/onTypeFormatting`](./language-features.md) | Format on trigger character |
| [`textDocument/rename`](./language-features.md) | Rename a symbol |
| [`textDocument/prepareRename`](./language-features.md) | Validate / locate a rename before renaming |
| [`textDocument/foldingRange`](./language-features.md) | Foldable regions |
| [`textDocument/selectionRange`](./language-features.md) | Smart-selection ranges |
| [`textDocument/semanticTokens/full`](./language-features.md) | Semantic tokens for a whole document |
| [`textDocument/semanticTokens/full/delta`](./language-features.md) | Semantic tokens as a delta |
| [`textDocument/semanticTokens/range`](./language-features.md) | Semantic tokens for a range |
| [`textDocument/inlayHint`](./language-features.md) | Inlay hints in a range |
| [`inlayHint/resolve`](./language-features.md) | Fill in an inlay hint lazily (resolve) |
| [`textDocument/inlineCompletion`](./language-features.md) | Inline (ghost-text) completions |
| [`textDocument/inlineValue`](./language-features.md) | Inline values during debugging |
| [`textDocument/linkedEditingRange`](./language-features.md) | Ranges edited together |
| [`textDocument/moniker`](./language-features.md) | Monikers for a symbol |
| [`textDocument/documentColor`](./language-features.md) | Color references in a document |
| [`textDocument/colorPresentation`](./language-features.md) | Presentations for a color |
| [`textDocument/diagnostic`](./language-features.md) | Pull diagnostics for a document |
| [`textDocument/publishDiagnostics`](./language-features.md) | Push diagnostics to the client |

## Hierarchies

→ [./hierarchies.md](./hierarchies.md)

| Method | Purpose |
| --- | --- |
| [`textDocument/prepareCallHierarchy`](./hierarchies.md) | Prepare call-hierarchy items at a position |
| [`callHierarchy/incomingCalls`](./hierarchies.md) | Incoming calls for an item |
| [`callHierarchy/outgoingCalls`](./hierarchies.md) | Outgoing calls for an item |
| [`textDocument/prepareTypeHierarchy`](./hierarchies.md) | Prepare type-hierarchy items at a position |
| [`typeHierarchy/supertypes`](./hierarchies.md) | Supertypes of an item |
| [`typeHierarchy/subtypes`](./hierarchies.md) | Subtypes of an item |

## Workspace

→ [./workspace.md](./workspace.md)

| Method | Purpose |
| --- | --- |
| [`workspace/symbol`](./workspace.md) | Search symbols across the workspace |
| [`workspaceSymbol/resolve`](./workspace.md) | Fill in a workspace symbol lazily (resolve) |
| [`workspace/executeCommand`](./workspace.md) | Execute a server-provided command |
| [`workspace/applyEdit`](./workspace.md) | Server asks the client to apply a workspace edit |
| [`workspace/willCreateFiles`](./workspace.md) | Edits to apply before files are created |
| [`workspace/willRenameFiles`](./workspace.md) | Edits to apply before files are renamed |
| [`workspace/willDeleteFiles`](./workspace.md) | Edits to apply before files are deleted |
| [`workspace/didCreateFiles`](./workspace.md) | Files were created |
| [`workspace/didRenameFiles`](./workspace.md) | Files were renamed |
| [`workspace/didDeleteFiles`](./workspace.md) | Files were deleted |
| [`workspace/didChangeConfiguration`](./workspace.md) | Configuration changed |
| [`workspace/configuration`](./workspace.md) | Server pulls configuration from the client |
| [`workspace/didChangeWatchedFiles`](./workspace.md) | Watched files changed on disk |
| [`workspace/didChangeWorkspaceFolders`](./workspace.md) | Workspace folders added / removed |
| [`workspace/workspaceFolders`](./workspace.md) | Server pulls the current workspace folders |
| [`workspace/codeLens/refresh`](./workspace.md) | Ask the client to re-pull code lenses |
| [`workspace/foldingRange/refresh`](./workspace.md) | Ask the client to re-pull folding ranges |
| [`workspace/semanticTokens/refresh`](./workspace.md) | Ask the client to re-pull semantic tokens |
| [`workspace/inlayHint/refresh`](./workspace.md) | Ask the client to re-pull inlay hints |
| [`workspace/inlineValue/refresh`](./workspace.md) | Ask the client to re-pull inline values |
| [`workspace/diagnostic`](./workspace.md) | Pull workspace-wide diagnostics |
| [`workspace/diagnostic/refresh`](./workspace.md) | Ask the client to re-pull diagnostics |

## Window

→ [./window.md](./window.md)

| Method | Purpose |
| --- | --- |
| [`window/showMessage`](./window.md) | Show a message to the user |
| [`window/logMessage`](./window.md) | Log a message in the client |
| [`window/showMessageRequest`](./window.md) | Show a message and await an action choice |
| [`window/showDocument`](./window.md) | Ask the client to show a document |
| [`window/workDoneProgress/create`](./window.md) | Create a work-done progress token |
| [`window/workDoneProgress/cancel`](./window.md) | Cancel a work-done progress |
| [`telemetry/event`](./window.md) | Send a telemetry event to the client |
| [`client/registerCapability`](./window.md) | Register a capability dynamically |
| [`client/unregisterCapability`](./window.md) | Unregister a capability dynamically |
