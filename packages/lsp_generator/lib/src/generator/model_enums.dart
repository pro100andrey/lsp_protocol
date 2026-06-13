part of 'model_generator.dart';

extension ModelGeneratorEnums on ModelGenerator {
  /// Generates a standard Dart enum for closed enums, or a Dart
  /// `extension type` wrapping the underlying primitive value for open
  /// enums (`supportsCustomValues = true`).
  Spec _buildEnum(ResolvedEnum en) {
    final isInt = en.valueType == 'int';
    final valueTypeName = isInt ? 'int' : 'String';

    if (en.supportsCustomValues) {
      return ExtensionType((b) {
        b
          ..name = en.name
          ..constant = true
          ..representationDeclaration = .new(
            (r) => r
              ..name = 'value'
              ..declaredRepresentationType = refer(valueTypeName),
          )
          ..docs.addAll(
            _docLines(en.documentation, since: en.since, proposed: en.proposed),
          );

        // static const values
        for (final member in en.members) {
          b.fields.add(
            Field(
              (b) => b
                ..static = true
                ..modifier = .constant
                ..name = safeIdentifier(toLowerCamelCase(member.name))
                ..assignment = refer(en.name).call([
                  if (isInt)
                    literalNum(int.parse(member.value))
                  else
                    literalString(member.value),
                ]).code
                ..docs.addAll(
                  _docLines(
                    member.documentation,
                    since: member.since,
                    indent: 2,
                  ),
                ),
            ),
          );
        }

        // fromJson constructor
        b.constructors.add(
          .new(
            (b) => b
              ..factory = true
              ..name = 'fromJson'
              ..requiredParameters.add(
                .new(
                  (b) => b
                    ..name = 'json'
                    ..type = tDynamic,
                ),
              )
              ..body = refer(en.name).call([
                CodeExpression(Code('json as $valueTypeName')),
              ]).code,
          ),
        );

        // toJson method
        b.methods.add(_buildEnumToJson(valueTypeName, eValue));
      });
    }

    return Enum((b) {
      b
        ..name = en.name
        ..annotations.add(
          tJsonEnum.call([], {
            'valueField': literalString('value'),
            'alwaysCreate': literalTrue,
          }),
        )
        ..docs.addAll(
          _docLines(en.documentation, since: en.since, proposed: en.proposed),
        );

      for (final member in en.members) {
        b.values.add(
          .new((b) {
            b.name = safeIdentifier(toLowerCamelCase(member.name));
            b.arguments.add(
              isInt
                  ? literalNum(int.parse(member.value))
                  : literalString(member.value),
            );
            if (member.deprecated != null) {
              b.annotations.add(
                tDeprecated.call([literalString(member.deprecated!)]),
              );
            }
            b.docs.addAll(
              _docLines(
                member.documentation,
                since: member.since,
                indent: 2,
              ),
            );
          }),
        );
      }

      // final T value field.
      b.fields.add(
        .new(
          (b) => b
            ..modifier = .final$
            ..name = 'value'
            ..type = refer(valueTypeName),
        ),
      );

      // const constructor accepting the raw wire value.
      b.constructors.add(_buildEnumConstructor());

      // static decode — returns null for unknown values.
      b.methods.add(
        .new(
          (b) => b
            ..static = true
            ..returns = TypeReference(
              (b) => b
                ..symbol = en.name
                ..isNullable = true,
            )
            ..name = 'decode'
            ..requiredParameters.add(
              .new(
                (b) => b
                  ..name = 'json'
                  ..type = refer(valueTypeName),
              ),
            )
            ..lambda = true
            ..body = refer(r'$enumDecodeNullable').call([
              refer('_\$${en.name}EnumMap'),
              eJson,
            ]).code,
        ),
      );
    });
  }

  Constructor _buildEnumConstructor() => .new(
    (b) => b
      ..constant = true
      ..requiredParameters.add(
        .new(
          (b) => b
            ..name = 'value'
            ..toThis = true,
        ),
      ),
  );

  Method _buildEnumToJson(String valueTypeName, Expression expr) => .new(
    (b) => b
      ..name = 'toJson'
      ..returns = refer(valueTypeName)
      ..lambda = true
      ..body = expr.code,
  );
}
