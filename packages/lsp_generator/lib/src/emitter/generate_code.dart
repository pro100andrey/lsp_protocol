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
      return '// ignore_for_file: type=lint\n\n${formatter.format(raw)}';
    } on Object catch (_) {
      // Return unformatted if the formatter fails (e.g. syntax error in
      // generated code).
      return '// ignore_for_file: type=lint\n\n$raw';
    }
  }

  final structures = emit(visitor.buildStructures());
  final structuresCapabilities = emit(visitor.buildStructuresCapabilities());
  final structuresParams = emit(visitor.buildStructuresParams());
  final structuresCommon = emit(visitor.buildStructuresCommon());
  final enumerations = emit(visitor.buildEnumerations());
  final aliases = emit(visitor.buildAliases());
  final scalarUnions = emit(visitor.buildScalarUnions());
  final unions = emit(visitor.buildUnions());
  final methods = emit(visitor.buildNotificationMethods());

  final srcDir = Directory(
    p.join(outputDir, 'lib', 'src', 'generated', 'models'),
  );
  final libDir = Directory(p.join(outputDir, 'lib'));

  if (!srcDir.existsSync()) {
    srcDir.createSync(recursive: true);
  }

  final structuresPath = p.join(srcDir.path, 'structures.dart');
  final structuresCapabilitiesPath =
      p.join(srcDir.path, 'structures.capabilities.dart');
  final structuresParamsPath = p.join(srcDir.path, 'structures.params.dart');
  final structuresCommonPath = p.join(srcDir.path, 'structures.common.dart');
  final enumerationsPath = p.join(srcDir.path, 'enumerations.dart');
  final aliasesPath = p.join(srcDir.path, 'type_aliases.dart');
  final scalarUnionsPath = p.join(srcDir.path, 'scalar_unions.dart');
  final unionsPath = p.join(srcDir.path, 'unions.dart');
  final methodsPath = p.join(srcDir.path, 'methods.dart');

  File(structuresPath).writeAsStringSync(structures);
  File(structuresCapabilitiesPath).writeAsStringSync(structuresCapabilities);
  File(structuresParamsPath).writeAsStringSync(structuresParams);
  File(structuresCommonPath).writeAsStringSync(structuresCommon);
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
        Directive.export('src/generated/models/structures.dart'),
        Directive.export('src/generated/models/enumerations.dart'),
        Directive.export('src/generated/models/type_aliases.dart'),
        Directive.export('src/generated/models/scalar_unions.dart'),
        Directive.export('src/generated/models/unions.dart'),
        Directive.export('src/generated/models/methods.dart'),
        if (packageName == 'pro_lsp') ...[
          Directive.export('src/connection/lsp_connection.dart'),
          Directive.export('src/connection/lsp_exception.dart'),
          Directive.export('src/server/lsp_server.dart'),
          Directive.export('src/transport/lsp_byte_stream_channel.dart'),
        ],
      ]),
  );

  final barrel = formatter.format(barrelLib.accept(dartEmitter).toString());
  
  File(p.join(libDir.path, '$packageName.dart')).writeAsStringSync(barrel);
}
