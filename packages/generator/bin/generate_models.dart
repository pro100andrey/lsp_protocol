/// CLI: dart run bin/generate_models.dart
///
/// Generates pure-Dart model classes (no freezed) for all LSP structures,
/// enumerations and type-aliases and writes the result to
/// packages/lsp_protocol/lib/src/generated/models.dart
library;

import 'dart:io';

import 'package:generator/generator.dart';
import 'package:path/path.dart' as p;

Future<void> main(List<String> args) async {
  final protocol = await downloadAndParseLSP();

  // Directory.current is packages/generator when using `dart run`.
  // Go up two levels to reach the repo root.
  final repoRoot = p.dirname(p.dirname(Directory.current.path));
  final outPath = p.join(
    repoRoot,
    'packages',
    'lsp_protocol',
    'lib',
    'src',
    'generated',
    'models.dart',
  );

  final source = ModelGenerator().generate(protocol);

  final outFile = File(outPath);
  await outFile.parent.create(recursive: true);
  await outFile.writeAsString(source);

  final lineCount = source.split('\n').length;
  print('Generated $lineCount lines → $outPath');
}
