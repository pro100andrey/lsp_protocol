// ignore_for_file: avoid_print

import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../meta/protocol.dart';

typedef LiteralSymbol = ({
  BaseMeta owner,
  MetaProperty property,
  LiteralRef literalRef,
});

final class LiteralsMap {
  final _duplicateLiteralRefs = <LiteralRef, List<LiteralSymbol>>{};
  final _groupedByLiteralRef = <LiteralRef, List<LiteralSymbol>>{};
  final _literalSymbols = <LiteralSymbol>[];

  List<LiteralSymbol> get literals {
    final copy = List<LiteralSymbol>.from(_literalSymbols);
    // Remove duplicates from the list of literal symbols.

    for (final e in _groupedByLiteralRef.entries) {
      final ref = e.key;
      final symbols = e.value;

      if (symbols.length > 1) {
        // If there are duplicates, keep only the first one.
        final firstSymbol = symbols.first;
        copy
          ..removeWhere((s) => s.literalRef == ref)
          ..add(firstSymbol);
      }
    }

    // Return a copy to avoid external modifications.
    return List<LiteralSymbol>.unmodifiable(copy);
  }

  bool isLiteralByName(String name) {
    for (final symbol in literals) {
      final literalName = getLiteralName(symbol.literalRef);
      if (literalName == name) {
        return true;
      }
    }

    return false;
  }

  String getLiteralName(LiteralRef literalRef) {
    final refs = _literalSymbols
        .where(
          (symbol) => symbol.literalRef == literalRef,
        )
        .toList(growable: false);

    // Guard against multiple references to the same literal.
    final props = refs.map((r) => r.property.name).toSet();
    if (props.length != 1) {
      throw ArgumentError(
        'LiteralRef $literalRef has multiple properties: $props',
      );
    }

    final ref = refs.first;
    final owner = ref.owner;
    final property = ref.property;

    final ownerName = owner is MetaStructure
        ? '${owner.name}${property.name.upperFirstLetter()}'
        : throw ArgumentError(
            'Owner must be a MetaStructure, got: ${owner.runtimeType}',
          );

    // Remove _ from the start of the name if it exists.
    return ownerName.startsWith('_') ? ownerName.substring(1) : ownerName;
  }

  void processProtocol(MetaProtocol protocol) {
    _collectLiterals(protocol);
    _collectDuplicateLiteralRefs();
  }

  void _collectLiterals(MetaProtocol protocol) {
    protocol.structures.forEach(_collectLiteralsFromStructure);

    final literalSymbols = List<LiteralSymbol>.from(_literalSymbols);

    for (final literalSymbol in literalSymbols) {
      final ref = literalSymbol.literalRef;
      final owner = literalSymbol.owner;

      for (final property in ref.value.properties) {
        _processMetaProperty(property: property, owner: owner);
      }
    }
  }

  void _collectDuplicateLiteralRefs() {
    // Group literal symbols by their LiteralRef to find duplicates.

    for (final symbol in _literalSymbols) {
      _groupedByLiteralRef.putIfAbsent(symbol.literalRef, () => []).add(symbol);
    }

    // Filter out those with only one occurrence.

    for (final e in _groupedByLiteralRef.entries) {
      final ref = e.key;
      final symbols = e.value;

      if (symbols.length > 1) {
        _duplicateLiteralRefs[ref] = symbols;
      }
    }

    for (final e in _duplicateLiteralRefs.entries) {
      final literalRef = e.key;
      final symbols = e.value;

      // Guard against multiple references to the same literal.
      final props = symbols.map((s) => s.property.name).toList();
      final uniqueProps = props.toSet();
      if (uniqueProps.length != 1) {
        throw ArgumentError(
          'LiteralRef $literalRef has multiple properties: $props',
        );
      }
    }
  }

  void _collectLiteralsFromStructure(MetaStructure structure) {
    for (final property in structure.properties) {
      _processMetaProperty(property: property, owner: structure);
    }
  }

  void _processMetaProperty({
    required MetaProperty property,
    required BaseMeta owner,
  }) {
    property.type.onLiteralRef((literalRef) {
      _literalSymbols.add((
        literalRef: literalRef,
        property: property,
        owner: owner,
      ));
    });

    property.type.onOrRef((orRef) {
      for (final item in orRef.items) {
        item.onLiteralRef((literalRef) {
          _literalSymbols.add((
            literalRef: literalRef,
            property: property,
            owner: owner,
          ));
        });
      }
    });

    property.type.onArrayRef((arrayRef) {
      arrayRef.element.onLiteralRef((literalRef) {
        _literalSymbols.add((
          literalRef: literalRef,
          property: property,
          owner: owner,
        ));
      });
    });

    property.type.onAndRef((andRef) {
      for (final item in andRef.items) {
        item.onLiteralRef((literalRef) {
          _literalSymbols.add((
            literalRef: literalRef,
            property: property,
            owner: owner,
          ));
        });
      }
    });

    property.type.onMapRef((mapRef) {
      mapRef.value.onLiteralRef((literalRef) {
        _literalSymbols.add((
          literalRef: literalRef,
          property: property,
          owner: owner,
        ));
      });
    });
  }
}
