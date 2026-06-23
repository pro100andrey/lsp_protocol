import 'package:lsp_generator/src/generator/property_resolver.dart';
import 'package:lsp_generator/src/generator/union_classifier.dart';
import 'package:lsp_generator/src/models/resolved_decl.dart';
import 'package:lsp_generator/src/models/resolved_type.dart';
import 'package:test/test.dart';

ResolvedClass _cls(
  String name, {
  List<ResolvedProperty> properties = const [],
}) => ResolvedClass(name: name, properties: properties);

ResolvedProperty _prop(
  String name,
  ResolvedType type, {
  bool optional = false,
}) => ResolvedProperty(name: name, type: type, optional: optional);

const _string = DartCoreType(dartName: 'String');
const _int = DartCoreType(dartName: 'int');

void main() {
  final classifier = UnionClassifier(PropertyResolver());

  group('UnionClassifier.classifyUnion', () {
    test('only scalars → scalar', () {
      expect(
        classifier.classifyUnion(const UnionType(items: [_string, _int])),
        CodegenUnionKind.scalar,
      );
    });

    test('scalar + single struct shape → scalarStruct', () {
      final a = _cls('A');
      expect(
        classifier.classifyUnion(
          UnionType(
            items: [
              _string,
              ClassType(ref: a),
            ],
          ),
        ),
        CodegenUnionKind.scalarStruct,
      );
    });

    test('two distinct structs → structStruct', () {
      expect(
        classifier.classifyUnion(
          UnionType(
            items: [
              ClassType(ref: _cls('A')),
              ClassType(ref: _cls('B')),
            ],
          ),
        ),
        CodegenUnionKind.structStruct,
      );
    });

    test('list + struct → structList', () {
      expect(
        classifier.classifyUnion(
          UnionType(
            items: [
              const ListType(element: _string),
              ClassType(ref: _cls('A')),
            ],
          ),
        ),
        CodegenUnionKind.structList,
      );
    });

    test('contains a non-scalar/non-struct member → mixed', () {
      const en = ResolvedEnum(name: 'E', members: [], valueType: 'String');
      expect(
        classifier.classifyUnion(
          const UnionType(items: [_string, EnumType(ref: en)]),
        ),
        CodegenUnionKind.mixed,
      );
    });
  });

  group('UnionClassifier.findStructDiscriminator', () {
    test('discriminates two structs by a shared string-literal field', () {
      final a = _cls(
        'A',
        properties: [
          _prop('kind', const StringLiteralType(value: 'a')),
        ],
      );
      final b = _cls(
        'B',
        properties: [
          _prop('kind', const StringLiteralType(value: 'b')),
        ],
      );

      final checks = classifier.findStructDiscriminator([
        ClassType(ref: a),
        ClassType(ref: b),
      ]);

      expect(checks, isNotNull);
      expect(checks!.map((c) => c.fieldName), everyElement('kind'));
      expect(checks.map((c) => c.literalValue), ['a', 'b']);
    });

    test('returns null for fewer than two distinct variants', () {
      final a = _cls('A');
      expect(
        classifier.findStructDiscriminator([
          ClassType(ref: a),
          ClassType(ref: a),
        ]),
        isNull,
      );
    });
  });
}
