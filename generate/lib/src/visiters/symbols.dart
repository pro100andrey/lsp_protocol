// ignore_for_file: avoid_print

import '../extensions/string.dart';
import '../meta/protocol.dart';

typedef LiteralSymbol = ({
  BaseMeta owner,
  MetaProperty property,
  LiteralRef literalRef,
});

final class Symbols {

  List<LiteralSymbol> get literals => _literalSymbols;
  final _literalSymbols = <LiteralSymbol>[];

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
        ? 'Literal${property.name.upperFirstLetter()}'
        : throw ArgumentError(
            'Owner must be a MetaStructure, got: ${owner.runtimeType}',
          );

    return ownerName;
  }

  void processProtocol(MetaProtocol protocol) {
    _collectLiterals(protocol);

    print('');
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

    for (final literals in _literalSymbols) {
      final owner = literals.owner;
      final literalRef = literals.literalRef;
      final property = literals.property;

      final ownerName = owner is MetaStructure
          ? 'S^${owner.name}'
          : 'UnknownOwner';

      final properties = literalRef.value.properties
          .map((p) => p.name)
          .join(':');

      print('# $ownerName.${property.name} [$properties]');
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

extension MetaReferenceExtensions on MetaReference {
  void on<T extends MetaReference>(
    void Function(T ref) callback,
  ) {
    if (this is T) {
      callback(this as T);
    }
  }

  void onLiteralRef(
    void Function(LiteralRef ref) callback,
  ) => on<LiteralRef>(callback);

  void onTypeRef(
    void Function(TypeRef ref) callback,
  ) => on<TypeRef>(callback);
  void onArrayRef(
    void Function(ArrayRef ref) callback,
  ) => on<ArrayRef>(callback);

  void onBaseRef(
    void Function(BaseRef ref) callback,
  ) => on<BaseRef>(callback);

  void onOrRef(
    void Function(OrRef ref) callback,
  ) => on<OrRef>(callback);

  void onAndRef(
    void Function(AndRef ref) callback,
  ) => on<AndRef>(callback);

  void onMapRef(
    void Function(MapRef ref) callback,
  ) => on<MapRef>(callback);

  void onTupleRef(
    void Function(TupleRef ref) callback,
  ) => on<TupleRef>(callback);

  void onStringLiteralRef(
    void Function(StringLiteralRef ref) callback,
  ) => on<StringLiteralRef>(callback);
}
