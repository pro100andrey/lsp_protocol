import 'dart:io';

import 'package:code_builder/code_builder.dart';

import '../config/files.dart';
import '../resolver/resolved_state.dart';
import '../visitor/client_api_visitor.dart';
import '../visitor/emitter_helpers.dart';
import '../visitor/emitter_visitor.dart';
import '../visitor/server_api_visitor.dart';

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
  final visitor = EmitterVisitor(resolved);

  _writeGeneratedFiles(visitor, outputDir);
  _writeBarrelFiles(visitor, outputDir);
  _writeApiFiles(resolved, outputDir);
}

void _writeGeneratedFiles(EmitterVisitor visitor, String outputDir) {
  final dir = Directory(outputDir);
  dir.modelsDir.createSync(recursive: true);

  final files = {
    dir.structuresFile: emitLibrary(visitor.buildStructures()),
    dir.structuresCapabilitiesFile: emitLibrary(
      visitor.buildStructuresCapabilities(),
    ),
    dir.structuresParamsFile: emitLibrary(visitor.buildStructuresParams()),
    dir.structuresCommonFile: emitLibrary(visitor.buildStructuresCommon()),
    dir.enumerationsFile: emitLibrary(visitor.buildEnumerations()),
    dir.aliasesFile: emitLibrary(visitor.buildAliases()),
    dir.scalarUnionsFile: emitLibrary(visitor.buildScalarUnions()),
    dir.unionsFile: emitLibrary(visitor.buildUnions()),
    dir.methodsFile: emitLibrary(visitor.buildNotificationMethods()),
  };

  for (final entry in files.entries) {
    entry.key.writeAsStringSync(entry.value);
  }
}

void _writeBarrelFiles(EmitterVisitor visitor, String outputDir) {
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

void _writeApiFiles(ResolvedState resolved, String outputDir) {
  final dir = Directory(outputDir);
  dir.serverDir.createSync(recursive: true);
  dir.clientDir.createSync(recursive: true);

  final serverLib = ServerApiVisitor(resolved).buildServerApi();
  dir.serverApiFile.writeAsStringSync(formatLibrary(serverLib));

  final clientLib = ClientApiVisitor(resolved).buildClientApi();
  dir.clientApiFile.writeAsStringSync(formatLibrary(clientLib));
}
