// ignore_for_file: avoid_print

import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../meta/protocol.dart';

typedef SealedSymbol = ({String name, BaseMeta owner, OrRef ref});

final class SealedMap {
  final _literalSymbols = <SealedSymbol>[];
  final _literalSymbolsByRef = <OrRef, SealedSymbol>{};

  void processProtocol(MetaProtocol protocol) {
    _collectSealedClasses(protocol);
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
      final orName = _resolveReferenceName(orRef.items.first);
      print('-> Multiple owners found for OrRef $orName ${owners.length}');
    }

    // final owner = owners.first;
    final name = _resolveReferenceName(orRef);

    return name;
  }

  void _collectSealedClasses(MetaProtocol protocol) {
    protocol.typeAliases.forEach(_processTypeAlias);
    protocol.structures.forEach(_processStructure);
  }

  void _processStructure(MetaStructure structure) {
    for (final property in structure.properties) {
      _processMetaProperty(property: property, owner: structure);
    }
  }

  void _processTypeAlias(MetaTypeAlias typeAlias) {
    typeAlias.type.onOrRef((orRef) {
      _addSymbol(owner: typeAlias, ref: orRef);
    });
  }

  void _processMetaProperty({
    required MetaProperty property,
    required BaseMeta owner,
  }) {
    property.type.onLiteralRef((literalRef) {
      for (final prop in literalRef.value.properties) {
        prop.type.onOrRef((orRef) {
          _addSymbol(owner: owner, ref: orRef);
        });
      }
    });

    property.type.onOrRef((orRef) {
      _addSymbol(owner: owner, ref: orRef);
    });

    property.type.onArrayRef((arrayRef) {
      arrayRef.element.onOrRef((orRef) {
        _addSymbol(owner: owner, ref: orRef);
      });
    });
  }

  void _addSymbol({
    required BaseMeta owner,
    required OrRef ref,
  }) {
    final name = _resolveReferenceName(ref);
    final ownerName = _resolveOwnerName(owner);

    print('Beginning to add symbol: $name for owner: $ownerName');

    if (_literalSymbolsByRef.containsKey(ref)) {
      // If the symbol already exists, we can skip adding it again.
      print('Symbol $name already exists for owner $ownerName, skipping.');
      return;
    }

    final symbol = (name: name, owner: owner, ref: ref);

    _literalSymbols.add(symbol);
    _literalSymbolsByRef[ref] = symbol;

    // Guard against nested OrRefs
    _guardAgainstNestedOrRefs(orRef: ref, owner: owner);
  }

  String _resolveReferenceName(MetaReference ref) => ref
      .when(
        literalRef: (ref) => 'Literal',
        typeRef: (ref) => ref.name,
        orRef: (ref) => ref.items.map(_resolveReferenceName).join('Or'),
        arrayRef: (ref) => 'ArrayOf${_resolveReferenceName(ref.element)}s',
        baseRef: (ref) => ref.name,
        tupleRef: (ref) =>
            'TupleOf${ref.items.map(_resolveReferenceName).join('And')}',
      )
      .upperFirstLetter();

  String _resolveOwnerName(BaseMeta owner) => switch (owner) {
    final MetaStructure structure => '${structure.name}(Struct)',
    final MetaTypeAlias typeAlias => '${typeAlias.name}(Alias)',
    _ => throw ArgumentError(
      'Unknown owner type: ${owner.runtimeType}',
    ),
  };

  void _guardAgainstNestedOrRefs({
    required OrRef orRef,
    required BaseMeta owner,
  }) {
    for (final item in orRef.items) {
      if (item is OrRef) {
        final ownerName = _resolveOwnerName(owner);
        final refName = _resolveReferenceName(item);

        throw ArgumentError(
          'Nested OrRef found in $ownerName with ref $refName',
        );
      }
    }
  }
}
