import 'package:equatable/equatable.dart';

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
    required this.doc,
  });

  final String name;
  final String type;
  final bool optional;
  final List<String> doc;

  @override
  List<Object?> get props => [name, type, optional, doc];
}

class TypedefSymbol extends Symbol {
  const TypedefSymbol({
    required this.type,
    required this.definition,
    required this.doc,
  });

  final String type;
  final String definition;
  final List<String> doc;

  @override
  List<Object?> get props => [type, definition, doc];
}

class LiteralSymbol extends Symbol {
  const LiteralSymbol({
    required this.type,
    required this.definition,

    this.doc,
  });

  final String type;
  final String definition;

  final String? doc;

  @override
  List<Object?> get props => [type, definition, doc];
}

class TupleSymbol extends Symbol {
  const TupleSymbol({
    required this.type,
    required this.types,
  });
  final String type;
  final List<String> types;

  @override
  List<Object?> get props => [type, types];
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

  @override
  List<Object?> get props => [type, types, doc];
}

class StructureSymbol extends Symbol {
  const StructureSymbol({
    required this.name,
    required this.properties,
    required this.doc,
  });

  final String name;
  final List<String> doc;
  final List<PropertySymbol> properties;

  @override
  List<Object?> get props => [name, properties, doc];
}

class EnumSymbol extends Symbol {
  const EnumSymbol({
    required this.name,
    required this.valueType,
    required this.values,
    required this.doc,
  });

  final String name;
  final String valueType;
  final List<EnumFieldSymbol> values;
  final List<String> doc;

  @override
  List<Object?> get props => [valueType, name, values, doc];
}

class EnumFieldSymbol extends Symbol {
  const EnumFieldSymbol({
    required this.name,
    required this.argument,
    required this.doc,
  });

  final String name;
  final String argument;
  final List<String> doc;

  @override
  List<Object?> get props => [name, argument, doc];
}
