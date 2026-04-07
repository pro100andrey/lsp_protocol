// GENERATED — do not edit.

import 'enumerations.dart';
import 'type_aliases.dart';

final class InitializeResultServerInfo {
  const InitializeResultServerInfo({required this.name, this.version});

  factory InitializeResultServerInfo.fromJson(Map<String, Object?> json) =>
      InitializeResultServerInfo(
        name: json['name'] as String,
        version: json['version'] as String?,
      );

  final String name;

  final String? version;

  InitializeResultServerInfo copyWith({String? name, String? version}) =>
      InitializeResultServerInfo(
        name: name ?? this.name,
        version: version ?? this.version,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'name': name, 'version': version};
  }
}

final class CompletionListItemDefaults {
  const CompletionListItemDefaults({
    this.commitCharacters,
    this.editRange,
    this.insertTextFormat,
    this.insertTextMode,
    this.data,
  });

  factory CompletionListItemDefaults.fromJson(Map<String, Object?> json) =>
      CompletionListItemDefaults(
        commitCharacters: (json['commitCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        editRange: json['editRange'] as Object?,
        insertTextFormat: json['insertTextFormat'] == null
            ? null
            : InsertTextFormat.values.firstWhere(
                (e) => e.value == json['insertTextFormat'] as int,
              ),
        insertTextMode: json['insertTextMode'] == null
            ? null
            : InsertTextMode.values.firstWhere(
                (e) => e.value == json['insertTextMode'] as int,
              ),
        data: json['data'] as LSPAny?,
      );

  final List<String>? commitCharacters;

  final Object? editRange;

  final InsertTextFormat? insertTextFormat;

  final InsertTextMode? insertTextMode;

  final LSPAny? data;

  CompletionListItemDefaults copyWith({
    List<String>? commitCharacters,
    Object? editRange,
    InsertTextFormat? insertTextFormat,
    InsertTextMode? insertTextMode,
    LSPAny? data,
  }) => CompletionListItemDefaults(
    commitCharacters: commitCharacters ?? this.commitCharacters,
    editRange: editRange ?? this.editRange,
    insertTextFormat: insertTextFormat ?? this.insertTextFormat,
    insertTextMode: insertTextMode ?? this.insertTextMode,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'commitCharacters': commitCharacters,
      'editRange': editRange,
      'insertTextFormat': insertTextFormat?.value,
      'insertTextMode': insertTextMode?.value,
      'data': data,
    };
  }
}

final class CompletionListItemDefaultsEditRange {
  const CompletionListItemDefaultsEditRange({
    required this.insert,
    required this.replace,
  });

  factory CompletionListItemDefaultsEditRange.fromJson(
    Map<String, Object?> json,
  ) => CompletionListItemDefaultsEditRange(
    insert: Range.fromJson(json['insert'] as Map<String, Object?>),
    replace: Range.fromJson(json['replace'] as Map<String, Object?>),
  );

  final Range insert;

  final Range replace;

  CompletionListItemDefaultsEditRange copyWith({
    Range? insert,
    Range? replace,
  }) => CompletionListItemDefaultsEditRange(
    insert: insert ?? this.insert,
    replace: replace ?? this.replace,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'insert': insert.toJson(),
      'replace': replace.toJson(),
    };
  }
}

final class CodeActionDisabled {
  const CodeActionDisabled({required this.reason});

  factory CodeActionDisabled.fromJson(Map<String, Object?> json) =>
      CodeActionDisabled(reason: json['reason'] as String);

  final String reason;

  CodeActionDisabled copyWith({String? reason}) =>
      CodeActionDisabled(reason: reason ?? this.reason);

  Map<String, Object?> toJson() {
    return <String, Object?>{'reason': reason};
  }
}

final class WorkspaceSymbolLocation {
  const WorkspaceSymbolLocation({required this.uri});

  factory WorkspaceSymbolLocation.fromJson(Map<String, Object?> json) =>
      WorkspaceSymbolLocation(uri: json['uri'] as String);

  final String uri;

  WorkspaceSymbolLocation copyWith({String? uri}) =>
      WorkspaceSymbolLocation(uri: uri ?? this.uri);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

final class SemanticTokensOptionsRange {
  const SemanticTokensOptionsRange();

  factory SemanticTokensOptionsRange.fromJson(Map<String, Object?> json) =>
      SemanticTokensOptionsRange();

  Map<String, Object?> toJson() {
    return <String, Object?>{};
  }
}

final class SemanticTokensOptionsFull {
  const SemanticTokensOptionsFull({this.delta});

  factory SemanticTokensOptionsFull.fromJson(Map<String, Object?> json) =>
      SemanticTokensOptionsFull(delta: json['delta'] as bool?);

  final bool? delta;

  SemanticTokensOptionsFull copyWith({bool? delta}) =>
      SemanticTokensOptionsFull(delta: delta ?? this.delta);

  Map<String, Object?> toJson() {
    return <String, Object?>{'delta': delta};
  }
}

final class NotebookDocumentChangeEventCells {
  const NotebookDocumentChangeEventCells({
    this.structure,
    this.data,
    this.textContent,
  });

  factory NotebookDocumentChangeEventCells.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentChangeEventCells(
    structure: json['structure'] == null
        ? null
        : NotebookDocumentChangeEventCellsStructure.fromJson(
            json['structure'] as Map<String, Object?>,
          ),
    data: (json['data'] as List<Object?>?)
        ?.map((e) => NotebookCell.fromJson(e as Map<String, Object?>))
        .toList(),
    textContent: (json['textContent'] as List<Object?>?)
        ?.map(
          (e) => NotebookDocumentChangeEventCellsTextContent.fromJson(
            e as Map<String, Object?>,
          ),
        )
        .toList(),
  );

  final NotebookDocumentChangeEventCellsStructure? structure;

  final List<NotebookCell>? data;

  final List<NotebookDocumentChangeEventCellsTextContent>? textContent;

  NotebookDocumentChangeEventCells copyWith({
    NotebookDocumentChangeEventCellsStructure? structure,
    List<NotebookCell>? data,
    List<NotebookDocumentChangeEventCellsTextContent>? textContent,
  }) => NotebookDocumentChangeEventCells(
    structure: structure ?? this.structure,
    data: data ?? this.data,
    textContent: textContent ?? this.textContent,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'structure': structure?.toJson(),
      'data': data?.map((e) => e.toJson()).toList(),
      'textContent': textContent?.map((e) => e.toJson()).toList(),
    };
  }
}

final class NotebookDocumentChangeEventCellsStructure {
  const NotebookDocumentChangeEventCellsStructure({
    required this.array,
    this.didOpen,
    this.didClose,
  });

  factory NotebookDocumentChangeEventCellsStructure.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentChangeEventCellsStructure(
    array: NotebookCellArrayChange.fromJson(
      json['array'] as Map<String, Object?>,
    ),
    didOpen: (json['didOpen'] as List<Object?>?)
        ?.map((e) => TextDocumentItem.fromJson(e as Map<String, Object?>))
        .toList(),
    didClose: (json['didClose'] as List<Object?>?)
        ?.map((e) => TextDocumentIdentifier.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  final NotebookCellArrayChange array;

  final List<TextDocumentItem>? didOpen;

  final List<TextDocumentIdentifier>? didClose;

  NotebookDocumentChangeEventCellsStructure copyWith({
    NotebookCellArrayChange? array,
    List<TextDocumentItem>? didOpen,
    List<TextDocumentIdentifier>? didClose,
  }) => NotebookDocumentChangeEventCellsStructure(
    array: array ?? this.array,
    didOpen: didOpen ?? this.didOpen,
    didClose: didClose ?? this.didClose,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'array': array.toJson(),
      'didOpen': didOpen?.map((e) => e.toJson()).toList(),
      'didClose': didClose?.map((e) => e.toJson()).toList(),
    };
  }
}

final class NotebookDocumentChangeEventCellsTextContent {
  const NotebookDocumentChangeEventCellsTextContent({
    required this.document,
    required this.changes,
  });

  factory NotebookDocumentChangeEventCellsTextContent.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentChangeEventCellsTextContent(
    document: VersionedTextDocumentIdentifier.fromJson(
      json['document'] as Map<String, Object?>,
    ),
    changes: (json['changes'] as List<Object?>)
        .map((e) => e as TextDocumentContentChangeEvent)
        .toList(),
  );

  final VersionedTextDocumentIdentifier document;

  final List<TextDocumentContentChangeEvent> changes;

  NotebookDocumentChangeEventCellsTextContent copyWith({
    VersionedTextDocumentIdentifier? document,
    List<TextDocumentContentChangeEvent>? changes,
  }) => NotebookDocumentChangeEventCellsTextContent(
    document: document ?? this.document,
    changes: changes ?? this.changes,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'document': document.toJson(), 'changes': changes};
  }
}

final class _InitializeParamsClientInfo {
  const _InitializeParamsClientInfo({required this.name, this.version});

  factory _InitializeParamsClientInfo.fromJson(Map<String, Object?> json) =>
      _InitializeParamsClientInfo(
        name: json['name'] as String,
        version: json['version'] as String?,
      );

  final String name;

  final String? version;

  _InitializeParamsClientInfo copyWith({String? name, String? version}) =>
      _InitializeParamsClientInfo(
        name: name ?? this.name,
        version: version ?? this.version,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'name': name, 'version': version};
  }
}

final class ServerCapabilitiesWorkspace {
  const ServerCapabilitiesWorkspace({
    this.workspaceFolders,
    this.fileOperations,
  });

  factory ServerCapabilitiesWorkspace.fromJson(Map<String, Object?> json) =>
      ServerCapabilitiesWorkspace(
        workspaceFolders: json['workspaceFolders'] == null
            ? null
            : WorkspaceFoldersServerCapabilities.fromJson(
                json['workspaceFolders'] as Map<String, Object?>,
              ),
        fileOperations: json['fileOperations'] == null
            ? null
            : FileOperationOptions.fromJson(
                json['fileOperations'] as Map<String, Object?>,
              ),
      );

  final WorkspaceFoldersServerCapabilities? workspaceFolders;

  final FileOperationOptions? fileOperations;

  ServerCapabilitiesWorkspace copyWith({
    WorkspaceFoldersServerCapabilities? workspaceFolders,
    FileOperationOptions? fileOperations,
  }) => ServerCapabilitiesWorkspace(
    workspaceFolders: workspaceFolders ?? this.workspaceFolders,
    fileOperations: fileOperations ?? this.fileOperations,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workspaceFolders': workspaceFolders?.toJson(),
      'fileOperations': fileOperations?.toJson(),
    };
  }
}

final class CompletionOptionsCompletionItem {
  const CompletionOptionsCompletionItem({this.labelDetailsSupport});

  factory CompletionOptionsCompletionItem.fromJson(Map<String, Object?> json) =>
      CompletionOptionsCompletionItem(
        labelDetailsSupport: json['labelDetailsSupport'] as bool?,
      );

  final bool? labelDetailsSupport;

  CompletionOptionsCompletionItem copyWith({bool? labelDetailsSupport}) =>
      CompletionOptionsCompletionItem(
        labelDetailsSupport: labelDetailsSupport ?? this.labelDetailsSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'labelDetailsSupport': labelDetailsSupport};
  }
}

final class NotebookDocumentSyncOptionsNotebookSelector {
  const NotebookDocumentSyncOptionsNotebookSelector({
    required this.notebook,
    this.cells,
  });

  factory NotebookDocumentSyncOptionsNotebookSelector.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentSyncOptionsNotebookSelector(
    notebook: json['notebook'] as Object,
    cells: (json['cells'] as List<Object?>?)
        ?.map(
          (e) => NotebookDocumentSyncOptionsNotebookSelectorCells.fromJson(
            e as Map<String, Object?>,
          ),
        )
        .toList(),
  );

  final Object notebook;

  final List<NotebookDocumentSyncOptionsNotebookSelectorCells>? cells;

  NotebookDocumentSyncOptionsNotebookSelector copyWith({
    Object? notebook,
    List<NotebookDocumentSyncOptionsNotebookSelectorCells>? cells,
  }) => NotebookDocumentSyncOptionsNotebookSelector(
    notebook: notebook ?? this.notebook,
    cells: cells ?? this.cells,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebook': notebook,
      'cells': cells?.map((e) => e.toJson()).toList(),
    };
  }
}

final class NotebookDocumentSyncOptionsNotebookSelectorCells {
  const NotebookDocumentSyncOptionsNotebookSelectorCells({
    required this.language,
  });

  factory NotebookDocumentSyncOptionsNotebookSelectorCells.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentSyncOptionsNotebookSelectorCells(
    language: json['language'] as String,
  );

  final String language;

  NotebookDocumentSyncOptionsNotebookSelectorCells copyWith({
    String? language,
  }) => NotebookDocumentSyncOptionsNotebookSelectorCells(
    language: language ?? this.language,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'language': language};
  }
}

final class GeneralClientCapabilitiesStaleRequestSupport {
  const GeneralClientCapabilitiesStaleRequestSupport({
    required this.cancel,
    required this.retryOnContentModified,
  });

  factory GeneralClientCapabilitiesStaleRequestSupport.fromJson(
    Map<String, Object?> json,
  ) => GeneralClientCapabilitiesStaleRequestSupport(
    cancel: json['cancel'] as bool,
    retryOnContentModified: (json['retryOnContentModified'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  final bool cancel;

  final List<String> retryOnContentModified;

  GeneralClientCapabilitiesStaleRequestSupport copyWith({
    bool? cancel,
    List<String>? retryOnContentModified,
  }) => GeneralClientCapabilitiesStaleRequestSupport(
    cancel: cancel ?? this.cancel,
    retryOnContentModified:
        retryOnContentModified ?? this.retryOnContentModified,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'cancel': cancel,
      'retryOnContentModified': retryOnContentModified,
    };
  }
}

final class WorkspaceEditClientCapabilitiesChangeAnnotationSupport {
  const WorkspaceEditClientCapabilitiesChangeAnnotationSupport({
    this.groupsOnLabel,
  });

  factory WorkspaceEditClientCapabilitiesChangeAnnotationSupport.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceEditClientCapabilitiesChangeAnnotationSupport(
    groupsOnLabel: json['groupsOnLabel'] as bool?,
  );

  final bool? groupsOnLabel;

  WorkspaceEditClientCapabilitiesChangeAnnotationSupport copyWith({
    bool? groupsOnLabel,
  }) => WorkspaceEditClientCapabilitiesChangeAnnotationSupport(
    groupsOnLabel: groupsOnLabel ?? this.groupsOnLabel,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'groupsOnLabel': groupsOnLabel};
  }
}

final class WorkspaceSymbolClientCapabilitiesSymbolKind {
  const WorkspaceSymbolClientCapabilitiesSymbolKind({this.valueSet});

  factory WorkspaceSymbolClientCapabilitiesSymbolKind.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolClientCapabilitiesSymbolKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as SymbolKind)
        .toList(),
  );

  final List<SymbolKind>? valueSet;

  WorkspaceSymbolClientCapabilitiesSymbolKind copyWith({
    List<SymbolKind>? valueSet,
  }) => WorkspaceSymbolClientCapabilitiesSymbolKind(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class WorkspaceSymbolClientCapabilitiesTagSupport {
  const WorkspaceSymbolClientCapabilitiesTagSupport({required this.valueSet});

  factory WorkspaceSymbolClientCapabilitiesTagSupport.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolClientCapabilitiesTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as SymbolTag)
        .toList(),
  );

  final List<SymbolTag> valueSet;

  WorkspaceSymbolClientCapabilitiesTagSupport copyWith({
    List<SymbolTag>? valueSet,
  }) => WorkspaceSymbolClientCapabilitiesTagSupport(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class WorkspaceSymbolClientCapabilitiesResolveSupport {
  const WorkspaceSymbolClientCapabilitiesResolveSupport({
    required this.properties,
  });

  factory WorkspaceSymbolClientCapabilitiesResolveSupport.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolClientCapabilitiesResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  final List<String> properties;

  WorkspaceSymbolClientCapabilitiesResolveSupport copyWith({
    List<String>? properties,
  }) => WorkspaceSymbolClientCapabilitiesResolveSupport(
    properties: properties ?? this.properties,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

final class CompletionClientCapabilitiesCompletionItem {
  const CompletionClientCapabilitiesCompletionItem({
    this.snippetSupport,
    this.commitCharactersSupport,
    this.documentationFormat,
    this.deprecatedSupport,
    this.preselectSupport,
    this.tagSupport,
    this.insertReplaceSupport,
    this.resolveSupport,
    this.insertTextModeSupport,
    this.labelDetailsSupport,
  });

  factory CompletionClientCapabilitiesCompletionItem.fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItem(
    snippetSupport: json['snippetSupport'] as bool?,
    commitCharactersSupport: json['commitCharactersSupport'] as bool?,
    documentationFormat: (json['documentationFormat'] as List<Object?>?)
        ?.map((e) => e as MarkupKind)
        .toList(),
    deprecatedSupport: json['deprecatedSupport'] as bool?,
    preselectSupport: json['preselectSupport'] as bool?,
    tagSupport: json['tagSupport'] == null
        ? null
        : CompletionClientCapabilitiesCompletionItemTagSupport.fromJson(
            json['tagSupport'] as Map<String, Object?>,
          ),
    insertReplaceSupport: json['insertReplaceSupport'] as bool?,
    resolveSupport: json['resolveSupport'] == null
        ? null
        : CompletionClientCapabilitiesCompletionItemResolveSupport.fromJson(
            json['resolveSupport'] as Map<String, Object?>,
          ),
    insertTextModeSupport: json['insertTextModeSupport'] == null
        ? null
        : CompletionClientCapabilitiesCompletionItemInsertTextModeSupport.fromJson(
            json['insertTextModeSupport'] as Map<String, Object?>,
          ),
    labelDetailsSupport: json['labelDetailsSupport'] as bool?,
  );

  final bool? snippetSupport;

  final bool? commitCharactersSupport;

  final List<MarkupKind>? documentationFormat;

  final bool? deprecatedSupport;

  final bool? preselectSupport;

  final CompletionClientCapabilitiesCompletionItemTagSupport? tagSupport;

  final bool? insertReplaceSupport;

  final CompletionClientCapabilitiesCompletionItemResolveSupport?
  resolveSupport;

  final CompletionClientCapabilitiesCompletionItemInsertTextModeSupport?
  insertTextModeSupport;

  final bool? labelDetailsSupport;

  CompletionClientCapabilitiesCompletionItem copyWith({
    bool? snippetSupport,
    bool? commitCharactersSupport,
    List<MarkupKind>? documentationFormat,
    bool? deprecatedSupport,
    bool? preselectSupport,
    CompletionClientCapabilitiesCompletionItemTagSupport? tagSupport,
    bool? insertReplaceSupport,
    CompletionClientCapabilitiesCompletionItemResolveSupport? resolveSupport,
    CompletionClientCapabilitiesCompletionItemInsertTextModeSupport?
    insertTextModeSupport,
    bool? labelDetailsSupport,
  }) => CompletionClientCapabilitiesCompletionItem(
    snippetSupport: snippetSupport ?? this.snippetSupport,
    commitCharactersSupport:
        commitCharactersSupport ?? this.commitCharactersSupport,
    documentationFormat: documentationFormat ?? this.documentationFormat,
    deprecatedSupport: deprecatedSupport ?? this.deprecatedSupport,
    preselectSupport: preselectSupport ?? this.preselectSupport,
    tagSupport: tagSupport ?? this.tagSupport,
    insertReplaceSupport: insertReplaceSupport ?? this.insertReplaceSupport,
    resolveSupport: resolveSupport ?? this.resolveSupport,
    insertTextModeSupport: insertTextModeSupport ?? this.insertTextModeSupport,
    labelDetailsSupport: labelDetailsSupport ?? this.labelDetailsSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'snippetSupport': snippetSupport,
      'commitCharactersSupport': commitCharactersSupport,
      'documentationFormat': documentationFormat,
      'deprecatedSupport': deprecatedSupport,
      'preselectSupport': preselectSupport,
      'tagSupport': tagSupport?.toJson(),
      'insertReplaceSupport': insertReplaceSupport,
      'resolveSupport': resolveSupport?.toJson(),
      'insertTextModeSupport': insertTextModeSupport?.toJson(),
      'labelDetailsSupport': labelDetailsSupport,
    };
  }
}

final class CompletionClientCapabilitiesCompletionItemTagSupport {
  const CompletionClientCapabilitiesCompletionItemTagSupport({
    required this.valueSet,
  });

  factory CompletionClientCapabilitiesCompletionItemTagSupport.fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItemTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as CompletionItemTag)
        .toList(),
  );

  final List<CompletionItemTag> valueSet;

  CompletionClientCapabilitiesCompletionItemTagSupport copyWith({
    List<CompletionItemTag>? valueSet,
  }) => CompletionClientCapabilitiesCompletionItemTagSupport(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class CompletionClientCapabilitiesCompletionItemResolveSupport {
  const CompletionClientCapabilitiesCompletionItemResolveSupport({
    required this.properties,
  });

  factory CompletionClientCapabilitiesCompletionItemResolveSupport.fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItemResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  final List<String> properties;

  CompletionClientCapabilitiesCompletionItemResolveSupport copyWith({
    List<String>? properties,
  }) => CompletionClientCapabilitiesCompletionItemResolveSupport(
    properties: properties ?? this.properties,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

final class CompletionClientCapabilitiesCompletionItemInsertTextModeSupport {
  const CompletionClientCapabilitiesCompletionItemInsertTextModeSupport({
    required this.valueSet,
  });

  factory CompletionClientCapabilitiesCompletionItemInsertTextModeSupport.fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItemInsertTextModeSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as InsertTextMode)
        .toList(),
  );

  final List<InsertTextMode> valueSet;

  CompletionClientCapabilitiesCompletionItemInsertTextModeSupport copyWith({
    List<InsertTextMode>? valueSet,
  }) => CompletionClientCapabilitiesCompletionItemInsertTextModeSupport(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class CompletionClientCapabilitiesCompletionItemKind {
  const CompletionClientCapabilitiesCompletionItemKind({this.valueSet});

  factory CompletionClientCapabilitiesCompletionItemKind.fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItemKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as CompletionItemKind)
        .toList(),
  );

  final List<CompletionItemKind>? valueSet;

  CompletionClientCapabilitiesCompletionItemKind copyWith({
    List<CompletionItemKind>? valueSet,
  }) => CompletionClientCapabilitiesCompletionItemKind(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class CompletionClientCapabilitiesCompletionList {
  const CompletionClientCapabilitiesCompletionList({this.itemDefaults});

  factory CompletionClientCapabilitiesCompletionList.fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionList(
    itemDefaults: (json['itemDefaults'] as List<Object?>?)
        ?.map((e) => e as String)
        .toList(),
  );

  final List<String>? itemDefaults;

  CompletionClientCapabilitiesCompletionList copyWith({
    List<String>? itemDefaults,
  }) => CompletionClientCapabilitiesCompletionList(
    itemDefaults: itemDefaults ?? this.itemDefaults,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'itemDefaults': itemDefaults};
  }
}

final class SignatureHelpClientCapabilitiesSignatureInformation {
  const SignatureHelpClientCapabilitiesSignatureInformation({
    this.documentationFormat,
    this.parameterInformation,
    this.activeParameterSupport,
  });

  factory SignatureHelpClientCapabilitiesSignatureInformation.fromJson(
    Map<String, Object?> json,
  ) => SignatureHelpClientCapabilitiesSignatureInformation(
    documentationFormat: (json['documentationFormat'] as List<Object?>?)
        ?.map((e) => e as MarkupKind)
        .toList(),
    parameterInformation: json['parameterInformation'] == null
        ? null
        : SignatureHelpClientCapabilitiesSignatureInformationParameterInformation.fromJson(
            json['parameterInformation'] as Map<String, Object?>,
          ),
    activeParameterSupport: json['activeParameterSupport'] as bool?,
  );

  final List<MarkupKind>? documentationFormat;

  final SignatureHelpClientCapabilitiesSignatureInformationParameterInformation?
  parameterInformation;

  final bool? activeParameterSupport;

  SignatureHelpClientCapabilitiesSignatureInformation copyWith({
    List<MarkupKind>? documentationFormat,
    SignatureHelpClientCapabilitiesSignatureInformationParameterInformation?
    parameterInformation,
    bool? activeParameterSupport,
  }) => SignatureHelpClientCapabilitiesSignatureInformation(
    documentationFormat: documentationFormat ?? this.documentationFormat,
    parameterInformation: parameterInformation ?? this.parameterInformation,
    activeParameterSupport:
        activeParameterSupport ?? this.activeParameterSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentationFormat': documentationFormat,
      'parameterInformation': parameterInformation?.toJson(),
      'activeParameterSupport': activeParameterSupport,
    };
  }
}

final class SignatureHelpClientCapabilitiesSignatureInformationParameterInformation {
  const SignatureHelpClientCapabilitiesSignatureInformationParameterInformation({
    this.labelOffsetSupport,
  });

  factory SignatureHelpClientCapabilitiesSignatureInformationParameterInformation.fromJson(
    Map<String, Object?> json,
  ) => SignatureHelpClientCapabilitiesSignatureInformationParameterInformation(
    labelOffsetSupport: json['labelOffsetSupport'] as bool?,
  );

  final bool? labelOffsetSupport;

  SignatureHelpClientCapabilitiesSignatureInformationParameterInformation
  copyWith({bool? labelOffsetSupport}) =>
      SignatureHelpClientCapabilitiesSignatureInformationParameterInformation(
        labelOffsetSupport: labelOffsetSupport ?? this.labelOffsetSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'labelOffsetSupport': labelOffsetSupport};
  }
}

final class DocumentSymbolClientCapabilitiesSymbolKind {
  const DocumentSymbolClientCapabilitiesSymbolKind({this.valueSet});

  factory DocumentSymbolClientCapabilitiesSymbolKind.fromJson(
    Map<String, Object?> json,
  ) => DocumentSymbolClientCapabilitiesSymbolKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as SymbolKind)
        .toList(),
  );

  final List<SymbolKind>? valueSet;

  DocumentSymbolClientCapabilitiesSymbolKind copyWith({
    List<SymbolKind>? valueSet,
  }) => DocumentSymbolClientCapabilitiesSymbolKind(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class DocumentSymbolClientCapabilitiesTagSupport {
  const DocumentSymbolClientCapabilitiesTagSupport({required this.valueSet});

  factory DocumentSymbolClientCapabilitiesTagSupport.fromJson(
    Map<String, Object?> json,
  ) => DocumentSymbolClientCapabilitiesTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as SymbolTag)
        .toList(),
  );

  final List<SymbolTag> valueSet;

  DocumentSymbolClientCapabilitiesTagSupport copyWith({
    List<SymbolTag>? valueSet,
  }) => DocumentSymbolClientCapabilitiesTagSupport(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class CodeActionClientCapabilitiesCodeActionLiteralSupport {
  const CodeActionClientCapabilitiesCodeActionLiteralSupport({
    required this.codeActionKind,
  });

  factory CodeActionClientCapabilitiesCodeActionLiteralSupport.fromJson(
    Map<String, Object?> json,
  ) => CodeActionClientCapabilitiesCodeActionLiteralSupport(
    codeActionKind:
        CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind.fromJson(
          json['codeActionKind'] as Map<String, Object?>,
        ),
  );

  final CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind
  codeActionKind;

  CodeActionClientCapabilitiesCodeActionLiteralSupport copyWith({
    CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind?
    codeActionKind,
  }) => CodeActionClientCapabilitiesCodeActionLiteralSupport(
    codeActionKind: codeActionKind ?? this.codeActionKind,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'codeActionKind': codeActionKind.toJson()};
  }
}

final class CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind {
  const CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind({
    required this.valueSet,
  });

  factory CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind.fromJson(
    Map<String, Object?> json,
  ) => CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as CodeActionKind)
        .toList(),
  );

  final List<CodeActionKind> valueSet;

  CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind copyWith({
    List<CodeActionKind>? valueSet,
  }) => CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class CodeActionClientCapabilitiesResolveSupport {
  const CodeActionClientCapabilitiesResolveSupport({required this.properties});

  factory CodeActionClientCapabilitiesResolveSupport.fromJson(
    Map<String, Object?> json,
  ) => CodeActionClientCapabilitiesResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  final List<String> properties;

  CodeActionClientCapabilitiesResolveSupport copyWith({
    List<String>? properties,
  }) => CodeActionClientCapabilitiesResolveSupport(
    properties: properties ?? this.properties,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

final class FoldingRangeClientCapabilitiesFoldingRangeKind {
  const FoldingRangeClientCapabilitiesFoldingRangeKind({this.valueSet});

  factory FoldingRangeClientCapabilitiesFoldingRangeKind.fromJson(
    Map<String, Object?> json,
  ) => FoldingRangeClientCapabilitiesFoldingRangeKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as FoldingRangeKind)
        .toList(),
  );

  final List<FoldingRangeKind>? valueSet;

  FoldingRangeClientCapabilitiesFoldingRangeKind copyWith({
    List<FoldingRangeKind>? valueSet,
  }) => FoldingRangeClientCapabilitiesFoldingRangeKind(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class FoldingRangeClientCapabilitiesFoldingRange {
  const FoldingRangeClientCapabilitiesFoldingRange({this.collapsedText});

  factory FoldingRangeClientCapabilitiesFoldingRange.fromJson(
    Map<String, Object?> json,
  ) => FoldingRangeClientCapabilitiesFoldingRange(
    collapsedText: json['collapsedText'] as bool?,
  );

  final bool? collapsedText;

  FoldingRangeClientCapabilitiesFoldingRange copyWith({bool? collapsedText}) =>
      FoldingRangeClientCapabilitiesFoldingRange(
        collapsedText: collapsedText ?? this.collapsedText,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'collapsedText': collapsedText};
  }
}

final class PublishDiagnosticsClientCapabilitiesTagSupport {
  const PublishDiagnosticsClientCapabilitiesTagSupport({
    required this.valueSet,
  });

  factory PublishDiagnosticsClientCapabilitiesTagSupport.fromJson(
    Map<String, Object?> json,
  ) => PublishDiagnosticsClientCapabilitiesTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as DiagnosticTag)
        .toList(),
  );

  final List<DiagnosticTag> valueSet;

  PublishDiagnosticsClientCapabilitiesTagSupport copyWith({
    List<DiagnosticTag>? valueSet,
  }) => PublishDiagnosticsClientCapabilitiesTagSupport(
    valueSet: valueSet ?? this.valueSet,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

final class SemanticTokensClientCapabilitiesRequests {
  const SemanticTokensClientCapabilitiesRequests({this.range, this.full});

  factory SemanticTokensClientCapabilitiesRequests.fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensClientCapabilitiesRequests(
    range: json['range'] as Object?,
    full: json['full'] as Object?,
  );

  final Object? range;

  final Object? full;

  SemanticTokensClientCapabilitiesRequests copyWith({
    Object? range,
    Object? full,
  }) => SemanticTokensClientCapabilitiesRequests(
    range: range ?? this.range,
    full: full ?? this.full,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range, 'full': full};
  }
}

final class SemanticTokensClientCapabilitiesRequestsRange {
  const SemanticTokensClientCapabilitiesRequestsRange();

  factory SemanticTokensClientCapabilitiesRequestsRange.fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensClientCapabilitiesRequestsRange();

  Map<String, Object?> toJson() {
    return <String, Object?>{};
  }
}

final class SemanticTokensClientCapabilitiesRequestsFull {
  const SemanticTokensClientCapabilitiesRequestsFull({this.delta});

  factory SemanticTokensClientCapabilitiesRequestsFull.fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensClientCapabilitiesRequestsFull(
    delta: json['delta'] as bool?,
  );

  final bool? delta;

  SemanticTokensClientCapabilitiesRequestsFull copyWith({bool? delta}) =>
      SemanticTokensClientCapabilitiesRequestsFull(delta: delta ?? this.delta);

  Map<String, Object?> toJson() {
    return <String, Object?>{'delta': delta};
  }
}

final class InlayHintClientCapabilitiesResolveSupport {
  const InlayHintClientCapabilitiesResolveSupport({required this.properties});

  factory InlayHintClientCapabilitiesResolveSupport.fromJson(
    Map<String, Object?> json,
  ) => InlayHintClientCapabilitiesResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  final List<String> properties;

  InlayHintClientCapabilitiesResolveSupport copyWith({
    List<String>? properties,
  }) => InlayHintClientCapabilitiesResolveSupport(
    properties: properties ?? this.properties,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

final class ShowMessageRequestClientCapabilitiesMessageActionItem {
  const ShowMessageRequestClientCapabilitiesMessageActionItem({
    this.additionalPropertiesSupport,
  });

  factory ShowMessageRequestClientCapabilitiesMessageActionItem.fromJson(
    Map<String, Object?> json,
  ) => ShowMessageRequestClientCapabilitiesMessageActionItem(
    additionalPropertiesSupport: json['additionalPropertiesSupport'] as bool?,
  );

  final bool? additionalPropertiesSupport;

  ShowMessageRequestClientCapabilitiesMessageActionItem copyWith({
    bool? additionalPropertiesSupport,
  }) => ShowMessageRequestClientCapabilitiesMessageActionItem(
    additionalPropertiesSupport:
        additionalPropertiesSupport ?? this.additionalPropertiesSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'additionalPropertiesSupport': additionalPropertiesSupport,
    };
  }
}

final class PrepareRenameResult {
  const PrepareRenameResult({required this.range, required this.placeholder});

  factory PrepareRenameResult.fromJson(Map<String, Object?> json) =>
      PrepareRenameResult(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        placeholder: json['placeholder'] as String,
      );

  final Range range;

  final String placeholder;

  PrepareRenameResult copyWith({Range? range, String? placeholder}) =>
      PrepareRenameResult(
        range: range ?? this.range,
        placeholder: placeholder ?? this.placeholder,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'placeholder': placeholder,
    };
  }
}

final class TextDocumentContentChangeEvent {
  const TextDocumentContentChangeEvent({
    required this.range,
    this.rangeLength,
    required this.text,
  });

  factory TextDocumentContentChangeEvent.fromJson(Map<String, Object?> json) =>
      TextDocumentContentChangeEvent(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        rangeLength: json['rangeLength'] as int?,
        text: json['text'] as String,
      );

  final Range range;

  final int? rangeLength;

  final String text;

  TextDocumentContentChangeEvent copyWith({
    Range? range,
    int? rangeLength,
    String? text,
  }) => TextDocumentContentChangeEvent(
    range: range ?? this.range,
    rangeLength: rangeLength ?? this.rangeLength,
    text: text ?? this.text,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'rangeLength': rangeLength,
      'text': text,
    };
  }
}

final class MarkedString {
  const MarkedString({required this.language, required this.value});

  factory MarkedString.fromJson(Map<String, Object?> json) => MarkedString(
    language: json['language'] as String,
    value: json['value'] as String,
  );

  final String language;

  final String value;

  MarkedString copyWith({String? language, String? value}) => MarkedString(
    language: language ?? this.language,
    value: value ?? this.value,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'language': language, 'value': value};
  }
}

final class TextDocumentFilter {
  const TextDocumentFilter({required this.language, this.scheme, this.pattern});

  factory TextDocumentFilter.fromJson(Map<String, Object?> json) =>
      TextDocumentFilter(
        language: json['language'] as String,
        scheme: json['scheme'] as String?,
        pattern: json['pattern'] as String?,
      );

  final String language;

  final String? scheme;

  final String? pattern;

  TextDocumentFilter copyWith({
    String? language,
    String? scheme,
    String? pattern,
  }) => TextDocumentFilter(
    language: language ?? this.language,
    scheme: scheme ?? this.scheme,
    pattern: pattern ?? this.pattern,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'language': language,
      'scheme': scheme,
      'pattern': pattern,
    };
  }
}

final class NotebookDocumentFilter {
  const NotebookDocumentFilter({
    required this.notebookType,
    this.scheme,
    this.pattern,
  });

  factory NotebookDocumentFilter.fromJson(Map<String, Object?> json) =>
      NotebookDocumentFilter(
        notebookType: json['notebookType'] as String,
        scheme: json['scheme'] as String?,
        pattern: json['pattern'] as String?,
      );

  final String notebookType;

  final String? scheme;

  final String? pattern;

  NotebookDocumentFilter copyWith({
    String? notebookType,
    String? scheme,
    String? pattern,
  }) => NotebookDocumentFilter(
    notebookType: notebookType ?? this.notebookType,
    scheme: scheme ?? this.scheme,
    pattern: pattern ?? this.pattern,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookType': notebookType,
      'scheme': scheme,
      'pattern': pattern,
    };
  }
}

final class ImplementationParams {
  const ImplementationParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
  });

  factory ImplementationParams.fromJson(Map<String, Object?> json) =>
      ImplementationParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  ImplementationParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) => ImplementationParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
    };
  }
}

/// Represents a location inside a resource, such as a line
/// inside a text file.
final class Location {
  const Location({required this.uri, required this.range});

  factory Location.fromJson(Map<String, Object?> json) => Location(
    uri: json['uri'] as String,
    range: Range.fromJson(json['range'] as Map<String, Object?>),
  );

  final String uri;

  final Range range;

  Location copyWith({String? uri, Range? range}) =>
      Location(uri: uri ?? this.uri, range: range ?? this.range);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'range': range.toJson()};
  }
}

final class ImplementationRegistrationOptions {
  const ImplementationRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.id,
  });

  factory ImplementationRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => ImplementationRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? id;

  ImplementationRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) => ImplementationRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

final class TypeDefinitionParams {
  const TypeDefinitionParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
  });

  factory TypeDefinitionParams.fromJson(Map<String, Object?> json) =>
      TypeDefinitionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  TypeDefinitionParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) => TypeDefinitionParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
    };
  }
}

final class TypeDefinitionRegistrationOptions {
  const TypeDefinitionRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.id,
  });

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => TypeDefinitionRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? id;

  TypeDefinitionRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) => TypeDefinitionRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

/// A workspace folder inside a client.
final class WorkspaceFolder {
  const WorkspaceFolder({required this.uri, required this.name});

  factory WorkspaceFolder.fromJson(Map<String, Object?> json) =>
      WorkspaceFolder(uri: json['uri'] as String, name: json['name'] as String);

  final String uri;

  final String name;

  WorkspaceFolder copyWith({String? uri, String? name}) =>
      WorkspaceFolder(uri: uri ?? this.uri, name: name ?? this.name);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'name': name};
  }
}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
final class DidChangeWorkspaceFoldersParams {
  const DidChangeWorkspaceFoldersParams({required this.event});

  factory DidChangeWorkspaceFoldersParams.fromJson(Map<String, Object?> json) =>
      DidChangeWorkspaceFoldersParams(
        event: WorkspaceFoldersChangeEvent.fromJson(
          json['event'] as Map<String, Object?>,
        ),
      );

  final WorkspaceFoldersChangeEvent event;

  DidChangeWorkspaceFoldersParams copyWith({
    WorkspaceFoldersChangeEvent? event,
  }) => DidChangeWorkspaceFoldersParams(event: event ?? this.event);

  Map<String, Object?> toJson() {
    return <String, Object?>{'event': event.toJson()};
  }
}

/// The parameters of a configuration request.
final class ConfigurationParams {
  const ConfigurationParams({required this.items});

  factory ConfigurationParams.fromJson(Map<String, Object?> json) =>
      ConfigurationParams(
        items: (json['items'] as List<Object?>)
            .map((e) => ConfigurationItem.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<ConfigurationItem> items;

  ConfigurationParams copyWith({List<ConfigurationItem>? items}) =>
      ConfigurationParams(items: items ?? this.items);

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items.map((e) => e.toJson()).toList()};
  }
}

/// Parameters for a {@link DocumentColorRequest}.
final class DocumentColorParams {
  const DocumentColorParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
  });

  factory DocumentColorParams.fromJson(Map<String, Object?> json) =>
      DocumentColorParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  DocumentColorParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
  }) => DocumentColorParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Represents a color range from a document.
final class ColorInformation {
  const ColorInformation({required this.range, required this.color});

  factory ColorInformation.fromJson(Map<String, Object?> json) =>
      ColorInformation(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        color: Color.fromJson(json['color'] as Map<String, Object?>),
      );

  final Range range;

  final Color color;

  ColorInformation copyWith({Range? range, Color? color}) =>
      ColorInformation(range: range ?? this.range, color: color ?? this.color);

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'color': color.toJson()};
  }
}

final class DocumentColorRegistrationOptions {
  const DocumentColorRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.id,
  });

  factory DocumentColorRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DocumentColorRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? id;

  DocumentColorRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) => DocumentColorRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

/// Parameters for a {@link ColorPresentationRequest}.
final class ColorPresentationParams {
  const ColorPresentationParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
    required this.color,
    required this.range,
  });

  factory ColorPresentationParams.fromJson(Map<String, Object?> json) =>
      ColorPresentationParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        color: Color.fromJson(json['color'] as Map<String, Object?>),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  final Color color;

  final Range range;

  ColorPresentationParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
    Color? color,
    Range? range,
  }) => ColorPresentationParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
    color: color ?? this.color,
    range: range ?? this.range,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'color': color.toJson(),
      'range': range.toJson(),
    };
  }
}

final class ColorPresentation {
  const ColorPresentation({
    required this.label,
    this.textEdit,
    this.additionalTextEdits,
  });

  factory ColorPresentation.fromJson(Map<String, Object?> json) =>
      ColorPresentation(
        label: json['label'] as String,
        textEdit: json['textEdit'] == null
            ? null
            : TextEdit.fromJson(json['textEdit'] as Map<String, Object?>),
        additionalTextEdits: (json['additionalTextEdits'] as List<Object?>?)
            ?.map((e) => TextEdit.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final String label;

  final TextEdit? textEdit;

  final List<TextEdit>? additionalTextEdits;

  ColorPresentation copyWith({
    String? label,
    TextEdit? textEdit,
    List<TextEdit>? additionalTextEdits,
  }) => ColorPresentation(
    label: label ?? this.label,
    textEdit: textEdit ?? this.textEdit,
    additionalTextEdits: additionalTextEdits ?? this.additionalTextEdits,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'label': label,
      'textEdit': textEdit?.toJson(),
      'additionalTextEdits': additionalTextEdits
          ?.map((e) => e.toJson())
          .toList(),
    };
  }
}

final class WorkDoneProgressOptions {
  const WorkDoneProgressOptions({this.workDoneProgress});

  factory WorkDoneProgressOptions.fromJson(Map<String, Object?> json) =>
      WorkDoneProgressOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  WorkDoneProgressOptions copyWith({bool? workDoneProgress}) =>
      WorkDoneProgressOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// General text document registration options.
final class TextDocumentRegistrationOptions {
  const TextDocumentRegistrationOptions({required this.documentSelector});

  factory TextDocumentRegistrationOptions.fromJson(Map<String, Object?> json) =>
      TextDocumentRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
      );

  final DocumentSelector? documentSelector;

  TextDocumentRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
  }) => TextDocumentRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'documentSelector': documentSelector};
  }
}

/// Parameters for a {@link FoldingRangeRequest}.
final class FoldingRangeParams {
  const FoldingRangeParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
  });

  factory FoldingRangeParams.fromJson(Map<String, Object?> json) =>
      FoldingRangeParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  FoldingRangeParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
  }) => FoldingRangeParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Represents a folding range. To be valid, start and end line must be bigger than zero and smaller
/// than the number of lines in the document. Clients are free to ignore invalid ranges.
final class FoldingRange {
  const FoldingRange({
    required this.startLine,
    this.startCharacter,
    required this.endLine,
    this.endCharacter,
    this.kind,
    this.collapsedText,
  });

  factory FoldingRange.fromJson(Map<String, Object?> json) => FoldingRange(
    startLine: json['startLine'] as int,
    startCharacter: json['startCharacter'] as int?,
    endLine: json['endLine'] as int,
    endCharacter: json['endCharacter'] as int?,
    kind: json['kind'] == null
        ? null
        : FoldingRangeKind(json['kind'] as String),
    collapsedText: json['collapsedText'] as String?,
  );

  final int startLine;

  final int? startCharacter;

  final int endLine;

  final int? endCharacter;

  final FoldingRangeKind? kind;

  final String? collapsedText;

  FoldingRange copyWith({
    int? startLine,
    int? startCharacter,
    int? endLine,
    int? endCharacter,
    FoldingRangeKind? kind,
    String? collapsedText,
  }) => FoldingRange(
    startLine: startLine ?? this.startLine,
    startCharacter: startCharacter ?? this.startCharacter,
    endLine: endLine ?? this.endLine,
    endCharacter: endCharacter ?? this.endCharacter,
    kind: kind ?? this.kind,
    collapsedText: collapsedText ?? this.collapsedText,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'startLine': startLine,
      'startCharacter': startCharacter,
      'endLine': endLine,
      'endCharacter': endCharacter,
      'kind': kind?.value,
      'collapsedText': collapsedText,
    };
  }
}

final class FoldingRangeRegistrationOptions {
  const FoldingRangeRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.id,
  });

  factory FoldingRangeRegistrationOptions.fromJson(Map<String, Object?> json) =>
      FoldingRangeRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        id: json['id'] as String?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? id;

  FoldingRangeRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) => FoldingRangeRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

final class DeclarationParams {
  const DeclarationParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
  });

  factory DeclarationParams.fromJson(Map<String, Object?> json) =>
      DeclarationParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  DeclarationParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) => DeclarationParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
    };
  }
}

final class DeclarationRegistrationOptions {
  const DeclarationRegistrationOptions({
    this.workDoneProgress,
    required this.documentSelector,
    this.id,
  });

  factory DeclarationRegistrationOptions.fromJson(Map<String, Object?> json) =>
      DeclarationRegistrationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        documentSelector: json['documentSelector'] as DocumentSelector?,
        id: json['id'] as String?,
      );

  final bool? workDoneProgress;

  final DocumentSelector? documentSelector;

  final String? id;

  DeclarationRegistrationOptions copyWith({
    bool? workDoneProgress,
    DocumentSelector? documentSelector,
    String? id,
  }) => DeclarationRegistrationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    documentSelector: documentSelector ?? this.documentSelector,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'documentSelector': documentSelector,
      'id': id,
    };
  }
}

/// A parameter literal used in selection range requests.
final class SelectionRangeParams {
  const SelectionRangeParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
    required this.positions,
  });

  factory SelectionRangeParams.fromJson(Map<String, Object?> json) =>
      SelectionRangeParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        positions: (json['positions'] as List<Object?>)
            .map((e) => Position.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  final List<Position> positions;

  SelectionRangeParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
    List<Position>? positions,
  }) => SelectionRangeParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
    positions: positions ?? this.positions,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'positions': positions.map((e) => e.toJson()).toList(),
    };
  }
}

/// A selection range represents a part of a selection hierarchy. A selection range
/// may have a parent selection range that contains it.
final class SelectionRange {
  const SelectionRange({required this.range, this.parent});

  factory SelectionRange.fromJson(Map<String, Object?> json) => SelectionRange(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    parent: json['parent'] == null
        ? null
        : SelectionRange.fromJson(json['parent'] as Map<String, Object?>),
  );

  final Range range;

  final SelectionRange? parent;

  SelectionRange copyWith({Range? range, SelectionRange? parent}) =>
      SelectionRange(range: range ?? this.range, parent: parent ?? this.parent);

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'parent': parent?.toJson(),
    };
  }
}

final class SelectionRangeRegistrationOptions {
  const SelectionRangeRegistrationOptions({
    this.workDoneProgress,
    required this.documentSelector,
    this.id,
  });

  factory SelectionRangeRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => SelectionRangeRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    documentSelector: json['documentSelector'] as DocumentSelector?,
    id: json['id'] as String?,
  );

  final bool? workDoneProgress;

  final DocumentSelector? documentSelector;

  final String? id;

  SelectionRangeRegistrationOptions copyWith({
    bool? workDoneProgress,
    DocumentSelector? documentSelector,
    String? id,
  }) => SelectionRangeRegistrationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    documentSelector: documentSelector ?? this.documentSelector,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'documentSelector': documentSelector,
      'id': id,
    };
  }
}

final class WorkDoneProgressCreateParams {
  const WorkDoneProgressCreateParams({required this.token});

  factory WorkDoneProgressCreateParams.fromJson(Map<String, Object?> json) =>
      WorkDoneProgressCreateParams(token: json['token'] as ProgressToken);

  final ProgressToken token;

  WorkDoneProgressCreateParams copyWith({ProgressToken? token}) =>
      WorkDoneProgressCreateParams(token: token ?? this.token);

  Map<String, Object?> toJson() {
    return <String, Object?>{'token': token};
  }
}

final class WorkDoneProgressCancelParams {
  const WorkDoneProgressCancelParams({required this.token});

  factory WorkDoneProgressCancelParams.fromJson(Map<String, Object?> json) =>
      WorkDoneProgressCancelParams(token: json['token'] as ProgressToken);

  final ProgressToken token;

  WorkDoneProgressCancelParams copyWith({ProgressToken? token}) =>
      WorkDoneProgressCancelParams(token: token ?? this.token);

  Map<String, Object?> toJson() {
    return <String, Object?>{'token': token};
  }
}

/// The parameter of a `textDocument/prepareCallHierarchy` request.
///
/// @since 3.16.0
final class CallHierarchyPrepareParams {
  const CallHierarchyPrepareParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
  });

  factory CallHierarchyPrepareParams.fromJson(Map<String, Object?> json) =>
      CallHierarchyPrepareParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  CallHierarchyPrepareParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
  }) => CallHierarchyPrepareParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents programming constructs like functions or constructors in the context
/// of call hierarchy.
///
/// @since 3.16.0
final class CallHierarchyItem {
  const CallHierarchyItem({
    required this.name,
    required this.kind,
    this.tags,
    this.detail,
    required this.uri,
    required this.range,
    required this.selectionRange,
    this.data,
  });

  factory CallHierarchyItem.fromJson(
    Map<String, Object?> json,
  ) => CallHierarchyItem(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    detail: json['detail'] as String?,
    uri: json['uri'] as String,
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    selectionRange: Range.fromJson(
      json['selectionRange'] as Map<String, Object?>,
    ),
    data: json['data'] as LSPAny?,
  );

  final String name;

  final SymbolKind kind;

  final List<SymbolTag>? tags;

  final String? detail;

  final String uri;

  final Range range;

  final Range selectionRange;

  final LSPAny? data;

  CallHierarchyItem copyWith({
    String? name,
    SymbolKind? kind,
    List<SymbolTag>? tags,
    String? detail,
    String? uri,
    Range? range,
    Range? selectionRange,
    LSPAny? data,
  }) => CallHierarchyItem(
    name: name ?? this.name,
    kind: kind ?? this.kind,
    tags: tags ?? this.tags,
    detail: detail ?? this.detail,
    uri: uri ?? this.uri,
    range: range ?? this.range,
    selectionRange: selectionRange ?? this.selectionRange,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'kind': kind.value,
      'tags': tags,
      'detail': detail,
      'uri': uri,
      'range': range.toJson(),
      'selectionRange': selectionRange.toJson(),
      'data': data,
    };
  }
}

/// Call hierarchy options used during static or dynamic registration.
///
/// @since 3.16.0
final class CallHierarchyRegistrationOptions {
  const CallHierarchyRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.id,
  });

  factory CallHierarchyRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => CallHierarchyRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? id;

  CallHierarchyRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) => CallHierarchyRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

/// The parameter of a `callHierarchy/incomingCalls` request.
///
/// @since 3.16.0
final class CallHierarchyIncomingCallsParams {
  const CallHierarchyIncomingCallsParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.item,
  });

  factory CallHierarchyIncomingCallsParams.fromJson(
    Map<String, Object?> json,
  ) => CallHierarchyIncomingCallsParams(
    workDoneToken: json['workDoneToken'] as ProgressToken?,
    partialResultToken: json['partialResultToken'] as ProgressToken?,
    item: CallHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
  );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final CallHierarchyItem item;

  CallHierarchyIncomingCallsParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    CallHierarchyItem? item,
  }) => CallHierarchyIncomingCallsParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    item: item ?? this.item,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'item': item.toJson(),
    };
  }
}

/// Represents an incoming call, e.g. a caller of a method or constructor.
///
/// @since 3.16.0
final class CallHierarchyIncomingCall {
  const CallHierarchyIncomingCall({
    required this.from,
    required this.fromRanges,
  });

  factory CallHierarchyIncomingCall.fromJson(Map<String, Object?> json) =>
      CallHierarchyIncomingCall(
        from: CallHierarchyItem.fromJson(json['from'] as Map<String, Object?>),
        fromRanges: (json['fromRanges'] as List<Object?>)
            .map((e) => Range.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final CallHierarchyItem from;

  final List<Range> fromRanges;

  CallHierarchyIncomingCall copyWith({
    CallHierarchyItem? from,
    List<Range>? fromRanges,
  }) => CallHierarchyIncomingCall(
    from: from ?? this.from,
    fromRanges: fromRanges ?? this.fromRanges,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'from': from.toJson(),
      'fromRanges': fromRanges.map((e) => e.toJson()).toList(),
    };
  }
}

/// The parameter of a `callHierarchy/outgoingCalls` request.
///
/// @since 3.16.0
final class CallHierarchyOutgoingCallsParams {
  const CallHierarchyOutgoingCallsParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.item,
  });

  factory CallHierarchyOutgoingCallsParams.fromJson(
    Map<String, Object?> json,
  ) => CallHierarchyOutgoingCallsParams(
    workDoneToken: json['workDoneToken'] as ProgressToken?,
    partialResultToken: json['partialResultToken'] as ProgressToken?,
    item: CallHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
  );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final CallHierarchyItem item;

  CallHierarchyOutgoingCallsParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    CallHierarchyItem? item,
  }) => CallHierarchyOutgoingCallsParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    item: item ?? this.item,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'item': item.toJson(),
    };
  }
}

/// Represents an outgoing call, e.g. calling a getter from a method or a method from a constructor etc.
///
/// @since 3.16.0
final class CallHierarchyOutgoingCall {
  const CallHierarchyOutgoingCall({required this.to, required this.fromRanges});

  factory CallHierarchyOutgoingCall.fromJson(Map<String, Object?> json) =>
      CallHierarchyOutgoingCall(
        to: CallHierarchyItem.fromJson(json['to'] as Map<String, Object?>),
        fromRanges: (json['fromRanges'] as List<Object?>)
            .map((e) => Range.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final CallHierarchyItem to;

  final List<Range> fromRanges;

  CallHierarchyOutgoingCall copyWith({
    CallHierarchyItem? to,
    List<Range>? fromRanges,
  }) => CallHierarchyOutgoingCall(
    to: to ?? this.to,
    fromRanges: fromRanges ?? this.fromRanges,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'to': to.toJson(),
      'fromRanges': fromRanges.map((e) => e.toJson()).toList(),
    };
  }
}

/// @since 3.16.0
final class SemanticTokensParams {
  const SemanticTokensParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
  });

  factory SemanticTokensParams.fromJson(Map<String, Object?> json) =>
      SemanticTokensParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  SemanticTokensParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
  }) => SemanticTokensParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
    };
  }
}

/// @since 3.16.0
final class SemanticTokens {
  const SemanticTokens({this.resultId, required this.data});

  factory SemanticTokens.fromJson(Map<String, Object?> json) => SemanticTokens(
    resultId: json['resultId'] as String?,
    data: (json['data'] as List<Object?>).map((e) => e as int).toList(),
  );

  final String? resultId;

  final List<int> data;

  SemanticTokens copyWith({String? resultId, List<int>? data}) =>
      SemanticTokens(
        resultId: resultId ?? this.resultId,
        data: data ?? this.data,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'resultId': resultId, 'data': data};
  }
}

/// @since 3.16.0
final class SemanticTokensPartialResult {
  const SemanticTokensPartialResult({required this.data});

  factory SemanticTokensPartialResult.fromJson(Map<String, Object?> json) =>
      SemanticTokensPartialResult(
        data: (json['data'] as List<Object?>).map((e) => e as int).toList(),
      );

  final List<int> data;

  SemanticTokensPartialResult copyWith({List<int>? data}) =>
      SemanticTokensPartialResult(data: data ?? this.data);

  Map<String, Object?> toJson() {
    return <String, Object?>{'data': data};
  }
}

/// @since 3.16.0
final class SemanticTokensRegistrationOptions {
  const SemanticTokensRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    required this.legend,
    this.range,
    this.full,
    this.id,
  });

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    legend: SemanticTokensLegend.fromJson(
      json['legend'] as Map<String, Object?>,
    ),
    range: json['range'] as Object?,
    full: json['full'] as Object?,
    id: json['id'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final SemanticTokensLegend legend;

  final Object? range;

  final Object? full;

  final String? id;

  SemanticTokensRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    SemanticTokensLegend? legend,
    Object? range,
    Object? full,
    String? id,
  }) => SemanticTokensRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    legend: legend ?? this.legend,
    range: range ?? this.range,
    full: full ?? this.full,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'legend': legend.toJson(),
      'range': range,
      'full': full,
      'id': id,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensDeltaParams {
  const SemanticTokensDeltaParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
    required this.previousResultId,
  });

  factory SemanticTokensDeltaParams.fromJson(Map<String, Object?> json) =>
      SemanticTokensDeltaParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        previousResultId: json['previousResultId'] as String,
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  final String previousResultId;

  SemanticTokensDeltaParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
    String? previousResultId,
  }) => SemanticTokensDeltaParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
    previousResultId: previousResultId ?? this.previousResultId,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'previousResultId': previousResultId,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensDelta {
  const SemanticTokensDelta({this.resultId, required this.edits});

  factory SemanticTokensDelta.fromJson(Map<String, Object?> json) =>
      SemanticTokensDelta(
        resultId: json['resultId'] as String?,
        edits: (json['edits'] as List<Object?>)
            .map((e) => SemanticTokensEdit.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final String? resultId;

  final List<SemanticTokensEdit> edits;

  SemanticTokensDelta copyWith({
    String? resultId,
    List<SemanticTokensEdit>? edits,
  }) => SemanticTokensDelta(
    resultId: resultId ?? this.resultId,
    edits: edits ?? this.edits,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'resultId': resultId,
      'edits': edits.map((e) => e.toJson()).toList(),
    };
  }
}

/// @since 3.16.0
final class SemanticTokensDeltaPartialResult {
  const SemanticTokensDeltaPartialResult({required this.edits});

  factory SemanticTokensDeltaPartialResult.fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensDeltaPartialResult(
    edits: (json['edits'] as List<Object?>)
        .map((e) => SemanticTokensEdit.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  final List<SemanticTokensEdit> edits;

  SemanticTokensDeltaPartialResult copyWith({
    List<SemanticTokensEdit>? edits,
  }) => SemanticTokensDeltaPartialResult(edits: edits ?? this.edits);

  Map<String, Object?> toJson() {
    return <String, Object?>{'edits': edits.map((e) => e.toJson()).toList()};
  }
}

/// @since 3.16.0
final class SemanticTokensRangeParams {
  const SemanticTokensRangeParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
    required this.range,
  });

  factory SemanticTokensRangeParams.fromJson(Map<String, Object?> json) =>
      SemanticTokensRangeParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  final Range range;

  SemanticTokensRangeParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
    Range? range,
  }) => SemanticTokensRangeParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
    range: range ?? this.range,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
    };
  }
}

/// Params to show a resource in the UI.
///
/// @since 3.16.0
final class ShowDocumentParams {
  const ShowDocumentParams({
    required this.uri,
    this.external,
    this.takeFocus,
    this.selection,
  });

  factory ShowDocumentParams.fromJson(Map<String, Object?> json) =>
      ShowDocumentParams(
        uri: json['uri'] as String,
        external: json['external'] as bool?,
        takeFocus: json['takeFocus'] as bool?,
        selection: json['selection'] == null
            ? null
            : Range.fromJson(json['selection'] as Map<String, Object?>),
      );

  final String uri;

  final bool? external;

  final bool? takeFocus;

  final Range? selection;

  ShowDocumentParams copyWith({
    String? uri,
    bool? external,
    bool? takeFocus,
    Range? selection,
  }) => ShowDocumentParams(
    uri: uri ?? this.uri,
    external: external ?? this.external,
    takeFocus: takeFocus ?? this.takeFocus,
    selection: selection ?? this.selection,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'uri': uri,
      'external': external,
      'takeFocus': takeFocus,
      'selection': selection?.toJson(),
    };
  }
}

/// The result of a showDocument request.
///
/// @since 3.16.0
final class ShowDocumentResult {
  const ShowDocumentResult({required this.success});

  factory ShowDocumentResult.fromJson(Map<String, Object?> json) =>
      ShowDocumentResult(success: json['success'] as bool);

  final bool success;

  ShowDocumentResult copyWith({bool? success}) =>
      ShowDocumentResult(success: success ?? this.success);

  Map<String, Object?> toJson() {
    return <String, Object?>{'success': success};
  }
}

final class LinkedEditingRangeParams {
  const LinkedEditingRangeParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
  });

  factory LinkedEditingRangeParams.fromJson(Map<String, Object?> json) =>
      LinkedEditingRangeParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  LinkedEditingRangeParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
  }) => LinkedEditingRangeParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// The result of a linked editing range request.
///
/// @since 3.16.0
final class LinkedEditingRanges {
  const LinkedEditingRanges({required this.ranges, this.wordPattern});

  factory LinkedEditingRanges.fromJson(Map<String, Object?> json) =>
      LinkedEditingRanges(
        ranges: (json['ranges'] as List<Object?>)
            .map((e) => Range.fromJson(e as Map<String, Object?>))
            .toList(),
        wordPattern: json['wordPattern'] as String?,
      );

  final List<Range> ranges;

  final String? wordPattern;

  LinkedEditingRanges copyWith({List<Range>? ranges, String? wordPattern}) =>
      LinkedEditingRanges(
        ranges: ranges ?? this.ranges,
        wordPattern: wordPattern ?? this.wordPattern,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'ranges': ranges.map((e) => e.toJson()).toList(),
      'wordPattern': wordPattern,
    };
  }
}

final class LinkedEditingRangeRegistrationOptions {
  const LinkedEditingRangeRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.id,
  });

  factory LinkedEditingRangeRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => LinkedEditingRangeRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? id;

  LinkedEditingRangeRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) => LinkedEditingRangeRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

/// The parameters sent in notifications/requests for user-initiated creation of
/// files.
///
/// @since 3.16.0
final class CreateFilesParams {
  const CreateFilesParams({required this.files});

  factory CreateFilesParams.fromJson(Map<String, Object?> json) =>
      CreateFilesParams(
        files: (json['files'] as List<Object?>)
            .map((e) => FileCreate.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<FileCreate> files;

  CreateFilesParams copyWith({List<FileCreate>? files}) =>
      CreateFilesParams(files: files ?? this.files);

  Map<String, Object?> toJson() {
    return <String, Object?>{'files': files.map((e) => e.toJson()).toList()};
  }
}

/// A workspace edit represents changes to many resources managed in the workspace. The edit
/// should either provide `changes` or `documentChanges`. If documentChanges are present
/// they are preferred over `changes` if the client can handle versioned document edits.
///
/// Since version 3.13.0 a workspace edit can contain resource operations as well. If resource
/// operations are present clients need to execute the operations in the order in which they
/// are provided. So a workspace edit for example can consist of the following two changes:
/// (1) a create file a.txt and (2) a text document edit which insert text into file a.txt.
///
/// An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into file a.txt) will
/// cause failure of the operation. How the client recovers from the failure is described by
/// the client capability: `workspace.workspaceEdit.failureHandling`
final class WorkspaceEdit {
  const WorkspaceEdit({
    this.changes,
    this.documentChanges,
    this.changeAnnotations,
  });

  factory WorkspaceEdit.fromJson(Map<String, Object?> json) => WorkspaceEdit(
    changes: (json['changes'] as Map<String, Object?>?)?.map(
      (k, v) => MapEntry(k, v as List<TextEdit>),
    ),
    documentChanges: (json['documentChanges'] as List<Object?>?)
        ?.map((e) => e as Object)
        .toList(),
    changeAnnotations: (json['changeAnnotations'] as Map<String, Object?>?)
        ?.map(
          (k, v) =>
              MapEntry(k, ChangeAnnotation.fromJson(v as Map<String, Object?>)),
        ),
  );

  final Map<String, List<TextEdit>>? changes;

  final List<Object>? documentChanges;

  final Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations;

  WorkspaceEdit copyWith({
    Map<String, List<TextEdit>>? changes,
    List<Object>? documentChanges,
    Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations,
  }) => WorkspaceEdit(
    changes: changes ?? this.changes,
    documentChanges: documentChanges ?? this.documentChanges,
    changeAnnotations: changeAnnotations ?? this.changeAnnotations,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'changes': changes,
      'documentChanges': documentChanges,
      'changeAnnotations': changeAnnotations,
    };
  }
}

/// The options to register for file operations.
///
/// @since 3.16.0
final class FileOperationRegistrationOptions {
  const FileOperationRegistrationOptions({required this.filters});

  factory FileOperationRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => FileOperationRegistrationOptions(
    filters: (json['filters'] as List<Object?>)
        .map((e) => FileOperationFilter.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  final List<FileOperationFilter> filters;

  FileOperationRegistrationOptions copyWith({
    List<FileOperationFilter>? filters,
  }) => FileOperationRegistrationOptions(filters: filters ?? this.filters);

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'filters': filters.map((e) => e.toJson()).toList(),
    };
  }
}

/// The parameters sent in notifications/requests for user-initiated renames of
/// files.
///
/// @since 3.16.0
final class RenameFilesParams {
  const RenameFilesParams({required this.files});

  factory RenameFilesParams.fromJson(Map<String, Object?> json) =>
      RenameFilesParams(
        files: (json['files'] as List<Object?>)
            .map((e) => FileRename.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<FileRename> files;

  RenameFilesParams copyWith({List<FileRename>? files}) =>
      RenameFilesParams(files: files ?? this.files);

  Map<String, Object?> toJson() {
    return <String, Object?>{'files': files.map((e) => e.toJson()).toList()};
  }
}

/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
///
/// @since 3.16.0
final class DeleteFilesParams {
  const DeleteFilesParams({required this.files});

  factory DeleteFilesParams.fromJson(Map<String, Object?> json) =>
      DeleteFilesParams(
        files: (json['files'] as List<Object?>)
            .map((e) => FileDelete.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<FileDelete> files;

  DeleteFilesParams copyWith({List<FileDelete>? files}) =>
      DeleteFilesParams(files: files ?? this.files);

  Map<String, Object?> toJson() {
    return <String, Object?>{'files': files.map((e) => e.toJson()).toList()};
  }
}

final class MonikerParams {
  const MonikerParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
  });

  factory MonikerParams.fromJson(Map<String, Object?> json) => MonikerParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    workDoneToken: json['workDoneToken'] as ProgressToken?,
    partialResultToken: json['partialResultToken'] as ProgressToken?,
  );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  MonikerParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) => MonikerParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
    };
  }
}

/// Moniker definition to match LSIF 0.5 moniker definition.
///
/// @since 3.16.0
final class Moniker {
  const Moniker({
    required this.scheme,
    required this.identifier,
    required this.unique,
    this.kind,
  });

  factory Moniker.fromJson(Map<String, Object?> json) => Moniker(
    scheme: json['scheme'] as String,
    identifier: json['identifier'] as String,
    unique: UniquenessLevel.values.firstWhere(
      (e) => e.value == json['unique'] as String,
    ),
    kind: json['kind'] == null
        ? null
        : MonikerKind.values.firstWhere(
            (e) => e.value == json['kind'] as String,
          ),
  );

  final String scheme;

  final String identifier;

  final UniquenessLevel unique;

  final MonikerKind? kind;

  Moniker copyWith({
    String? scheme,
    String? identifier,
    UniquenessLevel? unique,
    MonikerKind? kind,
  }) => Moniker(
    scheme: scheme ?? this.scheme,
    identifier: identifier ?? this.identifier,
    unique: unique ?? this.unique,
    kind: kind ?? this.kind,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'scheme': scheme,
      'identifier': identifier,
      'unique': unique.value,
      'kind': kind?.value,
    };
  }
}

final class MonikerRegistrationOptions {
  const MonikerRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory MonikerRegistrationOptions.fromJson(Map<String, Object?> json) =>
      MonikerRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  MonikerRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) => MonikerRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameter of a `textDocument/prepareTypeHierarchy` request.
///
/// @since 3.17.0
final class TypeHierarchyPrepareParams {
  const TypeHierarchyPrepareParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
  });

  factory TypeHierarchyPrepareParams.fromJson(Map<String, Object?> json) =>
      TypeHierarchyPrepareParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  TypeHierarchyPrepareParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
  }) => TypeHierarchyPrepareParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// @since 3.17.0
final class TypeHierarchyItem {
  const TypeHierarchyItem({
    required this.name,
    required this.kind,
    this.tags,
    this.detail,
    required this.uri,
    required this.range,
    required this.selectionRange,
    this.data,
  });

  factory TypeHierarchyItem.fromJson(
    Map<String, Object?> json,
  ) => TypeHierarchyItem(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    detail: json['detail'] as String?,
    uri: json['uri'] as String,
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    selectionRange: Range.fromJson(
      json['selectionRange'] as Map<String, Object?>,
    ),
    data: json['data'] as LSPAny?,
  );

  final String name;

  final SymbolKind kind;

  final List<SymbolTag>? tags;

  final String? detail;

  final String uri;

  final Range range;

  final Range selectionRange;

  final LSPAny? data;

  TypeHierarchyItem copyWith({
    String? name,
    SymbolKind? kind,
    List<SymbolTag>? tags,
    String? detail,
    String? uri,
    Range? range,
    Range? selectionRange,
    LSPAny? data,
  }) => TypeHierarchyItem(
    name: name ?? this.name,
    kind: kind ?? this.kind,
    tags: tags ?? this.tags,
    detail: detail ?? this.detail,
    uri: uri ?? this.uri,
    range: range ?? this.range,
    selectionRange: selectionRange ?? this.selectionRange,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'kind': kind.value,
      'tags': tags,
      'detail': detail,
      'uri': uri,
      'range': range.toJson(),
      'selectionRange': selectionRange.toJson(),
      'data': data,
    };
  }
}

/// Type hierarchy options used during static or dynamic registration.
///
/// @since 3.17.0
final class TypeHierarchyRegistrationOptions {
  const TypeHierarchyRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.id,
  });

  factory TypeHierarchyRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => TypeHierarchyRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? id;

  TypeHierarchyRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) => TypeHierarchyRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

/// The parameter of a `typeHierarchy/supertypes` request.
///
/// @since 3.17.0
final class TypeHierarchySupertypesParams {
  const TypeHierarchySupertypesParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.item,
  });

  factory TypeHierarchySupertypesParams.fromJson(Map<String, Object?> json) =>
      TypeHierarchySupertypesParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        item: TypeHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TypeHierarchyItem item;

  TypeHierarchySupertypesParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TypeHierarchyItem? item,
  }) => TypeHierarchySupertypesParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    item: item ?? this.item,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'item': item.toJson(),
    };
  }
}

/// The parameter of a `typeHierarchy/subtypes` request.
///
/// @since 3.17.0
final class TypeHierarchySubtypesParams {
  const TypeHierarchySubtypesParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.item,
  });

  factory TypeHierarchySubtypesParams.fromJson(Map<String, Object?> json) =>
      TypeHierarchySubtypesParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        item: TypeHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TypeHierarchyItem item;

  TypeHierarchySubtypesParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TypeHierarchyItem? item,
  }) => TypeHierarchySubtypesParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    item: item ?? this.item,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'item': item.toJson(),
    };
  }
}

/// A parameter literal used in inline value requests.
///
/// @since 3.17.0
final class InlineValueParams {
  const InlineValueParams({
    this.workDoneToken,
    required this.textDocument,
    required this.range,
    required this.context,
  });

  factory InlineValueParams.fromJson(Map<String, Object?> json) =>
      InlineValueParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        context: InlineValueContext.fromJson(
          json['context'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final TextDocumentIdentifier textDocument;

  final Range range;

  final InlineValueContext context;

  InlineValueParams copyWith({
    ProgressToken? workDoneToken,
    TextDocumentIdentifier? textDocument,
    Range? range,
    InlineValueContext? context,
  }) => InlineValueParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    textDocument: textDocument ?? this.textDocument,
    range: range ?? this.range,
    context: context ?? this.context,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
      'context': context.toJson(),
    };
  }
}

/// Inline value options used during static or dynamic registration.
///
/// @since 3.17.0
final class InlineValueRegistrationOptions {
  const InlineValueRegistrationOptions({
    this.workDoneProgress,
    required this.documentSelector,
    this.id,
  });

  factory InlineValueRegistrationOptions.fromJson(Map<String, Object?> json) =>
      InlineValueRegistrationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        documentSelector: json['documentSelector'] as DocumentSelector?,
        id: json['id'] as String?,
      );

  final bool? workDoneProgress;

  final DocumentSelector? documentSelector;

  final String? id;

  InlineValueRegistrationOptions copyWith({
    bool? workDoneProgress,
    DocumentSelector? documentSelector,
    String? id,
  }) => InlineValueRegistrationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    documentSelector: documentSelector ?? this.documentSelector,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'documentSelector': documentSelector,
      'id': id,
    };
  }
}

/// A parameter literal used in inlay hint requests.
///
/// @since 3.17.0
final class InlayHintParams {
  const InlayHintParams({
    this.workDoneToken,
    required this.textDocument,
    required this.range,
  });

  factory InlayHintParams.fromJson(Map<String, Object?> json) =>
      InlayHintParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
      );

  final ProgressToken? workDoneToken;

  final TextDocumentIdentifier textDocument;

  final Range range;

  InlayHintParams copyWith({
    ProgressToken? workDoneToken,
    TextDocumentIdentifier? textDocument,
    Range? range,
  }) => InlayHintParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    textDocument: textDocument ?? this.textDocument,
    range: range ?? this.range,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
    };
  }
}

/// Inlay hint information.
///
/// @since 3.17.0
final class InlayHint {
  const InlayHint({
    required this.position,
    required this.label,
    this.kind,
    this.textEdits,
    this.tooltip,
    this.paddingLeft,
    this.paddingRight,
    this.data,
  });

  factory InlayHint.fromJson(Map<String, Object?> json) => InlayHint(
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    label: json['label'] as Object,
    kind: json['kind'] == null
        ? null
        : InlayHintKind.values.firstWhere(
            (e) => e.value == json['kind'] as int,
          ),
    textEdits: (json['textEdits'] as List<Object?>?)
        ?.map((e) => TextEdit.fromJson(e as Map<String, Object?>))
        .toList(),
    tooltip: json['tooltip'] as Object?,
    paddingLeft: json['paddingLeft'] as bool?,
    paddingRight: json['paddingRight'] as bool?,
    data: json['data'] as LSPAny?,
  );

  final Position position;

  final Object label;

  final InlayHintKind? kind;

  final List<TextEdit>? textEdits;

  final Object? tooltip;

  final bool? paddingLeft;

  final bool? paddingRight;

  final LSPAny? data;

  InlayHint copyWith({
    Position? position,
    Object? label,
    InlayHintKind? kind,
    List<TextEdit>? textEdits,
    Object? tooltip,
    bool? paddingLeft,
    bool? paddingRight,
    LSPAny? data,
  }) => InlayHint(
    position: position ?? this.position,
    label: label ?? this.label,
    kind: kind ?? this.kind,
    textEdits: textEdits ?? this.textEdits,
    tooltip: tooltip ?? this.tooltip,
    paddingLeft: paddingLeft ?? this.paddingLeft,
    paddingRight: paddingRight ?? this.paddingRight,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'position': position.toJson(),
      'label': label,
      'kind': kind?.value,
      'textEdits': textEdits?.map((e) => e.toJson()).toList(),
      'tooltip': tooltip,
      'paddingLeft': paddingLeft,
      'paddingRight': paddingRight,
      'data': data,
    };
  }
}

/// Inlay hint options used during static or dynamic registration.
///
/// @since 3.17.0
final class InlayHintRegistrationOptions {
  const InlayHintRegistrationOptions({
    this.workDoneProgress,
    this.resolveProvider,
    required this.documentSelector,
    this.id,
  });

  factory InlayHintRegistrationOptions.fromJson(Map<String, Object?> json) =>
      InlayHintRegistrationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
        documentSelector: json['documentSelector'] as DocumentSelector?,
        id: json['id'] as String?,
      );

  final bool? workDoneProgress;

  final bool? resolveProvider;

  final DocumentSelector? documentSelector;

  final String? id;

  InlayHintRegistrationOptions copyWith({
    bool? workDoneProgress,
    bool? resolveProvider,
    DocumentSelector? documentSelector,
    String? id,
  }) => InlayHintRegistrationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    resolveProvider: resolveProvider ?? this.resolveProvider,
    documentSelector: documentSelector ?? this.documentSelector,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
      'documentSelector': documentSelector,
      'id': id,
    };
  }
}

/// Parameters of the document diagnostic request.
///
/// @since 3.17.0
final class DocumentDiagnosticParams {
  const DocumentDiagnosticParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
    this.identifier,
    this.previousResultId,
  });

  factory DocumentDiagnosticParams.fromJson(Map<String, Object?> json) =>
      DocumentDiagnosticParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        identifier: json['identifier'] as String?,
        previousResultId: json['previousResultId'] as String?,
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  final String? identifier;

  final String? previousResultId;

  DocumentDiagnosticParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
    String? identifier,
    String? previousResultId,
  }) => DocumentDiagnosticParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
    identifier: identifier ?? this.identifier,
    previousResultId: previousResultId ?? this.previousResultId,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'identifier': identifier,
      'previousResultId': previousResultId,
    };
  }
}

/// A partial result for a document diagnostic report.
///
/// @since 3.17.0
final class DocumentDiagnosticReportPartialResult {
  const DocumentDiagnosticReportPartialResult({required this.relatedDocuments});

  factory DocumentDiagnosticReportPartialResult.fromJson(
    Map<String, Object?> json,
  ) => DocumentDiagnosticReportPartialResult(
    relatedDocuments: (json['relatedDocuments'] as Map<String, Object?>).map(
      (k, v) => MapEntry(k, v as Object),
    ),
  );

  final Map<String, Object> relatedDocuments;

  DocumentDiagnosticReportPartialResult copyWith({
    Map<String, Object>? relatedDocuments,
  }) => DocumentDiagnosticReportPartialResult(
    relatedDocuments: relatedDocuments ?? this.relatedDocuments,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'relatedDocuments': relatedDocuments};
  }
}

/// Cancellation data returned from a diagnostic request.
///
/// @since 3.17.0
final class DiagnosticServerCancellationData {
  const DiagnosticServerCancellationData({required this.retriggerRequest});

  factory DiagnosticServerCancellationData.fromJson(
    Map<String, Object?> json,
  ) => DiagnosticServerCancellationData(
    retriggerRequest: json['retriggerRequest'] as bool,
  );

  final bool retriggerRequest;

  DiagnosticServerCancellationData copyWith({bool? retriggerRequest}) =>
      DiagnosticServerCancellationData(
        retriggerRequest: retriggerRequest ?? this.retriggerRequest,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'retriggerRequest': retriggerRequest};
  }
}

/// Diagnostic registration options.
///
/// @since 3.17.0
final class DiagnosticRegistrationOptions {
  const DiagnosticRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.identifier,
    required this.interFileDependencies,
    required this.workspaceDiagnostics,
    this.id,
  });

  factory DiagnosticRegistrationOptions.fromJson(Map<String, Object?> json) =>
      DiagnosticRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        identifier: json['identifier'] as String?,
        interFileDependencies: json['interFileDependencies'] as bool,
        workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
        id: json['id'] as String?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? identifier;

  final bool interFileDependencies;

  final bool workspaceDiagnostics;

  final String? id;

  DiagnosticRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? identifier,
    bool? interFileDependencies,
    bool? workspaceDiagnostics,
    String? id,
  }) => DiagnosticRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    identifier: identifier ?? this.identifier,
    interFileDependencies: interFileDependencies ?? this.interFileDependencies,
    workspaceDiagnostics: workspaceDiagnostics ?? this.workspaceDiagnostics,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'identifier': identifier,
      'interFileDependencies': interFileDependencies,
      'workspaceDiagnostics': workspaceDiagnostics,
      'id': id,
    };
  }
}

/// Parameters of the workspace diagnostic request.
///
/// @since 3.17.0
final class WorkspaceDiagnosticParams {
  const WorkspaceDiagnosticParams({
    this.workDoneToken,
    this.partialResultToken,
    this.identifier,
    required this.previousResultIds,
  });

  factory WorkspaceDiagnosticParams.fromJson(Map<String, Object?> json) =>
      WorkspaceDiagnosticParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        identifier: json['identifier'] as String?,
        previousResultIds: (json['previousResultIds'] as List<Object?>)
            .map((e) => PreviousResultId.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final String? identifier;

  final List<PreviousResultId> previousResultIds;

  WorkspaceDiagnosticParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    String? identifier,
    List<PreviousResultId>? previousResultIds,
  }) => WorkspaceDiagnosticParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    identifier: identifier ?? this.identifier,
    previousResultIds: previousResultIds ?? this.previousResultIds,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'identifier': identifier,
      'previousResultIds': previousResultIds.map((e) => e.toJson()).toList(),
    };
  }
}

/// A workspace diagnostic report.
///
/// @since 3.17.0
final class WorkspaceDiagnosticReport {
  const WorkspaceDiagnosticReport({required this.items});

  factory WorkspaceDiagnosticReport.fromJson(Map<String, Object?> json) =>
      WorkspaceDiagnosticReport(
        items: (json['items'] as List<Object?>)
            .map((e) => e as WorkspaceDocumentDiagnosticReport)
            .toList(),
      );

  final List<WorkspaceDocumentDiagnosticReport> items;

  WorkspaceDiagnosticReport copyWith({
    List<WorkspaceDocumentDiagnosticReport>? items,
  }) => WorkspaceDiagnosticReport(items: items ?? this.items);

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items};
  }
}

/// A partial result for a workspace diagnostic report.
///
/// @since 3.17.0
final class WorkspaceDiagnosticReportPartialResult {
  const WorkspaceDiagnosticReportPartialResult({required this.items});

  factory WorkspaceDiagnosticReportPartialResult.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceDiagnosticReportPartialResult(
    items: (json['items'] as List<Object?>)
        .map((e) => e as WorkspaceDocumentDiagnosticReport)
        .toList(),
  );

  final List<WorkspaceDocumentDiagnosticReport> items;

  WorkspaceDiagnosticReportPartialResult copyWith({
    List<WorkspaceDocumentDiagnosticReport>? items,
  }) => WorkspaceDiagnosticReportPartialResult(items: items ?? this.items);

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items};
  }
}

/// The params sent in an open notebook document notification.
///
/// @since 3.17.0
final class DidOpenNotebookDocumentParams {
  const DidOpenNotebookDocumentParams({
    required this.notebookDocument,
    required this.cellTextDocuments,
  });

  factory DidOpenNotebookDocumentParams.fromJson(Map<String, Object?> json) =>
      DidOpenNotebookDocumentParams(
        notebookDocument: NotebookDocument.fromJson(
          json['notebookDocument'] as Map<String, Object?>,
        ),
        cellTextDocuments: (json['cellTextDocuments'] as List<Object?>)
            .map((e) => TextDocumentItem.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final NotebookDocument notebookDocument;

  final List<TextDocumentItem> cellTextDocuments;

  DidOpenNotebookDocumentParams copyWith({
    NotebookDocument? notebookDocument,
    List<TextDocumentItem>? cellTextDocuments,
  }) => DidOpenNotebookDocumentParams(
    notebookDocument: notebookDocument ?? this.notebookDocument,
    cellTextDocuments: cellTextDocuments ?? this.cellTextDocuments,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookDocument': notebookDocument.toJson(),
      'cellTextDocuments': cellTextDocuments.map((e) => e.toJson()).toList(),
    };
  }
}

/// The params sent in a change notebook document notification.
///
/// @since 3.17.0
final class DidChangeNotebookDocumentParams {
  const DidChangeNotebookDocumentParams({
    required this.notebookDocument,
    required this.change,
  });

  factory DidChangeNotebookDocumentParams.fromJson(Map<String, Object?> json) =>
      DidChangeNotebookDocumentParams(
        notebookDocument: VersionedNotebookDocumentIdentifier.fromJson(
          json['notebookDocument'] as Map<String, Object?>,
        ),
        change: NotebookDocumentChangeEvent.fromJson(
          json['change'] as Map<String, Object?>,
        ),
      );

  final VersionedNotebookDocumentIdentifier notebookDocument;

  final NotebookDocumentChangeEvent change;

  DidChangeNotebookDocumentParams copyWith({
    VersionedNotebookDocumentIdentifier? notebookDocument,
    NotebookDocumentChangeEvent? change,
  }) => DidChangeNotebookDocumentParams(
    notebookDocument: notebookDocument ?? this.notebookDocument,
    change: change ?? this.change,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookDocument': notebookDocument.toJson(),
      'change': change.toJson(),
    };
  }
}

/// The params sent in a save notebook document notification.
///
/// @since 3.17.0
final class DidSaveNotebookDocumentParams {
  const DidSaveNotebookDocumentParams({required this.notebookDocument});

  factory DidSaveNotebookDocumentParams.fromJson(Map<String, Object?> json) =>
      DidSaveNotebookDocumentParams(
        notebookDocument: NotebookDocumentIdentifier.fromJson(
          json['notebookDocument'] as Map<String, Object?>,
        ),
      );

  final NotebookDocumentIdentifier notebookDocument;

  DidSaveNotebookDocumentParams copyWith({
    NotebookDocumentIdentifier? notebookDocument,
  }) => DidSaveNotebookDocumentParams(
    notebookDocument: notebookDocument ?? this.notebookDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'notebookDocument': notebookDocument.toJson()};
  }
}

/// The params sent in a close notebook document notification.
///
/// @since 3.17.0
final class DidCloseNotebookDocumentParams {
  const DidCloseNotebookDocumentParams({
    required this.notebookDocument,
    required this.cellTextDocuments,
  });

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, Object?> json) =>
      DidCloseNotebookDocumentParams(
        notebookDocument: NotebookDocumentIdentifier.fromJson(
          json['notebookDocument'] as Map<String, Object?>,
        ),
        cellTextDocuments: (json['cellTextDocuments'] as List<Object?>)
            .map(
              (e) => TextDocumentIdentifier.fromJson(e as Map<String, Object?>),
            )
            .toList(),
      );

  final NotebookDocumentIdentifier notebookDocument;

  final List<TextDocumentIdentifier> cellTextDocuments;

  DidCloseNotebookDocumentParams copyWith({
    NotebookDocumentIdentifier? notebookDocument,
    List<TextDocumentIdentifier>? cellTextDocuments,
  }) => DidCloseNotebookDocumentParams(
    notebookDocument: notebookDocument ?? this.notebookDocument,
    cellTextDocuments: cellTextDocuments ?? this.cellTextDocuments,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookDocument': notebookDocument.toJson(),
      'cellTextDocuments': cellTextDocuments.map((e) => e.toJson()).toList(),
    };
  }
}

/// A parameter literal used in inline completion requests.
///
/// @since 3.18.0
/// @proposed
final class InlineCompletionParams {
  const InlineCompletionParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    required this.context,
  });

  factory InlineCompletionParams.fromJson(Map<String, Object?> json) =>
      InlineCompletionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        context: InlineCompletionContext.fromJson(
          json['context'] as Map<String, Object?>,
        ),
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final InlineCompletionContext context;

  InlineCompletionParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    InlineCompletionContext? context,
  }) => InlineCompletionParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    context: context ?? this.context,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'context': context.toJson(),
    };
  }
}

/// Represents a collection of {@link InlineCompletionItem inline completion items} to be presented in the editor.
///
/// @since 3.18.0
/// @proposed
final class InlineCompletionList {
  const InlineCompletionList({required this.items});

  factory InlineCompletionList.fromJson(Map<String, Object?> json) =>
      InlineCompletionList(
        items: (json['items'] as List<Object?>)
            .map(
              (e) => InlineCompletionItem.fromJson(e as Map<String, Object?>),
            )
            .toList(),
      );

  final List<InlineCompletionItem> items;

  InlineCompletionList copyWith({List<InlineCompletionItem>? items}) =>
      InlineCompletionList(items: items ?? this.items);

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items.map((e) => e.toJson()).toList()};
  }
}

/// An inline completion item represents a text snippet that is proposed inline to complete text that is being typed.
///
/// @since 3.18.0
/// @proposed
final class InlineCompletionItem {
  const InlineCompletionItem({
    required this.insertText,
    this.filterText,
    this.range,
    this.command,
  });

  factory InlineCompletionItem.fromJson(Map<String, Object?> json) =>
      InlineCompletionItem(
        insertText: json['insertText'] as Object,
        filterText: json['filterText'] as String?,
        range: json['range'] == null
            ? null
            : Range.fromJson(json['range'] as Map<String, Object?>),
        command: json['command'] == null
            ? null
            : Command.fromJson(json['command'] as Map<String, Object?>),
      );

  final Object insertText;

  final String? filterText;

  final Range? range;

  final Command? command;

  InlineCompletionItem copyWith({
    Object? insertText,
    String? filterText,
    Range? range,
    Command? command,
  }) => InlineCompletionItem(
    insertText: insertText ?? this.insertText,
    filterText: filterText ?? this.filterText,
    range: range ?? this.range,
    command: command ?? this.command,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'insertText': insertText,
      'filterText': filterText,
      'range': range?.toJson(),
      'command': command?.toJson(),
    };
  }
}

/// Inline completion options used during static or dynamic registration.
///
/// @since 3.18.0
/// @proposed
final class InlineCompletionRegistrationOptions {
  const InlineCompletionRegistrationOptions({
    this.workDoneProgress,
    required this.documentSelector,
    this.id,
  });

  factory InlineCompletionRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => InlineCompletionRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    documentSelector: json['documentSelector'] as DocumentSelector?,
    id: json['id'] as String?,
  );

  final bool? workDoneProgress;

  final DocumentSelector? documentSelector;

  final String? id;

  InlineCompletionRegistrationOptions copyWith({
    bool? workDoneProgress,
    DocumentSelector? documentSelector,
    String? id,
  }) => InlineCompletionRegistrationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    documentSelector: documentSelector ?? this.documentSelector,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'documentSelector': documentSelector,
      'id': id,
    };
  }
}

final class RegistrationParams {
  const RegistrationParams({required this.registrations});

  factory RegistrationParams.fromJson(Map<String, Object?> json) =>
      RegistrationParams(
        registrations: (json['registrations'] as List<Object?>)
            .map((e) => Registration.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<Registration> registrations;

  RegistrationParams copyWith({List<Registration>? registrations}) =>
      RegistrationParams(registrations: registrations ?? this.registrations);

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'registrations': registrations.map((e) => e.toJson()).toList(),
    };
  }
}

final class UnregistrationParams {
  const UnregistrationParams({required this.unregisterations});

  factory UnregistrationParams.fromJson(Map<String, Object?> json) =>
      UnregistrationParams(
        unregisterations: (json['unregisterations'] as List<Object?>)
            .map((e) => Unregistration.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<Unregistration> unregisterations;

  UnregistrationParams copyWith({List<Unregistration>? unregisterations}) =>
      UnregistrationParams(
        unregisterations: unregisterations ?? this.unregisterations,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'unregisterations': unregisterations.map((e) => e.toJson()).toList(),
    };
  }
}

final class InitializeParams {
  const InitializeParams({
    this.workDoneToken,
    required this.processId,
    this.clientInfo,
    this.locale,
    this.rootPath,
    required this.rootUri,
    required this.capabilities,
    this.initializationOptions,
    this.trace,
    this.workspaceFolders,
  });

  factory InitializeParams.fromJson(Map<String, Object?> json) =>
      InitializeParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        processId: json['processId'] as int?,
        clientInfo: json['clientInfo'] == null
            ? null
            : _InitializeParamsClientInfo.fromJson(
                json['clientInfo'] as Map<String, Object?>,
              ),
        locale: json['locale'] as String?,
        rootPath: json['rootPath'] as String?,
        rootUri: json['rootUri'] as String?,
        capabilities: ClientCapabilities.fromJson(
          json['capabilities'] as Map<String, Object?>,
        ),
        initializationOptions: json['initializationOptions'] as LSPAny?,
        trace: json['trace'] == null
            ? null
            : TraceValues.values.firstWhere(
                (e) => e.value == json['trace'] as String,
              ),
        workspaceFolders: (json['workspaceFolders'] as List<Object?>?)
            ?.map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final ProgressToken? workDoneToken;

  final int? processId;

  final _InitializeParamsClientInfo? clientInfo;

  final String? locale;

  final String? rootPath;

  final String? rootUri;

  final ClientCapabilities capabilities;

  final LSPAny? initializationOptions;

  final TraceValues? trace;

  final List<WorkspaceFolder>? workspaceFolders;

  InitializeParams copyWith({
    ProgressToken? workDoneToken,
    int? processId,
    _InitializeParamsClientInfo? clientInfo,
    String? locale,
    String? rootPath,
    String? rootUri,
    ClientCapabilities? capabilities,
    LSPAny? initializationOptions,
    TraceValues? trace,
    List<WorkspaceFolder>? workspaceFolders,
  }) => InitializeParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    processId: processId ?? this.processId,
    clientInfo: clientInfo ?? this.clientInfo,
    locale: locale ?? this.locale,
    rootPath: rootPath ?? this.rootPath,
    rootUri: rootUri ?? this.rootUri,
    capabilities: capabilities ?? this.capabilities,
    initializationOptions: initializationOptions ?? this.initializationOptions,
    trace: trace ?? this.trace,
    workspaceFolders: workspaceFolders ?? this.workspaceFolders,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'processId': processId,
      'clientInfo': clientInfo?.toJson(),
      'locale': locale,
      'rootPath': rootPath,
      'rootUri': rootUri,
      'capabilities': capabilities.toJson(),
      'initializationOptions': initializationOptions,
      'trace': trace?.value,
      'workspaceFolders': workspaceFolders?.map((e) => e.toJson()).toList(),
    };
  }
}

/// The result returned from an initialize request.
final class InitializeResult {
  const InitializeResult({required this.capabilities, this.serverInfo});

  factory InitializeResult.fromJson(Map<String, Object?> json) =>
      InitializeResult(
        capabilities: ServerCapabilities.fromJson(
          json['capabilities'] as Map<String, Object?>,
        ),
        serverInfo: json['serverInfo'] == null
            ? null
            : InitializeResultServerInfo.fromJson(
                json['serverInfo'] as Map<String, Object?>,
              ),
      );

  final ServerCapabilities capabilities;

  final InitializeResultServerInfo? serverInfo;

  InitializeResult copyWith({
    ServerCapabilities? capabilities,
    InitializeResultServerInfo? serverInfo,
  }) => InitializeResult(
    capabilities: capabilities ?? this.capabilities,
    serverInfo: serverInfo ?? this.serverInfo,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'capabilities': capabilities.toJson(),
      'serverInfo': serverInfo?.toJson(),
    };
  }
}

/// The data type of the ResponseError if the
/// initialize request fails.
final class InitializeError {
  const InitializeError({required this.retry});

  factory InitializeError.fromJson(Map<String, Object?> json) =>
      InitializeError(retry: json['retry'] as bool);

  final bool retry;

  InitializeError copyWith({bool? retry}) =>
      InitializeError(retry: retry ?? this.retry);

  Map<String, Object?> toJson() {
    return <String, Object?>{'retry': retry};
  }
}

final class InitializedParams {
  const InitializedParams();

  factory InitializedParams.fromJson(Map<String, Object?> json) =>
      InitializedParams();

  Map<String, Object?> toJson() {
    return <String, Object?>{};
  }
}

/// The parameters of a change configuration notification.
final class DidChangeConfigurationParams {
  const DidChangeConfigurationParams({required this.settings});

  factory DidChangeConfigurationParams.fromJson(Map<String, Object?> json) =>
      DidChangeConfigurationParams(settings: json['settings'] as LSPAny);

  final LSPAny settings;

  DidChangeConfigurationParams copyWith({LSPAny? settings}) =>
      DidChangeConfigurationParams(settings: settings ?? this.settings);

  Map<String, Object?> toJson() {
    return <String, Object?>{'settings': settings};
  }
}

final class DidChangeConfigurationRegistrationOptions {
  const DidChangeConfigurationRegistrationOptions({this.section});

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DidChangeConfigurationRegistrationOptions(
    section: json['section'] as Object?,
  );

  final Object? section;

  DidChangeConfigurationRegistrationOptions copyWith({Object? section}) =>
      DidChangeConfigurationRegistrationOptions(
        section: section ?? this.section,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'section': section};
  }
}

/// The parameters of a notification message.
final class ShowMessageParams {
  const ShowMessageParams({required this.type, required this.message});

  factory ShowMessageParams.fromJson(Map<String, Object?> json) =>
      ShowMessageParams(
        type: MessageType.values.firstWhere(
          (e) => e.value == json['type'] as int,
        ),
        message: json['message'] as String,
      );

  final MessageType type;

  final String message;

  ShowMessageParams copyWith({MessageType? type, String? message}) =>
      ShowMessageParams(
        type: type ?? this.type,
        message: message ?? this.message,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'type': type.value, 'message': message};
  }
}

final class ShowMessageRequestParams {
  const ShowMessageRequestParams({
    required this.type,
    required this.message,
    this.actions,
  });

  factory ShowMessageRequestParams.fromJson(Map<String, Object?> json) =>
      ShowMessageRequestParams(
        type: MessageType.values.firstWhere(
          (e) => e.value == json['type'] as int,
        ),
        message: json['message'] as String,
        actions: (json['actions'] as List<Object?>?)
            ?.map((e) => MessageActionItem.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final MessageType type;

  final String message;

  final List<MessageActionItem>? actions;

  ShowMessageRequestParams copyWith({
    MessageType? type,
    String? message,
    List<MessageActionItem>? actions,
  }) => ShowMessageRequestParams(
    type: type ?? this.type,
    message: message ?? this.message,
    actions: actions ?? this.actions,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'type': type.value,
      'message': message,
      'actions': actions?.map((e) => e.toJson()).toList(),
    };
  }
}

final class MessageActionItem {
  const MessageActionItem({required this.title});

  factory MessageActionItem.fromJson(Map<String, Object?> json) =>
      MessageActionItem(title: json['title'] as String);

  final String title;

  MessageActionItem copyWith({String? title}) =>
      MessageActionItem(title: title ?? this.title);

  Map<String, Object?> toJson() {
    return <String, Object?>{'title': title};
  }
}

/// The log message parameters.
final class LogMessageParams {
  const LogMessageParams({required this.type, required this.message});

  factory LogMessageParams.fromJson(Map<String, Object?> json) =>
      LogMessageParams(
        type: MessageType.values.firstWhere(
          (e) => e.value == json['type'] as int,
        ),
        message: json['message'] as String,
      );

  final MessageType type;

  final String message;

  LogMessageParams copyWith({MessageType? type, String? message}) =>
      LogMessageParams(
        type: type ?? this.type,
        message: message ?? this.message,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'type': type.value, 'message': message};
  }
}

/// The parameters sent in an open text document notification
final class DidOpenTextDocumentParams {
  const DidOpenTextDocumentParams({required this.textDocument});

  factory DidOpenTextDocumentParams.fromJson(Map<String, Object?> json) =>
      DidOpenTextDocumentParams(
        textDocument: TextDocumentItem.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  final TextDocumentItem textDocument;

  DidOpenTextDocumentParams copyWith({TextDocumentItem? textDocument}) =>
      DidOpenTextDocumentParams(
        textDocument: textDocument ?? this.textDocument,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'textDocument': textDocument.toJson()};
  }
}

/// The change text document notification's parameters.
final class DidChangeTextDocumentParams {
  const DidChangeTextDocumentParams({
    required this.textDocument,
    required this.contentChanges,
  });

  factory DidChangeTextDocumentParams.fromJson(Map<String, Object?> json) =>
      DidChangeTextDocumentParams(
        textDocument: VersionedTextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        contentChanges: (json['contentChanges'] as List<Object?>)
            .map((e) => e as TextDocumentContentChangeEvent)
            .toList(),
      );

  final VersionedTextDocumentIdentifier textDocument;

  final List<TextDocumentContentChangeEvent> contentChanges;

  DidChangeTextDocumentParams copyWith({
    VersionedTextDocumentIdentifier? textDocument,
    List<TextDocumentContentChangeEvent>? contentChanges,
  }) => DidChangeTextDocumentParams(
    textDocument: textDocument ?? this.textDocument,
    contentChanges: contentChanges ?? this.contentChanges,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'contentChanges': contentChanges,
    };
  }
}

/// Describe options to be used when registered for text document change events.
final class TextDocumentChangeRegistrationOptions {
  const TextDocumentChangeRegistrationOptions({
    required this.documentSelector,
    required this.syncKind,
  });

  factory TextDocumentChangeRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => TextDocumentChangeRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    syncKind: TextDocumentSyncKind.values.firstWhere(
      (e) => e.value == json['syncKind'] as int,
    ),
  );

  final DocumentSelector? documentSelector;

  final TextDocumentSyncKind syncKind;

  TextDocumentChangeRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    TextDocumentSyncKind? syncKind,
  }) => TextDocumentChangeRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    syncKind: syncKind ?? this.syncKind,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'syncKind': syncKind.value,
    };
  }
}

/// The parameters sent in a close text document notification
final class DidCloseTextDocumentParams {
  const DidCloseTextDocumentParams({required this.textDocument});

  factory DidCloseTextDocumentParams.fromJson(Map<String, Object?> json) =>
      DidCloseTextDocumentParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  final TextDocumentIdentifier textDocument;

  DidCloseTextDocumentParams copyWith({TextDocumentIdentifier? textDocument}) =>
      DidCloseTextDocumentParams(
        textDocument: textDocument ?? this.textDocument,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'textDocument': textDocument.toJson()};
  }
}

/// The parameters sent in a save text document notification
final class DidSaveTextDocumentParams {
  const DidSaveTextDocumentParams({required this.textDocument, this.text});

  factory DidSaveTextDocumentParams.fromJson(Map<String, Object?> json) =>
      DidSaveTextDocumentParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        text: json['text'] as String?,
      );

  final TextDocumentIdentifier textDocument;

  final String? text;

  DidSaveTextDocumentParams copyWith({
    TextDocumentIdentifier? textDocument,
    String? text,
  }) => DidSaveTextDocumentParams(
    textDocument: textDocument ?? this.textDocument,
    text: text ?? this.text,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'text': text,
    };
  }
}

/// Save registration options.
final class TextDocumentSaveRegistrationOptions {
  const TextDocumentSaveRegistrationOptions({
    required this.documentSelector,
    this.includeText,
  });

  factory TextDocumentSaveRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => TextDocumentSaveRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    includeText: json['includeText'] as bool?,
  );

  final DocumentSelector? documentSelector;

  final bool? includeText;

  TextDocumentSaveRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? includeText,
  }) => TextDocumentSaveRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    includeText: includeText ?? this.includeText,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'includeText': includeText,
    };
  }
}

/// The parameters sent in a will save text document notification.
final class WillSaveTextDocumentParams {
  const WillSaveTextDocumentParams({
    required this.textDocument,
    required this.reason,
  });

  factory WillSaveTextDocumentParams.fromJson(Map<String, Object?> json) =>
      WillSaveTextDocumentParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        reason: TextDocumentSaveReason.values.firstWhere(
          (e) => e.value == json['reason'] as int,
        ),
      );

  final TextDocumentIdentifier textDocument;

  final TextDocumentSaveReason reason;

  WillSaveTextDocumentParams copyWith({
    TextDocumentIdentifier? textDocument,
    TextDocumentSaveReason? reason,
  }) => WillSaveTextDocumentParams(
    textDocument: textDocument ?? this.textDocument,
    reason: reason ?? this.reason,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'reason': reason.value,
    };
  }
}

/// A text edit applicable to a text document.
final class TextEdit {
  const TextEdit({required this.range, required this.newText});

  factory TextEdit.fromJson(Map<String, Object?> json) => TextEdit(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    newText: json['newText'] as String,
  );

  final Range range;

  final String newText;

  TextEdit copyWith({Range? range, String? newText}) =>
      TextEdit(range: range ?? this.range, newText: newText ?? this.newText);

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'newText': newText};
  }
}

/// The watched files change notification's parameters.
final class DidChangeWatchedFilesParams {
  const DidChangeWatchedFilesParams({required this.changes});

  factory DidChangeWatchedFilesParams.fromJson(Map<String, Object?> json) =>
      DidChangeWatchedFilesParams(
        changes: (json['changes'] as List<Object?>)
            .map((e) => FileEvent.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<FileEvent> changes;

  DidChangeWatchedFilesParams copyWith({List<FileEvent>? changes}) =>
      DidChangeWatchedFilesParams(changes: changes ?? this.changes);

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'changes': changes.map((e) => e.toJson()).toList(),
    };
  }
}

/// Describe options to be used when registered for text document change events.
final class DidChangeWatchedFilesRegistrationOptions {
  const DidChangeWatchedFilesRegistrationOptions({required this.watchers});

  factory DidChangeWatchedFilesRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DidChangeWatchedFilesRegistrationOptions(
    watchers: (json['watchers'] as List<Object?>)
        .map((e) => FileSystemWatcher.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  final List<FileSystemWatcher> watchers;

  DidChangeWatchedFilesRegistrationOptions copyWith({
    List<FileSystemWatcher>? watchers,
  }) => DidChangeWatchedFilesRegistrationOptions(
    watchers: watchers ?? this.watchers,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'watchers': watchers.map((e) => e.toJson()).toList(),
    };
  }
}

/// The publish diagnostic notification's parameters.
final class PublishDiagnosticsParams {
  const PublishDiagnosticsParams({
    required this.uri,
    this.version,
    required this.diagnostics,
  });

  factory PublishDiagnosticsParams.fromJson(Map<String, Object?> json) =>
      PublishDiagnosticsParams(
        uri: json['uri'] as String,
        version: json['version'] as int?,
        diagnostics: (json['diagnostics'] as List<Object?>)
            .map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final String uri;

  final int? version;

  final List<Diagnostic> diagnostics;

  PublishDiagnosticsParams copyWith({
    String? uri,
    int? version,
    List<Diagnostic>? diagnostics,
  }) => PublishDiagnosticsParams(
    uri: uri ?? this.uri,
    version: version ?? this.version,
    diagnostics: diagnostics ?? this.diagnostics,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'uri': uri,
      'version': version,
      'diagnostics': diagnostics.map((e) => e.toJson()).toList(),
    };
  }
}

/// Completion parameters
final class CompletionParams {
  const CompletionParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
    this.context,
  });

  factory CompletionParams.fromJson(Map<String, Object?> json) =>
      CompletionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        context: json['context'] == null
            ? null
            : CompletionContext.fromJson(
                json['context'] as Map<String, Object?>,
              ),
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final CompletionContext? context;

  CompletionParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    CompletionContext? context,
  }) => CompletionParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    context: context ?? this.context,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'context': context?.toJson(),
    };
  }
}

/// A completion item represents a text snippet that is
/// proposed to complete text that is being typed.
final class CompletionItem {
  const CompletionItem({
    required this.label,
    this.labelDetails,
    this.kind,
    this.tags,
    this.detail,
    this.documentation,
    this.deprecated,
    this.preselect,
    this.sortText,
    this.filterText,
    this.insertText,
    this.insertTextFormat,
    this.insertTextMode,
    this.textEdit,
    this.textEditText,
    this.additionalTextEdits,
    this.commitCharacters,
    this.command,
    this.data,
  });

  factory CompletionItem.fromJson(Map<String, Object?> json) => CompletionItem(
    label: json['label'] as String,
    labelDetails: json['labelDetails'] == null
        ? null
        : CompletionItemLabelDetails.fromJson(
            json['labelDetails'] as Map<String, Object?>,
          ),
    kind: json['kind'] == null
        ? null
        : CompletionItemKind.values.firstWhere(
            (e) => e.value == json['kind'] as int,
          ),
    tags: (json['tags'] as List<Object?>?)
        ?.map((e) => e as CompletionItemTag)
        .toList(),
    detail: json['detail'] as String?,
    documentation: json['documentation'] as Object?,
    deprecated: json['deprecated'] as bool?,
    preselect: json['preselect'] as bool?,
    sortText: json['sortText'] as String?,
    filterText: json['filterText'] as String?,
    insertText: json['insertText'] as String?,
    insertTextFormat: json['insertTextFormat'] == null
        ? null
        : InsertTextFormat.values.firstWhere(
            (e) => e.value == json['insertTextFormat'] as int,
          ),
    insertTextMode: json['insertTextMode'] == null
        ? null
        : InsertTextMode.values.firstWhere(
            (e) => e.value == json['insertTextMode'] as int,
          ),
    textEdit: json['textEdit'] as Object?,
    textEditText: json['textEditText'] as String?,
    additionalTextEdits: (json['additionalTextEdits'] as List<Object?>?)
        ?.map((e) => TextEdit.fromJson(e as Map<String, Object?>))
        .toList(),
    commitCharacters: (json['commitCharacters'] as List<Object?>?)
        ?.map((e) => e as String)
        .toList(),
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, Object?>),
    data: json['data'] as LSPAny?,
  );

  final String label;

  final CompletionItemLabelDetails? labelDetails;

  final CompletionItemKind? kind;

  final List<CompletionItemTag>? tags;

  final String? detail;

  final Object? documentation;

  final bool? deprecated;

  final bool? preselect;

  final String? sortText;

  final String? filterText;

  final String? insertText;

  final InsertTextFormat? insertTextFormat;

  final InsertTextMode? insertTextMode;

  final Object? textEdit;

  final String? textEditText;

  final List<TextEdit>? additionalTextEdits;

  final List<String>? commitCharacters;

  final Command? command;

  final LSPAny? data;

  CompletionItem copyWith({
    String? label,
    CompletionItemLabelDetails? labelDetails,
    CompletionItemKind? kind,
    List<CompletionItemTag>? tags,
    String? detail,
    Object? documentation,
    bool? deprecated,
    bool? preselect,
    String? sortText,
    String? filterText,
    String? insertText,
    InsertTextFormat? insertTextFormat,
    InsertTextMode? insertTextMode,
    Object? textEdit,
    String? textEditText,
    List<TextEdit>? additionalTextEdits,
    List<String>? commitCharacters,
    Command? command,
    LSPAny? data,
  }) => CompletionItem(
    label: label ?? this.label,
    labelDetails: labelDetails ?? this.labelDetails,
    kind: kind ?? this.kind,
    tags: tags ?? this.tags,
    detail: detail ?? this.detail,
    documentation: documentation ?? this.documentation,
    deprecated: deprecated ?? this.deprecated,
    preselect: preselect ?? this.preselect,
    sortText: sortText ?? this.sortText,
    filterText: filterText ?? this.filterText,
    insertText: insertText ?? this.insertText,
    insertTextFormat: insertTextFormat ?? this.insertTextFormat,
    insertTextMode: insertTextMode ?? this.insertTextMode,
    textEdit: textEdit ?? this.textEdit,
    textEditText: textEditText ?? this.textEditText,
    additionalTextEdits: additionalTextEdits ?? this.additionalTextEdits,
    commitCharacters: commitCharacters ?? this.commitCharacters,
    command: command ?? this.command,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'label': label,
      'labelDetails': labelDetails?.toJson(),
      'kind': kind?.value,
      'tags': tags,
      'detail': detail,
      'documentation': documentation,
      'deprecated': deprecated,
      'preselect': preselect,
      'sortText': sortText,
      'filterText': filterText,
      'insertText': insertText,
      'insertTextFormat': insertTextFormat?.value,
      'insertTextMode': insertTextMode?.value,
      'textEdit': textEdit,
      'textEditText': textEditText,
      'additionalTextEdits': additionalTextEdits
          ?.map((e) => e.toJson())
          .toList(),
      'commitCharacters': commitCharacters,
      'command': command?.toJson(),
      'data': data,
    };
  }
}

/// Represents a collection of {@link CompletionItem completion items} to be presented
/// in the editor.
final class CompletionList {
  const CompletionList({
    required this.isIncomplete,
    this.itemDefaults,
    required this.items,
  });

  factory CompletionList.fromJson(Map<String, Object?> json) => CompletionList(
    isIncomplete: json['isIncomplete'] as bool,
    itemDefaults: json['itemDefaults'] == null
        ? null
        : CompletionListItemDefaults.fromJson(
            json['itemDefaults'] as Map<String, Object?>,
          ),
    items: (json['items'] as List<Object?>)
        .map((e) => CompletionItem.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  final bool isIncomplete;

  final CompletionListItemDefaults? itemDefaults;

  final List<CompletionItem> items;

  CompletionList copyWith({
    bool? isIncomplete,
    CompletionListItemDefaults? itemDefaults,
    List<CompletionItem>? items,
  }) => CompletionList(
    isIncomplete: isIncomplete ?? this.isIncomplete,
    itemDefaults: itemDefaults ?? this.itemDefaults,
    items: items ?? this.items,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'isIncomplete': isIncomplete,
      'itemDefaults': itemDefaults?.toJson(),
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

/// Registration options for a {@link CompletionRequest}.
final class CompletionRegistrationOptions {
  const CompletionRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.triggerCharacters,
    this.allCommitCharacters,
    this.resolveProvider,
    this.completionItem,
  });

  factory CompletionRegistrationOptions.fromJson(Map<String, Object?> json) =>
      CompletionRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        triggerCharacters: (json['triggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        allCommitCharacters: (json['allCommitCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        resolveProvider: json['resolveProvider'] as bool?,
        completionItem: json['completionItem'] == null
            ? null
            : CompletionOptionsCompletionItem.fromJson(
                json['completionItem'] as Map<String, Object?>,
              ),
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final List<String>? triggerCharacters;

  final List<String>? allCommitCharacters;

  final bool? resolveProvider;

  final CompletionOptionsCompletionItem? completionItem;

  CompletionRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? allCommitCharacters,
    bool? resolveProvider,
    CompletionOptionsCompletionItem? completionItem,
  }) => CompletionRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    triggerCharacters: triggerCharacters ?? this.triggerCharacters,
    allCommitCharacters: allCommitCharacters ?? this.allCommitCharacters,
    resolveProvider: resolveProvider ?? this.resolveProvider,
    completionItem: completionItem ?? this.completionItem,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'triggerCharacters': triggerCharacters,
      'allCommitCharacters': allCommitCharacters,
      'resolveProvider': resolveProvider,
      'completionItem': completionItem?.toJson(),
    };
  }
}

/// Parameters for a {@link HoverRequest}.
final class HoverParams {
  const HoverParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
  });

  factory HoverParams.fromJson(Map<String, Object?> json) => HoverParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    workDoneToken: json['workDoneToken'] as ProgressToken?,
  );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  HoverParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
  }) => HoverParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// The result of a hover request.
final class Hover {
  const Hover({required this.contents, this.range});

  factory Hover.fromJson(Map<String, Object?> json) => Hover(
    contents: json['contents'] as Object,
    range: json['range'] == null
        ? null
        : Range.fromJson(json['range'] as Map<String, Object?>),
  );

  final Object contents;

  final Range? range;

  Hover copyWith({Object? contents, Range? range}) =>
      Hover(contents: contents ?? this.contents, range: range ?? this.range);

  Map<String, Object?> toJson() {
    return <String, Object?>{'contents': contents, 'range': range?.toJson()};
  }
}

/// Registration options for a {@link HoverRequest}.
final class HoverRegistrationOptions {
  const HoverRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory HoverRegistrationOptions.fromJson(Map<String, Object?> json) =>
      HoverRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  HoverRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) => HoverRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link SignatureHelpRequest}.
final class SignatureHelpParams {
  const SignatureHelpParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.context,
  });

  factory SignatureHelpParams.fromJson(Map<String, Object?> json) =>
      SignatureHelpParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        context: json['context'] == null
            ? null
            : SignatureHelpContext.fromJson(
                json['context'] as Map<String, Object?>,
              ),
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final SignatureHelpContext? context;

  SignatureHelpParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    SignatureHelpContext? context,
  }) => SignatureHelpParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    context: context ?? this.context,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'context': context?.toJson(),
    };
  }
}

/// Signature help represents the signature of something
/// callable. There can be multiple signature but only one
/// active and only one active parameter.
final class SignatureHelp {
  const SignatureHelp({
    required this.signatures,
    this.activeSignature,
    this.activeParameter,
  });

  factory SignatureHelp.fromJson(Map<String, Object?> json) => SignatureHelp(
    signatures: (json['signatures'] as List<Object?>)
        .map((e) => SignatureInformation.fromJson(e as Map<String, Object?>))
        .toList(),
    activeSignature: json['activeSignature'] as int?,
    activeParameter: json['activeParameter'] as int?,
  );

  final List<SignatureInformation> signatures;

  final int? activeSignature;

  final int? activeParameter;

  SignatureHelp copyWith({
    List<SignatureInformation>? signatures,
    int? activeSignature,
    int? activeParameter,
  }) => SignatureHelp(
    signatures: signatures ?? this.signatures,
    activeSignature: activeSignature ?? this.activeSignature,
    activeParameter: activeParameter ?? this.activeParameter,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'signatures': signatures.map((e) => e.toJson()).toList(),
      'activeSignature': activeSignature,
      'activeParameter': activeParameter,
    };
  }
}

/// Registration options for a {@link SignatureHelpRequest}.
final class SignatureHelpRegistrationOptions {
  const SignatureHelpRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.triggerCharacters,
    this.retriggerCharacters,
  });

  factory SignatureHelpRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => SignatureHelpRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    triggerCharacters: (json['triggerCharacters'] as List<Object?>?)
        ?.map((e) => e as String)
        .toList(),
    retriggerCharacters: (json['retriggerCharacters'] as List<Object?>?)
        ?.map((e) => e as String)
        .toList(),
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final List<String>? triggerCharacters;

  final List<String>? retriggerCharacters;

  SignatureHelpRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? retriggerCharacters,
  }) => SignatureHelpRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    triggerCharacters: triggerCharacters ?? this.triggerCharacters,
    retriggerCharacters: retriggerCharacters ?? this.retriggerCharacters,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'triggerCharacters': triggerCharacters,
      'retriggerCharacters': retriggerCharacters,
    };
  }
}

/// Parameters for a {@link DefinitionRequest}.
final class DefinitionParams {
  const DefinitionParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
  });

  factory DefinitionParams.fromJson(Map<String, Object?> json) =>
      DefinitionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  DefinitionParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) => DefinitionParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
    };
  }
}

/// Registration options for a {@link DefinitionRequest}.
final class DefinitionRegistrationOptions {
  const DefinitionRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory DefinitionRegistrationOptions.fromJson(Map<String, Object?> json) =>
      DefinitionRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  DefinitionRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) => DefinitionRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link ReferencesRequest}.
final class ReferenceParams {
  const ReferenceParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
    required this.context,
  });

  factory ReferenceParams.fromJson(Map<String, Object?> json) =>
      ReferenceParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        context: ReferenceContext.fromJson(
          json['context'] as Map<String, Object?>,
        ),
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final ReferenceContext context;

  ReferenceParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    ReferenceContext? context,
  }) => ReferenceParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    context: context ?? this.context,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'context': context.toJson(),
    };
  }
}

/// Registration options for a {@link ReferencesRequest}.
final class ReferenceRegistrationOptions {
  const ReferenceRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory ReferenceRegistrationOptions.fromJson(Map<String, Object?> json) =>
      ReferenceRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  ReferenceRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) => ReferenceRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link DocumentHighlightRequest}.
final class DocumentHighlightParams {
  const DocumentHighlightParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
    this.partialResultToken,
  });

  factory DocumentHighlightParams.fromJson(Map<String, Object?> json) =>
      DocumentHighlightParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  DocumentHighlightParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) => DocumentHighlightParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
    };
  }
}

/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
final class DocumentHighlight {
  const DocumentHighlight({required this.range, this.kind});

  factory DocumentHighlight.fromJson(Map<String, Object?> json) =>
      DocumentHighlight(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        kind: json['kind'] == null
            ? null
            : DocumentHighlightKind.values.firstWhere(
                (e) => e.value == json['kind'] as int,
              ),
      );

  final Range range;

  final DocumentHighlightKind? kind;

  DocumentHighlight copyWith({Range? range, DocumentHighlightKind? kind}) =>
      DocumentHighlight(range: range ?? this.range, kind: kind ?? this.kind);

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'kind': kind?.value};
  }
}

/// Registration options for a {@link DocumentHighlightRequest}.
final class DocumentHighlightRegistrationOptions {
  const DocumentHighlightRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DocumentHighlightRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  DocumentHighlightRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) => DocumentHighlightRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link DocumentSymbolRequest}.
final class DocumentSymbolParams {
  const DocumentSymbolParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
  });

  factory DocumentSymbolParams.fromJson(Map<String, Object?> json) =>
      DocumentSymbolParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  DocumentSymbolParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
  }) => DocumentSymbolParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Represents information about programming constructs like variables, classes,
/// interfaces etc.
final class SymbolInformation {
  const SymbolInformation({
    required this.name,
    required this.kind,
    this.tags,
    this.containerName,
    this.deprecated,
    required this.location,
  });

  factory SymbolInformation.fromJson(
    Map<String, Object?> json,
  ) => SymbolInformation(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    containerName: json['containerName'] as String?,
    deprecated: json['deprecated'] as bool?,
    location: Location.fromJson(json['location'] as Map<String, Object?>),
  );

  final String name;

  final SymbolKind kind;

  final List<SymbolTag>? tags;

  final String? containerName;

  final bool? deprecated;

  final Location location;

  SymbolInformation copyWith({
    String? name,
    SymbolKind? kind,
    List<SymbolTag>? tags,
    String? containerName,
    bool? deprecated,
    Location? location,
  }) => SymbolInformation(
    name: name ?? this.name,
    kind: kind ?? this.kind,
    tags: tags ?? this.tags,
    containerName: containerName ?? this.containerName,
    deprecated: deprecated ?? this.deprecated,
    location: location ?? this.location,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'kind': kind.value,
      'tags': tags,
      'containerName': containerName,
      'deprecated': deprecated,
      'location': location.toJson(),
    };
  }
}

/// Represents programming constructs like variables, classes, interfaces etc.
/// that appear in a document. Document symbols can be hierarchical and they
/// have two ranges: one that encloses its definition and one that points to
/// its most interesting range, e.g. the range of an identifier.
final class DocumentSymbol {
  const DocumentSymbol({
    required this.name,
    this.detail,
    required this.kind,
    this.tags,
    this.deprecated,
    required this.range,
    required this.selectionRange,
    this.children,
  });

  factory DocumentSymbol.fromJson(Map<String, Object?> json) => DocumentSymbol(
    name: json['name'] as String,
    detail: json['detail'] as String?,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    deprecated: json['deprecated'] as bool?,
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    selectionRange: Range.fromJson(
      json['selectionRange'] as Map<String, Object?>,
    ),
    children: (json['children'] as List<Object?>?)
        ?.map((e) => DocumentSymbol.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  final String name;

  final String? detail;

  final SymbolKind kind;

  final List<SymbolTag>? tags;

  final bool? deprecated;

  final Range range;

  final Range selectionRange;

  final List<DocumentSymbol>? children;

  DocumentSymbol copyWith({
    String? name,
    String? detail,
    SymbolKind? kind,
    List<SymbolTag>? tags,
    bool? deprecated,
    Range? range,
    Range? selectionRange,
    List<DocumentSymbol>? children,
  }) => DocumentSymbol(
    name: name ?? this.name,
    detail: detail ?? this.detail,
    kind: kind ?? this.kind,
    tags: tags ?? this.tags,
    deprecated: deprecated ?? this.deprecated,
    range: range ?? this.range,
    selectionRange: selectionRange ?? this.selectionRange,
    children: children ?? this.children,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'detail': detail,
      'kind': kind.value,
      'tags': tags,
      'deprecated': deprecated,
      'range': range.toJson(),
      'selectionRange': selectionRange.toJson(),
      'children': children?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Registration options for a {@link DocumentSymbolRequest}.
final class DocumentSymbolRegistrationOptions {
  const DocumentSymbolRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.label,
  });

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DocumentSymbolRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    label: json['label'] as String?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final String? label;

  DocumentSymbolRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? label,
  }) => DocumentSymbolRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    label: label ?? this.label,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'label': label,
    };
  }
}

/// The parameters of a {@link CodeActionRequest}.
final class CodeActionParams {
  const CodeActionParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
    required this.range,
    required this.context,
  });

  factory CodeActionParams.fromJson(Map<String, Object?> json) =>
      CodeActionParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        context: CodeActionContext.fromJson(
          json['context'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  final Range range;

  final CodeActionContext context;

  CodeActionParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
    Range? range,
    CodeActionContext? context,
  }) => CodeActionParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
    range: range ?? this.range,
    context: context ?? this.context,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
      'context': context.toJson(),
    };
  }
}

/// Represents a reference to a command. Provides a title which
/// will be used to represent a command in the UI and, optionally,
/// an array of arguments which will be passed to the command handler
/// function when invoked.
final class Command {
  const Command({required this.title, required this.command, this.arguments});

  factory Command.fromJson(Map<String, Object?> json) => Command(
    title: json['title'] as String,
    command: json['command'] as String,
    arguments: (json['arguments'] as List<Object?>?)
        ?.map((e) => e as LSPAny)
        .toList(),
  );

  final String title;

  final String command;

  final List<LSPAny>? arguments;

  Command copyWith({String? title, String? command, List<LSPAny>? arguments}) =>
      Command(
        title: title ?? this.title,
        command: command ?? this.command,
        arguments: arguments ?? this.arguments,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'title': title,
      'command': command,
      'arguments': arguments,
    };
  }
}

/// A code action represents a change that can be performed in code, e.g. to fix a problem or
/// to refactor code.
///
/// A CodeAction must set either `edit` and/or a `command`. If both are supplied, the `edit` is applied first, then the `command` is executed.
final class CodeAction {
  const CodeAction({
    required this.title,
    this.kind,
    this.diagnostics,
    this.isPreferred,
    this.disabled,
    this.edit,
    this.command,
    this.data,
  });

  factory CodeAction.fromJson(Map<String, Object?> json) => CodeAction(
    title: json['title'] as String,
    kind: json['kind'] == null ? null : CodeActionKind(json['kind'] as String),
    diagnostics: (json['diagnostics'] as List<Object?>?)
        ?.map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
        .toList(),
    isPreferred: json['isPreferred'] as bool?,
    disabled: json['disabled'] == null
        ? null
        : CodeActionDisabled.fromJson(json['disabled'] as Map<String, Object?>),
    edit: json['edit'] == null
        ? null
        : WorkspaceEdit.fromJson(json['edit'] as Map<String, Object?>),
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, Object?>),
    data: json['data'] as LSPAny?,
  );

  final String title;

  final CodeActionKind? kind;

  final List<Diagnostic>? diagnostics;

  final bool? isPreferred;

  final CodeActionDisabled? disabled;

  final WorkspaceEdit? edit;

  final Command? command;

  final LSPAny? data;

  CodeAction copyWith({
    String? title,
    CodeActionKind? kind,
    List<Diagnostic>? diagnostics,
    bool? isPreferred,
    CodeActionDisabled? disabled,
    WorkspaceEdit? edit,
    Command? command,
    LSPAny? data,
  }) => CodeAction(
    title: title ?? this.title,
    kind: kind ?? this.kind,
    diagnostics: diagnostics ?? this.diagnostics,
    isPreferred: isPreferred ?? this.isPreferred,
    disabled: disabled ?? this.disabled,
    edit: edit ?? this.edit,
    command: command ?? this.command,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'title': title,
      'kind': kind?.value,
      'diagnostics': diagnostics?.map((e) => e.toJson()).toList(),
      'isPreferred': isPreferred,
      'disabled': disabled?.toJson(),
      'edit': edit?.toJson(),
      'command': command?.toJson(),
      'data': data,
    };
  }
}

/// Registration options for a {@link CodeActionRequest}.
final class CodeActionRegistrationOptions {
  const CodeActionRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.codeActionKinds,
    this.resolveProvider,
  });

  factory CodeActionRegistrationOptions.fromJson(Map<String, Object?> json) =>
      CodeActionRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        codeActionKinds: (json['codeActionKinds'] as List<Object?>?)
            ?.map((e) => e as CodeActionKind)
            .toList(),
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final List<CodeActionKind>? codeActionKinds;

  final bool? resolveProvider;

  CodeActionRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    List<CodeActionKind>? codeActionKinds,
    bool? resolveProvider,
  }) => CodeActionRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    codeActionKinds: codeActionKinds ?? this.codeActionKinds,
    resolveProvider: resolveProvider ?? this.resolveProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'codeActionKinds': codeActionKinds,
      'resolveProvider': resolveProvider,
    };
  }
}

/// The parameters of a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolParams {
  const WorkspaceSymbolParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.query,
  });

  factory WorkspaceSymbolParams.fromJson(Map<String, Object?> json) =>
      WorkspaceSymbolParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        query: json['query'] as String,
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final String query;

  WorkspaceSymbolParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    String? query,
  }) => WorkspaceSymbolParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    query: query ?? this.query,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'query': query,
    };
  }
}

/// A special workspace symbol that supports locations without a range.
///
/// See also SymbolInformation.
///
/// @since 3.17.0
final class WorkspaceSymbol {
  const WorkspaceSymbol({
    required this.name,
    required this.kind,
    this.tags,
    this.containerName,
    required this.location,
    this.data,
  });

  factory WorkspaceSymbol.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbol(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    containerName: json['containerName'] as String?,
    location: json['location'] as Object,
    data: json['data'] as LSPAny?,
  );

  final String name;

  final SymbolKind kind;

  final List<SymbolTag>? tags;

  final String? containerName;

  final Object location;

  final LSPAny? data;

  WorkspaceSymbol copyWith({
    String? name,
    SymbolKind? kind,
    List<SymbolTag>? tags,
    String? containerName,
    Object? location,
    LSPAny? data,
  }) => WorkspaceSymbol(
    name: name ?? this.name,
    kind: kind ?? this.kind,
    tags: tags ?? this.tags,
    containerName: containerName ?? this.containerName,
    location: location ?? this.location,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'kind': kind.value,
      'tags': tags,
      'containerName': containerName,
      'location': location,
      'data': data,
    };
  }
}

/// Registration options for a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolRegistrationOptions {
  const WorkspaceSymbolRegistrationOptions({
    this.workDoneProgress,
    this.resolveProvider,
  });

  factory WorkspaceSymbolRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    resolveProvider: json['resolveProvider'] as bool?,
  );

  final bool? workDoneProgress;

  final bool? resolveProvider;

  WorkspaceSymbolRegistrationOptions copyWith({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) => WorkspaceSymbolRegistrationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    resolveProvider: resolveProvider ?? this.resolveProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// The parameters of a {@link CodeLensRequest}.
final class CodeLensParams {
  const CodeLensParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
  });

  factory CodeLensParams.fromJson(Map<String, Object?> json) => CodeLensParams(
    workDoneToken: json['workDoneToken'] as ProgressToken?,
    partialResultToken: json['partialResultToken'] as ProgressToken?,
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
  );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  CodeLensParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
  }) => CodeLensParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
    };
  }
}

/// A code lens represents a {@link Command command} that should be shown along with
/// source text, like the number of references, a way to run tests, etc.
///
/// A code lens is _unresolved_ when no command is associated to it. For performance
/// reasons the creation of a code lens and resolving should be done in two stages.
final class CodeLens {
  const CodeLens({required this.range, this.command, this.data});

  factory CodeLens.fromJson(Map<String, Object?> json) => CodeLens(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, Object?>),
    data: json['data'] as LSPAny?,
  );

  final Range range;

  final Command? command;

  final LSPAny? data;

  CodeLens copyWith({Range? range, Command? command, LSPAny? data}) => CodeLens(
    range: range ?? this.range,
    command: command ?? this.command,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'command': command?.toJson(),
      'data': data,
    };
  }
}

/// Registration options for a {@link CodeLensRequest}.
final class CodeLensRegistrationOptions {
  const CodeLensRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.resolveProvider,
  });

  factory CodeLensRegistrationOptions.fromJson(Map<String, Object?> json) =>
      CodeLensRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final bool? resolveProvider;

  CodeLensRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? resolveProvider,
  }) => CodeLensRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    resolveProvider: resolveProvider ?? this.resolveProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// The parameters of a {@link DocumentLinkRequest}.
final class DocumentLinkParams {
  const DocumentLinkParams({
    this.workDoneToken,
    this.partialResultToken,
    required this.textDocument,
  });

  factory DocumentLinkParams.fromJson(Map<String, Object?> json) =>
      DocumentLinkParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        partialResultToken: json['partialResultToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final ProgressToken? partialResultToken;

  final TextDocumentIdentifier textDocument;

  DocumentLinkParams copyWith({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    TextDocumentIdentifier? textDocument,
  }) => DocumentLinkParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    partialResultToken: partialResultToken ?? this.partialResultToken,
    textDocument: textDocument ?? this.textDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
    };
  }
}

/// A document link is a range in a text document that links to an internal or external resource, like another
/// text document or a web site.
final class DocumentLink {
  const DocumentLink({
    required this.range,
    this.target,
    this.tooltip,
    this.data,
  });

  factory DocumentLink.fromJson(Map<String, Object?> json) => DocumentLink(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    target: json['target'] as String?,
    tooltip: json['tooltip'] as String?,
    data: json['data'] as LSPAny?,
  );

  final Range range;

  final String? target;

  final String? tooltip;

  final LSPAny? data;

  DocumentLink copyWith({
    Range? range,
    String? target,
    String? tooltip,
    LSPAny? data,
  }) => DocumentLink(
    range: range ?? this.range,
    target: target ?? this.target,
    tooltip: tooltip ?? this.tooltip,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'target': target,
      'tooltip': tooltip,
      'data': data,
    };
  }
}

/// Registration options for a {@link DocumentLinkRequest}.
final class DocumentLinkRegistrationOptions {
  const DocumentLinkRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.resolveProvider,
  });

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, Object?> json) =>
      DocumentLinkRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final bool? resolveProvider;

  DocumentLinkRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? resolveProvider,
  }) => DocumentLinkRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    resolveProvider: resolveProvider ?? this.resolveProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// The parameters of a {@link DocumentFormattingRequest}.
final class DocumentFormattingParams {
  const DocumentFormattingParams({
    this.workDoneToken,
    required this.textDocument,
    required this.options,
  });

  factory DocumentFormattingParams.fromJson(Map<String, Object?> json) =>
      DocumentFormattingParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        options: FormattingOptions.fromJson(
          json['options'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final TextDocumentIdentifier textDocument;

  final FormattingOptions options;

  DocumentFormattingParams copyWith({
    ProgressToken? workDoneToken,
    TextDocumentIdentifier? textDocument,
    FormattingOptions? options,
  }) => DocumentFormattingParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    textDocument: textDocument ?? this.textDocument,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'textDocument': textDocument.toJson(),
      'options': options.toJson(),
    };
  }
}

/// Registration options for a {@link DocumentFormattingRequest}.
final class DocumentFormattingRegistrationOptions {
  const DocumentFormattingRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DocumentFormattingRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  DocumentFormattingRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) => DocumentFormattingRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingParams {
  const DocumentRangeFormattingParams({
    this.workDoneToken,
    required this.textDocument,
    required this.range,
    required this.options,
  });

  factory DocumentRangeFormattingParams.fromJson(Map<String, Object?> json) =>
      DocumentRangeFormattingParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        options: FormattingOptions.fromJson(
          json['options'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final TextDocumentIdentifier textDocument;

  final Range range;

  final FormattingOptions options;

  DocumentRangeFormattingParams copyWith({
    ProgressToken? workDoneToken,
    TextDocumentIdentifier? textDocument,
    Range? range,
    FormattingOptions? options,
  }) => DocumentRangeFormattingParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    textDocument: textDocument ?? this.textDocument,
    range: range ?? this.range,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
      'options': options.toJson(),
    };
  }
}

/// Registration options for a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingRegistrationOptions {
  const DocumentRangeFormattingRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.rangesSupport,
  });

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DocumentRangeFormattingRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    rangesSupport: json['rangesSupport'] as bool?,
  );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final bool? rangesSupport;

  DocumentRangeFormattingRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? rangesSupport,
  }) => DocumentRangeFormattingRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    rangesSupport: rangesSupport ?? this.rangesSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'rangesSupport': rangesSupport,
    };
  }
}

/// The parameters of a {@link DocumentRangesFormattingRequest}.
///
/// @since 3.18.0
/// @proposed
final class DocumentRangesFormattingParams {
  const DocumentRangesFormattingParams({
    this.workDoneToken,
    required this.textDocument,
    required this.ranges,
    required this.options,
  });

  factory DocumentRangesFormattingParams.fromJson(Map<String, Object?> json) =>
      DocumentRangesFormattingParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        ranges: (json['ranges'] as List<Object?>)
            .map((e) => Range.fromJson(e as Map<String, Object?>))
            .toList(),
        options: FormattingOptions.fromJson(
          json['options'] as Map<String, Object?>,
        ),
      );

  final ProgressToken? workDoneToken;

  final TextDocumentIdentifier textDocument;

  final List<Range> ranges;

  final FormattingOptions options;

  DocumentRangesFormattingParams copyWith({
    ProgressToken? workDoneToken,
    TextDocumentIdentifier? textDocument,
    List<Range>? ranges,
    FormattingOptions? options,
  }) => DocumentRangesFormattingParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    textDocument: textDocument ?? this.textDocument,
    ranges: ranges ?? this.ranges,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'textDocument': textDocument.toJson(),
      'ranges': ranges.map((e) => e.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingParams {
  const DocumentOnTypeFormattingParams({
    required this.textDocument,
    required this.position,
    required this.ch,
    required this.options,
  });

  factory DocumentOnTypeFormattingParams.fromJson(Map<String, Object?> json) =>
      DocumentOnTypeFormattingParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        ch: json['ch'] as String,
        options: FormattingOptions.fromJson(
          json['options'] as Map<String, Object?>,
        ),
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final String ch;

  final FormattingOptions options;

  DocumentOnTypeFormattingParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    String? ch,
    FormattingOptions? options,
  }) => DocumentOnTypeFormattingParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    ch: ch ?? this.ch,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'ch': ch,
      'options': options.toJson(),
    };
  }
}

/// Registration options for a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingRegistrationOptions {
  const DocumentOnTypeFormattingRegistrationOptions({
    required this.documentSelector,
    required this.firstTriggerCharacter,
    this.moreTriggerCharacter,
  });

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => DocumentOnTypeFormattingRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    firstTriggerCharacter: json['firstTriggerCharacter'] as String,
    moreTriggerCharacter: (json['moreTriggerCharacter'] as List<Object?>?)
        ?.map((e) => e as String)
        .toList(),
  );

  final DocumentSelector? documentSelector;

  final String firstTriggerCharacter;

  final List<String>? moreTriggerCharacter;

  DocumentOnTypeFormattingRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    String? firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) => DocumentOnTypeFormattingRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    firstTriggerCharacter: firstTriggerCharacter ?? this.firstTriggerCharacter,
    moreTriggerCharacter: moreTriggerCharacter ?? this.moreTriggerCharacter,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'firstTriggerCharacter': firstTriggerCharacter,
      'moreTriggerCharacter': moreTriggerCharacter,
    };
  }
}

/// The parameters of a {@link RenameRequest}.
final class RenameParams {
  const RenameParams({
    this.workDoneToken,
    required this.textDocument,
    required this.position,
    required this.newName,
  });

  factory RenameParams.fromJson(Map<String, Object?> json) => RenameParams(
    workDoneToken: json['workDoneToken'] as ProgressToken?,
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    newName: json['newName'] as String,
  );

  final ProgressToken? workDoneToken;

  final TextDocumentIdentifier textDocument;

  final Position position;

  final String newName;

  RenameParams copyWith({
    ProgressToken? workDoneToken,
    TextDocumentIdentifier? textDocument,
    Position? position,
    String? newName,
  }) => RenameParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    newName: newName ?? this.newName,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'newName': newName,
    };
  }
}

/// Registration options for a {@link RenameRequest}.
final class RenameRegistrationOptions {
  const RenameRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
    this.prepareProvider,
  });

  factory RenameRegistrationOptions.fromJson(Map<String, Object?> json) =>
      RenameRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        prepareProvider: json['prepareProvider'] as bool?,
      );

  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  final bool? prepareProvider;

  RenameRegistrationOptions copyWith({
    DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? prepareProvider,
  }) => RenameRegistrationOptions(
    documentSelector: documentSelector ?? this.documentSelector,
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    prepareProvider: prepareProvider ?? this.prepareProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'prepareProvider': prepareProvider,
    };
  }
}

final class PrepareRenameParams {
  const PrepareRenameParams({
    required this.textDocument,
    required this.position,
    this.workDoneToken,
  });

  factory PrepareRenameParams.fromJson(Map<String, Object?> json) =>
      PrepareRenameParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] as ProgressToken?,
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  final ProgressToken? workDoneToken;

  PrepareRenameParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
    ProgressToken? workDoneToken,
  }) => PrepareRenameParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
    workDoneToken: workDoneToken ?? this.workDoneToken,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// The parameters of a {@link ExecuteCommandRequest}.
final class ExecuteCommandParams {
  const ExecuteCommandParams({
    this.workDoneToken,
    required this.command,
    this.arguments,
  });

  factory ExecuteCommandParams.fromJson(Map<String, Object?> json) =>
      ExecuteCommandParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
        command: json['command'] as String,
        arguments: (json['arguments'] as List<Object?>?)
            ?.map((e) => e as LSPAny)
            .toList(),
      );

  final ProgressToken? workDoneToken;

  final String command;

  final List<LSPAny>? arguments;

  ExecuteCommandParams copyWith({
    ProgressToken? workDoneToken,
    String? command,
    List<LSPAny>? arguments,
  }) => ExecuteCommandParams(
    workDoneToken: workDoneToken ?? this.workDoneToken,
    command: command ?? this.command,
    arguments: arguments ?? this.arguments,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken,
      'command': command,
      'arguments': arguments,
    };
  }
}

/// Registration options for a {@link ExecuteCommandRequest}.
final class ExecuteCommandRegistrationOptions {
  const ExecuteCommandRegistrationOptions({
    this.workDoneProgress,
    required this.commands,
  });

  factory ExecuteCommandRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => ExecuteCommandRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    commands: (json['commands'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  final bool? workDoneProgress;

  final List<String> commands;

  ExecuteCommandRegistrationOptions copyWith({
    bool? workDoneProgress,
    List<String>? commands,
  }) => ExecuteCommandRegistrationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    commands: commands ?? this.commands,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'commands': commands,
    };
  }
}

/// The parameters passed via an apply workspace edit request.
final class ApplyWorkspaceEditParams {
  const ApplyWorkspaceEditParams({this.label, required this.edit});

  factory ApplyWorkspaceEditParams.fromJson(Map<String, Object?> json) =>
      ApplyWorkspaceEditParams(
        label: json['label'] as String?,
        edit: WorkspaceEdit.fromJson(json['edit'] as Map<String, Object?>),
      );

  final String? label;

  final WorkspaceEdit edit;

  ApplyWorkspaceEditParams copyWith({String? label, WorkspaceEdit? edit}) =>
      ApplyWorkspaceEditParams(
        label: label ?? this.label,
        edit: edit ?? this.edit,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'label': label, 'edit': edit.toJson()};
  }
}

/// The result returned from the apply workspace edit request.
///
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
final class ApplyWorkspaceEditResult {
  const ApplyWorkspaceEditResult({
    required this.applied,
    this.failureReason,
    this.failedChange,
  });

  factory ApplyWorkspaceEditResult.fromJson(Map<String, Object?> json) =>
      ApplyWorkspaceEditResult(
        applied: json['applied'] as bool,
        failureReason: json['failureReason'] as String?,
        failedChange: json['failedChange'] as int?,
      );

  final bool applied;

  final String? failureReason;

  final int? failedChange;

  ApplyWorkspaceEditResult copyWith({
    bool? applied,
    String? failureReason,
    int? failedChange,
  }) => ApplyWorkspaceEditResult(
    applied: applied ?? this.applied,
    failureReason: failureReason ?? this.failureReason,
    failedChange: failedChange ?? this.failedChange,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'applied': applied,
      'failureReason': failureReason,
      'failedChange': failedChange,
    };
  }
}

final class WorkDoneProgressBegin {
  const WorkDoneProgressBegin({
    required this.kind,
    required this.title,
    this.cancellable,
    this.message,
    this.percentage,
  });

  factory WorkDoneProgressBegin.fromJson(Map<String, Object?> json) =>
      WorkDoneProgressBegin(
        kind: json['kind'] as String,
        title: json['title'] as String,
        cancellable: json['cancellable'] as bool?,
        message: json['message'] as String?,
        percentage: json['percentage'] as int?,
      );

  final String kind;

  final String title;

  final bool? cancellable;

  final String? message;

  final int? percentage;

  WorkDoneProgressBegin copyWith({
    String? kind,
    String? title,
    bool? cancellable,
    String? message,
    int? percentage,
  }) => WorkDoneProgressBegin(
    kind: kind ?? this.kind,
    title: title ?? this.title,
    cancellable: cancellable ?? this.cancellable,
    message: message ?? this.message,
    percentage: percentage ?? this.percentage,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind,
      'title': title,
      'cancellable': cancellable,
      'message': message,
      'percentage': percentage,
    };
  }
}

final class WorkDoneProgressReport {
  const WorkDoneProgressReport({
    required this.kind,
    this.cancellable,
    this.message,
    this.percentage,
  });

  factory WorkDoneProgressReport.fromJson(Map<String, Object?> json) =>
      WorkDoneProgressReport(
        kind: json['kind'] as String,
        cancellable: json['cancellable'] as bool?,
        message: json['message'] as String?,
        percentage: json['percentage'] as int?,
      );

  final String kind;

  final bool? cancellable;

  final String? message;

  final int? percentage;

  WorkDoneProgressReport copyWith({
    String? kind,
    bool? cancellable,
    String? message,
    int? percentage,
  }) => WorkDoneProgressReport(
    kind: kind ?? this.kind,
    cancellable: cancellable ?? this.cancellable,
    message: message ?? this.message,
    percentage: percentage ?? this.percentage,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind,
      'cancellable': cancellable,
      'message': message,
      'percentage': percentage,
    };
  }
}

final class WorkDoneProgressEnd {
  const WorkDoneProgressEnd({required this.kind, this.message});

  factory WorkDoneProgressEnd.fromJson(Map<String, Object?> json) =>
      WorkDoneProgressEnd(
        kind: json['kind'] as String,
        message: json['message'] as String?,
      );

  final String kind;

  final String? message;

  WorkDoneProgressEnd copyWith({String? kind, String? message}) =>
      WorkDoneProgressEnd(
        kind: kind ?? this.kind,
        message: message ?? this.message,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'message': message};
  }
}

final class SetTraceParams {
  const SetTraceParams({required this.value});

  factory SetTraceParams.fromJson(Map<String, Object?> json) => SetTraceParams(
    value: TraceValues.values.firstWhere(
      (e) => e.value == json['value'] as String,
    ),
  );

  final TraceValues value;

  SetTraceParams copyWith({TraceValues? value}) =>
      SetTraceParams(value: value ?? this.value);

  Map<String, Object?> toJson() {
    return <String, Object?>{'value': value.value};
  }
}

final class LogTraceParams {
  const LogTraceParams({required this.message, this.verbose});

  factory LogTraceParams.fromJson(Map<String, Object?> json) => LogTraceParams(
    message: json['message'] as String,
    verbose: json['verbose'] as String?,
  );

  final String message;

  final String? verbose;

  LogTraceParams copyWith({String? message, String? verbose}) => LogTraceParams(
    message: message ?? this.message,
    verbose: verbose ?? this.verbose,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'message': message, 'verbose': verbose};
  }
}

final class CancelParams {
  const CancelParams({required this.id});

  factory CancelParams.fromJson(Map<String, Object?> json) =>
      CancelParams(id: json['id'] as Object);

  final Object id;

  CancelParams copyWith({Object? id}) => CancelParams(id: id ?? this.id);

  Map<String, Object?> toJson() {
    return <String, Object?>{'id': id};
  }
}

final class ProgressParams {
  const ProgressParams({required this.token, required this.value});

  factory ProgressParams.fromJson(Map<String, Object?> json) => ProgressParams(
    token: json['token'] as ProgressToken,
    value: json['value'] as LSPAny,
  );

  final ProgressToken token;

  final LSPAny value;

  ProgressParams copyWith({ProgressToken? token, LSPAny? value}) =>
      ProgressParams(token: token ?? this.token, value: value ?? this.value);

  Map<String, Object?> toJson() {
    return <String, Object?>{'token': token, 'value': value};
  }
}

/// A parameter literal used in requests to pass a text document and a position inside that
/// document.
final class TextDocumentPositionParams {
  const TextDocumentPositionParams({
    required this.textDocument,
    required this.position,
  });

  factory TextDocumentPositionParams.fromJson(Map<String, Object?> json) =>
      TextDocumentPositionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
      );

  final TextDocumentIdentifier textDocument;

  final Position position;

  TextDocumentPositionParams copyWith({
    TextDocumentIdentifier? textDocument,
    Position? position,
  }) => TextDocumentPositionParams(
    textDocument: textDocument ?? this.textDocument,
    position: position ?? this.position,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
    };
  }
}

final class WorkDoneProgressParams {
  const WorkDoneProgressParams({this.workDoneToken});

  factory WorkDoneProgressParams.fromJson(Map<String, Object?> json) =>
      WorkDoneProgressParams(
        workDoneToken: json['workDoneToken'] as ProgressToken?,
      );

  final ProgressToken? workDoneToken;

  WorkDoneProgressParams copyWith({ProgressToken? workDoneToken}) =>
      WorkDoneProgressParams(
        workDoneToken: workDoneToken ?? this.workDoneToken,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneToken': workDoneToken};
  }
}

final class PartialResultParams {
  const PartialResultParams({this.partialResultToken});

  factory PartialResultParams.fromJson(Map<String, Object?> json) =>
      PartialResultParams(
        partialResultToken: json['partialResultToken'] as ProgressToken?,
      );

  final ProgressToken? partialResultToken;

  PartialResultParams copyWith({ProgressToken? partialResultToken}) =>
      PartialResultParams(
        partialResultToken: partialResultToken ?? this.partialResultToken,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'partialResultToken': partialResultToken};
  }
}

/// Represents the connection of two locations. Provides additional metadata over normal {@link Location locations},
/// including an origin range.
final class LocationLink {
  const LocationLink({
    this.originSelectionRange,
    required this.targetUri,
    required this.targetRange,
    required this.targetSelectionRange,
  });

  factory LocationLink.fromJson(Map<String, Object?> json) => LocationLink(
    originSelectionRange: json['originSelectionRange'] == null
        ? null
        : Range.fromJson(json['originSelectionRange'] as Map<String, Object?>),
    targetUri: json['targetUri'] as String,
    targetRange: Range.fromJson(json['targetRange'] as Map<String, Object?>),
    targetSelectionRange: Range.fromJson(
      json['targetSelectionRange'] as Map<String, Object?>,
    ),
  );

  final Range? originSelectionRange;

  final String targetUri;

  final Range targetRange;

  final Range targetSelectionRange;

  LocationLink copyWith({
    Range? originSelectionRange,
    String? targetUri,
    Range? targetRange,
    Range? targetSelectionRange,
  }) => LocationLink(
    originSelectionRange: originSelectionRange ?? this.originSelectionRange,
    targetUri: targetUri ?? this.targetUri,
    targetRange: targetRange ?? this.targetRange,
    targetSelectionRange: targetSelectionRange ?? this.targetSelectionRange,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'originSelectionRange': originSelectionRange?.toJson(),
      'targetUri': targetUri,
      'targetRange': targetRange.toJson(),
      'targetSelectionRange': targetSelectionRange.toJson(),
    };
  }
}

/// A range in a text document expressed as (zero-based) start and end positions.
///
/// If you want to specify a range that contains a line including the line ending
/// character(s) then use an end position denoting the start of the next line.
/// For example:
/// ```ts
/// {
///     start: { line: 5, character: 23 }
///     end : { line 6, character : 0 }
/// }
/// ```
final class Range {
  const Range({required this.start, required this.end});

  factory Range.fromJson(Map<String, Object?> json) => Range(
    start: Position.fromJson(json['start'] as Map<String, Object?>),
    end: Position.fromJson(json['end'] as Map<String, Object?>),
  );

  final Position start;

  final Position end;

  Range copyWith({Position? start, Position? end}) =>
      Range(start: start ?? this.start, end: end ?? this.end);

  Map<String, Object?> toJson() {
    return <String, Object?>{'start': start.toJson(), 'end': end.toJson()};
  }
}

final class ImplementationOptions {
  const ImplementationOptions({this.workDoneProgress});

  factory ImplementationOptions.fromJson(Map<String, Object?> json) =>
      ImplementationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  ImplementationOptions copyWith({bool? workDoneProgress}) =>
      ImplementationOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Static registration options to be returned in the initialize
/// request.
final class StaticRegistrationOptions {
  const StaticRegistrationOptions({this.id});

  factory StaticRegistrationOptions.fromJson(Map<String, Object?> json) =>
      StaticRegistrationOptions(id: json['id'] as String?);

  final String? id;

  StaticRegistrationOptions copyWith({String? id}) =>
      StaticRegistrationOptions(id: id ?? this.id);

  Map<String, Object?> toJson() {
    return <String, Object?>{'id': id};
  }
}

final class TypeDefinitionOptions {
  const TypeDefinitionOptions({this.workDoneProgress});

  factory TypeDefinitionOptions.fromJson(Map<String, Object?> json) =>
      TypeDefinitionOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  TypeDefinitionOptions copyWith({bool? workDoneProgress}) =>
      TypeDefinitionOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// The workspace folder change event.
final class WorkspaceFoldersChangeEvent {
  const WorkspaceFoldersChangeEvent({
    required this.added,
    required this.removed,
  });

  factory WorkspaceFoldersChangeEvent.fromJson(Map<String, Object?> json) =>
      WorkspaceFoldersChangeEvent(
        added: (json['added'] as List<Object?>)
            .map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
            .toList(),
        removed: (json['removed'] as List<Object?>)
            .map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final List<WorkspaceFolder> added;

  final List<WorkspaceFolder> removed;

  WorkspaceFoldersChangeEvent copyWith({
    List<WorkspaceFolder>? added,
    List<WorkspaceFolder>? removed,
  }) => WorkspaceFoldersChangeEvent(
    added: added ?? this.added,
    removed: removed ?? this.removed,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'added': added.map((e) => e.toJson()).toList(),
      'removed': removed.map((e) => e.toJson()).toList(),
    };
  }
}

final class ConfigurationItem {
  const ConfigurationItem({this.scopeUri, this.section});

  factory ConfigurationItem.fromJson(Map<String, Object?> json) =>
      ConfigurationItem(
        scopeUri: json['scopeUri'] as String?,
        section: json['section'] as String?,
      );

  final String? scopeUri;

  final String? section;

  ConfigurationItem copyWith({String? scopeUri, String? section}) =>
      ConfigurationItem(
        scopeUri: scopeUri ?? this.scopeUri,
        section: section ?? this.section,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'scopeUri': scopeUri, 'section': section};
  }
}

/// A literal to identify a text document in the client.
final class TextDocumentIdentifier {
  const TextDocumentIdentifier({required this.uri});

  factory TextDocumentIdentifier.fromJson(Map<String, Object?> json) =>
      TextDocumentIdentifier(uri: json['uri'] as String);

  final String uri;

  TextDocumentIdentifier copyWith({String? uri}) =>
      TextDocumentIdentifier(uri: uri ?? this.uri);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

/// Represents a color in RGBA space.
final class Color {
  const Color({
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
  });

  factory Color.fromJson(Map<String, Object?> json) => Color(
    red: json['red'] as double,
    green: json['green'] as double,
    blue: json['blue'] as double,
    alpha: json['alpha'] as double,
  );

  final double red;

  final double green;

  final double blue;

  final double alpha;

  Color copyWith({double? red, double? green, double? blue, double? alpha}) =>
      Color(
        red: red ?? this.red,
        green: green ?? this.green,
        blue: blue ?? this.blue,
        alpha: alpha ?? this.alpha,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'red': red,
      'green': green,
      'blue': blue,
      'alpha': alpha,
    };
  }
}

final class DocumentColorOptions {
  const DocumentColorOptions({this.workDoneProgress});

  factory DocumentColorOptions.fromJson(Map<String, Object?> json) =>
      DocumentColorOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  DocumentColorOptions copyWith({bool? workDoneProgress}) =>
      DocumentColorOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

final class FoldingRangeOptions {
  const FoldingRangeOptions({this.workDoneProgress});

  factory FoldingRangeOptions.fromJson(Map<String, Object?> json) =>
      FoldingRangeOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  FoldingRangeOptions copyWith({bool? workDoneProgress}) => FoldingRangeOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

final class DeclarationOptions {
  const DeclarationOptions({this.workDoneProgress});

  factory DeclarationOptions.fromJson(Map<String, Object?> json) =>
      DeclarationOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  DeclarationOptions copyWith({bool? workDoneProgress}) => DeclarationOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Position in a text document expressed as zero-based line and character
/// offset. Prior to 3.17 the offsets were always based on a UTF-16 string
/// representation. So a string of the form `a𐐀b` the character offset of the
/// character `a` is 0, the character offset of `𐐀` is 1 and the character
/// offset of b is 3 since `𐐀` is represented using two code units in UTF-16.
/// Since 3.17 clients and servers can agree on a different string encoding
/// representation (e.g. UTF-8). The client announces it's supported encoding
/// via the client capability [`general.positionEncodings`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#clientCapabilities).
/// The value is an array of position encodings the client supports, with
/// decreasing preference (e.g. the encoding at index `0` is the most preferred
/// one). To stay backwards compatible the only mandatory encoding is UTF-16
/// represented via the string `utf-16`. The server can pick one of the
/// encodings offered by the client and signals that encoding back to the
/// client via the initialize result's property
/// [`capabilities.positionEncoding`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#serverCapabilities). If the string value
/// `utf-16` is missing from the client's capability `general.positionEncodings`
/// servers can safely assume that the client supports UTF-16. If the server
/// omits the position encoding in its initialize result the encoding defaults
/// to the string value `utf-16`. Implementation considerations: since the
/// conversion from one encoding into another requires the content of the
/// file / line the conversion is best done where the file is read which is
/// usually on the server side.
///
/// Positions are line end character agnostic. So you can not specify a position
/// that denotes `\r|\n` or `\n|` where `|` represents the character offset.
///
/// @since 3.17.0 - support for negotiated position encoding.
final class Position {
  const Position({required this.line, required this.character});

  factory Position.fromJson(Map<String, Object?> json) =>
      Position(line: json['line'] as int, character: json['character'] as int);

  final int line;

  final int character;

  Position copyWith({int? line, int? character}) =>
      Position(line: line ?? this.line, character: character ?? this.character);

  Map<String, Object?> toJson() {
    return <String, Object?>{'line': line, 'character': character};
  }
}

final class SelectionRangeOptions {
  const SelectionRangeOptions({this.workDoneProgress});

  factory SelectionRangeOptions.fromJson(Map<String, Object?> json) =>
      SelectionRangeOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  SelectionRangeOptions copyWith({bool? workDoneProgress}) =>
      SelectionRangeOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Call hierarchy options used during static registration.
///
/// @since 3.16.0
final class CallHierarchyOptions {
  const CallHierarchyOptions({this.workDoneProgress});

  factory CallHierarchyOptions.fromJson(Map<String, Object?> json) =>
      CallHierarchyOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  CallHierarchyOptions copyWith({bool? workDoneProgress}) =>
      CallHierarchyOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// @since 3.16.0
final class SemanticTokensOptions {
  const SemanticTokensOptions({
    this.workDoneProgress,
    required this.legend,
    this.range,
    this.full,
  });

  factory SemanticTokensOptions.fromJson(Map<String, Object?> json) =>
      SemanticTokensOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        legend: SemanticTokensLegend.fromJson(
          json['legend'] as Map<String, Object?>,
        ),
        range: json['range'] as Object?,
        full: json['full'] as Object?,
      );

  final bool? workDoneProgress;

  final SemanticTokensLegend legend;

  final Object? range;

  final Object? full;

  SemanticTokensOptions copyWith({
    bool? workDoneProgress,
    SemanticTokensLegend? legend,
    Object? range,
    Object? full,
  }) => SemanticTokensOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    legend: legend ?? this.legend,
    range: range ?? this.range,
    full: full ?? this.full,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'legend': legend.toJson(),
      'range': range,
      'full': full,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensEdit {
  const SemanticTokensEdit({
    required this.start,
    required this.deleteCount,
    this.data,
  });

  factory SemanticTokensEdit.fromJson(Map<String, Object?> json) =>
      SemanticTokensEdit(
        start: json['start'] as int,
        deleteCount: json['deleteCount'] as int,
        data: (json['data'] as List<Object?>?)?.map((e) => e as int).toList(),
      );

  final int start;

  final int deleteCount;

  final List<int>? data;

  SemanticTokensEdit copyWith({
    int? start,
    int? deleteCount,
    List<int>? data,
  }) => SemanticTokensEdit(
    start: start ?? this.start,
    deleteCount: deleteCount ?? this.deleteCount,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'start': start,
      'deleteCount': deleteCount,
      'data': data,
    };
  }
}

final class LinkedEditingRangeOptions {
  const LinkedEditingRangeOptions({this.workDoneProgress});

  factory LinkedEditingRangeOptions.fromJson(Map<String, Object?> json) =>
      LinkedEditingRangeOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  LinkedEditingRangeOptions copyWith({bool? workDoneProgress}) =>
      LinkedEditingRangeOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Represents information on a file/folder create.
///
/// @since 3.16.0
final class FileCreate {
  const FileCreate({required this.uri});

  factory FileCreate.fromJson(Map<String, Object?> json) =>
      FileCreate(uri: json['uri'] as String);

  final String uri;

  FileCreate copyWith({String? uri}) => FileCreate(uri: uri ?? this.uri);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

/// Describes textual changes on a text document. A TextDocumentEdit describes all changes
/// on a document version Si and after they are applied move the document to version Si+1.
/// So the creator of a TextDocumentEdit doesn't need to sort the array of edits or do any
/// kind of ordering. However the edits must be non overlapping.
final class TextDocumentEdit {
  const TextDocumentEdit({required this.textDocument, required this.edits});

  factory TextDocumentEdit.fromJson(Map<String, Object?> json) =>
      TextDocumentEdit(
        textDocument: OptionalVersionedTextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        edits: (json['edits'] as List<Object?>)
            .map((e) => e as Object)
            .toList(),
      );

  final OptionalVersionedTextDocumentIdentifier textDocument;

  final List<Object> edits;

  TextDocumentEdit copyWith({
    OptionalVersionedTextDocumentIdentifier? textDocument,
    List<Object>? edits,
  }) => TextDocumentEdit(
    textDocument: textDocument ?? this.textDocument,
    edits: edits ?? this.edits,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'edits': edits,
    };
  }
}

/// Create file operation.
final class CreateFile {
  const CreateFile({
    this.annotationId,
    required this.kind,
    required this.uri,
    this.options,
  });

  factory CreateFile.fromJson(Map<String, Object?> json) => CreateFile(
    annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
    kind: json['kind'] as String,
    uri: json['uri'] as String,
    options: json['options'] == null
        ? null
        : CreateFileOptions.fromJson(json['options'] as Map<String, Object?>),
  );

  final ChangeAnnotationIdentifier? annotationId;

  final String kind;

  final String uri;

  final CreateFileOptions? options;

  CreateFile copyWith({
    ChangeAnnotationIdentifier? annotationId,
    String? kind,
    String? uri,
    CreateFileOptions? options,
  }) => CreateFile(
    annotationId: annotationId ?? this.annotationId,
    kind: kind ?? this.kind,
    uri: uri ?? this.uri,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'annotationId': annotationId,
      'kind': kind,
      'uri': uri,
      'options': options?.toJson(),
    };
  }
}

/// Rename file operation
final class RenameFile {
  const RenameFile({
    this.annotationId,
    required this.kind,
    required this.oldUri,
    required this.newUri,
    this.options,
  });

  factory RenameFile.fromJson(Map<String, Object?> json) => RenameFile(
    annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
    kind: json['kind'] as String,
    oldUri: json['oldUri'] as String,
    newUri: json['newUri'] as String,
    options: json['options'] == null
        ? null
        : RenameFileOptions.fromJson(json['options'] as Map<String, Object?>),
  );

  final ChangeAnnotationIdentifier? annotationId;

  final String kind;

  final String oldUri;

  final String newUri;

  final RenameFileOptions? options;

  RenameFile copyWith({
    ChangeAnnotationIdentifier? annotationId,
    String? kind,
    String? oldUri,
    String? newUri,
    RenameFileOptions? options,
  }) => RenameFile(
    annotationId: annotationId ?? this.annotationId,
    kind: kind ?? this.kind,
    oldUri: oldUri ?? this.oldUri,
    newUri: newUri ?? this.newUri,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'annotationId': annotationId,
      'kind': kind,
      'oldUri': oldUri,
      'newUri': newUri,
      'options': options?.toJson(),
    };
  }
}

/// Delete file operation
final class DeleteFile {
  const DeleteFile({
    this.annotationId,
    required this.kind,
    required this.uri,
    this.options,
  });

  factory DeleteFile.fromJson(Map<String, Object?> json) => DeleteFile(
    annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
    kind: json['kind'] as String,
    uri: json['uri'] as String,
    options: json['options'] == null
        ? null
        : DeleteFileOptions.fromJson(json['options'] as Map<String, Object?>),
  );

  final ChangeAnnotationIdentifier? annotationId;

  final String kind;

  final String uri;

  final DeleteFileOptions? options;

  DeleteFile copyWith({
    ChangeAnnotationIdentifier? annotationId,
    String? kind,
    String? uri,
    DeleteFileOptions? options,
  }) => DeleteFile(
    annotationId: annotationId ?? this.annotationId,
    kind: kind ?? this.kind,
    uri: uri ?? this.uri,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'annotationId': annotationId,
      'kind': kind,
      'uri': uri,
      'options': options?.toJson(),
    };
  }
}

/// Additional information that describes document changes.
///
/// @since 3.16.0
final class ChangeAnnotation {
  const ChangeAnnotation({
    required this.label,
    this.needsConfirmation,
    this.description,
  });

  factory ChangeAnnotation.fromJson(Map<String, Object?> json) =>
      ChangeAnnotation(
        label: json['label'] as String,
        needsConfirmation: json['needsConfirmation'] as bool?,
        description: json['description'] as String?,
      );

  final String label;

  final bool? needsConfirmation;

  final String? description;

  ChangeAnnotation copyWith({
    String? label,
    bool? needsConfirmation,
    String? description,
  }) => ChangeAnnotation(
    label: label ?? this.label,
    needsConfirmation: needsConfirmation ?? this.needsConfirmation,
    description: description ?? this.description,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'label': label,
      'needsConfirmation': needsConfirmation,
      'description': description,
    };
  }
}

/// A filter to describe in which file operation requests or notifications
/// the server is interested in receiving.
///
/// @since 3.16.0
final class FileOperationFilter {
  const FileOperationFilter({this.scheme, required this.pattern});

  factory FileOperationFilter.fromJson(Map<String, Object?> json) =>
      FileOperationFilter(
        scheme: json['scheme'] as String?,
        pattern: FileOperationPattern.fromJson(
          json['pattern'] as Map<String, Object?>,
        ),
      );

  final String? scheme;

  final FileOperationPattern pattern;

  FileOperationFilter copyWith({
    String? scheme,
    FileOperationPattern? pattern,
  }) => FileOperationFilter(
    scheme: scheme ?? this.scheme,
    pattern: pattern ?? this.pattern,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'scheme': scheme, 'pattern': pattern.toJson()};
  }
}

/// Represents information on a file/folder rename.
///
/// @since 3.16.0
final class FileRename {
  const FileRename({required this.oldUri, required this.newUri});

  factory FileRename.fromJson(Map<String, Object?> json) => FileRename(
    oldUri: json['oldUri'] as String,
    newUri: json['newUri'] as String,
  );

  final String oldUri;

  final String newUri;

  FileRename copyWith({String? oldUri, String? newUri}) =>
      FileRename(oldUri: oldUri ?? this.oldUri, newUri: newUri ?? this.newUri);

  Map<String, Object?> toJson() {
    return <String, Object?>{'oldUri': oldUri, 'newUri': newUri};
  }
}

/// Represents information on a file/folder delete.
///
/// @since 3.16.0
final class FileDelete {
  const FileDelete({required this.uri});

  factory FileDelete.fromJson(Map<String, Object?> json) =>
      FileDelete(uri: json['uri'] as String);

  final String uri;

  FileDelete copyWith({String? uri}) => FileDelete(uri: uri ?? this.uri);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

final class MonikerOptions {
  const MonikerOptions({this.workDoneProgress});

  factory MonikerOptions.fromJson(Map<String, Object?> json) =>
      MonikerOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  MonikerOptions copyWith({bool? workDoneProgress}) => MonikerOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Type hierarchy options used during static registration.
///
/// @since 3.17.0
final class TypeHierarchyOptions {
  const TypeHierarchyOptions({this.workDoneProgress});

  factory TypeHierarchyOptions.fromJson(Map<String, Object?> json) =>
      TypeHierarchyOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  TypeHierarchyOptions copyWith({bool? workDoneProgress}) =>
      TypeHierarchyOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// @since 3.17.0
final class InlineValueContext {
  const InlineValueContext({
    required this.frameId,
    required this.stoppedLocation,
  });

  factory InlineValueContext.fromJson(Map<String, Object?> json) =>
      InlineValueContext(
        frameId: json['frameId'] as int,
        stoppedLocation: Range.fromJson(
          json['stoppedLocation'] as Map<String, Object?>,
        ),
      );

  final int frameId;

  final Range stoppedLocation;

  InlineValueContext copyWith({int? frameId, Range? stoppedLocation}) =>
      InlineValueContext(
        frameId: frameId ?? this.frameId,
        stoppedLocation: stoppedLocation ?? this.stoppedLocation,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'frameId': frameId,
      'stoppedLocation': stoppedLocation.toJson(),
    };
  }
}

/// Provide inline value as text.
///
/// @since 3.17.0
final class InlineValueText {
  const InlineValueText({required this.range, required this.text});

  factory InlineValueText.fromJson(Map<String, Object?> json) =>
      InlineValueText(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        text: json['text'] as String,
      );

  final Range range;

  final String text;

  InlineValueText copyWith({Range? range, String? text}) =>
      InlineValueText(range: range ?? this.range, text: text ?? this.text);

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'text': text};
  }
}

/// Provide inline value through a variable lookup.
/// If only a range is specified, the variable name will be extracted from the underlying document.
/// An optional variable name can be used to override the extracted name.
///
/// @since 3.17.0
final class InlineValueVariableLookup {
  const InlineValueVariableLookup({
    required this.range,
    this.variableName,
    required this.caseSensitiveLookup,
  });

  factory InlineValueVariableLookup.fromJson(Map<String, Object?> json) =>
      InlineValueVariableLookup(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        variableName: json['variableName'] as String?,
        caseSensitiveLookup: json['caseSensitiveLookup'] as bool,
      );

  final Range range;

  final String? variableName;

  final bool caseSensitiveLookup;

  InlineValueVariableLookup copyWith({
    Range? range,
    String? variableName,
    bool? caseSensitiveLookup,
  }) => InlineValueVariableLookup(
    range: range ?? this.range,
    variableName: variableName ?? this.variableName,
    caseSensitiveLookup: caseSensitiveLookup ?? this.caseSensitiveLookup,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'variableName': variableName,
      'caseSensitiveLookup': caseSensitiveLookup,
    };
  }
}

/// Provide an inline value through an expression evaluation.
/// If only a range is specified, the expression will be extracted from the underlying document.
/// An optional expression can be used to override the extracted expression.
///
/// @since 3.17.0
final class InlineValueEvaluatableExpression {
  const InlineValueEvaluatableExpression({
    required this.range,
    this.expression,
  });

  factory InlineValueEvaluatableExpression.fromJson(
    Map<String, Object?> json,
  ) => InlineValueEvaluatableExpression(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    expression: json['expression'] as String?,
  );

  final Range range;

  final String? expression;

  InlineValueEvaluatableExpression copyWith({
    Range? range,
    String? expression,
  }) => InlineValueEvaluatableExpression(
    range: range ?? this.range,
    expression: expression ?? this.expression,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'expression': expression};
  }
}

/// Inline value options used during static registration.
///
/// @since 3.17.0
final class InlineValueOptions {
  const InlineValueOptions({this.workDoneProgress});

  factory InlineValueOptions.fromJson(Map<String, Object?> json) =>
      InlineValueOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  InlineValueOptions copyWith({bool? workDoneProgress}) => InlineValueOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// An inlay hint label part allows for interactive and composite labels
/// of inlay hints.
///
/// @since 3.17.0
final class InlayHintLabelPart {
  const InlayHintLabelPart({
    required this.value,
    this.tooltip,
    this.location,
    this.command,
  });

  factory InlayHintLabelPart.fromJson(Map<String, Object?> json) =>
      InlayHintLabelPart(
        value: json['value'] as String,
        tooltip: json['tooltip'] as Object?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, Object?>),
        command: json['command'] == null
            ? null
            : Command.fromJson(json['command'] as Map<String, Object?>),
      );

  final String value;

  final Object? tooltip;

  final Location? location;

  final Command? command;

  InlayHintLabelPart copyWith({
    String? value,
    Object? tooltip,
    Location? location,
    Command? command,
  }) => InlayHintLabelPart(
    value: value ?? this.value,
    tooltip: tooltip ?? this.tooltip,
    location: location ?? this.location,
    command: command ?? this.command,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'value': value,
      'tooltip': tooltip,
      'location': location?.toJson(),
      'command': command?.toJson(),
    };
  }
}

/// A `MarkupContent` literal represents a string value which content is interpreted base on its
/// kind flag. Currently the protocol supports `plaintext` and `markdown` as markup kinds.
///
/// If the kind is `markdown` then the value can contain fenced code blocks like in GitHub issues.
/// See https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
///
/// Here is an example how such a string can be constructed using JavaScript / TypeScript:
/// ```ts
/// let markdown: MarkdownContent = {
///  kind: MarkupKind.Markdown,
///  value: [
///    '# Header',
///    'Some text',
///    '```typescript',
///    'someCode();',
///    '```'
///  ].join('\n')
/// };
/// ```
///
/// *Please Note* that clients might sanitize the return markdown. A client could decide to
/// remove HTML from the markdown to avoid script execution.
final class MarkupContent {
  const MarkupContent({required this.kind, required this.value});

  factory MarkupContent.fromJson(Map<String, Object?> json) => MarkupContent(
    kind: MarkupKind.values.firstWhere(
      (e) => e.value == json['kind'] as String,
    ),
    value: json['value'] as String,
  );

  final MarkupKind kind;

  final String value;

  MarkupContent copyWith({MarkupKind? kind, String? value}) =>
      MarkupContent(kind: kind ?? this.kind, value: value ?? this.value);

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind.value, 'value': value};
  }
}

/// Inlay hint options used during static registration.
///
/// @since 3.17.0
final class InlayHintOptions {
  const InlayHintOptions({this.workDoneProgress, this.resolveProvider});

  factory InlayHintOptions.fromJson(Map<String, Object?> json) =>
      InlayHintOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final bool? workDoneProgress;

  final bool? resolveProvider;

  InlayHintOptions copyWith({bool? workDoneProgress, bool? resolveProvider}) =>
      InlayHintOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
        resolveProvider: resolveProvider ?? this.resolveProvider,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// A full diagnostic report with a set of related documents.
///
/// @since 3.17.0
final class RelatedFullDocumentDiagnosticReport {
  const RelatedFullDocumentDiagnosticReport({
    required this.kind,
    this.resultId,
    required this.items,
    this.relatedDocuments,
  });

  factory RelatedFullDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) => RelatedFullDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String?,
    items: (json['items'] as List<Object?>)
        .map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
        .toList(),
    relatedDocuments: (json['relatedDocuments'] as Map<String, Object?>?)?.map(
      (k, v) => MapEntry(k, v as Object),
    ),
  );

  final String kind;

  final String? resultId;

  final List<Diagnostic> items;

  final Map<String, Object>? relatedDocuments;

  RelatedFullDocumentDiagnosticReport copyWith({
    String? kind,
    String? resultId,
    List<Diagnostic>? items,
    Map<String, Object>? relatedDocuments,
  }) => RelatedFullDocumentDiagnosticReport(
    kind: kind ?? this.kind,
    resultId: resultId ?? this.resultId,
    items: items ?? this.items,
    relatedDocuments: relatedDocuments ?? this.relatedDocuments,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind,
      'resultId': resultId,
      'items': items.map((e) => e.toJson()).toList(),
      'relatedDocuments': relatedDocuments,
    };
  }
}

/// An unchanged diagnostic report with a set of related documents.
///
/// @since 3.17.0
final class RelatedUnchangedDocumentDiagnosticReport {
  const RelatedUnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
    this.relatedDocuments,
  });

  factory RelatedUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) => RelatedUnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
    relatedDocuments: (json['relatedDocuments'] as Map<String, Object?>?)?.map(
      (k, v) => MapEntry(k, v as Object),
    ),
  );

  final String kind;

  final String resultId;

  final Map<String, Object>? relatedDocuments;

  RelatedUnchangedDocumentDiagnosticReport copyWith({
    String? kind,
    String? resultId,
    Map<String, Object>? relatedDocuments,
  }) => RelatedUnchangedDocumentDiagnosticReport(
    kind: kind ?? this.kind,
    resultId: resultId ?? this.resultId,
    relatedDocuments: relatedDocuments ?? this.relatedDocuments,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind,
      'resultId': resultId,
      'relatedDocuments': relatedDocuments,
    };
  }
}

/// A diagnostic report with a full set of problems.
///
/// @since 3.17.0
final class FullDocumentDiagnosticReport {
  const FullDocumentDiagnosticReport({
    required this.kind,
    this.resultId,
    required this.items,
  });

  factory FullDocumentDiagnosticReport.fromJson(Map<String, Object?> json) =>
      FullDocumentDiagnosticReport(
        kind: json['kind'] as String,
        resultId: json['resultId'] as String?,
        items: (json['items'] as List<Object?>)
            .map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final String kind;

  final String? resultId;

  final List<Diagnostic> items;

  FullDocumentDiagnosticReport copyWith({
    String? kind,
    String? resultId,
    List<Diagnostic>? items,
  }) => FullDocumentDiagnosticReport(
    kind: kind ?? this.kind,
    resultId: resultId ?? this.resultId,
    items: items ?? this.items,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind,
      'resultId': resultId,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

/// A diagnostic report indicating that the last returned
/// report is still accurate.
///
/// @since 3.17.0
final class UnchangedDocumentDiagnosticReport {
  const UnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
  });

  factory UnchangedDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) => UnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
  );

  final String kind;

  final String resultId;

  UnchangedDocumentDiagnosticReport copyWith({
    String? kind,
    String? resultId,
  }) => UnchangedDocumentDiagnosticReport(
    kind: kind ?? this.kind,
    resultId: resultId ?? this.resultId,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'resultId': resultId};
  }
}

/// Diagnostic options.
///
/// @since 3.17.0
final class DiagnosticOptions {
  const DiagnosticOptions({
    this.workDoneProgress,
    this.identifier,
    required this.interFileDependencies,
    required this.workspaceDiagnostics,
  });

  factory DiagnosticOptions.fromJson(Map<String, Object?> json) =>
      DiagnosticOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        identifier: json['identifier'] as String?,
        interFileDependencies: json['interFileDependencies'] as bool,
        workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
      );

  final bool? workDoneProgress;

  final String? identifier;

  final bool interFileDependencies;

  final bool workspaceDiagnostics;

  DiagnosticOptions copyWith({
    bool? workDoneProgress,
    String? identifier,
    bool? interFileDependencies,
    bool? workspaceDiagnostics,
  }) => DiagnosticOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    identifier: identifier ?? this.identifier,
    interFileDependencies: interFileDependencies ?? this.interFileDependencies,
    workspaceDiagnostics: workspaceDiagnostics ?? this.workspaceDiagnostics,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'identifier': identifier,
      'interFileDependencies': interFileDependencies,
      'workspaceDiagnostics': workspaceDiagnostics,
    };
  }
}

/// A previous result id in a workspace pull request.
///
/// @since 3.17.0
final class PreviousResultId {
  const PreviousResultId({required this.uri, required this.value});

  factory PreviousResultId.fromJson(Map<String, Object?> json) =>
      PreviousResultId(
        uri: json['uri'] as String,
        value: json['value'] as String,
      );

  final String uri;

  final String value;

  PreviousResultId copyWith({String? uri, String? value}) =>
      PreviousResultId(uri: uri ?? this.uri, value: value ?? this.value);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'value': value};
  }
}

/// A notebook document.
///
/// @since 3.17.0
final class NotebookDocument {
  const NotebookDocument({
    required this.uri,
    required this.notebookType,
    required this.version,
    this.metadata,
    required this.cells,
  });

  factory NotebookDocument.fromJson(Map<String, Object?> json) =>
      NotebookDocument(
        uri: json['uri'] as String,
        notebookType: json['notebookType'] as String,
        version: json['version'] as int,
        metadata: json['metadata'] as LSPObject?,
        cells: (json['cells'] as List<Object?>)
            .map((e) => NotebookCell.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final String uri;

  final String notebookType;

  final int version;

  final LSPObject? metadata;

  final List<NotebookCell> cells;

  NotebookDocument copyWith({
    String? uri,
    String? notebookType,
    int? version,
    LSPObject? metadata,
    List<NotebookCell>? cells,
  }) => NotebookDocument(
    uri: uri ?? this.uri,
    notebookType: notebookType ?? this.notebookType,
    version: version ?? this.version,
    metadata: metadata ?? this.metadata,
    cells: cells ?? this.cells,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'uri': uri,
      'notebookType': notebookType,
      'version': version,
      'metadata': metadata,
      'cells': cells.map((e) => e.toJson()).toList(),
    };
  }
}

/// An item to transfer a text document from the client to the
/// server.
final class TextDocumentItem {
  const TextDocumentItem({
    required this.uri,
    required this.languageId,
    required this.version,
    required this.text,
  });

  factory TextDocumentItem.fromJson(Map<String, Object?> json) =>
      TextDocumentItem(
        uri: json['uri'] as String,
        languageId: json['languageId'] as String,
        version: json['version'] as int,
        text: json['text'] as String,
      );

  final String uri;

  final String languageId;

  final int version;

  final String text;

  TextDocumentItem copyWith({
    String? uri,
    String? languageId,
    int? version,
    String? text,
  }) => TextDocumentItem(
    uri: uri ?? this.uri,
    languageId: languageId ?? this.languageId,
    version: version ?? this.version,
    text: text ?? this.text,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'uri': uri,
      'languageId': languageId,
      'version': version,
      'text': text,
    };
  }
}

/// A versioned notebook document identifier.
///
/// @since 3.17.0
final class VersionedNotebookDocumentIdentifier {
  const VersionedNotebookDocumentIdentifier({
    required this.version,
    required this.uri,
  });

  factory VersionedNotebookDocumentIdentifier.fromJson(
    Map<String, Object?> json,
  ) => VersionedNotebookDocumentIdentifier(
    version: json['version'] as int,
    uri: json['uri'] as String,
  );

  final int version;

  final String uri;

  VersionedNotebookDocumentIdentifier copyWith({int? version, String? uri}) =>
      VersionedNotebookDocumentIdentifier(
        version: version ?? this.version,
        uri: uri ?? this.uri,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'version': version, 'uri': uri};
  }
}

/// A change event for a notebook document.
///
/// @since 3.17.0
final class NotebookDocumentChangeEvent {
  const NotebookDocumentChangeEvent({this.metadata, this.cells});

  factory NotebookDocumentChangeEvent.fromJson(Map<String, Object?> json) =>
      NotebookDocumentChangeEvent(
        metadata: json['metadata'] as LSPObject?,
        cells: json['cells'] == null
            ? null
            : NotebookDocumentChangeEventCells.fromJson(
                json['cells'] as Map<String, Object?>,
              ),
      );

  final LSPObject? metadata;

  final NotebookDocumentChangeEventCells? cells;

  NotebookDocumentChangeEvent copyWith({
    LSPObject? metadata,
    NotebookDocumentChangeEventCells? cells,
  }) => NotebookDocumentChangeEvent(
    metadata: metadata ?? this.metadata,
    cells: cells ?? this.cells,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'metadata': metadata, 'cells': cells?.toJson()};
  }
}

/// A literal to identify a notebook document in the client.
///
/// @since 3.17.0
final class NotebookDocumentIdentifier {
  const NotebookDocumentIdentifier({required this.uri});

  factory NotebookDocumentIdentifier.fromJson(Map<String, Object?> json) =>
      NotebookDocumentIdentifier(uri: json['uri'] as String);

  final String uri;

  NotebookDocumentIdentifier copyWith({String? uri}) =>
      NotebookDocumentIdentifier(uri: uri ?? this.uri);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

/// Provides information about the context in which an inline completion was requested.
///
/// @since 3.18.0
/// @proposed
final class InlineCompletionContext {
  const InlineCompletionContext({
    required this.triggerKind,
    this.selectedCompletionInfo,
  });

  factory InlineCompletionContext.fromJson(Map<String, Object?> json) =>
      InlineCompletionContext(
        triggerKind: InlineCompletionTriggerKind.values.firstWhere(
          (e) => e.value == json['triggerKind'] as int,
        ),
        selectedCompletionInfo: json['selectedCompletionInfo'] == null
            ? null
            : SelectedCompletionInfo.fromJson(
                json['selectedCompletionInfo'] as Map<String, Object?>,
              ),
      );

  final InlineCompletionTriggerKind triggerKind;

  final SelectedCompletionInfo? selectedCompletionInfo;

  InlineCompletionContext copyWith({
    InlineCompletionTriggerKind? triggerKind,
    SelectedCompletionInfo? selectedCompletionInfo,
  }) => InlineCompletionContext(
    triggerKind: triggerKind ?? this.triggerKind,
    selectedCompletionInfo:
        selectedCompletionInfo ?? this.selectedCompletionInfo,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'triggerKind': triggerKind.value,
      'selectedCompletionInfo': selectedCompletionInfo?.toJson(),
    };
  }
}

/// A string value used as a snippet is a template which allows to insert text
/// and to control the editor cursor when insertion happens.
///
/// A snippet can define tab stops and placeholders with `$1`, `$2`
/// and `${3:foo}`. `$0` defines the final tab stop, it defaults to
/// the end of the snippet. Variables are defined with `$name` and
/// `${name:default value}`.
///
/// @since 3.18.0
/// @proposed
final class StringValue {
  const StringValue({required this.kind, required this.value});

  factory StringValue.fromJson(Map<String, Object?> json) =>
      StringValue(kind: json['kind'] as String, value: json['value'] as String);

  final String kind;

  final String value;

  StringValue copyWith({String? kind, String? value}) =>
      StringValue(kind: kind ?? this.kind, value: value ?? this.value);

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'value': value};
  }
}

/// Inline completion options used during static registration.
///
/// @since 3.18.0
/// @proposed
final class InlineCompletionOptions {
  const InlineCompletionOptions({this.workDoneProgress});

  factory InlineCompletionOptions.fromJson(Map<String, Object?> json) =>
      InlineCompletionOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  InlineCompletionOptions copyWith({bool? workDoneProgress}) =>
      InlineCompletionOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// General parameters to register for a notification or to register a provider.
final class Registration {
  const Registration({
    required this.id,
    required this.method,
    this.registerOptions,
  });

  factory Registration.fromJson(Map<String, Object?> json) => Registration(
    id: json['id'] as String,
    method: json['method'] as String,
    registerOptions: json['registerOptions'] as LSPAny?,
  );

  final String id;

  final String method;

  final LSPAny? registerOptions;

  Registration copyWith({
    String? id,
    String? method,
    LSPAny? registerOptions,
  }) => Registration(
    id: id ?? this.id,
    method: method ?? this.method,
    registerOptions: registerOptions ?? this.registerOptions,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'method': method,
      'registerOptions': registerOptions,
    };
  }
}

/// General parameters to unregister a request or notification.
final class Unregistration {
  const Unregistration({required this.id, required this.method});

  factory Unregistration.fromJson(Map<String, Object?> json) => Unregistration(
    id: json['id'] as String,
    method: json['method'] as String,
  );

  final String id;

  final String method;

  Unregistration copyWith({String? id, String? method}) =>
      Unregistration(id: id ?? this.id, method: method ?? this.method);

  Map<String, Object?> toJson() {
    return <String, Object?>{'id': id, 'method': method};
  }
}

final class WorkspaceFoldersInitializeParams {
  const WorkspaceFoldersInitializeParams({this.workspaceFolders});

  factory WorkspaceFoldersInitializeParams.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceFoldersInitializeParams(
    workspaceFolders: (json['workspaceFolders'] as List<Object?>?)
        ?.map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  final List<WorkspaceFolder>? workspaceFolders;

  WorkspaceFoldersInitializeParams copyWith({
    List<WorkspaceFolder>? workspaceFolders,
  }) => WorkspaceFoldersInitializeParams(
    workspaceFolders: workspaceFolders ?? this.workspaceFolders,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workspaceFolders': workspaceFolders?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Defines the capabilities provided by a language
/// server.
final class ServerCapabilities {
  const ServerCapabilities({
    this.positionEncoding,
    this.textDocumentSync,
    this.notebookDocumentSync,
    this.completionProvider,
    this.hoverProvider,
    this.signatureHelpProvider,
    this.declarationProvider,
    this.definitionProvider,
    this.typeDefinitionProvider,
    this.implementationProvider,
    this.referencesProvider,
    this.documentHighlightProvider,
    this.documentSymbolProvider,
    this.codeActionProvider,
    this.codeLensProvider,
    this.documentLinkProvider,
    this.colorProvider,
    this.workspaceSymbolProvider,
    this.documentFormattingProvider,
    this.documentRangeFormattingProvider,
    this.documentOnTypeFormattingProvider,
    this.renameProvider,
    this.foldingRangeProvider,
    this.selectionRangeProvider,
    this.executeCommandProvider,
    this.callHierarchyProvider,
    this.linkedEditingRangeProvider,
    this.semanticTokensProvider,
    this.monikerProvider,
    this.typeHierarchyProvider,
    this.inlineValueProvider,
    this.inlayHintProvider,
    this.diagnosticProvider,
    this.inlineCompletionProvider,
    this.workspace,
    this.experimental,
  });

  factory ServerCapabilities.fromJson(
    Map<String, Object?> json,
  ) => ServerCapabilities(
    positionEncoding: json['positionEncoding'] == null
        ? null
        : PositionEncodingKind(json['positionEncoding'] as String),
    textDocumentSync: json['textDocumentSync'] as Object?,
    notebookDocumentSync: json['notebookDocumentSync'] as Object?,
    completionProvider: json['completionProvider'] == null
        ? null
        : CompletionOptions.fromJson(
            json['completionProvider'] as Map<String, Object?>,
          ),
    hoverProvider: json['hoverProvider'] as Object?,
    signatureHelpProvider: json['signatureHelpProvider'] == null
        ? null
        : SignatureHelpOptions.fromJson(
            json['signatureHelpProvider'] as Map<String, Object?>,
          ),
    declarationProvider: json['declarationProvider'] as Object?,
    definitionProvider: json['definitionProvider'] as Object?,
    typeDefinitionProvider: json['typeDefinitionProvider'] as Object?,
    implementationProvider: json['implementationProvider'] as Object?,
    referencesProvider: json['referencesProvider'] as Object?,
    documentHighlightProvider: json['documentHighlightProvider'] as Object?,
    documentSymbolProvider: json['documentSymbolProvider'] as Object?,
    codeActionProvider: json['codeActionProvider'] as Object?,
    codeLensProvider: json['codeLensProvider'] == null
        ? null
        : CodeLensOptions.fromJson(
            json['codeLensProvider'] as Map<String, Object?>,
          ),
    documentLinkProvider: json['documentLinkProvider'] == null
        ? null
        : DocumentLinkOptions.fromJson(
            json['documentLinkProvider'] as Map<String, Object?>,
          ),
    colorProvider: json['colorProvider'] as Object?,
    workspaceSymbolProvider: json['workspaceSymbolProvider'] as Object?,
    documentFormattingProvider: json['documentFormattingProvider'] as Object?,
    documentRangeFormattingProvider:
        json['documentRangeFormattingProvider'] as Object?,
    documentOnTypeFormattingProvider:
        json['documentOnTypeFormattingProvider'] == null
        ? null
        : DocumentOnTypeFormattingOptions.fromJson(
            json['documentOnTypeFormattingProvider'] as Map<String, Object?>,
          ),
    renameProvider: json['renameProvider'] as Object?,
    foldingRangeProvider: json['foldingRangeProvider'] as Object?,
    selectionRangeProvider: json['selectionRangeProvider'] as Object?,
    executeCommandProvider: json['executeCommandProvider'] == null
        ? null
        : ExecuteCommandOptions.fromJson(
            json['executeCommandProvider'] as Map<String, Object?>,
          ),
    callHierarchyProvider: json['callHierarchyProvider'] as Object?,
    linkedEditingRangeProvider: json['linkedEditingRangeProvider'] as Object?,
    semanticTokensProvider: json['semanticTokensProvider'] as Object?,
    monikerProvider: json['monikerProvider'] as Object?,
    typeHierarchyProvider: json['typeHierarchyProvider'] as Object?,
    inlineValueProvider: json['inlineValueProvider'] as Object?,
    inlayHintProvider: json['inlayHintProvider'] as Object?,
    diagnosticProvider: json['diagnosticProvider'] as Object?,
    inlineCompletionProvider: json['inlineCompletionProvider'] as Object?,
    workspace: json['workspace'] == null
        ? null
        : ServerCapabilitiesWorkspace.fromJson(
            json['workspace'] as Map<String, Object?>,
          ),
    experimental: json['experimental'] as LSPAny?,
  );

  final PositionEncodingKind? positionEncoding;

  final Object? textDocumentSync;

  final Object? notebookDocumentSync;

  final CompletionOptions? completionProvider;

  final Object? hoverProvider;

  final SignatureHelpOptions? signatureHelpProvider;

  final Object? declarationProvider;

  final Object? definitionProvider;

  final Object? typeDefinitionProvider;

  final Object? implementationProvider;

  final Object? referencesProvider;

  final Object? documentHighlightProvider;

  final Object? documentSymbolProvider;

  final Object? codeActionProvider;

  final CodeLensOptions? codeLensProvider;

  final DocumentLinkOptions? documentLinkProvider;

  final Object? colorProvider;

  final Object? workspaceSymbolProvider;

  final Object? documentFormattingProvider;

  final Object? documentRangeFormattingProvider;

  final DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider;

  final Object? renameProvider;

  final Object? foldingRangeProvider;

  final Object? selectionRangeProvider;

  final ExecuteCommandOptions? executeCommandProvider;

  final Object? callHierarchyProvider;

  final Object? linkedEditingRangeProvider;

  final Object? semanticTokensProvider;

  final Object? monikerProvider;

  final Object? typeHierarchyProvider;

  final Object? inlineValueProvider;

  final Object? inlayHintProvider;

  final Object? diagnosticProvider;

  final Object? inlineCompletionProvider;

  final ServerCapabilitiesWorkspace? workspace;

  final LSPAny? experimental;

  ServerCapabilities copyWith({
    PositionEncodingKind? positionEncoding,
    Object? textDocumentSync,
    Object? notebookDocumentSync,
    CompletionOptions? completionProvider,
    Object? hoverProvider,
    SignatureHelpOptions? signatureHelpProvider,
    Object? declarationProvider,
    Object? definitionProvider,
    Object? typeDefinitionProvider,
    Object? implementationProvider,
    Object? referencesProvider,
    Object? documentHighlightProvider,
    Object? documentSymbolProvider,
    Object? codeActionProvider,
    CodeLensOptions? codeLensProvider,
    DocumentLinkOptions? documentLinkProvider,
    Object? colorProvider,
    Object? workspaceSymbolProvider,
    Object? documentFormattingProvider,
    Object? documentRangeFormattingProvider,
    DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider,
    Object? renameProvider,
    Object? foldingRangeProvider,
    Object? selectionRangeProvider,
    ExecuteCommandOptions? executeCommandProvider,
    Object? callHierarchyProvider,
    Object? linkedEditingRangeProvider,
    Object? semanticTokensProvider,
    Object? monikerProvider,
    Object? typeHierarchyProvider,
    Object? inlineValueProvider,
    Object? inlayHintProvider,
    Object? diagnosticProvider,
    Object? inlineCompletionProvider,
    ServerCapabilitiesWorkspace? workspace,
    LSPAny? experimental,
  }) => ServerCapabilities(
    positionEncoding: positionEncoding ?? this.positionEncoding,
    textDocumentSync: textDocumentSync ?? this.textDocumentSync,
    notebookDocumentSync: notebookDocumentSync ?? this.notebookDocumentSync,
    completionProvider: completionProvider ?? this.completionProvider,
    hoverProvider: hoverProvider ?? this.hoverProvider,
    signatureHelpProvider: signatureHelpProvider ?? this.signatureHelpProvider,
    declarationProvider: declarationProvider ?? this.declarationProvider,
    definitionProvider: definitionProvider ?? this.definitionProvider,
    typeDefinitionProvider:
        typeDefinitionProvider ?? this.typeDefinitionProvider,
    implementationProvider:
        implementationProvider ?? this.implementationProvider,
    referencesProvider: referencesProvider ?? this.referencesProvider,
    documentHighlightProvider:
        documentHighlightProvider ?? this.documentHighlightProvider,
    documentSymbolProvider:
        documentSymbolProvider ?? this.documentSymbolProvider,
    codeActionProvider: codeActionProvider ?? this.codeActionProvider,
    codeLensProvider: codeLensProvider ?? this.codeLensProvider,
    documentLinkProvider: documentLinkProvider ?? this.documentLinkProvider,
    colorProvider: colorProvider ?? this.colorProvider,
    workspaceSymbolProvider:
        workspaceSymbolProvider ?? this.workspaceSymbolProvider,
    documentFormattingProvider:
        documentFormattingProvider ?? this.documentFormattingProvider,
    documentRangeFormattingProvider:
        documentRangeFormattingProvider ?? this.documentRangeFormattingProvider,
    documentOnTypeFormattingProvider:
        documentOnTypeFormattingProvider ??
        this.documentOnTypeFormattingProvider,
    renameProvider: renameProvider ?? this.renameProvider,
    foldingRangeProvider: foldingRangeProvider ?? this.foldingRangeProvider,
    selectionRangeProvider:
        selectionRangeProvider ?? this.selectionRangeProvider,
    executeCommandProvider:
        executeCommandProvider ?? this.executeCommandProvider,
    callHierarchyProvider: callHierarchyProvider ?? this.callHierarchyProvider,
    linkedEditingRangeProvider:
        linkedEditingRangeProvider ?? this.linkedEditingRangeProvider,
    semanticTokensProvider:
        semanticTokensProvider ?? this.semanticTokensProvider,
    monikerProvider: monikerProvider ?? this.monikerProvider,
    typeHierarchyProvider: typeHierarchyProvider ?? this.typeHierarchyProvider,
    inlineValueProvider: inlineValueProvider ?? this.inlineValueProvider,
    inlayHintProvider: inlayHintProvider ?? this.inlayHintProvider,
    diagnosticProvider: diagnosticProvider ?? this.diagnosticProvider,
    inlineCompletionProvider:
        inlineCompletionProvider ?? this.inlineCompletionProvider,
    workspace: workspace ?? this.workspace,
    experimental: experimental ?? this.experimental,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'positionEncoding': positionEncoding?.value,
      'textDocumentSync': textDocumentSync,
      'notebookDocumentSync': notebookDocumentSync,
      'completionProvider': completionProvider?.toJson(),
      'hoverProvider': hoverProvider,
      'signatureHelpProvider': signatureHelpProvider?.toJson(),
      'declarationProvider': declarationProvider,
      'definitionProvider': definitionProvider,
      'typeDefinitionProvider': typeDefinitionProvider,
      'implementationProvider': implementationProvider,
      'referencesProvider': referencesProvider,
      'documentHighlightProvider': documentHighlightProvider,
      'documentSymbolProvider': documentSymbolProvider,
      'codeActionProvider': codeActionProvider,
      'codeLensProvider': codeLensProvider?.toJson(),
      'documentLinkProvider': documentLinkProvider?.toJson(),
      'colorProvider': colorProvider,
      'workspaceSymbolProvider': workspaceSymbolProvider,
      'documentFormattingProvider': documentFormattingProvider,
      'documentRangeFormattingProvider': documentRangeFormattingProvider,
      'documentOnTypeFormattingProvider': documentOnTypeFormattingProvider
          ?.toJson(),
      'renameProvider': renameProvider,
      'foldingRangeProvider': foldingRangeProvider,
      'selectionRangeProvider': selectionRangeProvider,
      'executeCommandProvider': executeCommandProvider?.toJson(),
      'callHierarchyProvider': callHierarchyProvider,
      'linkedEditingRangeProvider': linkedEditingRangeProvider,
      'semanticTokensProvider': semanticTokensProvider,
      'monikerProvider': monikerProvider,
      'typeHierarchyProvider': typeHierarchyProvider,
      'inlineValueProvider': inlineValueProvider,
      'inlayHintProvider': inlayHintProvider,
      'diagnosticProvider': diagnosticProvider,
      'inlineCompletionProvider': inlineCompletionProvider,
      'workspace': workspace?.toJson(),
      'experimental': experimental,
    };
  }
}

/// A text document identifier to denote a specific version of a text document.
final class VersionedTextDocumentIdentifier {
  const VersionedTextDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  factory VersionedTextDocumentIdentifier.fromJson(Map<String, Object?> json) =>
      VersionedTextDocumentIdentifier(
        uri: json['uri'] as String,
        version: json['version'] as int,
      );

  final String uri;

  final int version;

  VersionedTextDocumentIdentifier copyWith({String? uri, int? version}) =>
      VersionedTextDocumentIdentifier(
        uri: uri ?? this.uri,
        version: version ?? this.version,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'version': version};
  }
}

/// Save options.
final class SaveOptions {
  const SaveOptions({this.includeText});

  factory SaveOptions.fromJson(Map<String, Object?> json) =>
      SaveOptions(includeText: json['includeText'] as bool?);

  final bool? includeText;

  SaveOptions copyWith({bool? includeText}) =>
      SaveOptions(includeText: includeText ?? this.includeText);

  Map<String, Object?> toJson() {
    return <String, Object?>{'includeText': includeText};
  }
}

/// An event describing a file change.
final class FileEvent {
  const FileEvent({required this.uri, required this.type});

  factory FileEvent.fromJson(Map<String, Object?> json) => FileEvent(
    uri: json['uri'] as String,
    type: FileChangeType.values.firstWhere(
      (e) => e.value == json['type'] as int,
    ),
  );

  final String uri;

  final FileChangeType type;

  FileEvent copyWith({String? uri, FileChangeType? type}) =>
      FileEvent(uri: uri ?? this.uri, type: type ?? this.type);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'type': type.value};
  }
}

final class FileSystemWatcher {
  const FileSystemWatcher({required this.globPattern, this.kind});

  factory FileSystemWatcher.fromJson(Map<String, Object?> json) =>
      FileSystemWatcher(
        globPattern: json['globPattern'] as GlobPattern,
        kind: json['kind'] == null ? null : WatchKind(json['kind'] as int),
      );

  final GlobPattern globPattern;

  final WatchKind? kind;

  FileSystemWatcher copyWith({GlobPattern? globPattern, WatchKind? kind}) =>
      FileSystemWatcher(
        globPattern: globPattern ?? this.globPattern,
        kind: kind ?? this.kind,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'globPattern': globPattern, 'kind': kind?.value};
  }
}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic objects
/// are only valid in the scope of a resource.
final class Diagnostic {
  const Diagnostic({
    required this.range,
    this.severity,
    this.code,
    this.codeDescription,
    this.source,
    required this.message,
    this.tags,
    this.relatedInformation,
    this.data,
  });

  factory Diagnostic.fromJson(Map<String, Object?> json) => Diagnostic(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    severity: json['severity'] == null
        ? null
        : DiagnosticSeverity.values.firstWhere(
            (e) => e.value == json['severity'] as int,
          ),
    code: json['code'] as Object?,
    codeDescription: json['codeDescription'] == null
        ? null
        : CodeDescription.fromJson(
            json['codeDescription'] as Map<String, Object?>,
          ),
    source: json['source'] as String?,
    message: json['message'] as String,
    tags: (json['tags'] as List<Object?>?)
        ?.map((e) => e as DiagnosticTag)
        .toList(),
    relatedInformation: (json['relatedInformation'] as List<Object?>?)
        ?.map(
          (e) =>
              DiagnosticRelatedInformation.fromJson(e as Map<String, Object?>),
        )
        .toList(),
    data: json['data'] as LSPAny?,
  );

  final Range range;

  final DiagnosticSeverity? severity;

  final Object? code;

  final CodeDescription? codeDescription;

  final String? source;

  final String message;

  final List<DiagnosticTag>? tags;

  final List<DiagnosticRelatedInformation>? relatedInformation;

  final LSPAny? data;

  Diagnostic copyWith({
    Range? range,
    DiagnosticSeverity? severity,
    Object? code,
    CodeDescription? codeDescription,
    String? source,
    String? message,
    List<DiagnosticTag>? tags,
    List<DiagnosticRelatedInformation>? relatedInformation,
    LSPAny? data,
  }) => Diagnostic(
    range: range ?? this.range,
    severity: severity ?? this.severity,
    code: code ?? this.code,
    codeDescription: codeDescription ?? this.codeDescription,
    source: source ?? this.source,
    message: message ?? this.message,
    tags: tags ?? this.tags,
    relatedInformation: relatedInformation ?? this.relatedInformation,
    data: data ?? this.data,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'severity': severity?.value,
      'code': code,
      'codeDescription': codeDescription?.toJson(),
      'source': source,
      'message': message,
      'tags': tags,
      'relatedInformation': relatedInformation?.map((e) => e.toJson()).toList(),
      'data': data,
    };
  }
}

/// Contains additional information about the context in which a completion request is triggered.
final class CompletionContext {
  const CompletionContext({required this.triggerKind, this.triggerCharacter});

  factory CompletionContext.fromJson(Map<String, Object?> json) =>
      CompletionContext(
        triggerKind: CompletionTriggerKind.values.firstWhere(
          (e) => e.value == json['triggerKind'] as int,
        ),
        triggerCharacter: json['triggerCharacter'] as String?,
      );

  final CompletionTriggerKind triggerKind;

  final String? triggerCharacter;

  CompletionContext copyWith({
    CompletionTriggerKind? triggerKind,
    String? triggerCharacter,
  }) => CompletionContext(
    triggerKind: triggerKind ?? this.triggerKind,
    triggerCharacter: triggerCharacter ?? this.triggerCharacter,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'triggerKind': triggerKind.value,
      'triggerCharacter': triggerCharacter,
    };
  }
}

/// Additional details for a completion item label.
///
/// @since 3.17.0
final class CompletionItemLabelDetails {
  const CompletionItemLabelDetails({this.detail, this.description});

  factory CompletionItemLabelDetails.fromJson(Map<String, Object?> json) =>
      CompletionItemLabelDetails(
        detail: json['detail'] as String?,
        description: json['description'] as String?,
      );

  final String? detail;

  final String? description;

  CompletionItemLabelDetails copyWith({String? detail, String? description}) =>
      CompletionItemLabelDetails(
        detail: detail ?? this.detail,
        description: description ?? this.description,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'detail': detail, 'description': description};
  }
}

/// A special text edit to provide an insert and a replace operation.
///
/// @since 3.16.0
final class InsertReplaceEdit {
  const InsertReplaceEdit({
    required this.newText,
    required this.insert,
    required this.replace,
  });

  factory InsertReplaceEdit.fromJson(Map<String, Object?> json) =>
      InsertReplaceEdit(
        newText: json['newText'] as String,
        insert: Range.fromJson(json['insert'] as Map<String, Object?>),
        replace: Range.fromJson(json['replace'] as Map<String, Object?>),
      );

  final String newText;

  final Range insert;

  final Range replace;

  InsertReplaceEdit copyWith({
    String? newText,
    Range? insert,
    Range? replace,
  }) => InsertReplaceEdit(
    newText: newText ?? this.newText,
    insert: insert ?? this.insert,
    replace: replace ?? this.replace,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'newText': newText,
      'insert': insert.toJson(),
      'replace': replace.toJson(),
    };
  }
}

/// Completion options.
final class CompletionOptions {
  const CompletionOptions({
    this.workDoneProgress,
    this.triggerCharacters,
    this.allCommitCharacters,
    this.resolveProvider,
    this.completionItem,
  });

  factory CompletionOptions.fromJson(Map<String, Object?> json) =>
      CompletionOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        triggerCharacters: (json['triggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        allCommitCharacters: (json['allCommitCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        resolveProvider: json['resolveProvider'] as bool?,
        completionItem: json['completionItem'] == null
            ? null
            : CompletionOptionsCompletionItem.fromJson(
                json['completionItem'] as Map<String, Object?>,
              ),
      );

  final bool? workDoneProgress;

  final List<String>? triggerCharacters;

  final List<String>? allCommitCharacters;

  final bool? resolveProvider;

  final CompletionOptionsCompletionItem? completionItem;

  CompletionOptions copyWith({
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? allCommitCharacters,
    bool? resolveProvider,
    CompletionOptionsCompletionItem? completionItem,
  }) => CompletionOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    triggerCharacters: triggerCharacters ?? this.triggerCharacters,
    allCommitCharacters: allCommitCharacters ?? this.allCommitCharacters,
    resolveProvider: resolveProvider ?? this.resolveProvider,
    completionItem: completionItem ?? this.completionItem,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'triggerCharacters': triggerCharacters,
      'allCommitCharacters': allCommitCharacters,
      'resolveProvider': resolveProvider,
      'completionItem': completionItem?.toJson(),
    };
  }
}

/// Hover options.
final class HoverOptions {
  const HoverOptions({this.workDoneProgress});

  factory HoverOptions.fromJson(Map<String, Object?> json) =>
      HoverOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  HoverOptions copyWith({bool? workDoneProgress}) =>
      HoverOptions(workDoneProgress: workDoneProgress ?? this.workDoneProgress);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Additional information about the context in which a signature help request was triggered.
///
/// @since 3.15.0
final class SignatureHelpContext {
  const SignatureHelpContext({
    required this.triggerKind,
    this.triggerCharacter,
    required this.isRetrigger,
    this.activeSignatureHelp,
  });

  factory SignatureHelpContext.fromJson(Map<String, Object?> json) =>
      SignatureHelpContext(
        triggerKind: SignatureHelpTriggerKind.values.firstWhere(
          (e) => e.value == json['triggerKind'] as int,
        ),
        triggerCharacter: json['triggerCharacter'] as String?,
        isRetrigger: json['isRetrigger'] as bool,
        activeSignatureHelp: json['activeSignatureHelp'] == null
            ? null
            : SignatureHelp.fromJson(
                json['activeSignatureHelp'] as Map<String, Object?>,
              ),
      );

  final SignatureHelpTriggerKind triggerKind;

  final String? triggerCharacter;

  final bool isRetrigger;

  final SignatureHelp? activeSignatureHelp;

  SignatureHelpContext copyWith({
    SignatureHelpTriggerKind? triggerKind,
    String? triggerCharacter,
    bool? isRetrigger,
    SignatureHelp? activeSignatureHelp,
  }) => SignatureHelpContext(
    triggerKind: triggerKind ?? this.triggerKind,
    triggerCharacter: triggerCharacter ?? this.triggerCharacter,
    isRetrigger: isRetrigger ?? this.isRetrigger,
    activeSignatureHelp: activeSignatureHelp ?? this.activeSignatureHelp,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'triggerKind': triggerKind.value,
      'triggerCharacter': triggerCharacter,
      'isRetrigger': isRetrigger,
      'activeSignatureHelp': activeSignatureHelp?.toJson(),
    };
  }
}

/// Represents the signature of something callable. A signature
/// can have a label, like a function-name, a doc-comment, and
/// a set of parameters.
final class SignatureInformation {
  const SignatureInformation({
    required this.label,
    this.documentation,
    this.parameters,
    this.activeParameter,
  });

  factory SignatureInformation.fromJson(Map<String, Object?> json) =>
      SignatureInformation(
        label: json['label'] as String,
        documentation: json['documentation'] as Object?,
        parameters: (json['parameters'] as List<Object?>?)
            ?.map(
              (e) => ParameterInformation.fromJson(e as Map<String, Object?>),
            )
            .toList(),
        activeParameter: json['activeParameter'] as int?,
      );

  final String label;

  final Object? documentation;

  final List<ParameterInformation>? parameters;

  final int? activeParameter;

  SignatureInformation copyWith({
    String? label,
    Object? documentation,
    List<ParameterInformation>? parameters,
    int? activeParameter,
  }) => SignatureInformation(
    label: label ?? this.label,
    documentation: documentation ?? this.documentation,
    parameters: parameters ?? this.parameters,
    activeParameter: activeParameter ?? this.activeParameter,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'label': label,
      'documentation': documentation,
      'parameters': parameters?.map((e) => e.toJson()).toList(),
      'activeParameter': activeParameter,
    };
  }
}

/// Server Capabilities for a {@link SignatureHelpRequest}.
final class SignatureHelpOptions {
  const SignatureHelpOptions({
    this.workDoneProgress,
    this.triggerCharacters,
    this.retriggerCharacters,
  });

  factory SignatureHelpOptions.fromJson(Map<String, Object?> json) =>
      SignatureHelpOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        triggerCharacters: (json['triggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        retriggerCharacters: (json['retriggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
      );

  final bool? workDoneProgress;

  final List<String>? triggerCharacters;

  final List<String>? retriggerCharacters;

  SignatureHelpOptions copyWith({
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? retriggerCharacters,
  }) => SignatureHelpOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    triggerCharacters: triggerCharacters ?? this.triggerCharacters,
    retriggerCharacters: retriggerCharacters ?? this.retriggerCharacters,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'triggerCharacters': triggerCharacters,
      'retriggerCharacters': retriggerCharacters,
    };
  }
}

/// Server Capabilities for a {@link DefinitionRequest}.
final class DefinitionOptions {
  const DefinitionOptions({this.workDoneProgress});

  factory DefinitionOptions.fromJson(Map<String, Object?> json) =>
      DefinitionOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  DefinitionOptions copyWith({bool? workDoneProgress}) => DefinitionOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Value-object that contains additional information when
/// requesting references.
final class ReferenceContext {
  const ReferenceContext({required this.includeDeclaration});

  factory ReferenceContext.fromJson(Map<String, Object?> json) =>
      ReferenceContext(includeDeclaration: json['includeDeclaration'] as bool);

  final bool includeDeclaration;

  ReferenceContext copyWith({bool? includeDeclaration}) => ReferenceContext(
    includeDeclaration: includeDeclaration ?? this.includeDeclaration,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'includeDeclaration': includeDeclaration};
  }
}

/// Reference options.
final class ReferenceOptions {
  const ReferenceOptions({this.workDoneProgress});

  factory ReferenceOptions.fromJson(Map<String, Object?> json) =>
      ReferenceOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  final bool? workDoneProgress;

  ReferenceOptions copyWith({bool? workDoneProgress}) => ReferenceOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Provider options for a {@link DocumentHighlightRequest}.
final class DocumentHighlightOptions {
  const DocumentHighlightOptions({this.workDoneProgress});

  factory DocumentHighlightOptions.fromJson(Map<String, Object?> json) =>
      DocumentHighlightOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  DocumentHighlightOptions copyWith({bool? workDoneProgress}) =>
      DocumentHighlightOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// A base for all symbol information.
final class BaseSymbolInformation {
  const BaseSymbolInformation({
    required this.name,
    required this.kind,
    this.tags,
    this.containerName,
  });

  factory BaseSymbolInformation.fromJson(
    Map<String, Object?> json,
  ) => BaseSymbolInformation(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    containerName: json['containerName'] as String?,
  );

  final String name;

  final SymbolKind kind;

  final List<SymbolTag>? tags;

  final String? containerName;

  BaseSymbolInformation copyWith({
    String? name,
    SymbolKind? kind,
    List<SymbolTag>? tags,
    String? containerName,
  }) => BaseSymbolInformation(
    name: name ?? this.name,
    kind: kind ?? this.kind,
    tags: tags ?? this.tags,
    containerName: containerName ?? this.containerName,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'kind': kind.value,
      'tags': tags,
      'containerName': containerName,
    };
  }
}

/// Provider options for a {@link DocumentSymbolRequest}.
final class DocumentSymbolOptions {
  const DocumentSymbolOptions({this.workDoneProgress, this.label});

  factory DocumentSymbolOptions.fromJson(Map<String, Object?> json) =>
      DocumentSymbolOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        label: json['label'] as String?,
      );

  final bool? workDoneProgress;

  final String? label;

  DocumentSymbolOptions copyWith({bool? workDoneProgress, String? label}) =>
      DocumentSymbolOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
        label: label ?? this.label,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'label': label,
    };
  }
}

/// Contains additional diagnostic information about the context in which
/// a {@link CodeActionProvider.provideCodeActions code action} is run.
final class CodeActionContext {
  const CodeActionContext({
    required this.diagnostics,
    this.only,
    this.triggerKind,
  });

  factory CodeActionContext.fromJson(Map<String, Object?> json) =>
      CodeActionContext(
        diagnostics: (json['diagnostics'] as List<Object?>)
            .map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
            .toList(),
        only: (json['only'] as List<Object?>?)
            ?.map((e) => e as CodeActionKind)
            .toList(),
        triggerKind: json['triggerKind'] == null
            ? null
            : CodeActionTriggerKind.values.firstWhere(
                (e) => e.value == json['triggerKind'] as int,
              ),
      );

  final List<Diagnostic> diagnostics;

  final List<CodeActionKind>? only;

  final CodeActionTriggerKind? triggerKind;

  CodeActionContext copyWith({
    List<Diagnostic>? diagnostics,
    List<CodeActionKind>? only,
    CodeActionTriggerKind? triggerKind,
  }) => CodeActionContext(
    diagnostics: diagnostics ?? this.diagnostics,
    only: only ?? this.only,
    triggerKind: triggerKind ?? this.triggerKind,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'diagnostics': diagnostics.map((e) => e.toJson()).toList(),
      'only': only,
      'triggerKind': triggerKind?.value,
    };
  }
}

/// Provider options for a {@link CodeActionRequest}.
final class CodeActionOptions {
  const CodeActionOptions({
    this.workDoneProgress,
    this.codeActionKinds,
    this.resolveProvider,
  });

  factory CodeActionOptions.fromJson(Map<String, Object?> json) =>
      CodeActionOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        codeActionKinds: (json['codeActionKinds'] as List<Object?>?)
            ?.map((e) => e as CodeActionKind)
            .toList(),
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final bool? workDoneProgress;

  final List<CodeActionKind>? codeActionKinds;

  final bool? resolveProvider;

  CodeActionOptions copyWith({
    bool? workDoneProgress,
    List<CodeActionKind>? codeActionKinds,
    bool? resolveProvider,
  }) => CodeActionOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    codeActionKinds: codeActionKinds ?? this.codeActionKinds,
    resolveProvider: resolveProvider ?? this.resolveProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'codeActionKinds': codeActionKinds,
      'resolveProvider': resolveProvider,
    };
  }
}

/// Server capabilities for a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolOptions {
  const WorkspaceSymbolOptions({this.workDoneProgress, this.resolveProvider});

  factory WorkspaceSymbolOptions.fromJson(Map<String, Object?> json) =>
      WorkspaceSymbolOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final bool? workDoneProgress;

  final bool? resolveProvider;

  WorkspaceSymbolOptions copyWith({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) => WorkspaceSymbolOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    resolveProvider: resolveProvider ?? this.resolveProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// Code Lens provider options of a {@link CodeLensRequest}.
final class CodeLensOptions {
  const CodeLensOptions({this.workDoneProgress, this.resolveProvider});

  factory CodeLensOptions.fromJson(Map<String, Object?> json) =>
      CodeLensOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final bool? workDoneProgress;

  final bool? resolveProvider;

  CodeLensOptions copyWith({bool? workDoneProgress, bool? resolveProvider}) =>
      CodeLensOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
        resolveProvider: resolveProvider ?? this.resolveProvider,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// Provider options for a {@link DocumentLinkRequest}.
final class DocumentLinkOptions {
  const DocumentLinkOptions({this.workDoneProgress, this.resolveProvider});

  factory DocumentLinkOptions.fromJson(Map<String, Object?> json) =>
      DocumentLinkOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  final bool? workDoneProgress;

  final bool? resolveProvider;

  DocumentLinkOptions copyWith({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) => DocumentLinkOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    resolveProvider: resolveProvider ?? this.resolveProvider,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// Value-object describing what options formatting should use.
final class FormattingOptions {
  const FormattingOptions({
    required this.tabSize,
    required this.insertSpaces,
    this.trimTrailingWhitespace,
    this.insertFinalNewline,
    this.trimFinalNewlines,
  });

  factory FormattingOptions.fromJson(Map<String, Object?> json) =>
      FormattingOptions(
        tabSize: json['tabSize'] as int,
        insertSpaces: json['insertSpaces'] as bool,
        trimTrailingWhitespace: json['trimTrailingWhitespace'] as bool?,
        insertFinalNewline: json['insertFinalNewline'] as bool?,
        trimFinalNewlines: json['trimFinalNewlines'] as bool?,
      );

  final int tabSize;

  final bool insertSpaces;

  final bool? trimTrailingWhitespace;

  final bool? insertFinalNewline;

  final bool? trimFinalNewlines;

  FormattingOptions copyWith({
    int? tabSize,
    bool? insertSpaces,
    bool? trimTrailingWhitespace,
    bool? insertFinalNewline,
    bool? trimFinalNewlines,
  }) => FormattingOptions(
    tabSize: tabSize ?? this.tabSize,
    insertSpaces: insertSpaces ?? this.insertSpaces,
    trimTrailingWhitespace:
        trimTrailingWhitespace ?? this.trimTrailingWhitespace,
    insertFinalNewline: insertFinalNewline ?? this.insertFinalNewline,
    trimFinalNewlines: trimFinalNewlines ?? this.trimFinalNewlines,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'tabSize': tabSize,
      'insertSpaces': insertSpaces,
      'trimTrailingWhitespace': trimTrailingWhitespace,
      'insertFinalNewline': insertFinalNewline,
      'trimFinalNewlines': trimFinalNewlines,
    };
  }
}

/// Provider options for a {@link DocumentFormattingRequest}.
final class DocumentFormattingOptions {
  const DocumentFormattingOptions({this.workDoneProgress});

  factory DocumentFormattingOptions.fromJson(Map<String, Object?> json) =>
      DocumentFormattingOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  final bool? workDoneProgress;

  DocumentFormattingOptions copyWith({bool? workDoneProgress}) =>
      DocumentFormattingOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Provider options for a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingOptions {
  const DocumentRangeFormattingOptions({
    this.workDoneProgress,
    this.rangesSupport,
  });

  factory DocumentRangeFormattingOptions.fromJson(Map<String, Object?> json) =>
      DocumentRangeFormattingOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        rangesSupport: json['rangesSupport'] as bool?,
      );

  final bool? workDoneProgress;

  final bool? rangesSupport;

  DocumentRangeFormattingOptions copyWith({
    bool? workDoneProgress,
    bool? rangesSupport,
  }) => DocumentRangeFormattingOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    rangesSupport: rangesSupport ?? this.rangesSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'rangesSupport': rangesSupport,
    };
  }
}

/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingOptions {
  const DocumentOnTypeFormattingOptions({
    required this.firstTriggerCharacter,
    this.moreTriggerCharacter,
  });

  factory DocumentOnTypeFormattingOptions.fromJson(Map<String, Object?> json) =>
      DocumentOnTypeFormattingOptions(
        firstTriggerCharacter: json['firstTriggerCharacter'] as String,
        moreTriggerCharacter: (json['moreTriggerCharacter'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
      );

  final String firstTriggerCharacter;

  final List<String>? moreTriggerCharacter;

  DocumentOnTypeFormattingOptions copyWith({
    String? firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) => DocumentOnTypeFormattingOptions(
    firstTriggerCharacter: firstTriggerCharacter ?? this.firstTriggerCharacter,
    moreTriggerCharacter: moreTriggerCharacter ?? this.moreTriggerCharacter,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'firstTriggerCharacter': firstTriggerCharacter,
      'moreTriggerCharacter': moreTriggerCharacter,
    };
  }
}

/// Provider options for a {@link RenameRequest}.
final class RenameOptions {
  const RenameOptions({this.workDoneProgress, this.prepareProvider});

  factory RenameOptions.fromJson(Map<String, Object?> json) => RenameOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    prepareProvider: json['prepareProvider'] as bool?,
  );

  final bool? workDoneProgress;

  final bool? prepareProvider;

  RenameOptions copyWith({bool? workDoneProgress, bool? prepareProvider}) =>
      RenameOptions(
        workDoneProgress: workDoneProgress ?? this.workDoneProgress,
        prepareProvider: prepareProvider ?? this.prepareProvider,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'prepareProvider': prepareProvider,
    };
  }
}

/// The server capabilities of a {@link ExecuteCommandRequest}.
final class ExecuteCommandOptions {
  const ExecuteCommandOptions({this.workDoneProgress, required this.commands});

  factory ExecuteCommandOptions.fromJson(Map<String, Object?> json) =>
      ExecuteCommandOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        commands: (json['commands'] as List<Object?>)
            .map((e) => e as String)
            .toList(),
      );

  final bool? workDoneProgress;

  final List<String> commands;

  ExecuteCommandOptions copyWith({
    bool? workDoneProgress,
    List<String>? commands,
  }) => ExecuteCommandOptions(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    commands: commands ?? this.commands,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'commands': commands,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensLegend {
  const SemanticTokensLegend({
    required this.tokenTypes,
    required this.tokenModifiers,
  });

  factory SemanticTokensLegend.fromJson(Map<String, Object?> json) =>
      SemanticTokensLegend(
        tokenTypes: (json['tokenTypes'] as List<Object?>)
            .map((e) => e as String)
            .toList(),
        tokenModifiers: (json['tokenModifiers'] as List<Object?>)
            .map((e) => e as String)
            .toList(),
      );

  final List<String> tokenTypes;

  final List<String> tokenModifiers;

  SemanticTokensLegend copyWith({
    List<String>? tokenTypes,
    List<String>? tokenModifiers,
  }) => SemanticTokensLegend(
    tokenTypes: tokenTypes ?? this.tokenTypes,
    tokenModifiers: tokenModifiers ?? this.tokenModifiers,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'tokenTypes': tokenTypes,
      'tokenModifiers': tokenModifiers,
    };
  }
}

/// A text document identifier to optionally denote a specific version of a text document.
final class OptionalVersionedTextDocumentIdentifier {
  const OptionalVersionedTextDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  factory OptionalVersionedTextDocumentIdentifier.fromJson(
    Map<String, Object?> json,
  ) => OptionalVersionedTextDocumentIdentifier(
    uri: json['uri'] as String,
    version: json['version'] as int?,
  );

  final String uri;

  final int? version;

  OptionalVersionedTextDocumentIdentifier copyWith({
    String? uri,
    int? version,
  }) => OptionalVersionedTextDocumentIdentifier(
    uri: uri ?? this.uri,
    version: version ?? this.version,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'version': version};
  }
}

/// A special text edit with an additional change annotation.
///
/// @since 3.16.0.
final class AnnotatedTextEdit {
  const AnnotatedTextEdit({
    required this.range,
    required this.newText,
    required this.annotationId,
  });

  factory AnnotatedTextEdit.fromJson(Map<String, Object?> json) =>
      AnnotatedTextEdit(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        newText: json['newText'] as String,
        annotationId: json['annotationId'] as ChangeAnnotationIdentifier,
      );

  final Range range;

  final String newText;

  final ChangeAnnotationIdentifier annotationId;

  AnnotatedTextEdit copyWith({
    Range? range,
    String? newText,
    ChangeAnnotationIdentifier? annotationId,
  }) => AnnotatedTextEdit(
    range: range ?? this.range,
    newText: newText ?? this.newText,
    annotationId: annotationId ?? this.annotationId,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'newText': newText,
      'annotationId': annotationId,
    };
  }
}

/// A generic resource operation.
final class ResourceOperation {
  const ResourceOperation({required this.kind, this.annotationId});

  factory ResourceOperation.fromJson(Map<String, Object?> json) =>
      ResourceOperation(
        kind: json['kind'] as String,
        annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
      );

  final String kind;

  final ChangeAnnotationIdentifier? annotationId;

  ResourceOperation copyWith({
    String? kind,
    ChangeAnnotationIdentifier? annotationId,
  }) => ResourceOperation(
    kind: kind ?? this.kind,
    annotationId: annotationId ?? this.annotationId,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'annotationId': annotationId};
  }
}

/// Options to create a file.
final class CreateFileOptions {
  const CreateFileOptions({this.overwrite, this.ignoreIfExists});

  factory CreateFileOptions.fromJson(Map<String, Object?> json) =>
      CreateFileOptions(
        overwrite: json['overwrite'] as bool?,
        ignoreIfExists: json['ignoreIfExists'] as bool?,
      );

  final bool? overwrite;

  final bool? ignoreIfExists;

  CreateFileOptions copyWith({bool? overwrite, bool? ignoreIfExists}) =>
      CreateFileOptions(
        overwrite: overwrite ?? this.overwrite,
        ignoreIfExists: ignoreIfExists ?? this.ignoreIfExists,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'overwrite': overwrite,
      'ignoreIfExists': ignoreIfExists,
    };
  }
}

/// Rename file options
final class RenameFileOptions {
  const RenameFileOptions({this.overwrite, this.ignoreIfExists});

  factory RenameFileOptions.fromJson(Map<String, Object?> json) =>
      RenameFileOptions(
        overwrite: json['overwrite'] as bool?,
        ignoreIfExists: json['ignoreIfExists'] as bool?,
      );

  final bool? overwrite;

  final bool? ignoreIfExists;

  RenameFileOptions copyWith({bool? overwrite, bool? ignoreIfExists}) =>
      RenameFileOptions(
        overwrite: overwrite ?? this.overwrite,
        ignoreIfExists: ignoreIfExists ?? this.ignoreIfExists,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'overwrite': overwrite,
      'ignoreIfExists': ignoreIfExists,
    };
  }
}

/// Delete file options
final class DeleteFileOptions {
  const DeleteFileOptions({this.recursive, this.ignoreIfNotExists});

  factory DeleteFileOptions.fromJson(Map<String, Object?> json) =>
      DeleteFileOptions(
        recursive: json['recursive'] as bool?,
        ignoreIfNotExists: json['ignoreIfNotExists'] as bool?,
      );

  final bool? recursive;

  final bool? ignoreIfNotExists;

  DeleteFileOptions copyWith({bool? recursive, bool? ignoreIfNotExists}) =>
      DeleteFileOptions(
        recursive: recursive ?? this.recursive,
        ignoreIfNotExists: ignoreIfNotExists ?? this.ignoreIfNotExists,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'recursive': recursive,
      'ignoreIfNotExists': ignoreIfNotExists,
    };
  }
}

/// A pattern to describe in which file operation requests or notifications
/// the server is interested in receiving.
///
/// @since 3.16.0
final class FileOperationPattern {
  const FileOperationPattern({required this.glob, this.matches, this.options});

  factory FileOperationPattern.fromJson(Map<String, Object?> json) =>
      FileOperationPattern(
        glob: json['glob'] as String,
        matches: json['matches'] == null
            ? null
            : FileOperationPatternKind.values.firstWhere(
                (e) => e.value == json['matches'] as String,
              ),
        options: json['options'] == null
            ? null
            : FileOperationPatternOptions.fromJson(
                json['options'] as Map<String, Object?>,
              ),
      );

  final String glob;

  final FileOperationPatternKind? matches;

  final FileOperationPatternOptions? options;

  FileOperationPattern copyWith({
    String? glob,
    FileOperationPatternKind? matches,
    FileOperationPatternOptions? options,
  }) => FileOperationPattern(
    glob: glob ?? this.glob,
    matches: matches ?? this.matches,
    options: options ?? this.options,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'glob': glob,
      'matches': matches?.value,
      'options': options?.toJson(),
    };
  }
}

/// A full document diagnostic report for a workspace diagnostic result.
///
/// @since 3.17.0
final class WorkspaceFullDocumentDiagnosticReport {
  const WorkspaceFullDocumentDiagnosticReport({
    required this.kind,
    this.resultId,
    required this.items,
    required this.uri,
    required this.version,
  });

  factory WorkspaceFullDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceFullDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String?,
    items: (json['items'] as List<Object?>)
        .map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
        .toList(),
    uri: json['uri'] as String,
    version: json['version'] as int?,
  );

  final String kind;

  final String? resultId;

  final List<Diagnostic> items;

  final String uri;

  final int? version;

  WorkspaceFullDocumentDiagnosticReport copyWith({
    String? kind,
    String? resultId,
    List<Diagnostic>? items,
    String? uri,
    int? version,
  }) => WorkspaceFullDocumentDiagnosticReport(
    kind: kind ?? this.kind,
    resultId: resultId ?? this.resultId,
    items: items ?? this.items,
    uri: uri ?? this.uri,
    version: version ?? this.version,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind,
      'resultId': resultId,
      'items': items.map((e) => e.toJson()).toList(),
      'uri': uri,
      'version': version,
    };
  }
}

/// An unchanged document diagnostic report for a workspace diagnostic result.
///
/// @since 3.17.0
final class WorkspaceUnchangedDocumentDiagnosticReport {
  const WorkspaceUnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
    required this.uri,
    required this.version,
  });

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceUnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
    uri: json['uri'] as String,
    version: json['version'] as int?,
  );

  final String kind;

  final String resultId;

  final String uri;

  final int? version;

  WorkspaceUnchangedDocumentDiagnosticReport copyWith({
    String? kind,
    String? resultId,
    String? uri,
    int? version,
  }) => WorkspaceUnchangedDocumentDiagnosticReport(
    kind: kind ?? this.kind,
    resultId: resultId ?? this.resultId,
    uri: uri ?? this.uri,
    version: version ?? this.version,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind,
      'resultId': resultId,
      'uri': uri,
      'version': version,
    };
  }
}

/// A notebook cell.
///
/// A cell's document URI must be unique across ALL notebook
/// cells and can therefore be used to uniquely identify a
/// notebook cell or the cell's text document.
///
/// @since 3.17.0
final class NotebookCell {
  const NotebookCell({
    required this.kind,
    required this.document,
    this.metadata,
    this.executionSummary,
  });

  factory NotebookCell.fromJson(Map<String, Object?> json) => NotebookCell(
    kind: NotebookCellKind.values.firstWhere(
      (e) => e.value == json['kind'] as int,
    ),
    document: json['document'] as String,
    metadata: json['metadata'] as LSPObject?,
    executionSummary: json['executionSummary'] == null
        ? null
        : ExecutionSummary.fromJson(
            json['executionSummary'] as Map<String, Object?>,
          ),
  );

  final NotebookCellKind kind;

  final String document;

  final LSPObject? metadata;

  final ExecutionSummary? executionSummary;

  NotebookCell copyWith({
    NotebookCellKind? kind,
    String? document,
    LSPObject? metadata,
    ExecutionSummary? executionSummary,
  }) => NotebookCell(
    kind: kind ?? this.kind,
    document: document ?? this.document,
    metadata: metadata ?? this.metadata,
    executionSummary: executionSummary ?? this.executionSummary,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind.value,
      'document': document,
      'metadata': metadata,
      'executionSummary': executionSummary?.toJson(),
    };
  }
}

/// A change describing how to move a `NotebookCell`
/// array from state S to S'.
///
/// @since 3.17.0
final class NotebookCellArrayChange {
  const NotebookCellArrayChange({
    required this.start,
    required this.deleteCount,
    this.cells,
  });

  factory NotebookCellArrayChange.fromJson(Map<String, Object?> json) =>
      NotebookCellArrayChange(
        start: json['start'] as int,
        deleteCount: json['deleteCount'] as int,
        cells: (json['cells'] as List<Object?>?)
            ?.map((e) => NotebookCell.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  final int start;

  final int deleteCount;

  final List<NotebookCell>? cells;

  NotebookCellArrayChange copyWith({
    int? start,
    int? deleteCount,
    List<NotebookCell>? cells,
  }) => NotebookCellArrayChange(
    start: start ?? this.start,
    deleteCount: deleteCount ?? this.deleteCount,
    cells: cells ?? this.cells,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'start': start,
      'deleteCount': deleteCount,
      'cells': cells?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Describes the currently selected completion item.
///
/// @since 3.18.0
/// @proposed
final class SelectedCompletionInfo {
  const SelectedCompletionInfo({required this.range, required this.text});

  factory SelectedCompletionInfo.fromJson(Map<String, Object?> json) =>
      SelectedCompletionInfo(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        text: json['text'] as String,
      );

  final Range range;

  final String text;

  SelectedCompletionInfo copyWith({Range? range, String? text}) =>
      SelectedCompletionInfo(
        range: range ?? this.range,
        text: text ?? this.text,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'text': text};
  }
}

/// Defines the capabilities provided by the client.
final class ClientCapabilities {
  const ClientCapabilities({
    this.workspace,
    this.textDocument,
    this.notebookDocument,
    this.window,
    this.general,
    this.experimental,
  });

  factory ClientCapabilities.fromJson(Map<String, Object?> json) =>
      ClientCapabilities(
        workspace: json['workspace'] == null
            ? null
            : WorkspaceClientCapabilities.fromJson(
                json['workspace'] as Map<String, Object?>,
              ),
        textDocument: json['textDocument'] == null
            ? null
            : TextDocumentClientCapabilities.fromJson(
                json['textDocument'] as Map<String, Object?>,
              ),
        notebookDocument: json['notebookDocument'] == null
            ? null
            : NotebookDocumentClientCapabilities.fromJson(
                json['notebookDocument'] as Map<String, Object?>,
              ),
        window: json['window'] == null
            ? null
            : WindowClientCapabilities.fromJson(
                json['window'] as Map<String, Object?>,
              ),
        general: json['general'] == null
            ? null
            : GeneralClientCapabilities.fromJson(
                json['general'] as Map<String, Object?>,
              ),
        experimental: json['experimental'] as LSPAny?,
      );

  final WorkspaceClientCapabilities? workspace;

  final TextDocumentClientCapabilities? textDocument;

  final NotebookDocumentClientCapabilities? notebookDocument;

  final WindowClientCapabilities? window;

  final GeneralClientCapabilities? general;

  final LSPAny? experimental;

  ClientCapabilities copyWith({
    WorkspaceClientCapabilities? workspace,
    TextDocumentClientCapabilities? textDocument,
    NotebookDocumentClientCapabilities? notebookDocument,
    WindowClientCapabilities? window,
    GeneralClientCapabilities? general,
    LSPAny? experimental,
  }) => ClientCapabilities(
    workspace: workspace ?? this.workspace,
    textDocument: textDocument ?? this.textDocument,
    notebookDocument: notebookDocument ?? this.notebookDocument,
    window: window ?? this.window,
    general: general ?? this.general,
    experimental: experimental ?? this.experimental,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workspace': workspace?.toJson(),
      'textDocument': textDocument?.toJson(),
      'notebookDocument': notebookDocument?.toJson(),
      'window': window?.toJson(),
      'general': general?.toJson(),
      'experimental': experimental,
    };
  }
}

final class TextDocumentSyncOptions {
  const TextDocumentSyncOptions({
    this.openClose,
    this.change,
    this.willSave,
    this.willSaveWaitUntil,
    this.save,
  });

  factory TextDocumentSyncOptions.fromJson(Map<String, Object?> json) =>
      TextDocumentSyncOptions(
        openClose: json['openClose'] as bool?,
        change: json['change'] == null
            ? null
            : TextDocumentSyncKind.values.firstWhere(
                (e) => e.value == json['change'] as int,
              ),
        willSave: json['willSave'] as bool?,
        willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
        save: json['save'] as Object?,
      );

  final bool? openClose;

  final TextDocumentSyncKind? change;

  final bool? willSave;

  final bool? willSaveWaitUntil;

  final Object? save;

  TextDocumentSyncOptions copyWith({
    bool? openClose,
    TextDocumentSyncKind? change,
    bool? willSave,
    bool? willSaveWaitUntil,
    Object? save,
  }) => TextDocumentSyncOptions(
    openClose: openClose ?? this.openClose,
    change: change ?? this.change,
    willSave: willSave ?? this.willSave,
    willSaveWaitUntil: willSaveWaitUntil ?? this.willSaveWaitUntil,
    save: save ?? this.save,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'openClose': openClose,
      'change': change?.value,
      'willSave': willSave,
      'willSaveWaitUntil': willSaveWaitUntil,
      'save': save,
    };
  }
}

/// Options specific to a notebook plus its cells
/// to be synced to the server.
///
/// If a selector provides a notebook document
/// filter but no cell selector all cells of a
/// matching notebook document will be synced.
///
/// If a selector provides no notebook document
/// filter but only a cell selector all notebook
/// document that contain at least one matching
/// cell will be synced.
///
/// @since 3.17.0
final class NotebookDocumentSyncOptions {
  const NotebookDocumentSyncOptions({
    required this.notebookSelector,
    this.save,
  });

  factory NotebookDocumentSyncOptions.fromJson(Map<String, Object?> json) =>
      NotebookDocumentSyncOptions(
        notebookSelector: (json['notebookSelector'] as List<Object?>)
            .map((e) => e as Object)
            .toList(),
        save: json['save'] as bool?,
      );

  final List<Object> notebookSelector;

  final bool? save;

  NotebookDocumentSyncOptions copyWith({
    List<Object>? notebookSelector,
    bool? save,
  }) => NotebookDocumentSyncOptions(
    notebookSelector: notebookSelector ?? this.notebookSelector,
    save: save ?? this.save,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookSelector': notebookSelector,
      'save': save,
    };
  }
}

/// Registration options specific to a notebook.
///
/// @since 3.17.0
final class NotebookDocumentSyncRegistrationOptions {
  const NotebookDocumentSyncRegistrationOptions({
    required this.notebookSelector,
    this.save,
    this.id,
  });

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentSyncRegistrationOptions(
    notebookSelector: (json['notebookSelector'] as List<Object?>)
        .map((e) => e as Object)
        .toList(),
    save: json['save'] as bool?,
    id: json['id'] as String?,
  );

  final List<Object> notebookSelector;

  final bool? save;

  final String? id;

  NotebookDocumentSyncRegistrationOptions copyWith({
    List<Object>? notebookSelector,
    bool? save,
    String? id,
  }) => NotebookDocumentSyncRegistrationOptions(
    notebookSelector: notebookSelector ?? this.notebookSelector,
    save: save ?? this.save,
    id: id ?? this.id,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookSelector': notebookSelector,
      'save': save,
      'id': id,
    };
  }
}

final class WorkspaceFoldersServerCapabilities {
  const WorkspaceFoldersServerCapabilities({
    this.supported,
    this.changeNotifications,
  });

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceFoldersServerCapabilities(
    supported: json['supported'] as bool?,
    changeNotifications: json['changeNotifications'] as Object?,
  );

  final bool? supported;

  final Object? changeNotifications;

  WorkspaceFoldersServerCapabilities copyWith({
    bool? supported,
    Object? changeNotifications,
  }) => WorkspaceFoldersServerCapabilities(
    supported: supported ?? this.supported,
    changeNotifications: changeNotifications ?? this.changeNotifications,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'supported': supported,
      'changeNotifications': changeNotifications,
    };
  }
}

/// Options for notifications/requests for user operations on files.
///
/// @since 3.16.0
final class FileOperationOptions {
  const FileOperationOptions({
    this.didCreate,
    this.willCreate,
    this.didRename,
    this.willRename,
    this.didDelete,
    this.willDelete,
  });

  factory FileOperationOptions.fromJson(Map<String, Object?> json) =>
      FileOperationOptions(
        didCreate: json['didCreate'] == null
            ? null
            : FileOperationRegistrationOptions.fromJson(
                json['didCreate'] as Map<String, Object?>,
              ),
        willCreate: json['willCreate'] == null
            ? null
            : FileOperationRegistrationOptions.fromJson(
                json['willCreate'] as Map<String, Object?>,
              ),
        didRename: json['didRename'] == null
            ? null
            : FileOperationRegistrationOptions.fromJson(
                json['didRename'] as Map<String, Object?>,
              ),
        willRename: json['willRename'] == null
            ? null
            : FileOperationRegistrationOptions.fromJson(
                json['willRename'] as Map<String, Object?>,
              ),
        didDelete: json['didDelete'] == null
            ? null
            : FileOperationRegistrationOptions.fromJson(
                json['didDelete'] as Map<String, Object?>,
              ),
        willDelete: json['willDelete'] == null
            ? null
            : FileOperationRegistrationOptions.fromJson(
                json['willDelete'] as Map<String, Object?>,
              ),
      );

  final FileOperationRegistrationOptions? didCreate;

  final FileOperationRegistrationOptions? willCreate;

  final FileOperationRegistrationOptions? didRename;

  final FileOperationRegistrationOptions? willRename;

  final FileOperationRegistrationOptions? didDelete;

  final FileOperationRegistrationOptions? willDelete;

  FileOperationOptions copyWith({
    FileOperationRegistrationOptions? didCreate,
    FileOperationRegistrationOptions? willCreate,
    FileOperationRegistrationOptions? didRename,
    FileOperationRegistrationOptions? willRename,
    FileOperationRegistrationOptions? didDelete,
    FileOperationRegistrationOptions? willDelete,
  }) => FileOperationOptions(
    didCreate: didCreate ?? this.didCreate,
    willCreate: willCreate ?? this.willCreate,
    didRename: didRename ?? this.didRename,
    willRename: willRename ?? this.willRename,
    didDelete: didDelete ?? this.didDelete,
    willDelete: willDelete ?? this.willDelete,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'didCreate': didCreate?.toJson(),
      'willCreate': willCreate?.toJson(),
      'didRename': didRename?.toJson(),
      'willRename': willRename?.toJson(),
      'didDelete': didDelete?.toJson(),
      'willDelete': willDelete?.toJson(),
    };
  }
}

/// Structure to capture a description for an error code.
///
/// @since 3.16.0
final class CodeDescription {
  const CodeDescription({required this.href});

  factory CodeDescription.fromJson(Map<String, Object?> json) =>
      CodeDescription(href: json['href'] as String);

  final String href;

  CodeDescription copyWith({String? href}) =>
      CodeDescription(href: href ?? this.href);

  Map<String, Object?> toJson() {
    return <String, Object?>{'href': href};
  }
}

/// Represents a related message and source code location for a diagnostic. This should be
/// used to point to code locations that cause or related to a diagnostics, e.g when duplicating
/// a symbol in a scope.
final class DiagnosticRelatedInformation {
  const DiagnosticRelatedInformation({
    required this.location,
    required this.message,
  });

  factory DiagnosticRelatedInformation.fromJson(Map<String, Object?> json) =>
      DiagnosticRelatedInformation(
        location: Location.fromJson(json['location'] as Map<String, Object?>),
        message: json['message'] as String,
      );

  final Location location;

  final String message;

  DiagnosticRelatedInformation copyWith({
    Location? location,
    String? message,
  }) => DiagnosticRelatedInformation(
    location: location ?? this.location,
    message: message ?? this.message,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'location': location.toJson(), 'message': message};
  }
}

/// Represents a parameter of a callable-signature. A parameter can
/// have a label and a doc-comment.
final class ParameterInformation {
  const ParameterInformation({required this.label, this.documentation});

  factory ParameterInformation.fromJson(Map<String, Object?> json) =>
      ParameterInformation(
        label: json['label'] as Object,
        documentation: json['documentation'] as Object?,
      );

  final Object label;

  final Object? documentation;

  ParameterInformation copyWith({Object? label, Object? documentation}) =>
      ParameterInformation(
        label: label ?? this.label,
        documentation: documentation ?? this.documentation,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'label': label, 'documentation': documentation};
  }
}

/// A notebook cell text document filter denotes a cell text
/// document by different properties.
///
/// @since 3.17.0
final class NotebookCellTextDocumentFilter {
  const NotebookCellTextDocumentFilter({required this.notebook, this.language});

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, Object?> json) =>
      NotebookCellTextDocumentFilter(
        notebook: json['notebook'] as Object,
        language: json['language'] as String?,
      );

  final Object notebook;

  final String? language;

  NotebookCellTextDocumentFilter copyWith({
    Object? notebook,
    String? language,
  }) => NotebookCellTextDocumentFilter(
    notebook: notebook ?? this.notebook,
    language: language ?? this.language,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'notebook': notebook, 'language': language};
  }
}

/// Matching options for the file operation pattern.
///
/// @since 3.16.0
final class FileOperationPatternOptions {
  const FileOperationPatternOptions({this.ignoreCase});

  factory FileOperationPatternOptions.fromJson(Map<String, Object?> json) =>
      FileOperationPatternOptions(ignoreCase: json['ignoreCase'] as bool?);

  final bool? ignoreCase;

  FileOperationPatternOptions copyWith({bool? ignoreCase}) =>
      FileOperationPatternOptions(ignoreCase: ignoreCase ?? this.ignoreCase);

  Map<String, Object?> toJson() {
    return <String, Object?>{'ignoreCase': ignoreCase};
  }
}

final class ExecutionSummary {
  const ExecutionSummary({required this.executionOrder, this.success});

  factory ExecutionSummary.fromJson(Map<String, Object?> json) =>
      ExecutionSummary(
        executionOrder: json['executionOrder'] as int,
        success: json['success'] as bool?,
      );

  final int executionOrder;

  final bool? success;

  ExecutionSummary copyWith({int? executionOrder, bool? success}) =>
      ExecutionSummary(
        executionOrder: executionOrder ?? this.executionOrder,
        success: success ?? this.success,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'executionOrder': executionOrder,
      'success': success,
    };
  }
}

/// Workspace specific client capabilities.
final class WorkspaceClientCapabilities {
  const WorkspaceClientCapabilities({
    this.applyEdit,
    this.workspaceEdit,
    this.didChangeConfiguration,
    this.didChangeWatchedFiles,
    this.symbol,
    this.executeCommand,
    this.workspaceFolders,
    this.configuration,
    this.semanticTokens,
    this.codeLens,
    this.fileOperations,
    this.inlineValue,
    this.inlayHint,
    this.diagnostics,
    this.foldingRange,
  });

  factory WorkspaceClientCapabilities.fromJson(Map<String, Object?> json) =>
      WorkspaceClientCapabilities(
        applyEdit: json['applyEdit'] as bool?,
        workspaceEdit: json['workspaceEdit'] == null
            ? null
            : WorkspaceEditClientCapabilities.fromJson(
                json['workspaceEdit'] as Map<String, Object?>,
              ),
        didChangeConfiguration: json['didChangeConfiguration'] == null
            ? null
            : DidChangeConfigurationClientCapabilities.fromJson(
                json['didChangeConfiguration'] as Map<String, Object?>,
              ),
        didChangeWatchedFiles: json['didChangeWatchedFiles'] == null
            ? null
            : DidChangeWatchedFilesClientCapabilities.fromJson(
                json['didChangeWatchedFiles'] as Map<String, Object?>,
              ),
        symbol: json['symbol'] == null
            ? null
            : WorkspaceSymbolClientCapabilities.fromJson(
                json['symbol'] as Map<String, Object?>,
              ),
        executeCommand: json['executeCommand'] == null
            ? null
            : ExecuteCommandClientCapabilities.fromJson(
                json['executeCommand'] as Map<String, Object?>,
              ),
        workspaceFolders: json['workspaceFolders'] as bool?,
        configuration: json['configuration'] as bool?,
        semanticTokens: json['semanticTokens'] == null
            ? null
            : SemanticTokensWorkspaceClientCapabilities.fromJson(
                json['semanticTokens'] as Map<String, Object?>,
              ),
        codeLens: json['codeLens'] == null
            ? null
            : CodeLensWorkspaceClientCapabilities.fromJson(
                json['codeLens'] as Map<String, Object?>,
              ),
        fileOperations: json['fileOperations'] == null
            ? null
            : FileOperationClientCapabilities.fromJson(
                json['fileOperations'] as Map<String, Object?>,
              ),
        inlineValue: json['inlineValue'] == null
            ? null
            : InlineValueWorkspaceClientCapabilities.fromJson(
                json['inlineValue'] as Map<String, Object?>,
              ),
        inlayHint: json['inlayHint'] == null
            ? null
            : InlayHintWorkspaceClientCapabilities.fromJson(
                json['inlayHint'] as Map<String, Object?>,
              ),
        diagnostics: json['diagnostics'] == null
            ? null
            : DiagnosticWorkspaceClientCapabilities.fromJson(
                json['diagnostics'] as Map<String, Object?>,
              ),
        foldingRange: json['foldingRange'] == null
            ? null
            : FoldingRangeWorkspaceClientCapabilities.fromJson(
                json['foldingRange'] as Map<String, Object?>,
              ),
      );

  final bool? applyEdit;

  final WorkspaceEditClientCapabilities? workspaceEdit;

  final DidChangeConfigurationClientCapabilities? didChangeConfiguration;

  final DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles;

  final WorkspaceSymbolClientCapabilities? symbol;

  final ExecuteCommandClientCapabilities? executeCommand;

  final bool? workspaceFolders;

  final bool? configuration;

  final SemanticTokensWorkspaceClientCapabilities? semanticTokens;

  final CodeLensWorkspaceClientCapabilities? codeLens;

  final FileOperationClientCapabilities? fileOperations;

  final InlineValueWorkspaceClientCapabilities? inlineValue;

  final InlayHintWorkspaceClientCapabilities? inlayHint;

  final DiagnosticWorkspaceClientCapabilities? diagnostics;

  final FoldingRangeWorkspaceClientCapabilities? foldingRange;

  WorkspaceClientCapabilities copyWith({
    bool? applyEdit,
    WorkspaceEditClientCapabilities? workspaceEdit,
    DidChangeConfigurationClientCapabilities? didChangeConfiguration,
    DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles,
    WorkspaceSymbolClientCapabilities? symbol,
    ExecuteCommandClientCapabilities? executeCommand,
    bool? workspaceFolders,
    bool? configuration,
    SemanticTokensWorkspaceClientCapabilities? semanticTokens,
    CodeLensWorkspaceClientCapabilities? codeLens,
    FileOperationClientCapabilities? fileOperations,
    InlineValueWorkspaceClientCapabilities? inlineValue,
    InlayHintWorkspaceClientCapabilities? inlayHint,
    DiagnosticWorkspaceClientCapabilities? diagnostics,
    FoldingRangeWorkspaceClientCapabilities? foldingRange,
  }) => WorkspaceClientCapabilities(
    applyEdit: applyEdit ?? this.applyEdit,
    workspaceEdit: workspaceEdit ?? this.workspaceEdit,
    didChangeConfiguration:
        didChangeConfiguration ?? this.didChangeConfiguration,
    didChangeWatchedFiles: didChangeWatchedFiles ?? this.didChangeWatchedFiles,
    symbol: symbol ?? this.symbol,
    executeCommand: executeCommand ?? this.executeCommand,
    workspaceFolders: workspaceFolders ?? this.workspaceFolders,
    configuration: configuration ?? this.configuration,
    semanticTokens: semanticTokens ?? this.semanticTokens,
    codeLens: codeLens ?? this.codeLens,
    fileOperations: fileOperations ?? this.fileOperations,
    inlineValue: inlineValue ?? this.inlineValue,
    inlayHint: inlayHint ?? this.inlayHint,
    diagnostics: diagnostics ?? this.diagnostics,
    foldingRange: foldingRange ?? this.foldingRange,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'applyEdit': applyEdit,
      'workspaceEdit': workspaceEdit?.toJson(),
      'didChangeConfiguration': didChangeConfiguration?.toJson(),
      'didChangeWatchedFiles': didChangeWatchedFiles?.toJson(),
      'symbol': symbol?.toJson(),
      'executeCommand': executeCommand?.toJson(),
      'workspaceFolders': workspaceFolders,
      'configuration': configuration,
      'semanticTokens': semanticTokens?.toJson(),
      'codeLens': codeLens?.toJson(),
      'fileOperations': fileOperations?.toJson(),
      'inlineValue': inlineValue?.toJson(),
      'inlayHint': inlayHint?.toJson(),
      'diagnostics': diagnostics?.toJson(),
      'foldingRange': foldingRange?.toJson(),
    };
  }
}

/// Text document specific client capabilities.
final class TextDocumentClientCapabilities {
  const TextDocumentClientCapabilities({
    this.synchronization,
    this.completion,
    this.hover,
    this.signatureHelp,
    this.declaration,
    this.definition,
    this.typeDefinition,
    this.implementation,
    this.references,
    this.documentHighlight,
    this.documentSymbol,
    this.codeAction,
    this.codeLens,
    this.documentLink,
    this.colorProvider,
    this.formatting,
    this.rangeFormatting,
    this.onTypeFormatting,
    this.rename,
    this.foldingRange,
    this.selectionRange,
    this.publishDiagnostics,
    this.callHierarchy,
    this.semanticTokens,
    this.linkedEditingRange,
    this.moniker,
    this.typeHierarchy,
    this.inlineValue,
    this.inlayHint,
    this.diagnostic,
    this.inlineCompletion,
  });

  factory TextDocumentClientCapabilities.fromJson(Map<String, Object?> json) =>
      TextDocumentClientCapabilities(
        synchronization: json['synchronization'] == null
            ? null
            : TextDocumentSyncClientCapabilities.fromJson(
                json['synchronization'] as Map<String, Object?>,
              ),
        completion: json['completion'] == null
            ? null
            : CompletionClientCapabilities.fromJson(
                json['completion'] as Map<String, Object?>,
              ),
        hover: json['hover'] == null
            ? null
            : HoverClientCapabilities.fromJson(
                json['hover'] as Map<String, Object?>,
              ),
        signatureHelp: json['signatureHelp'] == null
            ? null
            : SignatureHelpClientCapabilities.fromJson(
                json['signatureHelp'] as Map<String, Object?>,
              ),
        declaration: json['declaration'] == null
            ? null
            : DeclarationClientCapabilities.fromJson(
                json['declaration'] as Map<String, Object?>,
              ),
        definition: json['definition'] == null
            ? null
            : DefinitionClientCapabilities.fromJson(
                json['definition'] as Map<String, Object?>,
              ),
        typeDefinition: json['typeDefinition'] == null
            ? null
            : TypeDefinitionClientCapabilities.fromJson(
                json['typeDefinition'] as Map<String, Object?>,
              ),
        implementation: json['implementation'] == null
            ? null
            : ImplementationClientCapabilities.fromJson(
                json['implementation'] as Map<String, Object?>,
              ),
        references: json['references'] == null
            ? null
            : ReferenceClientCapabilities.fromJson(
                json['references'] as Map<String, Object?>,
              ),
        documentHighlight: json['documentHighlight'] == null
            ? null
            : DocumentHighlightClientCapabilities.fromJson(
                json['documentHighlight'] as Map<String, Object?>,
              ),
        documentSymbol: json['documentSymbol'] == null
            ? null
            : DocumentSymbolClientCapabilities.fromJson(
                json['documentSymbol'] as Map<String, Object?>,
              ),
        codeAction: json['codeAction'] == null
            ? null
            : CodeActionClientCapabilities.fromJson(
                json['codeAction'] as Map<String, Object?>,
              ),
        codeLens: json['codeLens'] == null
            ? null
            : CodeLensClientCapabilities.fromJson(
                json['codeLens'] as Map<String, Object?>,
              ),
        documentLink: json['documentLink'] == null
            ? null
            : DocumentLinkClientCapabilities.fromJson(
                json['documentLink'] as Map<String, Object?>,
              ),
        colorProvider: json['colorProvider'] == null
            ? null
            : DocumentColorClientCapabilities.fromJson(
                json['colorProvider'] as Map<String, Object?>,
              ),
        formatting: json['formatting'] == null
            ? null
            : DocumentFormattingClientCapabilities.fromJson(
                json['formatting'] as Map<String, Object?>,
              ),
        rangeFormatting: json['rangeFormatting'] == null
            ? null
            : DocumentRangeFormattingClientCapabilities.fromJson(
                json['rangeFormatting'] as Map<String, Object?>,
              ),
        onTypeFormatting: json['onTypeFormatting'] == null
            ? null
            : DocumentOnTypeFormattingClientCapabilities.fromJson(
                json['onTypeFormatting'] as Map<String, Object?>,
              ),
        rename: json['rename'] == null
            ? null
            : RenameClientCapabilities.fromJson(
                json['rename'] as Map<String, Object?>,
              ),
        foldingRange: json['foldingRange'] == null
            ? null
            : FoldingRangeClientCapabilities.fromJson(
                json['foldingRange'] as Map<String, Object?>,
              ),
        selectionRange: json['selectionRange'] == null
            ? null
            : SelectionRangeClientCapabilities.fromJson(
                json['selectionRange'] as Map<String, Object?>,
              ),
        publishDiagnostics: json['publishDiagnostics'] == null
            ? null
            : PublishDiagnosticsClientCapabilities.fromJson(
                json['publishDiagnostics'] as Map<String, Object?>,
              ),
        callHierarchy: json['callHierarchy'] == null
            ? null
            : CallHierarchyClientCapabilities.fromJson(
                json['callHierarchy'] as Map<String, Object?>,
              ),
        semanticTokens: json['semanticTokens'] == null
            ? null
            : SemanticTokensClientCapabilities.fromJson(
                json['semanticTokens'] as Map<String, Object?>,
              ),
        linkedEditingRange: json['linkedEditingRange'] == null
            ? null
            : LinkedEditingRangeClientCapabilities.fromJson(
                json['linkedEditingRange'] as Map<String, Object?>,
              ),
        moniker: json['moniker'] == null
            ? null
            : MonikerClientCapabilities.fromJson(
                json['moniker'] as Map<String, Object?>,
              ),
        typeHierarchy: json['typeHierarchy'] == null
            ? null
            : TypeHierarchyClientCapabilities.fromJson(
                json['typeHierarchy'] as Map<String, Object?>,
              ),
        inlineValue: json['inlineValue'] == null
            ? null
            : InlineValueClientCapabilities.fromJson(
                json['inlineValue'] as Map<String, Object?>,
              ),
        inlayHint: json['inlayHint'] == null
            ? null
            : InlayHintClientCapabilities.fromJson(
                json['inlayHint'] as Map<String, Object?>,
              ),
        diagnostic: json['diagnostic'] == null
            ? null
            : DiagnosticClientCapabilities.fromJson(
                json['diagnostic'] as Map<String, Object?>,
              ),
        inlineCompletion: json['inlineCompletion'] == null
            ? null
            : InlineCompletionClientCapabilities.fromJson(
                json['inlineCompletion'] as Map<String, Object?>,
              ),
      );

  final TextDocumentSyncClientCapabilities? synchronization;

  final CompletionClientCapabilities? completion;

  final HoverClientCapabilities? hover;

  final SignatureHelpClientCapabilities? signatureHelp;

  final DeclarationClientCapabilities? declaration;

  final DefinitionClientCapabilities? definition;

  final TypeDefinitionClientCapabilities? typeDefinition;

  final ImplementationClientCapabilities? implementation;

  final ReferenceClientCapabilities? references;

  final DocumentHighlightClientCapabilities? documentHighlight;

  final DocumentSymbolClientCapabilities? documentSymbol;

  final CodeActionClientCapabilities? codeAction;

  final CodeLensClientCapabilities? codeLens;

  final DocumentLinkClientCapabilities? documentLink;

  final DocumentColorClientCapabilities? colorProvider;

  final DocumentFormattingClientCapabilities? formatting;

  final DocumentRangeFormattingClientCapabilities? rangeFormatting;

  final DocumentOnTypeFormattingClientCapabilities? onTypeFormatting;

  final RenameClientCapabilities? rename;

  final FoldingRangeClientCapabilities? foldingRange;

  final SelectionRangeClientCapabilities? selectionRange;

  final PublishDiagnosticsClientCapabilities? publishDiagnostics;

  final CallHierarchyClientCapabilities? callHierarchy;

  final SemanticTokensClientCapabilities? semanticTokens;

  final LinkedEditingRangeClientCapabilities? linkedEditingRange;

  final MonikerClientCapabilities? moniker;

  final TypeHierarchyClientCapabilities? typeHierarchy;

  final InlineValueClientCapabilities? inlineValue;

  final InlayHintClientCapabilities? inlayHint;

  final DiagnosticClientCapabilities? diagnostic;

  final InlineCompletionClientCapabilities? inlineCompletion;

  TextDocumentClientCapabilities copyWith({
    TextDocumentSyncClientCapabilities? synchronization,
    CompletionClientCapabilities? completion,
    HoverClientCapabilities? hover,
    SignatureHelpClientCapabilities? signatureHelp,
    DeclarationClientCapabilities? declaration,
    DefinitionClientCapabilities? definition,
    TypeDefinitionClientCapabilities? typeDefinition,
    ImplementationClientCapabilities? implementation,
    ReferenceClientCapabilities? references,
    DocumentHighlightClientCapabilities? documentHighlight,
    DocumentSymbolClientCapabilities? documentSymbol,
    CodeActionClientCapabilities? codeAction,
    CodeLensClientCapabilities? codeLens,
    DocumentLinkClientCapabilities? documentLink,
    DocumentColorClientCapabilities? colorProvider,
    DocumentFormattingClientCapabilities? formatting,
    DocumentRangeFormattingClientCapabilities? rangeFormatting,
    DocumentOnTypeFormattingClientCapabilities? onTypeFormatting,
    RenameClientCapabilities? rename,
    FoldingRangeClientCapabilities? foldingRange,
    SelectionRangeClientCapabilities? selectionRange,
    PublishDiagnosticsClientCapabilities? publishDiagnostics,
    CallHierarchyClientCapabilities? callHierarchy,
    SemanticTokensClientCapabilities? semanticTokens,
    LinkedEditingRangeClientCapabilities? linkedEditingRange,
    MonikerClientCapabilities? moniker,
    TypeHierarchyClientCapabilities? typeHierarchy,
    InlineValueClientCapabilities? inlineValue,
    InlayHintClientCapabilities? inlayHint,
    DiagnosticClientCapabilities? diagnostic,
    InlineCompletionClientCapabilities? inlineCompletion,
  }) => TextDocumentClientCapabilities(
    synchronization: synchronization ?? this.synchronization,
    completion: completion ?? this.completion,
    hover: hover ?? this.hover,
    signatureHelp: signatureHelp ?? this.signatureHelp,
    declaration: declaration ?? this.declaration,
    definition: definition ?? this.definition,
    typeDefinition: typeDefinition ?? this.typeDefinition,
    implementation: implementation ?? this.implementation,
    references: references ?? this.references,
    documentHighlight: documentHighlight ?? this.documentHighlight,
    documentSymbol: documentSymbol ?? this.documentSymbol,
    codeAction: codeAction ?? this.codeAction,
    codeLens: codeLens ?? this.codeLens,
    documentLink: documentLink ?? this.documentLink,
    colorProvider: colorProvider ?? this.colorProvider,
    formatting: formatting ?? this.formatting,
    rangeFormatting: rangeFormatting ?? this.rangeFormatting,
    onTypeFormatting: onTypeFormatting ?? this.onTypeFormatting,
    rename: rename ?? this.rename,
    foldingRange: foldingRange ?? this.foldingRange,
    selectionRange: selectionRange ?? this.selectionRange,
    publishDiagnostics: publishDiagnostics ?? this.publishDiagnostics,
    callHierarchy: callHierarchy ?? this.callHierarchy,
    semanticTokens: semanticTokens ?? this.semanticTokens,
    linkedEditingRange: linkedEditingRange ?? this.linkedEditingRange,
    moniker: moniker ?? this.moniker,
    typeHierarchy: typeHierarchy ?? this.typeHierarchy,
    inlineValue: inlineValue ?? this.inlineValue,
    inlayHint: inlayHint ?? this.inlayHint,
    diagnostic: diagnostic ?? this.diagnostic,
    inlineCompletion: inlineCompletion ?? this.inlineCompletion,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'synchronization': synchronization?.toJson(),
      'completion': completion?.toJson(),
      'hover': hover?.toJson(),
      'signatureHelp': signatureHelp?.toJson(),
      'declaration': declaration?.toJson(),
      'definition': definition?.toJson(),
      'typeDefinition': typeDefinition?.toJson(),
      'implementation': implementation?.toJson(),
      'references': references?.toJson(),
      'documentHighlight': documentHighlight?.toJson(),
      'documentSymbol': documentSymbol?.toJson(),
      'codeAction': codeAction?.toJson(),
      'codeLens': codeLens?.toJson(),
      'documentLink': documentLink?.toJson(),
      'colorProvider': colorProvider?.toJson(),
      'formatting': formatting?.toJson(),
      'rangeFormatting': rangeFormatting?.toJson(),
      'onTypeFormatting': onTypeFormatting?.toJson(),
      'rename': rename?.toJson(),
      'foldingRange': foldingRange?.toJson(),
      'selectionRange': selectionRange?.toJson(),
      'publishDiagnostics': publishDiagnostics?.toJson(),
      'callHierarchy': callHierarchy?.toJson(),
      'semanticTokens': semanticTokens?.toJson(),
      'linkedEditingRange': linkedEditingRange?.toJson(),
      'moniker': moniker?.toJson(),
      'typeHierarchy': typeHierarchy?.toJson(),
      'inlineValue': inlineValue?.toJson(),
      'inlayHint': inlayHint?.toJson(),
      'diagnostic': diagnostic?.toJson(),
      'inlineCompletion': inlineCompletion?.toJson(),
    };
  }
}

/// Capabilities specific to the notebook document support.
///
/// @since 3.17.0
final class NotebookDocumentClientCapabilities {
  const NotebookDocumentClientCapabilities({required this.synchronization});

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentClientCapabilities(
    synchronization: NotebookDocumentSyncClientCapabilities.fromJson(
      json['synchronization'] as Map<String, Object?>,
    ),
  );

  final NotebookDocumentSyncClientCapabilities synchronization;

  NotebookDocumentClientCapabilities copyWith({
    NotebookDocumentSyncClientCapabilities? synchronization,
  }) => NotebookDocumentClientCapabilities(
    synchronization: synchronization ?? this.synchronization,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'synchronization': synchronization.toJson()};
  }
}

final class WindowClientCapabilities {
  const WindowClientCapabilities({
    this.workDoneProgress,
    this.showMessage,
    this.showDocument,
  });

  factory WindowClientCapabilities.fromJson(Map<String, Object?> json) =>
      WindowClientCapabilities(
        workDoneProgress: json['workDoneProgress'] as bool?,
        showMessage: json['showMessage'] == null
            ? null
            : ShowMessageRequestClientCapabilities.fromJson(
                json['showMessage'] as Map<String, Object?>,
              ),
        showDocument: json['showDocument'] == null
            ? null
            : ShowDocumentClientCapabilities.fromJson(
                json['showDocument'] as Map<String, Object?>,
              ),
      );

  final bool? workDoneProgress;

  final ShowMessageRequestClientCapabilities? showMessage;

  final ShowDocumentClientCapabilities? showDocument;

  WindowClientCapabilities copyWith({
    bool? workDoneProgress,
    ShowMessageRequestClientCapabilities? showMessage,
    ShowDocumentClientCapabilities? showDocument,
  }) => WindowClientCapabilities(
    workDoneProgress: workDoneProgress ?? this.workDoneProgress,
    showMessage: showMessage ?? this.showMessage,
    showDocument: showDocument ?? this.showDocument,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'showMessage': showMessage?.toJson(),
      'showDocument': showDocument?.toJson(),
    };
  }
}

/// General client capabilities.
///
/// @since 3.16.0
final class GeneralClientCapabilities {
  const GeneralClientCapabilities({
    this.staleRequestSupport,
    this.regularExpressions,
    this.markdown,
    this.positionEncodings,
  });

  factory GeneralClientCapabilities.fromJson(Map<String, Object?> json) =>
      GeneralClientCapabilities(
        staleRequestSupport: json['staleRequestSupport'] == null
            ? null
            : GeneralClientCapabilitiesStaleRequestSupport.fromJson(
                json['staleRequestSupport'] as Map<String, Object?>,
              ),
        regularExpressions: json['regularExpressions'] == null
            ? null
            : RegularExpressionsClientCapabilities.fromJson(
                json['regularExpressions'] as Map<String, Object?>,
              ),
        markdown: json['markdown'] == null
            ? null
            : MarkdownClientCapabilities.fromJson(
                json['markdown'] as Map<String, Object?>,
              ),
        positionEncodings: (json['positionEncodings'] as List<Object?>?)
            ?.map((e) => e as PositionEncodingKind)
            .toList(),
      );

  final GeneralClientCapabilitiesStaleRequestSupport? staleRequestSupport;

  final RegularExpressionsClientCapabilities? regularExpressions;

  final MarkdownClientCapabilities? markdown;

  final List<PositionEncodingKind>? positionEncodings;

  GeneralClientCapabilities copyWith({
    GeneralClientCapabilitiesStaleRequestSupport? staleRequestSupport,
    RegularExpressionsClientCapabilities? regularExpressions,
    MarkdownClientCapabilities? markdown,
    List<PositionEncodingKind>? positionEncodings,
  }) => GeneralClientCapabilities(
    staleRequestSupport: staleRequestSupport ?? this.staleRequestSupport,
    regularExpressions: regularExpressions ?? this.regularExpressions,
    markdown: markdown ?? this.markdown,
    positionEncodings: positionEncodings ?? this.positionEncodings,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'staleRequestSupport': staleRequestSupport?.toJson(),
      'regularExpressions': regularExpressions?.toJson(),
      'markdown': markdown?.toJson(),
      'positionEncodings': positionEncodings,
    };
  }
}

/// A relative pattern is a helper to construct glob patterns that are matched
/// relatively to a base URI. The common value for a `baseUri` is a workspace
/// folder root, but it can be another absolute URI as well.
///
/// @since 3.17.0
final class RelativePattern {
  const RelativePattern({required this.baseUri, required this.pattern});

  factory RelativePattern.fromJson(Map<String, Object?> json) =>
      RelativePattern(
        baseUri: json['baseUri'] as Object,
        pattern: json['pattern'] as Pattern,
      );

  final Object baseUri;

  final Pattern pattern;

  RelativePattern copyWith({Object? baseUri, Pattern? pattern}) =>
      RelativePattern(
        baseUri: baseUri ?? this.baseUri,
        pattern: pattern ?? this.pattern,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'baseUri': baseUri, 'pattern': pattern};
  }
}

final class WorkspaceEditClientCapabilities {
  const WorkspaceEditClientCapabilities({
    this.documentChanges,
    this.resourceOperations,
    this.failureHandling,
    this.normalizesLineEndings,
    this.changeAnnotationSupport,
  });

  factory WorkspaceEditClientCapabilities.fromJson(Map<String, Object?> json) =>
      WorkspaceEditClientCapabilities(
        documentChanges: json['documentChanges'] as bool?,
        resourceOperations: (json['resourceOperations'] as List<Object?>?)
            ?.map((e) => e as ResourceOperationKind)
            .toList(),
        failureHandling: json['failureHandling'] == null
            ? null
            : FailureHandlingKind.values.firstWhere(
                (e) => e.value == json['failureHandling'] as String,
              ),
        normalizesLineEndings: json['normalizesLineEndings'] as bool?,
        changeAnnotationSupport: json['changeAnnotationSupport'] == null
            ? null
            : WorkspaceEditClientCapabilitiesChangeAnnotationSupport.fromJson(
                json['changeAnnotationSupport'] as Map<String, Object?>,
              ),
      );

  final bool? documentChanges;

  final List<ResourceOperationKind>? resourceOperations;

  final FailureHandlingKind? failureHandling;

  final bool? normalizesLineEndings;

  final WorkspaceEditClientCapabilitiesChangeAnnotationSupport?
  changeAnnotationSupport;

  WorkspaceEditClientCapabilities copyWith({
    bool? documentChanges,
    List<ResourceOperationKind>? resourceOperations,
    FailureHandlingKind? failureHandling,
    bool? normalizesLineEndings,
    WorkspaceEditClientCapabilitiesChangeAnnotationSupport?
    changeAnnotationSupport,
  }) => WorkspaceEditClientCapabilities(
    documentChanges: documentChanges ?? this.documentChanges,
    resourceOperations: resourceOperations ?? this.resourceOperations,
    failureHandling: failureHandling ?? this.failureHandling,
    normalizesLineEndings: normalizesLineEndings ?? this.normalizesLineEndings,
    changeAnnotationSupport:
        changeAnnotationSupport ?? this.changeAnnotationSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentChanges': documentChanges,
      'resourceOperations': resourceOperations,
      'failureHandling': failureHandling?.value,
      'normalizesLineEndings': normalizesLineEndings,
      'changeAnnotationSupport': changeAnnotationSupport?.toJson(),
    };
  }
}

final class DidChangeConfigurationClientCapabilities {
  const DidChangeConfigurationClientCapabilities({this.dynamicRegistration});

  factory DidChangeConfigurationClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DidChangeConfigurationClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  DidChangeConfigurationClientCapabilities copyWith({
    bool? dynamicRegistration,
  }) => DidChangeConfigurationClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

final class DidChangeWatchedFilesClientCapabilities {
  const DidChangeWatchedFilesClientCapabilities({
    this.dynamicRegistration,
    this.relativePatternSupport,
  });

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DidChangeWatchedFilesClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    relativePatternSupport: json['relativePatternSupport'] as bool?,
  );

  final bool? dynamicRegistration;

  final bool? relativePatternSupport;

  DidChangeWatchedFilesClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? relativePatternSupport,
  }) => DidChangeWatchedFilesClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    relativePatternSupport:
        relativePatternSupport ?? this.relativePatternSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'relativePatternSupport': relativePatternSupport,
    };
  }
}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolClientCapabilities {
  const WorkspaceSymbolClientCapabilities({
    this.dynamicRegistration,
    this.symbolKind,
    this.tagSupport,
    this.resolveSupport,
  });

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    symbolKind: json['symbolKind'] == null
        ? null
        : WorkspaceSymbolClientCapabilitiesSymbolKind.fromJson(
            json['symbolKind'] as Map<String, Object?>,
          ),
    tagSupport: json['tagSupport'] == null
        ? null
        : WorkspaceSymbolClientCapabilitiesTagSupport.fromJson(
            json['tagSupport'] as Map<String, Object?>,
          ),
    resolveSupport: json['resolveSupport'] == null
        ? null
        : WorkspaceSymbolClientCapabilitiesResolveSupport.fromJson(
            json['resolveSupport'] as Map<String, Object?>,
          ),
  );

  final bool? dynamicRegistration;

  final WorkspaceSymbolClientCapabilitiesSymbolKind? symbolKind;

  final WorkspaceSymbolClientCapabilitiesTagSupport? tagSupport;

  final WorkspaceSymbolClientCapabilitiesResolveSupport? resolveSupport;

  WorkspaceSymbolClientCapabilities copyWith({
    bool? dynamicRegistration,
    WorkspaceSymbolClientCapabilitiesSymbolKind? symbolKind,
    WorkspaceSymbolClientCapabilitiesTagSupport? tagSupport,
    WorkspaceSymbolClientCapabilitiesResolveSupport? resolveSupport,
  }) => WorkspaceSymbolClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    symbolKind: symbolKind ?? this.symbolKind,
    tagSupport: tagSupport ?? this.tagSupport,
    resolveSupport: resolveSupport ?? this.resolveSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'symbolKind': symbolKind?.toJson(),
      'tagSupport': tagSupport?.toJson(),
      'resolveSupport': resolveSupport?.toJson(),
    };
  }
}

/// The client capabilities of a {@link ExecuteCommandRequest}.
final class ExecuteCommandClientCapabilities {
  const ExecuteCommandClientCapabilities({this.dynamicRegistration});

  factory ExecuteCommandClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => ExecuteCommandClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  ExecuteCommandClientCapabilities copyWith({bool? dynamicRegistration}) =>
      ExecuteCommandClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.16.0
final class SemanticTokensWorkspaceClientCapabilities {
  const SemanticTokensWorkspaceClientCapabilities({this.refreshSupport});

  factory SemanticTokensWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  final bool? refreshSupport;

  SemanticTokensWorkspaceClientCapabilities copyWith({bool? refreshSupport}) =>
      SemanticTokensWorkspaceClientCapabilities(
        refreshSupport: refreshSupport ?? this.refreshSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// @since 3.16.0
final class CodeLensWorkspaceClientCapabilities {
  const CodeLensWorkspaceClientCapabilities({this.refreshSupport});

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => CodeLensWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  final bool? refreshSupport;

  CodeLensWorkspaceClientCapabilities copyWith({bool? refreshSupport}) =>
      CodeLensWorkspaceClientCapabilities(
        refreshSupport: refreshSupport ?? this.refreshSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// Capabilities relating to events from file operations by the user in the client.
///
/// These events do not come from the file system, they come from user operations
/// like renaming a file in the UI.
///
/// @since 3.16.0
final class FileOperationClientCapabilities {
  const FileOperationClientCapabilities({
    this.dynamicRegistration,
    this.didCreate,
    this.willCreate,
    this.didRename,
    this.willRename,
    this.didDelete,
    this.willDelete,
  });

  factory FileOperationClientCapabilities.fromJson(Map<String, Object?> json) =>
      FileOperationClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        didCreate: json['didCreate'] as bool?,
        willCreate: json['willCreate'] as bool?,
        didRename: json['didRename'] as bool?,
        willRename: json['willRename'] as bool?,
        didDelete: json['didDelete'] as bool?,
        willDelete: json['willDelete'] as bool?,
      );

  final bool? dynamicRegistration;

  final bool? didCreate;

  final bool? willCreate;

  final bool? didRename;

  final bool? willRename;

  final bool? didDelete;

  final bool? willDelete;

  FileOperationClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? didCreate,
    bool? willCreate,
    bool? didRename,
    bool? willRename,
    bool? didDelete,
    bool? willDelete,
  }) => FileOperationClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    didCreate: didCreate ?? this.didCreate,
    willCreate: willCreate ?? this.willCreate,
    didRename: didRename ?? this.didRename,
    willRename: willRename ?? this.willRename,
    didDelete: didDelete ?? this.didDelete,
    willDelete: willDelete ?? this.willDelete,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'didCreate': didCreate,
      'willCreate': willCreate,
      'didRename': didRename,
      'willRename': willRename,
      'didDelete': didDelete,
      'willDelete': willDelete,
    };
  }
}

/// Client workspace capabilities specific to inline values.
///
/// @since 3.17.0
final class InlineValueWorkspaceClientCapabilities {
  const InlineValueWorkspaceClientCapabilities({this.refreshSupport});

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => InlineValueWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  final bool? refreshSupport;

  InlineValueWorkspaceClientCapabilities copyWith({bool? refreshSupport}) =>
      InlineValueWorkspaceClientCapabilities(
        refreshSupport: refreshSupport ?? this.refreshSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// Client workspace capabilities specific to inlay hints.
///
/// @since 3.17.0
final class InlayHintWorkspaceClientCapabilities {
  const InlayHintWorkspaceClientCapabilities({this.refreshSupport});

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => InlayHintWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  final bool? refreshSupport;

  InlayHintWorkspaceClientCapabilities copyWith({bool? refreshSupport}) =>
      InlayHintWorkspaceClientCapabilities(
        refreshSupport: refreshSupport ?? this.refreshSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// Workspace client capabilities specific to diagnostic pull requests.
///
/// @since 3.17.0
final class DiagnosticWorkspaceClientCapabilities {
  const DiagnosticWorkspaceClientCapabilities({this.refreshSupport});

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DiagnosticWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  final bool? refreshSupport;

  DiagnosticWorkspaceClientCapabilities copyWith({bool? refreshSupport}) =>
      DiagnosticWorkspaceClientCapabilities(
        refreshSupport: refreshSupport ?? this.refreshSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// Client workspace capabilities specific to folding ranges
///
/// @since 3.18.0
/// @proposed
final class FoldingRangeWorkspaceClientCapabilities {
  const FoldingRangeWorkspaceClientCapabilities({this.refreshSupport});

  factory FoldingRangeWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => FoldingRangeWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  final bool? refreshSupport;

  FoldingRangeWorkspaceClientCapabilities copyWith({bool? refreshSupport}) =>
      FoldingRangeWorkspaceClientCapabilities(
        refreshSupport: refreshSupport ?? this.refreshSupport,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

final class TextDocumentSyncClientCapabilities {
  const TextDocumentSyncClientCapabilities({
    this.dynamicRegistration,
    this.willSave,
    this.willSaveWaitUntil,
    this.didSave,
  });

  factory TextDocumentSyncClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => TextDocumentSyncClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    willSave: json['willSave'] as bool?,
    willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
    didSave: json['didSave'] as bool?,
  );

  final bool? dynamicRegistration;

  final bool? willSave;

  final bool? willSaveWaitUntil;

  final bool? didSave;

  TextDocumentSyncClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? willSave,
    bool? willSaveWaitUntil,
    bool? didSave,
  }) => TextDocumentSyncClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    willSave: willSave ?? this.willSave,
    willSaveWaitUntil: willSaveWaitUntil ?? this.willSaveWaitUntil,
    didSave: didSave ?? this.didSave,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'willSave': willSave,
      'willSaveWaitUntil': willSaveWaitUntil,
      'didSave': didSave,
    };
  }
}

/// Completion client capabilities
final class CompletionClientCapabilities {
  const CompletionClientCapabilities({
    this.dynamicRegistration,
    this.completionItem,
    this.completionItemKind,
    this.insertTextMode,
    this.contextSupport,
    this.completionList,
  });

  factory CompletionClientCapabilities.fromJson(Map<String, Object?> json) =>
      CompletionClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        completionItem: json['completionItem'] == null
            ? null
            : CompletionClientCapabilitiesCompletionItem.fromJson(
                json['completionItem'] as Map<String, Object?>,
              ),
        completionItemKind: json['completionItemKind'] == null
            ? null
            : CompletionClientCapabilitiesCompletionItemKind.fromJson(
                json['completionItemKind'] as Map<String, Object?>,
              ),
        insertTextMode: json['insertTextMode'] == null
            ? null
            : InsertTextMode.values.firstWhere(
                (e) => e.value == json['insertTextMode'] as int,
              ),
        contextSupport: json['contextSupport'] as bool?,
        completionList: json['completionList'] == null
            ? null
            : CompletionClientCapabilitiesCompletionList.fromJson(
                json['completionList'] as Map<String, Object?>,
              ),
      );

  final bool? dynamicRegistration;

  final CompletionClientCapabilitiesCompletionItem? completionItem;

  final CompletionClientCapabilitiesCompletionItemKind? completionItemKind;

  final InsertTextMode? insertTextMode;

  final bool? contextSupport;

  final CompletionClientCapabilitiesCompletionList? completionList;

  CompletionClientCapabilities copyWith({
    bool? dynamicRegistration,
    CompletionClientCapabilitiesCompletionItem? completionItem,
    CompletionClientCapabilitiesCompletionItemKind? completionItemKind,
    InsertTextMode? insertTextMode,
    bool? contextSupport,
    CompletionClientCapabilitiesCompletionList? completionList,
  }) => CompletionClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    completionItem: completionItem ?? this.completionItem,
    completionItemKind: completionItemKind ?? this.completionItemKind,
    insertTextMode: insertTextMode ?? this.insertTextMode,
    contextSupport: contextSupport ?? this.contextSupport,
    completionList: completionList ?? this.completionList,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'completionItem': completionItem?.toJson(),
      'completionItemKind': completionItemKind?.toJson(),
      'insertTextMode': insertTextMode?.value,
      'contextSupport': contextSupport,
      'completionList': completionList?.toJson(),
    };
  }
}

final class HoverClientCapabilities {
  const HoverClientCapabilities({this.dynamicRegistration, this.contentFormat});

  factory HoverClientCapabilities.fromJson(Map<String, Object?> json) =>
      HoverClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        contentFormat: (json['contentFormat'] as List<Object?>?)
            ?.map((e) => e as MarkupKind)
            .toList(),
      );

  final bool? dynamicRegistration;

  final List<MarkupKind>? contentFormat;

  HoverClientCapabilities copyWith({
    bool? dynamicRegistration,
    List<MarkupKind>? contentFormat,
  }) => HoverClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    contentFormat: contentFormat ?? this.contentFormat,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'contentFormat': contentFormat,
    };
  }
}

/// Client Capabilities for a {@link SignatureHelpRequest}.
final class SignatureHelpClientCapabilities {
  const SignatureHelpClientCapabilities({
    this.dynamicRegistration,
    this.signatureInformation,
    this.contextSupport,
  });

  factory SignatureHelpClientCapabilities.fromJson(Map<String, Object?> json) =>
      SignatureHelpClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        signatureInformation: json['signatureInformation'] == null
            ? null
            : SignatureHelpClientCapabilitiesSignatureInformation.fromJson(
                json['signatureInformation'] as Map<String, Object?>,
              ),
        contextSupport: json['contextSupport'] as bool?,
      );

  final bool? dynamicRegistration;

  final SignatureHelpClientCapabilitiesSignatureInformation?
  signatureInformation;

  final bool? contextSupport;

  SignatureHelpClientCapabilities copyWith({
    bool? dynamicRegistration,
    SignatureHelpClientCapabilitiesSignatureInformation? signatureInformation,
    bool? contextSupport,
  }) => SignatureHelpClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    signatureInformation: signatureInformation ?? this.signatureInformation,
    contextSupport: contextSupport ?? this.contextSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'signatureInformation': signatureInformation?.toJson(),
      'contextSupport': contextSupport,
    };
  }
}

/// @since 3.14.0
final class DeclarationClientCapabilities {
  const DeclarationClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory DeclarationClientCapabilities.fromJson(Map<String, Object?> json) =>
      DeclarationClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        linkSupport: json['linkSupport'] as bool?,
      );

  final bool? dynamicRegistration;

  final bool? linkSupport;

  DeclarationClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) => DeclarationClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    linkSupport: linkSupport ?? this.linkSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Client Capabilities for a {@link DefinitionRequest}.
final class DefinitionClientCapabilities {
  const DefinitionClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory DefinitionClientCapabilities.fromJson(Map<String, Object?> json) =>
      DefinitionClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        linkSupport: json['linkSupport'] as bool?,
      );

  final bool? dynamicRegistration;

  final bool? linkSupport;

  DefinitionClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) => DefinitionClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    linkSupport: linkSupport ?? this.linkSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Since 3.6.0
final class TypeDefinitionClientCapabilities {
  const TypeDefinitionClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory TypeDefinitionClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => TypeDefinitionClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    linkSupport: json['linkSupport'] as bool?,
  );

  final bool? dynamicRegistration;

  final bool? linkSupport;

  TypeDefinitionClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) => TypeDefinitionClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    linkSupport: linkSupport ?? this.linkSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// @since 3.6.0
final class ImplementationClientCapabilities {
  const ImplementationClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory ImplementationClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => ImplementationClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    linkSupport: json['linkSupport'] as bool?,
  );

  final bool? dynamicRegistration;

  final bool? linkSupport;

  ImplementationClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) => ImplementationClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    linkSupport: linkSupport ?? this.linkSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Client Capabilities for a {@link ReferencesRequest}.
final class ReferenceClientCapabilities {
  const ReferenceClientCapabilities({this.dynamicRegistration});

  factory ReferenceClientCapabilities.fromJson(Map<String, Object?> json) =>
      ReferenceClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  final bool? dynamicRegistration;

  ReferenceClientCapabilities copyWith({bool? dynamicRegistration}) =>
      ReferenceClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
final class DocumentHighlightClientCapabilities {
  const DocumentHighlightClientCapabilities({this.dynamicRegistration});

  factory DocumentHighlightClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DocumentHighlightClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  DocumentHighlightClientCapabilities copyWith({bool? dynamicRegistration}) =>
      DocumentHighlightClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client Capabilities for a {@link DocumentSymbolRequest}.
final class DocumentSymbolClientCapabilities {
  const DocumentSymbolClientCapabilities({
    this.dynamicRegistration,
    this.symbolKind,
    this.hierarchicalDocumentSymbolSupport,
    this.tagSupport,
    this.labelSupport,
  });

  factory DocumentSymbolClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DocumentSymbolClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    symbolKind: json['symbolKind'] == null
        ? null
        : DocumentSymbolClientCapabilitiesSymbolKind.fromJson(
            json['symbolKind'] as Map<String, Object?>,
          ),
    hierarchicalDocumentSymbolSupport:
        json['hierarchicalDocumentSymbolSupport'] as bool?,
    tagSupport: json['tagSupport'] == null
        ? null
        : DocumentSymbolClientCapabilitiesTagSupport.fromJson(
            json['tagSupport'] as Map<String, Object?>,
          ),
    labelSupport: json['labelSupport'] as bool?,
  );

  final bool? dynamicRegistration;

  final DocumentSymbolClientCapabilitiesSymbolKind? symbolKind;

  final bool? hierarchicalDocumentSymbolSupport;

  final DocumentSymbolClientCapabilitiesTagSupport? tagSupport;

  final bool? labelSupport;

  DocumentSymbolClientCapabilities copyWith({
    bool? dynamicRegistration,
    DocumentSymbolClientCapabilitiesSymbolKind? symbolKind,
    bool? hierarchicalDocumentSymbolSupport,
    DocumentSymbolClientCapabilitiesTagSupport? tagSupport,
    bool? labelSupport,
  }) => DocumentSymbolClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    symbolKind: symbolKind ?? this.symbolKind,
    hierarchicalDocumentSymbolSupport:
        hierarchicalDocumentSymbolSupport ??
        this.hierarchicalDocumentSymbolSupport,
    tagSupport: tagSupport ?? this.tagSupport,
    labelSupport: labelSupport ?? this.labelSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'symbolKind': symbolKind?.toJson(),
      'hierarchicalDocumentSymbolSupport': hierarchicalDocumentSymbolSupport,
      'tagSupport': tagSupport?.toJson(),
      'labelSupport': labelSupport,
    };
  }
}

/// The Client Capabilities of a {@link CodeActionRequest}.
final class CodeActionClientCapabilities {
  const CodeActionClientCapabilities({
    this.dynamicRegistration,
    this.codeActionLiteralSupport,
    this.isPreferredSupport,
    this.disabledSupport,
    this.dataSupport,
    this.resolveSupport,
    this.honorsChangeAnnotations,
  });

  factory CodeActionClientCapabilities.fromJson(Map<String, Object?> json) =>
      CodeActionClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        codeActionLiteralSupport: json['codeActionLiteralSupport'] == null
            ? null
            : CodeActionClientCapabilitiesCodeActionLiteralSupport.fromJson(
                json['codeActionLiteralSupport'] as Map<String, Object?>,
              ),
        isPreferredSupport: json['isPreferredSupport'] as bool?,
        disabledSupport: json['disabledSupport'] as bool?,
        dataSupport: json['dataSupport'] as bool?,
        resolveSupport: json['resolveSupport'] == null
            ? null
            : CodeActionClientCapabilitiesResolveSupport.fromJson(
                json['resolveSupport'] as Map<String, Object?>,
              ),
        honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
      );

  final bool? dynamicRegistration;

  final CodeActionClientCapabilitiesCodeActionLiteralSupport?
  codeActionLiteralSupport;

  final bool? isPreferredSupport;

  final bool? disabledSupport;

  final bool? dataSupport;

  final CodeActionClientCapabilitiesResolveSupport? resolveSupport;

  final bool? honorsChangeAnnotations;

  CodeActionClientCapabilities copyWith({
    bool? dynamicRegistration,
    CodeActionClientCapabilitiesCodeActionLiteralSupport?
    codeActionLiteralSupport,
    bool? isPreferredSupport,
    bool? disabledSupport,
    bool? dataSupport,
    CodeActionClientCapabilitiesResolveSupport? resolveSupport,
    bool? honorsChangeAnnotations,
  }) => CodeActionClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    codeActionLiteralSupport:
        codeActionLiteralSupport ?? this.codeActionLiteralSupport,
    isPreferredSupport: isPreferredSupport ?? this.isPreferredSupport,
    disabledSupport: disabledSupport ?? this.disabledSupport,
    dataSupport: dataSupport ?? this.dataSupport,
    resolveSupport: resolveSupport ?? this.resolveSupport,
    honorsChangeAnnotations:
        honorsChangeAnnotations ?? this.honorsChangeAnnotations,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'codeActionLiteralSupport': codeActionLiteralSupport?.toJson(),
      'isPreferredSupport': isPreferredSupport,
      'disabledSupport': disabledSupport,
      'dataSupport': dataSupport,
      'resolveSupport': resolveSupport?.toJson(),
      'honorsChangeAnnotations': honorsChangeAnnotations,
    };
  }
}

/// The client capabilities  of a {@link CodeLensRequest}.
final class CodeLensClientCapabilities {
  const CodeLensClientCapabilities({this.dynamicRegistration});

  factory CodeLensClientCapabilities.fromJson(Map<String, Object?> json) =>
      CodeLensClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  final bool? dynamicRegistration;

  CodeLensClientCapabilities copyWith({bool? dynamicRegistration}) =>
      CodeLensClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// The client capabilities of a {@link DocumentLinkRequest}.
final class DocumentLinkClientCapabilities {
  const DocumentLinkClientCapabilities({
    this.dynamicRegistration,
    this.tooltipSupport,
  });

  factory DocumentLinkClientCapabilities.fromJson(Map<String, Object?> json) =>
      DocumentLinkClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        tooltipSupport: json['tooltipSupport'] as bool?,
      );

  final bool? dynamicRegistration;

  final bool? tooltipSupport;

  DocumentLinkClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? tooltipSupport,
  }) => DocumentLinkClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    tooltipSupport: tooltipSupport ?? this.tooltipSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'tooltipSupport': tooltipSupport,
    };
  }
}

final class DocumentColorClientCapabilities {
  const DocumentColorClientCapabilities({this.dynamicRegistration});

  factory DocumentColorClientCapabilities.fromJson(Map<String, Object?> json) =>
      DocumentColorClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  final bool? dynamicRegistration;

  DocumentColorClientCapabilities copyWith({bool? dynamicRegistration}) =>
      DocumentColorClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities of a {@link DocumentFormattingRequest}.
final class DocumentFormattingClientCapabilities {
  const DocumentFormattingClientCapabilities({this.dynamicRegistration});

  factory DocumentFormattingClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DocumentFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  DocumentFormattingClientCapabilities copyWith({bool? dynamicRegistration}) =>
      DocumentFormattingClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingClientCapabilities {
  const DocumentRangeFormattingClientCapabilities({
    this.dynamicRegistration,
    this.rangesSupport,
  });

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DocumentRangeFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    rangesSupport: json['rangesSupport'] as bool?,
  );

  final bool? dynamicRegistration;

  final bool? rangesSupport;

  DocumentRangeFormattingClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? rangesSupport,
  }) => DocumentRangeFormattingClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    rangesSupport: rangesSupport ?? this.rangesSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'rangesSupport': rangesSupport,
    };
  }
}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingClientCapabilities {
  const DocumentOnTypeFormattingClientCapabilities({this.dynamicRegistration});

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => DocumentOnTypeFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  DocumentOnTypeFormattingClientCapabilities copyWith({
    bool? dynamicRegistration,
  }) => DocumentOnTypeFormattingClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

final class RenameClientCapabilities {
  const RenameClientCapabilities({
    this.dynamicRegistration,
    this.prepareSupport,
    this.prepareSupportDefaultBehavior,
    this.honorsChangeAnnotations,
  });

  factory RenameClientCapabilities.fromJson(Map<String, Object?> json) =>
      RenameClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        prepareSupport: json['prepareSupport'] as bool?,
        prepareSupportDefaultBehavior:
            json['prepareSupportDefaultBehavior'] == null
            ? null
            : PrepareSupportDefaultBehavior.values.firstWhere(
                (e) => e.value == json['prepareSupportDefaultBehavior'] as int,
              ),
        honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
      );

  final bool? dynamicRegistration;

  final bool? prepareSupport;

  final PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior;

  final bool? honorsChangeAnnotations;

  RenameClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? prepareSupport,
    PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior,
    bool? honorsChangeAnnotations,
  }) => RenameClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    prepareSupport: prepareSupport ?? this.prepareSupport,
    prepareSupportDefaultBehavior:
        prepareSupportDefaultBehavior ?? this.prepareSupportDefaultBehavior,
    honorsChangeAnnotations:
        honorsChangeAnnotations ?? this.honorsChangeAnnotations,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'prepareSupport': prepareSupport,
      'prepareSupportDefaultBehavior': prepareSupportDefaultBehavior?.value,
      'honorsChangeAnnotations': honorsChangeAnnotations,
    };
  }
}

final class FoldingRangeClientCapabilities {
  const FoldingRangeClientCapabilities({
    this.dynamicRegistration,
    this.rangeLimit,
    this.lineFoldingOnly,
    this.foldingRangeKind,
    this.foldingRange,
  });

  factory FoldingRangeClientCapabilities.fromJson(Map<String, Object?> json) =>
      FoldingRangeClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        rangeLimit: json['rangeLimit'] as int?,
        lineFoldingOnly: json['lineFoldingOnly'] as bool?,
        foldingRangeKind: json['foldingRangeKind'] == null
            ? null
            : FoldingRangeClientCapabilitiesFoldingRangeKind.fromJson(
                json['foldingRangeKind'] as Map<String, Object?>,
              ),
        foldingRange: json['foldingRange'] == null
            ? null
            : FoldingRangeClientCapabilitiesFoldingRange.fromJson(
                json['foldingRange'] as Map<String, Object?>,
              ),
      );

  final bool? dynamicRegistration;

  final int? rangeLimit;

  final bool? lineFoldingOnly;

  final FoldingRangeClientCapabilitiesFoldingRangeKind? foldingRangeKind;

  final FoldingRangeClientCapabilitiesFoldingRange? foldingRange;

  FoldingRangeClientCapabilities copyWith({
    bool? dynamicRegistration,
    int? rangeLimit,
    bool? lineFoldingOnly,
    FoldingRangeClientCapabilitiesFoldingRangeKind? foldingRangeKind,
    FoldingRangeClientCapabilitiesFoldingRange? foldingRange,
  }) => FoldingRangeClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    rangeLimit: rangeLimit ?? this.rangeLimit,
    lineFoldingOnly: lineFoldingOnly ?? this.lineFoldingOnly,
    foldingRangeKind: foldingRangeKind ?? this.foldingRangeKind,
    foldingRange: foldingRange ?? this.foldingRange,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'rangeLimit': rangeLimit,
      'lineFoldingOnly': lineFoldingOnly,
      'foldingRangeKind': foldingRangeKind?.toJson(),
      'foldingRange': foldingRange?.toJson(),
    };
  }
}

final class SelectionRangeClientCapabilities {
  const SelectionRangeClientCapabilities({this.dynamicRegistration});

  factory SelectionRangeClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => SelectionRangeClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  SelectionRangeClientCapabilities copyWith({bool? dynamicRegistration}) =>
      SelectionRangeClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// The publish diagnostic client capabilities.
final class PublishDiagnosticsClientCapabilities {
  const PublishDiagnosticsClientCapabilities({
    this.relatedInformation,
    this.tagSupport,
    this.versionSupport,
    this.codeDescriptionSupport,
    this.dataSupport,
  });

  factory PublishDiagnosticsClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => PublishDiagnosticsClientCapabilities(
    relatedInformation: json['relatedInformation'] as bool?,
    tagSupport: json['tagSupport'] == null
        ? null
        : PublishDiagnosticsClientCapabilitiesTagSupport.fromJson(
            json['tagSupport'] as Map<String, Object?>,
          ),
    versionSupport: json['versionSupport'] as bool?,
    codeDescriptionSupport: json['codeDescriptionSupport'] as bool?,
    dataSupport: json['dataSupport'] as bool?,
  );

  final bool? relatedInformation;

  final PublishDiagnosticsClientCapabilitiesTagSupport? tagSupport;

  final bool? versionSupport;

  final bool? codeDescriptionSupport;

  final bool? dataSupport;

  PublishDiagnosticsClientCapabilities copyWith({
    bool? relatedInformation,
    PublishDiagnosticsClientCapabilitiesTagSupport? tagSupport,
    bool? versionSupport,
    bool? codeDescriptionSupport,
    bool? dataSupport,
  }) => PublishDiagnosticsClientCapabilities(
    relatedInformation: relatedInformation ?? this.relatedInformation,
    tagSupport: tagSupport ?? this.tagSupport,
    versionSupport: versionSupport ?? this.versionSupport,
    codeDescriptionSupport:
        codeDescriptionSupport ?? this.codeDescriptionSupport,
    dataSupport: dataSupport ?? this.dataSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'relatedInformation': relatedInformation,
      'tagSupport': tagSupport?.toJson(),
      'versionSupport': versionSupport,
      'codeDescriptionSupport': codeDescriptionSupport,
      'dataSupport': dataSupport,
    };
  }
}

/// @since 3.16.0
final class CallHierarchyClientCapabilities {
  const CallHierarchyClientCapabilities({this.dynamicRegistration});

  factory CallHierarchyClientCapabilities.fromJson(Map<String, Object?> json) =>
      CallHierarchyClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  final bool? dynamicRegistration;

  CallHierarchyClientCapabilities copyWith({bool? dynamicRegistration}) =>
      CallHierarchyClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.16.0
final class SemanticTokensClientCapabilities {
  const SemanticTokensClientCapabilities({
    this.dynamicRegistration,
    required this.requests,
    required this.tokenTypes,
    required this.tokenModifiers,
    required this.formats,
    this.overlappingTokenSupport,
    this.multilineTokenSupport,
    this.serverCancelSupport,
    this.augmentsSyntaxTokens,
  });

  factory SemanticTokensClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    requests: SemanticTokensClientCapabilitiesRequests.fromJson(
      json['requests'] as Map<String, Object?>,
    ),
    tokenTypes: (json['tokenTypes'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
    tokenModifiers: (json['tokenModifiers'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
    formats: (json['formats'] as List<Object?>)
        .map((e) => e as TokenFormat)
        .toList(),
    overlappingTokenSupport: json['overlappingTokenSupport'] as bool?,
    multilineTokenSupport: json['multilineTokenSupport'] as bool?,
    serverCancelSupport: json['serverCancelSupport'] as bool?,
    augmentsSyntaxTokens: json['augmentsSyntaxTokens'] as bool?,
  );

  final bool? dynamicRegistration;

  final SemanticTokensClientCapabilitiesRequests requests;

  final List<String> tokenTypes;

  final List<String> tokenModifiers;

  final List<TokenFormat> formats;

  final bool? overlappingTokenSupport;

  final bool? multilineTokenSupport;

  final bool? serverCancelSupport;

  final bool? augmentsSyntaxTokens;

  SemanticTokensClientCapabilities copyWith({
    bool? dynamicRegistration,
    SemanticTokensClientCapabilitiesRequests? requests,
    List<String>? tokenTypes,
    List<String>? tokenModifiers,
    List<TokenFormat>? formats,
    bool? overlappingTokenSupport,
    bool? multilineTokenSupport,
    bool? serverCancelSupport,
    bool? augmentsSyntaxTokens,
  }) => SemanticTokensClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    requests: requests ?? this.requests,
    tokenTypes: tokenTypes ?? this.tokenTypes,
    tokenModifiers: tokenModifiers ?? this.tokenModifiers,
    formats: formats ?? this.formats,
    overlappingTokenSupport:
        overlappingTokenSupport ?? this.overlappingTokenSupport,
    multilineTokenSupport: multilineTokenSupport ?? this.multilineTokenSupport,
    serverCancelSupport: serverCancelSupport ?? this.serverCancelSupport,
    augmentsSyntaxTokens: augmentsSyntaxTokens ?? this.augmentsSyntaxTokens,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'requests': requests.toJson(),
      'tokenTypes': tokenTypes,
      'tokenModifiers': tokenModifiers,
      'formats': formats,
      'overlappingTokenSupport': overlappingTokenSupport,
      'multilineTokenSupport': multilineTokenSupport,
      'serverCancelSupport': serverCancelSupport,
      'augmentsSyntaxTokens': augmentsSyntaxTokens,
    };
  }
}

/// Client capabilities for the linked editing range request.
///
/// @since 3.16.0
final class LinkedEditingRangeClientCapabilities {
  const LinkedEditingRangeClientCapabilities({this.dynamicRegistration});

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => LinkedEditingRangeClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  LinkedEditingRangeClientCapabilities copyWith({bool? dynamicRegistration}) =>
      LinkedEditingRangeClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities specific to the moniker request.
///
/// @since 3.16.0
final class MonikerClientCapabilities {
  const MonikerClientCapabilities({this.dynamicRegistration});

  factory MonikerClientCapabilities.fromJson(Map<String, Object?> json) =>
      MonikerClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  final bool? dynamicRegistration;

  MonikerClientCapabilities copyWith({bool? dynamicRegistration}) =>
      MonikerClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.17.0
final class TypeHierarchyClientCapabilities {
  const TypeHierarchyClientCapabilities({this.dynamicRegistration});

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, Object?> json) =>
      TypeHierarchyClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  final bool? dynamicRegistration;

  TypeHierarchyClientCapabilities copyWith({bool? dynamicRegistration}) =>
      TypeHierarchyClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities specific to inline values.
///
/// @since 3.17.0
final class InlineValueClientCapabilities {
  const InlineValueClientCapabilities({this.dynamicRegistration});

  factory InlineValueClientCapabilities.fromJson(Map<String, Object?> json) =>
      InlineValueClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  final bool? dynamicRegistration;

  InlineValueClientCapabilities copyWith({bool? dynamicRegistration}) =>
      InlineValueClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Inlay hint client capabilities.
///
/// @since 3.17.0
final class InlayHintClientCapabilities {
  const InlayHintClientCapabilities({
    this.dynamicRegistration,
    this.resolveSupport,
  });

  factory InlayHintClientCapabilities.fromJson(Map<String, Object?> json) =>
      InlayHintClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        resolveSupport: json['resolveSupport'] == null
            ? null
            : InlayHintClientCapabilitiesResolveSupport.fromJson(
                json['resolveSupport'] as Map<String, Object?>,
              ),
      );

  final bool? dynamicRegistration;

  final InlayHintClientCapabilitiesResolveSupport? resolveSupport;

  InlayHintClientCapabilities copyWith({
    bool? dynamicRegistration,
    InlayHintClientCapabilitiesResolveSupport? resolveSupport,
  }) => InlayHintClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    resolveSupport: resolveSupport ?? this.resolveSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'resolveSupport': resolveSupport?.toJson(),
    };
  }
}

/// Client capabilities specific to diagnostic pull requests.
///
/// @since 3.17.0
final class DiagnosticClientCapabilities {
  const DiagnosticClientCapabilities({
    this.dynamicRegistration,
    this.relatedDocumentSupport,
  });

  factory DiagnosticClientCapabilities.fromJson(Map<String, Object?> json) =>
      DiagnosticClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        relatedDocumentSupport: json['relatedDocumentSupport'] as bool?,
      );

  final bool? dynamicRegistration;

  final bool? relatedDocumentSupport;

  DiagnosticClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? relatedDocumentSupport,
  }) => DiagnosticClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    relatedDocumentSupport:
        relatedDocumentSupport ?? this.relatedDocumentSupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'relatedDocumentSupport': relatedDocumentSupport,
    };
  }
}

/// Client capabilities specific to inline completions.
///
/// @since 3.18.0
/// @proposed
final class InlineCompletionClientCapabilities {
  const InlineCompletionClientCapabilities({this.dynamicRegistration});

  factory InlineCompletionClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => InlineCompletionClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  final bool? dynamicRegistration;

  InlineCompletionClientCapabilities copyWith({bool? dynamicRegistration}) =>
      InlineCompletionClientCapabilities(
        dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Notebook specific client capabilities.
///
/// @since 3.17.0
final class NotebookDocumentSyncClientCapabilities {
  const NotebookDocumentSyncClientCapabilities({
    this.dynamicRegistration,
    this.executionSummarySupport,
  });

  factory NotebookDocumentSyncClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentSyncClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    executionSummarySupport: json['executionSummarySupport'] as bool?,
  );

  final bool? dynamicRegistration;

  final bool? executionSummarySupport;

  NotebookDocumentSyncClientCapabilities copyWith({
    bool? dynamicRegistration,
    bool? executionSummarySupport,
  }) => NotebookDocumentSyncClientCapabilities(
    dynamicRegistration: dynamicRegistration ?? this.dynamicRegistration,
    executionSummarySupport:
        executionSummarySupport ?? this.executionSummarySupport,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'executionSummarySupport': executionSummarySupport,
    };
  }
}

/// Show message request client capabilities
final class ShowMessageRequestClientCapabilities {
  const ShowMessageRequestClientCapabilities({this.messageActionItem});

  factory ShowMessageRequestClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => ShowMessageRequestClientCapabilities(
    messageActionItem: json['messageActionItem'] == null
        ? null
        : ShowMessageRequestClientCapabilitiesMessageActionItem.fromJson(
            json['messageActionItem'] as Map<String, Object?>,
          ),
  );

  final ShowMessageRequestClientCapabilitiesMessageActionItem?
  messageActionItem;

  ShowMessageRequestClientCapabilities copyWith({
    ShowMessageRequestClientCapabilitiesMessageActionItem? messageActionItem,
  }) => ShowMessageRequestClientCapabilities(
    messageActionItem: messageActionItem ?? this.messageActionItem,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'messageActionItem': messageActionItem?.toJson()};
  }
}

/// Client capabilities for the showDocument request.
///
/// @since 3.16.0
final class ShowDocumentClientCapabilities {
  const ShowDocumentClientCapabilities({required this.support});

  factory ShowDocumentClientCapabilities.fromJson(Map<String, Object?> json) =>
      ShowDocumentClientCapabilities(support: json['support'] as bool);

  final bool support;

  ShowDocumentClientCapabilities copyWith({bool? support}) =>
      ShowDocumentClientCapabilities(support: support ?? this.support);

  Map<String, Object?> toJson() {
    return <String, Object?>{'support': support};
  }
}

/// Client capabilities specific to regular expressions.
///
/// @since 3.16.0
final class RegularExpressionsClientCapabilities {
  const RegularExpressionsClientCapabilities({
    required this.engine,
    this.version,
  });

  factory RegularExpressionsClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) => RegularExpressionsClientCapabilities(
    engine: json['engine'] as String,
    version: json['version'] as String?,
  );

  final String engine;

  final String? version;

  RegularExpressionsClientCapabilities copyWith({
    String? engine,
    String? version,
  }) => RegularExpressionsClientCapabilities(
    engine: engine ?? this.engine,
    version: version ?? this.version,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'engine': engine, 'version': version};
  }
}

/// Client capabilities specific to the used markdown parser.
///
/// @since 3.16.0
final class MarkdownClientCapabilities {
  const MarkdownClientCapabilities({
    required this.parser,
    this.version,
    this.allowedTags,
  });

  factory MarkdownClientCapabilities.fromJson(Map<String, Object?> json) =>
      MarkdownClientCapabilities(
        parser: json['parser'] as String,
        version: json['version'] as String?,
        allowedTags: (json['allowedTags'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
      );

  final String parser;

  final String? version;

  final List<String>? allowedTags;

  MarkdownClientCapabilities copyWith({
    String? parser,
    String? version,
    List<String>? allowedTags,
  }) => MarkdownClientCapabilities(
    parser: parser ?? this.parser,
    version: version ?? this.version,
    allowedTags: allowedTags ?? this.allowedTags,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'parser': parser,
      'version': version,
      'allowedTags': allowedTags,
    };
  }
}
