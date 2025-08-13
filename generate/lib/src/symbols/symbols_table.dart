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

  final displayType = _displayNames[type] ?? type;

  // final renamed = _renameSealed[displayType] ?? displayType;

  return displayType;
}

// final _renameSealed = <String, String>{
//   'Sealed1': 'Or2<List<Location>, Location>',
//   'Sealed2': 'LSPAnySealed',
//   'Sealed3': 'InlineValueSealed',
//   'Sealed4': 'DocumentDiagnosticReportSealed',
//   'Sealed5': 'PrepareRenameResultSealed',
//   'Sealed6': 'ProgressTokenSealed',
//   'Sealed7': 'WorkspaceDocumentDiagnosticReportSealed',
//   'Sealed8': 'TextDocumentContentChangeEventSealed',
//   'Sealed9': 'MarkedStringSealed',
//   'Sealed10': 'DocumentFilterSealed',
//   'Sealed11': 'GlobPatternSealed',
//   'Sealed12': 'TextDocumentFilterSealed',
//   'Sealed13': 'NotebookDocumentFilterSealed',
//   'Sealed14': 'DocumentSelectorSealed',
//   'Sealed15': 'DocumentChangeSealed',
//   'Sealed16': 'HintLabelSealed',
//   'Sealed17': 'DocumentationSealed',
//   'Sealed18': 'FullDocumentDiagnosticReportSealed',
//   'Sealed19': 'InsertTextSealed',
//   'Sealed20': 'RegistrationOptionsSectionSealed',
//   'Sealed21': 'TextEditSealed',
//   'Sealed22': 'EditRangeSealed',
//   'Sealed23': 'HoverContentsSealed',
//   'Sealed24': 'SymbolLocationSealed',
//   'Sealed25': 'SemanticTokensRangeSealed',
//   'Sealed26': 'SemanticTokensFullSealed',
//   'Sealed27': 'EditSealed',
//   'Sealed28': 'VersionOrIdSealed',
//   'Sealed29': 'RootPathSealed',
//   'Sealed30': 'WorkspaceFoldersSealed',
//   'Sealed31': 'TextDocumentSyncSealed',
//   'Sealed32': 'NotebookDocumentSyncSealed',
//   'Sealed33': 'HoverProviderSealed',
//   'Sealed34': 'DeclarationProviderSealed',
//   'Sealed35': 'DefinitionProviderSealed',
//   'Sealed36': 'TypeDefinitionProviderSealed',
//   'Sealed37': 'ImplementationProviderSealed',
//   'Sealed38': 'ReferencesProviderSealed',
//   'Sealed39': 'DocumentHighlightProviderSealed',
//   'Sealed40': 'DocumentSymbolProviderSealed',
//   'Sealed41': 'CodeActionProviderSealed',
//   'Sealed42': 'ColorProviderSealed',
//   'Sealed43': 'WorkspaceSymbolProviderSealed',
//   'Sealed44': 'DocumentFormattingProviderSealed',
//   'Sealed45': 'DocumentRangeFormattingProviderSealed',
//   'Sealed46': 'RenameProviderSealed',
//   'Sealed47': 'FoldingRangeProviderSealed',
//   'Sealed48': 'SelectionRangeProviderSealed',
//   'Sealed49': 'CallHierarchyProviderSealed',
//   'Sealed50': 'LinkedEditingRangeProviderSealed',
//   'Sealed51': 'SemanticTokensProviderSealed',
//   'Sealed52': 'MonikerProviderSealed',
//   'Sealed53': 'TypeHierarchyProviderSealed',
//   'Sealed54': 'InlineValueProviderSealed',
//   'Sealed55': 'InlayHintProviderSealed',
//   'Sealed56': 'DiagnosticProviderSealed',
//   'Sealed57': 'InlineCompletionProviderSealed',
//   'Sealed58': 'SaveSealed',
//   'Sealed59': 'NotebookSealed',
//   'Sealed60': 'ChangeNotificationsSealed',
//   'Sealed61': 'ParameterLabelSealed',
//   'Sealed62': 'NotebookFilterSealed',
//   'Sealed63': 'BaseUriSealed',
// };

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

final class SealedTable extends SymbolTable<SealedSymbol> {}

final class DisplayNamesTable extends SymbolTable<String> {}

final class TupleTable extends SymbolTable<TupleSymbol> with IndexedType {
  @override
  String get prefix => 'Tuple';
}

final class EnumsTable extends SymbolTable<EnumSymbol> {}
