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

ResolvedAlias _alias(String name) =>
    ResolvedAlias(name: name, type: const DartCoreType('String'));

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  group('toTypeRef — DartCoreType', () {
    test('String', () {
      expect(_emit(toTypeRef(const DartCoreType('String'))), equals('String'));
    });

    test('int', () {
      expect(_emit(toTypeRef(const DartCoreType('int'))), equals('int'));
    });

    test('double', () {
      expect(_emit(toTypeRef(const DartCoreType('double'))), equals('double'));
    });

    test('bool', () {
      expect(_emit(toTypeRef(const DartCoreType('bool'))), equals('bool'));
    });

    test('Null', () {
      expect(_emit(toTypeRef(const DartCoreType('Null'))), equals('Null'));
    });

    test('Uri', () {
      expect(_emit(toTypeRef(const DartCoreType('Uri'))), equals('Uri'));
    });

    test('Object? (LSPAny mapping)', () {
      expect(
        _emit(toTypeRef(const DartCoreType('Object?'))),
        equals('Object?'),
      );
    });

    test('Map<String, Object?> (LSPObject mapping)', () {
      expect(
        _emit(toTypeRef(const DartCoreType('Map<String, Object?>'))),
        equals('Map<String,Object?>'),
      );
    });

    test('List<Object?> (LSPArray mapping)', () {
      expect(
        _emit(toTypeRef(const DartCoreType('List<Object?>'))),
        equals('List<Object?>'),
      );
    });

    test('unknown name falls through to plain refer', () {
      expect(
        _emit(toTypeRef(const DartCoreType('CustomType'))),
        equals('CustomType'),
      );
    });
  });

  group('toTypeRef — ClassType', () {
    test('emits class name', () {
      expect(_emit(toTypeRef(ClassType(_cls('Position')))), equals('Position'));
    });
  });

  group('toTypeRef — EnumType', () {
    test('emits enum name', () {
      expect(
        _emit(toTypeRef(EnumType(_enum('DiagnosticSeverity')))),
        equals('DiagnosticSeverity'),
      );
    });
  });

  group('toTypeRef — AliasType', () {
    test('emits alias name', () {
      expect(
        _emit(toTypeRef(AliasType(_alias('DocumentUri')))),
        equals('DocumentUri'),
      );
    });
  });

  group('toTypeRef — ListType', () {
    test('List<String>', () {
      expect(
        _emit(toTypeRef(const ListType(DartCoreType('String')))),
        equals('List<String>'),
      );
    });

    test('List<int>', () {
      expect(
        _emit(toTypeRef(const ListType(DartCoreType('int')))),
        equals('List<int>'),
      );
    });

    test('List<Position> (ClassType element)', () {
      expect(
        _emit(toTypeRef(ListType(ClassType(_cls('Position'))))),
        equals('List<Position>'),
      );
    });

    test('nested List<List<String>>', () {
      expect(
        _emit(toTypeRef(const ListType(ListType(DartCoreType('String'))))),
        equals('List<List<String>>'),
      );
    });
  });

  group('toTypeRef — MapType', () {
    test('Map<String, String>', () {
      expect(
        _emit(
          toTypeRef(
            const MapType(DartCoreType('String'), DartCoreType('String')),
          ),
        ),
        equals('Map<String,String>'),
      );
    });

    test('Map<String, Object?>', () {
      expect(
        _emit(
          toTypeRef(
            const MapType(DartCoreType('String'), DartCoreType('Object?')),
          ),
        ),
        equals('Map<String,Object?>'),
      );
    });
  });

  group('toTypeRef — NullableType', () {
    test('String?', () {
      expect(
        _emit(toTypeRef(const NullableType(DartCoreType('String')))),
        equals('String?'),
      );
    });

    test('int?', () {
      expect(
        _emit(toTypeRef(const NullableType(DartCoreType('int')))),
        equals('int?'),
      );
    });

    test('List<String>?', () {
      expect(
        _emit(
          toTypeRef(
            const NullableType(ListType(DartCoreType('String'))),
          ),
        ),
        equals('List<String>?'),
      );
    });

    test('Position? (ClassType wrapped)', () {
      expect(
        _emit(toTypeRef(NullableType(ClassType(_cls('Position'))))),
        equals('Position?'),
      );
    });
  });

  group('toTypeRef — UnionType', () {
    test('collapses to Object', () {
      expect(
        _emit(
          toTypeRef(
            const UnionType([
              DartCoreType('String'),
              DartCoreType('int'),
            ]),
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
            const TupleType([
              DartCoreType('int'),
              DartCoreType('String'),
            ]),
          ),
        ),
        equals('List<Object?>'),
      );
    });
  });

  group('toTypeRef — StringLiteralType', () {
    test('collapses to String', () {
      expect(
        _emit(toTypeRef(const StringLiteralType('snippet'))),
        equals('String'),
      );
    });
  });
}
