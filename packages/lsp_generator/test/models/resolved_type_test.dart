import 'package:lsp_generator/src/models/resolved_decl.dart';
import 'package:lsp_generator/src/models/resolved_type.dart';
import 'package:test/test.dart';

const _string = DartCoreType(dartName: 'String');
const _nullCore = DartCoreType(dartName: 'Null');

void main() {
  group('ResolvedType.containsNull', () {
    test('NullableType admits null', () {
      expect(const NullableType(inner: _string).containsNull, isTrue);
    });

    test('UnionType with a Null member admits null', () {
      expect(
        const UnionType(items: [_string, _nullCore]).containsNull,
        isTrue,
      );
    });

    test('UnionType without a Null member does not', () {
      expect(
        const UnionType(
          items: [
            _string,
            DartCoreType(dartName: 'int'),
          ],
        ).containsNull,
        isFalse,
      );
    });

    test('nullable DartCoreType (Object?) admits null', () {
      expect(const DartCoreType(dartName: 'Object?').containsNull, isTrue);
    });

    test('plain DartCoreType does not', () {
      expect(_string.containsNull, isFalse);
    });

    test('a class reference does not', () {
      final cls = ResolvedClass(name: 'Foo', properties: []);
      expect(ClassType(ref: cls).containsNull, isFalse);
    });
  });
}
