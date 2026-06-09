# LSP Protocol

Monorepo for Dart LSP (Language Server Protocol) tools.

## Packages

- `lsp_generator`: Generates Dart classes from the official LSP `metaModel.json`.
- `lsp_specification`: Contains the generated LSP classes and types.
- `lsp_server`: Core LSP server implementation.
- `lsp_test_server`: Test server implementation.

## Code Generation

To download the latest `metaModel.json` and generate the Dart classes into the `lsp_specification` package, run the following command from the **root of the project**:

```bash
dart run packages/lsp_generator/bin/lsp_generator.dart generate
```

This command will:

1. Download the latest LSP `metaModel.json` (currently 3.17).
2. Generate all structures, unions, enumerations, and type aliases.
3. Automatically run `build_runner` inside `packages/lsp_specification` to generate the `json_serializable` and `freezed` helper files.
