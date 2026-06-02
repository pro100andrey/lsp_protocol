import 'package:lsp_specification/lsp_specification.dart';

import '../common/base_action.dart';

/// Handles `textDocument/hover` — returns a fixed Markdown response.
final class HoverAction extends BaseAction {
  HoverAction(this.params);

  final HoverParams params;

  @override
  AppState? reduce() => null; // hover is read-only, no state change

  Hover get result => Hover(
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
