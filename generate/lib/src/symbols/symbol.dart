import 'package:equatable/equatable.dart';

sealed class Symbol extends Equatable {
  const Symbol();

  @override
  List<Object?> get props => throw UnimplementedError(
    'The props getter must be implemented in subclasses of Symbol.',
  );
}

sealed class TypeReferenceSymbol extends Symbol {
  const TypeReferenceSymbol({required this.name, required this.owner});

  final String name;
  final Symbol owner;

  @override
  List<Object?> get props => [name];
}

class StructureSymbol extends Symbol {
  const StructureSymbol({
    required this.name,
    required this.fields,
  });

  final String name;
  final List<TypeReferenceSymbol> fields;

  @override
  List<Object?> get props => [name, fields];
}
