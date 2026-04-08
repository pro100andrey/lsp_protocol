# LSP Generator — Project Guidelines

## Overview

A Dart CLI tool that downloads the official LSP meta-model JSON from Microsoft, parses it into strongly-typed Dart structures, and provides the foundation for generating LSP-compliant Dart bindings.

## Architecture

Three packages with a clear layered dependency:

```
lsp_generator
  ├→ cli_async_redux   (custom Redux engine for async CLI state management)
  └→ cli_utils         (file I/O helpers, ANSI string formatting)
```

### Data Flow

```
CLI args
  → CommandRunner (args package) parses flags (--verbose)
  → GenerateCommand.run() dispatches FetchLSPModelAction
  → Action downloads metaModel.json from Microsoft CDN
  → Parses JSON → MetaProtocol (freezed + json_serializable)
  → Stores result in AppState.meta.protocol
  → Observers log timing; exit code 0 on success
```

### Why Redux for a CLI?

`cli_async_redux` centralises state (`AppState`), queues async actions, and decouples logging via observers — making it easy to add commands without retrofitting error handling or progress reporting.

### Key Directories

| Path                                            | Purpose                                                                  |
| ----------------------------------------------- | ------------------------------------------------------------------------ |
| `packages/lsp_generator/bin/lsp_generator.dart` | Entry point — calls `run(args)`                                          |
| `packages/lsp_generator/lib/src/runner/`        | `runner.dart` wires store + CommandRunner; `commands/` holds subcommands |
| `packages/lsp_generator/lib/src/redux/`         | All state: `app_state.dart`, per-feature slices in subdirs               |
| `packages/lsp_generator/lib/src/redux/models/`  | `protocol.dart` — LSP type tree (freezed + JSON)                         |
| `packages/lsp_generator/lib/src/redux/common/`  | `base_action.dart` (extend for new actions), `selectors.dart`            |
| `packages/cli_async_redux/lib/src/`             | Generic Redux engine; `store.dart`, `action.dart`, `observers.dart`      |
| `packages/cli_utils/lib/src/`                   | `files.dart` (path caching), `string_style.dart` (ANSI boxes/wrap)       |

## Build & Test Commands

Run inside the relevant package directory (e.g. `cd packages/lsp_generator`):

```bash
# Regenerate freezed/json files after editing protocol.dart or app_state.dart
dart run build_runner build --delete-conflicting-outputs

# Lint
dart analyze

# Tests
dart test

# Run the generator directly
dart run bin/lsp_generator.dart generate
dart run bin/lsp_generator.dart generate --verbose

# Or via pre-compiled binary
./packages/lsp_generator/lsp_generator generate
```

## Conventions

### Adding a new Redux action

1. Create `lib/src/redux/<feature>/actions/<name>_action.dart`
2. Extend `BaseAction<AppState>` (from `common/base_action.dart`)
3. Override `Future<AppState?> reduce()` (async) or `AppState? reduce()` (sync)
4. Throw `ReduxException(exitCode: exXxx)` for structured Unix exit codes
5. Dispatch via `store.dispatchAndWait(MyAction())` inside a command

### Adding a new command

1. Create `lib/src/runner/commands/<name>.dart`
2. Extend `Command` and mix in `WithStore` (from `commands/with_store.dart`) to access the store
3. Register in `runner.dart` with `..addCommand(MyCommand(store: store))`

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

### Error handling

- Use `ReduxException` with exit codes from `sysexits.h` constants (`exIO`, `exUsage`, etc.)
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
