part of 'model_generator.dart';

extension ModelGeneratorSerialization on ModelGenerator {
  /// Builds a Dart expression string that constructs an inline record from a
  /// JSON map (e.g. `(delta: json['delta'] as bool?)`).
  String _inlineRecordFromJson(
    List<ResolvedProperty> fields,
    String jsonVar,
  ) {
    if (fields.isEmpty) {
      return '()';
    }

    final parts = fields
        .map(
          (f) =>
              '${f.name}: ${_jsonFieldExtract(
                f.type,
                "$jsonVar['${f.name}']",
                optional: f.optional,
              )}',
        )
        .join(', ');
    return '($parts)';
  }

  /// Builds a Dart expression string that serializes an inline record to a
  /// JSON map (e.g. `{'delta': value.delta}`).
  String _inlineRecordToJson(List<ResolvedProperty> fields, String valueVar) {
    if (fields.isEmpty) {
      return '<String, dynamic>{}';
    }

    final entries = fields.map((f) {
      final fieldAccess = '$valueVar.${f.name}';
      final jsonValue = _fieldToJsonExpr(f.type, fieldAccess);
      if (f.optional) {
        return "'${f.name}': ?$jsonValue";
      }
      return "'${f.name}': $jsonValue";
    });
    return '{${entries.join(', ')}}';
  }

  /// JSON→Dart cast/conversion for a single record field.
  ///
  /// [optional] treats the value as nullable whether or not [type] is already
  /// wrapped in [NullableType].
  String _jsonFieldExtract(
    ResolvedType type,
    String jsonExpr, {
    bool optional = false,
  }) {
    // Normalise: a type already wrapped in NullableType, or flagged optional,
    // is treated as nullable.
    final (inner, nullable) = switch (type) {
      NullableType(:final inner) => (inner, true),
      _ => (type, optional),
    };

    // Wraps [nonNullExpr] with a null-guard if [nullable].
    String orNull(String nonNullExpr) =>
        nullable ? '$jsonExpr != null ? $nonNullExpr : null' : nonNullExpr;

    return switch (inner) {
      DartCoreType(:final dartName)
          when const {'String', 'int', 'bool', 'double'}.contains(dartName) =>
        nullable ? '$jsonExpr as $dartName?' : '$jsonExpr as $dartName',
      ClassType(:final ref) => orNull(
        '${ref.name}.fromJson($jsonExpr as Map<String, dynamic>)',
      ),
      ListType(element: final el) => orNull(
        '($jsonExpr as List<dynamic>).map((e) => ${_jsonFieldExtract(
          el,
          'e',
        )}).toList()',
      ),
      InlineRecord(:final fields) => orNull(
        _inlineRecordFromJson(fields, '($jsonExpr as Map<String, dynamic>)'),
      ),
      EnumType(:final ref) when ref.supportsCustomValues => orNull(
        '${ref.name}.fromJson($jsonExpr)',
      ),
      EnumType(:final ref) => orNull(
        '${ref.name}.decode($jsonExpr as ${ref.valueType})!',
      ),
      _ => jsonExpr,
    };
  }

  /// Dart→JSON conversion for a single record field value.
  String _fieldToJsonExpr(ResolvedType type, String fieldExpr) {
    final (inner, nullable) = switch (type) {
      NullableType(:final inner) => (inner, true),
      _ => (type, false),
    };

    return switch (inner) {
      DartCoreType() => fieldExpr,
      ClassType() => nullable ? '$fieldExpr?.toJson()' : '$fieldExpr.toJson()',
      EnumType(:final ref) when ref.supportsCustomValues =>
        nullable ? '$fieldExpr?.toJson()' : '$fieldExpr.toJson()',
      EnumType() =>
        // closed enum — serialize via the value field
        nullable ? '$fieldExpr?.value' : '$fieldExpr.value',
      ListType(element: final el) =>
        nullable
            ? '$fieldExpr?.map((e) => ${_fieldToJsonExpr(el, 'e')}).toList()'
            : '$fieldExpr.map((e) => ${_fieldToJsonExpr(el, 'e')}).toList()',
      InlineRecord(:final fields) =>
        nullable
            ? '$fieldExpr != null ? ${_inlineRecordToJson(
                fields,
                fieldExpr,
              )} : null'
            : _inlineRecordToJson(fields, fieldExpr),
      _ => fieldExpr,
    };
  }
}
