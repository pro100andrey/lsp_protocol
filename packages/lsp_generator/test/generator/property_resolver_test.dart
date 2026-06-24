import 'package:lsp_generator/src/generator/property_resolver.dart';
import 'package:lsp_generator/src/models/resolved_decl.dart';
import 'package:lsp_generator/src/models/resolved_type.dart';
import 'package:test/test.dart';

ResolvedProperty _prop(String name, {bool optional = false}) =>
    ResolvedProperty(
      name: name,
      type: const DartCoreType(dartName: 'String'),
      optional: optional,
    );

void main() {
  group('PropertyResolver.allProperties', () {
    test('returns own properties for a class with no supertypes', () {
      final cls = ResolvedClass(
        name: 'Foo',
        properties: [_prop('a'), _prop('b')],
      );

      final names = PropertyResolver()
          .allProperties(cls)
          .map((p) => p.name)
          .toList();

      expect(names, ['a', 'b']);
    });

    test(
      'flattens inherited properties from extends (own properties last)',
      () {
        final base = ResolvedClass(
          name: 'Base',
          properties: [_prop('a'), _prop('shared')],
        );
        final derived = ResolvedClass(
          name: 'Derived',
          properties: [_prop('b')],
          extends$: [ClassType(ref: base)],
        );

        final names = PropertyResolver()
            .allProperties(derived)
            .map((p) => p.name)
            .toList();

        // Inherited (not overridden) first, then own.
        expect(names, ['a', 'shared', 'b']);
      },
    );

    test('own property overrides an inherited one with the same name', () {
      final base = ResolvedClass(
        name: 'Base',
        properties: [_prop('shared')],
      );
      final derived = ResolvedClass(
        name: 'Derived',
        properties: [_prop('shared', optional: true)],
        extends$: [ClassType(ref: base)],
      );

      final shared = PropertyResolver()
          .allProperties(derived)
          .singleWhere((p) => p.name == 'shared');

      // The derived (optional) property wins, and it appears only once.
      expect(shared.optional, isTrue);
    });

    test('also pulls in mixin properties', () {
      final mixin = ResolvedClass(name: 'M', properties: [_prop('m')]);
      final cls = ResolvedClass(
        name: 'C',
        properties: [_prop('c')],
        mixins$: [ClassType(ref: mixin)],
      );

      final names = PropertyResolver()
          .allProperties(cls)
          .map((p) => p.name)
          .toList();

      expect(names, ['m', 'c']);
    });

    test('caches: repeated calls return the identical list', () {
      final resolver = PropertyResolver();
      final cls = ResolvedClass(name: 'Foo', properties: [_prop('a')]);

      expect(
        identical(resolver.allProperties(cls), resolver.allProperties(cls)),
        isTrue,
      );
    });
  });
}
