// ignore_for_file: avoid_print

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../generator_helper.dart';
import '../meta/protocol.dart';
import '../visiters/type_resolver_visitor.dart';

sealed class OrOwner extends Equatable {}

final class TypeAliasOwner extends OrOwner {
  TypeAliasOwner(this.typeAlias);

  final MetaTypeAlias typeAlias;

  @override
  List<Object?> get props => [typeAlias];
}

final class StructOwner extends OrOwner {
  StructOwner(this.struct, this.property);

  final MetaStructure struct;
  final MetaProperty property;

  @override
  List<Object?> get props => [property, struct];
}

final class SealedMap {
  final _orRefs = <OrRef, List<OrOwner>>{};
  final _structuresRefs = <String, MetaStructure>{};

  late final _visitor = TypeResolverVisitor(sealedMap: this);

  Iterable<OrRef> get refs => _orRefs.keys;

  void processProtocol(MetaProtocol protocol) {
    _collectStructures(protocol);
    _collectSealedClasses(protocol);
  }

  void _collectStructures(MetaProtocol protocol) {
    for (final structure in protocol.structures) {
      _structuresRefs[structure.name] = structure;
    }
  }

  bool isStructureRef(String name) => _structuresRefs.containsKey(name);

  List<String> typeNamesForOrRef(OrRef orRef) =>
      orRef.items.map(_resolveReferenceName).toList();

  String resolveOneSimpleType(MetaReference ref) {
    final name = ref
        .when(
          literalRef: (ref) => 'Literal',
          typeRef: (ref) => ref.name,
          orRef: resolveOrRefName,
          arrayRef: (ref) => 'List',
          baseRef: (ref) => ref.name,
          tupleRef: (ref) => 'Tuple',
        )
        .upperFirstLetter();

    return name;
  }

  String resolveOrRefType(OrRef orRef, {bool isBase = true}) {
    final name = _resolveReferenceName(orRef).removeFirstLetter('_');

    if (isBase) {
      return _addOrPostfix(name);
    }

    return name;
  }

  void _collectSealedClasses(MetaProtocol protocol) {
    protocol.typeAliases.forEach(_processTypeAlias);
    protocol.structures.forEach(_processStructure);
  }

  void _processStructure(MetaStructure structure) {
    for (final property in structure.properties) {
      property.type.onLiteralRef((literalRef) {
        for (final prop in literalRef.value.properties) {
          prop.type.onOrRef((orRef) {
            _addSymbol(owner: StructOwner(structure, prop), ref: orRef);
          });
        }
      });

      property.type.onMapRef((mapRef) {
        mapRef.value.onOrRef((orRef) {
          _addSymbol(owner: StructOwner(structure, property), ref: orRef);
        });
      });

      property.type.onOrRef((orRef) {
        _addSymbol(owner: StructOwner(structure, property), ref: orRef);
      });

      property.type.onArrayRef((arrayRef) {
        arrayRef.element.onOrRef((orRef) {
          _addSymbol(owner: StructOwner(structure, property), ref: orRef);
        });
      });
    }
  }

  void _processTypeAlias(MetaTypeAlias typeAlias) {
    typeAlias.type.onOrRef((orRef) {
      _addSymbol(owner: TypeAliasOwner(typeAlias), ref: orRef);
    });
  }

  void _addSymbol({
    required OrOwner owner,
    required OrRef ref,
  }) {
    _orRefs.putIfAbsent(ref, () => []).add(owner);

    // Guard against nested OrRefs
    _guardAgainstNestedOrRefs(orRef: ref, owner: owner);
  }

  String _resolveReferenceName(MetaReference ref) {
    final name = ref
        .when(
          literalRef: (ref) => literalToRecord(ref, _visitor),
          typeRef: (ref) => ref.name,
          orRef: resolveOrRefName,
          arrayRef: (ref) => 'Array<${_resolveReferenceName(ref.element)}>',
          baseRef: (ref) => ref.name,
          tupleRef: (ref) => tupleToRecord(ref, _visitor),
        )
        .upperFirstLetter();

    return name;
  }

  String resolveOwnerName(OrOwner owner) => switch (owner) {
    final StructOwner owner => owner.struct.name,
    final TypeAliasOwner owner => owner.typeAlias.name,
  };

  List<String> ownerNamesForOrRef(OrRef orRef) {
    final owners = _orRefs[orRef]!;

    final names = owners.map(_resolveOwnerName).toSet().toList();

    return names;
  }

  String resolveOrRefName(OrRef orRef) {
    final owners = _orRefs[orRef]!;

    final alias = owners.firstWhereOrNull(
      (owner) => owner is TypeAliasOwner,
    );

    if (alias is TypeAliasOwner) {
      return alias.typeAlias.name;
    }

    if (owners case [final StructOwner owner]) {
      final ownerName = owner.property.name
          .removeFirstLetter('_')
          .upperFirstLetter();

      return owner.struct.name.upperFirstLetter() + ownerName;
    }

    final ownerNames = owners
        .cast<StructOwner>()
        .map((e) => e.property.name.upperFirstLetter())
        .toSet();

    final result = ownerNames.join('Or');

    return result;
  }

  void _guardAgainstNestedOrRefs({
    required OrRef orRef,
    required OrOwner owner,
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

  String _resolveOwnerName(OrOwner owner) => switch (owner) {
    final StructOwner owner => '${owner.struct.name}(${owner.property.name})',
    final TypeAliasOwner owner => '${owner.typeAlias.name}(Alias)',
  };
}

String _addOrPostfix(String name) => '${name}Base';
