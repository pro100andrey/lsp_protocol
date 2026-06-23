import 'dart:convert';
import 'dart:io';

import 'package:lsp_generator/src/generator/resolver.dart';
import 'package:lsp_generator/src/models/protocol.dart';
import 'package:lsp_generator/src/models/resolved_decl.dart';
import 'package:lsp_generator/src/models/resolved_type.dart';
import 'package:test/test.dart';

// Helpers

MetaReference _base(String name) =>
    MetaReference.base(kind: TypeKind.base$, name: name);

MetaReference _ref(String name) =>
    MetaReference.type(kind: TypeKind.reference, name: name);

Matcher isDartCoreType(String name) =>
    isA<DartCoreType>().having((t) => t.dartName, 'dartName', name);

Matcher isStringLiteralType(String value) =>
    isA<StringLiteralType>().having((t) => t.value, 'value', value);

// Tests

void main() {
  // =========================================================================
  // Unit tests — resolveRef with an empty registry
  // =========================================================================
  group('resolveRef — BaseRef mappings', () {
    late ModelResolver v;
    setUp(() => v = ModelResolver());

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

    test('LSPObject → MapType', () {
      final res = v.resolveRef(_base('LSPObject')) as MapType;
      expect(res.key, isDartCoreType('String'));
      expect(res.value, isDartCoreType('Object?'));
    });

    test('LSPArray → ListType', () {
      final res = v.resolveRef(_base('LSPArray')) as ListType;
      expect(res.element, isDartCoreType('Object?'));
    });
  });

  group('resolveRef — TypeRef', () {
    late ModelResolver v;
    setUp(() => v = ModelResolver());

    test('unknown name → DartCoreType fallback', () {
      expect(v.resolveRef(_ref('Unknown')), isDartCoreType('Unknown'));
    });
  });

  group('resolveRef — ArrayRef', () {
    late ModelResolver v;
    setUp(() => v = ModelResolver());

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
    late ModelResolver v;
    setUp(() => v = ModelResolver());

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
    late ModelResolver v;
    setUp(() => v = ModelResolver());

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
    late ModelResolver v;
    setUp(() => v = ModelResolver());

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
    late ModelResolver v;
    setUp(() => v = ModelResolver());

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
    late ModelResolver v;
    setUp(() => v = ModelResolver());

    test('StringLiteralRef → StringLiteralType', () {
      const ref = MetaReference.stringLiteral(
        kind: TypeKind.string,
        value: 'hello',
      );
      expect(v.resolveRef(ref), isStringLiteralType('hello'));
    });
  });

  group('resolveRef — LiteralRef', () {
    late ModelResolver v;
    setUp(() => v = ModelResolver());

    test('LiteralRef produces InlineRecord with resolved fields', () {
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
      final result = v.resolveRef(
        ref,
        parentName: 'Parent',
        fieldName: 'field',
      );
      expect(result, isA<InlineRecord>());
      final record = result as InlineRecord;
      expect(record.fields, hasLength(1));
      expect(record.fields.first.name, 'x');
    });

    test('same parent+field resolved twice → same fields', () {
      const prop = MetaProperty(
        name: 'x',
        type: MetaReference.base(kind: TypeKind.base$, name: 'integer'),
      );
      const ref = MetaReference.literal(
        kind: TypeKind.literal,
        value: MetaLiteral(properties: [prop]),
      );
      final a =
          v.resolveRef(ref, parentName: 'P', fieldName: 'q') as InlineRecord;
      final b =
          v.resolveRef(ref, parentName: 'P', fieldName: 'q') as InlineRecord;
      expect(a.fields.length, b.fields.length);
      expect(a.fields.first.name, b.fields.first.name);
    });
  });

  // =========================================================================
  // Integration tests — real metaModel.json
  // =========================================================================
  group('real metaModel.json', () {
    late ResolveResult resolved;

    setUpAll(() {
      final file = File('../pro_lsp/metaModel.json');
      final json = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
      final protocol = MetaProtocol.fromJson(json);
      resolved = ModelResolver().resolve(protocol);
    });

    // Counts — floors, not exact values. The metaModel only grows across LSP
    // versions, so `>=` catches a resolver that silently drops declarations
    // without breaking on every spec bump. The golden test owns byte-for-byte
    // reproduction of the actual output.
    test('named structures count', () {
      expect(resolved.classes.length, greaterThanOrEqualTo(387));
    });

    test('enumerations count', () {
      expect(resolved.enumerations.length, greaterThanOrEqualTo(40));
    });

    test('aliases count', () {
      expect(resolved.aliases.length, greaterThanOrEqualTo(23));
    });

    test('registry size >= named classes + enumerations + aliases', () {
      final namedClasses = resolved.classes.length;
      expect(
        resolved.registry.length,
        greaterThanOrEqualTo(namedClasses + 40 + 23),
      );
    });

    // Position
    group('Position', () {
      late ResolvedClass pos;
      setUp(() => pos = resolved.registry['Position']! as ResolvedClass);

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

    // Range
    group('Range', () {
      late ResolvedClass range;
      setUp(() => range = resolved.registry['Range']! as ResolvedClass);

      test('start → ClassType pointing to registry Position', () {
        final start = range.properties.firstWhere((p) => p.name == 'start');
        final ct = start.type as ClassType;
        expect(identical(ct.ref, resolved.registry['Position']), isTrue);
      });

      test('end → ClassType pointing to registry Position', () {
        final end = range.properties.firstWhere((p) => p.name == 'end');
        final ct = end.type as ClassType;
        expect(identical(ct.ref, resolved.registry['Position']), isTrue);
      });
    });

    // TextDocumentItem
    group('TextDocumentItem', () {
      late ResolvedClass cls;
      setUp(
        () => cls = resolved.registry['TextDocumentItem']! as ResolvedClass,
      );

      test('uri → String', () {
        final p = cls.properties.firstWhere((p) => p.name == 'uri');
        expect(p.type, isDartCoreType('String'));
      });

      test('languageId → LanguageKind enum', () {
        // LSP 3.18 promoted languageId from a bare string to the
        // open `LanguageKind` enumeration.
        final p = cls.properties.firstWhere((p) => p.name == 'languageId');
        expect(p.type, isA<EnumType>());
        expect((p.type as EnumType).ref.name, 'LanguageKind');
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

    // DiagnosticSeverity
    group('DiagnosticSeverity', () {
      late ResolvedEnum en;
      setUp(
        () => en = resolved.registry['DiagnosticSeverity']! as ResolvedEnum,
      );

      test('valueType is int', () {
        expect(en.valueType, 'int');
      });

      test('Error has value 1', () {
        final m = en.members.firstWhere((m) => m.name == 'Error');
        expect(m.value, 1);
      });

      test('Hint has value 4', () {
        final m = en.members.firstWhere((m) => m.name == 'Hint');
        expect(m.value, 4);
      });
    });

    // Enums with supportsCustomValues
    test('FoldingRangeKind supportsCustomValues', () {
      final en = resolved.registry['FoldingRangeKind']! as ResolvedEnum;
      expect(en.supportsCustomValues, isTrue);
    });

    test('CodeActionKind supportsCustomValues', () {
      final en = resolved.registry['CodeActionKind']! as ResolvedEnum;
      expect(en.supportsCustomValues, isTrue);
    });

    test('SemanticTokenTypes supportsCustomValues', () {
      final en = resolved.registry['SemanticTokenTypes']! as ResolvedEnum;
      expect(en.supportsCustomValues, isTrue);
    });

    // LSPAny alias
    test('LSPAny alias is a ResolvedAlias', () {
      expect(resolved.registry['LSPAny'], isA<ResolvedAlias>());
    });

    test('LSPAny alias type is a UnionType (or+null items)', () {
      final alias = resolved.registry['LSPAny']! as ResolvedAlias;
      expect(alias.type, isA<UnionType>());
    });

    // Cross-reference identity
    test('all ClassType refs are identical to registry entries', () {
      void checkType(ResolvedType type) {
        switch (type) {
          case ClassType(:final ref):
            expect(
              identical(ref, resolved.registry[ref.name]),
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
          case InlineRecord():
        }
      }

      for (final cls in resolved.classes) {
        for (final prop in cls.properties) {
          checkType(prop.type);
        }
        cls.extends$.forEach(checkType);
        cls.mixins$.forEach(checkType);
      }
    });
  });
}
