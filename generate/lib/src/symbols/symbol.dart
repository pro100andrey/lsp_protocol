import 'package:equatable/equatable.dart';

import 'rename_map.dart';

sealed class Symbol extends Equatable {
  const Symbol();

  @override
  List<Object?> get props => throw UnimplementedError(
    'The props getter must be implemented in subclasses of Symbol.',
  );
}

class PropertySymbol extends Symbol {
  const PropertySymbol({
    required this.name,
    required this.type,
    required this.optional,
    required this.documentation,
  });

  final String name;
  final String type;
  final bool optional;
  final String? documentation;

  String get displayType => renameType(type) ?? type;

  @override
  List<Object?> get props => [name, type, optional, documentation];
}

class TypedefSymbol extends Symbol {
  const TypedefSymbol({
    required this.name,
    required this.type,
    required this.doc,
  });

  final String name;
  final String type;
  final String? doc;

  @override
  List<Object?> get props => [name, type, doc];
}

class LiteralSymbol extends Symbol {
  const LiteralSymbol({
    required this.type,
    required this.definition,
    required this.ref,
  });

  final String type;
  final String definition;
  final Object ref;

  String get displayType => renameType(definition) ?? type;

  @override
  List<Object?> get props => [type, definition];
}

class TupleSymbol extends Symbol {
  const TupleSymbol({
    required this.type,
    required this.types,
  });
  final String type;
  final List<String> types;

  @override
  List<Object?> get props => [type,types];
}

class SealedSymbol extends Symbol {
  const SealedSymbol({
    required this.type,
    required this.types,
    this.doc,
  });

  final String type;

  final List<String> types;
  final String? doc;

  String get displayType => renameType(type) ?? type;

  @override
  List<Object?> get props => [type, types, doc];
}

class StructureSymbol extends Symbol {
  const StructureSymbol({
    required this.name,
    required this.properties,
    this.doc,
  });

  final String name;
  final String? doc;
  final List<PropertySymbol> properties;

  @override
  List<Object?> get props => [name, properties, doc];
}
