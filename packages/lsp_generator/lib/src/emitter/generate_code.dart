import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;

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

  final barrel = formatLibrary(barrelLib);
  
  File(p.join(libDir.path, '$packageName.dart')).writeAsStringSync(barrel);
}
