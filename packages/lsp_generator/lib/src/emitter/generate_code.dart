import 'package:cli_utils/cli_utils.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../resolver/resolved_state.dart';
import '../visiter/emitter_visitor.dart';

void generateCode(ResolvedState resolved, String outputDir) {
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
    } on Object catch (_) {
      // Return unformatted if the formatter fails (e.g. syntax error in
      // generated code).
      return raw;
    }
  }

  final structures = emit(visitor.buildStructures());
  final enumerations = emit(visitor.buildEnumerations());
  final aliases = emit(visitor.buildAliases());
  final scalarUnions = emit(visitor.buildScalarUnions());
  final unions = emit(visitor.buildUnions());
  final methods = emit(visitor.buildNotificationMethods());

  final pkgDir = DirectoryPath(outputDir);
  final srcDir = pkgDir.join('lib/src');
  final libDir = pkgDir.join('lib');

  if (srcDir.notFound) {
    srcDir.create(recursive: true);
  }

  srcDir.joinFile('structures.dart').writeAsString(structures);
  srcDir.joinFile('enumerations.dart').writeAsString(enumerations);
  srcDir.joinFile('type_aliases.dart').writeAsString(aliases);
  srcDir.joinFile('scalar_unions.dart').writeAsString(scalarUnions);
  srcDir.joinFile('unions.dart').writeAsString(unions);
  srcDir.joinFile('methods.dart').writeAsString(methods);

  // Barrel file: lib/<packageName>.dart
  final packageName = pkgDir.basename;
  final barrelLib = Library(
    (b) => b
      ..comments.add('GENERATED — do not edit.')
      ..directives.addAll([
        Directive.export('src/structures.dart'),
        Directive.export('src/enumerations.dart'),
        Directive.export('src/type_aliases.dart'),
        Directive.export('src/scalar_unions.dart'),
        Directive.export('src/unions.dart'),
        Directive.export('src/methods.dart'),
      ]),
  );

  final barrel = formatter.format(barrelLib.accept(dartEmitter).toString());
  
  libDir.joinFile('$packageName.dart').writeAsString(barrel);
}
