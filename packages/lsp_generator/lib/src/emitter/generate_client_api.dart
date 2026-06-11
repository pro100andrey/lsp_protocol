import 'dart:io';

import '../config/files.dart';
import '../resolver/resolved_state.dart';
import '../visitor/client_api_visitor.dart';
import '../visitor/emitter_helpers.dart';

/// Generates the typed LSP client API from the resolved LSP model and writes
/// it to the output directory.
void generateClientApi(ResolvedState resolved, String outputDirPath) {
  final outputDir = Directory(outputDirPath);
  final visitor = ClientApiVisitor(resolved);
  final lib = visitor.buildClientApi();
  final source = emitLibrary(lib);

  final clientDir = outputDir.clientDir;
  if (!clientDir.existsSync()) {
    clientDir.createSync(recursive: true);
  }

  outputDir.clientApiFile.writeAsStringSync(source);
}
