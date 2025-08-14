import 'symbol.dart';

abstract class SymbolTable<T> {
  final Map<String, T> _table = {};

  T? operator [](String key) => _table[key];

  void operator []=(String key, T value) {
    if (containsKey(key)) {
      return;
    }

    _table[key] = value;
  }

  void remove(String key) {
    _table.remove(key);
  }

  Iterable<String> get keys => _table.keys;
  Iterable<T> get values => _table.values;

  bool containsKey(String key) => _table.containsKey(key);
}

final class StructuresTable extends SymbolTable<StructureSymbol> {}

final class TypedefsTable extends SymbolTable<TypedefSymbol> {}

final class EnumsTable extends SymbolTable<EnumSymbol> {}
