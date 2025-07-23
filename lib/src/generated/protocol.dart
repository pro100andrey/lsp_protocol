// Freezed header not implemented for generation
import 'package:freezed_annotation/freezed_annotation.dart';
part 'protocol.freezed.dart';
part 'protocol.g.dart';

/// The definition of a symbol represented as one or many {@link Location
/// locations}. For most programming languages there is only one location at
/// which a symbol is defined.
/// Servers should prefer returning `DefinitionLink` over `Definition` if
/// supported by the client.
typedef Definition = DefinitionBase;

/// Information about where a symbol is defined.
/// Provides additional metadata over normal {@link Location location}
/// definitions, including the range of the defining symbol
typedef DefinitionLink = LocationLink;

/// LSP arrays. @since 3.17.0
typedef LSPArray = List<LSPAny>;

/// The LSP any type. Please note that strictly speaking a property with the
/// value `undefined` can't be converted into JSON preserving the property
/// name. However for convenience it is allowed and assumed that all these
/// properties are optional as well. @since 3.17.0
typedef LSPAny = LSPAnyBase;

/// The declaration of a symbol representation as one or many {@link Location
/// locations}.
typedef Declaration = DefinitionBase;

/// Information about where a symbol is declared.
/// Provides additional metadata over normal {@link Location location}
/// declarations, including the range of the declaring symbol.
/// Servers should prefer returning `DeclarationLink` over `Declaration` if
/// supported by the client.
typedef DeclarationLink = LocationLink;

/// Inline value information can be provided by different means: - directly as
/// a text value (class InlineValueText). - as a name to use for a variable
/// lookup (class InlineValueVariableLookup) - as an evaluatable expression
/// (class InlineValueEvaluatableExpression) The InlineValue types combines all
/// inline value types into one type.
/// @since 3.17.0
typedef InlineValue = InlineValueBase;

/// The result of a document diagnostic pull request. A report can either be a
/// full report containing all diagnostics for the requested document or an
/// unchanged report indicating that nothing has changed in terms of
/// diagnostics in comparison to the last pull request.
/// @since 3.17.0
typedef DocumentDiagnosticReport = DocumentDiagnosticReportBase;
typedef PrepareRenameResult = PrepareRenameResultBase;

/// A document selector is the combination of one or many document filters.
/// @sample `let sel:DocumentSelector = [{ language: 'typescript' }, {
/// language: 'json', pattern: '**∕tsconfig.json' }]`;
/// The use of a string as a document filter is deprecated @since 3.16.0.
typedef DocumentSelector = List<DocumentFilter>;
typedef ProgressToken = ProgressTokenBase;

/// An identifier to refer to a change annotation stored with a workspace edit.
typedef ChangeAnnotationIdentifier = String;

/// A workspace diagnostic document report.
/// @since 3.17.0
typedef WorkspaceDocumentDiagnosticReport =
    WorkspaceDocumentDiagnosticReportBase;

/// An event describing a change to a text document. If only a text is provided
/// it is considered to be the full content of the document.
typedef TextDocumentContentChangeEvent = TextDocumentContentChangeEventBase;

/// MarkedString can be used to render human readable text. It is either a
/// markdown string or a code-block that provides a language and a code
/// snippet. The language identifier is semantically equal to the optional
/// language identifier in fenced code blocks in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
/// The pair of a language and a value is an equivalent to markdown:
/// ```${language} ${value} ```
/// Note that markdown strings will be sanitized - that means html will be
/// escaped. @deprecated use MarkupContent instead.
typedef MarkedString = MarkedStringBase;

/// A document filter describes a top level text document or a notebook cell
/// document.
/// @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
typedef DocumentFilter = DocumentFilterBase;

/// LSP object definition. @since 3.17.0
typedef LSPObject = Map<String, LSPAny>;

/// The glob pattern. Either a string pattern or a relative pattern.
/// @since 3.17.0
typedef GlobPattern = GlobPatternBase;

/// A document filter denotes a document by different properties like the
/// {@link TextDocument.languageId language}, the {@link Uri.scheme scheme} of
/// its resource, or a glob-pattern that is applied to the {@link
/// TextDocument.fileName path}.
/// Glob patterns can have the following syntax: - `*` to match zero or more
/// characters in a path segment - `?` to match on one character in a path
/// segment - `**` to match any number of path segments, including none - `{}`
/// to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches
/// all TypeScript and JavaScript files) - `[]` to declare a range of
/// characters to match in a path segment (e.g., `example.[0-9]` to match on
/// `example.0`, `example.1`, …) - `[!...]` to negate a range of characters to
/// match in a path segment (e.g., `example.[!0-9]` to match on `example.a`,
/// `example.b`, but not `example.0`)
/// @sample A language filter that applies to typescript files on disk: `{
/// language: 'typescript', scheme: 'file' }` @sample A language filter that
/// applies to all package.json paths: `{ language: 'json', pattern:
/// '**package.json' }`
/// @since 3.17.0
typedef TextDocumentFilter = TextDocumentFilterBase;

/// A notebook document filter denotes a notebook document by different
/// properties. The properties will be match against the notebook's URI (same
/// as with documents)
/// @since 3.17.0
typedef NotebookDocumentFilter = NotebookDocumentFilterBase;

/// The glob pattern to watch relative to the base path. Glob patterns can have
/// the following syntax: - `*` to match zero or more characters in a path
/// segment - `?` to match on one character in a path segment - `**` to match
/// any number of path segments, including none - `{}` to group conditions
/// (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files) - `[]`
/// to declare a range of characters to match in a path segment (e.g.,
/// `example.[0-9]` to match on `example.0`, `example.1`, …) - `[!...]` to
/// negate a range of characters to match in a path segment (e.g.,
/// `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
/// @since 3.17.0
typedef Pattern = String;

/// Owned by: Definition(Alias)
/// Owned by: Declaration(Alias)
///
/// Type: Location
/// Type: Array<Location>
@freezed
sealed class DefinitionBase with _$DefinitionBase {
  const factory DefinitionBase.from1({required Location value}) = Definition0;

  const factory DefinitionBase.from2({required List<Location> value}) =
      Definition1;

  factory DefinitionBase.fromJson(Map<String, dynamic> json) =>
      _$DefinitionBaseFromJson(json);
}

/// Owned by: LSPAny(Alias)
///
/// Type: LSPObject
/// Type: LSPArray
/// Type: String
/// Type: Integer
/// Type: Uinteger
/// Type: Decimal
/// Type: Boolean
/// Type: Null
@freezed
sealed class LSPAnyBase with _$LSPAnyBase {
  const factory LSPAnyBase.from1({required LSPObject value}) = LSPAny0;

  const factory LSPAnyBase.from2({required LSPArray value}) = LSPAny1;

  const factory LSPAnyBase.from3({required String value}) = LSPAny2;

  const factory LSPAnyBase.from4({required int value}) = LSPAny3;

  const factory LSPAnyBase.from5({required int value}) = LSPAny4;

  const factory LSPAnyBase.from6({required double value}) = LSPAny5;

  const factory LSPAnyBase.from7({required bool value}) = LSPAny6;

  factory LSPAnyBase.fromJson(Map<String, dynamic> json) =>
      _$LSPAnyBaseFromJson(json);
}

/// Owned by: InlineValue(Alias)
///
/// Type: InlineValueText
/// Type: InlineValueVariableLookup
/// Type: InlineValueEvaluatableExpression
@freezed
sealed class InlineValueBase with _$InlineValueBase {
  const factory InlineValueBase.from1({required InlineValueText value}) =
      InlineValue0;

  const factory InlineValueBase.from2({
    required InlineValueVariableLookup value,
  }) = InlineValue1;

  const factory InlineValueBase.from3({
    required InlineValueEvaluatableExpression value,
  }) = InlineValue2;

  factory InlineValueBase.fromJson(Map<String, dynamic> json) =>
      _$InlineValueBaseFromJson(json);
}

/// Owned by: DocumentDiagnosticReport(Alias)
///
/// Type: RelatedFullDocumentDiagnosticReport
/// Type: RelatedUnchangedDocumentDiagnosticReport
@freezed
sealed class DocumentDiagnosticReportBase with _$DocumentDiagnosticReportBase {
  const factory DocumentDiagnosticReportBase.from1({
    required RelatedFullDocumentDiagnosticReport value,
  }) = DocumentDiagnosticReport0;

  const factory DocumentDiagnosticReportBase.from2({
    required RelatedUnchangedDocumentDiagnosticReport value,
  }) = DocumentDiagnosticReport1;

  factory DocumentDiagnosticReportBase.fromJson(Map<String, dynamic> json) =>
      _$DocumentDiagnosticReportBaseFromJson(json);
}

/// Owned by: PrepareRenameResult(Alias)
///
/// Type: Range
/// Type: ({Range range, String placeholder})
/// Type: ({bool defaultBehavior})
@freezed
sealed class PrepareRenameResultBase with _$PrepareRenameResultBase {
  const factory PrepareRenameResultBase.from1({required Range value}) =
      PrepareRenameResult0;

  const factory PrepareRenameResultBase.from2({
    required ({Range range, String placeholder}) value,
  }) = PrepareRenameResult1;

  const factory PrepareRenameResultBase.from3({
    required ({bool defaultBehavior}) value,
  }) = PrepareRenameResult2;

  factory PrepareRenameResultBase.fromJson(Map<String, dynamic> json) =>
      _$PrepareRenameResultBaseFromJson(json);
}

/// Owned by: ProgressToken(Alias)
/// Owned by: CancelParams(id)
/// Owned by: Diagnostic(code)
///
/// Type: Integer
/// Type: String
@freezed
sealed class ProgressTokenBase with _$ProgressTokenBase {
  const factory ProgressTokenBase.from1({required int value}) = ProgressToken0;

  const factory ProgressTokenBase.from2({required String value}) =
      ProgressToken1;

  factory ProgressTokenBase.fromJson(Map<String, dynamic> json) =>
      _$ProgressTokenBaseFromJson(json);
}

/// Owned by: WorkspaceDocumentDiagnosticReport(Alias)
///
/// Type: WorkspaceFullDocumentDiagnosticReport
/// Type: WorkspaceUnchangedDocumentDiagnosticReport
@freezed
sealed class WorkspaceDocumentDiagnosticReportBase
    with _$WorkspaceDocumentDiagnosticReportBase {
  const factory WorkspaceDocumentDiagnosticReportBase.from1({
    required WorkspaceFullDocumentDiagnosticReport value,
  }) = WorkspaceDocumentDiagnosticReport0;

  const factory WorkspaceDocumentDiagnosticReportBase.from2({
    required WorkspaceUnchangedDocumentDiagnosticReport value,
  }) = WorkspaceDocumentDiagnosticReport1;

  factory WorkspaceDocumentDiagnosticReportBase.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceDocumentDiagnosticReportBaseFromJson(json);
}

/// Owned by: TextDocumentContentChangeEvent(Alias)
///
/// Type: ({Range range, int? rangeLength, String text})
/// Type: ({String text})
@freezed
sealed class TextDocumentContentChangeEventBase
    with _$TextDocumentContentChangeEventBase {
  const factory TextDocumentContentChangeEventBase.from1({
    required ({Range range, int? rangeLength, String text}) value,
  }) = TextDocumentContentChangeEvent0;

  const factory TextDocumentContentChangeEventBase.from2({
    required ({String text}) value,
  }) = TextDocumentContentChangeEvent1;

  factory TextDocumentContentChangeEventBase.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentContentChangeEventBaseFromJson(json);
}

/// Owned by: MarkedString(Alias)
///
/// Type: String
/// Type: ({String language, String value})
@freezed
sealed class MarkedStringBase with _$MarkedStringBase {
  const factory MarkedStringBase.from1({required String value}) = MarkedString0;

  const factory MarkedStringBase.from2({
    required ({String language, String value}) value,
  }) = MarkedString1;

  factory MarkedStringBase.fromJson(Map<String, dynamic> json) =>
      _$MarkedStringBaseFromJson(json);
}

/// Owned by: DocumentFilter(Alias)
///
/// Type: TextDocumentFilter
/// Type: NotebookCellTextDocumentFilter
@freezed
sealed class DocumentFilterBase with _$DocumentFilterBase {
  const factory DocumentFilterBase.from1({required TextDocumentFilter value}) =
      DocumentFilter0;

  const factory DocumentFilterBase.from2({
    required NotebookCellTextDocumentFilter value,
  }) = DocumentFilter1;

  factory DocumentFilterBase.fromJson(Map<String, dynamic> json) =>
      _$DocumentFilterBaseFromJson(json);
}

/// Owned by: GlobPattern(Alias)
///
/// Type: Pattern
/// Type: RelativePattern
@freezed
sealed class GlobPatternBase with _$GlobPatternBase {
  const factory GlobPatternBase.from1({required Pattern value}) = GlobPattern0;

  const factory GlobPatternBase.from2({required RelativePattern value}) =
      GlobPattern1;

  factory GlobPatternBase.fromJson(Map<String, dynamic> json) =>
      _$GlobPatternBaseFromJson(json);
}

/// Owned by: TextDocumentFilter(Alias)
///
/// Type: ({String language, String? scheme, String? pattern})
/// Type: ({String? language, String scheme, String? pattern})
/// Type: ({String? language, String? scheme, String pattern})
@freezed
sealed class TextDocumentFilterBase with _$TextDocumentFilterBase {
  const factory TextDocumentFilterBase.from1({
    required ({String language, String? scheme, String? pattern}) value,
  }) = TextDocumentFilter0;

  const factory TextDocumentFilterBase.from2({
    required ({String? language, String scheme, String? pattern}) value,
  }) = TextDocumentFilter1;

  const factory TextDocumentFilterBase.from3({
    required ({String? language, String? scheme, String pattern}) value,
  }) = TextDocumentFilter2;

  factory TextDocumentFilterBase.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentFilterBaseFromJson(json);
}

/// Owned by: NotebookDocumentFilter(Alias)
///
/// Type: ({String notebookType, String? scheme, String? pattern})
/// Type: ({String? notebookType, String scheme, String? pattern})
/// Type: ({String? notebookType, String? scheme, String pattern})
@freezed
sealed class NotebookDocumentFilterBase with _$NotebookDocumentFilterBase {
  const factory NotebookDocumentFilterBase.from1({
    required ({String notebookType, String? scheme, String? pattern}) value,
  }) = NotebookDocumentFilter0;

  const factory NotebookDocumentFilterBase.from2({
    required ({String? notebookType, String scheme, String? pattern}) value,
  }) = NotebookDocumentFilter1;

  const factory NotebookDocumentFilterBase.from3({
    required ({String? notebookType, String? scheme, String pattern}) value,
  }) = NotebookDocumentFilter2;

  factory NotebookDocumentFilterBase.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentFilterBaseFromJson(json);
}

/// Owned by: TextDocumentRegistrationOptions(documentSelector)
///
/// Type: DocumentSelector
/// Type: Null
@freezed
sealed class TextDocumentRegistrationOptionsDocumentSelectorBase
    with _$TextDocumentRegistrationOptionsDocumentSelectorBase {
  const factory TextDocumentRegistrationOptionsDocumentSelectorBase.from1({
    required DocumentSelector value,
  }) = TextDocumentRegistrationOptionsDocumentSelector0;

  factory TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentRegistrationOptionsDocumentSelectorBaseFromJson(json);
}

/// Owned by: WorkspaceEdit(documentChanges)
///
/// Type: TextDocumentEdit
/// Type: CreateFile
/// Type: RenameFile
/// Type: DeleteFile
@freezed
sealed class WorkspaceEditDocumentChangesBase
    with _$WorkspaceEditDocumentChangesBase {
  const factory WorkspaceEditDocumentChangesBase.from1({
    required TextDocumentEdit value,
  }) = WorkspaceEditDocumentChanges0;

  const factory WorkspaceEditDocumentChangesBase.from2({
    required CreateFile value,
  }) = WorkspaceEditDocumentChanges1;

  const factory WorkspaceEditDocumentChangesBase.from3({
    required RenameFile value,
  }) = WorkspaceEditDocumentChanges2;

  const factory WorkspaceEditDocumentChangesBase.from4({
    required DeleteFile value,
  }) = WorkspaceEditDocumentChanges3;

  factory WorkspaceEditDocumentChangesBase.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceEditDocumentChangesBaseFromJson(json);
}

/// Owned by: InlayHint(label)
///
/// Type: String
/// Type: Array<InlayHintLabelPart>
@freezed
sealed class InlayHintLabelBase with _$InlayHintLabelBase {
  const factory InlayHintLabelBase.from1({required String value}) =
      InlayHintLabel0;

  const factory InlayHintLabelBase.from2({
    required List<InlayHintLabelPart> value,
  }) = InlayHintLabel1;

  factory InlayHintLabelBase.fromJson(Map<String, dynamic> json) =>
      _$InlayHintLabelBaseFromJson(json);
}

/// Owned by: InlayHint(tooltip)
/// Owned by: CompletionItem(documentation)
/// Owned by: InlayHintLabelPart(tooltip)
/// Owned by: SignatureInformation(documentation)
/// Owned by: ParameterInformation(documentation)
///
/// Type: String
/// Type: MarkupContent
@freezed
sealed class TooltipOrDocumentationBase with _$TooltipOrDocumentationBase {
  const factory TooltipOrDocumentationBase.from1({required String value}) =
      TooltipOrDocumentation0;

  const factory TooltipOrDocumentationBase.from2({
    required MarkupContent value,
  }) = TooltipOrDocumentation1;

  factory TooltipOrDocumentationBase.fromJson(Map<String, dynamic> json) =>
      _$TooltipOrDocumentationBaseFromJson(json);
}

/// Owned by: DocumentDiagnosticReportPartialResult(relatedDocuments)
/// Owned by: RelatedFullDocumentDiagnosticReport(relatedDocuments)
/// Owned by: RelatedUnchangedDocumentDiagnosticReport(relatedDocuments)
///
/// Type: FullDocumentDiagnosticReport
/// Type: UnchangedDocumentDiagnosticReport
@freezed
sealed class RelatedDocumentsBase with _$RelatedDocumentsBase {
  const factory RelatedDocumentsBase.from1({
    required FullDocumentDiagnosticReport value,
  }) = RelatedDocuments0;

  const factory RelatedDocumentsBase.from2({
    required UnchangedDocumentDiagnosticReport value,
  }) = RelatedDocuments1;

  factory RelatedDocumentsBase.fromJson(Map<String, dynamic> json) =>
      _$RelatedDocumentsBaseFromJson(json);
}

/// Owned by: InlineCompletionItem(insertText)
///
/// Type: String
/// Type: StringValue
@freezed
sealed class InlineCompletionItemInsertTextBase
    with _$InlineCompletionItemInsertTextBase {
  const factory InlineCompletionItemInsertTextBase.from1({
    required String value,
  }) = InlineCompletionItemInsertText0;

  const factory InlineCompletionItemInsertTextBase.from2({
    required StringValue value,
  }) = InlineCompletionItemInsertText1;

  factory InlineCompletionItemInsertTextBase.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionItemInsertTextBaseFromJson(json);
}

/// Owned by: DidChangeConfigurationRegistrationOptions(section)
///
/// Type: String
/// Type: Array<String>
@freezed
sealed class DidChangeConfigurationRegistrationOptionsSectionBase
    with _$DidChangeConfigurationRegistrationOptionsSectionBase {
  const factory DidChangeConfigurationRegistrationOptionsSectionBase.from1({
    required String value,
  }) = DidChangeConfigurationRegistrationOptionsSection0;

  const factory DidChangeConfigurationRegistrationOptionsSectionBase.from2({
    required List<String> value,
  }) = DidChangeConfigurationRegistrationOptionsSection1;

  factory DidChangeConfigurationRegistrationOptionsSectionBase.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationRegistrationOptionsSectionBaseFromJson(json);
}

/// Owned by: CompletionItem(textEdit)
///
/// Type: TextEdit
/// Type: InsertReplaceEdit
@freezed
sealed class CompletionItemTextEditBase with _$CompletionItemTextEditBase {
  const factory CompletionItemTextEditBase.from1({required TextEdit value}) =
      CompletionItemTextEdit0;

  const factory CompletionItemTextEditBase.from2({
    required InsertReplaceEdit value,
  }) = CompletionItemTextEdit1;

  factory CompletionItemTextEditBase.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemTextEditBaseFromJson(json);
}

/// Owned by: CompletionList(editRange)
///
/// Type: Range
/// Type: ({Range insert, Range replace})
@freezed
sealed class CompletionListEditRangeBase with _$CompletionListEditRangeBase {
  const factory CompletionListEditRangeBase.from1({required Range value}) =
      CompletionListEditRange0;

  const factory CompletionListEditRangeBase.from2({
    required ({Range insert, Range replace}) value,
  }) = CompletionListEditRange1;

  factory CompletionListEditRangeBase.fromJson(Map<String, dynamic> json) =>
      _$CompletionListEditRangeBaseFromJson(json);
}

/// Owned by: Hover(contents)
///
/// Type: MarkupContent
/// Type: MarkedString
/// Type: Array<MarkedString>
@freezed
sealed class HoverContentsBase with _$HoverContentsBase {
  const factory HoverContentsBase.from1({required MarkupContent value}) =
      HoverContents0;

  const factory HoverContentsBase.from2({required MarkedString value}) =
      HoverContents1;

  const factory HoverContentsBase.from3({required List<MarkedString> value}) =
      HoverContents2;

  factory HoverContentsBase.fromJson(Map<String, dynamic> json) =>
      _$HoverContentsBaseFromJson(json);
}

/// Owned by: WorkspaceSymbol(location)
///
/// Type: Location
/// Type: ({String uri})
@freezed
sealed class WorkspaceSymbolLocationBase with _$WorkspaceSymbolLocationBase {
  const factory WorkspaceSymbolLocationBase.from1({required Location value}) =
      WorkspaceSymbolLocation0;

  const factory WorkspaceSymbolLocationBase.from2({
    required ({String uri}) value,
  }) = WorkspaceSymbolLocation1;

  factory WorkspaceSymbolLocationBase.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolLocationBaseFromJson(json);
}

/// Owned by: SemanticTokensOptions(range)
/// Owned by: SemanticTokensClientCapabilities(range)
///
/// Type: Boolean
/// Type: ()
@freezed
sealed class RangeBase with _$RangeBase {
  const factory RangeBase.from1({required bool value}) = Range0;

  const factory RangeBase.from2({required () value}) = Range1;

  factory RangeBase.fromJson(Map<String, dynamic> json) =>
      _$RangeBaseFromJson(json);
}

/// Owned by: SemanticTokensOptions(full)
///
/// Type: Boolean
/// Type: ({bool? delta})
@freezed
sealed class SemanticTokensOptionsFullBase
    with _$SemanticTokensOptionsFullBase {
  const factory SemanticTokensOptionsFullBase.from1({required bool value}) =
      SemanticTokensOptionsFull0;

  const factory SemanticTokensOptionsFullBase.from2({
    required ({bool? delta}) value,
  }) = SemanticTokensOptionsFull1;

  factory SemanticTokensOptionsFullBase.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensOptionsFullBaseFromJson(json);
}

/// Owned by: TextDocumentEdit(edits)
///
/// Type: TextEdit
/// Type: AnnotatedTextEdit
@freezed
sealed class TextDocumentEditEditsBase with _$TextDocumentEditEditsBase {
  const factory TextDocumentEditEditsBase.from1({required TextEdit value}) =
      TextDocumentEditEdits0;

  const factory TextDocumentEditEditsBase.from2({
    required AnnotatedTextEdit value,
  }) = TextDocumentEditEdits1;

  factory TextDocumentEditEditsBase.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentEditEditsBaseFromJson(json);
}

/// Owned by: _InitializeParams(processId)
/// Owned by: OptionalVersionedTextDocumentIdentifier(version)
/// Owned by: WorkspaceFullDocumentDiagnosticReport(version)
/// Owned by: WorkspaceUnchangedDocumentDiagnosticReport(version)
///
/// Type: Integer
/// Type: Null
@freezed
sealed class ProcessIdOrVersionBase with _$ProcessIdOrVersionBase {
  const factory ProcessIdOrVersionBase.from1({required int value}) =
      ProcessIdOrVersion0;

  factory ProcessIdOrVersionBase.fromJson(Map<String, dynamic> json) =>
      _$ProcessIdOrVersionBaseFromJson(json);
}

/// Owned by: _InitializeParams(rootPath)
///
/// Type: String
/// Type: Null
@freezed
sealed class InitializeParamsRootPathBase with _$InitializeParamsRootPathBase {
  const factory InitializeParamsRootPathBase.from1({required String value}) =
      InitializeParamsRootPath0;

  factory InitializeParamsRootPathBase.fromJson(Map<String, dynamic> json) =>
      _$InitializeParamsRootPathBaseFromJson(json);
}

/// Owned by: _InitializeParams(rootUri)
///
/// Type: DocumentUri
/// Type: Null
@freezed
sealed class InitializeParamsRootUriBase with _$InitializeParamsRootUriBase {
  const factory InitializeParamsRootUriBase.from1({required String value}) =
      InitializeParamsRootUri0;

  factory InitializeParamsRootUriBase.fromJson(Map<String, dynamic> json) =>
      _$InitializeParamsRootUriBaseFromJson(json);
}

/// Owned by: WorkspaceFoldersInitializeParams(workspaceFolders)
///
/// Type: Array<WorkspaceFolder>
/// Type: Null
@freezed
sealed class WorkspaceFoldersInitializeParamsWorkspaceFoldersBase
    with _$WorkspaceFoldersInitializeParamsWorkspaceFoldersBase {
  const factory WorkspaceFoldersInitializeParamsWorkspaceFoldersBase.from1({
    required List<WorkspaceFolder> value,
  }) = WorkspaceFoldersInitializeParamsWorkspaceFolders0;

  factory WorkspaceFoldersInitializeParamsWorkspaceFoldersBase.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersInitializeParamsWorkspaceFoldersBaseFromJson(json);
}

/// Owned by: ServerCapabilities(textDocumentSync)
///
/// Type: TextDocumentSyncOptions
/// Type: TextDocumentSyncKind
@freezed
sealed class ServerCapabilitiesTextDocumentSyncBase
    with _$ServerCapabilitiesTextDocumentSyncBase {
  const factory ServerCapabilitiesTextDocumentSyncBase.from1({
    required TextDocumentSyncOptions value,
  }) = ServerCapabilitiesTextDocumentSync0;

  const factory ServerCapabilitiesTextDocumentSyncBase.from2({
    required TextDocumentSyncKind value,
  }) = ServerCapabilitiesTextDocumentSync1;

  factory ServerCapabilitiesTextDocumentSyncBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesTextDocumentSyncBaseFromJson(json);
}

/// Owned by: ServerCapabilities(notebookDocumentSync)
///
/// Type: NotebookDocumentSyncOptions
/// Type: NotebookDocumentSyncRegistrationOptions
@freezed
sealed class ServerCapabilitiesNotebookDocumentSyncBase
    with _$ServerCapabilitiesNotebookDocumentSyncBase {
  const factory ServerCapabilitiesNotebookDocumentSyncBase.from1({
    required NotebookDocumentSyncOptions value,
  }) = ServerCapabilitiesNotebookDocumentSync0;

  const factory ServerCapabilitiesNotebookDocumentSyncBase.from2({
    required NotebookDocumentSyncRegistrationOptions value,
  }) = ServerCapabilitiesNotebookDocumentSync1;

  factory ServerCapabilitiesNotebookDocumentSyncBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesNotebookDocumentSyncBaseFromJson(json);
}

/// Owned by: ServerCapabilities(hoverProvider)
///
/// Type: Boolean
/// Type: HoverOptions
@freezed
sealed class ServerCapabilitiesHoverProviderBase
    with _$ServerCapabilitiesHoverProviderBase {
  const factory ServerCapabilitiesHoverProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesHoverProvider0;

  const factory ServerCapabilitiesHoverProviderBase.from2({
    required HoverOptions value,
  }) = ServerCapabilitiesHoverProvider1;

  factory ServerCapabilitiesHoverProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesHoverProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(declarationProvider)
///
/// Type: Boolean
/// Type: DeclarationOptions
/// Type: DeclarationRegistrationOptions
@freezed
sealed class ServerCapabilitiesDeclarationProviderBase
    with _$ServerCapabilitiesDeclarationProviderBase {
  const factory ServerCapabilitiesDeclarationProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesDeclarationProvider0;

  const factory ServerCapabilitiesDeclarationProviderBase.from2({
    required DeclarationOptions value,
  }) = ServerCapabilitiesDeclarationProvider1;

  const factory ServerCapabilitiesDeclarationProviderBase.from3({
    required DeclarationRegistrationOptions value,
  }) = ServerCapabilitiesDeclarationProvider2;

  factory ServerCapabilitiesDeclarationProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesDeclarationProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(definitionProvider)
///
/// Type: Boolean
/// Type: DefinitionOptions
@freezed
sealed class ServerCapabilitiesDefinitionProviderBase
    with _$ServerCapabilitiesDefinitionProviderBase {
  const factory ServerCapabilitiesDefinitionProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesDefinitionProvider0;

  const factory ServerCapabilitiesDefinitionProviderBase.from2({
    required DefinitionOptions value,
  }) = ServerCapabilitiesDefinitionProvider1;

  factory ServerCapabilitiesDefinitionProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesDefinitionProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(typeDefinitionProvider)
///
/// Type: Boolean
/// Type: TypeDefinitionOptions
/// Type: TypeDefinitionRegistrationOptions
@freezed
sealed class ServerCapabilitiesTypeDefinitionProviderBase
    with _$ServerCapabilitiesTypeDefinitionProviderBase {
  const factory ServerCapabilitiesTypeDefinitionProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesTypeDefinitionProvider0;

  const factory ServerCapabilitiesTypeDefinitionProviderBase.from2({
    required TypeDefinitionOptions value,
  }) = ServerCapabilitiesTypeDefinitionProvider1;

  const factory ServerCapabilitiesTypeDefinitionProviderBase.from3({
    required TypeDefinitionRegistrationOptions value,
  }) = ServerCapabilitiesTypeDefinitionProvider2;

  factory ServerCapabilitiesTypeDefinitionProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesTypeDefinitionProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(implementationProvider)
///
/// Type: Boolean
/// Type: ImplementationOptions
/// Type: ImplementationRegistrationOptions
@freezed
sealed class ServerCapabilitiesImplementationProviderBase
    with _$ServerCapabilitiesImplementationProviderBase {
  const factory ServerCapabilitiesImplementationProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesImplementationProvider0;

  const factory ServerCapabilitiesImplementationProviderBase.from2({
    required ImplementationOptions value,
  }) = ServerCapabilitiesImplementationProvider1;

  const factory ServerCapabilitiesImplementationProviderBase.from3({
    required ImplementationRegistrationOptions value,
  }) = ServerCapabilitiesImplementationProvider2;

  factory ServerCapabilitiesImplementationProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesImplementationProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(referencesProvider)
///
/// Type: Boolean
/// Type: ReferenceOptions
@freezed
sealed class ServerCapabilitiesReferencesProviderBase
    with _$ServerCapabilitiesReferencesProviderBase {
  const factory ServerCapabilitiesReferencesProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesReferencesProvider0;

  const factory ServerCapabilitiesReferencesProviderBase.from2({
    required ReferenceOptions value,
  }) = ServerCapabilitiesReferencesProvider1;

  factory ServerCapabilitiesReferencesProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesReferencesProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(documentHighlightProvider)
///
/// Type: Boolean
/// Type: DocumentHighlightOptions
@freezed
sealed class ServerCapabilitiesDocumentHighlightProviderBase
    with _$ServerCapabilitiesDocumentHighlightProviderBase {
  const factory ServerCapabilitiesDocumentHighlightProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesDocumentHighlightProvider0;

  const factory ServerCapabilitiesDocumentHighlightProviderBase.from2({
    required DocumentHighlightOptions value,
  }) = ServerCapabilitiesDocumentHighlightProvider1;

  factory ServerCapabilitiesDocumentHighlightProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesDocumentHighlightProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(documentSymbolProvider)
///
/// Type: Boolean
/// Type: DocumentSymbolOptions
@freezed
sealed class ServerCapabilitiesDocumentSymbolProviderBase
    with _$ServerCapabilitiesDocumentSymbolProviderBase {
  const factory ServerCapabilitiesDocumentSymbolProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesDocumentSymbolProvider0;

  const factory ServerCapabilitiesDocumentSymbolProviderBase.from2({
    required DocumentSymbolOptions value,
  }) = ServerCapabilitiesDocumentSymbolProvider1;

  factory ServerCapabilitiesDocumentSymbolProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesDocumentSymbolProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(codeActionProvider)
///
/// Type: Boolean
/// Type: CodeActionOptions
@freezed
sealed class ServerCapabilitiesCodeActionProviderBase
    with _$ServerCapabilitiesCodeActionProviderBase {
  const factory ServerCapabilitiesCodeActionProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesCodeActionProvider0;

  const factory ServerCapabilitiesCodeActionProviderBase.from2({
    required CodeActionOptions value,
  }) = ServerCapabilitiesCodeActionProvider1;

  factory ServerCapabilitiesCodeActionProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesCodeActionProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(colorProvider)
///
/// Type: Boolean
/// Type: DocumentColorOptions
/// Type: DocumentColorRegistrationOptions
@freezed
sealed class ServerCapabilitiesColorProviderBase
    with _$ServerCapabilitiesColorProviderBase {
  const factory ServerCapabilitiesColorProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesColorProvider0;

  const factory ServerCapabilitiesColorProviderBase.from2({
    required DocumentColorOptions value,
  }) = ServerCapabilitiesColorProvider1;

  const factory ServerCapabilitiesColorProviderBase.from3({
    required DocumentColorRegistrationOptions value,
  }) = ServerCapabilitiesColorProvider2;

  factory ServerCapabilitiesColorProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesColorProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(workspaceSymbolProvider)
///
/// Type: Boolean
/// Type: WorkspaceSymbolOptions
@freezed
sealed class ServerCapabilitiesWorkspaceSymbolProviderBase
    with _$ServerCapabilitiesWorkspaceSymbolProviderBase {
  const factory ServerCapabilitiesWorkspaceSymbolProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesWorkspaceSymbolProvider0;

  const factory ServerCapabilitiesWorkspaceSymbolProviderBase.from2({
    required WorkspaceSymbolOptions value,
  }) = ServerCapabilitiesWorkspaceSymbolProvider1;

  factory ServerCapabilitiesWorkspaceSymbolProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesWorkspaceSymbolProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(documentFormattingProvider)
///
/// Type: Boolean
/// Type: DocumentFormattingOptions
@freezed
sealed class ServerCapabilitiesDocumentFormattingProviderBase
    with _$ServerCapabilitiesDocumentFormattingProviderBase {
  const factory ServerCapabilitiesDocumentFormattingProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesDocumentFormattingProvider0;

  const factory ServerCapabilitiesDocumentFormattingProviderBase.from2({
    required DocumentFormattingOptions value,
  }) = ServerCapabilitiesDocumentFormattingProvider1;

  factory ServerCapabilitiesDocumentFormattingProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesDocumentFormattingProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(documentRangeFormattingProvider)
///
/// Type: Boolean
/// Type: DocumentRangeFormattingOptions
@freezed
sealed class ServerCapabilitiesDocumentRangeFormattingProviderBase
    with _$ServerCapabilitiesDocumentRangeFormattingProviderBase {
  const factory ServerCapabilitiesDocumentRangeFormattingProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesDocumentRangeFormattingProvider0;

  const factory ServerCapabilitiesDocumentRangeFormattingProviderBase.from2({
    required DocumentRangeFormattingOptions value,
  }) = ServerCapabilitiesDocumentRangeFormattingProvider1;

  factory ServerCapabilitiesDocumentRangeFormattingProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesDocumentRangeFormattingProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(renameProvider)
///
/// Type: Boolean
/// Type: RenameOptions
@freezed
sealed class ServerCapabilitiesRenameProviderBase
    with _$ServerCapabilitiesRenameProviderBase {
  const factory ServerCapabilitiesRenameProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesRenameProvider0;

  const factory ServerCapabilitiesRenameProviderBase.from2({
    required RenameOptions value,
  }) = ServerCapabilitiesRenameProvider1;

  factory ServerCapabilitiesRenameProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesRenameProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(foldingRangeProvider)
///
/// Type: Boolean
/// Type: FoldingRangeOptions
/// Type: FoldingRangeRegistrationOptions
@freezed
sealed class ServerCapabilitiesFoldingRangeProviderBase
    with _$ServerCapabilitiesFoldingRangeProviderBase {
  const factory ServerCapabilitiesFoldingRangeProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesFoldingRangeProvider0;

  const factory ServerCapabilitiesFoldingRangeProviderBase.from2({
    required FoldingRangeOptions value,
  }) = ServerCapabilitiesFoldingRangeProvider1;

  const factory ServerCapabilitiesFoldingRangeProviderBase.from3({
    required FoldingRangeRegistrationOptions value,
  }) = ServerCapabilitiesFoldingRangeProvider2;

  factory ServerCapabilitiesFoldingRangeProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesFoldingRangeProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(selectionRangeProvider)
///
/// Type: Boolean
/// Type: SelectionRangeOptions
/// Type: SelectionRangeRegistrationOptions
@freezed
sealed class ServerCapabilitiesSelectionRangeProviderBase
    with _$ServerCapabilitiesSelectionRangeProviderBase {
  const factory ServerCapabilitiesSelectionRangeProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesSelectionRangeProvider0;

  const factory ServerCapabilitiesSelectionRangeProviderBase.from2({
    required SelectionRangeOptions value,
  }) = ServerCapabilitiesSelectionRangeProvider1;

  const factory ServerCapabilitiesSelectionRangeProviderBase.from3({
    required SelectionRangeRegistrationOptions value,
  }) = ServerCapabilitiesSelectionRangeProvider2;

  factory ServerCapabilitiesSelectionRangeProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesSelectionRangeProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(callHierarchyProvider)
///
/// Type: Boolean
/// Type: CallHierarchyOptions
/// Type: CallHierarchyRegistrationOptions
@freezed
sealed class ServerCapabilitiesCallHierarchyProviderBase
    with _$ServerCapabilitiesCallHierarchyProviderBase {
  const factory ServerCapabilitiesCallHierarchyProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesCallHierarchyProvider0;

  const factory ServerCapabilitiesCallHierarchyProviderBase.from2({
    required CallHierarchyOptions value,
  }) = ServerCapabilitiesCallHierarchyProvider1;

  const factory ServerCapabilitiesCallHierarchyProviderBase.from3({
    required CallHierarchyRegistrationOptions value,
  }) = ServerCapabilitiesCallHierarchyProvider2;

  factory ServerCapabilitiesCallHierarchyProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesCallHierarchyProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(linkedEditingRangeProvider)
///
/// Type: Boolean
/// Type: LinkedEditingRangeOptions
/// Type: LinkedEditingRangeRegistrationOptions
@freezed
sealed class ServerCapabilitiesLinkedEditingRangeProviderBase
    with _$ServerCapabilitiesLinkedEditingRangeProviderBase {
  const factory ServerCapabilitiesLinkedEditingRangeProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesLinkedEditingRangeProvider0;

  const factory ServerCapabilitiesLinkedEditingRangeProviderBase.from2({
    required LinkedEditingRangeOptions value,
  }) = ServerCapabilitiesLinkedEditingRangeProvider1;

  const factory ServerCapabilitiesLinkedEditingRangeProviderBase.from3({
    required LinkedEditingRangeRegistrationOptions value,
  }) = ServerCapabilitiesLinkedEditingRangeProvider2;

  factory ServerCapabilitiesLinkedEditingRangeProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesLinkedEditingRangeProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(semanticTokensProvider)
///
/// Type: SemanticTokensOptions
/// Type: SemanticTokensRegistrationOptions
@freezed
sealed class ServerCapabilitiesSemanticTokensProviderBase
    with _$ServerCapabilitiesSemanticTokensProviderBase {
  const factory ServerCapabilitiesSemanticTokensProviderBase.from1({
    required SemanticTokensOptions value,
  }) = ServerCapabilitiesSemanticTokensProvider0;

  const factory ServerCapabilitiesSemanticTokensProviderBase.from2({
    required SemanticTokensRegistrationOptions value,
  }) = ServerCapabilitiesSemanticTokensProvider1;

  factory ServerCapabilitiesSemanticTokensProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesSemanticTokensProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(monikerProvider)
///
/// Type: Boolean
/// Type: MonikerOptions
/// Type: MonikerRegistrationOptions
@freezed
sealed class ServerCapabilitiesMonikerProviderBase
    with _$ServerCapabilitiesMonikerProviderBase {
  const factory ServerCapabilitiesMonikerProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesMonikerProvider0;

  const factory ServerCapabilitiesMonikerProviderBase.from2({
    required MonikerOptions value,
  }) = ServerCapabilitiesMonikerProvider1;

  const factory ServerCapabilitiesMonikerProviderBase.from3({
    required MonikerRegistrationOptions value,
  }) = ServerCapabilitiesMonikerProvider2;

  factory ServerCapabilitiesMonikerProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesMonikerProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(typeHierarchyProvider)
///
/// Type: Boolean
/// Type: TypeHierarchyOptions
/// Type: TypeHierarchyRegistrationOptions
@freezed
sealed class ServerCapabilitiesTypeHierarchyProviderBase
    with _$ServerCapabilitiesTypeHierarchyProviderBase {
  const factory ServerCapabilitiesTypeHierarchyProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesTypeHierarchyProvider0;

  const factory ServerCapabilitiesTypeHierarchyProviderBase.from2({
    required TypeHierarchyOptions value,
  }) = ServerCapabilitiesTypeHierarchyProvider1;

  const factory ServerCapabilitiesTypeHierarchyProviderBase.from3({
    required TypeHierarchyRegistrationOptions value,
  }) = ServerCapabilitiesTypeHierarchyProvider2;

  factory ServerCapabilitiesTypeHierarchyProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesTypeHierarchyProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(inlineValueProvider)
///
/// Type: Boolean
/// Type: InlineValueOptions
/// Type: InlineValueRegistrationOptions
@freezed
sealed class ServerCapabilitiesInlineValueProviderBase
    with _$ServerCapabilitiesInlineValueProviderBase {
  const factory ServerCapabilitiesInlineValueProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesInlineValueProvider0;

  const factory ServerCapabilitiesInlineValueProviderBase.from2({
    required InlineValueOptions value,
  }) = ServerCapabilitiesInlineValueProvider1;

  const factory ServerCapabilitiesInlineValueProviderBase.from3({
    required InlineValueRegistrationOptions value,
  }) = ServerCapabilitiesInlineValueProvider2;

  factory ServerCapabilitiesInlineValueProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesInlineValueProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(inlayHintProvider)
///
/// Type: Boolean
/// Type: InlayHintOptions
/// Type: InlayHintRegistrationOptions
@freezed
sealed class ServerCapabilitiesInlayHintProviderBase
    with _$ServerCapabilitiesInlayHintProviderBase {
  const factory ServerCapabilitiesInlayHintProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesInlayHintProvider0;

  const factory ServerCapabilitiesInlayHintProviderBase.from2({
    required InlayHintOptions value,
  }) = ServerCapabilitiesInlayHintProvider1;

  const factory ServerCapabilitiesInlayHintProviderBase.from3({
    required InlayHintRegistrationOptions value,
  }) = ServerCapabilitiesInlayHintProvider2;

  factory ServerCapabilitiesInlayHintProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesInlayHintProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(diagnosticProvider)
///
/// Type: DiagnosticOptions
/// Type: DiagnosticRegistrationOptions
@freezed
sealed class ServerCapabilitiesDiagnosticProviderBase
    with _$ServerCapabilitiesDiagnosticProviderBase {
  const factory ServerCapabilitiesDiagnosticProviderBase.from1({
    required DiagnosticOptions value,
  }) = ServerCapabilitiesDiagnosticProvider0;

  const factory ServerCapabilitiesDiagnosticProviderBase.from2({
    required DiagnosticRegistrationOptions value,
  }) = ServerCapabilitiesDiagnosticProvider1;

  factory ServerCapabilitiesDiagnosticProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesDiagnosticProviderBaseFromJson(json);
}

/// Owned by: ServerCapabilities(inlineCompletionProvider)
///
/// Type: Boolean
/// Type: InlineCompletionOptions
@freezed
sealed class ServerCapabilitiesInlineCompletionProviderBase
    with _$ServerCapabilitiesInlineCompletionProviderBase {
  const factory ServerCapabilitiesInlineCompletionProviderBase.from1({
    required bool value,
  }) = ServerCapabilitiesInlineCompletionProvider0;

  const factory ServerCapabilitiesInlineCompletionProviderBase.from2({
    required InlineCompletionOptions value,
  }) = ServerCapabilitiesInlineCompletionProvider1;

  factory ServerCapabilitiesInlineCompletionProviderBase.fromJson(
    Map<String, dynamic> json,
  ) => _$ServerCapabilitiesInlineCompletionProviderBaseFromJson(json);
}

/// Owned by: TextDocumentSyncOptions(save)
///
/// Type: Boolean
/// Type: SaveOptions
@freezed
sealed class TextDocumentSyncOptionsSaveBase
    with _$TextDocumentSyncOptionsSaveBase {
  const factory TextDocumentSyncOptionsSaveBase.from1({required bool value}) =
      TextDocumentSyncOptionsSave0;

  const factory TextDocumentSyncOptionsSaveBase.from2({
    required SaveOptions value,
  }) = TextDocumentSyncOptionsSave1;

  factory TextDocumentSyncOptionsSaveBase.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentSyncOptionsSaveBaseFromJson(json);
}

/// Owned by: NotebookDocumentSyncOptions(notebookSelector)
///
/// Type: ({NotebookCellTextDocumentFilterNotebookBase notebook, List<({String language})>? cells})
/// Type: ({NotebookCellTextDocumentFilterNotebookBase? notebook, List<({String language})> cells})
@freezed
sealed class NotebookDocumentSyncOptionsNotebookSelectorBase
    with _$NotebookDocumentSyncOptionsNotebookSelectorBase {
  const factory NotebookDocumentSyncOptionsNotebookSelectorBase.from1({
    required ({
      NotebookCellTextDocumentFilterNotebookBase notebook,
      List<({String language})>? cells,
    })
    value,
  }) = NotebookDocumentSyncOptionsNotebookSelector0;

  const factory NotebookDocumentSyncOptionsNotebookSelectorBase.from2({
    required ({
      NotebookCellTextDocumentFilterNotebookBase? notebook,
      List<({String language})> cells,
    })
    value,
  }) = NotebookDocumentSyncOptionsNotebookSelector1;

  factory NotebookDocumentSyncOptionsNotebookSelectorBase.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncOptionsNotebookSelectorBaseFromJson(json);
}

/// Owned by: WorkspaceFoldersServerCapabilities(changeNotifications)
///
/// Type: String
/// Type: Boolean
@freezed
sealed class WorkspaceFoldersServerCapabilitiesChangeNotificationsBase
    with _$WorkspaceFoldersServerCapabilitiesChangeNotificationsBase {
  const factory WorkspaceFoldersServerCapabilitiesChangeNotificationsBase.from1({
    required String value,
  }) = WorkspaceFoldersServerCapabilitiesChangeNotifications0;

  const factory WorkspaceFoldersServerCapabilitiesChangeNotificationsBase.from2({
    required bool value,
  }) = WorkspaceFoldersServerCapabilitiesChangeNotifications1;

  factory WorkspaceFoldersServerCapabilitiesChangeNotificationsBase.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WorkspaceFoldersServerCapabilitiesChangeNotificationsBaseFromJson(json);
}

/// Owned by: ParameterInformation(label)
///
/// Type: String
/// Type: (int, int)
@freezed
sealed class ParameterInformationLabelBase
    with _$ParameterInformationLabelBase {
  const factory ParameterInformationLabelBase.from1({required String value}) =
      ParameterInformationLabel0;

  const factory ParameterInformationLabelBase.from2({
    required (int, int) value,
  }) = ParameterInformationLabel1;

  factory ParameterInformationLabelBase.fromJson(Map<String, dynamic> json) =>
      _$ParameterInformationLabelBaseFromJson(json);
}

/// Owned by: NotebookCellTextDocumentFilter(notebook)
///
/// Type: String
/// Type: NotebookDocumentFilter
@freezed
sealed class NotebookCellTextDocumentFilterNotebookBase
    with _$NotebookCellTextDocumentFilterNotebookBase {
  const factory NotebookCellTextDocumentFilterNotebookBase.from1({
    required String value,
  }) = NotebookCellTextDocumentFilterNotebook0;

  const factory NotebookCellTextDocumentFilterNotebookBase.from2({
    required NotebookDocumentFilter value,
  }) = NotebookCellTextDocumentFilterNotebook1;

  factory NotebookCellTextDocumentFilterNotebookBase.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookCellTextDocumentFilterNotebookBaseFromJson(json);
}

/// Owned by: RelativePattern(baseUri)
///
/// Type: WorkspaceFolder
/// Type: URI
@freezed
sealed class RelativePatternBaseUriBase with _$RelativePatternBaseUriBase {
  const factory RelativePatternBaseUriBase.from1({
    required WorkspaceFolder value,
  }) = RelativePatternBaseUri0;

  const factory RelativePatternBaseUriBase.from2({required String value}) =
      RelativePatternBaseUri1;

  factory RelativePatternBaseUriBase.fromJson(Map<String, dynamic> json) =>
      _$RelativePatternBaseUriBaseFromJson(json);
}

/// Owned by: SemanticTokensClientCapabilities(full)
///
/// Type: Boolean
/// Type: ({bool? delta})
@freezed
sealed class SemanticTokensClientCapabilitiesFullBase
    with _$SemanticTokensClientCapabilitiesFullBase {
  const factory SemanticTokensClientCapabilitiesFullBase.from1({
    required bool value,
  }) = SemanticTokensClientCapabilitiesFull0;

  const factory SemanticTokensClientCapabilitiesFullBase.from2({
    required ({bool? delta}) value,
  }) = SemanticTokensClientCapabilitiesFull1;

  factory SemanticTokensClientCapabilitiesFullBase.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensClientCapabilitiesFullBaseFromJson(json);
}

@freezed
abstract class ImplementationParams with _$ImplementationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ImplementationParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _ImplementationParams;

  factory ImplementationParams.fromJson(Map<String, dynamic> json) =>
      _$ImplementationParamsFromJson(json);
}

@freezed
abstract class Location with _$Location {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Location({required String uri, required Range range}) =
      _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
abstract class ImplementationRegistrationOptions
    with _$ImplementationRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ImplementationRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _ImplementationRegistrationOptions;

  factory ImplementationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionParams with _$TypeDefinitionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeDefinitionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _TypeDefinitionParams;

  factory TypeDefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionParamsFromJson(json);
}

@freezed
abstract class TypeDefinitionRegistrationOptions
    with _$TypeDefinitionRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeDefinitionRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _TypeDefinitionRegistrationOptions;

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFolder with _$WorkspaceFolder {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceFolder({required String uri, required String name}) =
      _WorkspaceFolder;

  factory WorkspaceFolder.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFolderFromJson(json);
}

@freezed
abstract class DidChangeWorkspaceFoldersParams
    with _$DidChangeWorkspaceFoldersParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeWorkspaceFoldersParams({
    required WorkspaceFoldersChangeEvent event,
  }) = _DidChangeWorkspaceFoldersParams;

  factory DidChangeWorkspaceFoldersParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWorkspaceFoldersParamsFromJson(json);
}

@freezed
abstract class ConfigurationParams with _$ConfigurationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ConfigurationParams({required List<ConfigurationItem> items}) =
      _ConfigurationParams;

  factory ConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationParamsFromJson(json);
}

@freezed
abstract class DocumentColorParams with _$DocumentColorParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentColorParams({
    required TextDocumentIdentifier textDocument,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _DocumentColorParams;

  factory DocumentColorParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorParamsFromJson(json);
}

@freezed
abstract class ColorInformation with _$ColorInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ColorInformation({required Range range, required Color color}) =
      _ColorInformation;

  factory ColorInformation.fromJson(Map<String, dynamic> json) =>
      _$ColorInformationFromJson(json);
}

@freezed
abstract class DocumentColorRegistrationOptions
    with _$DocumentColorRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentColorRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _DocumentColorRegistrationOptions;

  factory DocumentColorRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentColorRegistrationOptionsFromJson(json);
}

@freezed
abstract class ColorPresentationParams with _$ColorPresentationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ColorPresentationParams({
    required TextDocumentIdentifier textDocument,
    required Color color,
    required Range range,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _ColorPresentationParams;

  factory ColorPresentationParams.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationParamsFromJson(json);
}

@freezed
abstract class ColorPresentation with _$ColorPresentation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ColorPresentation({
    required String label,
    List<TextEdit>? additionalTextEdits,
    TextEdit? textEdit,
  }) = _ColorPresentation;

  factory ColorPresentation.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationFromJson(json);
}

@freezed
abstract class WorkDoneProgressOptions with _$WorkDoneProgressOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkDoneProgressOptions({bool? workDoneProgress}) =
      _WorkDoneProgressOptions;

  factory WorkDoneProgressOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressOptionsFromJson(json);
}

@freezed
abstract class TextDocumentRegistrationOptions
    with _$TextDocumentRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
  }) = _TextDocumentRegistrationOptions;

  factory TextDocumentRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentRegistrationOptionsFromJson(json);
}

@freezed
abstract class FoldingRangeParams with _$FoldingRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FoldingRangeParams({
    required TextDocumentIdentifier textDocument,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _FoldingRangeParams;

  factory FoldingRangeParams.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeParamsFromJson(json);
}

@freezed
abstract class FoldingRange with _$FoldingRange {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FoldingRange({
    required int startLine,
    required int endLine,
    String? collapsedText,
    FoldingRangeKind? kind,
    int? endCharacter,
    int? startCharacter,
  }) = _FoldingRange;

  factory FoldingRange.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeFromJson(json);
}

@freezed
abstract class FoldingRangeRegistrationOptions
    with _$FoldingRangeRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FoldingRangeRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _FoldingRangeRegistrationOptions;

  factory FoldingRangeRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class DeclarationParams with _$DeclarationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DeclarationParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _DeclarationParams;

  factory DeclarationParams.fromJson(Map<String, dynamic> json) =>
      _$DeclarationParamsFromJson(json);
}

@freezed
abstract class DeclarationRegistrationOptions
    with _$DeclarationRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DeclarationRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _DeclarationRegistrationOptions;

  factory DeclarationRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationRegistrationOptionsFromJson(json);
}

@freezed
abstract class SelectionRangeParams with _$SelectionRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SelectionRangeParams({
    required TextDocumentIdentifier textDocument,
    required List<Position> positions,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _SelectionRangeParams;

  factory SelectionRangeParams.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeParamsFromJson(json);
}

@freezed
abstract class SelectionRange with _$SelectionRange {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SelectionRange({required Range range, SelectionRange? parent}) =
      _SelectionRange;

  factory SelectionRange.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeFromJson(json);
}

@freezed
abstract class SelectionRangeRegistrationOptions
    with _$SelectionRangeRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SelectionRangeRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _SelectionRangeRegistrationOptions;

  factory SelectionRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SelectionRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkDoneProgressCreateParams
    with _$WorkDoneProgressCreateParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkDoneProgressCreateParams({required ProgressToken token}) =
      _WorkDoneProgressCreateParams;

  factory WorkDoneProgressCreateParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCreateParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressCancelParams
    with _$WorkDoneProgressCancelParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkDoneProgressCancelParams({required ProgressToken token}) =
      _WorkDoneProgressCancelParams;

  factory WorkDoneProgressCancelParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCancelParamsFromJson(json);
}

@freezed
abstract class CallHierarchyPrepareParams with _$CallHierarchyPrepareParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyPrepareParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _CallHierarchyPrepareParams;

  factory CallHierarchyPrepareParams.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyPrepareParamsFromJson(json);
}

@freezed
abstract class CallHierarchyItem with _$CallHierarchyItem {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyItem({
    required String name,
    required SymbolKind kind,
    required String uri,
    required Range range,
    required Range selectionRange,
    LSPAny? data,
    String? detail,
    List<SymbolTag>? tags,
  }) = _CallHierarchyItem;

  factory CallHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyItemFromJson(json);
}

@freezed
abstract class CallHierarchyRegistrationOptions
    with _$CallHierarchyRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _CallHierarchyRegistrationOptions;

  factory CallHierarchyRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyRegistrationOptionsFromJson(json);
}

@freezed
abstract class CallHierarchyIncomingCallsParams
    with _$CallHierarchyIncomingCallsParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyIncomingCallsParams({
    required CallHierarchyItem item,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _CallHierarchyIncomingCallsParams;

  factory CallHierarchyIncomingCallsParams.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyIncomingCallsParamsFromJson(json);
}

@freezed
abstract class CallHierarchyIncomingCall with _$CallHierarchyIncomingCall {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyIncomingCall({
    required CallHierarchyItem from,
    required List<Range> fromRanges,
  }) = _CallHierarchyIncomingCall;

  factory CallHierarchyIncomingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyIncomingCallFromJson(json);
}

@freezed
abstract class CallHierarchyOutgoingCallsParams
    with _$CallHierarchyOutgoingCallsParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyOutgoingCallsParams({
    required CallHierarchyItem item,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _CallHierarchyOutgoingCallsParams;

  factory CallHierarchyOutgoingCallsParams.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyOutgoingCallsParamsFromJson(json);
}

@freezed
abstract class CallHierarchyOutgoingCall with _$CallHierarchyOutgoingCall {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyOutgoingCall({
    required CallHierarchyItem to,
    required List<Range> fromRanges,
  }) = _CallHierarchyOutgoingCall;

  factory CallHierarchyOutgoingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOutgoingCallFromJson(json);
}

@freezed
abstract class SemanticTokensParams with _$SemanticTokensParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensParams({
    required TextDocumentIdentifier textDocument,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _SemanticTokensParams;

  factory SemanticTokensParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensParamsFromJson(json);
}

@freezed
abstract class SemanticTokens with _$SemanticTokens {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokens({required List<int> data, String? resultId}) =
      _SemanticTokens;

  factory SemanticTokens.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensFromJson(json);
}

@freezed
abstract class SemanticTokensPartialResult with _$SemanticTokensPartialResult {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensPartialResult({required List<int> data}) =
      _SemanticTokensPartialResult;

  factory SemanticTokensPartialResult.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensPartialResultFromJson(json);
}

@freezed
abstract class SemanticTokensRegistrationOptions
    with _$SemanticTokensRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    required SemanticTokensLegend legend,
    String? id,
    SemanticTokensOptionsFullBase? full,
    RangeBase? range,
    bool? workDoneProgress,
  }) = _SemanticTokensRegistrationOptions;

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensRegistrationOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensDeltaParams with _$SemanticTokensDeltaParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensDeltaParams({
    required TextDocumentIdentifier textDocument,
    required String previousResultId,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _SemanticTokensDeltaParams;

  factory SemanticTokensDeltaParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaParamsFromJson(json);
}

@freezed
abstract class SemanticTokensDelta with _$SemanticTokensDelta {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensDelta({
    required List<SemanticTokensEdit> edits,
    String? resultId,
  }) = _SemanticTokensDelta;

  factory SemanticTokensDelta.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaFromJson(json);
}

@freezed
abstract class SemanticTokensDeltaPartialResult
    with _$SemanticTokensDeltaPartialResult {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensDeltaPartialResult({
    required List<SemanticTokensEdit> edits,
  }) = _SemanticTokensDeltaPartialResult;

  factory SemanticTokensDeltaPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensDeltaPartialResultFromJson(json);
}

@freezed
abstract class SemanticTokensRangeParams with _$SemanticTokensRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensRangeParams({
    required TextDocumentIdentifier textDocument,
    required Range range,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _SemanticTokensRangeParams;

  factory SemanticTokensRangeParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensRangeParamsFromJson(json);
}

@freezed
abstract class ShowDocumentParams with _$ShowDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ShowDocumentParams({
    required String uri,
    Range? selection,
    bool? takeFocus,
    bool? external,
  }) = _ShowDocumentParams;

  factory ShowDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentParamsFromJson(json);
}

@freezed
abstract class ShowDocumentResult with _$ShowDocumentResult {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ShowDocumentResult({required bool success}) =
      _ShowDocumentResult;

  factory ShowDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentResultFromJson(json);
}

@freezed
abstract class LinkedEditingRangeParams with _$LinkedEditingRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LinkedEditingRangeParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _LinkedEditingRangeParams;

  factory LinkedEditingRangeParams.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeParamsFromJson(json);
}

@freezed
abstract class LinkedEditingRanges with _$LinkedEditingRanges {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LinkedEditingRanges({
    required List<Range> ranges,
    String? wordPattern,
  }) = _LinkedEditingRanges;

  factory LinkedEditingRanges.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangesFromJson(json);
}

@freezed
abstract class LinkedEditingRangeRegistrationOptions
    with _$LinkedEditingRangeRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LinkedEditingRangeRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _LinkedEditingRangeRegistrationOptions;

  factory LinkedEditingRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class CreateFilesParams with _$CreateFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CreateFilesParams({required List<FileCreate> files}) =
      _CreateFilesParams;

  factory CreateFilesParams.fromJson(Map<String, dynamic> json) =>
      _$CreateFilesParamsFromJson(json);
}

@freezed
abstract class WorkspaceEdit with _$WorkspaceEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceEdit({
    Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations,
    List<WorkspaceEditDocumentChangesBase>? documentChanges,
    Map<String, List<TextEdit>>? changes,
  }) = _WorkspaceEdit;

  factory WorkspaceEdit.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditFromJson(json);
}

@freezed
abstract class FileOperationRegistrationOptions
    with _$FileOperationRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileOperationRegistrationOptions({
    required List<FileOperationFilter> filters,
  }) = _FileOperationRegistrationOptions;

  factory FileOperationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$FileOperationRegistrationOptionsFromJson(json);
}

@freezed
abstract class RenameFilesParams with _$RenameFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RenameFilesParams({required List<FileRename> files}) =
      _RenameFilesParams;

  factory RenameFilesParams.fromJson(Map<String, dynamic> json) =>
      _$RenameFilesParamsFromJson(json);
}

@freezed
abstract class DeleteFilesParams with _$DeleteFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DeleteFilesParams({required List<FileDelete> files}) =
      _DeleteFilesParams;

  factory DeleteFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteFilesParamsFromJson(json);
}

@freezed
abstract class MonikerParams with _$MonikerParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MonikerParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _MonikerParams;

  factory MonikerParams.fromJson(Map<String, dynamic> json) =>
      _$MonikerParamsFromJson(json);
}

@freezed
abstract class Moniker with _$Moniker {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Moniker({
    required String scheme,
    required String identifier,
    required UniquenessLevel unique,
    MonikerKind? kind,
  }) = _Moniker;

  factory Moniker.fromJson(Map<String, dynamic> json) =>
      _$MonikerFromJson(json);
}

@freezed
abstract class MonikerRegistrationOptions with _$MonikerRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MonikerRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _MonikerRegistrationOptions;

  factory MonikerRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeHierarchyPrepareParams with _$TypeHierarchyPrepareParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeHierarchyPrepareParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _TypeHierarchyPrepareParams;

  factory TypeHierarchyPrepareParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyPrepareParamsFromJson(json);
}

@freezed
abstract class TypeHierarchyItem with _$TypeHierarchyItem {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeHierarchyItem({
    required String name,
    required SymbolKind kind,
    required String uri,
    required Range range,
    required Range selectionRange,
    LSPAny? data,
    String? detail,
    List<SymbolTag>? tags,
  }) = _TypeHierarchyItem;

  factory TypeHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyItemFromJson(json);
}

@freezed
abstract class TypeHierarchyRegistrationOptions
    with _$TypeHierarchyRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeHierarchyRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _TypeHierarchyRegistrationOptions;

  factory TypeHierarchyRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeHierarchyRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeHierarchySupertypesParams
    with _$TypeHierarchySupertypesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeHierarchySupertypesParams({
    required TypeHierarchyItem item,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _TypeHierarchySupertypesParams;

  factory TypeHierarchySupertypesParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchySupertypesParamsFromJson(json);
}

@freezed
abstract class TypeHierarchySubtypesParams with _$TypeHierarchySubtypesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeHierarchySubtypesParams({
    required TypeHierarchyItem item,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _TypeHierarchySubtypesParams;

  factory TypeHierarchySubtypesParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchySubtypesParamsFromJson(json);
}

@freezed
abstract class InlineValueParams with _$InlineValueParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueParams({
    required TextDocumentIdentifier textDocument,
    required Range range,
    required InlineValueContext context,
    ProgressToken? workDoneToken,
  }) = _InlineValueParams;

  factory InlineValueParams.fromJson(Map<String, dynamic> json) =>
      _$InlineValueParamsFromJson(json);
}

@freezed
abstract class InlineValueRegistrationOptions
    with _$InlineValueRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _InlineValueRegistrationOptions;

  factory InlineValueRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueRegistrationOptionsFromJson(json);
}

@freezed
abstract class InlayHintParams with _$InlayHintParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlayHintParams({
    required TextDocumentIdentifier textDocument,
    required Range range,
    ProgressToken? workDoneToken,
  }) = _InlayHintParams;

  factory InlayHintParams.fromJson(Map<String, dynamic> json) =>
      _$InlayHintParamsFromJson(json);
}

@freezed
abstract class InlayHint with _$InlayHint {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlayHint({
    required Position position,
    required InlayHintLabelBase label,
    LSPAny? data,
    bool? paddingRight,
    bool? paddingLeft,
    TooltipOrDocumentationBase? tooltip,
    List<TextEdit>? textEdits,
    InlayHintKind? kind,
  }) = _InlayHint;

  factory InlayHint.fromJson(Map<String, dynamic> json) =>
      _$InlayHintFromJson(json);
}

@freezed
abstract class InlayHintRegistrationOptions
    with _$InlayHintRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlayHintRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _InlayHintRegistrationOptions;

  factory InlayHintRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentDiagnosticParams with _$DocumentDiagnosticParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentDiagnosticParams({
    required TextDocumentIdentifier textDocument,
    String? previousResultId,
    String? identifier,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _DocumentDiagnosticParams;

  factory DocumentDiagnosticParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentDiagnosticParamsFromJson(json);
}

@freezed
abstract class DocumentDiagnosticReportPartialResult
    with _$DocumentDiagnosticReportPartialResult {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentDiagnosticReportPartialResult({
    required Map<String, RelatedDocumentsBase> relatedDocuments,
  }) = _DocumentDiagnosticReportPartialResult;

  factory DocumentDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentDiagnosticReportPartialResultFromJson(json);
}

@freezed
abstract class DiagnosticServerCancellationData
    with _$DiagnosticServerCancellationData {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DiagnosticServerCancellationData({
    required bool retriggerRequest,
  }) = _DiagnosticServerCancellationData;

  factory DiagnosticServerCancellationData.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticServerCancellationDataFromJson(json);
}

@freezed
abstract class DiagnosticRegistrationOptions
    with _$DiagnosticRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DiagnosticRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    required bool interFileDependencies,
    required bool workspaceDiagnostics,
    String? id,
    String? identifier,
    bool? workDoneProgress,
  }) = _DiagnosticRegistrationOptions;

  factory DiagnosticRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceDiagnosticParams with _$WorkspaceDiagnosticParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceDiagnosticParams({
    required List<PreviousResultId> previousResultIds,
    String? identifier,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _WorkspaceDiagnosticParams;

  factory WorkspaceDiagnosticParams.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDiagnosticParamsFromJson(json);
}

@freezed
abstract class WorkspaceDiagnosticReport with _$WorkspaceDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceDiagnosticReport({
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReport;

  factory WorkspaceDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDiagnosticReportFromJson(json);
}

@freezed
abstract class WorkspaceDiagnosticReportPartialResult
    with _$WorkspaceDiagnosticReportPartialResult {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceDiagnosticReportPartialResult({
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReportPartialResult;

  factory WorkspaceDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceDiagnosticReportPartialResultFromJson(json);
}

@freezed
abstract class DidOpenNotebookDocumentParams
    with _$DidOpenNotebookDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidOpenNotebookDocumentParams({
    required NotebookDocument notebookDocument,
    required List<TextDocumentItem> cellTextDocuments,
  }) = _DidOpenNotebookDocumentParams;

  factory DidOpenNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidOpenNotebookDocumentParamsFromJson(json);
}

@freezed
abstract class DidChangeNotebookDocumentParams
    with _$DidChangeNotebookDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeNotebookDocumentParams({
    required VersionedNotebookDocumentIdentifier notebookDocument,
    required NotebookDocumentChangeEvent change,
  }) = _DidChangeNotebookDocumentParams;

  factory DidChangeNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeNotebookDocumentParamsFromJson(json);
}

@freezed
abstract class DidSaveNotebookDocumentParams
    with _$DidSaveNotebookDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidSaveNotebookDocumentParams({
    required NotebookDocumentIdentifier notebookDocument,
  }) = _DidSaveNotebookDocumentParams;

  factory DidSaveNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidSaveNotebookDocumentParamsFromJson(json);
}

@freezed
abstract class DidCloseNotebookDocumentParams
    with _$DidCloseNotebookDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidCloseNotebookDocumentParams({
    required NotebookDocumentIdentifier notebookDocument,
    required List<TextDocumentIdentifier> cellTextDocuments,
  }) = _DidCloseNotebookDocumentParams;

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseNotebookDocumentParamsFromJson(json);
}

@freezed
abstract class InlineCompletionParams with _$InlineCompletionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineCompletionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    required InlineCompletionContext context,
    ProgressToken? workDoneToken,
  }) = _InlineCompletionParams;

  factory InlineCompletionParams.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionParamsFromJson(json);
}

@freezed
abstract class InlineCompletionList with _$InlineCompletionList {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineCompletionList({
    required List<InlineCompletionItem> items,
  }) = _InlineCompletionList;

  factory InlineCompletionList.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionListFromJson(json);
}

@freezed
abstract class InlineCompletionItem with _$InlineCompletionItem {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineCompletionItem({
    required InlineCompletionItemInsertTextBase insertText,
    Command? command,
    Range? range,
    String? filterText,
  }) = _InlineCompletionItem;

  factory InlineCompletionItem.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionItemFromJson(json);
}

@freezed
abstract class InlineCompletionRegistrationOptions
    with _$InlineCompletionRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineCompletionRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _InlineCompletionRegistrationOptions;

  factory InlineCompletionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionRegistrationOptionsFromJson(json);
}

@freezed
abstract class RegistrationParams with _$RegistrationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RegistrationParams({
    required List<Registration> registrations,
  }) = _RegistrationParams;

  factory RegistrationParams.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParamsFromJson(json);
}

@freezed
abstract class UnregistrationParams with _$UnregistrationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory UnregistrationParams({
    required List<Unregistration> unregisterations,
  }) = _UnregistrationParams;

  factory UnregistrationParams.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationParamsFromJson(json);
}

@freezed
abstract class InitializeParams with _$InitializeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InitializeParams({
    required ProcessIdOrVersionBase processId,
    required InitializeParamsRootUriBase rootUri,
    required ClientCapabilities capabilities,
    WorkspaceFoldersInitializeParamsWorkspaceFoldersBase? workspaceFolders,
    TraceValues? trace,
    LSPAny? initializationOptions,
    InitializeParamsRootPathBase? rootPath,
    String? locale,
    ({String name, String? version})? clientInfo,
    ProgressToken? workDoneToken,
  }) = _InitializeParams;

  factory InitializeParams.fromJson(Map<String, dynamic> json) =>
      _$InitializeParamsFromJson(json);
}

@freezed
abstract class InitializeResult with _$InitializeResult {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InitializeResult({
    required ServerCapabilities capabilities,
    ({String name, String? version})? serverInfo,
  }) = _InitializeResult;

  factory InitializeResult.fromJson(Map<String, dynamic> json) =>
      _$InitializeResultFromJson(json);
}

@freezed
abstract class InitializeError with _$InitializeError {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InitializeError({required bool retry}) = _InitializeError;

  factory InitializeError.fromJson(Map<String, dynamic> json) =>
      _$InitializeErrorFromJson(json);
}

@freezed
abstract class InitializedParams with _$InitializedParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InitializedParams() = _InitializedParams;

  factory InitializedParams.fromJson(Map<String, dynamic> json) =>
      _$InitializedParamsFromJson(json);
}

@freezed
abstract class DidChangeConfigurationParams
    with _$DidChangeConfigurationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeConfigurationParams({required LSPAny settings}) =
      _DidChangeConfigurationParams;

  factory DidChangeConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeConfigurationParamsFromJson(json);
}

@freezed
abstract class DidChangeConfigurationRegistrationOptions
    with _$DidChangeConfigurationRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeConfigurationRegistrationOptions({
    DidChangeConfigurationRegistrationOptionsSectionBase? section,
  }) = _DidChangeConfigurationRegistrationOptions;

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationRegistrationOptionsFromJson(json);
}

@freezed
abstract class ShowMessageParams with _$ShowMessageParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ShowMessageParams({
    required MessageType type,
    required String message,
  }) = _ShowMessageParams;

  factory ShowMessageParams.fromJson(Map<String, dynamic> json) =>
      _$ShowMessageParamsFromJson(json);
}

@freezed
abstract class ShowMessageRequestParams with _$ShowMessageRequestParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ShowMessageRequestParams({
    required MessageType type,
    required String message,
    List<MessageActionItem>? actions,
  }) = _ShowMessageRequestParams;

  factory ShowMessageRequestParams.fromJson(Map<String, dynamic> json) =>
      _$ShowMessageRequestParamsFromJson(json);
}

@freezed
abstract class MessageActionItem with _$MessageActionItem {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MessageActionItem({required String title}) = _MessageActionItem;

  factory MessageActionItem.fromJson(Map<String, dynamic> json) =>
      _$MessageActionItemFromJson(json);
}

@freezed
abstract class LogMessageParams with _$LogMessageParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LogMessageParams({
    required MessageType type,
    required String message,
  }) = _LogMessageParams;

  factory LogMessageParams.fromJson(Map<String, dynamic> json) =>
      _$LogMessageParamsFromJson(json);
}

@freezed
abstract class DidOpenTextDocumentParams with _$DidOpenTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidOpenTextDocumentParams({
    required TextDocumentItem textDocument,
  }) = _DidOpenTextDocumentParams;

  factory DidOpenTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidOpenTextDocumentParamsFromJson(json);
}

@freezed
abstract class DidChangeTextDocumentParams with _$DidChangeTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeTextDocumentParams({
    required VersionedTextDocumentIdentifier textDocument,
    required List<TextDocumentContentChangeEvent> contentChanges,
  }) = _DidChangeTextDocumentParams;

  factory DidChangeTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeTextDocumentParamsFromJson(json);
}

@freezed
abstract class TextDocumentChangeRegistrationOptions
    with _$TextDocumentChangeRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentChangeRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    required TextDocumentSyncKind syncKind,
  }) = _TextDocumentChangeRegistrationOptions;

  factory TextDocumentChangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentChangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class DidCloseTextDocumentParams with _$DidCloseTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidCloseTextDocumentParams({
    required TextDocumentIdentifier textDocument,
  }) = _DidCloseTextDocumentParams;

  factory DidCloseTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseTextDocumentParamsFromJson(json);
}

@freezed
abstract class DidSaveTextDocumentParams with _$DidSaveTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidSaveTextDocumentParams({
    required TextDocumentIdentifier textDocument,
    String? text,
  }) = _DidSaveTextDocumentParams;

  factory DidSaveTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidSaveTextDocumentParamsFromJson(json);
}

@freezed
abstract class TextDocumentSaveRegistrationOptions
    with _$TextDocumentSaveRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentSaveRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? includeText,
  }) = _TextDocumentSaveRegistrationOptions;

  factory TextDocumentSaveRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSaveRegistrationOptionsFromJson(json);
}

@freezed
abstract class WillSaveTextDocumentParams with _$WillSaveTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WillSaveTextDocumentParams({
    required TextDocumentIdentifier textDocument,
    required TextDocumentSaveReason reason,
  }) = _WillSaveTextDocumentParams;

  factory WillSaveTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$WillSaveTextDocumentParamsFromJson(json);
}

@freezed
abstract class TextEdit with _$TextEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextEdit({required Range range, required String newText}) =
      _TextEdit;

  factory TextEdit.fromJson(Map<String, dynamic> json) =>
      _$TextEditFromJson(json);
}

@freezed
abstract class DidChangeWatchedFilesParams with _$DidChangeWatchedFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeWatchedFilesParams({
    required List<FileEvent> changes,
  }) = _DidChangeWatchedFilesParams;

  factory DidChangeWatchedFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWatchedFilesParamsFromJson(json);
}

@freezed
abstract class DidChangeWatchedFilesRegistrationOptions
    with _$DidChangeWatchedFilesRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeWatchedFilesRegistrationOptions({
    required List<FileSystemWatcher> watchers,
  }) = _DidChangeWatchedFilesRegistrationOptions;

  factory DidChangeWatchedFilesRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesRegistrationOptionsFromJson(json);
}

@freezed
abstract class PublishDiagnosticsParams with _$PublishDiagnosticsParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory PublishDiagnosticsParams({
    required String uri,
    required List<Diagnostic> diagnostics,
    int? version,
  }) = _PublishDiagnosticsParams;

  factory PublishDiagnosticsParams.fromJson(Map<String, dynamic> json) =>
      _$PublishDiagnosticsParamsFromJson(json);
}

@freezed
abstract class CompletionParams with _$CompletionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    CompletionContext? context,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _CompletionParams;

  factory CompletionParams.fromJson(Map<String, dynamic> json) =>
      _$CompletionParamsFromJson(json);
}

@freezed
abstract class CompletionItem with _$CompletionItem {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionItem({
    required String label,
    LSPAny? data,
    Command? command,
    List<String>? commitCharacters,
    List<TextEdit>? additionalTextEdits,
    String? textEditText,
    CompletionItemTextEditBase? textEdit,
    InsertTextMode? insertTextMode,
    InsertTextFormat? insertTextFormat,
    String? insertText,
    String? filterText,
    String? sortText,
    bool? preselect,
    bool? deprecated,
    TooltipOrDocumentationBase? documentation,
    String? detail,
    List<CompletionItemTag>? tags,
    CompletionItemKind? kind,
    CompletionItemLabelDetails? labelDetails,
  }) = _CompletionItem;

  factory CompletionItem.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemFromJson(json);
}

@freezed
abstract class CompletionList with _$CompletionList {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionList({
    required bool isIncomplete,
    required List<CompletionItem> items,
    ({
      List<String>? commitCharacters,
      CompletionListEditRangeBase? editRange,
      InsertTextFormat? insertTextFormat,
      InsertTextMode? insertTextMode,
      LSPAny? data,
    })?
    itemDefaults,
  }) = _CompletionList;

  factory CompletionList.fromJson(Map<String, dynamic> json) =>
      _$CompletionListFromJson(json);
}

@freezed
abstract class CompletionRegistrationOptions
    with _$CompletionRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    ({bool? labelDetailsSupport})? completionItem,
    bool? resolveProvider,
    List<String>? allCommitCharacters,
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _CompletionRegistrationOptions;

  factory CompletionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CompletionRegistrationOptionsFromJson(json);
}

@freezed
abstract class HoverParams with _$HoverParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory HoverParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _HoverParams;

  factory HoverParams.fromJson(Map<String, dynamic> json) =>
      _$HoverParamsFromJson(json);
}

@freezed
abstract class Hover with _$Hover {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Hover({required HoverContentsBase contents, Range? range}) =
      _Hover;

  factory Hover.fromJson(Map<String, dynamic> json) => _$HoverFromJson(json);
}

@freezed
abstract class HoverRegistrationOptions with _$HoverRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory HoverRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _HoverRegistrationOptions;

  factory HoverRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverRegistrationOptionsFromJson(json);
}

@freezed
abstract class SignatureHelpParams with _$SignatureHelpParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SignatureHelpParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    SignatureHelpContext? context,
    ProgressToken? workDoneToken,
  }) = _SignatureHelpParams;

  factory SignatureHelpParams.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpParamsFromJson(json);
}

@freezed
abstract class SignatureHelp with _$SignatureHelp {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SignatureHelp({
    required List<SignatureInformation> signatures,
    int? activeParameter,
    int? activeSignature,
  }) = _SignatureHelp;

  factory SignatureHelp.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpFromJson(json);
}

@freezed
abstract class SignatureHelpRegistrationOptions
    with _$SignatureHelpRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SignatureHelpRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    List<String>? retriggerCharacters,
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _SignatureHelpRegistrationOptions;

  factory SignatureHelpRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SignatureHelpRegistrationOptionsFromJson(json);
}

@freezed
abstract class DefinitionParams with _$DefinitionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DefinitionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _DefinitionParams;

  factory DefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$DefinitionParamsFromJson(json);
}

@freezed
abstract class DefinitionRegistrationOptions
    with _$DefinitionRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DefinitionRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _DefinitionRegistrationOptions;

  factory DefinitionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionRegistrationOptionsFromJson(json);
}

@freezed
abstract class ReferenceParams with _$ReferenceParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ReferenceParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    required ReferenceContext context,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _ReferenceParams;

  factory ReferenceParams.fromJson(Map<String, dynamic> json) =>
      _$ReferenceParamsFromJson(json);
}

@freezed
abstract class ReferenceRegistrationOptions
    with _$ReferenceRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ReferenceRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _ReferenceRegistrationOptions;

  factory ReferenceRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentHighlightParams with _$DocumentHighlightParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentHighlightParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _DocumentHighlightParams;

  factory DocumentHighlightParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightParamsFromJson(json);
}

@freezed
abstract class DocumentHighlight with _$DocumentHighlight {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentHighlight({
    required Range range,
    DocumentHighlightKind? kind,
  }) = _DocumentHighlight;

  factory DocumentHighlight.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightFromJson(json);
}

@freezed
abstract class DocumentHighlightRegistrationOptions
    with _$DocumentHighlightRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentHighlightRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _DocumentHighlightRegistrationOptions;

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentSymbolParams with _$DocumentSymbolParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentSymbolParams({
    required TextDocumentIdentifier textDocument,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _DocumentSymbolParams;

  factory DocumentSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolParamsFromJson(json);
}

@freezed
abstract class SymbolInformation with _$SymbolInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SymbolInformation({
    required String name,
    required SymbolKind kind,
    required Location location,
    bool? deprecated,
    String? containerName,
    List<SymbolTag>? tags,
  }) = _SymbolInformation;

  factory SymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$SymbolInformationFromJson(json);
}

@freezed
abstract class DocumentSymbol with _$DocumentSymbol {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentSymbol({
    required String name,
    required SymbolKind kind,
    required Range range,
    required Range selectionRange,
    List<DocumentSymbol>? children,
    bool? deprecated,
    List<SymbolTag>? tags,
    String? detail,
  }) = _DocumentSymbol;

  factory DocumentSymbol.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolFromJson(json);
}

@freezed
abstract class DocumentSymbolRegistrationOptions
    with _$DocumentSymbolRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentSymbolRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    String? label,
    bool? workDoneProgress,
  }) = _DocumentSymbolRegistrationOptions;

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolRegistrationOptionsFromJson(json);
}

@freezed
abstract class CodeActionParams with _$CodeActionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeActionParams({
    required TextDocumentIdentifier textDocument,
    required Range range,
    required CodeActionContext context,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _CodeActionParams;

  factory CodeActionParams.fromJson(Map<String, dynamic> json) =>
      _$CodeActionParamsFromJson(json);
}

@freezed
abstract class Command with _$Command {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Command({
    required String title,
    required String command,
    List<LSPAny>? arguments,
  }) = _Command;

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}

@freezed
abstract class CodeAction with _$CodeAction {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeAction({
    required String title,
    LSPAny? data,
    Command? command,
    WorkspaceEdit? edit,
    ({String reason})? disabled,
    bool? isPreferred,
    List<Diagnostic>? diagnostics,
    CodeActionKind? kind,
  }) = _CodeAction;

  factory CodeAction.fromJson(Map<String, dynamic> json) =>
      _$CodeActionFromJson(json);
}

@freezed
abstract class CodeActionRegistrationOptions
    with _$CodeActionRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeActionRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? resolveProvider,
    List<CodeActionKind>? codeActionKinds,
    bool? workDoneProgress,
  }) = _CodeActionRegistrationOptions;

  factory CodeActionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceSymbolParams with _$WorkspaceSymbolParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceSymbolParams({
    required String query,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _WorkspaceSymbolParams;

  factory WorkspaceSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolParamsFromJson(json);
}

@freezed
abstract class WorkspaceSymbol with _$WorkspaceSymbol {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceSymbol({
    required String name,
    required SymbolKind kind,
    required WorkspaceSymbolLocationBase location,
    LSPAny? data,
    String? containerName,
    List<SymbolTag>? tags,
  }) = _WorkspaceSymbol;

  factory WorkspaceSymbol.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolFromJson(json);
}

@freezed
abstract class WorkspaceSymbolRegistrationOptions
    with _$WorkspaceSymbolRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceSymbolRegistrationOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _WorkspaceSymbolRegistrationOptions;

  factory WorkspaceSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolRegistrationOptionsFromJson(json);
}

@freezed
abstract class CodeLensParams with _$CodeLensParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeLensParams({
    required TextDocumentIdentifier textDocument,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _CodeLensParams;

  factory CodeLensParams.fromJson(Map<String, dynamic> json) =>
      _$CodeLensParamsFromJson(json);
}

@freezed
abstract class CodeLens with _$CodeLens {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeLens({
    required Range range,
    LSPAny? data,
    Command? command,
  }) = _CodeLens;

  factory CodeLens.fromJson(Map<String, dynamic> json) =>
      _$CodeLensFromJson(json);
}

@freezed
abstract class CodeLensRegistrationOptions with _$CodeLensRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeLensRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _CodeLensRegistrationOptions;

  factory CodeLensRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentLinkParams with _$DocumentLinkParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentLinkParams({
    required TextDocumentIdentifier textDocument,
    ProgressToken? partialResultToken,
    ProgressToken? workDoneToken,
  }) = _DocumentLinkParams;

  factory DocumentLinkParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkParamsFromJson(json);
}

@freezed
abstract class DocumentLink with _$DocumentLink {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentLink({
    required Range range,
    LSPAny? data,
    String? tooltip,
    String? target,
  }) = _DocumentLink;

  factory DocumentLink.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkFromJson(json);
}

@freezed
abstract class DocumentLinkRegistrationOptions
    with _$DocumentLinkRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentLinkRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _DocumentLinkRegistrationOptions;

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentFormattingParams with _$DocumentFormattingParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentFormattingParams({
    required TextDocumentIdentifier textDocument,
    required FormattingOptions options,
    ProgressToken? workDoneToken,
  }) = _DocumentFormattingParams;

  factory DocumentFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingParamsFromJson(json);
}

@freezed
abstract class DocumentFormattingRegistrationOptions
    with _$DocumentFormattingRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentFormattingRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _DocumentFormattingRegistrationOptions;

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentRangeFormattingParams
    with _$DocumentRangeFormattingParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentRangeFormattingParams({
    required TextDocumentIdentifier textDocument,
    required Range range,
    required FormattingOptions options,
    ProgressToken? workDoneToken,
  }) = _DocumentRangeFormattingParams;

  factory DocumentRangeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingParamsFromJson(json);
}

@freezed
abstract class DocumentRangeFormattingRegistrationOptions
    with _$DocumentRangeFormattingRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentRangeFormattingRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? rangesSupport,
    bool? workDoneProgress,
  }) = _DocumentRangeFormattingRegistrationOptions;

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentRangesFormattingParams
    with _$DocumentRangesFormattingParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentRangesFormattingParams({
    required TextDocumentIdentifier textDocument,
    required List<Range> ranges,
    required FormattingOptions options,
    ProgressToken? workDoneToken,
  }) = _DocumentRangesFormattingParams;

  factory DocumentRangesFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangesFormattingParamsFromJson(json);
}

@freezed
abstract class DocumentOnTypeFormattingParams
    with _$DocumentOnTypeFormattingParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentOnTypeFormattingParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    required String ch,
    required FormattingOptions options,
  }) = _DocumentOnTypeFormattingParams;

  factory DocumentOnTypeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingParamsFromJson(json);
}

@freezed
abstract class DocumentOnTypeFormattingRegistrationOptions
    with _$DocumentOnTypeFormattingRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentOnTypeFormattingRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    required String firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingRegistrationOptions;

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingRegistrationOptionsFromJson(json);
}

@freezed
abstract class RenameParams with _$RenameParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RenameParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    required String newName,
    ProgressToken? workDoneToken,
  }) = _RenameParams;

  factory RenameParams.fromJson(Map<String, dynamic> json) =>
      _$RenameParamsFromJson(json);
}

@freezed
abstract class RenameRegistrationOptions with _$RenameRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RenameRegistrationOptions({
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? prepareProvider,
    bool? workDoneProgress,
  }) = _RenameRegistrationOptions;

  factory RenameRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameRegistrationOptionsFromJson(json);
}

@freezed
abstract class PrepareRenameParams with _$PrepareRenameParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory PrepareRenameParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    ProgressToken? workDoneToken,
  }) = _PrepareRenameParams;

  factory PrepareRenameParams.fromJson(Map<String, dynamic> json) =>
      _$PrepareRenameParamsFromJson(json);
}

@freezed
abstract class ExecuteCommandParams with _$ExecuteCommandParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ExecuteCommandParams({
    required String command,
    List<LSPAny>? arguments,
    ProgressToken? workDoneToken,
  }) = _ExecuteCommandParams;

  factory ExecuteCommandParams.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandParamsFromJson(json);
}

@freezed
abstract class ExecuteCommandRegistrationOptions
    with _$ExecuteCommandRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ExecuteCommandRegistrationOptions({
    required List<String> commands,
    bool? workDoneProgress,
  }) = _ExecuteCommandRegistrationOptions;

  factory ExecuteCommandRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandRegistrationOptionsFromJson(json);
}

@freezed
abstract class ApplyWorkspaceEditParams with _$ApplyWorkspaceEditParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ApplyWorkspaceEditParams({
    required WorkspaceEdit edit,
    String? label,
  }) = _ApplyWorkspaceEditParams;

  factory ApplyWorkspaceEditParams.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditParamsFromJson(json);
}

@freezed
abstract class ApplyWorkspaceEditResult with _$ApplyWorkspaceEditResult {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ApplyWorkspaceEditResult({
    required bool applied,
    int? failedChange,
    String? failureReason,
  }) = _ApplyWorkspaceEditResult;

  factory ApplyWorkspaceEditResult.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditResultFromJson(json);
}

@freezed
abstract class WorkDoneProgressBegin with _$WorkDoneProgressBegin {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkDoneProgressBegin({
    required String kind,
    required String title,
    int? percentage,
    String? message,
    bool? cancellable,
  }) = _WorkDoneProgressBegin;

  factory WorkDoneProgressBegin.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressBeginFromJson(json);
}

@freezed
abstract class WorkDoneProgressReport with _$WorkDoneProgressReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkDoneProgressReport({
    required String kind,
    int? percentage,
    String? message,
    bool? cancellable,
  }) = _WorkDoneProgressReport;

  factory WorkDoneProgressReport.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressReportFromJson(json);
}

@freezed
abstract class WorkDoneProgressEnd with _$WorkDoneProgressEnd {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkDoneProgressEnd({required String kind, String? message}) =
      _WorkDoneProgressEnd;

  factory WorkDoneProgressEnd.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressEndFromJson(json);
}

@freezed
abstract class SetTraceParams with _$SetTraceParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SetTraceParams({required TraceValues value}) = _SetTraceParams;

  factory SetTraceParams.fromJson(Map<String, dynamic> json) =>
      _$SetTraceParamsFromJson(json);
}

@freezed
abstract class LogTraceParams with _$LogTraceParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LogTraceParams({required String message, String? verbose}) =
      _LogTraceParams;

  factory LogTraceParams.fromJson(Map<String, dynamic> json) =>
      _$LogTraceParamsFromJson(json);
}

@freezed
abstract class CancelParams with _$CancelParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CancelParams({required ProgressTokenBase id}) = _CancelParams;

  factory CancelParams.fromJson(Map<String, dynamic> json) =>
      _$CancelParamsFromJson(json);
}

@freezed
abstract class ProgressParams with _$ProgressParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ProgressParams({
    required ProgressToken token,
    required LSPAny value,
  }) = _ProgressParams;

  factory ProgressParams.fromJson(Map<String, dynamic> json) =>
      _$ProgressParamsFromJson(json);
}

@freezed
abstract class TextDocumentPositionParams with _$TextDocumentPositionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentPositionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
  }) = _TextDocumentPositionParams;

  factory TextDocumentPositionParams.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentPositionParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressParams with _$WorkDoneProgressParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkDoneProgressParams({ProgressToken? workDoneToken}) =
      _WorkDoneProgressParams;

  factory WorkDoneProgressParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressParamsFromJson(json);
}

@freezed
abstract class PartialResultParams with _$PartialResultParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory PartialResultParams({ProgressToken? partialResultToken}) =
      _PartialResultParams;

  factory PartialResultParams.fromJson(Map<String, dynamic> json) =>
      _$PartialResultParamsFromJson(json);
}

@freezed
abstract class LocationLink with _$LocationLink {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LocationLink({
    required String targetUri,
    required Range targetRange,
    required Range targetSelectionRange,
    Range? originSelectionRange,
  }) = _LocationLink;

  factory LocationLink.fromJson(Map<String, dynamic> json) =>
      _$LocationLinkFromJson(json);
}

@freezed
abstract class Range with _$Range {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Range({required Position start, required Position end}) =
      _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

@freezed
abstract class ImplementationOptions with _$ImplementationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ImplementationOptions({bool? workDoneProgress}) =
      _ImplementationOptions;

  factory ImplementationOptions.fromJson(Map<String, dynamic> json) =>
      _$ImplementationOptionsFromJson(json);
}

@freezed
abstract class StaticRegistrationOptions with _$StaticRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory StaticRegistrationOptions({String? id}) =
      _StaticRegistrationOptions;

  factory StaticRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$StaticRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionOptions with _$TypeDefinitionOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeDefinitionOptions({bool? workDoneProgress}) =
      _TypeDefinitionOptions;

  factory TypeDefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersChangeEvent with _$WorkspaceFoldersChangeEvent {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceFoldersChangeEvent({
    required List<WorkspaceFolder> added,
    required List<WorkspaceFolder> removed,
  }) = _WorkspaceFoldersChangeEvent;

  factory WorkspaceFoldersChangeEvent.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFoldersChangeEventFromJson(json);
}

@freezed
abstract class ConfigurationItem with _$ConfigurationItem {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ConfigurationItem({String? section, String? scopeUri}) =
      _ConfigurationItem;

  factory ConfigurationItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationItemFromJson(json);
}

@freezed
abstract class TextDocumentIdentifier with _$TextDocumentIdentifier {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentIdentifier({required String uri}) =
      _TextDocumentIdentifier;

  factory TextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentIdentifierFromJson(json);
}

@freezed
abstract class Color with _$Color {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Color({
    required double red,
    required double green,
    required double blue,
    required double alpha,
  }) = _Color;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}

@freezed
abstract class DocumentColorOptions with _$DocumentColorOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentColorOptions({bool? workDoneProgress}) =
      _DocumentColorOptions;

  factory DocumentColorOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorOptionsFromJson(json);
}

@freezed
abstract class FoldingRangeOptions with _$FoldingRangeOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FoldingRangeOptions({bool? workDoneProgress}) =
      _FoldingRangeOptions;

  factory FoldingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeOptionsFromJson(json);
}

@freezed
abstract class DeclarationOptions with _$DeclarationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DeclarationOptions({bool? workDoneProgress}) =
      _DeclarationOptions;

  factory DeclarationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationOptionsFromJson(json);
}

@freezed
abstract class Position with _$Position {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Position({required int line, required int character}) =
      _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
abstract class SelectionRangeOptions with _$SelectionRangeOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SelectionRangeOptions({bool? workDoneProgress}) =
      _SelectionRangeOptions;

  factory SelectionRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeOptionsFromJson(json);
}

@freezed
abstract class CallHierarchyOptions with _$CallHierarchyOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyOptions({bool? workDoneProgress}) =
      _CallHierarchyOptions;

  factory CallHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensOptions with _$SemanticTokensOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensOptions({
    required SemanticTokensLegend legend,
    SemanticTokensOptionsFullBase? full,
    RangeBase? range,
    bool? workDoneProgress,
  }) = _SemanticTokensOptions;

  factory SemanticTokensOptions.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensEdit with _$SemanticTokensEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensEdit({
    required int start,
    required int deleteCount,
    List<int>? data,
  }) = _SemanticTokensEdit;

  factory SemanticTokensEdit.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensEditFromJson(json);
}

@freezed
abstract class LinkedEditingRangeOptions with _$LinkedEditingRangeOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LinkedEditingRangeOptions({bool? workDoneProgress}) =
      _LinkedEditingRangeOptions;

  factory LinkedEditingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeOptionsFromJson(json);
}

@freezed
abstract class FileCreate with _$FileCreate {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileCreate({required String uri}) = _FileCreate;

  factory FileCreate.fromJson(Map<String, dynamic> json) =>
      _$FileCreateFromJson(json);
}

@freezed
abstract class TextDocumentEdit with _$TextDocumentEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentEdit({
    required OptionalVersionedTextDocumentIdentifier textDocument,
    required List<TextDocumentEditEditsBase> edits,
  }) = _TextDocumentEdit;

  factory TextDocumentEdit.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentEditFromJson(json);
}

@freezed
abstract class CreateFile with _$CreateFile {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CreateFile({
    required String kind,
    required String uri,
    CreateFileOptions? options,
    ChangeAnnotationIdentifier? annotationId,
  }) = _CreateFile;

  factory CreateFile.fromJson(Map<String, dynamic> json) =>
      _$CreateFileFromJson(json);
}

@freezed
abstract class RenameFile with _$RenameFile {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RenameFile({
    required String kind,
    required String oldUri,
    required String newUri,
    RenameFileOptions? options,
    ChangeAnnotationIdentifier? annotationId,
  }) = _RenameFile;

  factory RenameFile.fromJson(Map<String, dynamic> json) =>
      _$RenameFileFromJson(json);
}

@freezed
abstract class DeleteFile with _$DeleteFile {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DeleteFile({
    required String kind,
    required String uri,
    DeleteFileOptions? options,
    ChangeAnnotationIdentifier? annotationId,
  }) = _DeleteFile;

  factory DeleteFile.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileFromJson(json);
}

@freezed
abstract class ChangeAnnotation with _$ChangeAnnotation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ChangeAnnotation({
    required String label,
    String? description,
    bool? needsConfirmation,
  }) = _ChangeAnnotation;

  factory ChangeAnnotation.fromJson(Map<String, dynamic> json) =>
      _$ChangeAnnotationFromJson(json);
}

@freezed
abstract class FileOperationFilter with _$FileOperationFilter {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileOperationFilter({
    required FileOperationPattern pattern,
    String? scheme,
  }) = _FileOperationFilter;

  factory FileOperationFilter.fromJson(Map<String, dynamic> json) =>
      _$FileOperationFilterFromJson(json);
}

@freezed
abstract class FileRename with _$FileRename {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileRename({required String oldUri, required String newUri}) =
      _FileRename;

  factory FileRename.fromJson(Map<String, dynamic> json) =>
      _$FileRenameFromJson(json);
}

@freezed
abstract class FileDelete with _$FileDelete {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileDelete({required String uri}) = _FileDelete;

  factory FileDelete.fromJson(Map<String, dynamic> json) =>
      _$FileDeleteFromJson(json);
}

@freezed
abstract class MonikerOptions with _$MonikerOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MonikerOptions({bool? workDoneProgress}) = _MonikerOptions;

  factory MonikerOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerOptionsFromJson(json);
}

@freezed
abstract class TypeHierarchyOptions with _$TypeHierarchyOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeHierarchyOptions({bool? workDoneProgress}) =
      _TypeHierarchyOptions;

  factory TypeHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyOptionsFromJson(json);
}

@freezed
abstract class InlineValueContext with _$InlineValueContext {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueContext({
    required int frameId,
    required Range stoppedLocation,
  }) = _InlineValueContext;

  factory InlineValueContext.fromJson(Map<String, dynamic> json) =>
      _$InlineValueContextFromJson(json);
}

@freezed
abstract class InlineValueText with _$InlineValueText {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueText({required Range range, required String text}) =
      _InlineValueText;

  factory InlineValueText.fromJson(Map<String, dynamic> json) =>
      _$InlineValueTextFromJson(json);
}

@freezed
abstract class InlineValueVariableLookup with _$InlineValueVariableLookup {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueVariableLookup({
    required Range range,
    required bool caseSensitiveLookup,
    String? variableName,
  }) = _InlineValueVariableLookup;

  factory InlineValueVariableLookup.fromJson(Map<String, dynamic> json) =>
      _$InlineValueVariableLookupFromJson(json);
}

@freezed
abstract class InlineValueEvaluatableExpression
    with _$InlineValueEvaluatableExpression {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueEvaluatableExpression({
    required Range range,
    String? expression,
  }) = _InlineValueEvaluatableExpression;

  factory InlineValueEvaluatableExpression.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueEvaluatableExpressionFromJson(json);
}

@freezed
abstract class InlineValueOptions with _$InlineValueOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueOptions({bool? workDoneProgress}) =
      _InlineValueOptions;

  factory InlineValueOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueOptionsFromJson(json);
}

@freezed
abstract class InlayHintLabelPart with _$InlayHintLabelPart {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlayHintLabelPart({
    required String value,
    Command? command,
    Location? location,
    TooltipOrDocumentationBase? tooltip,
  }) = _InlayHintLabelPart;

  factory InlayHintLabelPart.fromJson(Map<String, dynamic> json) =>
      _$InlayHintLabelPartFromJson(json);
}

@freezed
abstract class MarkupContent with _$MarkupContent {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MarkupContent({
    required MarkupKind kind,
    required String value,
  }) = _MarkupContent;

  factory MarkupContent.fromJson(Map<String, dynamic> json) =>
      _$MarkupContentFromJson(json);
}

@freezed
abstract class InlayHintOptions with _$InlayHintOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlayHintOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _InlayHintOptions;

  factory InlayHintOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintOptionsFromJson(json);
}

@freezed
abstract class RelatedFullDocumentDiagnosticReport
    with _$RelatedFullDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RelatedFullDocumentDiagnosticReport({
    required String kind,
    required List<Diagnostic> items,
    Map<String, RelatedDocumentsBase>? relatedDocuments,
    String? resultId,
  }) = _RelatedFullDocumentDiagnosticReport;

  factory RelatedFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedFullDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class RelatedUnchangedDocumentDiagnosticReport
    with _$RelatedUnchangedDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RelatedUnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
    Map<String, RelatedDocumentsBase>? relatedDocuments,
  }) = _RelatedUnchangedDocumentDiagnosticReport;

  factory RelatedUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedUnchangedDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class FullDocumentDiagnosticReport
    with _$FullDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FullDocumentDiagnosticReport({
    required String kind,
    required List<Diagnostic> items,
    String? resultId,
  }) = _FullDocumentDiagnosticReport;

  factory FullDocumentDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$FullDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class UnchangedDocumentDiagnosticReport
    with _$UnchangedDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory UnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
  }) = _UnchangedDocumentDiagnosticReport;

  factory UnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$UnchangedDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class DiagnosticOptions with _$DiagnosticOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DiagnosticOptions({
    required bool interFileDependencies,
    required bool workspaceDiagnostics,
    String? identifier,
    bool? workDoneProgress,
  }) = _DiagnosticOptions;

  factory DiagnosticOptions.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticOptionsFromJson(json);
}

@freezed
abstract class PreviousResultId with _$PreviousResultId {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory PreviousResultId({required String uri, required String value}) =
      _PreviousResultId;

  factory PreviousResultId.fromJson(Map<String, dynamic> json) =>
      _$PreviousResultIdFromJson(json);
}

@freezed
abstract class NotebookDocument with _$NotebookDocument {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookDocument({
    required String uri,
    required String notebookType,
    required int version,
    required List<NotebookCell> cells,
    LSPObject? metadata,
  }) = _NotebookDocument;

  factory NotebookDocument.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentFromJson(json);
}

@freezed
abstract class TextDocumentItem with _$TextDocumentItem {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentItem({
    required String uri,
    required String languageId,
    required int version,
    required String text,
  }) = _TextDocumentItem;

  factory TextDocumentItem.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentItemFromJson(json);
}

@freezed
abstract class VersionedNotebookDocumentIdentifier
    with _$VersionedNotebookDocumentIdentifier {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory VersionedNotebookDocumentIdentifier({
    required int version,
    required String uri,
  }) = _VersionedNotebookDocumentIdentifier;

  factory VersionedNotebookDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) => _$VersionedNotebookDocumentIdentifierFromJson(json);
}

@freezed
abstract class NotebookDocumentChangeEvent with _$NotebookDocumentChangeEvent {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookDocumentChangeEvent({
    ({
      ({
        NotebookCellArrayChange array,
        List<TextDocumentItem>? didOpen,
        List<TextDocumentIdentifier>? didClose,
      })?
      structure,
      List<NotebookCell>? data,
      List<
        ({
          VersionedTextDocumentIdentifier document,
          List<TextDocumentContentChangeEvent> changes,
        })
      >?
      textContent,
    })?
    cells,
    LSPObject? metadata,
  }) = _NotebookDocumentChangeEvent;

  factory NotebookDocumentChangeEvent.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentChangeEventFromJson(json);
}

@freezed
abstract class NotebookDocumentIdentifier with _$NotebookDocumentIdentifier {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookDocumentIdentifier({required String uri}) =
      _NotebookDocumentIdentifier;

  factory NotebookDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentIdentifierFromJson(json);
}

@freezed
abstract class InlineCompletionContext with _$InlineCompletionContext {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineCompletionContext({
    required InlineCompletionTriggerKind triggerKind,
    SelectedCompletionInfo? selectedCompletionInfo,
  }) = _InlineCompletionContext;

  factory InlineCompletionContext.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionContextFromJson(json);
}

@freezed
abstract class StringValue with _$StringValue {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory StringValue({required String kind, required String value}) =
      _StringValue;

  factory StringValue.fromJson(Map<String, dynamic> json) =>
      _$StringValueFromJson(json);
}

@freezed
abstract class InlineCompletionOptions with _$InlineCompletionOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineCompletionOptions({bool? workDoneProgress}) =
      _InlineCompletionOptions;

  factory InlineCompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionOptionsFromJson(json);
}

@freezed
abstract class Registration with _$Registration {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Registration({
    required String id,
    required String method,
    LSPAny? registerOptions,
  }) = _Registration;

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);
}

@freezed
abstract class Unregistration with _$Unregistration {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Unregistration({required String id, required String method}) =
      _Unregistration;

  factory Unregistration.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationFromJson(json);
}

@freezed
abstract class TInitializeParams with _$TInitializeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TInitializeParams({
    required ProcessIdOrVersionBase processId,
    required InitializeParamsRootUriBase rootUri,
    required ClientCapabilities capabilities,
    TraceValues? trace,
    LSPAny? initializationOptions,
    InitializeParamsRootPathBase? rootPath,
    String? locale,
    ({String name, String? version})? clientInfo,
    ProgressToken? workDoneToken,
  }) = _TInitializeParams;

  factory TInitializeParams.fromJson(Map<String, dynamic> json) =>
      _$TInitializeParamsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersInitializeParams
    with _$WorkspaceFoldersInitializeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceFoldersInitializeParams({
    WorkspaceFoldersInitializeParamsWorkspaceFoldersBase? workspaceFolders,
  }) = _WorkspaceFoldersInitializeParams;

  factory WorkspaceFoldersInitializeParams.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersInitializeParamsFromJson(json);
}

@freezed
abstract class ServerCapabilities with _$ServerCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ServerCapabilities({
    ServerCapabilitiesWorkspaceSymbolProviderBase? workspaceSymbolProvider,
    ServerCapabilitiesDocumentHighlightProviderBase? documentHighlightProvider,
    ServerCapabilitiesDocumentFormattingProviderBase?
    documentFormattingProvider,
    ServerCapabilitiesCodeActionProviderBase? codeActionProvider,
    CompletionOptions? completionProvider,
    ({
      WorkspaceFoldersServerCapabilities? workspaceFolders,
      FileOperationOptions? fileOperations,
    })?
    workspace,
    ServerCapabilitiesInlineCompletionProviderBase? inlineCompletionProvider,
    ServerCapabilitiesDiagnosticProviderBase? diagnosticProvider,
    ServerCapabilitiesInlayHintProviderBase? inlayHintProvider,
    ServerCapabilitiesDefinitionProviderBase? definitionProvider,
    ServerCapabilitiesDeclarationProviderBase? declarationProvider,
    ServerCapabilitiesMonikerProviderBase? monikerProvider,
    ServerCapabilitiesSemanticTokensProviderBase? semanticTokensProvider,
    ServerCapabilitiesLinkedEditingRangeProviderBase?
    linkedEditingRangeProvider,
    ServerCapabilitiesCallHierarchyProviderBase? callHierarchyProvider,
    ExecuteCommandOptions? executeCommandProvider,
    ServerCapabilitiesTextDocumentSyncBase? textDocumentSync,
    ServerCapabilitiesFoldingRangeProviderBase? foldingRangeProvider,
    ServerCapabilitiesRenameProviderBase? renameProvider,
    DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider,
    ServerCapabilitiesDocumentRangeFormattingProviderBase?
    documentRangeFormattingProvider,
    LSPAny? experimental,
    ServerCapabilitiesSelectionRangeProviderBase? selectionRangeProvider,
    ServerCapabilitiesColorProviderBase? colorProvider,
    DocumentLinkOptions? documentLinkProvider,
    CodeLensOptions? codeLensProvider,
    ServerCapabilitiesNotebookDocumentSyncBase? notebookDocumentSync,
    ServerCapabilitiesDocumentSymbolProviderBase? documentSymbolProvider,
    PositionEncodingKind? positionEncoding,
    ServerCapabilitiesReferencesProviderBase? referencesProvider,
    ServerCapabilitiesImplementationProviderBase? implementationProvider,
    ServerCapabilitiesTypeDefinitionProviderBase? typeDefinitionProvider,
    ServerCapabilitiesInlineValueProviderBase? inlineValueProvider,
    ServerCapabilitiesTypeHierarchyProviderBase? typeHierarchyProvider,
    SignatureHelpOptions? signatureHelpProvider,
    ServerCapabilitiesHoverProviderBase? hoverProvider,
  }) = _ServerCapabilities;

  factory ServerCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ServerCapabilitiesFromJson(json);
}

@freezed
abstract class VersionedTextDocumentIdentifier
    with _$VersionedTextDocumentIdentifier {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory VersionedTextDocumentIdentifier({
    required String uri,
    required int version,
  }) = _VersionedTextDocumentIdentifier;

  factory VersionedTextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$VersionedTextDocumentIdentifierFromJson(json);
}

@freezed
abstract class SaveOptions with _$SaveOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SaveOptions({bool? includeText}) = _SaveOptions;

  factory SaveOptions.fromJson(Map<String, dynamic> json) =>
      _$SaveOptionsFromJson(json);
}

@freezed
abstract class FileEvent with _$FileEvent {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileEvent({required String uri, required FileChangeType type}) =
      _FileEvent;

  factory FileEvent.fromJson(Map<String, dynamic> json) =>
      _$FileEventFromJson(json);
}

@freezed
abstract class FileSystemWatcher with _$FileSystemWatcher {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileSystemWatcher({
    required GlobPattern globPattern,
    WatchKind? kind,
  }) = _FileSystemWatcher;

  factory FileSystemWatcher.fromJson(Map<String, dynamic> json) =>
      _$FileSystemWatcherFromJson(json);
}

@freezed
abstract class Diagnostic with _$Diagnostic {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory Diagnostic({
    required Range range,
    required String message,
    LSPAny? data,
    List<DiagnosticRelatedInformation>? relatedInformation,
    List<DiagnosticTag>? tags,
    String? source,
    CodeDescription? codeDescription,
    ProgressTokenBase? code,
    DiagnosticSeverity? severity,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}

@freezed
abstract class CompletionContext with _$CompletionContext {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionContext({
    required CompletionTriggerKind triggerKind,
    String? triggerCharacter,
  }) = _CompletionContext;

  factory CompletionContext.fromJson(Map<String, dynamic> json) =>
      _$CompletionContextFromJson(json);
}

@freezed
abstract class CompletionItemLabelDetails with _$CompletionItemLabelDetails {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionItemLabelDetails({
    String? description,
    String? detail,
  }) = _CompletionItemLabelDetails;

  factory CompletionItemLabelDetails.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemLabelDetailsFromJson(json);
}

@freezed
abstract class InsertReplaceEdit with _$InsertReplaceEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InsertReplaceEdit({
    required String newText,
    required Range insert,
    required Range replace,
  }) = _InsertReplaceEdit;

  factory InsertReplaceEdit.fromJson(Map<String, dynamic> json) =>
      _$InsertReplaceEditFromJson(json);
}

@freezed
abstract class CompletionOptions with _$CompletionOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionOptions({
    ({bool? labelDetailsSupport})? completionItem,
    bool? resolveProvider,
    List<String>? allCommitCharacters,
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _CompletionOptions;

  factory CompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$CompletionOptionsFromJson(json);
}

@freezed
abstract class HoverOptions with _$HoverOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory HoverOptions({bool? workDoneProgress}) = _HoverOptions;

  factory HoverOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverOptionsFromJson(json);
}

@freezed
abstract class SignatureHelpContext with _$SignatureHelpContext {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SignatureHelpContext({
    required SignatureHelpTriggerKind triggerKind,
    required bool isRetrigger,
    SignatureHelp? activeSignatureHelp,
    String? triggerCharacter,
  }) = _SignatureHelpContext;

  factory SignatureHelpContext.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpContextFromJson(json);
}

@freezed
abstract class SignatureInformation with _$SignatureInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SignatureInformation({
    required String label,
    int? activeParameter,
    List<ParameterInformation>? parameters,
    TooltipOrDocumentationBase? documentation,
  }) = _SignatureInformation;

  factory SignatureInformation.fromJson(Map<String, dynamic> json) =>
      _$SignatureInformationFromJson(json);
}

@freezed
abstract class SignatureHelpOptions with _$SignatureHelpOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SignatureHelpOptions({
    List<String>? retriggerCharacters,
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _SignatureHelpOptions;

  factory SignatureHelpOptions.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpOptionsFromJson(json);
}

@freezed
abstract class DefinitionOptions with _$DefinitionOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DefinitionOptions({bool? workDoneProgress}) =
      _DefinitionOptions;

  factory DefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionOptionsFromJson(json);
}

@freezed
abstract class ReferenceContext with _$ReferenceContext {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ReferenceContext({required bool includeDeclaration}) =
      _ReferenceContext;

  factory ReferenceContext.fromJson(Map<String, dynamic> json) =>
      _$ReferenceContextFromJson(json);
}

@freezed
abstract class ReferenceOptions with _$ReferenceOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ReferenceOptions({bool? workDoneProgress}) = _ReferenceOptions;

  factory ReferenceOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceOptionsFromJson(json);
}

@freezed
abstract class DocumentHighlightOptions with _$DocumentHighlightOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentHighlightOptions({bool? workDoneProgress}) =
      _DocumentHighlightOptions;

  factory DocumentHighlightOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightOptionsFromJson(json);
}

@freezed
abstract class BaseSymbolInformation with _$BaseSymbolInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory BaseSymbolInformation({
    required String name,
    required SymbolKind kind,
    String? containerName,
    List<SymbolTag>? tags,
  }) = _BaseSymbolInformation;

  factory BaseSymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$BaseSymbolInformationFromJson(json);
}

@freezed
abstract class DocumentSymbolOptions with _$DocumentSymbolOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentSymbolOptions({String? label, bool? workDoneProgress}) =
      _DocumentSymbolOptions;

  factory DocumentSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolOptionsFromJson(json);
}

@freezed
abstract class CodeActionContext with _$CodeActionContext {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeActionContext({
    required List<Diagnostic> diagnostics,
    CodeActionTriggerKind? triggerKind,
    List<CodeActionKind>? only,
  }) = _CodeActionContext;

  factory CodeActionContext.fromJson(Map<String, dynamic> json) =>
      _$CodeActionContextFromJson(json);
}

@freezed
abstract class CodeActionOptions with _$CodeActionOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeActionOptions({
    bool? resolveProvider,
    List<CodeActionKind>? codeActionKinds,
    bool? workDoneProgress,
  }) = _CodeActionOptions;

  factory CodeActionOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionOptionsFromJson(json);
}

@freezed
abstract class WorkspaceSymbolOptions with _$WorkspaceSymbolOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceSymbolOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _WorkspaceSymbolOptions;

  factory WorkspaceSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolOptionsFromJson(json);
}

@freezed
abstract class CodeLensOptions with _$CodeLensOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeLensOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _CodeLensOptions;

  factory CodeLensOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensOptionsFromJson(json);
}

@freezed
abstract class DocumentLinkOptions with _$DocumentLinkOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentLinkOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _DocumentLinkOptions;

  factory DocumentLinkOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkOptionsFromJson(json);
}

@freezed
abstract class FormattingOptions with _$FormattingOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FormattingOptions({
    required int tabSize,
    required bool insertSpaces,
    bool? trimFinalNewlines,
    bool? insertFinalNewline,
    bool? trimTrailingWhitespace,
  }) = _FormattingOptions;

  factory FormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$FormattingOptionsFromJson(json);
}

@freezed
abstract class DocumentFormattingOptions with _$DocumentFormattingOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentFormattingOptions({bool? workDoneProgress}) =
      _DocumentFormattingOptions;

  factory DocumentFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingOptionsFromJson(json);
}

@freezed
abstract class DocumentRangeFormattingOptions
    with _$DocumentRangeFormattingOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentRangeFormattingOptions({
    bool? rangesSupport,
    bool? workDoneProgress,
  }) = _DocumentRangeFormattingOptions;

  factory DocumentRangeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingOptionsFromJson(json);
}

@freezed
abstract class DocumentOnTypeFormattingOptions
    with _$DocumentOnTypeFormattingOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentOnTypeFormattingOptions({
    required String firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingOptions;

  factory DocumentOnTypeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingOptionsFromJson(json);
}

@freezed
abstract class RenameOptions with _$RenameOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RenameOptions({bool? prepareProvider, bool? workDoneProgress}) =
      _RenameOptions;

  factory RenameOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameOptionsFromJson(json);
}

@freezed
abstract class ExecuteCommandOptions with _$ExecuteCommandOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ExecuteCommandOptions({
    required List<String> commands,
    bool? workDoneProgress,
  }) = _ExecuteCommandOptions;

  factory ExecuteCommandOptions.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensLegend with _$SemanticTokensLegend {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensLegend({
    required List<String> tokenTypes,
    required List<String> tokenModifiers,
  }) = _SemanticTokensLegend;

  factory SemanticTokensLegend.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensLegendFromJson(json);
}

@freezed
abstract class OptionalVersionedTextDocumentIdentifier
    with _$OptionalVersionedTextDocumentIdentifier {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory OptionalVersionedTextDocumentIdentifier({
    required String uri,
    required ProcessIdOrVersionBase version,
  }) = _OptionalVersionedTextDocumentIdentifier;

  factory OptionalVersionedTextDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) => _$OptionalVersionedTextDocumentIdentifierFromJson(json);
}

@freezed
abstract class AnnotatedTextEdit with _$AnnotatedTextEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory AnnotatedTextEdit({
    required Range range,
    required String newText,
    required ChangeAnnotationIdentifier annotationId,
  }) = _AnnotatedTextEdit;

  factory AnnotatedTextEdit.fromJson(Map<String, dynamic> json) =>
      _$AnnotatedTextEditFromJson(json);
}

@freezed
abstract class ResourceOperation with _$ResourceOperation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ResourceOperation({
    required String kind,
    ChangeAnnotationIdentifier? annotationId,
  }) = _ResourceOperation;

  factory ResourceOperation.fromJson(Map<String, dynamic> json) =>
      _$ResourceOperationFromJson(json);
}

@freezed
abstract class CreateFileOptions with _$CreateFileOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CreateFileOptions({bool? ignoreIfExists, bool? overwrite}) =
      _CreateFileOptions;

  factory CreateFileOptions.fromJson(Map<String, dynamic> json) =>
      _$CreateFileOptionsFromJson(json);
}

@freezed
abstract class RenameFileOptions with _$RenameFileOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RenameFileOptions({bool? ignoreIfExists, bool? overwrite}) =
      _RenameFileOptions;

  factory RenameFileOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameFileOptionsFromJson(json);
}

@freezed
abstract class DeleteFileOptions with _$DeleteFileOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DeleteFileOptions({bool? ignoreIfNotExists, bool? recursive}) =
      _DeleteFileOptions;

  factory DeleteFileOptions.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileOptionsFromJson(json);
}

@freezed
abstract class FileOperationPattern with _$FileOperationPattern {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileOperationPattern({
    required String glob,
    FileOperationPatternOptions? options,
    FileOperationPatternKind? matches,
  }) = _FileOperationPattern;

  factory FileOperationPattern.fromJson(Map<String, dynamic> json) =>
      _$FileOperationPatternFromJson(json);
}

@freezed
abstract class WorkspaceFullDocumentDiagnosticReport
    with _$WorkspaceFullDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceFullDocumentDiagnosticReport({
    required String kind,
    required List<Diagnostic> items,
    required String uri,
    required ProcessIdOrVersionBase version,
    String? resultId,
  }) = _WorkspaceFullDocumentDiagnosticReport;

  factory WorkspaceFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFullDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class WorkspaceUnchangedDocumentDiagnosticReport
    with _$WorkspaceUnchangedDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceUnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
    required String uri,
    required ProcessIdOrVersionBase version,
  }) = _WorkspaceUnchangedDocumentDiagnosticReport;

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceUnchangedDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class NotebookCell with _$NotebookCell {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookCell({
    required NotebookCellKind kind,
    required String document,
    ExecutionSummary? executionSummary,
    LSPObject? metadata,
  }) = _NotebookCell;

  factory NotebookCell.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellFromJson(json);
}

@freezed
abstract class NotebookCellArrayChange with _$NotebookCellArrayChange {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookCellArrayChange({
    required int start,
    required int deleteCount,
    List<NotebookCell>? cells,
  }) = _NotebookCellArrayChange;

  factory NotebookCellArrayChange.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellArrayChangeFromJson(json);
}

@freezed
abstract class SelectedCompletionInfo with _$SelectedCompletionInfo {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SelectedCompletionInfo({
    required Range range,
    required String text,
  }) = _SelectedCompletionInfo;

  factory SelectedCompletionInfo.fromJson(Map<String, dynamic> json) =>
      _$SelectedCompletionInfoFromJson(json);
}

@freezed
abstract class ClientCapabilities with _$ClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ClientCapabilities({
    LSPAny? experimental,
    GeneralClientCapabilities? general,
    WindowClientCapabilities? window,
    NotebookDocumentClientCapabilities? notebookDocument,
    TextDocumentClientCapabilities? textDocument,
    WorkspaceClientCapabilities? workspace,
  }) = _ClientCapabilities;

  factory ClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ClientCapabilitiesFromJson(json);
}

@freezed
abstract class TextDocumentSyncOptions with _$TextDocumentSyncOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentSyncOptions({
    TextDocumentSyncOptionsSaveBase? save,
    bool? willSaveWaitUntil,
    bool? willSave,
    TextDocumentSyncKind? change,
    bool? openClose,
  }) = _TextDocumentSyncOptions;

  factory TextDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentSyncOptionsFromJson(json);
}

@freezed
abstract class NotebookDocumentSyncOptions with _$NotebookDocumentSyncOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookDocumentSyncOptions({
    required List<NotebookDocumentSyncOptionsNotebookSelectorBase>
    notebookSelector,
    bool? save,
  }) = _NotebookDocumentSyncOptions;

  factory NotebookDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentSyncOptionsFromJson(json);
}

@freezed
abstract class NotebookDocumentSyncRegistrationOptions
    with _$NotebookDocumentSyncRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookDocumentSyncRegistrationOptions({
    required List<NotebookDocumentSyncOptionsNotebookSelectorBase>
    notebookSelector,
    String? id,
    bool? save,
  }) = _NotebookDocumentSyncRegistrationOptions;

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersServerCapabilities
    with _$WorkspaceFoldersServerCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceFoldersServerCapabilities({
    WorkspaceFoldersServerCapabilitiesChangeNotificationsBase?
    changeNotifications,
    bool? supported,
  }) = _WorkspaceFoldersServerCapabilities;

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersServerCapabilitiesFromJson(json);
}

@freezed
abstract class FileOperationOptions with _$FileOperationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileOperationOptions({
    FileOperationRegistrationOptions? willDelete,
    FileOperationRegistrationOptions? didDelete,
    FileOperationRegistrationOptions? willRename,
    FileOperationRegistrationOptions? didRename,
    FileOperationRegistrationOptions? willCreate,
    FileOperationRegistrationOptions? didCreate,
  }) = _FileOperationOptions;

  factory FileOperationOptions.fromJson(Map<String, dynamic> json) =>
      _$FileOperationOptionsFromJson(json);
}

@freezed
abstract class CodeDescription with _$CodeDescription {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeDescription({required String href}) = _CodeDescription;

  factory CodeDescription.fromJson(Map<String, dynamic> json) =>
      _$CodeDescriptionFromJson(json);
}

@freezed
abstract class DiagnosticRelatedInformation
    with _$DiagnosticRelatedInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DiagnosticRelatedInformation({
    required Location location,
    required String message,
  }) = _DiagnosticRelatedInformation;

  factory DiagnosticRelatedInformation.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticRelatedInformationFromJson(json);
}

@freezed
abstract class ParameterInformation with _$ParameterInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ParameterInformation({
    required ParameterInformationLabelBase label,
    TooltipOrDocumentationBase? documentation,
  }) = _ParameterInformation;

  factory ParameterInformation.fromJson(Map<String, dynamic> json) =>
      _$ParameterInformationFromJson(json);
}

@freezed
abstract class NotebookCellTextDocumentFilter
    with _$NotebookCellTextDocumentFilter {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookCellTextDocumentFilter({
    required NotebookCellTextDocumentFilterNotebookBase notebook,
    String? language,
  }) = _NotebookCellTextDocumentFilter;

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellTextDocumentFilterFromJson(json);
}

@freezed
abstract class FileOperationPatternOptions with _$FileOperationPatternOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileOperationPatternOptions({bool? ignoreCase}) =
      _FileOperationPatternOptions;

  factory FileOperationPatternOptions.fromJson(Map<String, dynamic> json) =>
      _$FileOperationPatternOptionsFromJson(json);
}

@freezed
abstract class ExecutionSummary with _$ExecutionSummary {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ExecutionSummary({required int executionOrder, bool? success}) =
      _ExecutionSummary;

  factory ExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$ExecutionSummaryFromJson(json);
}

@freezed
abstract class WorkspaceClientCapabilities with _$WorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceClientCapabilities({
    FoldingRangeWorkspaceClientCapabilities? foldingRange,
    DiagnosticWorkspaceClientCapabilities? diagnostics,
    InlayHintWorkspaceClientCapabilities? inlayHint,
    InlineValueWorkspaceClientCapabilities? inlineValue,
    FileOperationClientCapabilities? fileOperations,
    CodeLensWorkspaceClientCapabilities? codeLens,
    SemanticTokensWorkspaceClientCapabilities? semanticTokens,
    bool? configuration,
    bool? workspaceFolders,
    ExecuteCommandClientCapabilities? executeCommand,
    WorkspaceSymbolClientCapabilities? symbol,
    DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles,
    DidChangeConfigurationClientCapabilities? didChangeConfiguration,
    WorkspaceEditClientCapabilities? workspaceEdit,
    bool? applyEdit,
  }) = _WorkspaceClientCapabilities;

  factory WorkspaceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class TextDocumentClientCapabilities
    with _$TextDocumentClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentClientCapabilities({
    InlineCompletionClientCapabilities? inlineCompletion,
    DiagnosticClientCapabilities? diagnostic,
    InlayHintClientCapabilities? inlayHint,
    InlineValueClientCapabilities? inlineValue,
    TypeHierarchyClientCapabilities? typeHierarchy,
    MonikerClientCapabilities? moniker,
    LinkedEditingRangeClientCapabilities? linkedEditingRange,
    SemanticTokensClientCapabilities? semanticTokens,
    CallHierarchyClientCapabilities? callHierarchy,
    PublishDiagnosticsClientCapabilities? publishDiagnostics,
    SelectionRangeClientCapabilities? selectionRange,
    FoldingRangeClientCapabilities? foldingRange,
    RenameClientCapabilities? rename,
    DocumentOnTypeFormattingClientCapabilities? onTypeFormatting,
    DocumentRangeFormattingClientCapabilities? rangeFormatting,
    DocumentFormattingClientCapabilities? formatting,
    DocumentColorClientCapabilities? colorProvider,
    DocumentLinkClientCapabilities? documentLink,
    CodeLensClientCapabilities? codeLens,
    CodeActionClientCapabilities? codeAction,
    DocumentSymbolClientCapabilities? documentSymbol,
    DocumentHighlightClientCapabilities? documentHighlight,
    ReferenceClientCapabilities? references,
    ImplementationClientCapabilities? implementation,
    TypeDefinitionClientCapabilities? typeDefinition,
    DefinitionClientCapabilities? definition,
    DeclarationClientCapabilities? declaration,
    SignatureHelpClientCapabilities? signatureHelp,
    HoverClientCapabilities? hover,
    CompletionClientCapabilities? completion,
    TextDocumentSyncClientCapabilities? synchronization,
  }) = _TextDocumentClientCapabilities;

  factory TextDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class NotebookDocumentClientCapabilities
    with _$NotebookDocumentClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookDocumentClientCapabilities({
    required NotebookDocumentSyncClientCapabilities synchronization,
  }) = _NotebookDocumentClientCapabilities;

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class WindowClientCapabilities with _$WindowClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WindowClientCapabilities({
    ShowDocumentClientCapabilities? showDocument,
    ShowMessageRequestClientCapabilities? showMessage,
    bool? workDoneProgress,
  }) = _WindowClientCapabilities;

  factory WindowClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WindowClientCapabilitiesFromJson(json);
}

@freezed
abstract class GeneralClientCapabilities with _$GeneralClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory GeneralClientCapabilities({
    List<PositionEncodingKind>? positionEncodings,
    MarkdownClientCapabilities? markdown,
    RegularExpressionsClientCapabilities? regularExpressions,
    ({bool cancel, List<String> retryOnContentModified})? staleRequestSupport,
  }) = _GeneralClientCapabilities;

  factory GeneralClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$GeneralClientCapabilitiesFromJson(json);
}

@freezed
abstract class RelativePattern with _$RelativePattern {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RelativePattern({
    required RelativePatternBaseUriBase baseUri,
    required Pattern pattern,
  }) = _RelativePattern;

  factory RelativePattern.fromJson(Map<String, dynamic> json) =>
      _$RelativePatternFromJson(json);
}

@freezed
abstract class WorkspaceEditClientCapabilities
    with _$WorkspaceEditClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceEditClientCapabilities({
    ({bool? groupsOnLabel})? changeAnnotationSupport,
    bool? normalizesLineEndings,
    FailureHandlingKind? failureHandling,
    List<ResourceOperationKind>? resourceOperations,
    bool? documentChanges,
  }) = _WorkspaceEditClientCapabilities;

  factory WorkspaceEditClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditClientCapabilitiesFromJson(json);
}

@freezed
abstract class DidChangeConfigurationClientCapabilities
    with _$DidChangeConfigurationClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeConfigurationClientCapabilities({
    bool? dynamicRegistration,
  }) = _DidChangeConfigurationClientCapabilities;

  factory DidChangeConfigurationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationClientCapabilitiesFromJson(json);
}

@freezed
abstract class DidChangeWatchedFilesClientCapabilities
    with _$DidChangeWatchedFilesClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DidChangeWatchedFilesClientCapabilities({
    bool? relativePatternSupport,
    bool? dynamicRegistration,
  }) = _DidChangeWatchedFilesClientCapabilities;

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesClientCapabilitiesFromJson(json);
}

@freezed
abstract class WorkspaceSymbolClientCapabilities
    with _$WorkspaceSymbolClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory WorkspaceSymbolClientCapabilities({
    ({List<String> properties})? resolveSupport,
    ({List<SymbolTag> valueSet})? tagSupport,
    ({List<SymbolKind>? valueSet})? symbolKind,
    bool? dynamicRegistration,
  }) = _WorkspaceSymbolClientCapabilities;

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolClientCapabilitiesFromJson(json);
}

@freezed
abstract class ExecuteCommandClientCapabilities
    with _$ExecuteCommandClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ExecuteCommandClientCapabilities({bool? dynamicRegistration}) =
      _ExecuteCommandClientCapabilities;

  factory ExecuteCommandClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandClientCapabilitiesFromJson(json);
}

@freezed
abstract class SemanticTokensWorkspaceClientCapabilities
    with _$SemanticTokensWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensWorkspaceClientCapabilities({
    bool? refreshSupport,
  }) = _SemanticTokensWorkspaceClientCapabilities;

  factory SemanticTokensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class CodeLensWorkspaceClientCapabilities
    with _$CodeLensWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeLensWorkspaceClientCapabilities({bool? refreshSupport}) =
      _CodeLensWorkspaceClientCapabilities;

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$CodeLensWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class FileOperationClientCapabilities
    with _$FileOperationClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FileOperationClientCapabilities({
    bool? willDelete,
    bool? didDelete,
    bool? willRename,
    bool? didRename,
    bool? willCreate,
    bool? didCreate,
    bool? dynamicRegistration,
  }) = _FileOperationClientCapabilities;

  factory FileOperationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FileOperationClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlineValueWorkspaceClientCapabilities
    with _$InlineValueWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueWorkspaceClientCapabilities({bool? refreshSupport}) =
      _InlineValueWorkspaceClientCapabilities;

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlayHintWorkspaceClientCapabilities
    with _$InlayHintWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlayHintWorkspaceClientCapabilities({bool? refreshSupport}) =
      _InlayHintWorkspaceClientCapabilities;

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlayHintWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class DiagnosticWorkspaceClientCapabilities
    with _$DiagnosticWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DiagnosticWorkspaceClientCapabilities({bool? refreshSupport}) =
      _DiagnosticWorkspaceClientCapabilities;

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class FoldingRangeWorkspaceClientCapabilities
    with _$FoldingRangeWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FoldingRangeWorkspaceClientCapabilities({
    bool? refreshSupport,
  }) = _FoldingRangeWorkspaceClientCapabilities;

  factory FoldingRangeWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$FoldingRangeWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class TextDocumentSyncClientCapabilities
    with _$TextDocumentSyncClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TextDocumentSyncClientCapabilities({
    bool? didSave,
    bool? willSaveWaitUntil,
    bool? willSave,
    bool? dynamicRegistration,
  }) = _TextDocumentSyncClientCapabilities;

  factory TextDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSyncClientCapabilitiesFromJson(json);
}

@freezed
abstract class CompletionClientCapabilities
    with _$CompletionClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CompletionClientCapabilities({
    ({List<String>? itemDefaults})? completionList,
    bool? contextSupport,
    InsertTextMode? insertTextMode,
    ({List<CompletionItemKind>? valueSet})? completionItemKind,
    ({
      bool? snippetSupport,
      bool? commitCharactersSupport,
      List<MarkupKind>? documentationFormat,
      bool? deprecatedSupport,
      bool? preselectSupport,
      ({List<CompletionItemTag> valueSet})? tagSupport,
      bool? insertReplaceSupport,
      ({List<String> properties})? resolveSupport,
      ({List<InsertTextMode> valueSet})? insertTextModeSupport,
      bool? labelDetailsSupport,
    })?
    completionItem,
    bool? dynamicRegistration,
  }) = _CompletionClientCapabilities;

  factory CompletionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CompletionClientCapabilitiesFromJson(json);
}

@freezed
abstract class HoverClientCapabilities with _$HoverClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory HoverClientCapabilities({
    List<MarkupKind>? contentFormat,
    bool? dynamicRegistration,
  }) = _HoverClientCapabilities;

  factory HoverClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$HoverClientCapabilitiesFromJson(json);
}

@freezed
abstract class SignatureHelpClientCapabilities
    with _$SignatureHelpClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SignatureHelpClientCapabilities({
    bool? contextSupport,
    ({
      List<MarkupKind>? documentationFormat,
      ({bool? labelOffsetSupport})? parameterInformation,
      bool? activeParameterSupport,
    })?
    signatureInformation,
    bool? dynamicRegistration,
  }) = _SignatureHelpClientCapabilities;

  factory SignatureHelpClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpClientCapabilitiesFromJson(json);
}

@freezed
abstract class DeclarationClientCapabilities
    with _$DeclarationClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DeclarationClientCapabilities({
    bool? linkSupport,
    bool? dynamicRegistration,
  }) = _DeclarationClientCapabilities;

  factory DeclarationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeclarationClientCapabilitiesFromJson(json);
}

@freezed
abstract class DefinitionClientCapabilities
    with _$DefinitionClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DefinitionClientCapabilities({
    bool? linkSupport,
    bool? dynamicRegistration,
  }) = _DefinitionClientCapabilities;

  factory DefinitionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DefinitionClientCapabilitiesFromJson(json);
}

@freezed
abstract class TypeDefinitionClientCapabilities
    with _$TypeDefinitionClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeDefinitionClientCapabilities({
    bool? linkSupport,
    bool? dynamicRegistration,
  }) = _TypeDefinitionClientCapabilities;

  factory TypeDefinitionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionClientCapabilitiesFromJson(json);
}

@freezed
abstract class ImplementationClientCapabilities
    with _$ImplementationClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ImplementationClientCapabilities({
    bool? linkSupport,
    bool? dynamicRegistration,
  }) = _ImplementationClientCapabilities;

  factory ImplementationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationClientCapabilitiesFromJson(json);
}

@freezed
abstract class ReferenceClientCapabilities with _$ReferenceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ReferenceClientCapabilities({bool? dynamicRegistration}) =
      _ReferenceClientCapabilities;

  factory ReferenceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ReferenceClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentHighlightClientCapabilities
    with _$DocumentHighlightClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentHighlightClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentHighlightClientCapabilities;

  factory DocumentHighlightClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentSymbolClientCapabilities
    with _$DocumentSymbolClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentSymbolClientCapabilities({
    bool? labelSupport,
    ({List<SymbolTag> valueSet})? tagSupport,
    bool? hierarchicalDocumentSymbolSupport,
    ({List<SymbolKind>? valueSet})? symbolKind,
    bool? dynamicRegistration,
  }) = _DocumentSymbolClientCapabilities;

  factory DocumentSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolClientCapabilitiesFromJson(json);
}

@freezed
abstract class CodeActionClientCapabilities
    with _$CodeActionClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeActionClientCapabilities({
    bool? honorsChangeAnnotations,
    ({List<String> properties})? resolveSupport,
    bool? dataSupport,
    bool? disabledSupport,
    bool? isPreferredSupport,
    ({({List<CodeActionKind> valueSet}) codeActionKind})?
    codeActionLiteralSupport,
    bool? dynamicRegistration,
  }) = _CodeActionClientCapabilities;

  factory CodeActionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeActionClientCapabilitiesFromJson(json);
}

@freezed
abstract class CodeLensClientCapabilities with _$CodeLensClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CodeLensClientCapabilities({bool? dynamicRegistration}) =
      _CodeLensClientCapabilities;

  factory CodeLensClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeLensClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentLinkClientCapabilities
    with _$DocumentLinkClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentLinkClientCapabilities({
    bool? tooltipSupport,
    bool? dynamicRegistration,
  }) = _DocumentLinkClientCapabilities;

  factory DocumentLinkClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentColorClientCapabilities
    with _$DocumentColorClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentColorClientCapabilities({bool? dynamicRegistration}) =
      _DocumentColorClientCapabilities;

  factory DocumentColorClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentFormattingClientCapabilities
    with _$DocumentFormattingClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentFormattingClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentFormattingClientCapabilities;

  factory DocumentFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentRangeFormattingClientCapabilities
    with _$DocumentRangeFormattingClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentRangeFormattingClientCapabilities({
    bool? rangesSupport,
    bool? dynamicRegistration,
  }) = _DocumentRangeFormattingClientCapabilities;

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentOnTypeFormattingClientCapabilities
    with _$DocumentOnTypeFormattingClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DocumentOnTypeFormattingClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentOnTypeFormattingClientCapabilities;

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingClientCapabilitiesFromJson(json);
}

@freezed
abstract class RenameClientCapabilities with _$RenameClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RenameClientCapabilities({
    bool? honorsChangeAnnotations,
    PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior,
    bool? prepareSupport,
    bool? dynamicRegistration,
  }) = _RenameClientCapabilities;

  factory RenameClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$RenameClientCapabilitiesFromJson(json);
}

@freezed
abstract class FoldingRangeClientCapabilities
    with _$FoldingRangeClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory FoldingRangeClientCapabilities({
    ({bool? collapsedText})? foldingRange,
    ({List<FoldingRangeKind>? valueSet})? foldingRangeKind,
    bool? lineFoldingOnly,
    int? rangeLimit,
    bool? dynamicRegistration,
  }) = _FoldingRangeClientCapabilities;

  factory FoldingRangeClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class SelectionRangeClientCapabilities
    with _$SelectionRangeClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SelectionRangeClientCapabilities({bool? dynamicRegistration}) =
      _SelectionRangeClientCapabilities;

  factory SelectionRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SelectionRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class PublishDiagnosticsClientCapabilities
    with _$PublishDiagnosticsClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory PublishDiagnosticsClientCapabilities({
    bool? dataSupport,
    bool? codeDescriptionSupport,
    bool? versionSupport,
    ({List<DiagnosticTag> valueSet})? tagSupport,
    bool? relatedInformation,
  }) = _PublishDiagnosticsClientCapabilities;

  factory PublishDiagnosticsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$PublishDiagnosticsClientCapabilitiesFromJson(json);
}

@freezed
abstract class CallHierarchyClientCapabilities
    with _$CallHierarchyClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory CallHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _CallHierarchyClientCapabilities;

  factory CallHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyClientCapabilitiesFromJson(json);
}

@freezed
abstract class SemanticTokensClientCapabilities
    with _$SemanticTokensClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory SemanticTokensClientCapabilities({
    required ({
      RangeBase? range,
      SemanticTokensClientCapabilitiesFullBase? full,
    })
    requests,
    required List<String> tokenTypes,
    required List<String> tokenModifiers,
    required List<TokenFormat> formats,
    bool? augmentsSyntaxTokens,
    bool? serverCancelSupport,
    bool? multilineTokenSupport,
    bool? overlappingTokenSupport,
    bool? dynamicRegistration,
  }) = _SemanticTokensClientCapabilities;

  factory SemanticTokensClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensClientCapabilitiesFromJson(json);
}

@freezed
abstract class LinkedEditingRangeClientCapabilities
    with _$LinkedEditingRangeClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory LinkedEditingRangeClientCapabilities({
    bool? dynamicRegistration,
  }) = _LinkedEditingRangeClientCapabilities;

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class MonikerClientCapabilities with _$MonikerClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MonikerClientCapabilities({bool? dynamicRegistration}) =
      _MonikerClientCapabilities;

  factory MonikerClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MonikerClientCapabilitiesFromJson(json);
}

@freezed
abstract class TypeHierarchyClientCapabilities
    with _$TypeHierarchyClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory TypeHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _TypeHierarchyClientCapabilities;

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlineValueClientCapabilities
    with _$InlineValueClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineValueClientCapabilities({bool? dynamicRegistration}) =
      _InlineValueClientCapabilities;

  factory InlineValueClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlineValueClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlayHintClientCapabilities with _$InlayHintClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlayHintClientCapabilities({
    ({List<String> properties})? resolveSupport,
    bool? dynamicRegistration,
  }) = _InlayHintClientCapabilities;

  factory InlayHintClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlayHintClientCapabilitiesFromJson(json);
}

@freezed
abstract class DiagnosticClientCapabilities
    with _$DiagnosticClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory DiagnosticClientCapabilities({
    bool? relatedDocumentSupport,
    bool? dynamicRegistration,
  }) = _DiagnosticClientCapabilities;

  factory DiagnosticClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlineCompletionClientCapabilities
    with _$InlineCompletionClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory InlineCompletionClientCapabilities({
    bool? dynamicRegistration,
  }) = _InlineCompletionClientCapabilities;

  factory InlineCompletionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionClientCapabilitiesFromJson(json);
}

@freezed
abstract class NotebookDocumentSyncClientCapabilities
    with _$NotebookDocumentSyncClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory NotebookDocumentSyncClientCapabilities({
    bool? executionSummarySupport,
    bool? dynamicRegistration,
  }) = _NotebookDocumentSyncClientCapabilities;

  factory NotebookDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncClientCapabilitiesFromJson(json);
}

@freezed
abstract class ShowMessageRequestClientCapabilities
    with _$ShowMessageRequestClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ShowMessageRequestClientCapabilities({
    ({bool? additionalPropertiesSupport})? messageActionItem,
  }) = _ShowMessageRequestClientCapabilities;

  factory ShowMessageRequestClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ShowMessageRequestClientCapabilitiesFromJson(json);
}

@freezed
abstract class ShowDocumentClientCapabilities
    with _$ShowDocumentClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory ShowDocumentClientCapabilities({required bool support}) =
      _ShowDocumentClientCapabilities;

  factory ShowDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class RegularExpressionsClientCapabilities
    with _$RegularExpressionsClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory RegularExpressionsClientCapabilities({
    required String engine,
    String? version,
  }) = _RegularExpressionsClientCapabilities;

  factory RegularExpressionsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$RegularExpressionsClientCapabilitiesFromJson(json);
}

@freezed
abstract class MarkdownClientCapabilities with _$MarkdownClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MarkdownClientCapabilities({
    required String parser,
    List<String>? allowedTags,
    String? version,
  }) = _MarkdownClientCapabilities;

  factory MarkdownClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MarkdownClientCapabilitiesFromJson(json);
}

/// A set of predefined token types. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
enum SemanticTokenTypes {
  namespaceValue('namespace'),
  typeValue('type'),
  classValue('class'),
  enumValue('enum'),
  interfaceValue('interface'),
  structValue('struct'),
  typeParameterValue('typeParameter'),
  parameterValue('parameter'),
  variableValue('variable'),
  propertyValue('property'),
  enumMemberValue('enumMember'),
  eventValue('event'),
  functionValue('function'),
  methodValue('method'),
  macroValue('macro'),
  keywordValue('keyword'),
  modifierValue('modifier'),
  commentValue('comment'),
  stringValue('string'),
  numberValue('number'),
  regexpValue('regexp'),
  operatorValue('operator'),
  decoratorValue('decorator');

  // The list of all values in this enumeration.
  const SemanticTokenTypes(this.value);

  // The type of this enumeration.
  final String value;
}

/// A set of predefined token modifiers. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
enum SemanticTokenModifiers {
  declarationValue('declaration'),
  definitionValue('definition'),
  readonlyValue('readonly'),
  staticValue('static'),
  deprecatedValue('deprecated'),
  abstractValue('abstract'),
  asyncValue('async'),
  modificationValue('modification'),
  documentationValue('documentation'),
  defaultLibraryValue('defaultLibrary');

  // The list of all values in this enumeration.
  const SemanticTokenModifiers(this.value);

  // The type of this enumeration.
  final String value;
}

/// The document diagnostic report kinds.
/// @since 3.17.0
enum DocumentDiagnosticReportKind {
  fullValue('full'),
  unchangedValue('unchanged');

  // The list of all values in this enumeration.
  const DocumentDiagnosticReportKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// Predefined error codes.
enum ErrorCodes {
  parseErrorValue(-32700),
  invalidRequestValue(-32600),
  methodNotFoundValue(-32601),
  invalidParamsValue(-32602),
  internalErrorValue(-32603),
  serverNotInitializedValue(-32002),
  unknownErrorCodeValue(-32001);

  // The list of all values in this enumeration.
  const ErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

enum LSPErrorCodes {
  requestFailedValue(-32803),
  serverCancelledValue(-32802),
  contentModifiedValue(-32801),
  requestCancelledValue(-32800);

  // The list of all values in this enumeration.
  const LSPErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined range kinds.
enum FoldingRangeKind {
  commentValue('comment'),
  importsValue('imports'),
  regionValue('region');

  // The list of all values in this enumeration.
  const FoldingRangeKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// A symbol kind.
enum SymbolKind {
  fileValue(1),
  moduleValue(2),
  namespaceValue(3),
  packageValue(4),
  classValue(5),
  methodValue(6),
  propertyValue(7),
  fieldValue(8),
  constructorValue(9),
  enumValue(10),
  interfaceValue(11),
  functionValue(12),
  variableValue(13),
  constantValue(14),
  stringValue(15),
  numberValue(16),
  booleanValue(17),
  arrayValue(18),
  objectValue(19),
  keyValue(20),
  nullValue(21),
  enumMemberValue(22),
  structValue(23),
  eventValue(24),
  operatorValue(25),
  typeParameterValue(26);

  // The list of all values in this enumeration.
  const SymbolKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
/// @since 3.16
enum SymbolTag {
  deprecatedValue(1);

  // The list of all values in this enumeration.
  const SymbolTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// Moniker uniqueness level to define scope of the moniker.
/// @since 3.16.0
enum UniquenessLevel {
  documentValue('document'),
  projectValue('project'),
  groupValue('group'),
  schemeValue('scheme'),
  globalValue('global');

  // The list of all values in this enumeration.
  const UniquenessLevel(this.value);

  // The type of this enumeration.
  final String value;
}

/// The moniker kind.
/// @since 3.16.0
enum MonikerKind {
  importValue('import'),
  exportValue('export'),
  localValue('local');

  // The list of all values in this enumeration.
  const MonikerKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// Inlay hint kinds.
/// @since 3.17.0
enum InlayHintKind {
  typeValue(1),
  parameterValue(2);

  // The list of all values in this enumeration.
  const InlayHintKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The message type
enum MessageType {
  errorValue(1),
  warningValue(2),
  infoValue(3),
  logValue(4),
  debugValue(5);

  // The list of all values in this enumeration.
  const MessageType(this.value);

  // The type of this enumeration.
  final int value;
}

/// Defines how the host (editor) should sync document changes to the language
/// server.
enum TextDocumentSyncKind {
  noneValue(0),
  fullValue(1),
  incrementalValue(2);

  // The list of all values in this enumeration.
  const TextDocumentSyncKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// Represents reasons why a text document is saved.
enum TextDocumentSaveReason {
  manualValue(1),
  afterDelayValue(2),
  focusOutValue(3);

  // The list of all values in this enumeration.
  const TextDocumentSaveReason(this.value);

  // The type of this enumeration.
  final int value;
}

/// The kind of a completion entry.
enum CompletionItemKind {
  textValue(1),
  methodValue(2),
  functionValue(3),
  constructorValue(4),
  fieldValue(5),
  variableValue(6),
  classValue(7),
  interfaceValue(8),
  moduleValue(9),
  propertyValue(10),
  unitValue(11),
  valueValue(12),
  enumValue(13),
  keywordValue(14),
  snippetValue(15),
  colorValue(16),
  fileValue(17),
  referenceValue(18),
  folderValue(19),
  enumMemberValue(20),
  constantValue(21),
  structValue(22),
  eventValue(23),
  operatorValue(24),
  typeParameterValue(25);

  // The list of all values in this enumeration.
  const CompletionItemKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// Completion item tags are extra annotations that tweak the rendering of a
/// completion item.
/// @since 3.15.0
enum CompletionItemTag {
  deprecatedValue(1);

  // The list of all values in this enumeration.
  const CompletionItemTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// Defines whether the insert text in a completion item should be interpreted
/// as plain text or a snippet.
enum InsertTextFormat {
  plainTextValue(1),
  snippetValue(2);

  // The list of all values in this enumeration.
  const InsertTextFormat(this.value);

  // The type of this enumeration.
  final int value;
}

/// How whitespace and indentation is handled during completion item insertion.
/// @since 3.16.0
enum InsertTextMode {
  asIsValue(1),
  adjustIndentationValue(2);

  // The list of all values in this enumeration.
  const InsertTextMode(this.value);

  // The type of this enumeration.
  final int value;
}

/// A document highlight kind.
enum DocumentHighlightKind {
  textValue(1),
  readValue(2),
  writeValue(3);

  // The list of all values in this enumeration.
  const DocumentHighlightKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined code action kinds
enum CodeActionKind {
  emptyValue(''),
  quickFixValue('quickfix'),
  refactorValue('refactor'),
  refactorExtractValue('refactor.extract'),
  refactorInlineValue('refactor.inline'),
  refactorRewriteValue('refactor.rewrite'),
  sourceValue('source'),
  sourceOrganizeImportsValue('source.organizeImports'),
  sourceFixAllValue('source.fixAll');

  // The list of all values in this enumeration.
  const CodeActionKind(this.value);

  // The type of this enumeration.
  final String value;
}

enum TraceValues {
  offValue('off'),
  messagesValue('messages'),
  verboseValue('verbose');

  // The list of all values in this enumeration.
  const TraceValues(this.value);

  // The type of this enumeration.
  final String value;
}

/// Describes the content type that a client supports in various result
/// literals like `Hover`, `ParameterInfo` or `CompletionItem`.
/// Please note that `MarkupKinds` must not start with a `$`. This kinds are
/// reserved for internal usage.
enum MarkupKind {
  plainTextValue('plaintext'),
  markdownValue('markdown');

  // The list of all values in this enumeration.
  const MarkupKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// Describes how an {@link InlineCompletionItemProvider inline completion
/// provider} was triggered.
/// @since 3.18.0 @proposed
enum InlineCompletionTriggerKind {
  invokedValue(0),
  automaticValue(1);

  // The list of all values in this enumeration.
  const InlineCompletionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined position encoding kinds.
/// @since 3.17.0
enum PositionEncodingKind {
  uTF8Value('utf-8'),
  uTF16Value('utf-16'),
  uTF32Value('utf-32');

  // The list of all values in this enumeration.
  const PositionEncodingKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// The file event type
enum FileChangeType {
  createdValue(1),
  changedValue(2),
  deletedValue(3);

  // The list of all values in this enumeration.
  const FileChangeType(this.value);

  // The type of this enumeration.
  final int value;
}

enum WatchKind {
  createValue(1),
  changeValue(2),
  deleteValue(4);

  // The list of all values in this enumeration.
  const WatchKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The diagnostic's severity.
enum DiagnosticSeverity {
  errorValue(1),
  warningValue(2),
  informationValue(3),
  hintValue(4);

  // The list of all values in this enumeration.
  const DiagnosticSeverity(this.value);

  // The type of this enumeration.
  final int value;
}

/// The diagnostic tags.
/// @since 3.15.0
enum DiagnosticTag {
  unnecessaryValue(1),
  deprecatedValue(2);

  // The list of all values in this enumeration.
  const DiagnosticTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// How a completion was triggered
enum CompletionTriggerKind {
  invokedValue(1),
  triggerCharacterValue(2),
  triggerForIncompleteCompletionsValue(3);

  // The list of all values in this enumeration.
  const CompletionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// How a signature help was triggered.
/// @since 3.15.0
enum SignatureHelpTriggerKind {
  invokedValue(1),
  triggerCharacterValue(2),
  contentChangeValue(3);

  // The list of all values in this enumeration.
  const SignatureHelpTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The reason why code actions were requested.
/// @since 3.17.0
enum CodeActionTriggerKind {
  invokedValue(1),
  automaticValue(2);

  // The list of all values in this enumeration.
  const CodeActionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// A pattern kind describing if a glob pattern matches a file a folder or both.
/// @since 3.16.0
enum FileOperationPatternKind {
  fileValue('file'),
  folderValue('folder');

  // The list of all values in this enumeration.
  const FileOperationPatternKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// A notebook cell kind.
/// @since 3.17.0
enum NotebookCellKind {
  markupValue(1),
  codeValue(2);

  // The list of all values in this enumeration.
  const NotebookCellKind(this.value);

  // The type of this enumeration.
  final int value;
}

enum ResourceOperationKind {
  createValue('create'),
  renameValue('rename'),
  deleteValue('delete');

  // The list of all values in this enumeration.
  const ResourceOperationKind(this.value);

  // The type of this enumeration.
  final String value;
}

enum FailureHandlingKind {
  abortValue('abort'),
  transactionalValue('transactional'),
  textOnlyTransactionalValue('textOnlyTransactional'),
  undoValue('undo');

  // The list of all values in this enumeration.
  const FailureHandlingKind(this.value);

  // The type of this enumeration.
  final String value;
}

enum PrepareSupportDefaultBehavior {
  identifierValue(1);

  // The list of all values in this enumeration.
  const PrepareSupportDefaultBehavior(this.value);

  // The type of this enumeration.
  final int value;
}

enum TokenFormat {
  relativeValue('relative');

  // The list of all values in this enumeration.
  const TokenFormat(this.value);

  // The type of this enumeration.
  final String value;
}

/// This class contains methods for handling requests.
enum RequestMethod {
  /// Method: textDocument/implementation
  ///
  /// A request to resolve the implementation locations of a symbol at a given
  /// text document position. The request's parameter is of type {@link
  /// TextDocumentPositionParams} the response is of type {@link Definition} or a
  /// Thenable that resolves to such.
  textDocumentImplementation('textDocument/implementation'),

  /// Method: textDocument/typeDefinition
  ///
  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type {@link
  /// TextDocumentPositionParams} the response is of type {@link Definition} or a
  /// Thenable that resolves to such.
  textDocumentTypeDefinition('textDocument/typeDefinition'),

  /// Method: workspace/workspaceFolders
  ///
  /// The `workspace/workspaceFolders` is sent from the server to the client to
  /// fetch the open workspace folders.
  workspaceWorkspaceFolders('workspace/workspaceFolders'),

  /// Method: workspace/configuration
  ///
  /// The 'workspace/configuration' request is sent from the server to the client
  /// to fetch a certain configuration setting.
  /// This pull model replaces the old push model where the client signaled
  /// configuration change via an event. If the server still needs to react to
  /// configuration changes (since the server caches the result of
  /// `workspace/configuration` requests) the server should register for an empty
  /// configuration change event and empty the cache if such an event is
  /// received.
  workspaceConfiguration('workspace/configuration'),

  /// Method: textDocument/documentColor
  ///
  /// A request to list all color symbols found in a given text document. The
  /// request's parameter is of type {@link DocumentColorParams} the response is
  /// of type {@link ColorInformation ColorInformation[]} or a Thenable that
  /// resolves to such.
  textDocumentDocumentColor('textDocument/documentColor'),

  /// Method: textDocument/colorPresentation
  ///
  /// A request to list all presentation for a color. The request's parameter is
  /// of type {@link ColorPresentationParams} the response is of type {@link
  /// ColorInformation ColorInformation[]} or a Thenable that resolves to such.
  textDocumentColorPresentation('textDocument/colorPresentation'),

  /// Method: textDocument/foldingRange
  ///
  /// A request to provide folding ranges in a document. The request's parameter
  /// is of type {@link FoldingRangeParams}, the response is of type {@link
  /// FoldingRangeList} or a Thenable that resolves to such.
  textDocumentFoldingRange('textDocument/foldingRange'),

  /// Method: workspace/foldingRange/refresh
  ///
  /// @since 3.18.0 @proposed
  workspaceFoldingRangeRefresh('workspace/foldingRange/refresh'),

  /// Method: textDocument/declaration
  ///
  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type {@link
  /// TextDocumentPositionParams} the response is of type {@link Declaration} or
  /// a typed array of {@link DeclarationLink} or a Thenable that resolves to
  /// such.
  textDocumentDeclaration('textDocument/declaration'),

  /// Method: textDocument/selectionRange
  ///
  /// A request to provide selection ranges in a document. The request's
  /// parameter is of type {@link SelectionRangeParams}, the response is of type
  /// {@link SelectionRange SelectionRange[]} or a Thenable that resolves to
  /// such.
  textDocumentSelectionRange('textDocument/selectionRange'),

  /// Method: window/workDoneProgress/create
  ///
  /// The `window/workDoneProgress/create` request is sent from the server to the
  /// client to initiate progress reporting from the server.
  windowWorkDoneProgressCreate('window/workDoneProgress/create'),

  /// Method: textDocument/prepareCallHierarchy
  ///
  /// A request to result a `CallHierarchyItem` in a document at a given
  /// position. Can be used as an input to an incoming or outgoing call
  /// hierarchy.
  /// @since 3.16.0
  textDocumentPrepareCallHierarchy('textDocument/prepareCallHierarchy'),

  /// Method: callHierarchy/incomingCalls
  ///
  /// A request to resolve the incoming calls for a given `CallHierarchyItem`.
  /// @since 3.16.0
  callHierarchyIncomingCalls('callHierarchy/incomingCalls'),

  /// Method: callHierarchy/outgoingCalls
  ///
  /// A request to resolve the outgoing calls for a given `CallHierarchyItem`.
  /// @since 3.16.0
  callHierarchyOutgoingCalls('callHierarchy/outgoingCalls'),

  /// Method: textDocument/semanticTokens/full
  ///
  /// @since 3.16.0
  textDocumentSemanticTokensFull('textDocument/semanticTokens/full'),

  /// Method: textDocument/semanticTokens/full/delta
  ///
  /// @since 3.16.0
  textDocumentSemanticTokensFullDelta('textDocument/semanticTokens/full/delta'),

  /// Method: textDocument/semanticTokens/range
  ///
  /// @since 3.16.0
  textDocumentSemanticTokensRange('textDocument/semanticTokens/range'),

  /// Method: workspace/semanticTokens/refresh
  ///
  /// @since 3.16.0
  workspaceSemanticTokensRefresh('workspace/semanticTokens/refresh'),

  /// Method: window/showDocument
  ///
  /// A request to show a document. This request might open an external program
  /// depending on the value of the URI to open. For example a request to open
  /// `https://code.visualstudio.com/` will very likely open the URI in a WEB
  /// browser.
  /// @since 3.16.0
  windowShowDocument('window/showDocument'),

  /// Method: textDocument/linkedEditingRange
  ///
  /// A request to provide ranges that can be edited together.
  /// @since 3.16.0
  textDocumentLinkedEditingRange('textDocument/linkedEditingRange'),

  /// Method: workspace/willCreateFiles
  ///
  /// The will create files request is sent from the client to the server before
  /// files are actually created as long as the creation is triggered from within
  /// the client.
  /// The request can return a `WorkspaceEdit` which will be applied to workspace
  /// before the files are created. Hence the `WorkspaceEdit` can not manipulate
  /// the content of the file to be created.
  /// @since 3.16.0
  workspaceWillCreateFiles('workspace/willCreateFiles'),

  /// Method: workspace/willRenameFiles
  ///
  /// The will rename files request is sent from the client to the server before
  /// files are actually renamed as long as the rename is triggered from within
  /// the client.
  /// @since 3.16.0
  workspaceWillRenameFiles('workspace/willRenameFiles'),

  /// Method: workspace/willDeleteFiles
  ///
  /// The did delete files notification is sent from the client to the server
  /// when files were deleted from within the client.
  /// @since 3.16.0
  workspaceWillDeleteFiles('workspace/willDeleteFiles'),

  /// Method: textDocument/moniker
  ///
  /// A request to get the moniker of a symbol at a given text document position.
  /// The request parameter is of type {@link TextDocumentPositionParams}. The
  /// response is of type {@link Moniker Moniker[]} or `null`.
  textDocumentMoniker('textDocument/moniker'),

  /// Method: textDocument/prepareTypeHierarchy
  ///
  /// A request to result a `TypeHierarchyItem` in a document at a given
  /// position. Can be used as an input to a subtypes or supertypes type
  /// hierarchy.
  /// @since 3.17.0
  textDocumentPrepareTypeHierarchy('textDocument/prepareTypeHierarchy'),

  /// Method: typeHierarchy/supertypes
  ///
  /// A request to resolve the supertypes for a given `TypeHierarchyItem`.
  /// @since 3.17.0
  typeHierarchySupertypes('typeHierarchy/supertypes'),

  /// Method: typeHierarchy/subtypes
  ///
  /// A request to resolve the subtypes for a given `TypeHierarchyItem`.
  /// @since 3.17.0
  typeHierarchySubtypes('typeHierarchy/subtypes'),

  /// Method: textDocument/inlineValue
  ///
  /// A request to provide inline values in a document. The request's parameter
  /// is of type {@link InlineValueParams}, the response is of type {@link
  /// InlineValue InlineValue[]} or a Thenable that resolves to such.
  /// @since 3.17.0
  textDocumentInlineValue('textDocument/inlineValue'),

  /// Method: workspace/inlineValue/refresh
  ///
  /// @since 3.17.0
  workspaceInlineValueRefresh('workspace/inlineValue/refresh'),

  /// Method: textDocument/inlayHint
  ///
  /// A request to provide inlay hints in a document. The request's parameter is
  /// of type {@link InlayHintsParams}, the response is of type {@link InlayHint
  /// InlayHint[]} or a Thenable that resolves to such.
  /// @since 3.17.0
  textDocumentInlayHint('textDocument/inlayHint'),

  /// Method: inlayHint/resolve
  ///
  /// A request to resolve additional properties for an inlay hint. The request's
  /// parameter is of type {@link InlayHint}, the response is of type {@link
  /// InlayHint} or a Thenable that resolves to such.
  /// @since 3.17.0
  inlayHintResolve('inlayHint/resolve'),

  /// Method: workspace/inlayHint/refresh
  ///
  /// @since 3.17.0
  workspaceInlayHintRefresh('workspace/inlayHint/refresh'),

  /// Method: textDocument/diagnostic
  ///
  /// The document diagnostic request definition.
  /// @since 3.17.0
  textDocumentDiagnostic('textDocument/diagnostic'),

  /// Method: workspace/diagnostic
  ///
  /// The workspace diagnostic request definition.
  /// @since 3.17.0
  workspaceDiagnostic('workspace/diagnostic'),

  /// Method: workspace/diagnostic/refresh
  ///
  /// The diagnostic refresh request definition.
  /// @since 3.17.0
  workspaceDiagnosticRefresh('workspace/diagnostic/refresh'),

  /// Method: textDocument/inlineCompletion
  ///
  /// A request to provide inline completions in a document. The request's
  /// parameter is of type {@link InlineCompletionParams}, the response is of
  /// type {@link InlineCompletion InlineCompletion[]} or a Thenable that
  /// resolves to such.
  /// @since 3.18.0 @proposed
  textDocumentInlineCompletion('textDocument/inlineCompletion'),

  /// Method: client/registerCapability
  ///
  /// The `client/registerCapability` request is sent from the server to the
  /// client to register a new capability handler on the client side.
  clientRegisterCapability('client/registerCapability'),

  /// Method: client/unregisterCapability
  ///
  /// The `client/unregisterCapability` request is sent from the server to the
  /// client to unregister a previously registered capability handler on the
  /// client side.
  clientUnregisterCapability('client/unregisterCapability'),

  /// Method: initialize
  ///
  /// The initialize request is sent from the client to the server. It is sent
  /// once as the request after starting up the server. The requests parameter is
  /// of type {@link InitializeParams} the response if of type {@link
  /// InitializeResult} of a Thenable that resolves to such.
  initialize('initialize'),

  /// Method: shutdown
  ///
  /// A shutdown request is sent from the client to the server. It is sent once
  /// when the client decides to shutdown the server. The only notification that
  /// is sent after a shutdown request is the exit event.
  shutdown('shutdown'),

  /// Method: window/showMessageRequest
  ///
  /// The show message request is sent from the server to the client to show a
  /// message and a set of options actions to the user.
  windowShowMessageRequest('window/showMessageRequest'),

  /// Method: textDocument/willSaveWaitUntil
  ///
  /// A document will save request is sent from the client to the server before
  /// the document is actually saved. The request can return an array of
  /// TextEdits which will be applied to the text document before it is saved.
  /// Please note that clients might drop results if computing the text edits
  /// took too long or if a server constantly fails on this request. This is done
  /// to keep the save fast and reliable.
  textDocumentWillSaveWaitUntil('textDocument/willSaveWaitUntil'),

  /// Method: textDocument/completion
  ///
  /// Request to request completion at a given text document position. The
  /// request's parameter is of type {@link TextDocumentPosition} the response is
  /// of type {@link CompletionItem CompletionItem[]} or {@link CompletionList}
  /// or a Thenable that resolves to such.
  /// The request can delay the computation of the {@link CompletionItem.detail
  /// `detail`} and {@link CompletionItem.documentation `documentation`}
  /// properties to the `completionItem/resolve` request. However, properties
  /// that are needed for the initial sorting and filtering, like `sortText`,
  /// `filterText`, `insertText`, and `textEdit`, must not be changed during
  /// resolve.
  textDocumentCompletion('textDocument/completion'),

  /// Method: completionItem/resolve
  ///
  /// Request to resolve additional information for a given completion item.The
  /// request's parameter is of type {@link CompletionItem} the response is of
  /// type {@link CompletionItem} or a Thenable that resolves to such.
  completionItemResolve('completionItem/resolve'),

  /// Method: textDocument/hover
  ///
  /// Request to request hover information at a given text document position. The
  /// request's parameter is of type {@link TextDocumentPosition} the response is
  /// of type {@link Hover} or a Thenable that resolves to such.
  textDocumentHover('textDocument/hover'),

  /// Method: textDocument/signatureHelp
  ///
  textDocumentSignatureHelp('textDocument/signatureHelp'),

  /// Method: textDocument/definition
  ///
  /// A request to resolve the definition location of a symbol at a given text
  /// document position. The request's parameter is of type {@link
  /// TextDocumentPosition} the response is of either type {@link Definition} or
  /// a typed array of {@link DefinitionLink} or a Thenable that resolves to
  /// such.
  textDocumentDefinition('textDocument/definition'),

  /// Method: textDocument/references
  ///
  /// A request to resolve project-wide references for the symbol denoted by the
  /// given text document position. The request's parameter is of type {@link
  /// ReferenceParams} the response is of type {@link Location Location[]} or a
  /// Thenable that resolves to such.
  textDocumentReferences('textDocument/references'),

  /// Method: textDocument/documentHighlight
  ///
  /// Request to resolve a {@link DocumentHighlight} for a given text document
  /// position. The request's parameter is of type {@link TextDocumentPosition}
  /// the request response is an array of type {@link DocumentHighlight} or a
  /// Thenable that resolves to such.
  textDocumentDocumentHighlight('textDocument/documentHighlight'),

  /// Method: textDocument/documentSymbol
  ///
  /// A request to list all symbols found in a given text document. The request's
  /// parameter is of type {@link TextDocumentIdentifier} the response is of type
  /// {@link SymbolInformation SymbolInformation[]} or a Thenable that resolves
  /// to such.
  textDocumentDocumentSymbol('textDocument/documentSymbol'),

  /// Method: textDocument/codeAction
  ///
  /// A request to provide commands for the given text document and range.
  textDocumentCodeAction('textDocument/codeAction'),

  /// Method: codeAction/resolve
  ///
  /// Request to resolve additional information for a given code action.The
  /// request's parameter is of type {@link CodeAction} the response is of type
  /// {@link CodeAction} or a Thenable that resolves to such.
  codeActionResolve('codeAction/resolve'),

  /// Method: workspace/symbol
  ///
  /// A request to list project-wide symbols matching the query string given by
  /// the {@link WorkspaceSymbolParams}. The response is of type {@link
  /// SymbolInformation SymbolInformation[]} or a Thenable that resolves to such.
  /// @since 3.17.0 - support for WorkspaceSymbol in the returned data. Clients
  /// need to advertise support for WorkspaceSymbols via the client capability
  /// `workspace.symbol.resolveSupport`.
  workspaceSymbol('workspace/symbol'),

  /// Method: workspaceSymbol/resolve
  ///
  /// A request to resolve the range inside the workspace symbol's location.
  /// @since 3.17.0
  workspaceSymbolResolve('workspaceSymbol/resolve'),

  /// Method: textDocument/codeLens
  ///
  /// A request to provide code lens for the given text document.
  textDocumentCodeLens('textDocument/codeLens'),

  /// Method: codeLens/resolve
  ///
  /// A request to resolve a command for a given code lens.
  codeLensResolve('codeLens/resolve'),

  /// Method: workspace/codeLens/refresh
  ///
  /// A request to refresh all code actions
  /// @since 3.16.0
  workspaceCodeLensRefresh('workspace/codeLens/refresh'),

  /// Method: textDocument/documentLink
  ///
  /// A request to provide document links
  textDocumentDocumentLink('textDocument/documentLink'),

  /// Method: documentLink/resolve
  ///
  /// Request to resolve additional information for a given document link. The
  /// request's parameter is of type {@link DocumentLink} the response is of type
  /// {@link DocumentLink} or a Thenable that resolves to such.
  documentLinkResolve('documentLink/resolve'),

  /// Method: textDocument/formatting
  ///
  /// A request to format a whole document.
  textDocumentFormatting('textDocument/formatting'),

  /// Method: textDocument/rangeFormatting
  ///
  /// A request to format a range in a document.
  textDocumentRangeFormatting('textDocument/rangeFormatting'),

  /// Method: textDocument/rangesFormatting
  ///
  /// A request to format ranges in a document.
  /// @since 3.18.0 @proposed
  textDocumentRangesFormatting('textDocument/rangesFormatting'),

  /// Method: textDocument/onTypeFormatting
  ///
  /// A request to format a document on type.
  textDocumentOnTypeFormatting('textDocument/onTypeFormatting'),

  /// Method: textDocument/rename
  ///
  /// A request to rename a symbol.
  textDocumentRename('textDocument/rename'),

  /// Method: textDocument/prepareRename
  ///
  /// A request to test and perform the setup necessary for a rename.
  /// @since 3.16 - support for default behavior
  textDocumentPrepareRename('textDocument/prepareRename'),

  /// Method: workspace/executeCommand
  ///
  /// A request send from the client to the server to execute a command. The
  /// request might return a workspace edit which the client will apply to the
  /// workspace.
  workspaceExecuteCommand('workspace/executeCommand'),

  /// Method: workspace/applyEdit
  ///
  /// A request sent from the server to the client to modified certain resources.
  workspaceApplyEdit('workspace/applyEdit');

  // The list of all methods in this enumeration.
  const RequestMethod(this.value);

  // The type of this enumeration.
  final String value;
}

/// This class contains methods for handling notifications.
enum NotificationMethod {
  /// Method: workspace/didChangeWorkspaceFolders
  ///
  /// The `workspace/didChangeWorkspaceFolders` notification is sent from the
  /// client to the server when the workspace folder configuration changes.
  workspaceDidChangeWorkspaceFolders('workspace/didChangeWorkspaceFolders'),

  /// Method: window/workDoneProgress/cancel
  ///
  /// The `window/workDoneProgress/cancel` notification is sent from the client
  /// to the server to cancel a progress initiated on the server side.
  windowWorkDoneProgressCancel('window/workDoneProgress/cancel'),

  /// Method: workspace/didCreateFiles
  ///
  /// The did create files notification is sent from the client to the server
  /// when files were created from within the client.
  /// @since 3.16.0
  workspaceDidCreateFiles('workspace/didCreateFiles'),

  /// Method: workspace/didRenameFiles
  ///
  /// The did rename files notification is sent from the client to the server
  /// when files were renamed from within the client.
  /// @since 3.16.0
  workspaceDidRenameFiles('workspace/didRenameFiles'),

  /// Method: workspace/didDeleteFiles
  ///
  /// The will delete files request is sent from the client to the server before
  /// files are actually deleted as long as the deletion is triggered from within
  /// the client.
  /// @since 3.16.0
  workspaceDidDeleteFiles('workspace/didDeleteFiles'),

  /// Method: notebookDocument/didOpen
  ///
  /// A notification sent when a notebook opens.
  /// @since 3.17.0
  notebookDocumentDidOpen('notebookDocument/didOpen'),

  /// Method: notebookDocument/didChange
  ///
  notebookDocumentDidChange('notebookDocument/didChange'),

  /// Method: notebookDocument/didSave
  ///
  /// A notification sent when a notebook document is saved.
  /// @since 3.17.0
  notebookDocumentDidSave('notebookDocument/didSave'),

  /// Method: notebookDocument/didClose
  ///
  /// A notification sent when a notebook closes.
  /// @since 3.17.0
  notebookDocumentDidClose('notebookDocument/didClose'),

  /// Method: initialized
  ///
  /// The initialized notification is sent from the client to the server after
  /// the client is fully initialized and the server is allowed to send requests
  /// from the server to the client.
  initialized('initialized'),

  /// Method: exit
  ///
  /// The exit event is sent from the client to the server to ask the server to
  /// exit its process.
  exit('exit'),

  /// Method: workspace/didChangeConfiguration
  ///
  /// The configuration change notification is sent from the client to the server
  /// when the client's configuration has changed. The notification contains the
  /// changed configuration as defined by the language client.
  workspaceDidChangeConfiguration('workspace/didChangeConfiguration'),

  /// Method: window/showMessage
  ///
  /// The show message notification is sent from a server to a client to ask the
  /// client to display a particular message in the user interface.
  windowShowMessage('window/showMessage'),

  /// Method: window/logMessage
  ///
  /// The log message notification is sent from the server to the client to ask
  /// the client to log a particular message.
  windowLogMessage('window/logMessage'),

  /// Method: telemetry/event
  ///
  /// The telemetry event notification is sent from the server to the client to
  /// ask the client to log telemetry data.
  telemetryEvent('telemetry/event'),

  /// Method: textDocument/didOpen
  ///
  /// The document open notification is sent from the client to the server to
  /// signal newly opened text documents. The document's truth is now managed by
  /// the client and the server must not try to read the document's truth using
  /// the document's uri. Open in this sense means it is managed by the client.
  /// It doesn't necessarily mean that its content is presented in an editor. An
  /// open notification must not be sent more than once without a corresponding
  /// close notification send before. This means open and close notification must
  /// be balanced and the max open count is one.
  textDocumentDidOpen('textDocument/didOpen'),

  /// Method: textDocument/didChange
  ///
  /// The document change notification is sent from the client to the server to
  /// signal changes to a text document.
  textDocumentDidChange('textDocument/didChange'),

  /// Method: textDocument/didClose
  ///
  /// The document close notification is sent from the client to the server when
  /// the document got closed in the client. The document's truth now exists
  /// where the document's uri points to (e.g. if the document's uri is a file
  /// uri the truth now exists on disk). As with the open notification the close
  /// notification is about managing the document's content. Receiving a close
  /// notification doesn't mean that the document was open in an editor before. A
  /// close notification requires a previous open notification to be sent.
  textDocumentDidClose('textDocument/didClose'),

  /// Method: textDocument/didSave
  ///
  /// The document save notification is sent from the client to the server when
  /// the document got saved in the client.
  textDocumentDidSave('textDocument/didSave'),

  /// Method: textDocument/willSave
  ///
  /// A document will save notification is sent from the client to the server
  /// before the document is actually saved.
  textDocumentWillSave('textDocument/willSave'),

  /// Method: workspace/didChangeWatchedFiles
  ///
  /// The watched files notification is sent from the client to the server when
  /// the client detects changes to file watched by the language client.
  workspaceDidChangeWatchedFiles('workspace/didChangeWatchedFiles'),

  /// Method: textDocument/publishDiagnostics
  ///
  /// Diagnostics notification are sent from the server to the client to signal
  /// results of validation runs.
  textDocumentPublishDiagnostics('textDocument/publishDiagnostics'),

  /// Method: $/setTrace
  ///
  setTrace(r'$/setTrace'),

  /// Method: $/logTrace
  ///
  logTrace(r'$/logTrace'),

  /// Method: $/cancelRequest
  ///
  cancelRequest(r'$/cancelRequest'),

  /// Method: $/progress
  ///
  progress(r'$/progress');

  // The list of all methods in this enumeration.
  const NotificationMethod(this.value);

  // The type of this enumeration.
  final String value;
}
