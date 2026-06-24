import 'dart:convert';
import 'dart:io';

import 'package:lsp_generator/lsp_generator.dart';
import 'package:lsp_generator/src/config/files.dart';
import 'package:lsp_generator/src/generator/api_generator.dart';
import 'package:lsp_generator/src/generator/generator_helpers.dart';
import 'package:lsp_generator/src/generator/model_generator.dart';
import 'package:lsp_generator/src/models/protocol.dart';
import 'package:test/test.dart';

/// Golden test: regenerating from the cached `metaModel.json` must reproduce
/// the `pro_lsp` generated files checked into the repo, byte for byte.
///
/// This guards both directions:
/// - a generator change that alters output without an intended regeneration,
/// - a hand-edit to a "GENERATED — do not edit" file.
///
/// When a diff is intentional, regenerate and commit the `pro_lsp` files:
/// `dart run bin/lsp_generator.dart generate` (run from this package).
///
/// The model and the goldens both live in the sibling `pro_lsp` package; tests
/// run with the package root as the working directory.
void main() {
  final proLsp = Directory('../pro_lsp');
  final modelFile = File('${proLsp.path}/metaModel.json');

  late ModelGenerator mg;
  late ResolveResult resolved;

  setUpAll(() {
    if (!modelFile.existsSync()) {
      throw StateError(
        'Cached meta-model not found at ${modelFile.path}. Run the generator '
        'once to populate it: dart run bin/lsp_generator.dart generate',
      );
    }
    final protocol = MetaProtocol.fromJson(
      jsonDecode(modelFile.readAsStringSync()) as Map<String, dynamic>,
    );
    resolved = ModelResolver().resolve(protocol);
    mg = ModelGenerator(resolved);
  });

  /// Registers a golden test that compares [generate]'s output against the
  /// committed [golden] file. Model files go through [emitLibrary] and API
  /// files through [formatLibrary], mirroring `generateCode` exactly.
  void golden(
    String label,
    File Function() golden,
    String Function() generate,
  ) {
    test('$label is in sync with the committed generated file', () {
      final file = golden();
      expect(
        file.existsSync(),
        isTrue,
        reason: 'Missing committed golden: ${file.path}',
      );
      _expectGolden(generate(), file);
    });
  }

  group('generated output golden', () {
    golden(
      'structures.dart',
      () => proLsp.structuresFile,
      () => emitLibrary(mg.buildStructures()),
    );
    golden(
      'structures.capabilities.dart',
      () => proLsp.structuresCapabilitiesFile,
      () => emitLibrary(mg.buildStructuresCaps()),
    );
    golden(
      'structures.params.dart',
      () => proLsp.structuresParamsFile,
      () => emitLibrary(mg.buildStructuresParams()),
    );
    golden(
      'structures.common.dart',
      () => proLsp.structuresCommonFile,
      () => emitLibrary(mg.buildStructuresCommon()),
    );
    golden(
      'enumerations.dart',
      () => proLsp.enumerationsFile,
      () => emitLibrary(mg.buildEnumerations()),
    );
    golden(
      'type_aliases.dart',
      () => proLsp.aliasesFile,
      () => emitLibrary(mg.buildAliases()),
    );
    golden(
      'scalar_unions.dart',
      () => proLsp.scalarUnionsFile,
      () => emitLibrary(mg.buildScalarUnions()),
    );
    golden(
      'unions.dart',
      () => proLsp.unionsFile,
      () => emitLibrary(mg.buildUnions()),
    );
    golden(
      'methods.dart',
      () => proLsp.methodsFile,
      () => emitLibrary(mg.buildNotificationMethods()),
    );
    golden(
      'server_api.dart',
      () => proLsp.serverApiFile,
      () => formatLibrary(ApiGenerator(resolved, SideConfig.server).buildApi()),
    );
    golden(
      'client_api.dart',
      () => proLsp.clientApiFile,
      () => formatLibrary(ApiGenerator(resolved, SideConfig.client).buildApi()),
    );
  });
}

/// Asserts [actual] equals the contents of [golden]; on mismatch, fails with
/// the first differing line instead of dumping the whole (often huge) file.
void _expectGolden(String actual, File golden) {
  final expected = golden.readAsStringSync();
  if (actual == expected) {
    return;
  }

  final a = actual.split('\n');
  final e = expected.split('\n');
  final max = a.length > e.length ? a.length : e.length;
  for (var i = 0; i < max; i++) {
    final av = i < a.length ? a[i] : '<end of generated output>';
    final ev = i < e.length ? e[i] : '<end of committed file>';
    if (av != ev) {
      fail(
        'Generated output for ${golden.path} diverges from the committed file '
        'at line ${i + 1}:\n'
        '  generated: $av\n'
        '  committed: $ev\n'
        'If this change is intended, regenerate the pro_lsp files:\n'
        '  dart run bin/lsp_generator.dart generate',
      );
    }
  }
  fail(
    'Generated output for ${golden.path} differs from the committed file '
    '(lengths ${actual.length} vs ${expected.length}).',
  );
}
