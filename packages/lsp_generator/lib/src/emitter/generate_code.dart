import 'dart:io';

import 'package:code_builder/code_builder.dart';

import '../config/files.dart';
import '../generator/client_api_generator.dart';
import '../generator/generator_helpers.dart';
import '../generator/model_generator.dart';
import '../generator/server_api_generator.dart';
import '../resolver/resolved_state.dart';

/// Package name for which special barrel/API files are generated.
const kProLspPackage = 'pro_lsp';

/// Model exports for the main barrel file.
final _modelExports = [
  GeneratedPaths.modelExport(Files.structures),
  GeneratedPaths.modelExport(Files.enumerations),
  GeneratedPaths.modelExport(Files.aliases),
  GeneratedPaths.modelExport(Files.scalarUnions),
  GeneratedPaths.modelExport(Files.unions),
  GeneratedPaths.modelExport(Files.methods),
];

/// API file exports for the main barrel (pro_lsp only).
final _apiExports = [
  GeneratedPaths.serverApiExport(Files.serverApi),
  GeneratedPaths.clientApiExport(Files.clientApi),
];

/// Infrastructure exports for the main barrel (pro_lsp only).
final _mainBarrelSourceExports = [
  'src/connection/lsp_connection.dart',
  'src/connection/lsp_exception.dart',
  'src/server/lsp_server.dart',
  'src/transport/lsp_byte_stream_channel.dart',
];

/// Infrastructure exports for the client barrel (pro_lsp only).
/// Does NOT include lsp_server.dart to avoid TextDocumentHandlers conflict.
final _clientBarrelSourceExports = [
  'src/client/lsp_client.dart',
  'src/connection/lsp_connection.dart',
  'src/connection/lsp_exception.dart',
  'src/transport/lsp_byte_stream_channel.dart',
];

void generateCode(ResolvedState resolved, String outputDir) {
  final mg = ModelGenerator(resolved);

  _writeGeneratedFiles(mg, outputDir);
  _writeBarrelFiles(outputDir);
  _writeApiFiles(resolved, outputDir);
}

void _writeGeneratedFiles(ModelGenerator mg, String outputDir) {
  final dir = Directory(outputDir);
  dir.modelsDir.createSync(recursive: true);

  final files = {
    dir.structuresFile: emitLibrary(mg.buildStructures()),
    dir.structuresCapabilitiesFile: emitLibrary(mg.buildStructuresCaps()),
    dir.structuresParamsFile: emitLibrary(mg.buildStructuresParams()),
    dir.structuresCommonFile: emitLibrary(mg.buildStructuresCommon()),
    dir.enumerationsFile: emitLibrary(mg.buildEnumerations()),
    dir.aliasesFile: emitLibrary(mg.buildAliases()),
    dir.scalarUnionsFile: emitLibrary(mg.buildScalarUnions()),
    dir.unionsFile: emitLibrary(mg.buildUnions()),
    dir.methodsFile: emitLibrary(mg.buildNotificationMethods()),
  };

  for (final entry in files.entries) {
    entry.key.writeAsStringSync(entry.value);
  }
}

void _writeBarrelFiles(String outputDir) {
  final dir = Directory(outputDir);
  _writeBarrel(dir, _modelExports, dir.barrelFile);

  if (dir.packageName == kProLspPackage) {
    final mainBarrelExports = [
      ..._modelExports,
      ..._apiExports,
      ..._mainBarrelSourceExports,
    ];
    _writeBarrel(dir, mainBarrelExports, dir.barrelFile);

    final clientBarrelFile = File('${dir.path}/lib/pro_lsp_client.dart');
    _writeBarrel(dir, _clientBarrelSourceExports, clientBarrelFile);
  }
}

void _writeBarrel(Directory dir, List<String> exports, File barrelFile) {
  final lib = Library(
    (b) => b
      ..comments.add('GENERATED — do not edit.')
      ..directives.addAll(
        exports.map(Directive.export).toList(growable: false),
      ),
  );

  barrelFile.writeAsStringSync(formatLibrary(lib));
}

void _writeApiFiles(ResolvedState rs, String outputDir) {
  final dir = Directory(outputDir);
  dir.serverDir.createSync(recursive: true);
  dir.clientDir.createSync(recursive: true);

  final serverLib = ServerApiGenerator(rs).buildServerApi();
  dir.serverApiFile.writeAsStringSync(formatLibrary(serverLib));

  final clientLib = ClientApiGenerator(rs).buildClientApi();
  dir.clientApiFile.writeAsStringSync(formatLibrary(clientLib));
}
