import 'package:pro_lsp/pro_lsp.dart';

void main() async {
  // Create a new LspServer instance
  final server = LspServer();

  // 1. Connection Initialization (mandatory step in the LSP handshake)
  server.general.onInitialize(
    (params, context) async => const InitializeResult(
      capabilities: ServerCapabilities(
        hoverProvider: .bool(true),
      ),
      serverInfo: (name: 'example-server', version: '1.0.0'),
    ),
  );

  // 2. Register a Hover Handler
  server.textDocument.onHover(
    (params, context) async => Hover(
      contents: HoverContents.markupContent(
        MarkupContent(
          kind: .markdown,
          value:
              '### Example Hover\n\n'
              'This is a mock hover reply from the example server.\n'
              'Target Document: `${params.textDocument.uri}`',
        ),
      ),
    ),
  );

  // 3. Start listening on standard I/O (stdin/stdout)
  await server.listen();
}
