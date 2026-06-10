import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

import '../resolver/resolved_state.dart';
import '../visitor/server_api_visitor.dart';

/// Generates `packages/pro_lsp/lib/src/generated/server/server_api.dart` from
/// the resolved LSP model.
void generateServerApi(ResolvedState resolved) {
  final visitor = ServerApiVisitor(resolved);

  final dartEmitter = DartEmitter.scoped(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  final formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  );

  final lib = visitor.buildServerApi();
  final raw = lib.accept(dartEmitter).toString();
  final source = () {
    try {
      return formatter.format(raw);
    } on Object catch (_) {
      return raw;
    }
  }();

  final generatedPath = p.join(
    'packages',
    'pro_lsp',
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
