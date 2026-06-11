import 'dart:io';

import 'package:path/path.dart' as p;

import '../resolver/resolved_state.dart';
import '../visitor/emitter_helpers.dart';
import '../visitor/server_api_visitor.dart';

/// Generates the typed LSP server API from the resolved LSP model and writes
/// it to the output directory.
void generateServerApi(ResolvedState resolved, String outputDir) {
  final visitor = ServerApiVisitor(resolved);
  final lib = visitor.buildServerApi();
  final source = emitLibrary(lib);

  final generatedPath = p.join(
    outputDir,
    'lib',
    'src',
    'generated',
    'server',
  );

  final generatedDir = Directory(generatedPath);
  if (!generatedDir.existsSync()) {
    generatedDir.createSync(recursive: true);
  }

  final outputPath = p.join(generatedPath, 'server_api.dart');
  File(outputPath).writeAsStringSync(source);
}
