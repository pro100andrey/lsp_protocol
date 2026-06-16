# Changelog

## 0.1.0

* Initial release of `pro_lsp`.
* Complete LSP 3.17 specification bindings generated from the Microsoft LSP meta-model.
* Pluggable feature modularization architecture (`LspFeature`) with automated register and dispose lifecycles.
* Symmetrical client/server API with namespace-grouped handlers (`general`, `textDocument`, `workspace`, `window`, etc.).
* Connection lifecycle state machine tracking to enforce protocol-compliance.
* Custom middleware support (`LspMiddleware`) for request/notification interception.
* Built-in service container (dependency injection) registry inside connection contexts.
* Stream framing transport implementation (`LspByteStreamChannel`) supporting stdio, TCP sockets, and custom streams.
