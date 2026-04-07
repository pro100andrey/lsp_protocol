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

    final pkgDir = DirectoryPath(select.resolvedOutputDir);
    final srcDir = pkgDir.join('lib/src');
    final libDir = pkgDir.join('lib');

    if (srcDir.notFound) srcDir.create(recursive: true);

    srcDir.joinFile('structures.dart').writeAsString(structures);
    srcDir.joinFile('enumerations.dart').writeAsString(enumerations);
    srcDir.joinFile('type_aliases.dart').writeAsString(aliases);

    // Barrel file: lib/<packageName>.dart
    final packageName = pkgDir.basename;
    final barrelLib = Library(
      (b) => b
        ..comments.add('GENERATED — do not edit.')
        ..directives.addAll([
          Directive.export('src/structures.dart'),
          Directive.export('src/enumerations.dart'),
          Directive.export('src/type_aliases.dart'),
        ]),
    );
    final barrel = formatter.format(barrelLib.accept(dartEmitter).toString());
    libDir.joinFile('$packageName.dart').writeAsString(barrel);

    return state.copyWith(
      emit: EmitState(
        structures: structures,
        enumerations: enumerations,
        aliases: aliases,
      ),
    );
  }
}
