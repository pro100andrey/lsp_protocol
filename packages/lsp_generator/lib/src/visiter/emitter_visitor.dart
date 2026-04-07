import 'package:code_builder/code_builder.dart';

import '../redux/models/resolved_decl.dart';
import '../redux/models/resolved_type.dart';
import '../redux/resolved/resolved_state.dart';
import 'type_reference.dart';

/// Builds code_builder [Library] objects from a fully resolved [ResolvedState].
///
/// Each [Library] can be emitted to a Dart source string via [DartEmitter].
final class EmitterVisitor {
  EmitterVisitor(this._resolved);

  final ResolvedState _resolved;

  static const _header = 'GENERATED — do not edit.';

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Builds a [Library] containing all resolved classes (anonymous first).
  Library buildStructures() {
    final anonymous = _resolved.classes.where((c) => c.isAnonymous);
    final named = _resolved.classes.where((c) => !c.isAnonymous);

    return Library(
      (b) => b
        ..comments.add(_header)
        ..body.addAll([
          ...anonymous.map(_buildClass),
          ...named.map(_buildClass),
        ]),
    );
  }

  /// Builds a [Library] containing all resolved enumerations.
  Library buildEnumerations() => Library(
    (b) => b
      ..comments.add(_header)
      ..body.addAll(_resolved.enumerations.map(_buildEnum)),
  );

  /// Builds a [Library] containing all resolved type aliases.
  Library buildAliases() => Library(
    (b) => b
      ..comments.add(_header)
      ..body.addAll(_resolved.aliases.map(_buildAlias)),
  );

  // ---------------------------------------------------------------------------
  // Class builder
  // ---------------------------------------------------------------------------

  Spec _buildClass(ResolvedClass cls) => Class((b) {
    b
      ..name = cls.name
      ..modifier = ClassModifier.final$;

    if (cls.documentation != null) {
      b.docs.add('/// ${cls.documentation!.replaceAll('\n', '\n/// ')}');
    }

    // extends / with
    if (cls.extends$.isNotEmpty && cls.extends$.first is ClassType) {
      b.extend = toTypeRef(cls.extends$.first);
    }
    for (final mixin in cls.mixins$) {
      b.mixins.add(toTypeRef(mixin));
    }

    // Fields
    for (final prop in cls.properties) {
      b.fields.add(_buildField(prop));
    }

    // Constructor
    b.constructors.add(_buildConstructor(cls));

    // copyWith
    if (cls.properties.isNotEmpty) {
      b.methods.add(_buildCopyWith(cls));
    }

    // fromJson
    b.constructors.add(_buildFromJson(cls));

    // toJson
    b.methods.add(_buildToJson(cls));
  });

  Field _buildField(ResolvedProperty prop) {
    final type = prop.optional
        ? toTypeRef(prop.type).rebuild((b) => b.isNullable = true)
        : toTypeRef(prop.type);
    return Field(
      (b) => b
        ..name = prop.name
        ..type = type
        ..modifier = FieldModifier.final$,
    );
  }

  Constructor _buildConstructor(ResolvedClass cls) => Constructor(
    (b) => b
      ..constant = true
      ..optionalParameters.addAll(
        cls.properties.map(
          (p) => Parameter(
            (b) => b
              ..name = p.name
              ..toThis = true
              ..named = true
              ..required = !p.optional,
          ),
        ),
      ),
  );

  Method _buildCopyWith(ResolvedClass cls) {
    // Build the parameter list and the constructor call arguments.
    final params = <Parameter>[];
    final args = <String, Expression>{};

    for (final prop in cls.properties) {
      final baseRef = toTypeRef(prop.type);
      // copyWith param is always nullable so callers can omit it.
      final paramType = baseRef.rebuild((b) => b.isNullable = true);

      params.add(
        Parameter(
          (b) => b
            ..name = prop.name
            ..type = paramType
            ..named = true,
        ),
      );

      // value = param ?? this.prop
      args[prop.name] = CodeExpression(
        Code('${prop.name} ?? this.${prop.name}'),
      );
    }

    return Method(
      (b) => b
        ..name = 'copyWith'
        ..returns = refer(cls.name)
        ..optionalParameters.addAll(params)
        ..body = refer(cls.name).call([], args).code,
    );
  }

  Constructor _buildFromJson(ResolvedClass cls) {
    final args = <String, Expression>{};
    for (final prop in cls.properties) {
      args[prop.name] = CodeExpression(
        Code(_fromJsonCode(prop.name, prop.type, prop.optional)),
      );
    }

    return Constructor(
      (b) => b
        ..name = 'fromJson'
        ..factory = true
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..name = 'json'
              ..type = TypeReference(
                (b) => b
                  ..symbol = 'Map'
                  ..types.addAll([refer('String'), refer('Object?')]),
              ),
          ),
        )
        ..body = refer(cls.name).call([], args).code,
    );
  }

  /// Returns a Dart expression string that reads and casts `json['name']`
  /// to the appropriate Dart type.
  String _fromJsonCode(
    String name,
    ResolvedType type,
    bool optional,
  ) => switch (type) {
    NullableType(:final inner) => _fromJsonCode(name, inner, true),
    ClassType(:final ref) when optional =>
      "json['$name'] == null ? null : ${ref.name}.fromJson(json['$name'] as Map<String, Object?>)",
    ClassType(:final ref) =>
      "${ref.name}.fromJson(json['$name'] as Map<String, Object?>)",
    MapType(value: final value) when optional =>
      "(json['$name'] as Map<String, Object?>?)?.map((k, v) => MapEntry(k, ${_mapValueCast(value)}))",
    MapType(value: final value) =>
      "(json['$name'] as Map<String, Object?>).map((k, v) => MapEntry(k, ${_mapValueCast(value)}))",
    ListType(:final element) when optional =>
      "(json['$name'] as List<Object?>?)?.map((e) => ${_listElementCast(element)}).toList()",
    ListType(:final element) =>
      "(json['$name'] as List<Object?>).map((e) => ${_listElementCast(element)}).toList()",
    EnumType(:final ref) when !ref.supportsCustomValues && optional =>
      "json['$name'] == null ? null : ${ref.name}.values.firstWhere((e) => e.value == json['$name'] as ${ref.valueType})",
    EnumType(:final ref) when !ref.supportsCustomValues =>
      "${ref.name}.values.firstWhere((e) => e.value == json['$name'] as ${ref.valueType})",
    EnumType(:final ref) when optional =>
      "json['$name'] == null ? null : ${ref.name}(json['$name'] as ${ref.valueType})",
    EnumType(:final ref) => "${ref.name}(json['$name'] as ${ref.valueType})",
    _ =>
      optional
          ? "json['$name'] as ${_dartTypeName(type)}?"
          : "json['$name'] as ${_dartTypeName(type)}",
  };

  /// Returns the Dart type name string for a resolved type, used in string
  /// interpolation contexts (e.g. inside `Code('...')` bodies).
  String _dartTypeName(ResolvedType type) => switch (type) {
    DartCoreType(:final dartName) => dartName,
    ClassType(:final ref) => ref.name,
    EnumType(:final ref) => ref.name,
    AliasType(:final ref) => ref.name,
    ListType(:final element) => 'List<${_dartTypeName(element)}>',
    MapType(:final key, :final value) =>
      'Map<${_dartTypeName(key)}, ${_dartTypeName(value)}>',
    NullableType(:final inner) => '${_dartTypeName(inner)}?',
    UnionType() => 'Object',
    TupleType() => 'List<Object?>',
    StringLiteralType() => 'String',
  };

  String _listElementCast(ResolvedType element) => switch (element) {
    ClassType(:final ref) => '${ref.name}.fromJson(e as Map<String, Object?>)',
    NullableType(inner: ClassType(:final ref)) =>
      'e == null ? null : ${ref.name}.fromJson(e as Map<String, Object?>)',
    _ => 'e as ${_dartTypeName(element)}',
  };

  String _mapValueCast(ResolvedType value) => switch (value) {
    ClassType(:final ref) => '${ref.name}.fromJson(v as Map<String, Object?>)',
    NullableType(inner: ClassType(:final ref)) =>
      'v == null ? null : ${ref.name}.fromJson(v as Map<String, Object?>)',
    _ => 'v as ${_dartTypeName(value)}',
  };

  Method _buildToJson(ResolvedClass cls) {
    final entries = <Object?, Object?>{};
    for (final prop in cls.properties) {
      entries[literalString(prop.name)] = _toJsonExpr(prop);
    }

    return Method(
      (b) => b
        ..name = 'toJson'
        ..returns = TypeReference(
          (b) => b
            ..symbol = 'Map'
            ..types.addAll([refer('String'), refer('Object?')]),
        )
        ..body = literalMap(
          entries,
          refer('String'),
          refer('Object?'),
        ).returned.statement,
    );
  }

  Expression _toJsonExpr(ResolvedProperty prop) => switch (prop.type) {
    NullableType(inner: ClassType()) => CodeExpression(
      Code('${prop.name}?.toJson()'),
    ),
    ClassType() => CodeExpression(Code('${prop.name}.toJson()')),
    NullableType(inner: ListType(element: ClassType())) => CodeExpression(
      Code('${prop.name}?.map((e) => e.toJson()).toList()'),
    ),
    ListType(element: ClassType()) => CodeExpression(
      Code('${prop.name}.map((e) => e.toJson()).toList()'),
    ),
    NullableType(inner: EnumType()) => CodeExpression(
      Code('${prop.name}?.value'),
    ),
    EnumType() => CodeExpression(Code('${prop.name}.value')),
    _ => CodeExpression(Code(prop.name)),
  };

  // ---------------------------------------------------------------------------
  // Enum builder
  // ---------------------------------------------------------------------------

  Spec _buildEnum(ResolvedEnum en) {
    if (en.supportsCustomValues) {
      return _buildEnumAsClass(en);
    }
    return _buildDartEnum(en);
  }

  /// Dart native `enum` for enums without custom values.
  Spec _buildDartEnum(ResolvedEnum en) {
    final valueType = en.valueType == 'int' ? refer('int') : refer('String');

    return Enum((b) {
      b.name = en.name;

      if (en.documentation != null) {
        b.docs.add('/// ${en.documentation!.replaceAll('\n', '\n/// ')}');
      }

      // Constructor with `value` param
      b.constructors.add(
        Constructor(
          (b) => b
            ..constant = true
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'value'
                  ..toThis = true,
              ),
            ),
        ),
      );

      // `final Type value` field
      b.fields.add(
        Field(
          (b) => b
            ..name = 'value'
            ..type = valueType
            ..modifier = FieldModifier.final$,
        ),
      );

      // Enum values
      for (final member in en.members) {
        b.values.add(
          EnumValue((b) {
            b.name = _safeIdentifier(member.name);
            if (en.valueType == 'int') {
              b.arguments.add(literalNum(int.parse(member.value)));
            } else {
              b.arguments.add(literalString(member.value));
            }
            if (member.documentation != null) {
              b.docs.add(
                '/// ${member.documentation!.replaceAll('\n', '\n/// ')}',
              );
            }
          }),
        );
      }
    });
  }

  /// `final class` for enums that support custom values (open-ended).
  Spec _buildEnumAsClass(ResolvedEnum en) {
    final valueType = en.valueType == 'int' ? refer('int') : refer('String');

    return Class((b) {
      b
        ..name = en.name
        ..modifier = ClassModifier.final$;

      if (en.documentation != null) {
        b.docs.add('/// ${en.documentation!.replaceAll('\n', '\n/// ')}');
      }

      // const constructor
      b.constructors.add(
        Constructor(
          (b) => b
            ..constant = true
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'value'
                  ..toThis = true,
              ),
            ),
        ),
      );

      // final value field
      b.fields.add(
        Field(
          (b) => b
            ..name = 'value'
            ..type = valueType
            ..modifier = FieldModifier.final$,
        ),
      );

      // static const members
      for (final member in en.members) {
        final init = en.valueType == 'int'
            ? refer(en.name).call([literalNum(int.parse(member.value))])
            : refer(en.name).call([literalString(member.value)]);

        b.fields.add(
          Field((b) {
            b
              ..name = _safeIdentifier(member.name)
              ..type = refer(en.name)
              ..static = true
              ..modifier = FieldModifier.constant
              ..assignment = init.code;
            if (member.documentation != null) {
              b.docs.add(
                '/// ${member.documentation!.replaceAll('\n', '\n/// ')}',
              );
            }
          }),
        );
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Alias builder
  // ---------------------------------------------------------------------------

  Spec _buildAlias(ResolvedAlias alias) => TypeDef(
    (b) => b
      ..name = alias.name
      ..definition = toTypeRef(alias.type),
  );

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Ensures an identifier is valid Dart (e.g. avoids reserved words).
  static String _safeIdentifier(String name) {
    const reserved = {
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
      'type',
      'typedef',
      'var',
      'void',
      'when',
      'while',
      'with',
      'yield',
    };
    return reserved.contains(name) ? '${name}_' : name;
  }
}
