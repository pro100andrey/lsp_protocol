// ignore_for_file: unnecessary_library_directive
library;

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions/string.dart';
import 'lsp_type_resolver.dart';
import 'meta/protocol.dart';
import 'visitor/visitor.dart';

/// Generates pure-Dart model classes (no freezed / no code-gen annotations)
/// for every LSP structure, enumeration and type-alias in the spec.
///
/// **Output per LSP item:**
/// * [MetaStructure]   → `final class Name { … }`
///   - properties are *flattened* from the entire extends/mixins chain
///   - own properties shadow inherited ones (handles `kind` conflicts in
///     `CreateFile`, `RenameFile`, `DeleteFile`)
///   - `const Name({required …, …})` constructor
///   - `factory Name.fromJson(Map<String, dynamic> json)` factory
///   - `Map<String, dynamic> toJson()` method
/// * [MetaEnumeration]  → `enum Name { value(raw); const Name(this.value); … }`
///   with `static Name fromJson(Object? json)` and `T toJson()` methods
/// * [MetaTypeAlias]    → `typedef Name = Type;`
final class ModelGenerator
    with LspTypeResolver
    implements MetaProtocolVisitor<List<Spec>> {
  ModelGenerator();

  // Populated in [generate] before any visiting.
  @override
  final structsByName = <String, MetaStructure>{};
  @override
  final enumNames = <String>{};

  // ── Public API ────────────────────────────────────────────────────────────

  String generate(MetaProtocol protocol) {
    // Build look-up tables first so type resolution works during visiting.
    structsByName
      ..clear()
      ..addAll({for (final s in protocol.structures) s.name: s});
    enumNames
      ..clear()
      ..addAll(protocol.enumerations.map((e) => e.name));

    final library = Library((b) {
      b
        ..comments.addAll([
          ' GENERATED CODE – DO NOT MODIFY BY HAND',
          ' LSP Version: ${protocol.metaData.version}',
          ' ignore_for_file: lines_longer_than_80_chars,'
              ' always_put_required_named_parameters_first,'
              ' prefer_expression_function_bodies,'
              ' unnecessary_lambdas,'
              ' cast_nullable_to_non_nullable,'
              ' prefer_const_constructors,'
              ' unnecessary_cast,'
              ' doc_directive_unknown,'
              ' unintended_html_in_doc_comment,'
              ' avoid_unused_constructor_parameters',
        ])
        ..body.addAll(protocol.typeAliases.expand(visitMetaTypeAlias))
        ..body.addAll(protocol.enumerations.expand(visitMetaEnumeration))
        ..body.addAll(protocol.structures.expand(visitMetaStructure));
    });

    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      useNullSafetySyntax: true,
      orderDirectives: true,
    );

    return DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
      pageWidth: DartFormatter.defaultPageWidth,
      trailingCommas: TrailingCommas.automate,
    ).format(library.accept(emitter).toString());
  }

  // ── MetaTypeAlias → typedef ───────────────────────────────────────────────

  @override
  List<Spec> visitMetaTypeAlias(MetaTypeAlias typeAlias) {
    final resolved = _resolveType(typeAlias.type);
    return [
      TypeDef(
        (b) => b
          ..docs.addAll(typeAlias.documentation.asDoc())
          ..name = typeAlias.name
          ..definition = refer(resolved),
      ),
    ];
  }

  // ── MetaEnumeration → Dart enum ──────────────────────────────────────────

  @override
  List<Spec> visitMetaEnumeration(MetaEnumeration enumeration) {
    final valueType = _resolveType(enumeration.type);

    final dartEnum = Enum((b) {
      b
        ..docs.addAll(enumeration.documentation.asDoc())
        ..name = enumeration.name
        ..values.addAll(_enumValues(enumeration.values))
        ..fields.add(
          Field(
            (f) => f
              ..modifier = FieldModifier.final$
              ..name = 'value'
              ..type = refer(valueType),
          ),
        )
        ..constructors.add(
          Constructor(
            (c) => c
              ..constant = true
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'value'
                    ..toThis = true,
                ),
              ),
          ),
        )
        ..methods.addAll([
          // static MyEnum fromJson(Object? json)
          Method(
            (m) => m
              ..static = true
              ..name = 'fromJson'
              ..returns = refer(enumeration.name)
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'json'
                    ..type = refer('Object?'),
                ),
              )
              ..body = Code(
                'return values.firstWhere((e) => e.value == json as $valueType);',
              ),
          ),
          // T toJson()
          Method(
            (m) => m
              ..name = 'toJson'
              ..returns = refer(valueType)
              ..lambda = true
              ..body = const Code('value'),
          ),
        ]);
    });

    return [dartEnum];
  }

  // Names that would conflict with the generated enum field / methods.
  static const _enumMemberReserved = {
    'value',
    'fromJson',
    'toJson',
    'values',
    'index',
    'name',
    'hashCode',
    'runtimeType',
    'noSuchMethod',
    'toString',
  };

  List<EnumValue> _enumValues(List<MetaEnumMember> members) =>
      members.map((member) {
        final rawName = member.name.lowerFirstLetter();
        final safeName =
            _enumMemberReserved.contains(
              _safeIdentifier(rawName),
            )
            ? '${_safeIdentifier(rawName)}_'
            : _safeIdentifier(rawName);
        final argument = switch (member.value) {
          EnumRawValueInteger(:final raw) => literalNum(int.parse(raw)),
          EnumRawValueString(:final raw) => literalString(raw),
        };

        return EnumValue(
          (v) => v
            ..docs.addAll(member.documentation.asDoc())
            ..name = safeName
            ..arguments.add(argument),
        );
      }).toList();

  // ── MetaStructure → final class ──────────────────────────────────────────

  @override
  List<Spec> visitMetaStructure(MetaStructure structure) {
    final name = _dartName(structure.name);
    final props = _flattenProperties(structure);

    final clazz = Class((b) {
      b
        ..docs.addAll(structure.documentation.asDoc())
        ..modifier = ClassModifier.final$
        ..name = name
        ..fields.addAll(props.map(_fieldFor))
        ..constructors.addAll([
          // Primary constructor
          Constructor(
            (c) => c
              ..constant = true
              ..optionalParameters.addAll(props.map(_paramFor)),
          ),
          // fromJson factory
          Constructor(
            (c) => c
              ..factory = true
              ..name = 'fromJson'
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'json'
                    ..type = refer('Map<String, dynamic>'),
                ),
              )
              ..body = Code(_fromJsonBody(name, props)),
          ),
        ])
        ..methods.add(
          Method(
            (m) => m
              ..name = 'toJson'
              ..returns = refer('Map<String, dynamic>')
              ..body = Code(_toJsonBody(props)),
          ),
        );
    });

    return [clazz];
  }

  // ── Field / Parameter builders ────────────────────────────────────────────

  Field _fieldFor(MetaProperty prop) => Field(
    (f) => f
      ..docs.addAll(prop.documentation.asDoc())
      ..modifier = FieldModifier.final$
      ..name = prop.name
      ..type = refer(_resolveType(prop.type).optional(optional: prop.optional)),
  );

  Parameter _paramFor(MetaProperty prop) => Parameter(
    (p) => p
      ..name = prop.name
      ..named = true
      ..required = !prop.optional
      ..toThis = true,
  );

  // ── fromJson body ────────────────────────────────────────────────────────

  String _fromJsonBody(String className, List<MetaProperty> props) {
    if (props.isEmpty) return 'return $className();';

    final buf = StringBuffer('return $className(')..writeln();
    for (final prop in props) {
      final expr = _fromJsonExpr(
        prop.type,
        "json['${prop.name}']",
        prop.optional,
      );
      buf.writeln('  ${prop.name}: $expr,');
    }
    buf.write(');');
    return buf.toString();
  }

  // ── toJson body ──────────────────────────────────────────────────────────

  String _toJsonBody(List<MetaProperty> props) {
    final buf = StringBuffer('return {')..writeln();
    for (final prop in props) {
      final expr = _toJsonExpr(prop.type, prop.name, prop.optional);
      buf.writeln("  '${prop.name}': $expr,");
    }
    buf.write('};');
    return buf.toString();
  }

  // ── Type resolution — delegated to LspTypeResolver mixin ─────────────────

  String _resolveType(MetaReference ref) => resolveType(ref);
  String _baseTypeName(String name) => baseTypeName(name);

  // ── fromJson expression helpers ───────────────────────────────────────────

  String _fromJsonExpr(
    MetaReference ref,
    String src,
    bool optional,
  ) => switch (ref) {
    BaseRef(:final name) => _baseFromJson(name, src, optional),
    TypeRef(:final name) when enumNames.contains(name) =>
      optional
          ? '$src == null ? null : ${_dartName(name)}.fromJson($src)'
          : '${_dartName(name)}.fromJson($src)',
    TypeRef(:final name) when structsByName.containsKey(name) =>
      optional
          ? '$src == null ? null '
                ': ${_dartName(name)}.fromJson($src as Map<String, dynamic>)'
          : '${_dartName(name)}.fromJson($src as Map<String, dynamic>)',
    TypeRef(:final name) => "$src as ${_dartName(name)}${optional ? '?' : ''}",
    ArrayRef(:final element) => _arrayFromJson(element, src, optional),
    MapRef(:final key, :final value) => _mapFromJson(key, value, src, optional),
    OrRef(:final items) => _orFromJson(items, src, optional),
    AndRef() => src,
    LiteralRef() =>
      optional
          ? '$src as Map<String, dynamic>?'
          : '$src as Map<String, dynamic>',
    StringLiteralRef() => "$src as String${optional ? '?' : ''}",
    TupleRef() => src,
  };

  String _baseFromJson(String baseName, String src, bool optional) =>
      switch (baseName) {
        'integer' || 'uinteger' => "$src as int${optional ? '?' : ''}",
        'string' ||
        'DocumentUri' ||
        'URI' => "$src as String${optional ? '?' : ''}",
        'decimal' => "$src as double${optional ? '?' : ''}",
        'boolean' => "$src as bool${optional ? '?' : ''}",
        'null' => 'null',
        'LSPAny' || 'object' || 'LSPObject' || 'LSPArray' => src,
        _ => "$src as ${_baseTypeName(baseName)}${optional ? '?' : ''}",
      };

  String _arrayFromJson(MetaReference element, String src, bool optional) {
    // We need the element's fromJson expression; substitute placeholder.
    const ph = '__e__';
    final elemExpr = _fromJsonExpr(element, ph, false);
    final nullGuard = optional ? '$src == null ? null : ' : '';

    if (elemExpr == ph) {
      // Element is pass-through (Object? or dynamic-safe) — use cast.
      final elemType = _resolveType(element);
      return '$nullGuard($src as List).cast<$elemType>()';
    }
    return '$nullGuard($src as List)'
        '.map((e) => ${elemExpr.replaceAll(ph, 'e')}).toList()';
  }

  String _mapFromJson(
    MetaReference keyRef,
    MetaReference valueRef,
    String src,
    bool optional,
  ) {
    final kType = _resolveType(keyRef);
    final vType = _resolveType(valueRef);

    const ph = '__v__';
    final valExpr = _fromJsonExpr(valueRef, ph, false);
    final nullGuard = optional ? '$src == null ? null : ' : '';

    if (valExpr == ph) {
      return '$nullGuard($src as Map).cast<$kType, $vType>()';
    }

    return '$nullGuard($src as Map<String, dynamic>)'
        '.map((k, v) => MapEntry(k as $kType, '
        '${valExpr.replaceAll(ph, 'v')}))';
  }

  String _orFromJson(List<MetaReference> items, String src, bool optional) {
    final nonNull = items
        .where((r) => !(r is BaseRef && r.name == 'null'))
        .toList();
    final hasNull = nonNull.length != items.length;

    if (nonNull.length == 1) {
      return _fromJsonExpr(nonNull.first, src, optional || hasNull);
    }
    return src; // Object? — pass-through
  }

  // ── toJson expression helpers ─────────────────────────────────────────────

  String _toJsonExpr(MetaReference ref, String field, bool optional) {
    final q = optional ? '?' : '';
    return switch (ref) {
      BaseRef() => field,
      StringLiteralRef() => field,
      TypeRef(:final name) when enumNames.contains(name) => '$field$q.toJson()',
      TypeRef(:final name) when structsByName.containsKey(name) =>
        '$field$q.toJson()',
      TypeRef() => field,
      ArrayRef(:final element) => _arrayToJson(element, field, optional),
      MapRef(:final key, :final value) => _mapToJson(
        key,
        value,
        field,
        optional,
      ),
      OrRef(:final items) => _orToJson(items, field, optional),
      AndRef() => field,
      LiteralRef() => field,
      TupleRef() => field,
    };
  }

  String _arrayToJson(MetaReference element, String field, bool optional) {
    const ph = '__e__';
    final elemExpr = _toJsonExpr(element, ph, false);
    final q = optional ? '?' : '';

    if (elemExpr == ph) return field; // no transformation needed
    return '$field$q.map((e) => ${elemExpr.replaceAll(ph, 'e')}).toList()';
  }

  String _mapToJson(
    MetaReference keyRef,
    MetaReference valueRef,
    String field,
    bool optional,
  ) {
    const ph = '__v__';
    final valExpr = _toJsonExpr(valueRef, ph, false);
    final q = optional ? '?' : '';

    if (valExpr == ph) return field;
    return '$field$q.map((k, v) => MapEntry(k, ${valExpr.replaceAll(ph, 'v')}))';
  }

  String _orToJson(List<MetaReference> items, String field, bool optional) {
    final nonNull = items
        .where((r) => !(r is BaseRef && r.name == 'null'))
        .toList();
    final hasNull = nonNull.length != items.length;

    if (nonNull.length == 1) {
      return _toJsonExpr(nonNull.first, field, optional || hasNull);
    }
    return field;
  }

  // ── Property flattening ───────────────────────────────────────────────────

  /// Collects all properties by traversing the extends/mixins chain.
  /// Properties from [struct]'s own list override inherited ones
  /// (naturally handles the `kind` conflict in CreateFile/RenameFile/DeleteFile).
  List<MetaProperty> _flattenProperties(MetaStructure struct) {
    final merged = <String, MetaProperty>{};

    // Collect inherited — extends first, then mixins (order matches LSP spec)
    for (final ref in struct.extends$) {
      if (ref case TypeRef(:final name)) {
        final parent = structsByName[name];
        if (parent != null) {
          for (final p in _flattenProperties(parent)) {
            merged[p.name] = p;
          }
        }
      }
    }
    for (final ref in struct.mixins$) {
      if (ref case TypeRef(:final name)) {
        final parent = structsByName[name];
        if (parent != null) {
          for (final p in _flattenProperties(parent)) {
            merged[p.name] = p;
          }
        }
      }
    }

    // Own properties override inherited.
    for (final p in struct.properties) {
      merged[p.name] = p;
    }

    return merged.values.toList()..sort((a, b) => a.name.compareTo(b.name));
  }

  // ── Name helpers ──────────────────────────────────────────────────────────

  String _dartName(String name) => dartName(name);

  static const _reservedWords = {
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'covariant',
    'default',
    'deferred',
    'do',
    'dynamic',
    'else',
    'enum',
    'export',
    'extends',
    'extension',
    'external',
    'factory',
    'false',
    'final',
    'finally',
    'for',
    'Function',
    'get',
    'hide',
    'if',
    'implements',
    'import',
    'in',
    'interface',
    'is',
    'late',
    'library',
    'macro',
    'mixin',
    'new',
    'null',
    'of',
    'on',
    'operator',
    'part',
    'required',
    'rethrow',
    'return',
    'sealed',
    'set',
    'show',
    'static',
    'super',
    'switch',
    'sync',
    'this',
    'throw',
    'true',
    'try',
    'typedef',
    'type',
    'var',
    'void',
    'when',
    'while',
    'with',
    'yield',
  };

  String _safeIdentifier(String name) =>
      _reservedWords.contains(name) ? '${name}_' : name;

  // ── Unused visitor methods ────────────────────────────────────────────────

  @override
  List<Spec> visitMetaData(MetaData data) => [];
  @override
  List<Spec> visitMetaRequest(MetaRequest request) => [];
  @override
  List<Spec> visitMetaNotification(MetaNotification notification) => [];
  @override
  List<Spec> visitMetaProperty(MetaProperty property) => [];
  @override
  List<Spec> visitMetaEnumMember(MetaEnumMember member) => [];
  @override
  List<Spec> visitMetaLiteral(MetaLiteral literal) => [];
  @override
  List<Spec> visitTypeRef(TypeRef ref) => [];
  @override
  List<Spec> visitArrayRef(ArrayRef ref) => [];
  @override
  List<Spec> visitBaseRef(BaseRef ref) => [];
  @override
  List<Spec> visitOrRef(OrRef ref) => [];
  @override
  List<Spec> visitAndRef(AndRef ref) => [];
  @override
  List<Spec> visitMapRef(MapRef ref) => [];
  @override
  List<Spec> visitLiteralRef(LiteralRef ref) => [];
  @override
  List<Spec> visitStringLiteralRef(StringLiteralRef ref) => [];
  @override
  List<Spec> visitTupleRef(TupleRef ref) => [];
}
