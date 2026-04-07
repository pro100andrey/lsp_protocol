// GENERATED — do not edit.

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enumerations.dart';
import 'scalar_unions.dart';
import 'type_aliases.dart';
import 'unions.dart';

part 'structures.freezed.dart';

@freezed
abstract class InitializeResultServerInfo with _$InitializeResultServerInfo {
  const InitializeResultServerInfo._();

  const factory InitializeResultServerInfo({
    required String name,
    String? version,
  }) = _InitializeResultServerInfo;

  static InitializeResultServerInfo fromJson(Map<String, Object?> json) =>
      InitializeResultServerInfo(
        name: json['name'] as String,
        version: json['version'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'name': name, 'version': version};
  }
}

@freezed
abstract class CompletionListItemDefaults with _$CompletionListItemDefaults {
  const CompletionListItemDefaults._();

  const factory CompletionListItemDefaults({
    List<String>? commitCharacters,
    Object? editRange,
    InsertTextFormat? insertTextFormat,
    InsertTextMode? insertTextMode,
    LSPAny? data,
  }) = _CompletionListItemDefaults;

  static CompletionListItemDefaults fromJson(Map<String, Object?> json) =>
      CompletionListItemDefaults(
        commitCharacters: (json['commitCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        editRange: json['editRange'],
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
        data: json['data'],
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

@freezed
abstract class CompletionListItemDefaultsEditRange
    with _$CompletionListItemDefaultsEditRange {
  const CompletionListItemDefaultsEditRange._();

  const factory CompletionListItemDefaultsEditRange({
    required Range insert,
    required Range replace,
  }) = _CompletionListItemDefaultsEditRange;

  static CompletionListItemDefaultsEditRange fromJson(
    Map<String, Object?> json,
  ) => CompletionListItemDefaultsEditRange(
    insert: Range.fromJson(json['insert'] as Map<String, Object?>),
    replace: Range.fromJson(json['replace'] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'insert': insert.toJson(),
      'replace': replace.toJson(),
    };
  }
}

@freezed
abstract class CodeActionDisabled with _$CodeActionDisabled {
  const CodeActionDisabled._();

  const factory CodeActionDisabled({required String reason}) =
      _CodeActionDisabled;

  static CodeActionDisabled fromJson(Map<String, Object?> json) =>
      CodeActionDisabled(reason: json['reason'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'reason': reason};
  }
}

@freezed
abstract class WorkspaceSymbolLocation with _$WorkspaceSymbolLocation {
  const WorkspaceSymbolLocation._();

  const factory WorkspaceSymbolLocation({required String uri}) =
      _WorkspaceSymbolLocation;

  static WorkspaceSymbolLocation fromJson(Map<String, Object?> json) =>
      WorkspaceSymbolLocation(uri: json['uri'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

@freezed
abstract class SemanticTokensOptionsRange with _$SemanticTokensOptionsRange {
  const SemanticTokensOptionsRange._();

  const factory SemanticTokensOptionsRange() = _SemanticTokensOptionsRange;

  static SemanticTokensOptionsRange fromJson(Map<String, Object?> json) =>
      SemanticTokensOptionsRange();

  Map<String, Object?> toJson() {
    return <String, Object?>{};
  }
}

@freezed
abstract class SemanticTokensOptionsFull with _$SemanticTokensOptionsFull {
  const SemanticTokensOptionsFull._();

  const factory SemanticTokensOptionsFull({bool? delta}) =
      _SemanticTokensOptionsFull;

  static SemanticTokensOptionsFull fromJson(Map<String, Object?> json) =>
      SemanticTokensOptionsFull(delta: json['delta'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'delta': delta};
  }
}

@freezed
abstract class NotebookDocumentChangeEventCells
    with _$NotebookDocumentChangeEventCells {
  const NotebookDocumentChangeEventCells._();

  const factory NotebookDocumentChangeEventCells({
    NotebookDocumentChangeEventCellsStructure? structure,
    List<NotebookCell>? data,
    List<NotebookDocumentChangeEventCellsTextContent>? textContent,
  }) = _NotebookDocumentChangeEventCells;

  static NotebookDocumentChangeEventCells fromJson(Map<String, Object?> json) =>
      NotebookDocumentChangeEventCells(
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'structure': structure?.toJson(),
      'data': data?.map((e) => e.toJson()).toList(),
      'textContent': textContent?.map((e) => e.toJson()).toList(),
    };
  }
}

@freezed
abstract class NotebookDocumentChangeEventCellsStructure
    with _$NotebookDocumentChangeEventCellsStructure {
  const NotebookDocumentChangeEventCellsStructure._();

  const factory NotebookDocumentChangeEventCellsStructure({
    required NotebookCellArrayChange array,
    List<TextDocumentItem>? didOpen,
    List<TextDocumentIdentifier>? didClose,
  }) = _NotebookDocumentChangeEventCellsStructure;

  static NotebookDocumentChangeEventCellsStructure fromJson(
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'array': array.toJson(),
      'didOpen': didOpen?.map((e) => e.toJson()).toList(),
      'didClose': didClose?.map((e) => e.toJson()).toList(),
    };
  }
}

@freezed
abstract class NotebookDocumentChangeEventCellsTextContent
    with _$NotebookDocumentChangeEventCellsTextContent {
  const NotebookDocumentChangeEventCellsTextContent._();

  const factory NotebookDocumentChangeEventCellsTextContent({
    required VersionedTextDocumentIdentifier document,
    required List<TextDocumentContentChangeEvent> changes,
  }) = _NotebookDocumentChangeEventCellsTextContent;

  static NotebookDocumentChangeEventCellsTextContent fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentChangeEventCellsTextContent(
    document: VersionedTextDocumentIdentifier.fromJson(
      json['document'] as Map<String, Object?>,
    ),
    changes: (json['changes'] as List<Object?>)
        .map((e) => e as TextDocumentContentChangeEvent)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'document': document.toJson(), 'changes': changes};
  }
}

@freezed
abstract class _InitializeParamsClientInfo with _$InitializeParamsClientInfo {
  const _InitializeParamsClientInfo._();

  const factory _InitializeParamsClientInfo({
    required String name,
    String? version,
  }) = __InitializeParamsClientInfo;

  static _InitializeParamsClientInfo fromJson(Map<String, Object?> json) =>
      _InitializeParamsClientInfo(
        name: json['name'] as String,
        version: json['version'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'name': name, 'version': version};
  }
}

@freezed
abstract class ServerCapabilitiesWorkspace with _$ServerCapabilitiesWorkspace {
  const ServerCapabilitiesWorkspace._();

  const factory ServerCapabilitiesWorkspace({
    WorkspaceFoldersServerCapabilities? workspaceFolders,
    FileOperationOptions? fileOperations,
  }) = _ServerCapabilitiesWorkspace;

  static ServerCapabilitiesWorkspace fromJson(Map<String, Object?> json) =>
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workspaceFolders': workspaceFolders?.toJson(),
      'fileOperations': fileOperations?.toJson(),
    };
  }
}

@freezed
abstract class CompletionOptionsCompletionItem
    with _$CompletionOptionsCompletionItem {
  const CompletionOptionsCompletionItem._();

  const factory CompletionOptionsCompletionItem({bool? labelDetailsSupport}) =
      _CompletionOptionsCompletionItem;

  static CompletionOptionsCompletionItem fromJson(Map<String, Object?> json) =>
      CompletionOptionsCompletionItem(
        labelDetailsSupport: json['labelDetailsSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'labelDetailsSupport': labelDetailsSupport};
  }
}

@freezed
abstract class NotebookDocumentSyncOptionsNotebookSelector
    with _$NotebookDocumentSyncOptionsNotebookSelector {
  const NotebookDocumentSyncOptionsNotebookSelector._();

  const factory NotebookDocumentSyncOptionsNotebookSelector({
    required Object notebook,
    List<NotebookDocumentSyncOptionsNotebookSelectorCells>? cells,
  }) = _NotebookDocumentSyncOptionsNotebookSelector;

  static NotebookDocumentSyncOptionsNotebookSelector fromJson(
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebook': notebook,
      'cells': cells?.map((e) => e.toJson()).toList(),
    };
  }
}

@freezed
abstract class NotebookDocumentSyncOptionsNotebookSelectorCells
    with _$NotebookDocumentSyncOptionsNotebookSelectorCells {
  const NotebookDocumentSyncOptionsNotebookSelectorCells._();

  const factory NotebookDocumentSyncOptionsNotebookSelectorCells({
    required String language,
  }) = _NotebookDocumentSyncOptionsNotebookSelectorCells;

  static NotebookDocumentSyncOptionsNotebookSelectorCells fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentSyncOptionsNotebookSelectorCells(
    language: json['language'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'language': language};
  }
}

@freezed
abstract class GeneralClientCapabilitiesStaleRequestSupport
    with _$GeneralClientCapabilitiesStaleRequestSupport {
  const GeneralClientCapabilitiesStaleRequestSupport._();

  const factory GeneralClientCapabilitiesStaleRequestSupport({
    required bool cancel,
    required List<String> retryOnContentModified,
  }) = _GeneralClientCapabilitiesStaleRequestSupport;

  static GeneralClientCapabilitiesStaleRequestSupport fromJson(
    Map<String, Object?> json,
  ) => GeneralClientCapabilitiesStaleRequestSupport(
    cancel: json['cancel'] as bool,
    retryOnContentModified: (json['retryOnContentModified'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'cancel': cancel,
      'retryOnContentModified': retryOnContentModified,
    };
  }
}

@freezed
abstract class WorkspaceEditClientCapabilitiesChangeAnnotationSupport
    with _$WorkspaceEditClientCapabilitiesChangeAnnotationSupport {
  const WorkspaceEditClientCapabilitiesChangeAnnotationSupport._();

  const factory WorkspaceEditClientCapabilitiesChangeAnnotationSupport({
    bool? groupsOnLabel,
  }) = _WorkspaceEditClientCapabilitiesChangeAnnotationSupport;

  static WorkspaceEditClientCapabilitiesChangeAnnotationSupport fromJson(
    Map<String, Object?> json,
  ) => WorkspaceEditClientCapabilitiesChangeAnnotationSupport(
    groupsOnLabel: json['groupsOnLabel'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'groupsOnLabel': groupsOnLabel};
  }
}

@freezed
abstract class WorkspaceSymbolClientCapabilitiesSymbolKind
    with _$WorkspaceSymbolClientCapabilitiesSymbolKind {
  const WorkspaceSymbolClientCapabilitiesSymbolKind._();

  const factory WorkspaceSymbolClientCapabilitiesSymbolKind({
    List<SymbolKind>? valueSet,
  }) = _WorkspaceSymbolClientCapabilitiesSymbolKind;

  static WorkspaceSymbolClientCapabilitiesSymbolKind fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolClientCapabilitiesSymbolKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as SymbolKind)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class WorkspaceSymbolClientCapabilitiesTagSupport
    with _$WorkspaceSymbolClientCapabilitiesTagSupport {
  const WorkspaceSymbolClientCapabilitiesTagSupport._();

  const factory WorkspaceSymbolClientCapabilitiesTagSupport({
    required List<SymbolTag> valueSet,
  }) = _WorkspaceSymbolClientCapabilitiesTagSupport;

  static WorkspaceSymbolClientCapabilitiesTagSupport fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolClientCapabilitiesTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as SymbolTag)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class WorkspaceSymbolClientCapabilitiesResolveSupport
    with _$WorkspaceSymbolClientCapabilitiesResolveSupport {
  const WorkspaceSymbolClientCapabilitiesResolveSupport._();

  const factory WorkspaceSymbolClientCapabilitiesResolveSupport({
    required List<String> properties,
  }) = _WorkspaceSymbolClientCapabilitiesResolveSupport;

  static WorkspaceSymbolClientCapabilitiesResolveSupport fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolClientCapabilitiesResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

@freezed
abstract class CompletionClientCapabilitiesCompletionItem
    with _$CompletionClientCapabilitiesCompletionItem {
  const CompletionClientCapabilitiesCompletionItem._();

  const factory CompletionClientCapabilitiesCompletionItem({
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
  }) = _CompletionClientCapabilitiesCompletionItem;

  static CompletionClientCapabilitiesCompletionItem fromJson(
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

@freezed
abstract class CompletionClientCapabilitiesCompletionItemTagSupport
    with _$CompletionClientCapabilitiesCompletionItemTagSupport {
  const CompletionClientCapabilitiesCompletionItemTagSupport._();

  const factory CompletionClientCapabilitiesCompletionItemTagSupport({
    required List<CompletionItemTag> valueSet,
  }) = _CompletionClientCapabilitiesCompletionItemTagSupport;

  static CompletionClientCapabilitiesCompletionItemTagSupport fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItemTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as CompletionItemTag)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class CompletionClientCapabilitiesCompletionItemResolveSupport
    with _$CompletionClientCapabilitiesCompletionItemResolveSupport {
  const CompletionClientCapabilitiesCompletionItemResolveSupport._();

  const factory CompletionClientCapabilitiesCompletionItemResolveSupport({
    required List<String> properties,
  }) = _CompletionClientCapabilitiesCompletionItemResolveSupport;

  static CompletionClientCapabilitiesCompletionItemResolveSupport fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItemResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

@freezed
abstract class CompletionClientCapabilitiesCompletionItemInsertTextModeSupport
    with _$CompletionClientCapabilitiesCompletionItemInsertTextModeSupport {
  const CompletionClientCapabilitiesCompletionItemInsertTextModeSupport._();

  const factory CompletionClientCapabilitiesCompletionItemInsertTextModeSupport({
    required List<InsertTextMode> valueSet,
  }) = _CompletionClientCapabilitiesCompletionItemInsertTextModeSupport;

  static CompletionClientCapabilitiesCompletionItemInsertTextModeSupport
  fromJson(Map<String, Object?> json) =>
      CompletionClientCapabilitiesCompletionItemInsertTextModeSupport(
        valueSet: (json['valueSet'] as List<Object?>)
            .map((e) => e as InsertTextMode)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class CompletionClientCapabilitiesCompletionItemKind
    with _$CompletionClientCapabilitiesCompletionItemKind {
  const CompletionClientCapabilitiesCompletionItemKind._();

  const factory CompletionClientCapabilitiesCompletionItemKind({
    List<CompletionItemKind>? valueSet,
  }) = _CompletionClientCapabilitiesCompletionItemKind;

  static CompletionClientCapabilitiesCompletionItemKind fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionItemKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as CompletionItemKind)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class CompletionClientCapabilitiesCompletionList
    with _$CompletionClientCapabilitiesCompletionList {
  const CompletionClientCapabilitiesCompletionList._();

  const factory CompletionClientCapabilitiesCompletionList({
    List<String>? itemDefaults,
  }) = _CompletionClientCapabilitiesCompletionList;

  static CompletionClientCapabilitiesCompletionList fromJson(
    Map<String, Object?> json,
  ) => CompletionClientCapabilitiesCompletionList(
    itemDefaults: (json['itemDefaults'] as List<Object?>?)
        ?.map((e) => e as String)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'itemDefaults': itemDefaults};
  }
}

@freezed
abstract class SignatureHelpClientCapabilitiesSignatureInformation
    with _$SignatureHelpClientCapabilitiesSignatureInformation {
  const SignatureHelpClientCapabilitiesSignatureInformation._();

  const factory SignatureHelpClientCapabilitiesSignatureInformation({
    List<MarkupKind>? documentationFormat,
    SignatureHelpClientCapabilitiesSignatureInformationParameterInformation?
    parameterInformation,
    bool? activeParameterSupport,
  }) = _SignatureHelpClientCapabilitiesSignatureInformation;

  static SignatureHelpClientCapabilitiesSignatureInformation fromJson(
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentationFormat': documentationFormat,
      'parameterInformation': parameterInformation?.toJson(),
      'activeParameterSupport': activeParameterSupport,
    };
  }
}

@freezed
abstract class SignatureHelpClientCapabilitiesSignatureInformationParameterInformation
    with
        _$SignatureHelpClientCapabilitiesSignatureInformationParameterInformation {
  const SignatureHelpClientCapabilitiesSignatureInformationParameterInformation._();

  const factory SignatureHelpClientCapabilitiesSignatureInformationParameterInformation({
    bool? labelOffsetSupport,
  }) = _SignatureHelpClientCapabilitiesSignatureInformationParameterInformation;

  static SignatureHelpClientCapabilitiesSignatureInformationParameterInformation
  fromJson(Map<String, Object?> json) =>
      SignatureHelpClientCapabilitiesSignatureInformationParameterInformation(
        labelOffsetSupport: json['labelOffsetSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'labelOffsetSupport': labelOffsetSupport};
  }
}

@freezed
abstract class DocumentSymbolClientCapabilitiesSymbolKind
    with _$DocumentSymbolClientCapabilitiesSymbolKind {
  const DocumentSymbolClientCapabilitiesSymbolKind._();

  const factory DocumentSymbolClientCapabilitiesSymbolKind({
    List<SymbolKind>? valueSet,
  }) = _DocumentSymbolClientCapabilitiesSymbolKind;

  static DocumentSymbolClientCapabilitiesSymbolKind fromJson(
    Map<String, Object?> json,
  ) => DocumentSymbolClientCapabilitiesSymbolKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as SymbolKind)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class DocumentSymbolClientCapabilitiesTagSupport
    with _$DocumentSymbolClientCapabilitiesTagSupport {
  const DocumentSymbolClientCapabilitiesTagSupport._();

  const factory DocumentSymbolClientCapabilitiesTagSupport({
    required List<SymbolTag> valueSet,
  }) = _DocumentSymbolClientCapabilitiesTagSupport;

  static DocumentSymbolClientCapabilitiesTagSupport fromJson(
    Map<String, Object?> json,
  ) => DocumentSymbolClientCapabilitiesTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as SymbolTag)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class CodeActionClientCapabilitiesCodeActionLiteralSupport
    with _$CodeActionClientCapabilitiesCodeActionLiteralSupport {
  const CodeActionClientCapabilitiesCodeActionLiteralSupport._();

  const factory CodeActionClientCapabilitiesCodeActionLiteralSupport({
    required CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind
    codeActionKind,
  }) = _CodeActionClientCapabilitiesCodeActionLiteralSupport;

  static CodeActionClientCapabilitiesCodeActionLiteralSupport fromJson(
    Map<String, Object?> json,
  ) => CodeActionClientCapabilitiesCodeActionLiteralSupport(
    codeActionKind:
        CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind.fromJson(
          json['codeActionKind'] as Map<String, Object?>,
        ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'codeActionKind': codeActionKind.toJson()};
  }
}

@freezed
abstract class CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind
    with _$CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind {
  const CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind._();

  const factory CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind({
    required List<CodeActionKind> valueSet,
  }) = _CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind;

  static CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind
  fromJson(Map<String, Object?> json) =>
      CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind(
        valueSet: (json['valueSet'] as List<Object?>)
            .map((e) => e as CodeActionKind)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class CodeActionClientCapabilitiesResolveSupport
    with _$CodeActionClientCapabilitiesResolveSupport {
  const CodeActionClientCapabilitiesResolveSupport._();

  const factory CodeActionClientCapabilitiesResolveSupport({
    required List<String> properties,
  }) = _CodeActionClientCapabilitiesResolveSupport;

  static CodeActionClientCapabilitiesResolveSupport fromJson(
    Map<String, Object?> json,
  ) => CodeActionClientCapabilitiesResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

@freezed
abstract class FoldingRangeClientCapabilitiesFoldingRangeKind
    with _$FoldingRangeClientCapabilitiesFoldingRangeKind {
  const FoldingRangeClientCapabilitiesFoldingRangeKind._();

  const factory FoldingRangeClientCapabilitiesFoldingRangeKind({
    List<FoldingRangeKind>? valueSet,
  }) = _FoldingRangeClientCapabilitiesFoldingRangeKind;

  static FoldingRangeClientCapabilitiesFoldingRangeKind fromJson(
    Map<String, Object?> json,
  ) => FoldingRangeClientCapabilitiesFoldingRangeKind(
    valueSet: (json['valueSet'] as List<Object?>?)
        ?.map((e) => e as FoldingRangeKind)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class FoldingRangeClientCapabilitiesFoldingRange
    with _$FoldingRangeClientCapabilitiesFoldingRange {
  const FoldingRangeClientCapabilitiesFoldingRange._();

  const factory FoldingRangeClientCapabilitiesFoldingRange({
    bool? collapsedText,
  }) = _FoldingRangeClientCapabilitiesFoldingRange;

  static FoldingRangeClientCapabilitiesFoldingRange fromJson(
    Map<String, Object?> json,
  ) => FoldingRangeClientCapabilitiesFoldingRange(
    collapsedText: json['collapsedText'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'collapsedText': collapsedText};
  }
}

@freezed
abstract class PublishDiagnosticsClientCapabilitiesTagSupport
    with _$PublishDiagnosticsClientCapabilitiesTagSupport {
  const PublishDiagnosticsClientCapabilitiesTagSupport._();

  const factory PublishDiagnosticsClientCapabilitiesTagSupport({
    required List<DiagnosticTag> valueSet,
  }) = _PublishDiagnosticsClientCapabilitiesTagSupport;

  static PublishDiagnosticsClientCapabilitiesTagSupport fromJson(
    Map<String, Object?> json,
  ) => PublishDiagnosticsClientCapabilitiesTagSupport(
    valueSet: (json['valueSet'] as List<Object?>)
        .map((e) => e as DiagnosticTag)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'valueSet': valueSet};
  }
}

@freezed
abstract class SemanticTokensClientCapabilitiesRequests
    with _$SemanticTokensClientCapabilitiesRequests {
  const SemanticTokensClientCapabilitiesRequests._();

  const factory SemanticTokensClientCapabilitiesRequests({
    Object? range,
    Object? full,
  }) = _SemanticTokensClientCapabilitiesRequests;

  static SemanticTokensClientCapabilitiesRequests fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensClientCapabilitiesRequests(
    range: json['range'],
    full: json['full'],
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range, 'full': full};
  }
}

@freezed
abstract class SemanticTokensClientCapabilitiesRequestsRange
    with _$SemanticTokensClientCapabilitiesRequestsRange {
  const SemanticTokensClientCapabilitiesRequestsRange._();

  const factory SemanticTokensClientCapabilitiesRequestsRange() =
      _SemanticTokensClientCapabilitiesRequestsRange;

  static SemanticTokensClientCapabilitiesRequestsRange fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensClientCapabilitiesRequestsRange();

  Map<String, Object?> toJson() {
    return <String, Object?>{};
  }
}

@freezed
abstract class SemanticTokensClientCapabilitiesRequestsFull
    with _$SemanticTokensClientCapabilitiesRequestsFull {
  const SemanticTokensClientCapabilitiesRequestsFull._();

  const factory SemanticTokensClientCapabilitiesRequestsFull({bool? delta}) =
      _SemanticTokensClientCapabilitiesRequestsFull;

  static SemanticTokensClientCapabilitiesRequestsFull fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensClientCapabilitiesRequestsFull(
    delta: json['delta'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'delta': delta};
  }
}

@freezed
abstract class InlayHintClientCapabilitiesResolveSupport
    with _$InlayHintClientCapabilitiesResolveSupport {
  const InlayHintClientCapabilitiesResolveSupport._();

  const factory InlayHintClientCapabilitiesResolveSupport({
    required List<String> properties,
  }) = _InlayHintClientCapabilitiesResolveSupport;

  static InlayHintClientCapabilitiesResolveSupport fromJson(
    Map<String, Object?> json,
  ) => InlayHintClientCapabilitiesResolveSupport(
    properties: (json['properties'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'properties': properties};
  }
}

@freezed
abstract class ShowMessageRequestClientCapabilitiesMessageActionItem
    with _$ShowMessageRequestClientCapabilitiesMessageActionItem {
  const ShowMessageRequestClientCapabilitiesMessageActionItem._();

  const factory ShowMessageRequestClientCapabilitiesMessageActionItem({
    bool? additionalPropertiesSupport,
  }) = _ShowMessageRequestClientCapabilitiesMessageActionItem;

  static ShowMessageRequestClientCapabilitiesMessageActionItem fromJson(
    Map<String, Object?> json,
  ) => ShowMessageRequestClientCapabilitiesMessageActionItem(
    additionalPropertiesSupport: json['additionalPropertiesSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'additionalPropertiesSupport': additionalPropertiesSupport,
    };
  }
}

@freezed
abstract class PrepareRenameResult with _$PrepareRenameResult {
  const PrepareRenameResult._();

  const factory PrepareRenameResult({
    required Range range,
    required String placeholder,
  }) = _PrepareRenameResult;

  static PrepareRenameResult fromJson(Map<String, Object?> json) =>
      PrepareRenameResult(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        placeholder: json['placeholder'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'placeholder': placeholder,
    };
  }
}

@freezed
abstract class TextDocumentContentChangeEvent
    with _$TextDocumentContentChangeEvent {
  const TextDocumentContentChangeEvent._();

  const factory TextDocumentContentChangeEvent({
    required Range range,
    int? rangeLength,
    required String text,
  }) = _TextDocumentContentChangeEvent;

  static TextDocumentContentChangeEvent fromJson(Map<String, Object?> json) =>
      TextDocumentContentChangeEvent(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        rangeLength: json['rangeLength'] as int?,
        text: json['text'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'rangeLength': rangeLength,
      'text': text,
    };
  }
}

@freezed
abstract class MarkedString with _$MarkedString {
  const MarkedString._();

  const factory MarkedString({
    required String language,
    required String value,
  }) = _MarkedString;

  static MarkedString fromJson(Map<String, Object?> json) => MarkedString(
    language: json['language'] as String,
    value: json['value'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'language': language, 'value': value};
  }
}

@freezed
abstract class TextDocumentFilter with _$TextDocumentFilter {
  const TextDocumentFilter._();

  const factory TextDocumentFilter({
    required String language,
    String? scheme,
    String? pattern,
  }) = _TextDocumentFilter;

  static TextDocumentFilter fromJson(Map<String, Object?> json) =>
      TextDocumentFilter(
        language: json['language'] as String,
        scheme: json['scheme'] as String?,
        pattern: json['pattern'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'language': language,
      'scheme': scheme,
      'pattern': pattern,
    };
  }
}

@freezed
abstract class NotebookDocumentFilter with _$NotebookDocumentFilter {
  const NotebookDocumentFilter._();

  const factory NotebookDocumentFilter({
    required String notebookType,
    String? scheme,
    String? pattern,
  }) = _NotebookDocumentFilter;

  static NotebookDocumentFilter fromJson(Map<String, Object?> json) =>
      NotebookDocumentFilter(
        notebookType: json['notebookType'] as String,
        scheme: json['scheme'] as String?,
        pattern: json['pattern'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookType': notebookType,
      'scheme': scheme,
      'pattern': pattern,
    };
  }
}

@freezed
abstract class ImplementationParams with _$ImplementationParams {
  const ImplementationParams._();

  const factory ImplementationParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) = _ImplementationParams;

  static ImplementationParams fromJson(Map<String, Object?> json) =>
      ImplementationParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
    };
  }
}

/// Represents a location inside a resource, such as a line
/// inside a text file.
@freezed
abstract class Location with _$Location {
  const Location._();

  const factory Location({required String uri, required Range range}) =
      _Location;

  static Location fromJson(Map<String, Object?> json) => Location(
    uri: json['uri'] as String,
    range: Range.fromJson(json['range'] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'range': range.toJson()};
  }
}

@freezed
abstract class ImplementationRegistrationOptions
    with _$ImplementationRegistrationOptions {
  const ImplementationRegistrationOptions._();

  const factory ImplementationRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) = _ImplementationRegistrationOptions;

  static ImplementationRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => ImplementationRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

@freezed
abstract class TypeDefinitionParams with _$TypeDefinitionParams {
  const TypeDefinitionParams._();

  const factory TypeDefinitionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) = _TypeDefinitionParams;

  static TypeDefinitionParams fromJson(Map<String, Object?> json) =>
      TypeDefinitionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
    };
  }
}

@freezed
abstract class TypeDefinitionRegistrationOptions
    with _$TypeDefinitionRegistrationOptions {
  const TypeDefinitionRegistrationOptions._();

  const factory TypeDefinitionRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) = _TypeDefinitionRegistrationOptions;

  static TypeDefinitionRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => TypeDefinitionRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
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
@freezed
abstract class WorkspaceFolder with _$WorkspaceFolder {
  const WorkspaceFolder._();

  const factory WorkspaceFolder({required String uri, required String name}) =
      _WorkspaceFolder;

  static WorkspaceFolder fromJson(Map<String, Object?> json) =>
      WorkspaceFolder(uri: json['uri'] as String, name: json['name'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'name': name};
  }
}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
@freezed
abstract class DidChangeWorkspaceFoldersParams
    with _$DidChangeWorkspaceFoldersParams {
  const DidChangeWorkspaceFoldersParams._();

  const factory DidChangeWorkspaceFoldersParams({
    required WorkspaceFoldersChangeEvent event,
  }) = _DidChangeWorkspaceFoldersParams;

  static DidChangeWorkspaceFoldersParams fromJson(Map<String, Object?> json) =>
      DidChangeWorkspaceFoldersParams(
        event: WorkspaceFoldersChangeEvent.fromJson(
          json['event'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'event': event.toJson()};
  }
}

/// The parameters of a configuration request.
@freezed
abstract class ConfigurationParams with _$ConfigurationParams {
  const ConfigurationParams._();

  const factory ConfigurationParams({required List<ConfigurationItem> items}) =
      _ConfigurationParams;

  static ConfigurationParams fromJson(Map<String, Object?> json) =>
      ConfigurationParams(
        items: (json['items'] as List<Object?>)
            .map((e) => ConfigurationItem.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items.map((e) => e.toJson()).toList()};
  }
}

/// Parameters for a {@link DocumentColorRequest}.
@freezed
abstract class DocumentColorParams with _$DocumentColorParams {
  const DocumentColorParams._();

  const factory DocumentColorParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _DocumentColorParams;

  static DocumentColorParams fromJson(Map<String, Object?> json) =>
      DocumentColorParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Represents a color range from a document.
@freezed
abstract class ColorInformation with _$ColorInformation {
  const ColorInformation._();

  const factory ColorInformation({required Range range, required Color color}) =
      _ColorInformation;

  static ColorInformation fromJson(Map<String, Object?> json) =>
      ColorInformation(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        color: Color.fromJson(json['color'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'color': color.toJson()};
  }
}

@freezed
abstract class DocumentColorRegistrationOptions
    with _$DocumentColorRegistrationOptions {
  const DocumentColorRegistrationOptions._();

  const factory DocumentColorRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) = _DocumentColorRegistrationOptions;

  static DocumentColorRegistrationOptions fromJson(Map<String, Object?> json) =>
      DocumentColorRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        id: json['id'] as String?,
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
@freezed
abstract class ColorPresentationParams with _$ColorPresentationParams {
  const ColorPresentationParams._();

  const factory ColorPresentationParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required Color color,
    required Range range,
  }) = _ColorPresentationParams;

  static ColorPresentationParams fromJson(Map<String, Object?> json) =>
      ColorPresentationParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        color: Color.fromJson(json['color'] as Map<String, Object?>),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'color': color.toJson(),
      'range': range.toJson(),
    };
  }
}

@freezed
abstract class ColorPresentation with _$ColorPresentation {
  const ColorPresentation._();

  const factory ColorPresentation({
    required String label,
    TextEdit? textEdit,
    List<TextEdit>? additionalTextEdits,
  }) = _ColorPresentation;

  static ColorPresentation fromJson(Map<String, Object?> json) =>
      ColorPresentation(
        label: json['label'] as String,
        textEdit: json['textEdit'] == null
            ? null
            : TextEdit.fromJson(json['textEdit'] as Map<String, Object?>),
        additionalTextEdits: (json['additionalTextEdits'] as List<Object?>?)
            ?.map((e) => TextEdit.fromJson(e as Map<String, Object?>))
            .toList(),
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

@freezed
abstract class WorkDoneProgressOptions with _$WorkDoneProgressOptions {
  const WorkDoneProgressOptions._();

  const factory WorkDoneProgressOptions({bool? workDoneProgress}) =
      _WorkDoneProgressOptions;

  static WorkDoneProgressOptions fromJson(Map<String, Object?> json) =>
      WorkDoneProgressOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// General text document registration options.
@freezed
abstract class TextDocumentRegistrationOptions
    with _$TextDocumentRegistrationOptions {
  const TextDocumentRegistrationOptions._();

  const factory TextDocumentRegistrationOptions({
    required DocumentSelector? documentSelector,
  }) = _TextDocumentRegistrationOptions;

  static TextDocumentRegistrationOptions fromJson(Map<String, Object?> json) =>
      TextDocumentRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'documentSelector': documentSelector};
  }
}

/// Parameters for a {@link FoldingRangeRequest}.
@freezed
abstract class FoldingRangeParams with _$FoldingRangeParams {
  const FoldingRangeParams._();

  const factory FoldingRangeParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _FoldingRangeParams;

  static FoldingRangeParams fromJson(Map<String, Object?> json) =>
      FoldingRangeParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Represents a folding range. To be valid, start and end line must be bigger than zero and smaller
/// than the number of lines in the document. Clients are free to ignore invalid ranges.
@freezed
abstract class FoldingRange with _$FoldingRange {
  const FoldingRange._();

  const factory FoldingRange({
    required int startLine,
    int? startCharacter,
    required int endLine,
    int? endCharacter,
    FoldingRangeKind? kind,
    String? collapsedText,
  }) = _FoldingRange;

  static FoldingRange fromJson(Map<String, Object?> json) => FoldingRange(
    startLine: json['startLine'] as int,
    startCharacter: json['startCharacter'] as int?,
    endLine: json['endLine'] as int,
    endCharacter: json['endCharacter'] as int?,
    kind: json['kind'] == null
        ? null
        : FoldingRangeKind(json['kind'] as String),
    collapsedText: json['collapsedText'] as String?,
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

@freezed
abstract class FoldingRangeRegistrationOptions
    with _$FoldingRangeRegistrationOptions {
  const FoldingRangeRegistrationOptions._();

  const factory FoldingRangeRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) = _FoldingRangeRegistrationOptions;

  static FoldingRangeRegistrationOptions fromJson(Map<String, Object?> json) =>
      FoldingRangeRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        id: json['id'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'id': id,
    };
  }
}

@freezed
abstract class DeclarationParams with _$DeclarationParams {
  const DeclarationParams._();

  const factory DeclarationParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) = _DeclarationParams;

  static DeclarationParams fromJson(Map<String, Object?> json) =>
      DeclarationParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
    };
  }
}

@freezed
abstract class DeclarationRegistrationOptions
    with _$DeclarationRegistrationOptions {
  const DeclarationRegistrationOptions._();

  const factory DeclarationRegistrationOptions({
    bool? workDoneProgress,
    required DocumentSelector? documentSelector,
    String? id,
  }) = _DeclarationRegistrationOptions;

  static DeclarationRegistrationOptions fromJson(Map<String, Object?> json) =>
      DeclarationRegistrationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        documentSelector: json['documentSelector'] as DocumentSelector?,
        id: json['id'] as String?,
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
@freezed
abstract class SelectionRangeParams with _$SelectionRangeParams {
  const SelectionRangeParams._();

  const factory SelectionRangeParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required List<Position> positions,
  }) = _SelectionRangeParams;

  static SelectionRangeParams fromJson(Map<String, Object?> json) =>
      SelectionRangeParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        positions: (json['positions'] as List<Object?>)
            .map((e) => Position.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'positions': positions.map((e) => e.toJson()).toList(),
    };
  }
}

/// A selection range represents a part of a selection hierarchy. A selection range
/// may have a parent selection range that contains it.
@freezed
abstract class SelectionRange with _$SelectionRange {
  const SelectionRange._();

  const factory SelectionRange({required Range range, SelectionRange? parent}) =
      _SelectionRange;

  static SelectionRange fromJson(Map<String, Object?> json) => SelectionRange(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    parent: json['parent'] == null
        ? null
        : SelectionRange.fromJson(json['parent'] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'range': range.toJson(),
      'parent': parent?.toJson(),
    };
  }
}

@freezed
abstract class SelectionRangeRegistrationOptions
    with _$SelectionRangeRegistrationOptions {
  const SelectionRangeRegistrationOptions._();

  const factory SelectionRangeRegistrationOptions({
    bool? workDoneProgress,
    required DocumentSelector? documentSelector,
    String? id,
  }) = _SelectionRangeRegistrationOptions;

  static SelectionRangeRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => SelectionRangeRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    documentSelector: json['documentSelector'] as DocumentSelector?,
    id: json['id'] as String?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'documentSelector': documentSelector,
      'id': id,
    };
  }
}

@freezed
abstract class WorkDoneProgressCreateParams
    with _$WorkDoneProgressCreateParams {
  const WorkDoneProgressCreateParams._();

  const factory WorkDoneProgressCreateParams({required ProgressToken token}) =
      _WorkDoneProgressCreateParams;

  static WorkDoneProgressCreateParams fromJson(Map<String, Object?> json) =>
      WorkDoneProgressCreateParams(
        token: ProgressToken.fromJson(json['token']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'token': token.toJson()};
  }
}

@freezed
abstract class WorkDoneProgressCancelParams
    with _$WorkDoneProgressCancelParams {
  const WorkDoneProgressCancelParams._();

  const factory WorkDoneProgressCancelParams({required ProgressToken token}) =
      _WorkDoneProgressCancelParams;

  static WorkDoneProgressCancelParams fromJson(Map<String, Object?> json) =>
      WorkDoneProgressCancelParams(
        token: ProgressToken.fromJson(json['token']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'token': token.toJson()};
  }
}

/// The parameter of a `textDocument/prepareCallHierarchy` request.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyPrepareParams with _$CallHierarchyPrepareParams {
  const CallHierarchyPrepareParams._();

  const factory CallHierarchyPrepareParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _CallHierarchyPrepareParams;

  static CallHierarchyPrepareParams fromJson(Map<String, Object?> json) =>
      CallHierarchyPrepareParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
    };
  }
}

/// Represents programming constructs like functions or constructors in the context
/// of call hierarchy.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyItem with _$CallHierarchyItem {
  const CallHierarchyItem._();

  const factory CallHierarchyItem({
    required String name,
    required SymbolKind kind,
    List<SymbolTag>? tags,
    String? detail,
    required String uri,
    required Range range,
    required Range selectionRange,
    LSPAny? data,
  }) = _CallHierarchyItem;

  static CallHierarchyItem fromJson(
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
    data: json['data'],
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
@freezed
abstract class CallHierarchyRegistrationOptions
    with _$CallHierarchyRegistrationOptions {
  const CallHierarchyRegistrationOptions._();

  const factory CallHierarchyRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) = _CallHierarchyRegistrationOptions;

  static CallHierarchyRegistrationOptions fromJson(Map<String, Object?> json) =>
      CallHierarchyRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        id: json['id'] as String?,
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
@freezed
abstract class CallHierarchyIncomingCallsParams
    with _$CallHierarchyIncomingCallsParams {
  const CallHierarchyIncomingCallsParams._();

  const factory CallHierarchyIncomingCallsParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required CallHierarchyItem item,
  }) = _CallHierarchyIncomingCallsParams;

  static CallHierarchyIncomingCallsParams fromJson(Map<String, Object?> json) =>
      CallHierarchyIncomingCallsParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        item: CallHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'item': item.toJson(),
    };
  }
}

/// Represents an incoming call, e.g. a caller of a method or constructor.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyIncomingCall with _$CallHierarchyIncomingCall {
  const CallHierarchyIncomingCall._();

  const factory CallHierarchyIncomingCall({
    required CallHierarchyItem from,
    required List<Range> fromRanges,
  }) = _CallHierarchyIncomingCall;

  static CallHierarchyIncomingCall fromJson(Map<String, Object?> json) =>
      CallHierarchyIncomingCall(
        from: CallHierarchyItem.fromJson(json['from'] as Map<String, Object?>),
        fromRanges: (json['fromRanges'] as List<Object?>)
            .map((e) => Range.fromJson(e as Map<String, Object?>))
            .toList(),
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
@freezed
abstract class CallHierarchyOutgoingCallsParams
    with _$CallHierarchyOutgoingCallsParams {
  const CallHierarchyOutgoingCallsParams._();

  const factory CallHierarchyOutgoingCallsParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required CallHierarchyItem item,
  }) = _CallHierarchyOutgoingCallsParams;

  static CallHierarchyOutgoingCallsParams fromJson(Map<String, Object?> json) =>
      CallHierarchyOutgoingCallsParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        item: CallHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'item': item.toJson(),
    };
  }
}

/// Represents an outgoing call, e.g. calling a getter from a method or a method from a constructor etc.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyOutgoingCall with _$CallHierarchyOutgoingCall {
  const CallHierarchyOutgoingCall._();

  const factory CallHierarchyOutgoingCall({
    required CallHierarchyItem to,
    required List<Range> fromRanges,
  }) = _CallHierarchyOutgoingCall;

  static CallHierarchyOutgoingCall fromJson(Map<String, Object?> json) =>
      CallHierarchyOutgoingCall(
        to: CallHierarchyItem.fromJson(json['to'] as Map<String, Object?>),
        fromRanges: (json['fromRanges'] as List<Object?>)
            .map((e) => Range.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'to': to.toJson(),
      'fromRanges': fromRanges.map((e) => e.toJson()).toList(),
    };
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensParams with _$SemanticTokensParams {
  const SemanticTokensParams._();

  const factory SemanticTokensParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _SemanticTokensParams;

  static SemanticTokensParams fromJson(Map<String, Object?> json) =>
      SemanticTokensParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokens with _$SemanticTokens {
  const SemanticTokens._();

  const factory SemanticTokens({String? resultId, required List<int> data}) =
      _SemanticTokens;

  static SemanticTokens fromJson(Map<String, Object?> json) => SemanticTokens(
    resultId: json['resultId'] as String?,
    data: (json['data'] as List<Object?>).map((e) => e as int).toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'resultId': resultId, 'data': data};
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensPartialResult with _$SemanticTokensPartialResult {
  const SemanticTokensPartialResult._();

  const factory SemanticTokensPartialResult({required List<int> data}) =
      _SemanticTokensPartialResult;

  static SemanticTokensPartialResult fromJson(Map<String, Object?> json) =>
      SemanticTokensPartialResult(
        data: (json['data'] as List<Object?>).map((e) => e as int).toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'data': data};
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensRegistrationOptions
    with _$SemanticTokensRegistrationOptions {
  const SemanticTokensRegistrationOptions._();

  const factory SemanticTokensRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    required SemanticTokensLegend legend,
    Object? range,
    Object? full,
    String? id,
  }) = _SemanticTokensRegistrationOptions;

  static SemanticTokensRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    legend: SemanticTokensLegend.fromJson(
      json['legend'] as Map<String, Object?>,
    ),
    range: json['range'],
    full: json['full'],
    id: json['id'] as String?,
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
@freezed
abstract class SemanticTokensDeltaParams with _$SemanticTokensDeltaParams {
  const SemanticTokensDeltaParams._();

  const factory SemanticTokensDeltaParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required String previousResultId,
  }) = _SemanticTokensDeltaParams;

  static SemanticTokensDeltaParams fromJson(Map<String, Object?> json) =>
      SemanticTokensDeltaParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        previousResultId: json['previousResultId'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'previousResultId': previousResultId,
    };
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDelta with _$SemanticTokensDelta {
  const SemanticTokensDelta._();

  const factory SemanticTokensDelta({
    String? resultId,
    required List<SemanticTokensEdit> edits,
  }) = _SemanticTokensDelta;

  static SemanticTokensDelta fromJson(Map<String, Object?> json) =>
      SemanticTokensDelta(
        resultId: json['resultId'] as String?,
        edits: (json['edits'] as List<Object?>)
            .map((e) => SemanticTokensEdit.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'resultId': resultId,
      'edits': edits.map((e) => e.toJson()).toList(),
    };
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDeltaPartialResult
    with _$SemanticTokensDeltaPartialResult {
  const SemanticTokensDeltaPartialResult._();

  const factory SemanticTokensDeltaPartialResult({
    required List<SemanticTokensEdit> edits,
  }) = _SemanticTokensDeltaPartialResult;

  static SemanticTokensDeltaPartialResult fromJson(Map<String, Object?> json) =>
      SemanticTokensDeltaPartialResult(
        edits: (json['edits'] as List<Object?>)
            .map((e) => SemanticTokensEdit.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'edits': edits.map((e) => e.toJson()).toList()};
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensRangeParams with _$SemanticTokensRangeParams {
  const SemanticTokensRangeParams._();

  const factory SemanticTokensRangeParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
  }) = _SemanticTokensRangeParams;

  static SemanticTokensRangeParams fromJson(Map<String, Object?> json) =>
      SemanticTokensRangeParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
    };
  }
}

/// Params to show a resource in the UI.
///
/// @since 3.16.0
@freezed
abstract class ShowDocumentParams with _$ShowDocumentParams {
  const ShowDocumentParams._();

  const factory ShowDocumentParams({
    required String uri,
    bool? external,
    bool? takeFocus,
    Range? selection,
  }) = _ShowDocumentParams;

  static ShowDocumentParams fromJson(Map<String, Object?> json) =>
      ShowDocumentParams(
        uri: json['uri'] as String,
        external: json['external'] as bool?,
        takeFocus: json['takeFocus'] as bool?,
        selection: json['selection'] == null
            ? null
            : Range.fromJson(json['selection'] as Map<String, Object?>),
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
@freezed
abstract class ShowDocumentResult with _$ShowDocumentResult {
  const ShowDocumentResult._();

  const factory ShowDocumentResult({required bool success}) =
      _ShowDocumentResult;

  static ShowDocumentResult fromJson(Map<String, Object?> json) =>
      ShowDocumentResult(success: json['success'] as bool);

  Map<String, Object?> toJson() {
    return <String, Object?>{'success': success};
  }
}

@freezed
abstract class LinkedEditingRangeParams with _$LinkedEditingRangeParams {
  const LinkedEditingRangeParams._();

  const factory LinkedEditingRangeParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _LinkedEditingRangeParams;

  static LinkedEditingRangeParams fromJson(Map<String, Object?> json) =>
      LinkedEditingRangeParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
    };
  }
}

/// The result of a linked editing range request.
///
/// @since 3.16.0
@freezed
abstract class LinkedEditingRanges with _$LinkedEditingRanges {
  const LinkedEditingRanges._();

  const factory LinkedEditingRanges({
    required List<Range> ranges,
    String? wordPattern,
  }) = _LinkedEditingRanges;

  static LinkedEditingRanges fromJson(Map<String, Object?> json) =>
      LinkedEditingRanges(
        ranges: (json['ranges'] as List<Object?>)
            .map((e) => Range.fromJson(e as Map<String, Object?>))
            .toList(),
        wordPattern: json['wordPattern'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'ranges': ranges.map((e) => e.toJson()).toList(),
      'wordPattern': wordPattern,
    };
  }
}

@freezed
abstract class LinkedEditingRangeRegistrationOptions
    with _$LinkedEditingRangeRegistrationOptions {
  const LinkedEditingRangeRegistrationOptions._();

  const factory LinkedEditingRangeRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) = _LinkedEditingRangeRegistrationOptions;

  static LinkedEditingRangeRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => LinkedEditingRangeRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    id: json['id'] as String?,
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
@freezed
abstract class CreateFilesParams with _$CreateFilesParams {
  const CreateFilesParams._();

  const factory CreateFilesParams({required List<FileCreate> files}) =
      _CreateFilesParams;

  static CreateFilesParams fromJson(Map<String, Object?> json) =>
      CreateFilesParams(
        files: (json['files'] as List<Object?>)
            .map((e) => FileCreate.fromJson(e as Map<String, Object?>))
            .toList(),
      );

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
@freezed
abstract class WorkspaceEdit with _$WorkspaceEdit {
  const WorkspaceEdit._();

  const factory WorkspaceEdit({
    Map<String, List<TextEdit>>? changes,
    List<Object>? documentChanges,
    Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations,
  }) = _WorkspaceEdit;

  static WorkspaceEdit fromJson(Map<String, Object?> json) => WorkspaceEdit(
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
@freezed
abstract class FileOperationRegistrationOptions
    with _$FileOperationRegistrationOptions {
  const FileOperationRegistrationOptions._();

  const factory FileOperationRegistrationOptions({
    required List<FileOperationFilter> filters,
  }) = _FileOperationRegistrationOptions;

  static FileOperationRegistrationOptions fromJson(Map<String, Object?> json) =>
      FileOperationRegistrationOptions(
        filters: (json['filters'] as List<Object?>)
            .map((e) => FileOperationFilter.fromJson(e as Map<String, Object?>))
            .toList(),
      );

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
@freezed
abstract class RenameFilesParams with _$RenameFilesParams {
  const RenameFilesParams._();

  const factory RenameFilesParams({required List<FileRename> files}) =
      _RenameFilesParams;

  static RenameFilesParams fromJson(Map<String, Object?> json) =>
      RenameFilesParams(
        files: (json['files'] as List<Object?>)
            .map((e) => FileRename.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'files': files.map((e) => e.toJson()).toList()};
  }
}

/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
///
/// @since 3.16.0
@freezed
abstract class DeleteFilesParams with _$DeleteFilesParams {
  const DeleteFilesParams._();

  const factory DeleteFilesParams({required List<FileDelete> files}) =
      _DeleteFilesParams;

  static DeleteFilesParams fromJson(Map<String, Object?> json) =>
      DeleteFilesParams(
        files: (json['files'] as List<Object?>)
            .map((e) => FileDelete.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'files': files.map((e) => e.toJson()).toList()};
  }
}

@freezed
abstract class MonikerParams with _$MonikerParams {
  const MonikerParams._();

  const factory MonikerParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) = _MonikerParams;

  static MonikerParams fromJson(Map<String, Object?> json) => MonikerParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    workDoneToken: json['workDoneToken'] == null
        ? null
        : ProgressToken.fromJson(json['workDoneToken']),
    partialResultToken: json['partialResultToken'] == null
        ? null
        : ProgressToken.fromJson(json['partialResultToken']),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
    };
  }
}

/// Moniker definition to match LSIF 0.5 moniker definition.
///
/// @since 3.16.0
@freezed
abstract class Moniker with _$Moniker {
  const Moniker._();

  const factory Moniker({
    required String scheme,
    required String identifier,
    required UniquenessLevel unique,
    MonikerKind? kind,
  }) = _Moniker;

  static Moniker fromJson(Map<String, Object?> json) => Moniker(
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'scheme': scheme,
      'identifier': identifier,
      'unique': unique.value,
      'kind': kind?.value,
    };
  }
}

@freezed
abstract class MonikerRegistrationOptions with _$MonikerRegistrationOptions {
  const MonikerRegistrationOptions._();

  const factory MonikerRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _MonikerRegistrationOptions;

  static MonikerRegistrationOptions fromJson(Map<String, Object?> json) =>
      MonikerRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
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
@freezed
abstract class TypeHierarchyPrepareParams with _$TypeHierarchyPrepareParams {
  const TypeHierarchyPrepareParams._();

  const factory TypeHierarchyPrepareParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _TypeHierarchyPrepareParams;

  static TypeHierarchyPrepareParams fromJson(Map<String, Object?> json) =>
      TypeHierarchyPrepareParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
    };
  }
}

/// @since 3.17.0
@freezed
abstract class TypeHierarchyItem with _$TypeHierarchyItem {
  const TypeHierarchyItem._();

  const factory TypeHierarchyItem({
    required String name,
    required SymbolKind kind,
    List<SymbolTag>? tags,
    String? detail,
    required String uri,
    required Range range,
    required Range selectionRange,
    LSPAny? data,
  }) = _TypeHierarchyItem;

  static TypeHierarchyItem fromJson(
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
    data: json['data'],
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
@freezed
abstract class TypeHierarchyRegistrationOptions
    with _$TypeHierarchyRegistrationOptions {
  const TypeHierarchyRegistrationOptions._();

  const factory TypeHierarchyRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? id,
  }) = _TypeHierarchyRegistrationOptions;

  static TypeHierarchyRegistrationOptions fromJson(Map<String, Object?> json) =>
      TypeHierarchyRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        id: json['id'] as String?,
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
@freezed
abstract class TypeHierarchySupertypesParams
    with _$TypeHierarchySupertypesParams {
  const TypeHierarchySupertypesParams._();

  const factory TypeHierarchySupertypesParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TypeHierarchyItem item,
  }) = _TypeHierarchySupertypesParams;

  static TypeHierarchySupertypesParams fromJson(Map<String, Object?> json) =>
      TypeHierarchySupertypesParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        item: TypeHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'item': item.toJson(),
    };
  }
}

/// The parameter of a `typeHierarchy/subtypes` request.
///
/// @since 3.17.0
@freezed
abstract class TypeHierarchySubtypesParams with _$TypeHierarchySubtypesParams {
  const TypeHierarchySubtypesParams._();

  const factory TypeHierarchySubtypesParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TypeHierarchyItem item,
  }) = _TypeHierarchySubtypesParams;

  static TypeHierarchySubtypesParams fromJson(Map<String, Object?> json) =>
      TypeHierarchySubtypesParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        item: TypeHierarchyItem.fromJson(json['item'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'item': item.toJson(),
    };
  }
}

/// A parameter literal used in inline value requests.
///
/// @since 3.17.0
@freezed
abstract class InlineValueParams with _$InlineValueParams {
  const InlineValueParams._();

  const factory InlineValueParams({
    ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
    required InlineValueContext context,
  }) = _InlineValueParams;

  static InlineValueParams fromJson(Map<String, Object?> json) =>
      InlineValueParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        context: InlineValueContext.fromJson(
          json['context'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
      'context': context.toJson(),
    };
  }
}

/// Inline value options used during static or dynamic registration.
///
/// @since 3.17.0
@freezed
abstract class InlineValueRegistrationOptions
    with _$InlineValueRegistrationOptions {
  const InlineValueRegistrationOptions._();

  const factory InlineValueRegistrationOptions({
    bool? workDoneProgress,
    required DocumentSelector? documentSelector,
    String? id,
  }) = _InlineValueRegistrationOptions;

  static InlineValueRegistrationOptions fromJson(Map<String, Object?> json) =>
      InlineValueRegistrationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        documentSelector: json['documentSelector'] as DocumentSelector?,
        id: json['id'] as String?,
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
@freezed
abstract class InlayHintParams with _$InlayHintParams {
  const InlayHintParams._();

  const factory InlayHintParams({
    ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
  }) = _InlayHintParams;

  static InlayHintParams fromJson(Map<String, Object?> json) => InlayHintParams(
    workDoneToken: json['workDoneToken'] == null
        ? null
        : ProgressToken.fromJson(json['workDoneToken']),
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    range: Range.fromJson(json['range'] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
    };
  }
}

/// Inlay hint information.
///
/// @since 3.17.0
@freezed
abstract class InlayHint with _$InlayHint {
  const InlayHint._();

  const factory InlayHint({
    required Position position,
    required Object label,
    InlayHintKind? kind,
    List<TextEdit>? textEdits,
    Object? tooltip,
    bool? paddingLeft,
    bool? paddingRight,
    LSPAny? data,
  }) = _InlayHint;

  static InlayHint fromJson(Map<String, Object?> json) => InlayHint(
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
    tooltip: json['tooltip'],
    paddingLeft: json['paddingLeft'] as bool?,
    paddingRight: json['paddingRight'] as bool?,
    data: json['data'],
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
@freezed
abstract class InlayHintRegistrationOptions
    with _$InlayHintRegistrationOptions {
  const InlayHintRegistrationOptions._();

  const factory InlayHintRegistrationOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
    required DocumentSelector? documentSelector,
    String? id,
  }) = _InlayHintRegistrationOptions;

  static InlayHintRegistrationOptions fromJson(Map<String, Object?> json) =>
      InlayHintRegistrationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
        documentSelector: json['documentSelector'] as DocumentSelector?,
        id: json['id'] as String?,
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
@freezed
abstract class DocumentDiagnosticParams with _$DocumentDiagnosticParams {
  const DocumentDiagnosticParams._();

  const factory DocumentDiagnosticParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    String? identifier,
    String? previousResultId,
  }) = _DocumentDiagnosticParams;

  static DocumentDiagnosticParams fromJson(Map<String, Object?> json) =>
      DocumentDiagnosticParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        identifier: json['identifier'] as String?,
        previousResultId: json['previousResultId'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'identifier': identifier,
      'previousResultId': previousResultId,
    };
  }
}

/// A partial result for a document diagnostic report.
///
/// @since 3.17.0
@freezed
abstract class DocumentDiagnosticReportPartialResult
    with _$DocumentDiagnosticReportPartialResult {
  const DocumentDiagnosticReportPartialResult._();

  const factory DocumentDiagnosticReportPartialResult({
    required Map<String, Object> relatedDocuments,
  }) = _DocumentDiagnosticReportPartialResult;

  static DocumentDiagnosticReportPartialResult fromJson(
    Map<String, Object?> json,
  ) => DocumentDiagnosticReportPartialResult(
    relatedDocuments: (json['relatedDocuments'] as Map<String, Object?>).map(
      (k, v) => MapEntry(k, v as Object),
    ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'relatedDocuments': relatedDocuments};
  }
}

/// Cancellation data returned from a diagnostic request.
///
/// @since 3.17.0
@freezed
abstract class DiagnosticServerCancellationData
    with _$DiagnosticServerCancellationData {
  const DiagnosticServerCancellationData._();

  const factory DiagnosticServerCancellationData({
    required bool retriggerRequest,
  }) = _DiagnosticServerCancellationData;

  static DiagnosticServerCancellationData fromJson(Map<String, Object?> json) =>
      DiagnosticServerCancellationData(
        retriggerRequest: json['retriggerRequest'] as bool,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'retriggerRequest': retriggerRequest};
  }
}

/// Diagnostic registration options.
///
/// @since 3.17.0
@freezed
abstract class DiagnosticRegistrationOptions
    with _$DiagnosticRegistrationOptions {
  const DiagnosticRegistrationOptions._();

  const factory DiagnosticRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? identifier,
    required bool interFileDependencies,
    required bool workspaceDiagnostics,
    String? id,
  }) = _DiagnosticRegistrationOptions;

  static DiagnosticRegistrationOptions fromJson(Map<String, Object?> json) =>
      DiagnosticRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        identifier: json['identifier'] as String?,
        interFileDependencies: json['interFileDependencies'] as bool,
        workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
        id: json['id'] as String?,
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
@freezed
abstract class WorkspaceDiagnosticParams with _$WorkspaceDiagnosticParams {
  const WorkspaceDiagnosticParams._();

  const factory WorkspaceDiagnosticParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    String? identifier,
    required List<PreviousResultId> previousResultIds,
  }) = _WorkspaceDiagnosticParams;

  static WorkspaceDiagnosticParams fromJson(Map<String, Object?> json) =>
      WorkspaceDiagnosticParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        identifier: json['identifier'] as String?,
        previousResultIds: (json['previousResultIds'] as List<Object?>)
            .map((e) => PreviousResultId.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'identifier': identifier,
      'previousResultIds': previousResultIds.map((e) => e.toJson()).toList(),
    };
  }
}

/// A workspace diagnostic report.
///
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticReport with _$WorkspaceDiagnosticReport {
  const WorkspaceDiagnosticReport._();

  const factory WorkspaceDiagnosticReport({
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReport;

  static WorkspaceDiagnosticReport fromJson(Map<String, Object?> json) =>
      WorkspaceDiagnosticReport(
        items: (json['items'] as List<Object?>)
            .map((e) => e as WorkspaceDocumentDiagnosticReport)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items};
  }
}

/// A partial result for a workspace diagnostic report.
///
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticReportPartialResult
    with _$WorkspaceDiagnosticReportPartialResult {
  const WorkspaceDiagnosticReportPartialResult._();

  const factory WorkspaceDiagnosticReportPartialResult({
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReportPartialResult;

  static WorkspaceDiagnosticReportPartialResult fromJson(
    Map<String, Object?> json,
  ) => WorkspaceDiagnosticReportPartialResult(
    items: (json['items'] as List<Object?>)
        .map((e) => e as WorkspaceDocumentDiagnosticReport)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items};
  }
}

/// The params sent in an open notebook document notification.
///
/// @since 3.17.0
@freezed
abstract class DidOpenNotebookDocumentParams
    with _$DidOpenNotebookDocumentParams {
  const DidOpenNotebookDocumentParams._();

  const factory DidOpenNotebookDocumentParams({
    required NotebookDocument notebookDocument,
    required List<TextDocumentItem> cellTextDocuments,
  }) = _DidOpenNotebookDocumentParams;

  static DidOpenNotebookDocumentParams fromJson(Map<String, Object?> json) =>
      DidOpenNotebookDocumentParams(
        notebookDocument: NotebookDocument.fromJson(
          json['notebookDocument'] as Map<String, Object?>,
        ),
        cellTextDocuments: (json['cellTextDocuments'] as List<Object?>)
            .map((e) => TextDocumentItem.fromJson(e as Map<String, Object?>))
            .toList(),
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
@freezed
abstract class DidChangeNotebookDocumentParams
    with _$DidChangeNotebookDocumentParams {
  const DidChangeNotebookDocumentParams._();

  const factory DidChangeNotebookDocumentParams({
    required VersionedNotebookDocumentIdentifier notebookDocument,
    required NotebookDocumentChangeEvent change,
  }) = _DidChangeNotebookDocumentParams;

  static DidChangeNotebookDocumentParams fromJson(Map<String, Object?> json) =>
      DidChangeNotebookDocumentParams(
        notebookDocument: VersionedNotebookDocumentIdentifier.fromJson(
          json['notebookDocument'] as Map<String, Object?>,
        ),
        change: NotebookDocumentChangeEvent.fromJson(
          json['change'] as Map<String, Object?>,
        ),
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
@freezed
abstract class DidSaveNotebookDocumentParams
    with _$DidSaveNotebookDocumentParams {
  const DidSaveNotebookDocumentParams._();

  const factory DidSaveNotebookDocumentParams({
    required NotebookDocumentIdentifier notebookDocument,
  }) = _DidSaveNotebookDocumentParams;

  static DidSaveNotebookDocumentParams fromJson(Map<String, Object?> json) =>
      DidSaveNotebookDocumentParams(
        notebookDocument: NotebookDocumentIdentifier.fromJson(
          json['notebookDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'notebookDocument': notebookDocument.toJson()};
  }
}

/// The params sent in a close notebook document notification.
///
/// @since 3.17.0
@freezed
abstract class DidCloseNotebookDocumentParams
    with _$DidCloseNotebookDocumentParams {
  const DidCloseNotebookDocumentParams._();

  const factory DidCloseNotebookDocumentParams({
    required NotebookDocumentIdentifier notebookDocument,
    required List<TextDocumentIdentifier> cellTextDocuments,
  }) = _DidCloseNotebookDocumentParams;

  static DidCloseNotebookDocumentParams fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class InlineCompletionParams with _$InlineCompletionParams {
  const InlineCompletionParams._();

  const factory InlineCompletionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    required InlineCompletionContext context,
  }) = _InlineCompletionParams;

  static InlineCompletionParams fromJson(Map<String, Object?> json) =>
      InlineCompletionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        context: InlineCompletionContext.fromJson(
          json['context'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'context': context.toJson(),
    };
  }
}

/// Represents a collection of {@link InlineCompletionItem inline completion items} to be presented in the editor.
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionList with _$InlineCompletionList {
  const InlineCompletionList._();

  const factory InlineCompletionList({
    required List<InlineCompletionItem> items,
  }) = _InlineCompletionList;

  static InlineCompletionList fromJson(Map<String, Object?> json) =>
      InlineCompletionList(
        items: (json['items'] as List<Object?>)
            .map(
              (e) => InlineCompletionItem.fromJson(e as Map<String, Object?>),
            )
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'items': items.map((e) => e.toJson()).toList()};
  }
}

/// An inline completion item represents a text snippet that is proposed inline to complete text that is being typed.
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionItem with _$InlineCompletionItem {
  const InlineCompletionItem._();

  const factory InlineCompletionItem({
    required Object insertText,
    String? filterText,
    Range? range,
    Command? command,
  }) = _InlineCompletionItem;

  static InlineCompletionItem fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class InlineCompletionRegistrationOptions
    with _$InlineCompletionRegistrationOptions {
  const InlineCompletionRegistrationOptions._();

  const factory InlineCompletionRegistrationOptions({
    bool? workDoneProgress,
    required DocumentSelector? documentSelector,
    String? id,
  }) = _InlineCompletionRegistrationOptions;

  static InlineCompletionRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => InlineCompletionRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    documentSelector: json['documentSelector'] as DocumentSelector?,
    id: json['id'] as String?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'documentSelector': documentSelector,
      'id': id,
    };
  }
}

@freezed
abstract class RegistrationParams with _$RegistrationParams {
  const RegistrationParams._();

  const factory RegistrationParams({
    required List<Registration> registrations,
  }) = _RegistrationParams;

  static RegistrationParams fromJson(Map<String, Object?> json) =>
      RegistrationParams(
        registrations: (json['registrations'] as List<Object?>)
            .map((e) => Registration.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'registrations': registrations.map((e) => e.toJson()).toList(),
    };
  }
}

@freezed
abstract class UnregistrationParams with _$UnregistrationParams {
  const UnregistrationParams._();

  const factory UnregistrationParams({
    required List<Unregistration> unregisterations,
  }) = _UnregistrationParams;

  static UnregistrationParams fromJson(Map<String, Object?> json) =>
      UnregistrationParams(
        unregisterations: (json['unregisterations'] as List<Object?>)
            .map((e) => Unregistration.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'unregisterations': unregisterations.map((e) => e.toJson()).toList(),
    };
  }
}

@freezed
abstract class InitializeParams with _$InitializeParams {
  const InitializeParams._();

  const factory InitializeParams({
    ProgressToken? workDoneToken,
    required int? processId,
    _InitializeParamsClientInfo? clientInfo,
    String? locale,
    String? rootPath,
    required String? rootUri,
    required ClientCapabilities capabilities,
    LSPAny? initializationOptions,
    TraceValues? trace,
    List<WorkspaceFolder>? workspaceFolders,
  }) = _InitializeParams;

  static InitializeParams fromJson(Map<String, Object?> json) =>
      InitializeParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
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
        initializationOptions: json['initializationOptions'],
        trace: json['trace'] == null
            ? null
            : TraceValues.values.firstWhere(
                (e) => e.value == json['trace'] as String,
              ),
        workspaceFolders: (json['workspaceFolders'] as List<Object?>?)
            ?.map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
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
@freezed
abstract class InitializeResult with _$InitializeResult {
  const InitializeResult._();

  const factory InitializeResult({
    required ServerCapabilities capabilities,
    InitializeResultServerInfo? serverInfo,
  }) = _InitializeResult;

  static InitializeResult fromJson(Map<String, Object?> json) =>
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'capabilities': capabilities.toJson(),
      'serverInfo': serverInfo?.toJson(),
    };
  }
}

/// The data type of the ResponseError if the
/// initialize request fails.
@freezed
abstract class InitializeError with _$InitializeError {
  const InitializeError._();

  const factory InitializeError({required bool retry}) = _InitializeError;

  static InitializeError fromJson(Map<String, Object?> json) =>
      InitializeError(retry: json['retry'] as bool);

  Map<String, Object?> toJson() {
    return <String, Object?>{'retry': retry};
  }
}

@freezed
abstract class InitializedParams with _$InitializedParams {
  const InitializedParams._();

  const factory InitializedParams() = _InitializedParams;

  static InitializedParams fromJson(Map<String, Object?> json) =>
      InitializedParams();

  Map<String, Object?> toJson() {
    return <String, Object?>{};
  }
}

/// The parameters of a change configuration notification.
@freezed
abstract class DidChangeConfigurationParams
    with _$DidChangeConfigurationParams {
  const DidChangeConfigurationParams._();

  const factory DidChangeConfigurationParams({required LSPAny settings}) =
      _DidChangeConfigurationParams;

  static DidChangeConfigurationParams fromJson(Map<String, Object?> json) =>
      DidChangeConfigurationParams(settings: json['settings'] as LSPAny);

  Map<String, Object?> toJson() {
    return <String, Object?>{'settings': settings};
  }
}

@freezed
abstract class DidChangeConfigurationRegistrationOptions
    with _$DidChangeConfigurationRegistrationOptions {
  const DidChangeConfigurationRegistrationOptions._();

  const factory DidChangeConfigurationRegistrationOptions({Object? section}) =
      _DidChangeConfigurationRegistrationOptions;

  static DidChangeConfigurationRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => DidChangeConfigurationRegistrationOptions(section: json['section']);

  Map<String, Object?> toJson() {
    return <String, Object?>{'section': section};
  }
}

/// The parameters of a notification message.
@freezed
abstract class ShowMessageParams with _$ShowMessageParams {
  const ShowMessageParams._();

  const factory ShowMessageParams({
    required MessageType type,
    required String message,
  }) = _ShowMessageParams;

  static ShowMessageParams fromJson(Map<String, Object?> json) =>
      ShowMessageParams(
        type: MessageType.values.firstWhere(
          (e) => e.value == json['type'] as int,
        ),
        message: json['message'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'type': type.value, 'message': message};
  }
}

@freezed
abstract class ShowMessageRequestParams with _$ShowMessageRequestParams {
  const ShowMessageRequestParams._();

  const factory ShowMessageRequestParams({
    required MessageType type,
    required String message,
    List<MessageActionItem>? actions,
  }) = _ShowMessageRequestParams;

  static ShowMessageRequestParams fromJson(Map<String, Object?> json) =>
      ShowMessageRequestParams(
        type: MessageType.values.firstWhere(
          (e) => e.value == json['type'] as int,
        ),
        message: json['message'] as String,
        actions: (json['actions'] as List<Object?>?)
            ?.map((e) => MessageActionItem.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'type': type.value,
      'message': message,
      'actions': actions?.map((e) => e.toJson()).toList(),
    };
  }
}

@freezed
abstract class MessageActionItem with _$MessageActionItem {
  const MessageActionItem._();

  const factory MessageActionItem({required String title}) = _MessageActionItem;

  static MessageActionItem fromJson(Map<String, Object?> json) =>
      MessageActionItem(title: json['title'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'title': title};
  }
}

/// The log message parameters.
@freezed
abstract class LogMessageParams with _$LogMessageParams {
  const LogMessageParams._();

  const factory LogMessageParams({
    required MessageType type,
    required String message,
  }) = _LogMessageParams;

  static LogMessageParams fromJson(Map<String, Object?> json) =>
      LogMessageParams(
        type: MessageType.values.firstWhere(
          (e) => e.value == json['type'] as int,
        ),
        message: json['message'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'type': type.value, 'message': message};
  }
}

/// The parameters sent in an open text document notification
@freezed
abstract class DidOpenTextDocumentParams with _$DidOpenTextDocumentParams {
  const DidOpenTextDocumentParams._();

  const factory DidOpenTextDocumentParams({
    required TextDocumentItem textDocument,
  }) = _DidOpenTextDocumentParams;

  static DidOpenTextDocumentParams fromJson(Map<String, Object?> json) =>
      DidOpenTextDocumentParams(
        textDocument: TextDocumentItem.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'textDocument': textDocument.toJson()};
  }
}

/// The change text document notification's parameters.
@freezed
abstract class DidChangeTextDocumentParams with _$DidChangeTextDocumentParams {
  const DidChangeTextDocumentParams._();

  const factory DidChangeTextDocumentParams({
    required VersionedTextDocumentIdentifier textDocument,
    required List<TextDocumentContentChangeEvent> contentChanges,
  }) = _DidChangeTextDocumentParams;

  static DidChangeTextDocumentParams fromJson(Map<String, Object?> json) =>
      DidChangeTextDocumentParams(
        textDocument: VersionedTextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        contentChanges: (json['contentChanges'] as List<Object?>)
            .map((e) => e as TextDocumentContentChangeEvent)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'contentChanges': contentChanges,
    };
  }
}

/// Describe options to be used when registered for text document change events.
@freezed
abstract class TextDocumentChangeRegistrationOptions
    with _$TextDocumentChangeRegistrationOptions {
  const TextDocumentChangeRegistrationOptions._();

  const factory TextDocumentChangeRegistrationOptions({
    required DocumentSelector? documentSelector,
    required TextDocumentSyncKind syncKind,
  }) = _TextDocumentChangeRegistrationOptions;

  static TextDocumentChangeRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => TextDocumentChangeRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    syncKind: TextDocumentSyncKind.values.firstWhere(
      (e) => e.value == json['syncKind'] as int,
    ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'syncKind': syncKind.value,
    };
  }
}

/// The parameters sent in a close text document notification
@freezed
abstract class DidCloseTextDocumentParams with _$DidCloseTextDocumentParams {
  const DidCloseTextDocumentParams._();

  const factory DidCloseTextDocumentParams({
    required TextDocumentIdentifier textDocument,
  }) = _DidCloseTextDocumentParams;

  static DidCloseTextDocumentParams fromJson(Map<String, Object?> json) =>
      DidCloseTextDocumentParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'textDocument': textDocument.toJson()};
  }
}

/// The parameters sent in a save text document notification
@freezed
abstract class DidSaveTextDocumentParams with _$DidSaveTextDocumentParams {
  const DidSaveTextDocumentParams._();

  const factory DidSaveTextDocumentParams({
    required TextDocumentIdentifier textDocument,
    String? text,
  }) = _DidSaveTextDocumentParams;

  static DidSaveTextDocumentParams fromJson(Map<String, Object?> json) =>
      DidSaveTextDocumentParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        text: json['text'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'text': text,
    };
  }
}

/// Save registration options.
@freezed
abstract class TextDocumentSaveRegistrationOptions
    with _$TextDocumentSaveRegistrationOptions {
  const TextDocumentSaveRegistrationOptions._();

  const factory TextDocumentSaveRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? includeText,
  }) = _TextDocumentSaveRegistrationOptions;

  static TextDocumentSaveRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => TextDocumentSaveRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    includeText: json['includeText'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'includeText': includeText,
    };
  }
}

/// The parameters sent in a will save text document notification.
@freezed
abstract class WillSaveTextDocumentParams with _$WillSaveTextDocumentParams {
  const WillSaveTextDocumentParams._();

  const factory WillSaveTextDocumentParams({
    required TextDocumentIdentifier textDocument,
    required TextDocumentSaveReason reason,
  }) = _WillSaveTextDocumentParams;

  static WillSaveTextDocumentParams fromJson(Map<String, Object?> json) =>
      WillSaveTextDocumentParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        reason: TextDocumentSaveReason.values.firstWhere(
          (e) => e.value == json['reason'] as int,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'reason': reason.value,
    };
  }
}

/// A text edit applicable to a text document.
@freezed
abstract class TextEdit with _$TextEdit {
  const TextEdit._();

  const factory TextEdit({required Range range, required String newText}) =
      _TextEdit;

  static TextEdit fromJson(Map<String, Object?> json) => TextEdit(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    newText: json['newText'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'newText': newText};
  }
}

/// The watched files change notification's parameters.
@freezed
abstract class DidChangeWatchedFilesParams with _$DidChangeWatchedFilesParams {
  const DidChangeWatchedFilesParams._();

  const factory DidChangeWatchedFilesParams({
    required List<FileEvent> changes,
  }) = _DidChangeWatchedFilesParams;

  static DidChangeWatchedFilesParams fromJson(Map<String, Object?> json) =>
      DidChangeWatchedFilesParams(
        changes: (json['changes'] as List<Object?>)
            .map((e) => FileEvent.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'changes': changes.map((e) => e.toJson()).toList(),
    };
  }
}

/// Describe options to be used when registered for text document change events.
@freezed
abstract class DidChangeWatchedFilesRegistrationOptions
    with _$DidChangeWatchedFilesRegistrationOptions {
  const DidChangeWatchedFilesRegistrationOptions._();

  const factory DidChangeWatchedFilesRegistrationOptions({
    required List<FileSystemWatcher> watchers,
  }) = _DidChangeWatchedFilesRegistrationOptions;

  static DidChangeWatchedFilesRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => DidChangeWatchedFilesRegistrationOptions(
    watchers: (json['watchers'] as List<Object?>)
        .map((e) => FileSystemWatcher.fromJson(e as Map<String, Object?>))
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'watchers': watchers.map((e) => e.toJson()).toList(),
    };
  }
}

/// The publish diagnostic notification's parameters.
@freezed
abstract class PublishDiagnosticsParams with _$PublishDiagnosticsParams {
  const PublishDiagnosticsParams._();

  const factory PublishDiagnosticsParams({
    required String uri,
    int? version,
    required List<Diagnostic> diagnostics,
  }) = _PublishDiagnosticsParams;

  static PublishDiagnosticsParams fromJson(Map<String, Object?> json) =>
      PublishDiagnosticsParams(
        uri: json['uri'] as String,
        version: json['version'] as int?,
        diagnostics: (json['diagnostics'] as List<Object?>)
            .map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
            .toList(),
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
@freezed
abstract class CompletionParams with _$CompletionParams {
  const CompletionParams._();

  const factory CompletionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    CompletionContext? context,
  }) = _CompletionParams;

  static CompletionParams fromJson(Map<String, Object?> json) =>
      CompletionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        context: json['context'] == null
            ? null
            : CompletionContext.fromJson(
                json['context'] as Map<String, Object?>,
              ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'context': context?.toJson(),
    };
  }
}

/// A completion item represents a text snippet that is
/// proposed to complete text that is being typed.
@freezed
abstract class CompletionItem with _$CompletionItem {
  const CompletionItem._();

  const factory CompletionItem({
    required String label,
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
  }) = _CompletionItem;

  static CompletionItem fromJson(Map<String, Object?> json) => CompletionItem(
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
    documentation: json['documentation'],
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
    textEdit: json['textEdit'],
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
    data: json['data'],
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
@freezed
abstract class CompletionList with _$CompletionList {
  const CompletionList._();

  const factory CompletionList({
    required bool isIncomplete,
    CompletionListItemDefaults? itemDefaults,
    required List<CompletionItem> items,
  }) = _CompletionList;

  static CompletionList fromJson(Map<String, Object?> json) => CompletionList(
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'isIncomplete': isIncomplete,
      'itemDefaults': itemDefaults?.toJson(),
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

/// Registration options for a {@link CompletionRequest}.
@freezed
abstract class CompletionRegistrationOptions
    with _$CompletionRegistrationOptions {
  const CompletionRegistrationOptions._();

  const factory CompletionRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? allCommitCharacters,
    bool? resolveProvider,
    CompletionOptionsCompletionItem? completionItem,
  }) = _CompletionRegistrationOptions;

  static CompletionRegistrationOptions fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class HoverParams with _$HoverParams {
  const HoverParams._();

  const factory HoverParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _HoverParams;

  static HoverParams fromJson(Map<String, Object?> json) => HoverParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    workDoneToken: json['workDoneToken'] == null
        ? null
        : ProgressToken.fromJson(json['workDoneToken']),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
    };
  }
}

/// The result of a hover request.
@freezed
abstract class Hover with _$Hover {
  const Hover._();

  const factory Hover({required Object contents, Range? range}) = _Hover;

  static Hover fromJson(Map<String, Object?> json) => Hover(
    contents: json['contents'] as Object,
    range: json['range'] == null
        ? null
        : Range.fromJson(json['range'] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'contents': contents, 'range': range?.toJson()};
  }
}

/// Registration options for a {@link HoverRequest}.
@freezed
abstract class HoverRegistrationOptions with _$HoverRegistrationOptions {
  const HoverRegistrationOptions._();

  const factory HoverRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _HoverRegistrationOptions;

  static HoverRegistrationOptions fromJson(Map<String, Object?> json) =>
      HoverRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpParams with _$SignatureHelpParams {
  const SignatureHelpParams._();

  const factory SignatureHelpParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    SignatureHelpContext? context,
  }) = _SignatureHelpParams;

  static SignatureHelpParams fromJson(Map<String, Object?> json) =>
      SignatureHelpParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        context: json['context'] == null
            ? null
            : SignatureHelpContext.fromJson(
                json['context'] as Map<String, Object?>,
              ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'context': context?.toJson(),
    };
  }
}

/// Signature help represents the signature of something
/// callable. There can be multiple signature but only one
/// active and only one active parameter.
@freezed
abstract class SignatureHelp with _$SignatureHelp {
  const SignatureHelp._();

  const factory SignatureHelp({
    required List<SignatureInformation> signatures,
    int? activeSignature,
    int? activeParameter,
  }) = _SignatureHelp;

  static SignatureHelp fromJson(Map<String, Object?> json) => SignatureHelp(
    signatures: (json['signatures'] as List<Object?>)
        .map((e) => SignatureInformation.fromJson(e as Map<String, Object?>))
        .toList(),
    activeSignature: json['activeSignature'] as int?,
    activeParameter: json['activeParameter'] as int?,
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
@freezed
abstract class SignatureHelpRegistrationOptions
    with _$SignatureHelpRegistrationOptions {
  const SignatureHelpRegistrationOptions._();

  const factory SignatureHelpRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? retriggerCharacters,
  }) = _SignatureHelpRegistrationOptions;

  static SignatureHelpRegistrationOptions fromJson(Map<String, Object?> json) =>
      SignatureHelpRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        triggerCharacters: (json['triggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        retriggerCharacters: (json['retriggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
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
@freezed
abstract class DefinitionParams with _$DefinitionParams {
  const DefinitionParams._();

  const factory DefinitionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) = _DefinitionParams;

  static DefinitionParams fromJson(Map<String, Object?> json) =>
      DefinitionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
    };
  }
}

/// Registration options for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionRegistrationOptions
    with _$DefinitionRegistrationOptions {
  const DefinitionRegistrationOptions._();

  const factory DefinitionRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _DefinitionRegistrationOptions;

  static DefinitionRegistrationOptions fromJson(Map<String, Object?> json) =>
      DefinitionRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceParams with _$ReferenceParams {
  const ReferenceParams._();

  const factory ReferenceParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required ReferenceContext context,
  }) = _ReferenceParams;

  static ReferenceParams fromJson(Map<String, Object?> json) => ReferenceParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    workDoneToken: json['workDoneToken'] == null
        ? null
        : ProgressToken.fromJson(json['workDoneToken']),
    partialResultToken: json['partialResultToken'] == null
        ? null
        : ProgressToken.fromJson(json['partialResultToken']),
    context: ReferenceContext.fromJson(json['context'] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'context': context.toJson(),
    };
  }
}

/// Registration options for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceRegistrationOptions
    with _$ReferenceRegistrationOptions {
  const ReferenceRegistrationOptions._();

  const factory ReferenceRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _ReferenceRegistrationOptions;

  static ReferenceRegistrationOptions fromJson(Map<String, Object?> json) =>
      ReferenceRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightParams with _$DocumentHighlightParams {
  const DocumentHighlightParams._();

  const factory DocumentHighlightParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
  }) = _DocumentHighlightParams;

  static DocumentHighlightParams fromJson(Map<String, Object?> json) =>
      DocumentHighlightParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
    };
  }
}

/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
@freezed
abstract class DocumentHighlight with _$DocumentHighlight {
  const DocumentHighlight._();

  const factory DocumentHighlight({
    required Range range,
    DocumentHighlightKind? kind,
  }) = _DocumentHighlight;

  static DocumentHighlight fromJson(Map<String, Object?> json) =>
      DocumentHighlight(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        kind: json['kind'] == null
            ? null
            : DocumentHighlightKind.values.firstWhere(
                (e) => e.value == json['kind'] as int,
              ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'kind': kind?.value};
  }
}

/// Registration options for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightRegistrationOptions
    with _$DocumentHighlightRegistrationOptions {
  const DocumentHighlightRegistrationOptions._();

  const factory DocumentHighlightRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _DocumentHighlightRegistrationOptions;

  static DocumentHighlightRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => DocumentHighlightRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolParams with _$DocumentSymbolParams {
  const DocumentSymbolParams._();

  const factory DocumentSymbolParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _DocumentSymbolParams;

  static DocumentSymbolParams fromJson(Map<String, Object?> json) =>
      DocumentSymbolParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Represents information about programming constructs like variables, classes,
/// interfaces etc.
@freezed
abstract class SymbolInformation with _$SymbolInformation {
  const SymbolInformation._();

  const factory SymbolInformation({
    required String name,
    required SymbolKind kind,
    List<SymbolTag>? tags,
    String? containerName,
    bool? deprecated,
    required Location location,
  }) = _SymbolInformation;

  static SymbolInformation fromJson(
    Map<String, Object?> json,
  ) => SymbolInformation(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    containerName: json['containerName'] as String?,
    deprecated: json['deprecated'] as bool?,
    location: Location.fromJson(json['location'] as Map<String, Object?>),
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
@freezed
abstract class DocumentSymbol with _$DocumentSymbol {
  const DocumentSymbol._();

  const factory DocumentSymbol({
    required String name,
    String? detail,
    required SymbolKind kind,
    List<SymbolTag>? tags,
    bool? deprecated,
    required Range range,
    required Range selectionRange,
    List<DocumentSymbol>? children,
  }) = _DocumentSymbol;

  static DocumentSymbol fromJson(Map<String, Object?> json) => DocumentSymbol(
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
@freezed
abstract class DocumentSymbolRegistrationOptions
    with _$DocumentSymbolRegistrationOptions {
  const DocumentSymbolRegistrationOptions._();

  const factory DocumentSymbolRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    String? label,
  }) = _DocumentSymbolRegistrationOptions;

  static DocumentSymbolRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => DocumentSymbolRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    label: json['label'] as String?,
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
@freezed
abstract class CodeActionParams with _$CodeActionParams {
  const CodeActionParams._();

  const factory CodeActionParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
    required CodeActionContext context,
  }) = _CodeActionParams;

  static CodeActionParams fromJson(Map<String, Object?> json) =>
      CodeActionParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        context: CodeActionContext.fromJson(
          json['context'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
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
@freezed
abstract class Command with _$Command {
  const Command._();

  const factory Command({
    required String title,
    required String command,
    List<LSPAny>? arguments,
  }) = _Command;

  static Command fromJson(Map<String, Object?> json) => Command(
    title: json['title'] as String,
    command: json['command'] as String,
    arguments: (json['arguments'] as List<Object?>?)
        ?.map((e) => e as LSPAny)
        .toList(),
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
@freezed
abstract class CodeAction with _$CodeAction {
  const CodeAction._();

  const factory CodeAction({
    required String title,
    CodeActionKind? kind,
    List<Diagnostic>? diagnostics,
    bool? isPreferred,
    CodeActionDisabled? disabled,
    WorkspaceEdit? edit,
    Command? command,
    LSPAny? data,
  }) = _CodeAction;

  static CodeAction fromJson(Map<String, Object?> json) => CodeAction(
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
    data: json['data'],
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
@freezed
abstract class CodeActionRegistrationOptions
    with _$CodeActionRegistrationOptions {
  const CodeActionRegistrationOptions._();

  const factory CodeActionRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    List<CodeActionKind>? codeActionKinds,
    bool? resolveProvider,
  }) = _CodeActionRegistrationOptions;

  static CodeActionRegistrationOptions fromJson(Map<String, Object?> json) =>
      CodeActionRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        codeActionKinds: (json['codeActionKinds'] as List<Object?>?)
            ?.map((e) => e as CodeActionKind)
            .toList(),
        resolveProvider: json['resolveProvider'] as bool?,
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
@freezed
abstract class WorkspaceSymbolParams with _$WorkspaceSymbolParams {
  const WorkspaceSymbolParams._();

  const factory WorkspaceSymbolParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required String query,
  }) = _WorkspaceSymbolParams;

  static WorkspaceSymbolParams fromJson(Map<String, Object?> json) =>
      WorkspaceSymbolParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        query: json['query'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'query': query,
    };
  }
}

/// A special workspace symbol that supports locations without a range.
///
/// See also SymbolInformation.
///
/// @since 3.17.0
@freezed
abstract class WorkspaceSymbol with _$WorkspaceSymbol {
  const WorkspaceSymbol._();

  const factory WorkspaceSymbol({
    required String name,
    required SymbolKind kind,
    List<SymbolTag>? tags,
    String? containerName,
    required Object location,
    LSPAny? data,
  }) = _WorkspaceSymbol;

  static WorkspaceSymbol fromJson(Map<String, Object?> json) => WorkspaceSymbol(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    containerName: json['containerName'] as String?,
    location: json['location'] as Object,
    data: json['data'],
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
@freezed
abstract class WorkspaceSymbolRegistrationOptions
    with _$WorkspaceSymbolRegistrationOptions {
  const WorkspaceSymbolRegistrationOptions._();

  const factory WorkspaceSymbolRegistrationOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _WorkspaceSymbolRegistrationOptions;

  static WorkspaceSymbolRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => WorkspaceSymbolRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    resolveProvider: json['resolveProvider'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// The parameters of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensParams with _$CodeLensParams {
  const CodeLensParams._();

  const factory CodeLensParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _CodeLensParams;

  static CodeLensParams fromJson(Map<String, Object?> json) => CodeLensParams(
    workDoneToken: json['workDoneToken'] == null
        ? null
        : ProgressToken.fromJson(json['workDoneToken']),
    partialResultToken: json['partialResultToken'] == null
        ? null
        : ProgressToken.fromJson(json['partialResultToken']),
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

/// A code lens represents a {@link Command command} that should be shown along with
/// source text, like the number of references, a way to run tests, etc.
///
/// A code lens is _unresolved_ when no command is associated to it. For performance
/// reasons the creation of a code lens and resolving should be done in two stages.
@freezed
abstract class CodeLens with _$CodeLens {
  const CodeLens._();

  const factory CodeLens({
    required Range range,
    Command? command,
    LSPAny? data,
  }) = _CodeLens;

  static CodeLens fromJson(Map<String, Object?> json) => CodeLens(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, Object?>),
    data: json['data'],
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
@freezed
abstract class CodeLensRegistrationOptions with _$CodeLensRegistrationOptions {
  const CodeLensRegistrationOptions._();

  const factory CodeLensRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _CodeLensRegistrationOptions;

  static CodeLensRegistrationOptions fromJson(Map<String, Object?> json) =>
      CodeLensRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
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
@freezed
abstract class DocumentLinkParams with _$DocumentLinkParams {
  const DocumentLinkParams._();

  const factory DocumentLinkParams({
    ProgressToken? workDoneToken,
    ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _DocumentLinkParams;

  static DocumentLinkParams fromJson(Map<String, Object?> json) =>
      DocumentLinkParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'partialResultToken': partialResultToken?.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

/// A document link is a range in a text document that links to an internal or external resource, like another
/// text document or a web site.
@freezed
abstract class DocumentLink with _$DocumentLink {
  const DocumentLink._();

  const factory DocumentLink({
    required Range range,
    String? target,
    String? tooltip,
    LSPAny? data,
  }) = _DocumentLink;

  static DocumentLink fromJson(Map<String, Object?> json) => DocumentLink(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    target: json['target'] as String?,
    tooltip: json['tooltip'] as String?,
    data: json['data'],
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
@freezed
abstract class DocumentLinkRegistrationOptions
    with _$DocumentLinkRegistrationOptions {
  const DocumentLinkRegistrationOptions._();

  const factory DocumentLinkRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _DocumentLinkRegistrationOptions;

  static DocumentLinkRegistrationOptions fromJson(Map<String, Object?> json) =>
      DocumentLinkRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
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
@freezed
abstract class DocumentFormattingParams with _$DocumentFormattingParams {
  const DocumentFormattingParams._();

  const factory DocumentFormattingParams({
    ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required FormattingOptions options,
  }) = _DocumentFormattingParams;

  static DocumentFormattingParams fromJson(Map<String, Object?> json) =>
      DocumentFormattingParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        options: FormattingOptions.fromJson(
          json['options'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'options': options.toJson(),
    };
  }
}

/// Registration options for a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingRegistrationOptions
    with _$DocumentFormattingRegistrationOptions {
  const DocumentFormattingRegistrationOptions._();

  const factory DocumentFormattingRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _DocumentFormattingRegistrationOptions;

  static DocumentFormattingRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => DocumentFormattingRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingParams
    with _$DocumentRangeFormattingParams {
  const DocumentRangeFormattingParams._();

  const factory DocumentRangeFormattingParams({
    ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
    required FormattingOptions options,
  }) = _DocumentRangeFormattingParams;

  static DocumentRangeFormattingParams fromJson(Map<String, Object?> json) =>
      DocumentRangeFormattingParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        options: FormattingOptions.fromJson(
          json['options'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'range': range.toJson(),
      'options': options.toJson(),
    };
  }
}

/// Registration options for a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingRegistrationOptions
    with _$DocumentRangeFormattingRegistrationOptions {
  const DocumentRangeFormattingRegistrationOptions._();

  const factory DocumentRangeFormattingRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? rangesSupport,
  }) = _DocumentRangeFormattingRegistrationOptions;

  static DocumentRangeFormattingRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => DocumentRangeFormattingRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    workDoneProgress: json['workDoneProgress'] as bool?,
    rangesSupport: json['rangesSupport'] as bool?,
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
@freezed
abstract class DocumentRangesFormattingParams
    with _$DocumentRangesFormattingParams {
  const DocumentRangesFormattingParams._();

  const factory DocumentRangesFormattingParams({
    ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required List<Range> ranges,
    required FormattingOptions options,
  }) = _DocumentRangesFormattingParams;

  static DocumentRangesFormattingParams fromJson(Map<String, Object?> json) =>
      DocumentRangesFormattingParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'ranges': ranges.map((e) => e.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingParams
    with _$DocumentOnTypeFormattingParams {
  const DocumentOnTypeFormattingParams._();

  const factory DocumentOnTypeFormattingParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    required String ch,
    required FormattingOptions options,
  }) = _DocumentOnTypeFormattingParams;

  static DocumentOnTypeFormattingParams fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class DocumentOnTypeFormattingRegistrationOptions
    with _$DocumentOnTypeFormattingRegistrationOptions {
  const DocumentOnTypeFormattingRegistrationOptions._();

  const factory DocumentOnTypeFormattingRegistrationOptions({
    required DocumentSelector? documentSelector,
    required String firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingRegistrationOptions;

  static DocumentOnTypeFormattingRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => DocumentOnTypeFormattingRegistrationOptions(
    documentSelector: json['documentSelector'] as DocumentSelector?,
    firstTriggerCharacter: json['firstTriggerCharacter'] as String,
    moreTriggerCharacter: (json['moreTriggerCharacter'] as List<Object?>?)
        ?.map((e) => e as String)
        .toList(),
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
@freezed
abstract class RenameParams with _$RenameParams {
  const RenameParams._();

  const factory RenameParams({
    ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Position position,
    required String newName,
  }) = _RenameParams;

  static RenameParams fromJson(Map<String, Object?> json) => RenameParams(
    workDoneToken: json['workDoneToken'] == null
        ? null
        : ProgressToken.fromJson(json['workDoneToken']),
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, Object?>,
    ),
    position: Position.fromJson(json['position'] as Map<String, Object?>),
    newName: json['newName'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'newName': newName,
    };
  }
}

/// Registration options for a {@link RenameRequest}.
@freezed
abstract class RenameRegistrationOptions with _$RenameRegistrationOptions {
  const RenameRegistrationOptions._();

  const factory RenameRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
    bool? prepareProvider,
  }) = _RenameRegistrationOptions;

  static RenameRegistrationOptions fromJson(Map<String, Object?> json) =>
      RenameRegistrationOptions(
        documentSelector: json['documentSelector'] as DocumentSelector?,
        workDoneProgress: json['workDoneProgress'] as bool?,
        prepareProvider: json['prepareProvider'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
      'prepareProvider': prepareProvider,
    };
  }
}

@freezed
abstract class PrepareRenameParams with _$PrepareRenameParams {
  const PrepareRenameParams._();

  const factory PrepareRenameParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _PrepareRenameParams;

  static PrepareRenameParams fromJson(Map<String, Object?> json) =>
      PrepareRenameParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
      'workDoneToken': workDoneToken?.toJson(),
    };
  }
}

/// The parameters of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandParams with _$ExecuteCommandParams {
  const ExecuteCommandParams._();

  const factory ExecuteCommandParams({
    ProgressToken? workDoneToken,
    required String command,
    List<LSPAny>? arguments,
  }) = _ExecuteCommandParams;

  static ExecuteCommandParams fromJson(Map<String, Object?> json) =>
      ExecuteCommandParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
        command: json['command'] as String,
        arguments: (json['arguments'] as List<Object?>?)
            ?.map((e) => e as LSPAny)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneToken': workDoneToken?.toJson(),
      'command': command,
      'arguments': arguments,
    };
  }
}

/// Registration options for a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandRegistrationOptions
    with _$ExecuteCommandRegistrationOptions {
  const ExecuteCommandRegistrationOptions._();

  const factory ExecuteCommandRegistrationOptions({
    bool? workDoneProgress,
    required List<String> commands,
  }) = _ExecuteCommandRegistrationOptions;

  static ExecuteCommandRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => ExecuteCommandRegistrationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    commands: (json['commands'] as List<Object?>)
        .map((e) => e as String)
        .toList(),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'commands': commands,
    };
  }
}

/// The parameters passed via an apply workspace edit request.
@freezed
abstract class ApplyWorkspaceEditParams with _$ApplyWorkspaceEditParams {
  const ApplyWorkspaceEditParams._();

  const factory ApplyWorkspaceEditParams({
    String? label,
    required WorkspaceEdit edit,
  }) = _ApplyWorkspaceEditParams;

  static ApplyWorkspaceEditParams fromJson(Map<String, Object?> json) =>
      ApplyWorkspaceEditParams(
        label: json['label'] as String?,
        edit: WorkspaceEdit.fromJson(json['edit'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'label': label, 'edit': edit.toJson()};
  }
}

/// The result returned from the apply workspace edit request.
///
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
@freezed
abstract class ApplyWorkspaceEditResult with _$ApplyWorkspaceEditResult {
  const ApplyWorkspaceEditResult._();

  const factory ApplyWorkspaceEditResult({
    required bool applied,
    String? failureReason,
    int? failedChange,
  }) = _ApplyWorkspaceEditResult;

  static ApplyWorkspaceEditResult fromJson(Map<String, Object?> json) =>
      ApplyWorkspaceEditResult(
        applied: json['applied'] as bool,
        failureReason: json['failureReason'] as String?,
        failedChange: json['failedChange'] as int?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'applied': applied,
      'failureReason': failureReason,
      'failedChange': failedChange,
    };
  }
}

@freezed
abstract class WorkDoneProgressBegin with _$WorkDoneProgressBegin {
  const WorkDoneProgressBegin._();

  const factory WorkDoneProgressBegin({
    required String kind,
    required String title,
    bool? cancellable,
    String? message,
    int? percentage,
  }) = _WorkDoneProgressBegin;

  static WorkDoneProgressBegin fromJson(Map<String, Object?> json) =>
      WorkDoneProgressBegin(
        kind: json['kind'] as String,
        title: json['title'] as String,
        cancellable: json['cancellable'] as bool?,
        message: json['message'] as String?,
        percentage: json['percentage'] as int?,
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

@freezed
abstract class WorkDoneProgressReport with _$WorkDoneProgressReport {
  const WorkDoneProgressReport._();

  const factory WorkDoneProgressReport({
    required String kind,
    bool? cancellable,
    String? message,
    int? percentage,
  }) = _WorkDoneProgressReport;

  static WorkDoneProgressReport fromJson(Map<String, Object?> json) =>
      WorkDoneProgressReport(
        kind: json['kind'] as String,
        cancellable: json['cancellable'] as bool?,
        message: json['message'] as String?,
        percentage: json['percentage'] as int?,
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

@freezed
abstract class WorkDoneProgressEnd with _$WorkDoneProgressEnd {
  const WorkDoneProgressEnd._();

  const factory WorkDoneProgressEnd({required String kind, String? message}) =
      _WorkDoneProgressEnd;

  static WorkDoneProgressEnd fromJson(Map<String, Object?> json) =>
      WorkDoneProgressEnd(
        kind: json['kind'] as String,
        message: json['message'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'message': message};
  }
}

@freezed
abstract class SetTraceParams with _$SetTraceParams {
  const SetTraceParams._();

  const factory SetTraceParams({required TraceValues value}) = _SetTraceParams;

  static SetTraceParams fromJson(Map<String, Object?> json) => SetTraceParams(
    value: TraceValues.values.firstWhere(
      (e) => e.value == json['value'] as String,
    ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'value': value.value};
  }
}

@freezed
abstract class LogTraceParams with _$LogTraceParams {
  const LogTraceParams._();

  const factory LogTraceParams({required String message, String? verbose}) =
      _LogTraceParams;

  static LogTraceParams fromJson(Map<String, Object?> json) => LogTraceParams(
    message: json['message'] as String,
    verbose: json['verbose'] as String?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'message': message, 'verbose': verbose};
  }
}

@freezed
abstract class CancelParams with _$CancelParams {
  const CancelParams._();

  const factory CancelParams({required Object id}) = _CancelParams;

  static CancelParams fromJson(Map<String, Object?> json) =>
      CancelParams(id: json['id'] as Object);

  Map<String, Object?> toJson() {
    return <String, Object?>{'id': id};
  }
}

@freezed
abstract class ProgressParams with _$ProgressParams {
  const ProgressParams._();

  const factory ProgressParams({
    required ProgressToken token,
    required LSPAny value,
  }) = _ProgressParams;

  static ProgressParams fromJson(Map<String, Object?> json) => ProgressParams(
    token: ProgressToken.fromJson(json['token']),
    value: json['value'] as LSPAny,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'token': token.toJson(), 'value': value};
  }
}

/// A parameter literal used in requests to pass a text document and a position inside that
/// document.
@freezed
abstract class TextDocumentPositionParams with _$TextDocumentPositionParams {
  const TextDocumentPositionParams._();

  const factory TextDocumentPositionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
  }) = _TextDocumentPositionParams;

  static TextDocumentPositionParams fromJson(Map<String, Object?> json) =>
      TextDocumentPositionParams(
        textDocument: TextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        position: Position.fromJson(json['position'] as Map<String, Object?>),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'position': position.toJson(),
    };
  }
}

@freezed
abstract class WorkDoneProgressParams with _$WorkDoneProgressParams {
  const WorkDoneProgressParams._();

  const factory WorkDoneProgressParams({ProgressToken? workDoneToken}) =
      _WorkDoneProgressParams;

  static WorkDoneProgressParams fromJson(Map<String, Object?> json) =>
      WorkDoneProgressParams(
        workDoneToken: json['workDoneToken'] == null
            ? null
            : ProgressToken.fromJson(json['workDoneToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneToken': workDoneToken?.toJson()};
  }
}

@freezed
abstract class PartialResultParams with _$PartialResultParams {
  const PartialResultParams._();

  const factory PartialResultParams({ProgressToken? partialResultToken}) =
      _PartialResultParams;

  static PartialResultParams fromJson(Map<String, Object?> json) =>
      PartialResultParams(
        partialResultToken: json['partialResultToken'] == null
            ? null
            : ProgressToken.fromJson(json['partialResultToken']),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'partialResultToken': partialResultToken?.toJson(),
    };
  }
}

/// Represents the connection of two locations. Provides additional metadata over normal {@link Location locations},
/// including an origin range.
@freezed
abstract class LocationLink with _$LocationLink {
  const LocationLink._();

  const factory LocationLink({
    Range? originSelectionRange,
    required String targetUri,
    required Range targetRange,
    required Range targetSelectionRange,
  }) = _LocationLink;

  static LocationLink fromJson(Map<String, Object?> json) => LocationLink(
    originSelectionRange: json['originSelectionRange'] == null
        ? null
        : Range.fromJson(json['originSelectionRange'] as Map<String, Object?>),
    targetUri: json['targetUri'] as String,
    targetRange: Range.fromJson(json['targetRange'] as Map<String, Object?>),
    targetSelectionRange: Range.fromJson(
      json['targetSelectionRange'] as Map<String, Object?>,
    ),
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
@freezed
abstract class Range with _$Range {
  const Range._();

  const factory Range({required Position start, required Position end}) =
      _Range;

  static Range fromJson(Map<String, Object?> json) => Range(
    start: Position.fromJson(json['start'] as Map<String, Object?>),
    end: Position.fromJson(json['end'] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'start': start.toJson(), 'end': end.toJson()};
  }
}

@freezed
abstract class ImplementationOptions with _$ImplementationOptions {
  const ImplementationOptions._();

  const factory ImplementationOptions({bool? workDoneProgress}) =
      _ImplementationOptions;

  static ImplementationOptions fromJson(Map<String, Object?> json) =>
      ImplementationOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Static registration options to be returned in the initialize
/// request.
@freezed
abstract class StaticRegistrationOptions with _$StaticRegistrationOptions {
  const StaticRegistrationOptions._();

  const factory StaticRegistrationOptions({String? id}) =
      _StaticRegistrationOptions;

  static StaticRegistrationOptions fromJson(Map<String, Object?> json) =>
      StaticRegistrationOptions(id: json['id'] as String?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'id': id};
  }
}

@freezed
abstract class TypeDefinitionOptions with _$TypeDefinitionOptions {
  const TypeDefinitionOptions._();

  const factory TypeDefinitionOptions({bool? workDoneProgress}) =
      _TypeDefinitionOptions;

  static TypeDefinitionOptions fromJson(Map<String, Object?> json) =>
      TypeDefinitionOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// The workspace folder change event.
@freezed
abstract class WorkspaceFoldersChangeEvent with _$WorkspaceFoldersChangeEvent {
  const WorkspaceFoldersChangeEvent._();

  const factory WorkspaceFoldersChangeEvent({
    required List<WorkspaceFolder> added,
    required List<WorkspaceFolder> removed,
  }) = _WorkspaceFoldersChangeEvent;

  static WorkspaceFoldersChangeEvent fromJson(Map<String, Object?> json) =>
      WorkspaceFoldersChangeEvent(
        added: (json['added'] as List<Object?>)
            .map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
            .toList(),
        removed: (json['removed'] as List<Object?>)
            .map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'added': added.map((e) => e.toJson()).toList(),
      'removed': removed.map((e) => e.toJson()).toList(),
    };
  }
}

@freezed
abstract class ConfigurationItem with _$ConfigurationItem {
  const ConfigurationItem._();

  const factory ConfigurationItem({String? scopeUri, String? section}) =
      _ConfigurationItem;

  static ConfigurationItem fromJson(Map<String, Object?> json) =>
      ConfigurationItem(
        scopeUri: json['scopeUri'] as String?,
        section: json['section'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'scopeUri': scopeUri, 'section': section};
  }
}

/// A literal to identify a text document in the client.
@freezed
abstract class TextDocumentIdentifier with _$TextDocumentIdentifier {
  const TextDocumentIdentifier._();

  const factory TextDocumentIdentifier({required String uri}) =
      _TextDocumentIdentifier;

  static TextDocumentIdentifier fromJson(Map<String, Object?> json) =>
      TextDocumentIdentifier(uri: json['uri'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

/// Represents a color in RGBA space.
@freezed
abstract class Color with _$Color {
  const Color._();

  const factory Color({
    required double red,
    required double green,
    required double blue,
    required double alpha,
  }) = _Color;

  static Color fromJson(Map<String, Object?> json) => Color(
    red: json['red'] as double,
    green: json['green'] as double,
    blue: json['blue'] as double,
    alpha: json['alpha'] as double,
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

@freezed
abstract class DocumentColorOptions with _$DocumentColorOptions {
  const DocumentColorOptions._();

  const factory DocumentColorOptions({bool? workDoneProgress}) =
      _DocumentColorOptions;

  static DocumentColorOptions fromJson(Map<String, Object?> json) =>
      DocumentColorOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

@freezed
abstract class FoldingRangeOptions with _$FoldingRangeOptions {
  const FoldingRangeOptions._();

  const factory FoldingRangeOptions({bool? workDoneProgress}) =
      _FoldingRangeOptions;

  static FoldingRangeOptions fromJson(Map<String, Object?> json) =>
      FoldingRangeOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

@freezed
abstract class DeclarationOptions with _$DeclarationOptions {
  const DeclarationOptions._();

  const factory DeclarationOptions({bool? workDoneProgress}) =
      _DeclarationOptions;

  static DeclarationOptions fromJson(Map<String, Object?> json) =>
      DeclarationOptions(workDoneProgress: json['workDoneProgress'] as bool?);

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
@freezed
abstract class Position with _$Position {
  const Position._();

  const factory Position({required int line, required int character}) =
      _Position;

  static Position fromJson(Map<String, Object?> json) =>
      Position(line: json['line'] as int, character: json['character'] as int);

  Map<String, Object?> toJson() {
    return <String, Object?>{'line': line, 'character': character};
  }
}

@freezed
abstract class SelectionRangeOptions with _$SelectionRangeOptions {
  const SelectionRangeOptions._();

  const factory SelectionRangeOptions({bool? workDoneProgress}) =
      _SelectionRangeOptions;

  static SelectionRangeOptions fromJson(Map<String, Object?> json) =>
      SelectionRangeOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Call hierarchy options used during static registration.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyOptions with _$CallHierarchyOptions {
  const CallHierarchyOptions._();

  const factory CallHierarchyOptions({bool? workDoneProgress}) =
      _CallHierarchyOptions;

  static CallHierarchyOptions fromJson(Map<String, Object?> json) =>
      CallHierarchyOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensOptions with _$SemanticTokensOptions {
  const SemanticTokensOptions._();

  const factory SemanticTokensOptions({
    bool? workDoneProgress,
    required SemanticTokensLegend legend,
    Object? range,
    Object? full,
  }) = _SemanticTokensOptions;

  static SemanticTokensOptions fromJson(Map<String, Object?> json) =>
      SemanticTokensOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        legend: SemanticTokensLegend.fromJson(
          json['legend'] as Map<String, Object?>,
        ),
        range: json['range'],
        full: json['full'],
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
@freezed
abstract class SemanticTokensEdit with _$SemanticTokensEdit {
  const SemanticTokensEdit._();

  const factory SemanticTokensEdit({
    required int start,
    required int deleteCount,
    List<int>? data,
  }) = _SemanticTokensEdit;

  static SemanticTokensEdit fromJson(Map<String, Object?> json) =>
      SemanticTokensEdit(
        start: json['start'] as int,
        deleteCount: json['deleteCount'] as int,
        data: (json['data'] as List<Object?>?)?.map((e) => e as int).toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'start': start,
      'deleteCount': deleteCount,
      'data': data,
    };
  }
}

@freezed
abstract class LinkedEditingRangeOptions with _$LinkedEditingRangeOptions {
  const LinkedEditingRangeOptions._();

  const factory LinkedEditingRangeOptions({bool? workDoneProgress}) =
      _LinkedEditingRangeOptions;

  static LinkedEditingRangeOptions fromJson(Map<String, Object?> json) =>
      LinkedEditingRangeOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Represents information on a file/folder create.
///
/// @since 3.16.0
@freezed
abstract class FileCreate with _$FileCreate {
  const FileCreate._();

  const factory FileCreate({required String uri}) = _FileCreate;

  static FileCreate fromJson(Map<String, Object?> json) =>
      FileCreate(uri: json['uri'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

/// Describes textual changes on a text document. A TextDocumentEdit describes all changes
/// on a document version Si and after they are applied move the document to version Si+1.
/// So the creator of a TextDocumentEdit doesn't need to sort the array of edits or do any
/// kind of ordering. However the edits must be non overlapping.
@freezed
abstract class TextDocumentEdit with _$TextDocumentEdit {
  const TextDocumentEdit._();

  const factory TextDocumentEdit({
    required OptionalVersionedTextDocumentIdentifier textDocument,
    required List<Object> edits,
  }) = _TextDocumentEdit;

  static TextDocumentEdit fromJson(Map<String, Object?> json) =>
      TextDocumentEdit(
        textDocument: OptionalVersionedTextDocumentIdentifier.fromJson(
          json['textDocument'] as Map<String, Object?>,
        ),
        edits: (json['edits'] as List<Object?>)
            .map((e) => e as Object)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textDocument': textDocument.toJson(),
      'edits': edits,
    };
  }
}

/// Create file operation.
@freezed
abstract class CreateFile with _$CreateFile {
  const CreateFile._();

  const factory CreateFile({
    ChangeAnnotationIdentifier? annotationId,
    required String kind,
    required String uri,
    CreateFileOptions? options,
  }) = _CreateFile;

  static CreateFile fromJson(Map<String, Object?> json) => CreateFile(
    annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
    kind: json['kind'] as String,
    uri: json['uri'] as String,
    options: json['options'] == null
        ? null
        : CreateFileOptions.fromJson(json['options'] as Map<String, Object?>),
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
@freezed
abstract class RenameFile with _$RenameFile {
  const RenameFile._();

  const factory RenameFile({
    ChangeAnnotationIdentifier? annotationId,
    required String kind,
    required String oldUri,
    required String newUri,
    RenameFileOptions? options,
  }) = _RenameFile;

  static RenameFile fromJson(Map<String, Object?> json) => RenameFile(
    annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
    kind: json['kind'] as String,
    oldUri: json['oldUri'] as String,
    newUri: json['newUri'] as String,
    options: json['options'] == null
        ? null
        : RenameFileOptions.fromJson(json['options'] as Map<String, Object?>),
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
@freezed
abstract class DeleteFile with _$DeleteFile {
  const DeleteFile._();

  const factory DeleteFile({
    ChangeAnnotationIdentifier? annotationId,
    required String kind,
    required String uri,
    DeleteFileOptions? options,
  }) = _DeleteFile;

  static DeleteFile fromJson(Map<String, Object?> json) => DeleteFile(
    annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
    kind: json['kind'] as String,
    uri: json['uri'] as String,
    options: json['options'] == null
        ? null
        : DeleteFileOptions.fromJson(json['options'] as Map<String, Object?>),
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
@freezed
abstract class ChangeAnnotation with _$ChangeAnnotation {
  const ChangeAnnotation._();

  const factory ChangeAnnotation({
    required String label,
    bool? needsConfirmation,
    String? description,
  }) = _ChangeAnnotation;

  static ChangeAnnotation fromJson(Map<String, Object?> json) =>
      ChangeAnnotation(
        label: json['label'] as String,
        needsConfirmation: json['needsConfirmation'] as bool?,
        description: json['description'] as String?,
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
@freezed
abstract class FileOperationFilter with _$FileOperationFilter {
  const FileOperationFilter._();

  const factory FileOperationFilter({
    String? scheme,
    required FileOperationPattern pattern,
  }) = _FileOperationFilter;

  static FileOperationFilter fromJson(Map<String, Object?> json) =>
      FileOperationFilter(
        scheme: json['scheme'] as String?,
        pattern: FileOperationPattern.fromJson(
          json['pattern'] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'scheme': scheme, 'pattern': pattern.toJson()};
  }
}

/// Represents information on a file/folder rename.
///
/// @since 3.16.0
@freezed
abstract class FileRename with _$FileRename {
  const FileRename._();

  const factory FileRename({required String oldUri, required String newUri}) =
      _FileRename;

  static FileRename fromJson(Map<String, Object?> json) => FileRename(
    oldUri: json['oldUri'] as String,
    newUri: json['newUri'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'oldUri': oldUri, 'newUri': newUri};
  }
}

/// Represents information on a file/folder delete.
///
/// @since 3.16.0
@freezed
abstract class FileDelete with _$FileDelete {
  const FileDelete._();

  const factory FileDelete({required String uri}) = _FileDelete;

  static FileDelete fromJson(Map<String, Object?> json) =>
      FileDelete(uri: json['uri'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

@freezed
abstract class MonikerOptions with _$MonikerOptions {
  const MonikerOptions._();

  const factory MonikerOptions({bool? workDoneProgress}) = _MonikerOptions;

  static MonikerOptions fromJson(Map<String, Object?> json) =>
      MonikerOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Type hierarchy options used during static registration.
///
/// @since 3.17.0
@freezed
abstract class TypeHierarchyOptions with _$TypeHierarchyOptions {
  const TypeHierarchyOptions._();

  const factory TypeHierarchyOptions({bool? workDoneProgress}) =
      _TypeHierarchyOptions;

  static TypeHierarchyOptions fromJson(Map<String, Object?> json) =>
      TypeHierarchyOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// @since 3.17.0
@freezed
abstract class InlineValueContext with _$InlineValueContext {
  const InlineValueContext._();

  const factory InlineValueContext({
    required int frameId,
    required Range stoppedLocation,
  }) = _InlineValueContext;

  static InlineValueContext fromJson(Map<String, Object?> json) =>
      InlineValueContext(
        frameId: json['frameId'] as int,
        stoppedLocation: Range.fromJson(
          json['stoppedLocation'] as Map<String, Object?>,
        ),
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
@freezed
abstract class InlineValueText with _$InlineValueText {
  const InlineValueText._();

  const factory InlineValueText({required Range range, required String text}) =
      _InlineValueText;

  static InlineValueText fromJson(Map<String, Object?> json) => InlineValueText(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    text: json['text'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'text': text};
  }
}

/// Provide inline value through a variable lookup.
/// If only a range is specified, the variable name will be extracted from the underlying document.
/// An optional variable name can be used to override the extracted name.
///
/// @since 3.17.0
@freezed
abstract class InlineValueVariableLookup with _$InlineValueVariableLookup {
  const InlineValueVariableLookup._();

  const factory InlineValueVariableLookup({
    required Range range,
    String? variableName,
    required bool caseSensitiveLookup,
  }) = _InlineValueVariableLookup;

  static InlineValueVariableLookup fromJson(Map<String, Object?> json) =>
      InlineValueVariableLookup(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        variableName: json['variableName'] as String?,
        caseSensitiveLookup: json['caseSensitiveLookup'] as bool,
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
@freezed
abstract class InlineValueEvaluatableExpression
    with _$InlineValueEvaluatableExpression {
  const InlineValueEvaluatableExpression._();

  const factory InlineValueEvaluatableExpression({
    required Range range,
    String? expression,
  }) = _InlineValueEvaluatableExpression;

  static InlineValueEvaluatableExpression fromJson(Map<String, Object?> json) =>
      InlineValueEvaluatableExpression(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        expression: json['expression'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'expression': expression};
  }
}

/// Inline value options used during static registration.
///
/// @since 3.17.0
@freezed
abstract class InlineValueOptions with _$InlineValueOptions {
  const InlineValueOptions._();

  const factory InlineValueOptions({bool? workDoneProgress}) =
      _InlineValueOptions;

  static InlineValueOptions fromJson(Map<String, Object?> json) =>
      InlineValueOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// An inlay hint label part allows for interactive and composite labels
/// of inlay hints.
///
/// @since 3.17.0
@freezed
abstract class InlayHintLabelPart with _$InlayHintLabelPart {
  const InlayHintLabelPart._();

  const factory InlayHintLabelPart({
    required String value,
    Object? tooltip,
    Location? location,
    Command? command,
  }) = _InlayHintLabelPart;

  static InlayHintLabelPart fromJson(Map<String, Object?> json) =>
      InlayHintLabelPart(
        value: json['value'] as String,
        tooltip: json['tooltip'],
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, Object?>),
        command: json['command'] == null
            ? null
            : Command.fromJson(json['command'] as Map<String, Object?>),
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
@freezed
abstract class MarkupContent with _$MarkupContent {
  const MarkupContent._();

  const factory MarkupContent({
    required MarkupKind kind,
    required String value,
  }) = _MarkupContent;

  static MarkupContent fromJson(Map<String, Object?> json) => MarkupContent(
    kind: MarkupKind.values.firstWhere(
      (e) => e.value == json['kind'] as String,
    ),
    value: json['value'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind.value, 'value': value};
  }
}

/// Inlay hint options used during static registration.
///
/// @since 3.17.0
@freezed
abstract class InlayHintOptions with _$InlayHintOptions {
  const InlayHintOptions._();

  const factory InlayHintOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _InlayHintOptions;

  static InlayHintOptions fromJson(Map<String, Object?> json) =>
      InlayHintOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
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
@freezed
abstract class RelatedFullDocumentDiagnosticReport
    with _$RelatedFullDocumentDiagnosticReport {
  const RelatedFullDocumentDiagnosticReport._();

  const factory RelatedFullDocumentDiagnosticReport({
    required String kind,
    String? resultId,
    required List<Diagnostic> items,
    Map<String, Object>? relatedDocuments,
  }) = _RelatedFullDocumentDiagnosticReport;

  static RelatedFullDocumentDiagnosticReport fromJson(
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
@freezed
abstract class RelatedUnchangedDocumentDiagnosticReport
    with _$RelatedUnchangedDocumentDiagnosticReport {
  const RelatedUnchangedDocumentDiagnosticReport._();

  const factory RelatedUnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
    Map<String, Object>? relatedDocuments,
  }) = _RelatedUnchangedDocumentDiagnosticReport;

  static RelatedUnchangedDocumentDiagnosticReport fromJson(
    Map<String, Object?> json,
  ) => RelatedUnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
    relatedDocuments: (json['relatedDocuments'] as Map<String, Object?>?)?.map(
      (k, v) => MapEntry(k, v as Object),
    ),
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
@freezed
abstract class FullDocumentDiagnosticReport
    with _$FullDocumentDiagnosticReport {
  const FullDocumentDiagnosticReport._();

  const factory FullDocumentDiagnosticReport({
    required String kind,
    String? resultId,
    required List<Diagnostic> items,
  }) = _FullDocumentDiagnosticReport;

  static FullDocumentDiagnosticReport fromJson(Map<String, Object?> json) =>
      FullDocumentDiagnosticReport(
        kind: json['kind'] as String,
        resultId: json['resultId'] as String?,
        items: (json['items'] as List<Object?>)
            .map((e) => Diagnostic.fromJson(e as Map<String, Object?>))
            .toList(),
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
@freezed
abstract class UnchangedDocumentDiagnosticReport
    with _$UnchangedDocumentDiagnosticReport {
  const UnchangedDocumentDiagnosticReport._();

  const factory UnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
  }) = _UnchangedDocumentDiagnosticReport;

  static UnchangedDocumentDiagnosticReport fromJson(
    Map<String, Object?> json,
  ) => UnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'resultId': resultId};
  }
}

/// Diagnostic options.
///
/// @since 3.17.0
@freezed
abstract class DiagnosticOptions with _$DiagnosticOptions {
  const DiagnosticOptions._();

  const factory DiagnosticOptions({
    bool? workDoneProgress,
    String? identifier,
    required bool interFileDependencies,
    required bool workspaceDiagnostics,
  }) = _DiagnosticOptions;

  static DiagnosticOptions fromJson(Map<String, Object?> json) =>
      DiagnosticOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        identifier: json['identifier'] as String?,
        interFileDependencies: json['interFileDependencies'] as bool,
        workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
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
@freezed
abstract class PreviousResultId with _$PreviousResultId {
  const PreviousResultId._();

  const factory PreviousResultId({required String uri, required String value}) =
      _PreviousResultId;

  static PreviousResultId fromJson(Map<String, Object?> json) =>
      PreviousResultId(
        uri: json['uri'] as String,
        value: json['value'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'value': value};
  }
}

/// A notebook document.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocument with _$NotebookDocument {
  const NotebookDocument._();

  const factory NotebookDocument({
    required String uri,
    required String notebookType,
    required int version,
    LSPObject? metadata,
    required List<NotebookCell> cells,
  }) = _NotebookDocument;

  static NotebookDocument fromJson(Map<String, Object?> json) =>
      NotebookDocument(
        uri: json['uri'] as String,
        notebookType: json['notebookType'] as String,
        version: json['version'] as int,
        metadata: json['metadata'] as LSPObject?,
        cells: (json['cells'] as List<Object?>)
            .map((e) => NotebookCell.fromJson(e as Map<String, Object?>))
            .toList(),
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
@freezed
abstract class TextDocumentItem with _$TextDocumentItem {
  const TextDocumentItem._();

  const factory TextDocumentItem({
    required String uri,
    required String languageId,
    required int version,
    required String text,
  }) = _TextDocumentItem;

  static TextDocumentItem fromJson(Map<String, Object?> json) =>
      TextDocumentItem(
        uri: json['uri'] as String,
        languageId: json['languageId'] as String,
        version: json['version'] as int,
        text: json['text'] as String,
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
@freezed
abstract class VersionedNotebookDocumentIdentifier
    with _$VersionedNotebookDocumentIdentifier {
  const VersionedNotebookDocumentIdentifier._();

  const factory VersionedNotebookDocumentIdentifier({
    required int version,
    required String uri,
  }) = _VersionedNotebookDocumentIdentifier;

  static VersionedNotebookDocumentIdentifier fromJson(
    Map<String, Object?> json,
  ) => VersionedNotebookDocumentIdentifier(
    version: json['version'] as int,
    uri: json['uri'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'version': version, 'uri': uri};
  }
}

/// A change event for a notebook document.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentChangeEvent with _$NotebookDocumentChangeEvent {
  const NotebookDocumentChangeEvent._();

  const factory NotebookDocumentChangeEvent({
    LSPObject? metadata,
    NotebookDocumentChangeEventCells? cells,
  }) = _NotebookDocumentChangeEvent;

  static NotebookDocumentChangeEvent fromJson(Map<String, Object?> json) =>
      NotebookDocumentChangeEvent(
        metadata: json['metadata'] as LSPObject?,
        cells: json['cells'] == null
            ? null
            : NotebookDocumentChangeEventCells.fromJson(
                json['cells'] as Map<String, Object?>,
              ),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'metadata': metadata, 'cells': cells?.toJson()};
  }
}

/// A literal to identify a notebook document in the client.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentIdentifier with _$NotebookDocumentIdentifier {
  const NotebookDocumentIdentifier._();

  const factory NotebookDocumentIdentifier({required String uri}) =
      _NotebookDocumentIdentifier;

  static NotebookDocumentIdentifier fromJson(Map<String, Object?> json) =>
      NotebookDocumentIdentifier(uri: json['uri'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri};
  }
}

/// Provides information about the context in which an inline completion was requested.
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionContext with _$InlineCompletionContext {
  const InlineCompletionContext._();

  const factory InlineCompletionContext({
    required InlineCompletionTriggerKind triggerKind,
    SelectedCompletionInfo? selectedCompletionInfo,
  }) = _InlineCompletionContext;

  static InlineCompletionContext fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class StringValue with _$StringValue {
  const StringValue._();

  const factory StringValue({required String kind, required String value}) =
      _StringValue;

  static StringValue fromJson(Map<String, Object?> json) =>
      StringValue(kind: json['kind'] as String, value: json['value'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'value': value};
  }
}

/// Inline completion options used during static registration.
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionOptions with _$InlineCompletionOptions {
  const InlineCompletionOptions._();

  const factory InlineCompletionOptions({bool? workDoneProgress}) =
      _InlineCompletionOptions;

  static InlineCompletionOptions fromJson(Map<String, Object?> json) =>
      InlineCompletionOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// General parameters to register for a notification or to register a provider.
@freezed
abstract class Registration with _$Registration {
  const Registration._();

  const factory Registration({
    required String id,
    required String method,
    LSPAny? registerOptions,
  }) = _Registration;

  static Registration fromJson(Map<String, Object?> json) => Registration(
    id: json['id'] as String,
    method: json['method'] as String,
    registerOptions: json['registerOptions'],
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
@freezed
abstract class Unregistration with _$Unregistration {
  const Unregistration._();

  const factory Unregistration({required String id, required String method}) =
      _Unregistration;

  static Unregistration fromJson(Map<String, Object?> json) => Unregistration(
    id: json['id'] as String,
    method: json['method'] as String,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'id': id, 'method': method};
  }
}

@freezed
abstract class WorkspaceFoldersInitializeParams
    with _$WorkspaceFoldersInitializeParams {
  const WorkspaceFoldersInitializeParams._();

  const factory WorkspaceFoldersInitializeParams({
    List<WorkspaceFolder>? workspaceFolders,
  }) = _WorkspaceFoldersInitializeParams;

  static WorkspaceFoldersInitializeParams fromJson(Map<String, Object?> json) =>
      WorkspaceFoldersInitializeParams(
        workspaceFolders: (json['workspaceFolders'] as List<Object?>?)
            ?.map((e) => WorkspaceFolder.fromJson(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workspaceFolders': workspaceFolders?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Defines the capabilities provided by a language
/// server.
@freezed
abstract class ServerCapabilities with _$ServerCapabilities {
  const ServerCapabilities._();

  const factory ServerCapabilities({
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
  }) = _ServerCapabilities;

  static ServerCapabilities fromJson(
    Map<String, Object?> json,
  ) => ServerCapabilities(
    positionEncoding: json['positionEncoding'] == null
        ? null
        : PositionEncodingKind(json['positionEncoding'] as String),
    textDocumentSync: json['textDocumentSync'],
    notebookDocumentSync: json['notebookDocumentSync'],
    completionProvider: json['completionProvider'] == null
        ? null
        : CompletionOptions.fromJson(
            json['completionProvider'] as Map<String, Object?>,
          ),
    hoverProvider: json['hoverProvider'],
    signatureHelpProvider: json['signatureHelpProvider'] == null
        ? null
        : SignatureHelpOptions.fromJson(
            json['signatureHelpProvider'] as Map<String, Object?>,
          ),
    declarationProvider: json['declarationProvider'],
    definitionProvider: json['definitionProvider'],
    typeDefinitionProvider: json['typeDefinitionProvider'],
    implementationProvider: json['implementationProvider'],
    referencesProvider: json['referencesProvider'],
    documentHighlightProvider: json['documentHighlightProvider'],
    documentSymbolProvider: json['documentSymbolProvider'],
    codeActionProvider: json['codeActionProvider'],
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
    colorProvider: json['colorProvider'],
    workspaceSymbolProvider: json['workspaceSymbolProvider'],
    documentFormattingProvider: json['documentFormattingProvider'],
    documentRangeFormattingProvider: json['documentRangeFormattingProvider'],
    documentOnTypeFormattingProvider:
        json['documentOnTypeFormattingProvider'] == null
        ? null
        : DocumentOnTypeFormattingOptions.fromJson(
            json['documentOnTypeFormattingProvider'] as Map<String, Object?>,
          ),
    renameProvider: json['renameProvider'],
    foldingRangeProvider: json['foldingRangeProvider'],
    selectionRangeProvider: json['selectionRangeProvider'],
    executeCommandProvider: json['executeCommandProvider'] == null
        ? null
        : ExecuteCommandOptions.fromJson(
            json['executeCommandProvider'] as Map<String, Object?>,
          ),
    callHierarchyProvider: json['callHierarchyProvider'],
    linkedEditingRangeProvider: json['linkedEditingRangeProvider'],
    semanticTokensProvider: json['semanticTokensProvider'],
    monikerProvider: json['monikerProvider'],
    typeHierarchyProvider: json['typeHierarchyProvider'],
    inlineValueProvider: json['inlineValueProvider'],
    inlayHintProvider: json['inlayHintProvider'],
    diagnosticProvider: json['diagnosticProvider'],
    inlineCompletionProvider: json['inlineCompletionProvider'],
    workspace: json['workspace'] == null
        ? null
        : ServerCapabilitiesWorkspace.fromJson(
            json['workspace'] as Map<String, Object?>,
          ),
    experimental: json['experimental'],
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
@freezed
abstract class VersionedTextDocumentIdentifier
    with _$VersionedTextDocumentIdentifier {
  const VersionedTextDocumentIdentifier._();

  const factory VersionedTextDocumentIdentifier({
    required String uri,
    required int version,
  }) = _VersionedTextDocumentIdentifier;

  static VersionedTextDocumentIdentifier fromJson(Map<String, Object?> json) =>
      VersionedTextDocumentIdentifier(
        uri: json['uri'] as String,
        version: json['version'] as int,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'version': version};
  }
}

/// Save options.
@freezed
abstract class SaveOptions with _$SaveOptions {
  const SaveOptions._();

  const factory SaveOptions({bool? includeText}) = _SaveOptions;

  static SaveOptions fromJson(Map<String, Object?> json) =>
      SaveOptions(includeText: json['includeText'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'includeText': includeText};
  }
}

/// An event describing a file change.
@freezed
abstract class FileEvent with _$FileEvent {
  const FileEvent._();

  const factory FileEvent({required String uri, required FileChangeType type}) =
      _FileEvent;

  static FileEvent fromJson(Map<String, Object?> json) => FileEvent(
    uri: json['uri'] as String,
    type: FileChangeType.values.firstWhere(
      (e) => e.value == json['type'] as int,
    ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'type': type.value};
  }
}

@freezed
abstract class FileSystemWatcher with _$FileSystemWatcher {
  const FileSystemWatcher._();

  const factory FileSystemWatcher({
    required GlobPattern globPattern,
    WatchKind? kind,
  }) = _FileSystemWatcher;

  static FileSystemWatcher fromJson(Map<String, Object?> json) =>
      FileSystemWatcher(
        globPattern: json['globPattern'] as GlobPattern,
        kind: json['kind'] == null ? null : WatchKind(json['kind'] as int),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'globPattern': globPattern, 'kind': kind?.value};
  }
}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic objects
/// are only valid in the scope of a resource.
@freezed
abstract class Diagnostic with _$Diagnostic {
  const Diagnostic._();

  const factory Diagnostic({
    required Range range,
    DiagnosticSeverity? severity,
    Object? code,
    CodeDescription? codeDescription,
    String? source,
    required String message,
    List<DiagnosticTag>? tags,
    List<DiagnosticRelatedInformation>? relatedInformation,
    LSPAny? data,
  }) = _Diagnostic;

  static Diagnostic fromJson(Map<String, Object?> json) => Diagnostic(
    range: Range.fromJson(json['range'] as Map<String, Object?>),
    severity: json['severity'] == null
        ? null
        : DiagnosticSeverity.values.firstWhere(
            (e) => e.value == json['severity'] as int,
          ),
    code: json['code'],
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
    data: json['data'],
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
@freezed
abstract class CompletionContext with _$CompletionContext {
  const CompletionContext._();

  const factory CompletionContext({
    required CompletionTriggerKind triggerKind,
    String? triggerCharacter,
  }) = _CompletionContext;

  static CompletionContext fromJson(Map<String, Object?> json) =>
      CompletionContext(
        triggerKind: CompletionTriggerKind.values.firstWhere(
          (e) => e.value == json['triggerKind'] as int,
        ),
        triggerCharacter: json['triggerCharacter'] as String?,
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
@freezed
abstract class CompletionItemLabelDetails with _$CompletionItemLabelDetails {
  const CompletionItemLabelDetails._();

  const factory CompletionItemLabelDetails({
    String? detail,
    String? description,
  }) = _CompletionItemLabelDetails;

  static CompletionItemLabelDetails fromJson(Map<String, Object?> json) =>
      CompletionItemLabelDetails(
        detail: json['detail'] as String?,
        description: json['description'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'detail': detail, 'description': description};
  }
}

/// A special text edit to provide an insert and a replace operation.
///
/// @since 3.16.0
@freezed
abstract class InsertReplaceEdit with _$InsertReplaceEdit {
  const InsertReplaceEdit._();

  const factory InsertReplaceEdit({
    required String newText,
    required Range insert,
    required Range replace,
  }) = _InsertReplaceEdit;

  static InsertReplaceEdit fromJson(Map<String, Object?> json) =>
      InsertReplaceEdit(
        newText: json['newText'] as String,
        insert: Range.fromJson(json['insert'] as Map<String, Object?>),
        replace: Range.fromJson(json['replace'] as Map<String, Object?>),
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
@freezed
abstract class CompletionOptions with _$CompletionOptions {
  const CompletionOptions._();

  const factory CompletionOptions({
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? allCommitCharacters,
    bool? resolveProvider,
    CompletionOptionsCompletionItem? completionItem,
  }) = _CompletionOptions;

  static CompletionOptions fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class HoverOptions with _$HoverOptions {
  const HoverOptions._();

  const factory HoverOptions({bool? workDoneProgress}) = _HoverOptions;

  static HoverOptions fromJson(Map<String, Object?> json) =>
      HoverOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Additional information about the context in which a signature help request was triggered.
///
/// @since 3.15.0
@freezed
abstract class SignatureHelpContext with _$SignatureHelpContext {
  const SignatureHelpContext._();

  const factory SignatureHelpContext({
    required SignatureHelpTriggerKind triggerKind,
    String? triggerCharacter,
    required bool isRetrigger,
    SignatureHelp? activeSignatureHelp,
  }) = _SignatureHelpContext;

  static SignatureHelpContext fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class SignatureInformation with _$SignatureInformation {
  const SignatureInformation._();

  const factory SignatureInformation({
    required String label,
    Object? documentation,
    List<ParameterInformation>? parameters,
    int? activeParameter,
  }) = _SignatureInformation;

  static SignatureInformation fromJson(Map<String, Object?> json) =>
      SignatureInformation(
        label: json['label'] as String,
        documentation: json['documentation'],
        parameters: (json['parameters'] as List<Object?>?)
            ?.map(
              (e) => ParameterInformation.fromJson(e as Map<String, Object?>),
            )
            .toList(),
        activeParameter: json['activeParameter'] as int?,
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
@freezed
abstract class SignatureHelpOptions with _$SignatureHelpOptions {
  const SignatureHelpOptions._();

  const factory SignatureHelpOptions({
    bool? workDoneProgress,
    List<String>? triggerCharacters,
    List<String>? retriggerCharacters,
  }) = _SignatureHelpOptions;

  static SignatureHelpOptions fromJson(Map<String, Object?> json) =>
      SignatureHelpOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        triggerCharacters: (json['triggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
        retriggerCharacters: (json['retriggerCharacters'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
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
@freezed
abstract class DefinitionOptions with _$DefinitionOptions {
  const DefinitionOptions._();

  const factory DefinitionOptions({bool? workDoneProgress}) =
      _DefinitionOptions;

  static DefinitionOptions fromJson(Map<String, Object?> json) =>
      DefinitionOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Value-object that contains additional information when
/// requesting references.
@freezed
abstract class ReferenceContext with _$ReferenceContext {
  const ReferenceContext._();

  const factory ReferenceContext({required bool includeDeclaration}) =
      _ReferenceContext;

  static ReferenceContext fromJson(Map<String, Object?> json) =>
      ReferenceContext(includeDeclaration: json['includeDeclaration'] as bool);

  Map<String, Object?> toJson() {
    return <String, Object?>{'includeDeclaration': includeDeclaration};
  }
}

/// Reference options.
@freezed
abstract class ReferenceOptions with _$ReferenceOptions {
  const ReferenceOptions._();

  const factory ReferenceOptions({bool? workDoneProgress}) = _ReferenceOptions;

  static ReferenceOptions fromJson(Map<String, Object?> json) =>
      ReferenceOptions(workDoneProgress: json['workDoneProgress'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Provider options for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightOptions with _$DocumentHighlightOptions {
  const DocumentHighlightOptions._();

  const factory DocumentHighlightOptions({bool? workDoneProgress}) =
      _DocumentHighlightOptions;

  static DocumentHighlightOptions fromJson(Map<String, Object?> json) =>
      DocumentHighlightOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// A base for all symbol information.
@freezed
abstract class BaseSymbolInformation with _$BaseSymbolInformation {
  const BaseSymbolInformation._();

  const factory BaseSymbolInformation({
    required String name,
    required SymbolKind kind,
    List<SymbolTag>? tags,
    String? containerName,
  }) = _BaseSymbolInformation;

  static BaseSymbolInformation fromJson(
    Map<String, Object?> json,
  ) => BaseSymbolInformation(
    name: json['name'] as String,
    kind: SymbolKind.values.firstWhere((e) => e.value == json['kind'] as int),
    tags: (json['tags'] as List<Object?>?)?.map((e) => e as SymbolTag).toList(),
    containerName: json['containerName'] as String?,
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
@freezed
abstract class DocumentSymbolOptions with _$DocumentSymbolOptions {
  const DocumentSymbolOptions._();

  const factory DocumentSymbolOptions({bool? workDoneProgress, String? label}) =
      _DocumentSymbolOptions;

  static DocumentSymbolOptions fromJson(Map<String, Object?> json) =>
      DocumentSymbolOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        label: json['label'] as String?,
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
@freezed
abstract class CodeActionContext with _$CodeActionContext {
  const CodeActionContext._();

  const factory CodeActionContext({
    required List<Diagnostic> diagnostics,
    List<CodeActionKind>? only,
    CodeActionTriggerKind? triggerKind,
  }) = _CodeActionContext;

  static CodeActionContext fromJson(Map<String, Object?> json) =>
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'diagnostics': diagnostics.map((e) => e.toJson()).toList(),
      'only': only,
      'triggerKind': triggerKind?.value,
    };
  }
}

/// Provider options for a {@link CodeActionRequest}.
@freezed
abstract class CodeActionOptions with _$CodeActionOptions {
  const CodeActionOptions._();

  const factory CodeActionOptions({
    bool? workDoneProgress,
    List<CodeActionKind>? codeActionKinds,
    bool? resolveProvider,
  }) = _CodeActionOptions;

  static CodeActionOptions fromJson(Map<String, Object?> json) =>
      CodeActionOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        codeActionKinds: (json['codeActionKinds'] as List<Object?>?)
            ?.map((e) => e as CodeActionKind)
            .toList(),
        resolveProvider: json['resolveProvider'] as bool?,
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
@freezed
abstract class WorkspaceSymbolOptions with _$WorkspaceSymbolOptions {
  const WorkspaceSymbolOptions._();

  const factory WorkspaceSymbolOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _WorkspaceSymbolOptions;

  static WorkspaceSymbolOptions fromJson(Map<String, Object?> json) =>
      WorkspaceSymbolOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// Code Lens provider options of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensOptions with _$CodeLensOptions {
  const CodeLensOptions._();

  const factory CodeLensOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _CodeLensOptions;

  static CodeLensOptions fromJson(Map<String, Object?> json) => CodeLensOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    resolveProvider: json['resolveProvider'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// Provider options for a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkOptions with _$DocumentLinkOptions {
  const DocumentLinkOptions._();

  const factory DocumentLinkOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _DocumentLinkOptions;

  static DocumentLinkOptions fromJson(Map<String, Object?> json) =>
      DocumentLinkOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        resolveProvider: json['resolveProvider'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'resolveProvider': resolveProvider,
    };
  }
}

/// Value-object describing what options formatting should use.
@freezed
abstract class FormattingOptions with _$FormattingOptions {
  const FormattingOptions._();

  const factory FormattingOptions({
    required int tabSize,
    required bool insertSpaces,
    bool? trimTrailingWhitespace,
    bool? insertFinalNewline,
    bool? trimFinalNewlines,
  }) = _FormattingOptions;

  static FormattingOptions fromJson(Map<String, Object?> json) =>
      FormattingOptions(
        tabSize: json['tabSize'] as int,
        insertSpaces: json['insertSpaces'] as bool,
        trimTrailingWhitespace: json['trimTrailingWhitespace'] as bool?,
        insertFinalNewline: json['insertFinalNewline'] as bool?,
        trimFinalNewlines: json['trimFinalNewlines'] as bool?,
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
@freezed
abstract class DocumentFormattingOptions with _$DocumentFormattingOptions {
  const DocumentFormattingOptions._();

  const factory DocumentFormattingOptions({bool? workDoneProgress}) =
      _DocumentFormattingOptions;

  static DocumentFormattingOptions fromJson(Map<String, Object?> json) =>
      DocumentFormattingOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'workDoneProgress': workDoneProgress};
  }
}

/// Provider options for a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingOptions
    with _$DocumentRangeFormattingOptions {
  const DocumentRangeFormattingOptions._();

  const factory DocumentRangeFormattingOptions({
    bool? workDoneProgress,
    bool? rangesSupport,
  }) = _DocumentRangeFormattingOptions;

  static DocumentRangeFormattingOptions fromJson(Map<String, Object?> json) =>
      DocumentRangeFormattingOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        rangesSupport: json['rangesSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'rangesSupport': rangesSupport,
    };
  }
}

/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingOptions
    with _$DocumentOnTypeFormattingOptions {
  const DocumentOnTypeFormattingOptions._();

  const factory DocumentOnTypeFormattingOptions({
    required String firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingOptions;

  static DocumentOnTypeFormattingOptions fromJson(Map<String, Object?> json) =>
      DocumentOnTypeFormattingOptions(
        firstTriggerCharacter: json['firstTriggerCharacter'] as String,
        moreTriggerCharacter: (json['moreTriggerCharacter'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'firstTriggerCharacter': firstTriggerCharacter,
      'moreTriggerCharacter': moreTriggerCharacter,
    };
  }
}

/// Provider options for a {@link RenameRequest}.
@freezed
abstract class RenameOptions with _$RenameOptions {
  const RenameOptions._();

  const factory RenameOptions({bool? workDoneProgress, bool? prepareProvider}) =
      _RenameOptions;

  static RenameOptions fromJson(Map<String, Object?> json) => RenameOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
    prepareProvider: json['prepareProvider'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'prepareProvider': prepareProvider,
    };
  }
}

/// The server capabilities of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandOptions with _$ExecuteCommandOptions {
  const ExecuteCommandOptions._();

  const factory ExecuteCommandOptions({
    bool? workDoneProgress,
    required List<String> commands,
  }) = _ExecuteCommandOptions;

  static ExecuteCommandOptions fromJson(Map<String, Object?> json) =>
      ExecuteCommandOptions(
        workDoneProgress: json['workDoneProgress'] as bool?,
        commands: (json['commands'] as List<Object?>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'workDoneProgress': workDoneProgress,
      'commands': commands,
    };
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensLegend with _$SemanticTokensLegend {
  const SemanticTokensLegend._();

  const factory SemanticTokensLegend({
    required List<String> tokenTypes,
    required List<String> tokenModifiers,
  }) = _SemanticTokensLegend;

  static SemanticTokensLegend fromJson(Map<String, Object?> json) =>
      SemanticTokensLegend(
        tokenTypes: (json['tokenTypes'] as List<Object?>)
            .map((e) => e as String)
            .toList(),
        tokenModifiers: (json['tokenModifiers'] as List<Object?>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'tokenTypes': tokenTypes,
      'tokenModifiers': tokenModifiers,
    };
  }
}

/// A text document identifier to optionally denote a specific version of a text document.
@freezed
abstract class OptionalVersionedTextDocumentIdentifier
    with _$OptionalVersionedTextDocumentIdentifier {
  const OptionalVersionedTextDocumentIdentifier._();

  const factory OptionalVersionedTextDocumentIdentifier({
    required String uri,
    required int? version,
  }) = _OptionalVersionedTextDocumentIdentifier;

  static OptionalVersionedTextDocumentIdentifier fromJson(
    Map<String, Object?> json,
  ) => OptionalVersionedTextDocumentIdentifier(
    uri: json['uri'] as String,
    version: json['version'] as int?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'uri': uri, 'version': version};
  }
}

/// A special text edit with an additional change annotation.
///
/// @since 3.16.0.
@freezed
abstract class AnnotatedTextEdit with _$AnnotatedTextEdit {
  const AnnotatedTextEdit._();

  const factory AnnotatedTextEdit({
    required Range range,
    required String newText,
    required ChangeAnnotationIdentifier annotationId,
  }) = _AnnotatedTextEdit;

  static AnnotatedTextEdit fromJson(Map<String, Object?> json) =>
      AnnotatedTextEdit(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        newText: json['newText'] as String,
        annotationId: json['annotationId'] as ChangeAnnotationIdentifier,
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
@freezed
abstract class ResourceOperation with _$ResourceOperation {
  const ResourceOperation._();

  const factory ResourceOperation({
    required String kind,
    ChangeAnnotationIdentifier? annotationId,
  }) = _ResourceOperation;

  static ResourceOperation fromJson(Map<String, Object?> json) =>
      ResourceOperation(
        kind: json['kind'] as String,
        annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'kind': kind, 'annotationId': annotationId};
  }
}

/// Options to create a file.
@freezed
abstract class CreateFileOptions with _$CreateFileOptions {
  const CreateFileOptions._();

  const factory CreateFileOptions({bool? overwrite, bool? ignoreIfExists}) =
      _CreateFileOptions;

  static CreateFileOptions fromJson(Map<String, Object?> json) =>
      CreateFileOptions(
        overwrite: json['overwrite'] as bool?,
        ignoreIfExists: json['ignoreIfExists'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'overwrite': overwrite,
      'ignoreIfExists': ignoreIfExists,
    };
  }
}

/// Rename file options
@freezed
abstract class RenameFileOptions with _$RenameFileOptions {
  const RenameFileOptions._();

  const factory RenameFileOptions({bool? overwrite, bool? ignoreIfExists}) =
      _RenameFileOptions;

  static RenameFileOptions fromJson(Map<String, Object?> json) =>
      RenameFileOptions(
        overwrite: json['overwrite'] as bool?,
        ignoreIfExists: json['ignoreIfExists'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'overwrite': overwrite,
      'ignoreIfExists': ignoreIfExists,
    };
  }
}

/// Delete file options
@freezed
abstract class DeleteFileOptions with _$DeleteFileOptions {
  const DeleteFileOptions._();

  const factory DeleteFileOptions({bool? recursive, bool? ignoreIfNotExists}) =
      _DeleteFileOptions;

  static DeleteFileOptions fromJson(Map<String, Object?> json) =>
      DeleteFileOptions(
        recursive: json['recursive'] as bool?,
        ignoreIfNotExists: json['ignoreIfNotExists'] as bool?,
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
@freezed
abstract class FileOperationPattern with _$FileOperationPattern {
  const FileOperationPattern._();

  const factory FileOperationPattern({
    required String glob,
    FileOperationPatternKind? matches,
    FileOperationPatternOptions? options,
  }) = _FileOperationPattern;

  static FileOperationPattern fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class WorkspaceFullDocumentDiagnosticReport
    with _$WorkspaceFullDocumentDiagnosticReport {
  const WorkspaceFullDocumentDiagnosticReport._();

  const factory WorkspaceFullDocumentDiagnosticReport({
    required String kind,
    String? resultId,
    required List<Diagnostic> items,
    required String uri,
    required int? version,
  }) = _WorkspaceFullDocumentDiagnosticReport;

  static WorkspaceFullDocumentDiagnosticReport fromJson(
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
@freezed
abstract class WorkspaceUnchangedDocumentDiagnosticReport
    with _$WorkspaceUnchangedDocumentDiagnosticReport {
  const WorkspaceUnchangedDocumentDiagnosticReport._();

  const factory WorkspaceUnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
    required String uri,
    required int? version,
  }) = _WorkspaceUnchangedDocumentDiagnosticReport;

  static WorkspaceUnchangedDocumentDiagnosticReport fromJson(
    Map<String, Object?> json,
  ) => WorkspaceUnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
    uri: json['uri'] as String,
    version: json['version'] as int?,
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
@freezed
abstract class NotebookCell with _$NotebookCell {
  const NotebookCell._();

  const factory NotebookCell({
    required NotebookCellKind kind,
    required String document,
    LSPObject? metadata,
    ExecutionSummary? executionSummary,
  }) = _NotebookCell;

  static NotebookCell fromJson(Map<String, Object?> json) => NotebookCell(
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
@freezed
abstract class NotebookCellArrayChange with _$NotebookCellArrayChange {
  const NotebookCellArrayChange._();

  const factory NotebookCellArrayChange({
    required int start,
    required int deleteCount,
    List<NotebookCell>? cells,
  }) = _NotebookCellArrayChange;

  static NotebookCellArrayChange fromJson(Map<String, Object?> json) =>
      NotebookCellArrayChange(
        start: json['start'] as int,
        deleteCount: json['deleteCount'] as int,
        cells: (json['cells'] as List<Object?>?)
            ?.map((e) => NotebookCell.fromJson(e as Map<String, Object?>))
            .toList(),
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
@freezed
abstract class SelectedCompletionInfo with _$SelectedCompletionInfo {
  const SelectedCompletionInfo._();

  const factory SelectedCompletionInfo({
    required Range range,
    required String text,
  }) = _SelectedCompletionInfo;

  static SelectedCompletionInfo fromJson(Map<String, Object?> json) =>
      SelectedCompletionInfo(
        range: Range.fromJson(json['range'] as Map<String, Object?>),
        text: json['text'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'range': range.toJson(), 'text': text};
  }
}

/// Defines the capabilities provided by the client.
@freezed
abstract class ClientCapabilities with _$ClientCapabilities {
  const ClientCapabilities._();

  const factory ClientCapabilities({
    WorkspaceClientCapabilities? workspace,
    TextDocumentClientCapabilities? textDocument,
    NotebookDocumentClientCapabilities? notebookDocument,
    WindowClientCapabilities? window,
    GeneralClientCapabilities? general,
    LSPAny? experimental,
  }) = _ClientCapabilities;

  static ClientCapabilities fromJson(Map<String, Object?> json) =>
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
        experimental: json['experimental'],
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

@freezed
abstract class TextDocumentSyncOptions with _$TextDocumentSyncOptions {
  const TextDocumentSyncOptions._();

  const factory TextDocumentSyncOptions({
    bool? openClose,
    TextDocumentSyncKind? change,
    bool? willSave,
    bool? willSaveWaitUntil,
    Object? save,
  }) = _TextDocumentSyncOptions;

  static TextDocumentSyncOptions fromJson(Map<String, Object?> json) =>
      TextDocumentSyncOptions(
        openClose: json['openClose'] as bool?,
        change: json['change'] == null
            ? null
            : TextDocumentSyncKind.values.firstWhere(
                (e) => e.value == json['change'] as int,
              ),
        willSave: json['willSave'] as bool?,
        willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
        save: json['save'],
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
@freezed
abstract class NotebookDocumentSyncOptions with _$NotebookDocumentSyncOptions {
  const NotebookDocumentSyncOptions._();

  const factory NotebookDocumentSyncOptions({
    required List<Object> notebookSelector,
    bool? save,
  }) = _NotebookDocumentSyncOptions;

  static NotebookDocumentSyncOptions fromJson(Map<String, Object?> json) =>
      NotebookDocumentSyncOptions(
        notebookSelector: (json['notebookSelector'] as List<Object?>)
            .map((e) => e as Object)
            .toList(),
        save: json['save'] as bool?,
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
@freezed
abstract class NotebookDocumentSyncRegistrationOptions
    with _$NotebookDocumentSyncRegistrationOptions {
  const NotebookDocumentSyncRegistrationOptions._();

  const factory NotebookDocumentSyncRegistrationOptions({
    required List<Object> notebookSelector,
    bool? save,
    String? id,
  }) = _NotebookDocumentSyncRegistrationOptions;

  static NotebookDocumentSyncRegistrationOptions fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentSyncRegistrationOptions(
    notebookSelector: (json['notebookSelector'] as List<Object?>)
        .map((e) => e as Object)
        .toList(),
    save: json['save'] as bool?,
    id: json['id'] as String?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'notebookSelector': notebookSelector,
      'save': save,
      'id': id,
    };
  }
}

@freezed
abstract class WorkspaceFoldersServerCapabilities
    with _$WorkspaceFoldersServerCapabilities {
  const WorkspaceFoldersServerCapabilities._();

  const factory WorkspaceFoldersServerCapabilities({
    bool? supported,
    Object? changeNotifications,
  }) = _WorkspaceFoldersServerCapabilities;

  static WorkspaceFoldersServerCapabilities fromJson(
    Map<String, Object?> json,
  ) => WorkspaceFoldersServerCapabilities(
    supported: json['supported'] as bool?,
    changeNotifications: json['changeNotifications'],
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
@freezed
abstract class FileOperationOptions with _$FileOperationOptions {
  const FileOperationOptions._();

  const factory FileOperationOptions({
    FileOperationRegistrationOptions? didCreate,
    FileOperationRegistrationOptions? willCreate,
    FileOperationRegistrationOptions? didRename,
    FileOperationRegistrationOptions? willRename,
    FileOperationRegistrationOptions? didDelete,
    FileOperationRegistrationOptions? willDelete,
  }) = _FileOperationOptions;

  static FileOperationOptions fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class CodeDescription with _$CodeDescription {
  const CodeDescription._();

  const factory CodeDescription({required String href}) = _CodeDescription;

  static CodeDescription fromJson(Map<String, Object?> json) =>
      CodeDescription(href: json['href'] as String);

  Map<String, Object?> toJson() {
    return <String, Object?>{'href': href};
  }
}

/// Represents a related message and source code location for a diagnostic. This should be
/// used to point to code locations that cause or related to a diagnostics, e.g when duplicating
/// a symbol in a scope.
@freezed
abstract class DiagnosticRelatedInformation
    with _$DiagnosticRelatedInformation {
  const DiagnosticRelatedInformation._();

  const factory DiagnosticRelatedInformation({
    required Location location,
    required String message,
  }) = _DiagnosticRelatedInformation;

  static DiagnosticRelatedInformation fromJson(Map<String, Object?> json) =>
      DiagnosticRelatedInformation(
        location: Location.fromJson(json['location'] as Map<String, Object?>),
        message: json['message'] as String,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'location': location.toJson(), 'message': message};
  }
}

/// Represents a parameter of a callable-signature. A parameter can
/// have a label and a doc-comment.
@freezed
abstract class ParameterInformation with _$ParameterInformation {
  const ParameterInformation._();

  const factory ParameterInformation({
    required Object label,
    Object? documentation,
  }) = _ParameterInformation;

  static ParameterInformation fromJson(Map<String, Object?> json) =>
      ParameterInformation(
        label: json['label'] as Object,
        documentation: json['documentation'],
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'label': label, 'documentation': documentation};
  }
}

/// A notebook cell text document filter denotes a cell text
/// document by different properties.
///
/// @since 3.17.0
@freezed
abstract class NotebookCellTextDocumentFilter
    with _$NotebookCellTextDocumentFilter {
  const NotebookCellTextDocumentFilter._();

  const factory NotebookCellTextDocumentFilter({
    required Object notebook,
    String? language,
  }) = _NotebookCellTextDocumentFilter;

  static NotebookCellTextDocumentFilter fromJson(Map<String, Object?> json) =>
      NotebookCellTextDocumentFilter(
        notebook: json['notebook'] as Object,
        language: json['language'] as String?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'notebook': notebook, 'language': language};
  }
}

/// Matching options for the file operation pattern.
///
/// @since 3.16.0
@freezed
abstract class FileOperationPatternOptions with _$FileOperationPatternOptions {
  const FileOperationPatternOptions._();

  const factory FileOperationPatternOptions({bool? ignoreCase}) =
      _FileOperationPatternOptions;

  static FileOperationPatternOptions fromJson(Map<String, Object?> json) =>
      FileOperationPatternOptions(ignoreCase: json['ignoreCase'] as bool?);

  Map<String, Object?> toJson() {
    return <String, Object?>{'ignoreCase': ignoreCase};
  }
}

@freezed
abstract class ExecutionSummary with _$ExecutionSummary {
  const ExecutionSummary._();

  const factory ExecutionSummary({required int executionOrder, bool? success}) =
      _ExecutionSummary;

  static ExecutionSummary fromJson(Map<String, Object?> json) =>
      ExecutionSummary(
        executionOrder: json['executionOrder'] as int,
        success: json['success'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'executionOrder': executionOrder,
      'success': success,
    };
  }
}

/// Workspace specific client capabilities.
@freezed
abstract class WorkspaceClientCapabilities with _$WorkspaceClientCapabilities {
  const WorkspaceClientCapabilities._();

  const factory WorkspaceClientCapabilities({
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
  }) = _WorkspaceClientCapabilities;

  static WorkspaceClientCapabilities fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class TextDocumentClientCapabilities
    with _$TextDocumentClientCapabilities {
  const TextDocumentClientCapabilities._();

  const factory TextDocumentClientCapabilities({
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
  }) = _TextDocumentClientCapabilities;

  static TextDocumentClientCapabilities fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class NotebookDocumentClientCapabilities
    with _$NotebookDocumentClientCapabilities {
  const NotebookDocumentClientCapabilities._();

  const factory NotebookDocumentClientCapabilities({
    required NotebookDocumentSyncClientCapabilities synchronization,
  }) = _NotebookDocumentClientCapabilities;

  static NotebookDocumentClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentClientCapabilities(
    synchronization: NotebookDocumentSyncClientCapabilities.fromJson(
      json['synchronization'] as Map<String, Object?>,
    ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'synchronization': synchronization.toJson()};
  }
}

@freezed
abstract class WindowClientCapabilities with _$WindowClientCapabilities {
  const WindowClientCapabilities._();

  const factory WindowClientCapabilities({
    bool? workDoneProgress,
    ShowMessageRequestClientCapabilities? showMessage,
    ShowDocumentClientCapabilities? showDocument,
  }) = _WindowClientCapabilities;

  static WindowClientCapabilities fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class GeneralClientCapabilities with _$GeneralClientCapabilities {
  const GeneralClientCapabilities._();

  const factory GeneralClientCapabilities({
    GeneralClientCapabilitiesStaleRequestSupport? staleRequestSupport,
    RegularExpressionsClientCapabilities? regularExpressions,
    MarkdownClientCapabilities? markdown,
    List<PositionEncodingKind>? positionEncodings,
  }) = _GeneralClientCapabilities;

  static GeneralClientCapabilities fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class RelativePattern with _$RelativePattern {
  const RelativePattern._();

  const factory RelativePattern({
    required Object baseUri,
    required Pattern pattern,
  }) = _RelativePattern;

  static RelativePattern fromJson(Map<String, Object?> json) => RelativePattern(
    baseUri: json['baseUri'] as Object,
    pattern: json['pattern'] as Pattern,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'baseUri': baseUri, 'pattern': pattern};
  }
}

@freezed
abstract class WorkspaceEditClientCapabilities
    with _$WorkspaceEditClientCapabilities {
  const WorkspaceEditClientCapabilities._();

  const factory WorkspaceEditClientCapabilities({
    bool? documentChanges,
    List<ResourceOperationKind>? resourceOperations,
    FailureHandlingKind? failureHandling,
    bool? normalizesLineEndings,
    WorkspaceEditClientCapabilitiesChangeAnnotationSupport?
    changeAnnotationSupport,
  }) = _WorkspaceEditClientCapabilities;

  static WorkspaceEditClientCapabilities fromJson(Map<String, Object?> json) =>
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

@freezed
abstract class DidChangeConfigurationClientCapabilities
    with _$DidChangeConfigurationClientCapabilities {
  const DidChangeConfigurationClientCapabilities._();

  const factory DidChangeConfigurationClientCapabilities({
    bool? dynamicRegistration,
  }) = _DidChangeConfigurationClientCapabilities;

  static DidChangeConfigurationClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => DidChangeConfigurationClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

@freezed
abstract class DidChangeWatchedFilesClientCapabilities
    with _$DidChangeWatchedFilesClientCapabilities {
  const DidChangeWatchedFilesClientCapabilities._();

  const factory DidChangeWatchedFilesClientCapabilities({
    bool? dynamicRegistration,
    bool? relativePatternSupport,
  }) = _DidChangeWatchedFilesClientCapabilities;

  static DidChangeWatchedFilesClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => DidChangeWatchedFilesClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    relativePatternSupport: json['relativePatternSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'relativePatternSupport': relativePatternSupport,
    };
  }
}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolClientCapabilities
    with _$WorkspaceSymbolClientCapabilities {
  const WorkspaceSymbolClientCapabilities._();

  const factory WorkspaceSymbolClientCapabilities({
    bool? dynamicRegistration,
    WorkspaceSymbolClientCapabilitiesSymbolKind? symbolKind,
    WorkspaceSymbolClientCapabilitiesTagSupport? tagSupport,
    WorkspaceSymbolClientCapabilitiesResolveSupport? resolveSupport,
  }) = _WorkspaceSymbolClientCapabilities;

  static WorkspaceSymbolClientCapabilities fromJson(
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
@freezed
abstract class ExecuteCommandClientCapabilities
    with _$ExecuteCommandClientCapabilities {
  const ExecuteCommandClientCapabilities._();

  const factory ExecuteCommandClientCapabilities({bool? dynamicRegistration}) =
      _ExecuteCommandClientCapabilities;

  static ExecuteCommandClientCapabilities fromJson(Map<String, Object?> json) =>
      ExecuteCommandClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensWorkspaceClientCapabilities
    with _$SemanticTokensWorkspaceClientCapabilities {
  const SemanticTokensWorkspaceClientCapabilities._();

  const factory SemanticTokensWorkspaceClientCapabilities({
    bool? refreshSupport,
  }) = _SemanticTokensWorkspaceClientCapabilities;

  static SemanticTokensWorkspaceClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => SemanticTokensWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// @since 3.16.0
@freezed
abstract class CodeLensWorkspaceClientCapabilities
    with _$CodeLensWorkspaceClientCapabilities {
  const CodeLensWorkspaceClientCapabilities._();

  const factory CodeLensWorkspaceClientCapabilities({bool? refreshSupport}) =
      _CodeLensWorkspaceClientCapabilities;

  static CodeLensWorkspaceClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => CodeLensWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
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
@freezed
abstract class FileOperationClientCapabilities
    with _$FileOperationClientCapabilities {
  const FileOperationClientCapabilities._();

  const factory FileOperationClientCapabilities({
    bool? dynamicRegistration,
    bool? didCreate,
    bool? willCreate,
    bool? didRename,
    bool? willRename,
    bool? didDelete,
    bool? willDelete,
  }) = _FileOperationClientCapabilities;

  static FileOperationClientCapabilities fromJson(Map<String, Object?> json) =>
      FileOperationClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        didCreate: json['didCreate'] as bool?,
        willCreate: json['willCreate'] as bool?,
        didRename: json['didRename'] as bool?,
        willRename: json['willRename'] as bool?,
        didDelete: json['didDelete'] as bool?,
        willDelete: json['willDelete'] as bool?,
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
@freezed
abstract class InlineValueWorkspaceClientCapabilities
    with _$InlineValueWorkspaceClientCapabilities {
  const InlineValueWorkspaceClientCapabilities._();

  const factory InlineValueWorkspaceClientCapabilities({bool? refreshSupport}) =
      _InlineValueWorkspaceClientCapabilities;

  static InlineValueWorkspaceClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => InlineValueWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// Client workspace capabilities specific to inlay hints.
///
/// @since 3.17.0
@freezed
abstract class InlayHintWorkspaceClientCapabilities
    with _$InlayHintWorkspaceClientCapabilities {
  const InlayHintWorkspaceClientCapabilities._();

  const factory InlayHintWorkspaceClientCapabilities({bool? refreshSupport}) =
      _InlayHintWorkspaceClientCapabilities;

  static InlayHintWorkspaceClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => InlayHintWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// Workspace client capabilities specific to diagnostic pull requests.
///
/// @since 3.17.0
@freezed
abstract class DiagnosticWorkspaceClientCapabilities
    with _$DiagnosticWorkspaceClientCapabilities {
  const DiagnosticWorkspaceClientCapabilities._();

  const factory DiagnosticWorkspaceClientCapabilities({bool? refreshSupport}) =
      _DiagnosticWorkspaceClientCapabilities;

  static DiagnosticWorkspaceClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => DiagnosticWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

/// Client workspace capabilities specific to folding ranges
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class FoldingRangeWorkspaceClientCapabilities
    with _$FoldingRangeWorkspaceClientCapabilities {
  const FoldingRangeWorkspaceClientCapabilities._();

  const factory FoldingRangeWorkspaceClientCapabilities({
    bool? refreshSupport,
  }) = _FoldingRangeWorkspaceClientCapabilities;

  static FoldingRangeWorkspaceClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => FoldingRangeWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'refreshSupport': refreshSupport};
  }
}

@freezed
abstract class TextDocumentSyncClientCapabilities
    with _$TextDocumentSyncClientCapabilities {
  const TextDocumentSyncClientCapabilities._();

  const factory TextDocumentSyncClientCapabilities({
    bool? dynamicRegistration,
    bool? willSave,
    bool? willSaveWaitUntil,
    bool? didSave,
  }) = _TextDocumentSyncClientCapabilities;

  static TextDocumentSyncClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => TextDocumentSyncClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    willSave: json['willSave'] as bool?,
    willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
    didSave: json['didSave'] as bool?,
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
@freezed
abstract class CompletionClientCapabilities
    with _$CompletionClientCapabilities {
  const CompletionClientCapabilities._();

  const factory CompletionClientCapabilities({
    bool? dynamicRegistration,
    CompletionClientCapabilitiesCompletionItem? completionItem,
    CompletionClientCapabilitiesCompletionItemKind? completionItemKind,
    InsertTextMode? insertTextMode,
    bool? contextSupport,
    CompletionClientCapabilitiesCompletionList? completionList,
  }) = _CompletionClientCapabilities;

  static CompletionClientCapabilities fromJson(Map<String, Object?> json) =>
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

@freezed
abstract class HoverClientCapabilities with _$HoverClientCapabilities {
  const HoverClientCapabilities._();

  const factory HoverClientCapabilities({
    bool? dynamicRegistration,
    List<MarkupKind>? contentFormat,
  }) = _HoverClientCapabilities;

  static HoverClientCapabilities fromJson(Map<String, Object?> json) =>
      HoverClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        contentFormat: (json['contentFormat'] as List<Object?>?)
            ?.map((e) => e as MarkupKind)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'contentFormat': contentFormat,
    };
  }
}

/// Client Capabilities for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpClientCapabilities
    with _$SignatureHelpClientCapabilities {
  const SignatureHelpClientCapabilities._();

  const factory SignatureHelpClientCapabilities({
    bool? dynamicRegistration,
    SignatureHelpClientCapabilitiesSignatureInformation? signatureInformation,
    bool? contextSupport,
  }) = _SignatureHelpClientCapabilities;

  static SignatureHelpClientCapabilities fromJson(Map<String, Object?> json) =>
      SignatureHelpClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        signatureInformation: json['signatureInformation'] == null
            ? null
            : SignatureHelpClientCapabilitiesSignatureInformation.fromJson(
                json['signatureInformation'] as Map<String, Object?>,
              ),
        contextSupport: json['contextSupport'] as bool?,
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
@freezed
abstract class DeclarationClientCapabilities
    with _$DeclarationClientCapabilities {
  const DeclarationClientCapabilities._();

  const factory DeclarationClientCapabilities({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) = _DeclarationClientCapabilities;

  static DeclarationClientCapabilities fromJson(Map<String, Object?> json) =>
      DeclarationClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        linkSupport: json['linkSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Client Capabilities for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionClientCapabilities
    with _$DefinitionClientCapabilities {
  const DefinitionClientCapabilities._();

  const factory DefinitionClientCapabilities({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) = _DefinitionClientCapabilities;

  static DefinitionClientCapabilities fromJson(Map<String, Object?> json) =>
      DefinitionClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        linkSupport: json['linkSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Since 3.6.0
@freezed
abstract class TypeDefinitionClientCapabilities
    with _$TypeDefinitionClientCapabilities {
  const TypeDefinitionClientCapabilities._();

  const factory TypeDefinitionClientCapabilities({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) = _TypeDefinitionClientCapabilities;

  static TypeDefinitionClientCapabilities fromJson(Map<String, Object?> json) =>
      TypeDefinitionClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        linkSupport: json['linkSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// @since 3.6.0
@freezed
abstract class ImplementationClientCapabilities
    with _$ImplementationClientCapabilities {
  const ImplementationClientCapabilities._();

  const factory ImplementationClientCapabilities({
    bool? dynamicRegistration,
    bool? linkSupport,
  }) = _ImplementationClientCapabilities;

  static ImplementationClientCapabilities fromJson(Map<String, Object?> json) =>
      ImplementationClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        linkSupport: json['linkSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Client Capabilities for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceClientCapabilities with _$ReferenceClientCapabilities {
  const ReferenceClientCapabilities._();

  const factory ReferenceClientCapabilities({bool? dynamicRegistration}) =
      _ReferenceClientCapabilities;

  static ReferenceClientCapabilities fromJson(Map<String, Object?> json) =>
      ReferenceClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightClientCapabilities
    with _$DocumentHighlightClientCapabilities {
  const DocumentHighlightClientCapabilities._();

  const factory DocumentHighlightClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentHighlightClientCapabilities;

  static DocumentHighlightClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => DocumentHighlightClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client Capabilities for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolClientCapabilities
    with _$DocumentSymbolClientCapabilities {
  const DocumentSymbolClientCapabilities._();

  const factory DocumentSymbolClientCapabilities({
    bool? dynamicRegistration,
    DocumentSymbolClientCapabilitiesSymbolKind? symbolKind,
    bool? hierarchicalDocumentSymbolSupport,
    DocumentSymbolClientCapabilitiesTagSupport? tagSupport,
    bool? labelSupport,
  }) = _DocumentSymbolClientCapabilities;

  static DocumentSymbolClientCapabilities fromJson(Map<String, Object?> json) =>
      DocumentSymbolClientCapabilities(
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
@freezed
abstract class CodeActionClientCapabilities
    with _$CodeActionClientCapabilities {
  const CodeActionClientCapabilities._();

  const factory CodeActionClientCapabilities({
    bool? dynamicRegistration,
    CodeActionClientCapabilitiesCodeActionLiteralSupport?
    codeActionLiteralSupport,
    bool? isPreferredSupport,
    bool? disabledSupport,
    bool? dataSupport,
    CodeActionClientCapabilitiesResolveSupport? resolveSupport,
    bool? honorsChangeAnnotations,
  }) = _CodeActionClientCapabilities;

  static CodeActionClientCapabilities fromJson(Map<String, Object?> json) =>
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
@freezed
abstract class CodeLensClientCapabilities with _$CodeLensClientCapabilities {
  const CodeLensClientCapabilities._();

  const factory CodeLensClientCapabilities({bool? dynamicRegistration}) =
      _CodeLensClientCapabilities;

  static CodeLensClientCapabilities fromJson(Map<String, Object?> json) =>
      CodeLensClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// The client capabilities of a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkClientCapabilities
    with _$DocumentLinkClientCapabilities {
  const DocumentLinkClientCapabilities._();

  const factory DocumentLinkClientCapabilities({
    bool? dynamicRegistration,
    bool? tooltipSupport,
  }) = _DocumentLinkClientCapabilities;

  static DocumentLinkClientCapabilities fromJson(Map<String, Object?> json) =>
      DocumentLinkClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        tooltipSupport: json['tooltipSupport'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'tooltipSupport': tooltipSupport,
    };
  }
}

@freezed
abstract class DocumentColorClientCapabilities
    with _$DocumentColorClientCapabilities {
  const DocumentColorClientCapabilities._();

  const factory DocumentColorClientCapabilities({bool? dynamicRegistration}) =
      _DocumentColorClientCapabilities;

  static DocumentColorClientCapabilities fromJson(Map<String, Object?> json) =>
      DocumentColorClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities of a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingClientCapabilities
    with _$DocumentFormattingClientCapabilities {
  const DocumentFormattingClientCapabilities._();

  const factory DocumentFormattingClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentFormattingClientCapabilities;

  static DocumentFormattingClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => DocumentFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingClientCapabilities
    with _$DocumentRangeFormattingClientCapabilities {
  const DocumentRangeFormattingClientCapabilities._();

  const factory DocumentRangeFormattingClientCapabilities({
    bool? dynamicRegistration,
    bool? rangesSupport,
  }) = _DocumentRangeFormattingClientCapabilities;

  static DocumentRangeFormattingClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => DocumentRangeFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    rangesSupport: json['rangesSupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'rangesSupport': rangesSupport,
    };
  }
}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingClientCapabilities
    with _$DocumentOnTypeFormattingClientCapabilities {
  const DocumentOnTypeFormattingClientCapabilities._();

  const factory DocumentOnTypeFormattingClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentOnTypeFormattingClientCapabilities;

  static DocumentOnTypeFormattingClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => DocumentOnTypeFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

@freezed
abstract class RenameClientCapabilities with _$RenameClientCapabilities {
  const RenameClientCapabilities._();

  const factory RenameClientCapabilities({
    bool? dynamicRegistration,
    bool? prepareSupport,
    PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior,
    bool? honorsChangeAnnotations,
  }) = _RenameClientCapabilities;

  static RenameClientCapabilities fromJson(Map<String, Object?> json) =>
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

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'prepareSupport': prepareSupport,
      'prepareSupportDefaultBehavior': prepareSupportDefaultBehavior?.value,
      'honorsChangeAnnotations': honorsChangeAnnotations,
    };
  }
}

@freezed
abstract class FoldingRangeClientCapabilities
    with _$FoldingRangeClientCapabilities {
  const FoldingRangeClientCapabilities._();

  const factory FoldingRangeClientCapabilities({
    bool? dynamicRegistration,
    int? rangeLimit,
    bool? lineFoldingOnly,
    FoldingRangeClientCapabilitiesFoldingRangeKind? foldingRangeKind,
    FoldingRangeClientCapabilitiesFoldingRange? foldingRange,
  }) = _FoldingRangeClientCapabilities;

  static FoldingRangeClientCapabilities fromJson(Map<String, Object?> json) =>
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

@freezed
abstract class SelectionRangeClientCapabilities
    with _$SelectionRangeClientCapabilities {
  const SelectionRangeClientCapabilities._();

  const factory SelectionRangeClientCapabilities({bool? dynamicRegistration}) =
      _SelectionRangeClientCapabilities;

  static SelectionRangeClientCapabilities fromJson(Map<String, Object?> json) =>
      SelectionRangeClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// The publish diagnostic client capabilities.
@freezed
abstract class PublishDiagnosticsClientCapabilities
    with _$PublishDiagnosticsClientCapabilities {
  const PublishDiagnosticsClientCapabilities._();

  const factory PublishDiagnosticsClientCapabilities({
    bool? relatedInformation,
    PublishDiagnosticsClientCapabilitiesTagSupport? tagSupport,
    bool? versionSupport,
    bool? codeDescriptionSupport,
    bool? dataSupport,
  }) = _PublishDiagnosticsClientCapabilities;

  static PublishDiagnosticsClientCapabilities fromJson(
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
@freezed
abstract class CallHierarchyClientCapabilities
    with _$CallHierarchyClientCapabilities {
  const CallHierarchyClientCapabilities._();

  const factory CallHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _CallHierarchyClientCapabilities;

  static CallHierarchyClientCapabilities fromJson(Map<String, Object?> json) =>
      CallHierarchyClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensClientCapabilities
    with _$SemanticTokensClientCapabilities {
  const SemanticTokensClientCapabilities._();

  const factory SemanticTokensClientCapabilities({
    bool? dynamicRegistration,
    required SemanticTokensClientCapabilitiesRequests requests,
    required List<String> tokenTypes,
    required List<String> tokenModifiers,
    required List<TokenFormat> formats,
    bool? overlappingTokenSupport,
    bool? multilineTokenSupport,
    bool? serverCancelSupport,
    bool? augmentsSyntaxTokens,
  }) = _SemanticTokensClientCapabilities;

  static SemanticTokensClientCapabilities fromJson(Map<String, Object?> json) =>
      SemanticTokensClientCapabilities(
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
@freezed
abstract class LinkedEditingRangeClientCapabilities
    with _$LinkedEditingRangeClientCapabilities {
  const LinkedEditingRangeClientCapabilities._();

  const factory LinkedEditingRangeClientCapabilities({
    bool? dynamicRegistration,
  }) = _LinkedEditingRangeClientCapabilities;

  static LinkedEditingRangeClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => LinkedEditingRangeClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities specific to the moniker request.
///
/// @since 3.16.0
@freezed
abstract class MonikerClientCapabilities with _$MonikerClientCapabilities {
  const MonikerClientCapabilities._();

  const factory MonikerClientCapabilities({bool? dynamicRegistration}) =
      _MonikerClientCapabilities;

  static MonikerClientCapabilities fromJson(Map<String, Object?> json) =>
      MonikerClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.17.0
@freezed
abstract class TypeHierarchyClientCapabilities
    with _$TypeHierarchyClientCapabilities {
  const TypeHierarchyClientCapabilities._();

  const factory TypeHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _TypeHierarchyClientCapabilities;

  static TypeHierarchyClientCapabilities fromJson(Map<String, Object?> json) =>
      TypeHierarchyClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities specific to inline values.
///
/// @since 3.17.0
@freezed
abstract class InlineValueClientCapabilities
    with _$InlineValueClientCapabilities {
  const InlineValueClientCapabilities._();

  const factory InlineValueClientCapabilities({bool? dynamicRegistration}) =
      _InlineValueClientCapabilities;

  static InlineValueClientCapabilities fromJson(Map<String, Object?> json) =>
      InlineValueClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Inlay hint client capabilities.
///
/// @since 3.17.0
@freezed
abstract class InlayHintClientCapabilities with _$InlayHintClientCapabilities {
  const InlayHintClientCapabilities._();

  const factory InlayHintClientCapabilities({
    bool? dynamicRegistration,
    InlayHintClientCapabilitiesResolveSupport? resolveSupport,
  }) = _InlayHintClientCapabilities;

  static InlayHintClientCapabilities fromJson(Map<String, Object?> json) =>
      InlayHintClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        resolveSupport: json['resolveSupport'] == null
            ? null
            : InlayHintClientCapabilitiesResolveSupport.fromJson(
                json['resolveSupport'] as Map<String, Object?>,
              ),
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
@freezed
abstract class DiagnosticClientCapabilities
    with _$DiagnosticClientCapabilities {
  const DiagnosticClientCapabilities._();

  const factory DiagnosticClientCapabilities({
    bool? dynamicRegistration,
    bool? relatedDocumentSupport,
  }) = _DiagnosticClientCapabilities;

  static DiagnosticClientCapabilities fromJson(Map<String, Object?> json) =>
      DiagnosticClientCapabilities(
        dynamicRegistration: json['dynamicRegistration'] as bool?,
        relatedDocumentSupport: json['relatedDocumentSupport'] as bool?,
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
@freezed
abstract class InlineCompletionClientCapabilities
    with _$InlineCompletionClientCapabilities {
  const InlineCompletionClientCapabilities._();

  const factory InlineCompletionClientCapabilities({
    bool? dynamicRegistration,
  }) = _InlineCompletionClientCapabilities;

  static InlineCompletionClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => InlineCompletionClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'dynamicRegistration': dynamicRegistration};
  }
}

/// Notebook specific client capabilities.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentSyncClientCapabilities
    with _$NotebookDocumentSyncClientCapabilities {
  const NotebookDocumentSyncClientCapabilities._();

  const factory NotebookDocumentSyncClientCapabilities({
    bool? dynamicRegistration,
    bool? executionSummarySupport,
  }) = _NotebookDocumentSyncClientCapabilities;

  static NotebookDocumentSyncClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => NotebookDocumentSyncClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
    executionSummarySupport: json['executionSummarySupport'] as bool?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'dynamicRegistration': dynamicRegistration,
      'executionSummarySupport': executionSummarySupport,
    };
  }
}

/// Show message request client capabilities
@freezed
abstract class ShowMessageRequestClientCapabilities
    with _$ShowMessageRequestClientCapabilities {
  const ShowMessageRequestClientCapabilities._();

  const factory ShowMessageRequestClientCapabilities({
    ShowMessageRequestClientCapabilitiesMessageActionItem? messageActionItem,
  }) = _ShowMessageRequestClientCapabilities;

  static ShowMessageRequestClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => ShowMessageRequestClientCapabilities(
    messageActionItem: json['messageActionItem'] == null
        ? null
        : ShowMessageRequestClientCapabilitiesMessageActionItem.fromJson(
            json['messageActionItem'] as Map<String, Object?>,
          ),
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'messageActionItem': messageActionItem?.toJson()};
  }
}

/// Client capabilities for the showDocument request.
///
/// @since 3.16.0
@freezed
abstract class ShowDocumentClientCapabilities
    with _$ShowDocumentClientCapabilities {
  const ShowDocumentClientCapabilities._();

  const factory ShowDocumentClientCapabilities({required bool support}) =
      _ShowDocumentClientCapabilities;

  static ShowDocumentClientCapabilities fromJson(Map<String, Object?> json) =>
      ShowDocumentClientCapabilities(support: json['support'] as bool);

  Map<String, Object?> toJson() {
    return <String, Object?>{'support': support};
  }
}

/// Client capabilities specific to regular expressions.
///
/// @since 3.16.0
@freezed
abstract class RegularExpressionsClientCapabilities
    with _$RegularExpressionsClientCapabilities {
  const RegularExpressionsClientCapabilities._();

  const factory RegularExpressionsClientCapabilities({
    required String engine,
    String? version,
  }) = _RegularExpressionsClientCapabilities;

  static RegularExpressionsClientCapabilities fromJson(
    Map<String, Object?> json,
  ) => RegularExpressionsClientCapabilities(
    engine: json['engine'] as String,
    version: json['version'] as String?,
  );

  Map<String, Object?> toJson() {
    return <String, Object?>{'engine': engine, 'version': version};
  }
}

/// Client capabilities specific to the used markdown parser.
///
/// @since 3.16.0
@freezed
abstract class MarkdownClientCapabilities with _$MarkdownClientCapabilities {
  const MarkdownClientCapabilities._();

  const factory MarkdownClientCapabilities({
    required String parser,
    String? version,
    List<String>? allowedTags,
  }) = _MarkdownClientCapabilities;

  static MarkdownClientCapabilities fromJson(Map<String, Object?> json) =>
      MarkdownClientCapabilities(
        parser: json['parser'] as String,
        version: json['version'] as String?,
        allowedTags: (json['allowedTags'] as List<Object?>?)
            ?.map((e) => e as String)
            .toList(),
      );

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'parser': parser,
      'version': version,
      'allowedTags': allowedTags,
    };
  }
}
