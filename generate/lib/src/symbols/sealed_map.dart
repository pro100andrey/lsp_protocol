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

  late final _visitor = TypeResolverVisitor(
    sealedMap: this,
  );

  Iterable<OrRef> get refs {
    // skip when value owner is Alias
    final filteredOrRefs = _orRefs.keys;


    final names = filteredOrRefs.map(resolveOrRefName).toList();

    return filteredOrRefs;
  }

  void processProtocol(MetaProtocol protocol) {
    _collectSealedClasses(protocol);
  }

  List<String> ownersForOrRef(OrRef orRef) {
    final owners = _orRefs[orRef]!;

    return owners.map(_resolveOwnerName).toList();
  }

  List<String> typeNamesForOrRef(OrRef orRef) =>
      orRef.items.map(_resolveReferenceName).toList();

  String typeNameForOrRef(OrRef orRef) {
    final name = _resolveReferenceName(orRef);

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

  final _renameMap = {
    'Declaration': _addOrPostfix('Declaration'),
    'Definition': _addOrPostfix('Definition'),
    'LSPAny': _addOrPostfix('LSPAny'),
    'InlineValue': _addOrPostfix('InlineValue'),
    'DocumentDiagnosticReport': _addOrPostfix('DocumentDiagnosticReport'),
    'PrepareRenameResult': _addOrPostfix('PrepareRenameResult'),
    'ProgressToken': _addOrPostfix('ProgressToken'),
    'WorkspaceDocumentDiagnosticReport': _addOrPostfix(
      'WorkspaceDocumentDiagnosticReport',
    ),
    'TextDocumentContentChangeEvent': _addOrPostfix(
      'TextDocumentContentChangeEvent',
    ),
    'MarkedString': _addOrPostfix('MarkedString'),
    'DocumentFilter': _addOrPostfix('DocumentFilter'),
    'GlobPattern': _addOrPostfix('GlobPattern'),
    'TextDocumentFilter': _addOrPostfix('TextDocumentFilter'),
    'NotebookDocumentFilter': _addOrPostfix('NotebookDocumentFilter'),
  };

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

    return _renameMap[name] ?? name;
  }

  String resolveOrRefName(OrRef orRef) {
    final owners = _orRefs[orRef]!;

    final alias = owners.firstWhereOrNull(
      (owner) => owner is TypeAliasOwner,
    );

    if (alias is TypeAliasOwner) {
      return alias.typeAlias.name;
    }

    if (owners case [StructOwner(:final property)]) {
      return _addOrPostfix(property.name.upperFirstLetter());
    }

    final ownerNames = owners
        .cast<StructOwner>()
        .map((e) => e.property.name.upperFirstLetter())
        .toSet();

    final result = _addOrPostfix(ownerNames.join('Or'));

    return result;
  }

  String _resolveOwnerName(OrOwner owner) => switch (owner) {
    final StructOwner owner => '${owner.struct.name}(${owner.property.name})',
    final TypeAliasOwner owner => '${owner.typeAlias.name}(Alias)',
  };

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
}

String _addOrPostfix(String name) => '${name}Base';
