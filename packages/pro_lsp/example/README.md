# Examples

This directory contains a basic example demonstrating how to initialize and run a Language Server.

* **[main.dart](main.dart)**: A minimal, self-contained Language Server communicating over standard input/output (stdin/stdout) with support for the initialize handshake and hover documentation.

## Full Debugging Workspace

For a complete, rich demonstration containing:
1. A multi-endpoint Dart LSP test server implementing diagnostics (linters), semantic tokens, definition/references search, progress indicator managers, and dynamic file watching.
2. A matching VS Code Extension client that establishes a connection with the test server, displays message boxes, and shows real-time server statistics.

Please see the **[debug/](https://github.com/pro100andrey/lsp_protocol/tree/main/debug)** directory in the GitHub repository.
