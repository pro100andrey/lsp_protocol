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

final _displayNames = <String, String>{};

String indexedType(String type, {bool throwIfMissing = false}) {
  if (throwIfMissing && !_displayNames.containsKey(type)) {
    throw ArgumentError('Type not found: $type');
  }

  return _displayNames[type] ?? type;
}

mixin IndexedType<T extends Symbol> on SymbolTable<T> {
  int _nextIndex = 1;

  String get prefix;

  void _setIndexedType(String type) {
    if (_displayNames.containsKey(type)) {
      return; // Already set
    }

    _displayNames[type] = '$prefix$_nextIndex';
    _nextIndex++;
  }

  @override
  void operator []=(String key, T value) {
    _setIndexedType(key);

    super[key] = value;
  }
}

final class StructuresTable extends SymbolTable<StructureSymbol> {}

final class TypedefsTable extends SymbolTable<TypedefSymbol> {}

final class LiteralsTable extends SymbolTable<LiteralSymbol> with IndexedType {
  @override
  String get prefix => 'Literal';
}

final class SealedTable extends SymbolTable<SealedSymbol> with IndexedType {
  @override
  String get prefix => 'Sealed';
}

final class DisplayNamesTable extends SymbolTable<String> {}

final class TupleTable extends SymbolTable<TupleSymbol> with IndexedType {
  @override
  String get prefix => 'Tuple';
}

final class EnumsTable extends SymbolTable<EnumSymbol> {}
