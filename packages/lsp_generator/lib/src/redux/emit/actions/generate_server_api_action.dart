import 'package:cli_utils/cli_utils.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../../../visiter/server_api_visitor.dart';
import '../../app_state.dart';
import '../../common/base_action.dart';

/// Generates `packages/lsp_server/lib/src/generated/server_api.dart` from
/// the resolved LSP model.
///
/// Dispatched after `GenerateCodeAction` inside the `generate` command so the
/// resolver and emitter results are available.
final class GenerateServerApiAction extends BaseAction {
  @override
  AppState? reduce() {
    final resolved = select.resolved;
    final visitor = ServerApiVisitor(resolved);

    final dartEmitter = DartEmitter.scoped(
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

    final formatter = DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
    );

    final lib = visitor.buildServerApi();
    final raw = lib.accept(dartEmitter).toString();
    final source = () {
      try {
        return formatter.format(raw);
      } on Object catch (_) {
        return raw;
      }
    }();

    final serverPkgDir = DirectoryPath('packages/lsp_server');
    final generatedDir = serverPkgDir.join('lib/src/generated');
    if (generatedDir.notFound) {
      generatedDir.create(recursive: true);
    }
    generatedDir.joinFile('server_api.dart').writeAsString(source);

    return null;
  }
}
