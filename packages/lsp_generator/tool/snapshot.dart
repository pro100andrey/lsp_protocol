// Offline regeneration snapshot — proves generator refactors are
// output-preserving. Loads the cached metaModel.json, regenerates every
// library, and prints each output's length + a checksum.
//
// Usage: dart run tool/snapshot.dart
//
// Throwaway verification harness, not production code.
// ignore_for_file: avoid_print, use_string_buffers, avoid_js_rounded_ints
import 'dart:convert';
import 'dart:io';

import 'package:lsp_generator/lsp_generator.dart';
import 'package:lsp_generator/src/generator/client_api_generator.dart';
import 'package:lsp_generator/src/generator/generator_helpers.dart';
import 'package:lsp_generator/src/generator/model_generator.dart';
import 'package:lsp_generator/src/generator/server_api_generator.dart';
import 'package:lsp_generator/src/models/protocol.dart';

void main() {
  final json = File('../pro_lsp/metaModel.json').readAsStringSync();
  final protocol = MetaProtocol.fromJson(
    jsonDecode(json) as Map<String, dynamic>,
  );
  final resolved = ModelResolver().resolve(protocol);

  final mg = ModelGenerator(resolved);
  final outputs = <String, String>{
    'structures': formatLibrary(mg.buildStructures()),
    'structures.capabilities': formatLibrary(mg.buildStructuresCaps()),
    'structures.params': formatLibrary(mg.buildStructuresParams()),
    'structures.common': formatLibrary(mg.buildStructuresCommon()),
    'enumerations': formatLibrary(mg.buildEnumerations()),
    'type_aliases': formatLibrary(mg.buildAliases()),
    'scalar_unions': formatLibrary(mg.buildScalarUnions()),
    'unions': formatLibrary(mg.buildUnions()),
    'methods': formatLibrary(mg.buildNotificationMethods()),
    'server_api': formatLibrary(ServerApiGenerator(resolved).buildServerApi()),
    'client_api': formatLibrary(ClientApiGenerator(resolved).buildClientApi()),
  };

  final names = outputs.keys.toList()..sort();
  var combined = '';
  for (final name in names) {
    final out = outputs[name]!;
    combined += out;
    // Simple deterministic checksum (FNV-1a 64-bit over code units).
    var hash = 0xcbf29ce484222325;
    for (final c in out.codeUnits) {
      hash = (hash ^ c) * 0x100000001b3;
      hash &= 0xFFFFFFFFFFFFFFFF;
    }
    print(
      '${name.padRight(26)} len=${out.length.toString().padLeft(7)}  '
      'fnv=0x${hash.toRadixString(16).padLeft(16, '0')}',
    );
  }
  var total = 0xcbf29ce484222325;
  for (final c in combined.codeUnits) {
    total = (total ^ c) * 0x100000001b3;
    total &= 0xFFFFFFFFFFFFFFFF;
  }
  print('-' * 60);
  print(
    'TOTAL                      len=${combined.length.toString().padLeft(7)}  '
    'fnv=0x${total.toRadixString(16).padLeft(16, '0')}',
  );
}
