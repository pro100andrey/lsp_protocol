import '../generator.dart' show ConnectionGenerator, ModelGenerator;
import 'extensions/string.dart';
import 'meta/protocol.dart';

/// Shared LSP→Dart type resolution logic used by [ModelGenerator] and
/// [ConnectionGenerator].
///
/// Consumers must provide [structsByName] and [enumNames] look-up tables
/// (populated from the [MetaProtocol] before visiting).
mixin LspTypeResolver {
  Map<String, MetaStructure> get structsByName;
  Set<String> get enumNames;

  // ── Public type resolution ────────────────────────────────────────────────

  String resolveType(MetaReference ref) => switch (ref) {
    BaseRef(:final name) => baseTypeName(name),
    TypeRef(:final name) => dartName(name),
    ArrayRef(:final element) => 'List<${resolveType(element)}>',
    MapRef(:final key, :final value) =>
      'Map<${resolveType(key)}, ${resolveType(value)}>',
    OrRef(:final items) => resolveOrType(items),
    AndRef() => 'Object?',
    LiteralRef() => 'Map<String, dynamic>',
    StringLiteralRef() => 'String',
    TupleRef(:final items) => resolveTupleType(items),
  };

  String resolveOrType(List<MetaReference> items) {
    final nonNull = items
        .where((r) => !(r is BaseRef && r.name == 'null'))
        .toList();
    final hasNull = nonNull.length != items.length;

    if (nonNull.length == 1) {
      return resolveType(nonNull.first).optional(optional: hasNull);
    }
    return 'Object?';
  }

  String resolveTupleType(List<MetaReference> items) {
    if (items.length == 2) {
      return '(${resolveType(items[0])}, ${resolveType(items[1])})';
    }
    return 'Object?';
  }

  String baseTypeName(String name) => switch (name) {
    'integer' || 'uinteger' => 'int',
    'string' || 'DocumentUri' || 'URI' => 'String',
    'decimal' => 'double',
    'boolean' => 'bool',
    'null' => 'Null',
    'LSPAny' || 'object' || 'LSPObject' || 'LSPArray' => 'Object?',
    _ => name,
  };

  /// LSP names starting with `_` are mapped to `$…` to avoid private-symbol
  /// issues in generated Dart code.
  String dartName(String name) =>
      name.startsWith('_') ? '\$${name.substring(1)}' : name;
}
