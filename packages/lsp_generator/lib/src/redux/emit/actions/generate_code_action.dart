import 'package:cli_utils/cli_utils.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../../../visiter/emitter_visitor.dart';
import '../../app_state.dart';
import '../../common/base_action.dart';
import '../emit_state.dart';

final class GenerateCodeAction extends BaseAction {
  @override
  AppState reduce() {
    final resolved = select.resolved;
    final visitor = EmitterVisitor(resolved);

    final dartEmitter = DartEmitter.scoped(
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    final formatter = DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
    );

    String emit(Library lib) {
      final raw = lib.accept(dartEmitter).toString();
      try {
        return formatter.format(raw);
      } catch (_) {
        // Return unformatted if the formatter fails (e.g. syntax error in generated code).
        return raw;
      }
    }

    final structures = emit(visitor.buildStructures());
    final enumerations = emit(visitor.buildEnumerations());
    final aliases = emit(visitor.buildAliases());

    final outDir = DirectoryPath(select.resolvedOutputDir);
    if (outDir.notFound) {
      outDir.create(recursive: true);
    }
    outDir.joinFile('structures.dart').writeAsString(structures);
    outDir.joinFile('enumerations.dart').writeAsString(enumerations);
    outDir.joinFile('type_aliases.dart').writeAsString(aliases);

    return state.copyWith(
      emit: EmitState(
        structures: structures,
        enumerations: enumerations,
        aliases: aliases,
      ),
    );
  }
}
