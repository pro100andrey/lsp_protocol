import 'dart:io';

import '../config/files.dart';
import '../resolver/resolved_state.dart';
import '../visitor/client_api_visitor.dart';
import '../visitor/emitter_helpers.dart';
import '../visitor/server_api_visitor.dart';

/// Generates the typed LSP server API from the resolved LSP model.
void generateServerApi(ResolvedState resolved, String outputDir) {
  final lib = ServerApiVisitor(resolved).buildServerApi();
  final source = emitLibrary(lib);

  final dir = Directory(outputDir);
  dir.serverDir.createSync(recursive: true);
  dir.serverApiFile.writeAsStringSync(source);
}

/// Generates the typed LSP client API from the resolved LSP model.
void generateClientApi(ResolvedState resolved, String outputDir) {
  final lib = ClientApiVisitor(resolved).buildClientApi();
  final source = emitLibrary(lib);

  final dir = Directory(outputDir);
  dir.clientDir.createSync(recursive: true);
  dir.clientApiFile.writeAsStringSync(source);
}
