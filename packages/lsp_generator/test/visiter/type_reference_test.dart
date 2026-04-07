import 'package:code_builder/code_builder.dart';
import 'package:lsp_generator/src/redux/models/resolved_decl.dart';
import 'package:lsp_generator/src/redux/models/resolved_type.dart';
import 'package:lsp_generator/src/visiter/type_reference.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Emit a [TypeReference] back to a source string.
String _emit(TypeReference ref) {
  final emitter = DartEmitter.scoped(useNullSafetySyntax: true);
  return ref.accept(emitter).toString();
}

ResolvedClass _cls(String name) => ResolvedClass(name: name, properties: []);

ResolvedEnum _enum(String name, {bool supportsCustomValues = false}) =>
    ResolvedEnum(
      name: name,
      members: [],
      valueType: 'String',
      supportsCustomValues: supportsCustomValues,
    );

ResolvedAlias _alias(String name) => ResolvedAlias(
  name: name,
  type: DartCoreType(dartName: 'String'),
);

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  group('toTypeRef — DartCoreType', () {
    test('String', () {
      expect(
        _emit(toTypeRef(DartCoreType(dartName: 'String'))),
        equals('String'),
      );
    });

    test('int', () {
      expect(_emit(toTypeRef(DartCoreType(dartName: 'int'))), equals('int'));
    });

    test('double', () {
      expect(
        _emit(toTypeRef(DartCoreType(dartName: 'double'))),
        equals('double'),
      );
    });

    test('bool', () {
      expect(_emit(toTypeRef(DartCoreType(dartName: 'bool'))), equals('bool'));
    });

    test('Null', () {
      expect(_emit(toTypeRef(DartCoreType(dartName: 'Null'))), equals('Null'));
    });

    test('Uri', () {
      expect(_emit(toTypeRef(DartCoreType(dartName: 'Uri'))), equals('Uri'));
    });

    test('Object? (LSPAny mapping)', () {
      expect(
        _emit(toTypeRef(DartCoreType(dartName: 'Object?'))),
        equals('Object?'),
      );
    });

    test('Map<String, Object?> (LSPObject mapping)', () {
      expect(
        _emit(toTypeRef(DartCoreType(dartName: 'Map<String, Object?>'))),
        equals('Map<String,Object?>'),
      );
    });

    test('List<Object?> (LSPArray mapping)', () {
      expect(
        _emit(toTypeRef(DartCoreType(dartName: 'List<Object?>'))),
        equals('List<Object?>'),
      );
    });

    test('unknown name falls through to plain refer', () {
      expect(
        _emit(toTypeRef(DartCoreType(dartName: 'CustomType'))),
        equals('CustomType'),
      );
    });
  });

  group('toTypeRef — ClassType', () {
    test('emits class name', () {
      expect(
        _emit(toTypeRef(ClassType(ref: _cls('Position')))),
        equals('Position'),
      );
    });
  });

  group('toTypeRef — EnumType', () {
    test('emits enum name', () {
      expect(
        _emit(toTypeRef(EnumType(ref: _enum('DiagnosticSeverity')))),
        equals('DiagnosticSeverity'),
      );
    });
  });

  group('toTypeRef — AliasType', () {
    test('emits alias name', () {
      expect(
        _emit(toTypeRef(AliasType(ref: _alias('DocumentUri')))),
        equals('DocumentUri'),
      );
    });
  });

  group('toTypeRef — ListType', () {
    test('List<String>', () {
      expect(
        _emit(toTypeRef(ListType(element: DartCoreType(dartName: 'String')))),
        equals('List<String>'),
      );
    });

    test('List<int>', () {
      expect(
        _emit(toTypeRef(ListType(element: DartCoreType(dartName: 'int')))),
        equals('List<int>'),
      );
    });

    test('List<Position> (ClassType element)', () {
      expect(
        _emit(
          toTypeRef(ListType(element: ClassType(ref: _cls('Position')))),
        ),
        equals('List<Position>'),
      );
    });

    test('nested List<List<String>>', () {
      expect(
        _emit(
          toTypeRef(
            ListType(
              element: ListType(element: DartCoreType(dartName: 'String')),
            ),
          ),
        ),
        equals('List<List<String>>'),
      );
    });
  });

  group('toTypeRef — MapType', () {
    test('Map<String, String>', () {
      expect(
        _emit(
          toTypeRef(
            MapType(
              key: DartCoreType(dartName: 'String'),
              value: DartCoreType(dartName: 'String'),
            ),
          ),
        ),
        equals('Map<String,String>'),
      );
    });

    test('Map<String, Object?>', () {
      expect(
        _emit(
          toTypeRef(
            MapType(
              key: DartCoreType(dartName: 'String'),
              value: DartCoreType(dartName: 'Object?'),
            ),
          ),
        ),
        equals('Map<String,Object?>'),
      );
    });
  });

  group('toTypeRef — NullableType', () {
    test('String?', () {
      expect(
        _emit(
          toTypeRef(NullableType(inner: DartCoreType(dartName: 'String'))),
        ),
        equals('String?'),
      );
    });

    test('int?', () {
      expect(
        _emit(toTypeRef(NullableType(inner: DartCoreType(dartName: 'int')))),
        equals('int?'),
      );
    });

    test('List<String>?', () {
      expect(
        _emit(
          toTypeRef(
            NullableType(
              inner: ListType(element: DartCoreType(dartName: 'String')),
            ),
          ),
        ),
        equals('List<String>?'),
      );
    });

    test('Position? (ClassType wrapped)', () {
      expect(
        _emit(toTypeRef(NullableType(inner: ClassType(ref: _cls('Position'))))),
        equals('Position?'),
      );
    });
  });

  group('toTypeRef — UnionType', () {
    test('collapses to Object', () {
      expect(
        _emit(
          toTypeRef(
            UnionType(
              items: [
                DartCoreType(dartName: 'String'),
                DartCoreType(dartName: 'int'),
              ],
            ),
          ),
        ),
        equals('Object'),
      );
    });
  });

  group('toTypeRef — TupleType', () {
    test('collapses to List<Object?>', () {
      expect(
        _emit(
          toTypeRef(
            TupleType(
              items: [
                DartCoreType(dartName: 'int'),
                DartCoreType(dartName: 'String'),
              ],
            ),
          ),
        ),
        equals('List<Object?>'),
      );
    });
  });

  group('toTypeRef — StringLiteralType', () {
    test('collapses to String', () {
      expect(
        _emit(toTypeRef(StringLiteralType(value: 'snippet'))),
        equals('String'),
      );
    });
  });
}
