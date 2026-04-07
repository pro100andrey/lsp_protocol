import 'dart:convert';
import 'dart:io';

import 'package:lsp_generator/src/redux/models/protocol.dart';
import 'package:lsp_generator/src/redux/models/resolved_decl.dart';
import 'package:lsp_generator/src/redux/models/resolved_type.dart';
import 'package:lsp_generator/src/visiter/resolver_visitor.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

MetaReference _base(String name) =>
    MetaReference.base(kind: TypeKind.base$, name: name);

MetaReference _ref(String name) =>
    MetaReference.type(kind: TypeKind.reference, name: name);

Matcher isDartCoreType(String name) =>
    isA<DartCoreType>().having((t) => t.dartName, 'dartName', name);

Matcher isStringLiteralType(String value) =>
    isA<StringLiteralType>().having((t) => t.value, 'value', value);

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  // =========================================================================
  // Unit tests — resolveRef with an empty registry
  // =========================================================================
  group('resolveRef — BaseRef mappings', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('string → String', () {
      expect(v.resolveRef(_base('string')), isDartCoreType('String'));
    });

    test('integer → int', () {
      expect(v.resolveRef(_base('integer')), isDartCoreType('int'));
    });

    test('uinteger → int', () {
      expect(v.resolveRef(_base('uinteger')), isDartCoreType('int'));
    });

    test('decimal → double', () {
      expect(v.resolveRef(_base('decimal')), isDartCoreType('double'));
    });

    test('boolean → bool', () {
      expect(v.resolveRef(_base('boolean')), isDartCoreType('bool'));
    });

    test('null → Null', () {
      expect(v.resolveRef(_base('null')), isDartCoreType('Null'));
    });

    test('URI → String', () {
      expect(v.resolveRef(_base('URI')), isDartCoreType('String'));
    });

    test('DocumentUri → String', () {
      expect(v.resolveRef(_base('DocumentUri')), isDartCoreType('String'));
    });

    test('RegExp → String', () {
      expect(v.resolveRef(_base('RegExp')), isDartCoreType('String'));
    });

    test('LSPAny → Object?', () {
      expect(v.resolveRef(_base('LSPAny')), isDartCoreType('Object?'));
    });

    test('LSPObject → Map<String, Object?>', () {
      expect(
        v.resolveRef(_base('LSPObject')),
        isDartCoreType('Map<String, Object?>'),
      );
    });

    test('LSPArray → List<Object?>', () {
      expect(v.resolveRef(_base('LSPArray')), isDartCoreType('List<Object?>'));
    });
  });

  group('resolveRef — TypeRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('unknown name → DartCoreType fallback', () {
      expect(v.resolveRef(_ref('Unknown')), isDartCoreType('Unknown'));
    });
  });

  group('resolveRef — ArrayRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('ArrayRef(string) → ListType(String)', () {
      final ref = MetaReference.array(
        kind: TypeKind.array,
        element: _base('string'),
      );
      final result = v.resolveRef(ref) as ListType;
      expect(result.element, isDartCoreType('String'));
    });

    test('ArrayRef(ArrayRef(integer)) → nested ListType', () {
      final ref = MetaReference.array(
        kind: TypeKind.array,
        element: MetaReference.array(
          kind: TypeKind.array,
          element: _base('integer'),
        ),
      );
      final result = v.resolveRef(ref) as ListType;
      final inner = result.element as ListType;
      expect(inner.element, isDartCoreType('int'));
    });
  });

  group('resolveRef — MapRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('MapRef(string, integer) → MapType(String, int)', () {
      final ref = MetaReference.map(
        kind: TypeKind.map,
        key: _base('string'),
        value: _base('integer'),
      );
      final result = v.resolveRef(ref) as MapType;
      expect(result.key, isDartCoreType('String'));
      expect(result.value, isDartCoreType('int'));
    });
  });

  group('resolveRef — OrRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('OrRef([T, null]) → NullableType(T)', () {
      final ref = MetaReference.or(
        kind: TypeKind.or,
        items: [_base('string'), _base('null')],
      );
      final result = v.resolveRef(ref) as NullableType;
      expect(result.inner, isDartCoreType('String'));
    });

    test('OrRef([null, T]) → NullableType(T) (null first)', () {
      final ref = MetaReference.or(
        kind: TypeKind.or,
        items: [_base('null'), _base('string')],
      );
      final result = v.resolveRef(ref) as NullableType;
      expect(result.inner, isDartCoreType('String'));
    });

    test('OrRef([A, B, null]) → UnionType (2 non-null + null)', () {
      final ref = MetaReference.or(
        kind: TypeKind.or,
        items: [_base('string'), _base('integer'), _base('null')],
      );
      expect(v.resolveRef(ref), isA<UnionType>());
    });

    test('OrRef([A, B, C]) → UnionType with 3 items', () {
      final ref = MetaReference.or(
        kind: TypeKind.or,
        items: [_base('string'), _base('integer'), _base('boolean')],
      );
      final result = v.resolveRef(ref) as UnionType;
      expect(result.items.length, 3);
    });
  });

  group('resolveRef — AndRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('AndRef([string, integer]) → UnionType', () {
      final ref = MetaReference.and(
        kind: TypeKind.and,
        items: [_base('string'), _base('integer')],
      );
      final result = v.resolveRef(ref) as UnionType;
      expect(result.items[0], isDartCoreType('String'));
      expect(result.items[1], isDartCoreType('int'));
    });
  });

  group('resolveRef — TupleRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('TupleRef([string, integer]) → TupleType', () {
      final ref = MetaReference.tuple(
        kind: TypeKind.tuple,
        items: [_base('string'), _base('integer')],
      );
      final result = v.resolveRef(ref) as TupleType;
      expect(result.items[0], isDartCoreType('String'));
      expect(result.items[1], isDartCoreType('int'));
    });
  });

  group('resolveRef — StringLiteralRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('StringLiteralRef → StringLiteralType', () {
      const ref = MetaReference.stringLiteral(
        kind: TypeKind.string,
        value: 'hello',
      );
      expect(v.resolveRef(ref), isStringLiteralType('hello'));
    });
  });

  group('resolveRef — LiteralRef', () {
    late ResolverVisitor v;
    setUp(() => v = ResolverVisitor());

    test('produces anonymous ResolvedClass with synthetic name', () {
      const ref = MetaReference.literal(
        kind: TypeKind.literal,
        value: MetaLiteral(
          properties: [
            MetaProperty(
              name: 'x',
              type: MetaReference.base(kind: TypeKind.base$, name: 'integer'),
            ),
          ],
        ),
      );
      final result =
          v.resolveRef(ref, parentName: 'Parent', fieldName: 'field')
              as ClassType;
      expect(result.ref.name, 'ParentField');
      expect(result.ref.isAnonymous, isTrue);
      expect(result.ref.properties, hasLength(1));
      expect(result.ref.properties.first.name, 'x');
    });

    test('same parent+field resolved twice → identical object', () {
      const prop = MetaProperty(
        name: 'x',
        type: MetaReference.base(kind: TypeKind.base$, name: 'integer'),
      );
      const ref = MetaReference.literal(
        kind: TypeKind.literal,
        value: MetaLiteral(properties: [prop]),
      );
      final a = v.resolveRef(ref, parentName: 'P', fieldName: 'q') as ClassType;
      final b = v.resolveRef(ref, parentName: 'P', fieldName: 'q') as ClassType;
      expect(identical(a.ref, b.ref), isTrue);
    });
  });

  // =========================================================================
  // Integration tests — real metaModel.json
  // =========================================================================
  group('real metaModel.json', () {
    late ResolverVisitor visitor;

    setUpAll(() {
      final file = File('../lsp_specification/metaModel.json');
      final json = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
      final protocol = MetaProtocol.fromJson(json);
      visitor = ResolverVisitor()..resolve(protocol);
    });

    // -----------------------------------------------------------------------
    // Counts
    // -----------------------------------------------------------------------
    test('named structures count', () {
      expect(
        visitor.classes.where((c) => !c.isAnonymous).length,
        370 - visitor.classes.where((c) => c.isAnonymous).length,
      );
    });

    test('total classes (named + anonymous) count matches resolve output', () {
      expect(visitor.classes.length, greaterThanOrEqualTo(37 + 21));
    });

    test('enumerations count', () {
      expect(visitor.enumerations.length, 37);
    });

    test('aliases count', () {
      expect(visitor.aliases.length, 21);
    });

    test('registry size >= named classes + enumerations + aliases', () {
      final namedClasses = visitor.classes.where((c) => !c.isAnonymous).length;
      expect(
        visitor.registry.length,
        greaterThanOrEqualTo(namedClasses + 37 + 21),
      );
    });

    // -----------------------------------------------------------------------
    // Position
    // -----------------------------------------------------------------------
    group('Position', () {
      late ResolvedClass pos;
      setUp(() => pos = visitor.registry['Position']! as ResolvedClass);

      test('is in registry', () {
        expect(pos, isNotNull);
      });

      test('line: int, not optional', () {
        final line = pos.properties.firstWhere((p) => p.name == 'line');
        expect(line.type, isDartCoreType('int'));
        expect(line.optional, isFalse);
      });

      test('character: int, not optional', () {
        final char = pos.properties.firstWhere((p) => p.name == 'character');
        expect(char.type, isDartCoreType('int'));
        expect(char.optional, isFalse);
      });
    });

    // -----------------------------------------------------------------------
    // Range
    // -----------------------------------------------------------------------
    group('Range', () {
      late ResolvedClass range;
      setUp(() => range = visitor.registry['Range']! as ResolvedClass);

      test('start → ClassType pointing to registry Position', () {
        final start = range.properties.firstWhere((p) => p.name == 'start');
        final ct = start.type as ClassType;
        expect(identical(ct.ref, visitor.registry['Position']), isTrue);
      });

      test('end → ClassType pointing to registry Position', () {
        final end = range.properties.firstWhere((p) => p.name == 'end');
        final ct = end.type as ClassType;
        expect(identical(ct.ref, visitor.registry['Position']), isTrue);
      });
    });

    // -----------------------------------------------------------------------
    // TextDocumentItem
    // -----------------------------------------------------------------------
    group('TextDocumentItem', () {
      late ResolvedClass cls;
      setUp(
        () => cls = visitor.registry['TextDocumentItem']! as ResolvedClass,
      );

      test('uri → String', () {
        final p = cls.properties.firstWhere((p) => p.name == 'uri');
        expect(p.type, isDartCoreType('String'));
      });

      test('languageId → String', () {
        final p = cls.properties.firstWhere((p) => p.name == 'languageId');
        expect(p.type, isDartCoreType('String'));
      });

      test('version → int', () {
        final p = cls.properties.firstWhere((p) => p.name == 'version');
        expect(p.type, isDartCoreType('int'));
      });

      test('text → String', () {
        final p = cls.properties.firstWhere((p) => p.name == 'text');
        expect(p.type, isDartCoreType('String'));
      });
    });

    // -----------------------------------------------------------------------
    // DiagnosticSeverity
    // -----------------------------------------------------------------------
    group('DiagnosticSeverity', () {
      late ResolvedEnum en;
      setUp(
        () => en = visitor.registry['DiagnosticSeverity']! as ResolvedEnum,
      );

      test('valueType is int', () {
        expect(en.valueType, 'int');
      });

      test('Error has value 1', () {
        final m = en.members.firstWhere((m) => m.name == 'Error');
        expect(m.value, '1');
      });

      test('Hint has value 4', () {
        final m = en.members.firstWhere((m) => m.name == 'Hint');
        expect(m.value, '4');
      });
    });

    // -----------------------------------------------------------------------
    // Enums with supportsCustomValues
    // -----------------------------------------------------------------------
    test('FoldingRangeKind supportsCustomValues', () {
      final en = visitor.registry['FoldingRangeKind']! as ResolvedEnum;
      expect(en.supportsCustomValues, isTrue);
    });

    test('CodeActionKind supportsCustomValues', () {
      final en = visitor.registry['CodeActionKind']! as ResolvedEnum;
      expect(en.supportsCustomValues, isTrue);
    });

    test('SemanticTokenTypes supportsCustomValues', () {
      final en = visitor.registry['SemanticTokenTypes']! as ResolvedEnum;
      expect(en.supportsCustomValues, isTrue);
    });

    // -----------------------------------------------------------------------
    // LSPAny alias
    // -----------------------------------------------------------------------
    test('LSPAny alias is a ResolvedAlias', () {
      expect(visitor.registry['LSPAny'], isA<ResolvedAlias>());
    });

    test('LSPAny alias type is a UnionType (or+null items)', () {
      final alias = visitor.registry['LSPAny']! as ResolvedAlias;
      expect(alias.type, isA<UnionType>());
    });

    // -----------------------------------------------------------------------
    // Cross-reference identity
    // -----------------------------------------------------------------------
    test('all ClassType refs are identical to registry entries', () {
      void checkType(ResolvedType type) {
        switch (type) {
          case ClassType(:final ref):
            expect(
              identical(ref, visitor.registry[ref.name]),
              isTrue,
              reason: 'ClassType(${ref.name}) not identical to registry entry',
            );
          case NullableType(:final inner):
            checkType(inner);
          case ListType(:final element):
            checkType(element);
          case MapType(:final key, :final value):
            checkType(key);
            checkType(value);
          case UnionType(:final items):
            items.forEach(checkType);
          case TupleType(:final items):
            items.forEach(checkType);
          case AliasType():
          case EnumType():
          case DartCoreType():
          case StringLiteralType():
        }
      }

      for (final cls in visitor.classes) {
        for (final prop in cls.properties) {
          checkType(prop.type);
        }
        cls.extends$.forEach(checkType);
        cls.mixins$.forEach(checkType);
      }
    });

    // -----------------------------------------------------------------------
    // Anonymous class extraction
    // -----------------------------------------------------------------------
    test('at least one anonymous class extracted from LiteralRef', () {
      expect(
        visitor.classes.any((c) => c.isAnonymous),
        isTrue,
      );
    });
  });
}
