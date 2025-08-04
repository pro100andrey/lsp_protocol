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
    required this.documentation,
  });

  final String name;
  final String type;
  final bool optional;
  final String? documentation;

  @override
  List<Object?> get props => [name, type, optional, documentation];
}

class TypedefSymbol extends Symbol {
  const TypedefSymbol({
    required this.name,
    required this.type,
  });

  final String name;
  final String type;

  @override
  List<Object?> get props => [name, type];
}

class LiteralSymbol extends Symbol {
  const LiteralSymbol({
    required this.name,
    required this.type,
    required this.ref,
  });

  final String name;
  final String type;
  final Object ref;

  @override
  List<Object?> get props => [name, type];
}

class StructureSymbol extends Symbol {
  const StructureSymbol({
    required this.name,
    required this.properties,
  });

  final String name;
  final List<PropertySymbol> properties;

  @override
  List<Object?> get props => [name, properties];
}
