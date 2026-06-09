import 'package:lsp_specification/lsp_specification.dart';

class HoverService {
  Hover getHover(HoverParams params) => Hover(
      contents: MarkupContent(
        kind: MarkupKind.markdown,
        value:
            '**LSP Test Server**\n\n'
            'File: `${params.textDocument.uri}`\n\n'
            'Position: line ${params.position.line}, '
            'character ${params.position.character}',
      ),
    );
}
