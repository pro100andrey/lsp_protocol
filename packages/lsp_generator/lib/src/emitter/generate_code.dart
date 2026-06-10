import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

import '../resolver/resolved_state.dart';
import '../visitor/emitter_visitor.dart';

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
  final structuresConverters = emit(visitor.buildStructuresConverters());
  final enumerations = emit(visitor.buildEnumerations());
  final aliases = emit(visitor.buildAliases());
  final scalarUnions = emit(visitor.buildScalarUnions());
  final unions = emit(visitor.buildUnions());
  final methods = emit(visitor.buildNotificationMethods());

  final srcDir = Directory(p.join(outputDir, 'lib', 'src'));
  final libDir = Directory(p.join(outputDir, 'lib'));

  if (!srcDir.existsSync()) {
    srcDir.createSync(recursive: true);
  }

  final structuresPath = p.join(srcDir.path, 'structures.dart');
  final structuresConvertersPath =
      p.join(srcDir.path, 'structures.converters.dart');
  final enumerationsPath = p.join(srcDir.path, 'enumerations.dart');
  final aliasesPath = p.join(srcDir.path, 'type_aliases.dart');
  final scalarUnionsPath = p.join(srcDir.path, 'scalar_unions.dart');
  final unionsPath = p.join(srcDir.path, 'unions.dart');
  final methodsPath = p.join(srcDir.path, 'methods.dart');

  File(structuresPath).writeAsStringSync(structures);
  File(structuresConvertersPath).writeAsStringSync(structuresConverters);
  File(enumerationsPath).writeAsStringSync(enumerations);
  File(aliasesPath).writeAsStringSync(aliases);
  File(scalarUnionsPath).writeAsStringSync(scalarUnions);
  File(unionsPath).writeAsStringSync(unions);
  File(methodsPath).writeAsStringSync(methods);

  // Barrel file: lib/<packageName>.dart
  final packageName = p.basename(outputDir);
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
  
  File(p.join(libDir.path, '$packageName.dart')).writeAsStringSync(barrel);
}
