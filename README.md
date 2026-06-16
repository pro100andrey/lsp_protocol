# LSP Protocol

Monorepo for Dart LSP (Language Server Protocol) tools.

## Packages

- [`lsp_generator`](packages/lsp_generator/): Generates Dart classes from the official LSP `metaModel.json`.
- [`pro_lsp`](packages/pro_lsp/): Core framework containing generated LSP 3.17 models and the transport-agnostic server/client implementation. ([README](packages/pro_lsp/README.md))
- [`pro_lsp_sdk`](packages/pro_lsp_sdk/): High-level SDK extension for `pro_lsp` providing Virtual File System (VFS), diagnostics management, and configuration caches.

## Debug & Testing

Additional tools and resources for testing can be found in the [`debug/`](debug/) directory:

- [`lsp_test_server`](debug/lsp_test_server/): Reference LSP server implementation used for validating protocol bindings and SDK features.
- [`vscode-lsp-tester`](debug/vscode-lsp-tester/): VS Code extension for live testing and inspecting the `lsp_test_server` via TCP.
- [`project`](debug/project/): Sample LSP project files for testing.

## Code Generation

To download the latest `metaModel.json` and generate the Dart classes into the `pro_lsp` package, run the following command from the **root of the project**:

```bash
dart run packages/lsp_generator/bin/lsp_generator.dart generate
```

This command will:

1. Download the latest LSP `metaModel.json` (currently 3.17).
2. Generate all structures, unions, enumerations, and type aliases.
3. Automatically run `build_runner` inside `packages/pro_lsp` to generate the `json_serializable` and `freezed` helper files.
