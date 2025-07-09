// ignore_for_file: avoid_print

import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../meta/protocol.dart';

typedef SealedSymbol = ({
  String name,
  BaseMeta owner,
  MetaProperty property,
  OrRef ref,
});

final class SealedMap {
  final _literalSymbols = <SealedSymbol>[];

  void processProtocol(MetaProtocol protocol) {
    _collectSealedClasses(protocol);

    for (final symbol in _literalSymbols) {
      print(
        nameForOrRef(symbol.ref),
      );
    }
  }

  String nameForOrRef(OrRef orRef) {
    final symbols = _literalSymbols
        .where((symbol) => symbol.ref == orRef)
        .toList(growable: false);

    if (symbols.isEmpty) {
      throw ArgumentError('No symbols found for OrRef $orRef');
    }

    // Guard against multiple references to the same OrRef.
    final owners = symbols.map((s) => s.owner);
    if (owners.length != 1) {
      final orName = _nameForMetaReference(orRef.items.first);
      print('-> Multiple owners found for OrRef $orName ${owners.length}');
    }

    // final owner = owners.first;
    final name = symbols.first.ref.items.map(_nameForMetaReference).join('Or');

    return name;
  }

  

  String _nameForMetaReference(MetaReference ref) => ref
      .when(
        literalRef: (ref) => 'Literal',
        typeRef: (ref) => ref.name,
        arrayRef: (ref) => 'ArrayOf${_nameForMetaReference(ref.element)}',
        baseRef: (ref) => ref.name,
        tupleRef: (ref) =>
            'TupleOf${ref.items.map(_nameForMetaReference).join('And')}',
      )
      .upperFirstLetter();

  void _collectSealedClasses(MetaProtocol protocol) {
    protocol.structures.forEach(_processStructure);
    protocol.typeAliases.forEach(_processTypeAlias);
  }

  void _processStructure(MetaStructure structure) {
    for (final property in structure.properties) {
      _processMetaProperty(property: property, owner: structure);
    }
  }

  void _processTypeAlias(MetaTypeAlias typeAlias) {
    typeAlias.type.onOrRef((orRef) {
      //   _literalSymbols.add((
      //     owner: typeAlias,
      //     property: typeAlias.property,
      //     ref: orRef,
      //   ));

      //   // Guard against nested OrRefs
      //   _guardAgainstNestedOrRefs(orRef, typeAlias.property, typeAlias);
    });
  }

  void _processMetaProperty({
    required MetaProperty property,
    required BaseMeta owner,
  }) {
    property.type.onLiteralRef((literalRef) {
      for (final prop in literalRef.value.properties) {
        prop.type.onOrRef((orRef) {
          _literalSymbols.add((
            owner: owner,
            property: property,
            ref: orRef,
          ));

          // Guard against nested OrRefs
          _guardAgainstNestedOrRefs(orRef, property, owner);
        });
      }
    });

    property.type.onOrRef((orRef) {
      _literalSymbols.add((
        owner: owner,
        property: property,
        ref: orRef,
      ));

      // Guard against nested OrRefs
      _guardAgainstNestedOrRefs(orRef, property, owner);
    });

    property.type.onArrayRef((arrayRef) {
      arrayRef.element.onOrRef((orRef) {
        _literalSymbols.add((
          owner: owner,
          property: property,
          ref: orRef,
        ));

        // Guard against nested OrRefs
        _guardAgainstNestedOrRefs(orRef, property, owner);
      });
    });
  }

  void _guardAgainstNestedOrRefs({
    required OrRef orRef,
    required MetaProperty property,
    required BaseMeta owner,
  }) {
    for (final item in orRef.items) {
      if (item is OrRef) {
        final name = owner is MetaStructure
            ? '${owner.name}.${property.name}'
            : 'Unknown.${property.name}';

        throw ArgumentError(
          'Nested OrRef found in property "$name" of type '
          '"${property.type}".',
        );
      }
    }
  }
}
