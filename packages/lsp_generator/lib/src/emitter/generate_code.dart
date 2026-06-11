import 'dart:io';

import 'package:code_builder/code_builder.dart';

import '../config/generated_files.dart';
import '../resolver/resolved_state.dart';
import '../visitor/emitter_helpers.dart';
import '../visitor/emitter_visitor.dart';

void generateCode(ResolvedState resolved, String outputDir) {
  final visitor = EmitterVisitor(resolved);

  final structures = emitLibrary(visitor.buildStructures());
  final structuresCapabilities =
      emitLibrary(visitor.buildStructuresCapabilities());
  final structuresParams = emitLibrary(visitor.buildStructuresParams());
  final structuresCommon = emitLibrary(visitor.buildStructuresCommon());
  final enumerations = emitLibrary(visitor.buildEnumerations());
  final aliases = emitLibrary(visitor.buildAliases());
  final scalarUnions = emitLibrary(visitor.buildScalarUnions());
  final unions = emitLibrary(visitor.buildUnions());
  final methods = emitLibrary(visitor.buildNotificationMethods());

  final dir = Directory(outputDir);

  dir.modelsDir.createSync(recursive: true);

  dir.structuresFile.writeAsStringSync(structures);
  dir.structuresCapabilitiesFile.writeAsStringSync(structuresCapabilities);
  dir.structuresParamsFile.writeAsStringSync(structuresParams);
  dir.structuresCommonFile.writeAsStringSync(structuresCommon);
  dir.enumerationsFile.writeAsStringSync(enumerations);
  dir.aliasesFile.writeAsStringSync(aliases);
  dir.scalarUnionsFile.writeAsStringSync(scalarUnions);
  dir.unionsFile.writeAsStringSync(unions);
  dir.methodsFile.writeAsStringSync(methods);

  // Barrel file: lib/<packageName>.dart
  final barrelLib = Library(
    (b) => b
      ..comments.add('GENERATED — do not edit.')
      ..directives.addAll([
        Directive.export(GeneratedPaths.modelExport(GeneratedFiles.structures)),
        Directive.export(
            GeneratedPaths.modelExport(GeneratedFiles.enumerations)),
        Directive.export(GeneratedPaths.modelExport(GeneratedFiles.aliases)),
        Directive.export(
            GeneratedPaths.modelExport(GeneratedFiles.scalarUnions)),
        Directive.export(GeneratedPaths.modelExport(GeneratedFiles.unions)),
        Directive.export(GeneratedPaths.modelExport(GeneratedFiles.methods)),
        if (dir.packageName == 'pro_lsp') ...[
          Directive.export('src/connection/lsp_connection.dart'),
          Directive.export('src/connection/lsp_exception.dart'),
          Directive.export('src/server/lsp_server.dart'),
          Directive.export('src/transport/lsp_byte_stream_channel.dart'),
        ],
      ]),
  );

  final barrel = formatLibrary(barrelLib);

  dir.barrelFile.writeAsStringSync(barrel);
}
