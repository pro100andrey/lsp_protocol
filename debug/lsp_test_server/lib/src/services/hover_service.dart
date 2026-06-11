import 'package:pro_lsp/pro_lsp.dart';

class HoverService {
  Hover getHover(HoverParams params) => Hover(
      contents: HoverContents(
        MarkupContent(
          kind: MarkupKind.markdown,
          value:
              '**LSP Test Server**\n\n'
              'File: `${params.textDocument.uri}`\n\n'
              'Position: line ${params.position.line}, '
              'character ${params.position.character}',
        ),
      ),
    );
}
