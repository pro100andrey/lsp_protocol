import 'dart:io';

import '../config/files.dart';
import '../resolver/resolved_state.dart';
import '../visitor/emitter_helpers.dart';
import '../visitor/server_api_visitor.dart';

/// Generates the typed LSP server API from the resolved LSP model and writes
/// it to the output directory.
void generateServerApi(ResolvedState resolved, String outputDir) {
  final visitor = ServerApiVisitor(resolved);
  final lib = visitor.buildServerApi();
  final source = emitLibrary(lib);

  final dir = Directory(outputDir);
  dir.serverDir.createSync(recursive: true);

  dir.serverApiFile.writeAsStringSync(source);
}
