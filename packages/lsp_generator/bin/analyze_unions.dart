// Utility: analyze metaModel.json and report all properties that use union (or)
// types so you can decide how to handle them in code generation.
//
// Run from workspace root:
//   dart run packages/lsp_generator/bin/analyze_unions.dart
//
// Optional flag:
//   --flat    show only the or-items directly (skip wrapping List<> context)

import 'dart:convert';
import 'dart:io';

import 'package:lsp_generator/src/redux/models/protocol.dart';

void main(List<String> args) async {
  final flat = args.contains('--flat');
  const metaModelPath = 'packages/lsp_specification/metaModel.json';
  final file = File(metaModelPath);
  if (!file.existsSync()) {
    stderr.writeln('Not found: $metaModelPath');
    stderr.writeln('Run from workspace root.');
    exit(1);
  }

  final json = jsonDecode(await file.readAsString()) as Map<String, Object?>;
  final protocol = MetaProtocol.fromJson(json);

  final sections = <String, List<_Entry>>{
    'Structures': [
      for (final s in protocol.structures)
        for (final p in s.properties)
          ..._collect(p.type, '${s.name}.${p.name}', flat),
    ],
    'Type Aliases': [
      for (final ta in protocol.typeAliases)
        ..._collect(ta.type, ta.name, flat),
    ],
    'Requests — params': [
      for (final r in protocol.requests)
        if (r.params != null)
          ..._collect(r.params!, '${r.method} [params]', flat),
    ],
    'Requests — result': [
      for (final r in protocol.requests)
        if (r.result != null)
          ..._collect(r.result!, '${r.method} [result]', flat),
    ],
    'Notifications — params': [
      for (final n in protocol.notifications)
        if (n.params != null)
          ..._collect(n.params!, '${n.method} [params]', flat),
    ],
  };

  final allEntries = sections.values.expand((e) => e).toList();

  var total = 0;
  for (final MapEntry(:key, :value) in sections.entries) {
    _printSection(key, value);
    total += value.length;
  }
  print('Total union usages: $total\n');

  _printNormalizability(allEntries);
}

// ---------------------------------------------------------------------------
// Data
// ---------------------------------------------------------------------------

class _Entry {
  const _Entry(this.location, this.typeStr, this.items);
  final String location;

  /// Full rendered type that contains the or-union in context (e.g. List<A | B>).
  final String typeStr;

  /// The direct union arms (A, B in the example above).
  final List<String> items;
}

// ---------------------------------------------------------------------------
// Collection — finds every OrRef in the type tree and records it.
// ---------------------------------------------------------------------------

List<_Entry> _collect(
  MetaReference ref,
  String location,
  bool flat,
) {
  final entries = <_Entry>[];
  _walk(ref, location, entries, flat);
  return entries;
}

void _walk(
  MetaReference ref,
  String location,
  List<_Entry> out,
  bool flat, {

  /// Wrapping context so we can show "List<A | B>" instead of just "A | B".
  String Function(String inner)? wrap,
}) {
  switch (ref) {
    case OrRef(:final items):
      final arms = items.map(_renderType).toList();
      final typeStr = (wrap ?? (s) => s)(arms.join(' | '));
      out.add(_Entry(location, typeStr, arms));

      // Also recurse into each arm in case of nested ors.
      for (final item in items) {
        if (_hasOr(item)) {
          _walk(item, '$location (arm: ${_renderType(item)})', out, flat);
        }
      }

    case ArrayRef(:final element):
      if (_hasOr(element)) {
        _walk(
          element,
          location,
          out,
          flat,
          wrap: (inner) => (wrap ?? (s) => s)('List<$inner>'),
        );
      }

    case MapRef(:final value):
      if (_hasOr(value)) {
        _walk(value, '$location [map value]', out, flat);
      }

    case TupleRef(:final items):
      for (var i = 0; i < items.length; i++) {
        if (_hasOr(items[i])) {
          _walk(items[i], '$location [tuple[$i]]', out, flat);
        }
      }

    case AndRef(:final items):
      for (final item in items) {
        if (_hasOr(item)) {
          _walk(item, '$location [and arm]', out, flat);
        }
      }

    case LiteralRef(:final value):
      for (final p in value.properties) {
        if (_hasOr(p.type)) {
          _walk(p.type, '$location.${p.name}', out, flat);
        }
      }

    case TypeRef() || BaseRef() || StringLiteralRef():
      break; // no or-types inside these
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

bool _hasOr(MetaReference ref) => switch (ref) {
  OrRef() => true,
  ArrayRef(:final element) => _hasOr(element),
  MapRef(:final value) => _hasOr(value),
  TupleRef(:final items) || AndRef(:final items) => items.any(_hasOr),
  LiteralRef(:final value) => value.properties.any((p) => _hasOr(p.type)),
  TypeRef() || BaseRef() || StringLiteralRef() => false,
};

String _renderType(MetaReference ref) => switch (ref) {
  OrRef(:final items) => items.map(_renderType).join(' | '),
  ArrayRef(:final element) => 'List<${_renderType(element)}>',
  MapRef(:final key, :final value) =>
    'Map<${_renderType(key)}, ${_renderType(value)}>',
  TupleRef(:final items) => '[${items.map(_renderType).join(', ')}]',
  AndRef(:final items) => items.map(_renderType).join(' & '),
  TypeRef(:final name) || BaseRef(:final name) => name,
  StringLiteralRef(:final value) => '"$value"',
  LiteralRef(:final value) =>
    '{${value.properties.map((p) => '${p.name}: ${_renderType(p.type)}').join(', ')}}',
};

void _printSection(String title, List<_Entry> entries) {
  final label = '=== $title (${entries.length}) ===';
  print(label);
  if (entries.isEmpty) {
    print('  (none)');
  } else {
    for (final e in entries) {
      print('  ${e.location}');
      print('      -> ${e.typeStr}');
    }
  }
  print('');
}

// ---------------------------------------------------------------------------
// Normalizability analysis
// ---------------------------------------------------------------------------

/// Canonical key for a union: sorted arms joined by " | ".
/// Sorting makes `A | B` and `B | A` the same signature.
String _signature(_Entry e) => (List.of(e.items)..sort()).join(' | ');

void _printNormalizability(List<_Entry> all) {
  // ── 1. Group identical union signatures ────────────────────────────────────
  // If the same set of arms appears in N > 1 places we CAN extract one class.
  final bySignature = <String, List<_Entry>>{};
  for (final e in all) {
    bySignature.putIfAbsent(_signature(e), () => []).add(e);
  }

  final shared = bySignature.entries.where((kv) => kv.value.length > 1).toList()
    ..sort((a, b) => b.value.length.compareTo(a.value.length));

  print('=== Identical unions (can be extracted into one sealed class) ===');
  if (shared.isEmpty) {
    print('  (none — every union is used exactly once)');
  } else {
    for (final kv in shared) {
      print('  [${kv.value.length}x]  ${kv.key}');
      for (final e in kv.value) {
        print('        ${e.location}');
      }
    }
  }
  print('');

  // ── 2. Individual arm overlap across DIFFERENT union signatures ────────────
  // Maps arm → set of distinct union signatures that contain it.
  // High count ⇒ this arm type is "shared", meaning different unions can't be
  // collapsed into a single sealed hierarchy using that type as discriminator.
  final armToSigs = <String, Set<String>>{};
  for (final e in all) {
    final sig = _signature(e);
    for (final arm in e.items) {
      armToSigs.putIfAbsent(arm, () => {}).add(sig);
    }
  }

  final overlapping =
      armToSigs.entries.where((kv) => kv.value.length > 1).toList()
        ..sort((a, b) => b.value.length.compareTo(a.value.length));

  print(
    '=== Arms that appear in multiple DIFFERENT unions '
    '(harder to normalize) ===',
  );
  if (overlapping.isEmpty) {
    print('  (none — every arm type is unique to one union)');
  } else {
    for (final kv in overlapping) {
      print('  "${kv.key}"  →  ${kv.value.length} distinct unions');
      for (final sig in kv.value.toList()..sort()) {
        print('        $sig');
      }
    }
  }
  print('');

  // ── 3. Summary ─────────────────────────────────────────────────────────────
  final uniqueSigs = bySignature.length;
  final extractable = shared.fold(0, (s, kv) => s + kv.value.length);
  final totalSingletons = bySignature.values.where((v) => v.length == 1).length;

  print('=== Summary ===');
  print('  Distinct union signatures : $uniqueSigs');
  print(
    '  Extractable (shared ≥2x)  : '
    '${shared.length} signatures covering $extractable usages',
  );
  print(
    '  Unique (appear once only) : $totalSingletons'
    ' — must decide case-by-case',
  );
  print(
    '  Arms shared across unions : ${overlapping.length}'
    ' (these types cannot act as sole discriminator)',
  );
}
