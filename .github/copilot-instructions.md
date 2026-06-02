# LSP Generator — Project Guidelines

## Overview

A Dart CLI tool that downloads the official LSP meta-model JSON from Microsoft, parses it into strongly-typed Dart structures, and generates LSP-compliant Dart bindings used by `lsp_specification` and `lsp_server`.

## Architecture

Six packages in this monorepo:

```
lsp_generator          (CLI — fetches, resolves, emits Dart bindings)
  ├→ dar               (Redux engine for async CLI state management)
  └→ cli_utils         (file I/O helpers, ANSI string formatting)
lsp_specification      (Generated LSP 3.17 Dart bindings — do not edit manually)
lsp_server             (Typed LSP server over json_rpc_2; generated/server_api.dart is generated)
lsp_test_server        (Minimal LSP server for validating generated bindings; stdio + TCP modes)
vscode-lsp-tester      (VS Code extension that connects to lsp_test_server over TCP)
```

### `dar` dependency

`dar` is a **git dependency** (not on pub.dev). `lsp_generator` and `lsp_test_server` may pin to **different commits** — do not assume they share the same version.

```yaml
# Example in pubspec.yaml
dar:
  git:
    url: https://github.com/pro100andrey/dar.git
    ref: 89775a65fd4d55d6be2dbcc90c440b2d8a19b8d3
```

### `lsp_test_server` and `vscode-lsp-tester` workflow

1. `dart run packages/lsp_test_server/bin/lsp_test_server.dart --socket 2087` — starts TCP server
2. Open VS Code with the `vscode-lsp-tester` extension enabled (connects to port 2087, configurable via `lspTester.serverPort`)
3. Open any `.txt` file — the extension registers as a `LanguageClient` for `plaintext` files (avoids conflicting with the Dart extension)
4. Use `lspTester.restartServer` command to reconnect

### Generation Pipeline

`GenerateCommand` dispatches these actions in order:

```
SetOutputDirAction          (optional, if --output is given)
  ↓
FetchLSPModelAction + FetchLSPLicenseAction  (parallel)
  ↓
ResolveModelAction
  ↓
GenerateCodeAction + GenerateServerApiAction  (parallel)
  ↓
RunBuildRunnerAction        (runs build_runner in lsp_specification)
```

### Visitor Passes (packages/lsp_generator/lib/src/visiter/)

Code generation is split into four visitor passes:

| Pass | Visitor            | Purpose                                                     |
| ---- | ------------------ | ----------------------------------------------------------- |
| 1    | `MetaVisitor`      | Traverses metaModel JSON → typed `MetaProtocol` structures  |
| 2    | `ResolverVisitor`  | Resolves type references, inheritance, discriminated unions |
| 3    | `EmitterVisitor`   | Generates Dart source using `code_builder`                  |
| —    | `ServerApiVisitor` | Generates `lsp_server/generated/server_api.dart`            |
| —    | `TypeReference`    | Utility: resolves generics, unions, scalar types            |

### Why Redux for a CLI?

`dar` centralises state (`AppState`), queues async actions, and decouples logging via observers — making it easy to add commands without retrofitting error handling or progress reporting.

### Key Directories

| Path                                            | Purpose                                                                   |
| ----------------------------------------------- | ------------------------------------------------------------------------- |
| `packages/lsp_generator/bin/lsp_generator.dart` | Entry point — calls `run(args)`                                           |
| `packages/lsp_generator/lib/src/runner/`        | `runner.dart` wires store + CommandRunner; `commands/` holds subcommands  |
| `packages/lsp_generator/lib/src/redux/`         | All state: `app_state.dart`, per-feature slices in subdirs                |
| `packages/lsp_generator/lib/src/redux/models/`  | `protocol.dart` — LSP type tree (freezed + JSON)                          |
| `packages/lsp_generator/lib/src/redux/common/`  | `base_action.dart` (extend for new actions), `selectors.dart`             |
| `packages/lsp_specification/lib/src/`           | Generated output: enumerations, structures, unions, type aliases, methods |
| `packages/lsp_server/lib/src/`                  | LSP server impl; `generated/server_api.dart` is emitted by generator      |
| `packages/cli_utils/lib/src/`                   | `files.dart` (path caching), `string_style.dart` (ANSI boxes/wrap)        |

## Build & Test Commands

```bash
# Regenerate freezed/json files after editing protocol.dart or app_state.dart
# (run inside the package that owns the file)
dart run build_runner build

# Lint (run per-package or from workspace root)
dart analyze

# Tests
cd packages/lsp_generator
dart test

# Run the generator directly
dart run packages/lsp_generator/bin/lsp_generator.dart generate
dart run packages/lsp_generator/bin/lsp_generator.dart generate --verbose

# Or via pre-compiled binary
./packages/lsp_generator/lsp_generator generate

# Start test server (stdio)
dart run packages/lsp_test_server/bin/lsp_test_server.dart

# Start test server (TCP, for vscode-lsp-tester)
dart run packages/lsp_test_server/bin/lsp_test_server.dart --socket 2087
```

### Pubspec conventions

- All packages: `publish_to: none`
- Inter-package dependencies use `path:` (no Dart workspace directive)
- Lint ruleset: `pro_lints` in `dev_dependencies` (not `lints` or `flutter_lints`)
- `build_runner` is a `dev_dependency` and is run per-package, not globally

## Conventions

### Adding a new Redux action

1. Create `lib/src/redux/<feature>/actions/<name>_action.dart`
2. Extend `BaseAction<AppState>` (from `common/base_action.dart`)
3. Override `Future<AppState?> reduce()` (async) or `AppState? reduce()` (sync)
4. Throw `UserException('Message', code: exXxx)` for structured Unix exit codes
5. Dispatch via `store.dispatchAndWait(MyAction())` inside a command
6. For parallel dispatch use `store.dispatchAndWaitAll([ActionA(), ActionB()])` (also available on `WithStore` commands)

`WithStore` mixin (used in commands) exposes `dispatchAndWait`, `dispatchSync`, `dispatchAll`, `dispatchAndWaitAll` as shorthand — no need to prefix with `store.`.

### Adding a new command

1. Create `lib/src/runner/commands/<name>.dart`
2. Extend `Command` and mix in `WithStore` (from `commands/with_store.dart`) to access the store
3. Register in `runner.dart` with `..addCommand(MyCommand(store: store))`

### Adding an LSP request handler (`lsp_server` / `lsp_test_server`)

Handlers are registered on namespace objects: `server.general`, `server.textDocument`, `server.workspace`, etc.

```dart
// In server_runner.dart or a Redux action
final server = store.prop<LspServer>();
server.textDocument.onHover((params) async {
  // params is strongly typed via generated/server_api.dart
  return Hover(contents: MarkupContent(...));
});
// Outgoing: server.client.window.logMessage(LogMessageParams(...));
```

`generated/server_api.dart` is emitted by `ServerApiVisitor` — never edit it directly.

### Code generation with code_builder

All code that _generates Dart source_ must use `code_builder` entities — never
build Dart text via `StringBuffer` or raw multi-line string interpolation.

| Construct                              | code_builder API                                                                                    |
| -------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Class (abstract / final / sealed)      | `Class((b) => b..name = '...'..modifier = ClassModifier.sealed...)`                                 |
| Constructor (const, factory, redirect) | `Constructor((b) => b..constant = true..factory = true..redirect = refer('_Foo'))`                  |
| Field / parameter                      | `Field(...)`, `Parameter((b) => b..name = '...'..type = refer('T'))`                                |
| Method with lambda body                | `Method((b) => b..lambda = true..body = expr.code)`                                                 |
| Method with block body                 | `Method((b) => b..body = Block((b) { b.addExpression(...); }))`                                     |
| Expression: property / call / asA      | `refer('x').property('v').call([]).asA(refer('T'))`                                                 |
| Expression: new instance named         | `refer('Foo').newInstanceNamed('fromJson', [refer('json')])`                                        |
| Inline closure                         | `Method((b) => b..lambda = true..requiredParameters.add(Parameter(...))..body = expr.code).closure` |
| Type with generics                     | `TypeReference((b) => b..symbol = 'Map'..types.addAll([refer('String'), ...]))`                     |
| Annotations                            | `b.annotations.add(refer('freezed'))`                                                               |
| `@JsonEnum(...)`                       | `refer('JsonEnum').call([], {'valueField': literalString('value')})`                                |

**Rules:**

- Method bodies that are simple expressions: use `..lambda = true` and set
  `..body` to a code_builder `Expression.code`.
- If-statement branches in block bodies: `Code('if (json is T) return ...;')` is
  acceptable for genuinely imperative control flow (type checks, guard clauses)
  that code_builder has no native spec for.
- Switch expressions with pattern matching (Dart 3 destructuring) must use
  `Code('switch (this) { Variant(:final v) => ... }')` — there is no
  code_builder API for this syntax. Build the case strings from structured data,
  not free-form interpolation.
- **Never** use `StringBuffer` to build an entire class, method, or block body.
  Use code_builder `Class`, `Constructor`, `Method`, and `Block` for all structure.

### Models (protocol.dart pattern)

- Annotate with `@freezed` / `@Freezed(unionKey: 'kind')` for sealed unions
- Run `build_runner build` after any change — **never hand-edit** `*.freezed.dart` or `*.g.dart`
- Discriminated unions use `@Freezed(unionKey: 'kind')` with `sealed class`
- All files under `packages/lsp_specification/lib/src/` are **generated outputs** — never edit them directly; re-run the generator instead

### Tests

- Tests live in `packages/lsp_generator/test/visiter/`
- No mocking framework — pure unit tests against visitor logic
- Use private fixture builder helpers (e.g. `_cls()`, `_prop()`, `_enum()`) that return typed `ResolvedState`/`ResolvedClass` etc. objects
- Assert emitter output by formatting with `DartEmitter.scoped()` + `DartFormatter` and comparing as formatted Dart source strings
- No golden files; no file I/O in tests

### Error handling

- Use `UserException` with exit codes from `sysexits.h` constants (`exIO`, `exUsage`, etc.)
- Observer classes (`AppErrorObserver`, `AppActionLogger`) handle logging — don't log inside actions

### Logger injection

The `mason_logger` `Logger` instance is injected into the store via `store.setProp(logger)` before commands run. Retrieve it in actions with `select.prop<Logger>()`.

### Selectors

`Selectors` is an extension type over `AppState` defined in `common/selectors.dart`. It provides named accessors to derived state values, keeping actions free of raw state traversal.

Inside any action (via `BaseAction`), use `select`:

```dart
final version = select.lspVersion;          // state.meta.version
final uri     = select.lspMetaModelUri;     // computed from version
final proto   = select.protocol;            // state.meta.protocol!
```

- Add new selectors to `selectors.dart` as extension getters — never access nested state directly in actions
- Selectors that can throw (e.g. `protocol` uses `!`) are intentional: an action that needs them must ensure the state is populated first or catch the error via `wrapError`
