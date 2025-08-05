/// Do not edit it manually.

// ignore_for_file: doc_directive_unknown
library; // Freezed header not implemented for generation

import 'package:freezed_annotation/freezed_annotation.dart';
part 'protocol.freezed.dart';
part 'protocol.g.dart';

const String kLSPVersion = '3.17.0';
typedef Literal1 = ({Range range, String placeholder});
typedef Literal2 = ({bool defaultBehavior});
typedef Literal3 = ({Range range, int? rangeLength, String text});
typedef Literal4 = ({String text});
typedef Literal5 = ({String language, String value});
typedef Literal6 = ({String language, String? scheme, String? pattern});
typedef Literal7 = ({String notebookType, String? scheme, String? pattern});
typedef Literal8 = ({String name, String? version});
typedef Literal9 = ({
  List<String>? commitCharacters,
  Object? editRange,
  InsertTextFormat? insertTextFormat,
  InsertTextMode? insertTextMode,
  LSPAny? data,
});
typedef Literal10 = ({String reason});
typedef Literal11 = ({
  NotebookCellArrayChange array,
  List<TextDocumentItem>? didOpen,
  List<TextDocumentIdentifier>? didClose,
});
typedef Literal112 = ({
  VersionedTextDocumentIdentifier document,
  List<TextDocumentContentChangeEvent> changes,
});
typedef Literal12 = ({
  Literal11? structure,
  List<NotebookCell>? data,
  List<Literal112>? textContent,
});
typedef Literal13 = ({
  WorkspaceFoldersServerCapabilities? workspaceFolders,
  FileOperationOptions? fileOperations,
});
typedef Literal14 = ({bool? labelDetailsSupport});
typedef Literal15 = ({bool cancel, List<String> retryOnContentModified});
typedef Literal16 = ({bool? groupsOnLabel});
typedef Literal17 = ({List<SymbolKind>? valueSet});
typedef Literal18 = ({List<SymbolTag> valueSet});
typedef Literal19 = ({List<String> properties});
typedef Literal20 = ({List<CompletionItemTag> valueSet});
typedef Literal21 = ({List<InsertTextMode> valueSet});
typedef Literal22 = ({
  bool? snippetSupport,
  bool? commitCharactersSupport,
  List<MarkupKind>? documentationFormat,
  bool? deprecatedSupport,
  bool? preselectSupport,
  Literal20? tagSupport,
  bool? insertReplaceSupport,
  Literal19? resolveSupport,
  Literal21? insertTextModeSupport,
  bool? labelDetailsSupport,
});
typedef Literal23 = ({List<CompletionItemKind>? valueSet});
typedef Literal24 = ({List<String>? itemDefaults});
typedef Literal25 = ({bool? labelOffsetSupport});
typedef Literal26 = ({
  List<MarkupKind>? documentationFormat,
  Literal25? parameterInformation,
  bool? activeParameterSupport,
});
typedef Literal27 = ({List<CodeActionKind> valueSet});
typedef Literal28 = ({Literal27 codeActionKind});
typedef Literal29 = ({List<FoldingRangeKind>? valueSet});
typedef Literal30 = ({bool? collapsedText});
typedef Literal31 = ({List<DiagnosticTag> valueSet});
typedef ObjectFullObjectRange = ({Object? range, Object? full});
typedef Literal33 = ({bool? additionalPropertiesSupport});

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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
@Freezed()
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
  const factory ImplementationParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _ImplementationParams;

  factory ImplementationParams.fromJson(Map<String, dynamic> json) =>
      _$ImplementationParamsFromJson(json);
}

/// Represents a location inside a resource, such as a line inside a
/// text file.
@freezed
abstract class Location with _$Location {
  const factory Location({required String uri, required Range range}) =
      _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
abstract class ImplementationRegistrationOptions
    with _$ImplementationRegistrationOptions {
  const factory ImplementationRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _ImplementationRegistrationOptions;

  factory ImplementationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionParams with _$TypeDefinitionParams {
  const factory TypeDefinitionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _TypeDefinitionParams;

  factory TypeDefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionParamsFromJson(json);
}

@freezed
abstract class TypeDefinitionRegistrationOptions
    with _$TypeDefinitionRegistrationOptions {
  const factory TypeDefinitionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _TypeDefinitionRegistrationOptions;

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionRegistrationOptionsFromJson(json);
}

/// A workspace folder inside a client.
@freezed
abstract class WorkspaceFolder with _$WorkspaceFolder {
  const factory WorkspaceFolder({
    /// The associated URI for this workspace folder.
    required String uri,

    /// The name of the workspace folder. Used to refer to this workspace
    /// folder in the user interface.
    required String name,
  }) = _WorkspaceFolder;

  factory WorkspaceFolder.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFolderFromJson(json);
}

/// The parameters of a `workspace/didChangeWorkspaceFolders`
/// notification.
@freezed
abstract class DidChangeWorkspaceFoldersParams
    with _$DidChangeWorkspaceFoldersParams {
  const factory DidChangeWorkspaceFoldersParams({
    /// The actual workspace folder change event.
    required WorkspaceFoldersChangeEvent event,
  }) = _DidChangeWorkspaceFoldersParams;

  factory DidChangeWorkspaceFoldersParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWorkspaceFoldersParamsFromJson(json);
}

/// The parameters of a configuration request.
@freezed
abstract class ConfigurationParams with _$ConfigurationParams {
  const factory ConfigurationParams({required List<ConfigurationItem> items}) =
      _ConfigurationParams;

  factory ConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationParamsFromJson(json);
}

/// Parameters for a {@link DocumentColorRequest}.
@freezed
abstract class DocumentColorParams with _$DocumentColorParams {
  const factory DocumentColorParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentColorParams;

  factory DocumentColorParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorParamsFromJson(json);
}

/// Represents a color range from a document.
@freezed
abstract class ColorInformation with _$ColorInformation {
  const factory ColorInformation({
    /// The range in the document where this color appears.
    required Range range,

    /// The actual color value for this color range.
    required Color color,
  }) = _ColorInformation;

  factory ColorInformation.fromJson(Map<String, dynamic> json) =>
      _$ColorInformationFromJson(json);
}

@freezed
abstract class DocumentColorRegistrationOptions
    with _$DocumentColorRegistrationOptions {
  const factory DocumentColorRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _DocumentColorRegistrationOptions;

  factory DocumentColorRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentColorRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link ColorPresentationRequest}.
@freezed
abstract class ColorPresentationParams with _$ColorPresentationParams {
  const factory ColorPresentationParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The color to request presentations for.
    required Color color,

    /// The range where the color would be inserted. Serves as a context.
    required Range range,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _ColorPresentationParams;

  factory ColorPresentationParams.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationParamsFromJson(json);
}

@freezed
abstract class ColorPresentation with _$ColorPresentation {
  const factory ColorPresentation({
    /// The label of this color presentation. It will be shown on the color
    /// picker header. By default this is also the text that is inserted when
    /// selecting this color presentation.
    required String label,

    /// An optional array of additional {@link TextEdit text edits} that are
    /// applied when selecting this color presentation. Edits must not overlap
    /// with the main {@link ColorPresentation.textEdit edit} nor with
    /// themselves.
    List<TextEdit>? additionalTextEdits,

    /// An {@link TextEdit edit} which is applied to a document when selecting
    /// this presentation for the color. When `falsy` the {@link
    /// ColorPresentation.label label} is used.
    TextEdit? textEdit,
  }) = _ColorPresentation;

  factory ColorPresentation.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationFromJson(json);
}

@freezed
abstract class WorkDoneProgressOptions with _$WorkDoneProgressOptions {
  const factory WorkDoneProgressOptions({bool? workDoneProgress}) =
      _WorkDoneProgressOptions;

  factory WorkDoneProgressOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressOptionsFromJson(json);
}

/// General text document registration options.
@freezed
abstract class TextDocumentRegistrationOptions
    with _$TextDocumentRegistrationOptions {
  const factory TextDocumentRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
  }) = _TextDocumentRegistrationOptions;

  factory TextDocumentRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link FoldingRangeRequest}.
@freezed
abstract class FoldingRangeParams with _$FoldingRangeParams {
  const factory FoldingRangeParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _FoldingRangeParams;

  factory FoldingRangeParams.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeParamsFromJson(json);
}

/// Represents a folding range. To be valid, start and end line must
/// be bigger than zero and smaller than the number of lines in the
/// document. Clients are free to ignore invalid ranges.
@freezed
abstract class FoldingRange with _$FoldingRange {
  const factory FoldingRange({
    /// The zero-based start line of the range to fold. The folded area starts
    /// after the line's last character. To be valid, the end must be zero or
    /// larger and smaller than the number of lines in the document.
    required int startLine,

    /// The zero-based end line of the range to fold. The folded area ends with
    /// the line's last character. To be valid, the end must be zero or larger
    /// and smaller than the number of lines in the document.
    required int endLine,

    /// The text that the client should show when the specified range is
    /// collapsed. If not defined or not supported by the client, a default
    /// will be chosen by the client.
    /// @since 3.17.0
    String? collapsedText,

    /// Describes the kind of the folding range such as `comment' or 'region'.
    /// The kind is used to categorize folding ranges and used by commands like
    /// 'Fold all comments'. See {@link FoldingRangeKind} for an enumeration of
    /// standardized kinds.
    FoldingRangeKind? kind,

    /// The zero-based character offset before the folded range ends. If not
    /// defined, defaults to the length of the end line.
    int? endCharacter,

    /// The zero-based character offset from where the folded range starts. If
    /// not defined, defaults to the length of the start line.
    int? startCharacter,
  }) = _FoldingRange;

  factory FoldingRange.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeFromJson(json);
}

@freezed
abstract class FoldingRangeRegistrationOptions
    with _$FoldingRangeRegistrationOptions {
  const factory FoldingRangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _FoldingRangeRegistrationOptions;

  factory FoldingRangeRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class DeclarationParams with _$DeclarationParams {
  const factory DeclarationParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DeclarationParams;

  factory DeclarationParams.fromJson(Map<String, dynamic> json) =>
      _$DeclarationParamsFromJson(json);
}

@freezed
abstract class DeclarationRegistrationOptions
    with _$DeclarationRegistrationOptions {
  const factory DeclarationRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _DeclarationRegistrationOptions;

  factory DeclarationRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationRegistrationOptionsFromJson(json);
}

/// A parameter literal used in selection range requests.
@freezed
abstract class SelectionRangeParams with _$SelectionRangeParams {
  const factory SelectionRangeParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The positions inside the text document.
    required List<Position> positions,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _SelectionRangeParams;

  factory SelectionRangeParams.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeParamsFromJson(json);
}

/// A selection range represents a part of a selection hierarchy. A
/// selection range may have a parent selection range that contains
/// it.
@freezed
abstract class SelectionRange with _$SelectionRange {
  const factory SelectionRange({
    /// The {@link Range range} of this selection range.
    required Range range,

    /// The parent selection range containing this range. Therefore
    /// `parent.range` must contain `this.range`.
    SelectionRange? parent,
  }) = _SelectionRange;

  factory SelectionRange.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeFromJson(json);
}

@freezed
abstract class SelectionRangeRegistrationOptions
    with _$SelectionRangeRegistrationOptions {
  const factory SelectionRangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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
  const factory WorkDoneProgressCreateParams({
    /// The token to be used to report progress.
    required ProgressToken token,
  }) = _WorkDoneProgressCreateParams;

  factory WorkDoneProgressCreateParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCreateParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressCancelParams
    with _$WorkDoneProgressCancelParams {
  const factory WorkDoneProgressCancelParams({
    /// The token to be used to report progress.
    required ProgressToken token,
  }) = _WorkDoneProgressCancelParams;

  factory WorkDoneProgressCancelParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCancelParamsFromJson(json);
}

/// The parameter of a `textDocument/prepareCallHierarchy` request.
/// @since 3.16.0
@freezed
abstract class CallHierarchyPrepareParams with _$CallHierarchyPrepareParams {
  const factory CallHierarchyPrepareParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _CallHierarchyPrepareParams;

  factory CallHierarchyPrepareParams.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyPrepareParamsFromJson(json);
}

/// Represents programming constructs like functions or constructors
/// in the context of call hierarchy.
/// @since 3.16.0
@freezed
abstract class CallHierarchyItem with _$CallHierarchyItem {
  const factory CallHierarchyItem({
    /// The name of this item.
    required String name,

    /// The kind of this item.
    required SymbolKind kind,

    /// The resource identifier of this item.
    required String uri,

    /// The range enclosing this symbol not including leading/trailing
    /// whitespace but everything else, e.g. comments and code.
    required Range range,

    /// The range that should be selected and revealed when this symbol is
    /// being picked, e.g. the name of a function. Must be contained by the
    /// {@link CallHierarchyItem.range `range`}.
    required Range selectionRange,

    /// A data entry field that is preserved between a call hierarchy prepare
    /// and incoming calls or outgoing calls requests.
    LSPAny? data,

    /// More detail for this item, e.g. the signature of a function.
    String? detail,

    /// Tags for this item.
    List<SymbolTag>? tags,
  }) = _CallHierarchyItem;

  factory CallHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyItemFromJson(json);
}

/// Call hierarchy options used during static or dynamic registration.
/// @since 3.16.0
@freezed
abstract class CallHierarchyRegistrationOptions
    with _$CallHierarchyRegistrationOptions {
  const factory CallHierarchyRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _CallHierarchyRegistrationOptions;

  factory CallHierarchyRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyRegistrationOptionsFromJson(json);
}

/// The parameter of a `callHierarchy/incomingCalls` request.
/// @since 3.16.0
@freezed
abstract class CallHierarchyIncomingCallsParams
    with _$CallHierarchyIncomingCallsParams {
  const factory CallHierarchyIncomingCallsParams({
    required CallHierarchyItem item,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _CallHierarchyIncomingCallsParams;

  factory CallHierarchyIncomingCallsParams.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyIncomingCallsParamsFromJson(json);
}

/// Represents an incoming call, e.g. a caller of a method or
/// constructor.
/// @since 3.16.0
@freezed
abstract class CallHierarchyIncomingCall with _$CallHierarchyIncomingCall {
  const factory CallHierarchyIncomingCall({
    /// The item that makes the call.
    required CallHierarchyItem from,

    /// The ranges at which the calls appear. This is relative to the caller
    /// denoted by {@link CallHierarchyIncomingCall.from `this.from`}.
    required List<Range> fromRanges,
  }) = _CallHierarchyIncomingCall;

  factory CallHierarchyIncomingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyIncomingCallFromJson(json);
}

/// The parameter of a `callHierarchy/outgoingCalls` request.
/// @since 3.16.0
@freezed
abstract class CallHierarchyOutgoingCallsParams
    with _$CallHierarchyOutgoingCallsParams {
  const factory CallHierarchyOutgoingCallsParams({
    required CallHierarchyItem item,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _CallHierarchyOutgoingCallsParams;

  factory CallHierarchyOutgoingCallsParams.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyOutgoingCallsParamsFromJson(json);
}

/// Represents an outgoing call, e.g. calling a getter from a method
/// or a method from a constructor etc.
/// @since 3.16.0
@freezed
abstract class CallHierarchyOutgoingCall with _$CallHierarchyOutgoingCall {
  const factory CallHierarchyOutgoingCall({
    /// The item that is called.
    required CallHierarchyItem to,

    /// The range at which this item is called. This is the range relative to
    /// the caller, e.g the item passed to {@link
    /// CallHierarchyItemProvider.provideCallHierarchyOutgoingCalls
    /// `provideCallHierarchyOutgoingCalls`} and not {@link
    /// CallHierarchyOutgoingCall.to `this.to`}.
    required List<Range> fromRanges,
  }) = _CallHierarchyOutgoingCall;

  factory CallHierarchyOutgoingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOutgoingCallFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensParams with _$SemanticTokensParams {
  const factory SemanticTokensParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _SemanticTokensParams;

  factory SemanticTokensParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensParamsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokens with _$SemanticTokens {
  const factory SemanticTokens({
    /// The actual tokens.
    required List<int> data,

    /// An optional result id. If provided and clients support delta updating
    /// the client will include the result id in the next semantic token
    /// request. A server can then instead of computing all semantic tokens
    /// again simply send a delta.
    String? resultId,
  }) = _SemanticTokens;

  factory SemanticTokens.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensPartialResult with _$SemanticTokensPartialResult {
  const factory SemanticTokensPartialResult({required List<int> data}) =
      _SemanticTokensPartialResult;

  factory SemanticTokensPartialResult.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensPartialResultFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensRegistrationOptions
    with _$SemanticTokensRegistrationOptions {
  const factory SemanticTokensRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The legend used by the server
    required SemanticTokensLegend legend,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,

    /// Server supports providing semantic tokens for a full document.
    SemanticTokensOptionsFullBase? full,

    /// Server supports providing semantic tokens for a specific range of a
    /// document.
    RangeBase? range,
    bool? workDoneProgress,
  }) = _SemanticTokensRegistrationOptions;

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensRegistrationOptionsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDeltaParams with _$SemanticTokensDeltaParams {
  const factory SemanticTokensDeltaParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The result id of a previous response. The result Id can either point to
    /// a full response or a delta response depending on what was received
    /// last.
    required String previousResultId,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _SemanticTokensDeltaParams;

  factory SemanticTokensDeltaParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaParamsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDelta with _$SemanticTokensDelta {
  const factory SemanticTokensDelta({
    /// The semantic token edits to transform a previous result into a new
    /// result.
    required List<SemanticTokensEdit> edits,
    String? resultId,
  }) = _SemanticTokensDelta;

  factory SemanticTokensDelta.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDeltaPartialResult
    with _$SemanticTokensDeltaPartialResult {
  const factory SemanticTokensDeltaPartialResult({
    required List<SemanticTokensEdit> edits,
  }) = _SemanticTokensDeltaPartialResult;

  factory SemanticTokensDeltaPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensDeltaPartialResultFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensRangeParams with _$SemanticTokensRangeParams {
  const factory SemanticTokensRangeParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The range the semantic tokens are requested for.
    required Range range,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _SemanticTokensRangeParams;

  factory SemanticTokensRangeParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensRangeParamsFromJson(json);
}

/// Params to show a resource in the UI.
/// @since 3.16.0
@freezed
abstract class ShowDocumentParams with _$ShowDocumentParams {
  const factory ShowDocumentParams({
    /// The uri to show.
    required String uri,

    /// An optional selection range if the document is a text document. Clients
    /// might ignore the property if an external program is started or the file
    /// is not a text file.
    Range? selection,

    /// An optional property to indicate whether the editor showing the
    /// document should take focus or not. Clients might ignore this property
    /// if an external program is started.
    bool? takeFocus,

    /// Indicates to show the resource in an external program. To show, for
    /// example, `https://code.visualstudio.com/` in the default WEB browser
    /// set `external` to `true`.
    bool? external,
  }) = _ShowDocumentParams;

  factory ShowDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentParamsFromJson(json);
}

/// The result of a showDocument request.
/// @since 3.16.0
@freezed
abstract class ShowDocumentResult with _$ShowDocumentResult {
  const factory ShowDocumentResult({
    /// A boolean indicating if the show was successful.
    required bool success,
  }) = _ShowDocumentResult;

  factory ShowDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentResultFromJson(json);
}

@freezed
abstract class LinkedEditingRangeParams with _$LinkedEditingRangeParams {
  const factory LinkedEditingRangeParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _LinkedEditingRangeParams;

  factory LinkedEditingRangeParams.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeParamsFromJson(json);
}

/// The result of a linked editing range request.
/// @since 3.16.0
@freezed
abstract class LinkedEditingRanges with _$LinkedEditingRanges {
  const factory LinkedEditingRanges({
    /// A list of ranges that can be edited together. The ranges must have
    /// identical length and contain identical text content. The ranges cannot
    /// overlap.
    required List<Range> ranges,

    /// An optional word pattern (regular expression) that describes valid
    /// contents for the given ranges. If no pattern is provided, the client
    /// configuration's word pattern will be used.
    String? wordPattern,
  }) = _LinkedEditingRanges;

  factory LinkedEditingRanges.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangesFromJson(json);
}

@freezed
abstract class LinkedEditingRangeRegistrationOptions
    with _$LinkedEditingRangeRegistrationOptions {
  const factory LinkedEditingRangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _LinkedEditingRangeRegistrationOptions;

  factory LinkedEditingRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeRegistrationOptionsFromJson(json);
}

/// The parameters sent in notifications/requests for user-initiated
/// creation of files.
/// @since 3.16.0
@freezed
abstract class CreateFilesParams with _$CreateFilesParams {
  const factory CreateFilesParams({
    /// An array of all files/folders created in this operation.
    required List<FileCreate> files,
  }) = _CreateFilesParams;

  factory CreateFilesParams.fromJson(Map<String, dynamic> json) =>
      _$CreateFilesParamsFromJson(json);
}

/// A workspace edit represents changes to many resources managed in
/// the workspace. The edit should either provide `changes` or
/// `documentChanges`. If documentChanges are present they are
/// preferred over `changes` if the client can handle versioned
/// document edits.
/// Since version 3.13.0 a workspace edit can contain resource
/// operations as well. If resource operations are present clients
/// need to execute the operations in the order in which they are
/// provided. So a workspace edit for example can consist of the
/// following two changes: (1) a create file a.txt and (2) a text
/// document edit which insert text into file a.txt.
/// An invalid sequence (e.g. (1) delete file a.txt and (2) insert
/// text into file a.txt) will cause failure of the operation. How
/// the client recovers from the failure is described by the client
/// capability: `workspace.workspaceEdit.failureHandling`
@freezed
abstract class WorkspaceEdit with _$WorkspaceEdit {
  const factory WorkspaceEdit({
    /// A map of change annotations that can be referenced in
    /// `AnnotatedTextEdit`s or create, rename and delete file / folder
    /// operations.
    /// Whether clients honor this property depends on the client capability
    /// `workspace.changeAnnotationSupport`.
    /// @since 3.16.0
    Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations,

    /// Depending on the client capability
    /// `workspace.workspaceEdit.resourceOperations` document changes are
    /// either an array of `TextDocumentEdit`s to express changes to n
    /// different text documents where each text document edit addresses a
    /// specific version of a text document. Or it can contain above
    /// `TextDocumentEdit`s mixed with create, rename and delete file / folder
    /// operations.
    /// Whether a client supports versioned document edits is expressed via
    /// `workspace.workspaceEdit.documentChanges` client capability.
    /// If a client neither supports `documentChanges` nor
    /// `workspace.workspaceEdit.resourceOperations` then only plain
    /// `TextEdit`s using the `changes` property are supported.
    List<WorkspaceEditDocumentChangesBase>? documentChanges,

    /// Holds changes to existing resources.
    Map<String, List<TextEdit>>? changes,
  }) = _WorkspaceEdit;

  factory WorkspaceEdit.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditFromJson(json);
}

/// The options to register for file operations.
/// @since 3.16.0
@freezed
abstract class FileOperationRegistrationOptions
    with _$FileOperationRegistrationOptions {
  const factory FileOperationRegistrationOptions({
    /// The actual filters.
    required List<FileOperationFilter> filters,
  }) = _FileOperationRegistrationOptions;

  factory FileOperationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$FileOperationRegistrationOptionsFromJson(json);
}

/// The parameters sent in notifications/requests for user-initiated
/// renames of files.
/// @since 3.16.0
@freezed
abstract class RenameFilesParams with _$RenameFilesParams {
  const factory RenameFilesParams({
    /// An array of all files/folders renamed in this operation. When a folder
    /// is renamed, only the folder will be included, and not its children.
    required List<FileRename> files,
  }) = _RenameFilesParams;

  factory RenameFilesParams.fromJson(Map<String, dynamic> json) =>
      _$RenameFilesParamsFromJson(json);
}

/// The parameters sent in notifications/requests for user-initiated
/// deletes of files.
/// @since 3.16.0
@freezed
abstract class DeleteFilesParams with _$DeleteFilesParams {
  const factory DeleteFilesParams({
    /// An array of all files/folders deleted in this operation.
    required List<FileDelete> files,
  }) = _DeleteFilesParams;

  factory DeleteFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteFilesParamsFromJson(json);
}

@freezed
abstract class MonikerParams with _$MonikerParams {
  const factory MonikerParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _MonikerParams;

  factory MonikerParams.fromJson(Map<String, dynamic> json) =>
      _$MonikerParamsFromJson(json);
}

/// Moniker definition to match LSIF 0.5 moniker definition.
/// @since 3.16.0
@freezed
abstract class Moniker with _$Moniker {
  const factory Moniker({
    /// The scheme of the moniker. For example tsc or .Net
    required String scheme,

    /// The identifier of the moniker. The value is opaque in LSIF however
    /// schema owners are allowed to define the structure if they want.
    required String identifier,

    /// The scope in which the moniker is unique
    required UniquenessLevel unique,

    /// The moniker kind if known.
    MonikerKind? kind,
  }) = _Moniker;

  factory Moniker.fromJson(Map<String, dynamic> json) =>
      _$MonikerFromJson(json);
}

@freezed
abstract class MonikerRegistrationOptions with _$MonikerRegistrationOptions {
  const factory MonikerRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _MonikerRegistrationOptions;

  factory MonikerRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerRegistrationOptionsFromJson(json);
}

/// The parameter of a `textDocument/prepareTypeHierarchy` request.
/// @since 3.17.0
@freezed
abstract class TypeHierarchyPrepareParams with _$TypeHierarchyPrepareParams {
  const factory TypeHierarchyPrepareParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _TypeHierarchyPrepareParams;

  factory TypeHierarchyPrepareParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyPrepareParamsFromJson(json);
}

/// @since 3.17.0
@freezed
abstract class TypeHierarchyItem with _$TypeHierarchyItem {
  const factory TypeHierarchyItem({
    /// The name of this item.
    required String name,

    /// The kind of this item.
    required SymbolKind kind,

    /// The resource identifier of this item.
    required String uri,

    /// The range enclosing this symbol not including leading/trailing
    /// whitespace but everything else, e.g. comments and code.
    required Range range,

    /// The range that should be selected and revealed when this symbol is
    /// being picked, e.g. the name of a function. Must be contained by the
    /// {@link TypeHierarchyItem.range `range`}.
    required Range selectionRange,

    /// A data entry field that is preserved between a type hierarchy prepare
    /// and supertypes or subtypes requests. It could also be used to identify
    /// the type hierarchy in the server, helping improve the performance on
    /// resolving supertypes and subtypes.
    LSPAny? data,

    /// More detail for this item, e.g. the signature of a function.
    String? detail,

    /// Tags for this item.
    List<SymbolTag>? tags,
  }) = _TypeHierarchyItem;

  factory TypeHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyItemFromJson(json);
}

/// Type hierarchy options used during static or dynamic registration.
/// @since 3.17.0
@freezed
abstract class TypeHierarchyRegistrationOptions
    with _$TypeHierarchyRegistrationOptions {
  const factory TypeHierarchyRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _TypeHierarchyRegistrationOptions;

  factory TypeHierarchyRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeHierarchyRegistrationOptionsFromJson(json);
}

/// The parameter of a `typeHierarchy/supertypes` request.
/// @since 3.17.0
@freezed
abstract class TypeHierarchySupertypesParams
    with _$TypeHierarchySupertypesParams {
  const factory TypeHierarchySupertypesParams({
    required TypeHierarchyItem item,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _TypeHierarchySupertypesParams;

  factory TypeHierarchySupertypesParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchySupertypesParamsFromJson(json);
}

/// The parameter of a `typeHierarchy/subtypes` request.
/// @since 3.17.0
@freezed
abstract class TypeHierarchySubtypesParams with _$TypeHierarchySubtypesParams {
  const factory TypeHierarchySubtypesParams({
    required TypeHierarchyItem item,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _TypeHierarchySubtypesParams;

  factory TypeHierarchySubtypesParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchySubtypesParamsFromJson(json);
}

/// A parameter literal used in inline value requests.
/// @since 3.17.0
@freezed
abstract class InlineValueParams with _$InlineValueParams {
  const factory InlineValueParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The document range for which inline values should be computed.
    required Range range,

    /// Additional information about the context in which inline values were
    /// requested.
    required InlineValueContext context,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _InlineValueParams;

  factory InlineValueParams.fromJson(Map<String, dynamic> json) =>
      _$InlineValueParamsFromJson(json);
}

/// Inline value options used during static or dynamic registration.
/// @since 3.17.0
@freezed
abstract class InlineValueRegistrationOptions
    with _$InlineValueRegistrationOptions {
  const factory InlineValueRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _InlineValueRegistrationOptions;

  factory InlineValueRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueRegistrationOptionsFromJson(json);
}

/// A parameter literal used in inlay hint requests.
/// @since 3.17.0
@freezed
abstract class InlayHintParams with _$InlayHintParams {
  const factory InlayHintParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The document range for which inlay hints should be computed.
    required Range range,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _InlayHintParams;

  factory InlayHintParams.fromJson(Map<String, dynamic> json) =>
      _$InlayHintParamsFromJson(json);
}

/// Inlay hint information.
/// @since 3.17.0
@freezed
abstract class InlayHint with _$InlayHint {
  const factory InlayHint({
    /// The position of this hint.
    /// If multiple hints have the same position, they will be shown in the
    /// order they appear in the response.
    required Position position,

    /// The label of this hint. A human readable string or an array of
    /// InlayHintLabelPart label parts.
    /// *Note* that neither the string nor the label part can be empty.
    required InlayHintLabelBase label,

    /// A data entry field that is preserved on an inlay hint between a
    /// `textDocument/inlayHint` and a `inlayHint/resolve` request.
    LSPAny? data,

    /// Render padding after the hint.
    /// Note: Padding should use the editor's background color, not the
    /// background color of the hint itself. That means padding can be used to
    /// visually align/separate an inlay hint.
    bool? paddingRight,

    /// Render padding before the hint.
    /// Note: Padding should use the editor's background color, not the
    /// background color of the hint itself. That means padding can be used to
    /// visually align/separate an inlay hint.
    bool? paddingLeft,

    /// The tooltip text when you hover over this item.
    TooltipOrDocumentationBase? tooltip,

    /// Optional text edits that are performed when accepting this inlay hint.
    /// *Note* that edits are expected to change the document so that the inlay
    /// hint (or its nearest variant) is now part of the document and the inlay
    /// hint itself is now obsolete.
    List<TextEdit>? textEdits,

    /// The kind of this hint. Can be omitted in which case the client should
    /// fall back to a reasonable default.
    InlayHintKind? kind,
  }) = _InlayHint;

  factory InlayHint.fromJson(Map<String, dynamic> json) =>
      _$InlayHintFromJson(json);
}

/// Inlay hint options used during static or dynamic registration.
/// @since 3.17.0
@freezed
abstract class InlayHintRegistrationOptions
    with _$InlayHintRegistrationOptions {
  const factory InlayHintRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,

    /// The server provides support to resolve additional information for an
    /// inlay hint item.
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _InlayHintRegistrationOptions;

  factory InlayHintRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintRegistrationOptionsFromJson(json);
}

/// Parameters of the document diagnostic request.
/// @since 3.17.0
@freezed
abstract class DocumentDiagnosticParams with _$DocumentDiagnosticParams {
  const factory DocumentDiagnosticParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The result id of a previous response if provided.
    String? previousResultId,

    /// The additional identifier  provided during registration.
    String? identifier,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentDiagnosticParams;

  factory DocumentDiagnosticParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentDiagnosticParamsFromJson(json);
}

/// A partial result for a document diagnostic report.
/// @since 3.17.0
@freezed
abstract class DocumentDiagnosticReportPartialResult
    with _$DocumentDiagnosticReportPartialResult {
  const factory DocumentDiagnosticReportPartialResult({
    required Map<String, RelatedDocumentsBase> relatedDocuments,
  }) = _DocumentDiagnosticReportPartialResult;

  factory DocumentDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentDiagnosticReportPartialResultFromJson(json);
}

/// Cancellation data returned from a diagnostic request.
/// @since 3.17.0
@freezed
abstract class DiagnosticServerCancellationData
    with _$DiagnosticServerCancellationData {
  const factory DiagnosticServerCancellationData({
    required bool retriggerRequest,
  }) = _DiagnosticServerCancellationData;

  factory DiagnosticServerCancellationData.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticServerCancellationDataFromJson(json);
}

/// Diagnostic registration options.
/// @since 3.17.0
@freezed
abstract class DiagnosticRegistrationOptions
    with _$DiagnosticRegistrationOptions {
  const factory DiagnosticRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// Whether the language has inter file dependencies meaning that editing
    /// code in one file can result in a different diagnostic set in another
    /// file. Inter file dependencies are common for most programming languages
    /// and typically uncommon for linters.
    required bool interFileDependencies,

    /// The server provides support for workspace diagnostics as well.
    required bool workspaceDiagnostics,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,

    /// An optional identifier under which the diagnostics are managed by the
    /// client.
    String? identifier,
    bool? workDoneProgress,
  }) = _DiagnosticRegistrationOptions;

  factory DiagnosticRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticRegistrationOptionsFromJson(json);
}

/// Parameters of the workspace diagnostic request.
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticParams with _$WorkspaceDiagnosticParams {
  const factory WorkspaceDiagnosticParams({
    /// The currently known diagnostic reports with their previous result ids.
    required List<PreviousResultId> previousResultIds,

    /// The additional identifier provided during registration.
    String? identifier,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _WorkspaceDiagnosticParams;

  factory WorkspaceDiagnosticParams.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDiagnosticParamsFromJson(json);
}

/// A workspace diagnostic report.
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticReport with _$WorkspaceDiagnosticReport {
  const factory WorkspaceDiagnosticReport({
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReport;

  factory WorkspaceDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDiagnosticReportFromJson(json);
}

/// A partial result for a workspace diagnostic report.
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticReportPartialResult
    with _$WorkspaceDiagnosticReportPartialResult {
  const factory WorkspaceDiagnosticReportPartialResult({
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReportPartialResult;

  factory WorkspaceDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceDiagnosticReportPartialResultFromJson(json);
}

/// The params sent in an open notebook document notification.
/// @since 3.17.0
@freezed
abstract class DidOpenNotebookDocumentParams
    with _$DidOpenNotebookDocumentParams {
  const factory DidOpenNotebookDocumentParams({
    /// The notebook document that got opened.
    required NotebookDocument notebookDocument,

    /// The text documents that represent the content of a notebook cell.
    required List<TextDocumentItem> cellTextDocuments,
  }) = _DidOpenNotebookDocumentParams;

  factory DidOpenNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidOpenNotebookDocumentParamsFromJson(json);
}

/// The params sent in a change notebook document notification.
/// @since 3.17.0
@freezed
abstract class DidChangeNotebookDocumentParams
    with _$DidChangeNotebookDocumentParams {
  const factory DidChangeNotebookDocumentParams({
    /// The notebook document that did change. The version number points to the
    /// version after all provided changes have been applied. If only the text
    /// document content of a cell changes the notebook version doesn't
    /// necessarily have to change.
    required VersionedNotebookDocumentIdentifier notebookDocument,

    /// The actual changes to the notebook document.
    /// The changes describe single state changes to the notebook document. So
    /// if there are two changes c1 (at array index 0) and c2 (at array index
    /// 1) for a notebook in state S then c1 moves the notebook from S to S'
    /// and c2 from S' to S''. So c1 is computed on the state S and c2 is
    /// computed on the state S'.
    /// To mirror the content of a notebook using change events use the
    /// following approach: - start with the same initial content - apply the
    /// 'notebookDocument/didChange' notifications in the order you receive
    /// them. - apply the `NotebookChangeEvent`s in a single notification in
    /// the order you receive them.
    required NotebookDocumentChangeEvent change,
  }) = _DidChangeNotebookDocumentParams;

  factory DidChangeNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeNotebookDocumentParamsFromJson(json);
}

/// The params sent in a save notebook document notification.
/// @since 3.17.0
@freezed
abstract class DidSaveNotebookDocumentParams
    with _$DidSaveNotebookDocumentParams {
  const factory DidSaveNotebookDocumentParams({
    /// The notebook document that got saved.
    required NotebookDocumentIdentifier notebookDocument,
  }) = _DidSaveNotebookDocumentParams;

  factory DidSaveNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidSaveNotebookDocumentParamsFromJson(json);
}

/// The params sent in a close notebook document notification.
/// @since 3.17.0
@freezed
abstract class DidCloseNotebookDocumentParams
    with _$DidCloseNotebookDocumentParams {
  const factory DidCloseNotebookDocumentParams({
    /// The notebook document that got closed.
    required NotebookDocumentIdentifier notebookDocument,

    /// The text documents that represent the content of a notebook cell that
    /// got closed.
    required List<TextDocumentIdentifier> cellTextDocuments,
  }) = _DidCloseNotebookDocumentParams;

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseNotebookDocumentParamsFromJson(json);
}

/// A parameter literal used in inline completion requests.
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionParams with _$InlineCompletionParams {
  const factory InlineCompletionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// Additional information about the context in which inline completions
    /// were requested.
    required InlineCompletionContext context,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _InlineCompletionParams;

  factory InlineCompletionParams.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionParamsFromJson(json);
}

/// Represents a collection of {@link InlineCompletionItem inline
/// completion items} to be presented in the editor.
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionList with _$InlineCompletionList {
  const factory InlineCompletionList({
    /// The inline completion items
    required List<InlineCompletionItem> items,
  }) = _InlineCompletionList;

  factory InlineCompletionList.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionListFromJson(json);
}

/// An inline completion item represents a text snippet that is
/// proposed inline to complete text that is being typed.
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionItem with _$InlineCompletionItem {
  const factory InlineCompletionItem({
    /// The text to replace the range with. Must be set.
    required InlineCompletionItemInsertTextBase insertText,

    /// An optional {@link Command} that is executed *after* inserting this
    /// completion.
    Command? command,

    /// The range to replace. Must begin and end on the same line.
    Range? range,

    /// A text that is used to decide if this inline completion should be
    /// shown. When `falsy` the {@link InlineCompletionItem.insertText} is
    /// used.
    String? filterText,
  }) = _InlineCompletionItem;

  factory InlineCompletionItem.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionItemFromJson(json);
}

/// Inline completion options used during static or dynamic
/// registration.
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionRegistrationOptions
    with _$InlineCompletionRegistrationOptions {
  const factory InlineCompletionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
    bool? workDoneProgress,
  }) = _InlineCompletionRegistrationOptions;

  factory InlineCompletionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionRegistrationOptionsFromJson(json);
}

@freezed
abstract class RegistrationParams with _$RegistrationParams {
  const factory RegistrationParams({
    required List<Registration> registrations,
  }) = _RegistrationParams;

  factory RegistrationParams.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParamsFromJson(json);
}

@freezed
abstract class UnregistrationParams with _$UnregistrationParams {
  const factory UnregistrationParams({
    required List<Unregistration> unregisterations,
  }) = _UnregistrationParams;

  factory UnregistrationParams.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationParamsFromJson(json);
}

@freezed
abstract class InitializeParams with _$InitializeParams {
  const factory InitializeParams({
    /// The process Id of the parent process that started the server.
    /// Is `null` if the process has not been started by another process. If
    /// the parent process is not alive then the server should exit.
    required ProcessIdOrVersionBase processId,

    /// The rootUri of the workspace. Is null if no folder is open. If both
    /// `rootPath` and `rootUri` are set `rootUri` wins.
    /// @deprecated in favour of workspaceFolders.
    required InitializeParamsRootUriBase rootUri,

    /// The capabilities provided by the client (editor or tool)
    required ClientCapabilities capabilities,

    /// The workspace folders configured in the client when the server starts.
    /// This property is only available if the client supports workspace
    /// folders. It can be `null` if the client supports workspace folders but
    /// none are configured.
    /// @since 3.6.0
    WorkspaceFoldersInitializeParamsWorkspaceFoldersBase? workspaceFolders,

    /// The initial trace setting. If omitted trace is disabled ('off').
    TraceValues? trace,

    /// User provided initialization options.
    LSPAny? initializationOptions,

    /// The rootPath of the workspace. Is null if no folder is open.
    /// @deprecated in favour of rootUri.
    InitializeParamsRootPathBase? rootPath,

    /// The locale the client is currently showing the user interface in. This
    /// must not necessarily be the locale of the operating system.
    /// Uses IETF language tags as the value's syntax (See
    /// https://en.wikipedia.org/wiki/IETF_language_tag)
    /// @since 3.16.0
    String? locale,

    /// Information about the client
    /// @since 3.15.0
    ({String name, String? version})? clientInfo,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _InitializeParams;

  factory InitializeParams.fromJson(Map<String, dynamic> json) =>
      _$InitializeParamsFromJson(json);
}

/// The result returned from an initialize request.
@freezed
abstract class InitializeResult with _$InitializeResult {
  const factory InitializeResult({
    /// The capabilities the language server provides.
    required ServerCapabilities capabilities,

    /// Information about the server.
    /// @since 3.15.0
    ({String name, String? version})? serverInfo,
  }) = _InitializeResult;

  factory InitializeResult.fromJson(Map<String, dynamic> json) =>
      _$InitializeResultFromJson(json);
}

/// The data type of the ResponseError if the initialize request
/// fails.
@freezed
abstract class InitializeError with _$InitializeError {
  const factory InitializeError({
    /// Indicates whether the client execute the following retry logic: (1)
    /// show the message provided by the ResponseError to the user (2) user
    /// selects retry or cancel (3) if user selected retry the initialize
    /// method is sent again.
    required bool retry,
  }) = _InitializeError;

  factory InitializeError.fromJson(Map<String, dynamic> json) =>
      _$InitializeErrorFromJson(json);
}

@freezed
abstract class InitializedParams with _$InitializedParams {
  const factory InitializedParams() = _InitializedParams;

  factory InitializedParams.fromJson(Map<String, dynamic> json) =>
      _$InitializedParamsFromJson(json);
}

/// The parameters of a change configuration notification.
@freezed
abstract class DidChangeConfigurationParams
    with _$DidChangeConfigurationParams {
  const factory DidChangeConfigurationParams({
    /// The actual changed settings
    required LSPAny settings,
  }) = _DidChangeConfigurationParams;

  factory DidChangeConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeConfigurationParamsFromJson(json);
}

@freezed
abstract class DidChangeConfigurationRegistrationOptions
    with _$DidChangeConfigurationRegistrationOptions {
  const factory DidChangeConfigurationRegistrationOptions({
    DidChangeConfigurationRegistrationOptionsSectionBase? section,
  }) = _DidChangeConfigurationRegistrationOptions;

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationRegistrationOptionsFromJson(json);
}

/// The parameters of a notification message.
@freezed
abstract class ShowMessageParams with _$ShowMessageParams {
  const factory ShowMessageParams({
    /// The message type. See {@link MessageType}
    required MessageType type,

    /// The actual message.
    required String message,
  }) = _ShowMessageParams;

  factory ShowMessageParams.fromJson(Map<String, dynamic> json) =>
      _$ShowMessageParamsFromJson(json);
}

@freezed
abstract class ShowMessageRequestParams with _$ShowMessageRequestParams {
  const factory ShowMessageRequestParams({
    /// The message type. See {@link MessageType}
    required MessageType type,

    /// The actual message.
    required String message,

    /// The message action items to present.
    List<MessageActionItem>? actions,
  }) = _ShowMessageRequestParams;

  factory ShowMessageRequestParams.fromJson(Map<String, dynamic> json) =>
      _$ShowMessageRequestParamsFromJson(json);
}

@freezed
abstract class MessageActionItem with _$MessageActionItem {
  const factory MessageActionItem({
    /// A short title like 'Retry', 'Open Log' etc.
    required String title,
  }) = _MessageActionItem;

  factory MessageActionItem.fromJson(Map<String, dynamic> json) =>
      _$MessageActionItemFromJson(json);
}

/// The log message parameters.
@freezed
abstract class LogMessageParams with _$LogMessageParams {
  const factory LogMessageParams({
    /// The message type. See {@link MessageType}
    required MessageType type,

    /// The actual message.
    required String message,
  }) = _LogMessageParams;

  factory LogMessageParams.fromJson(Map<String, dynamic> json) =>
      _$LogMessageParamsFromJson(json);
}

/// The parameters sent in an open text document notification
@freezed
abstract class DidOpenTextDocumentParams with _$DidOpenTextDocumentParams {
  const factory DidOpenTextDocumentParams({
    /// The document that was opened.
    required TextDocumentItem textDocument,
  }) = _DidOpenTextDocumentParams;

  factory DidOpenTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidOpenTextDocumentParamsFromJson(json);
}

/// The change text document notification's parameters.
@freezed
abstract class DidChangeTextDocumentParams with _$DidChangeTextDocumentParams {
  const factory DidChangeTextDocumentParams({
    /// The document that did change. The version number points to the version
    /// after all provided content changes have been applied.
    required VersionedTextDocumentIdentifier textDocument,

    /// The actual content changes. The content changes describe single state
    /// changes to the document. So if there are two content changes c1 (at
    /// array index 0) and c2 (at array index 1) for a document in state S then
    /// c1 moves the document from S to S' and c2 from S' to S''. So c1 is
    /// computed on the state S and c2 is computed on the state S'.
    /// To mirror the content of a document using change events use the
    /// following approach: - start with the same initial content - apply the
    /// 'textDocument/didChange' notifications in the order you receive them. -
    /// apply the `TextDocumentContentChangeEvent`s in a single notification in
    /// the order you receive them.
    required List<TextDocumentContentChangeEvent> contentChanges,
  }) = _DidChangeTextDocumentParams;

  factory DidChangeTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeTextDocumentParamsFromJson(json);
}

/// Describe options to be used when registered for text document
/// change events.
@freezed
abstract class TextDocumentChangeRegistrationOptions
    with _$TextDocumentChangeRegistrationOptions {
  const factory TextDocumentChangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// How documents are synced to the server.
    required TextDocumentSyncKind syncKind,
  }) = _TextDocumentChangeRegistrationOptions;

  factory TextDocumentChangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentChangeRegistrationOptionsFromJson(json);
}

/// The parameters sent in a close text document notification
@freezed
abstract class DidCloseTextDocumentParams with _$DidCloseTextDocumentParams {
  const factory DidCloseTextDocumentParams({
    /// The document that was closed.
    required TextDocumentIdentifier textDocument,
  }) = _DidCloseTextDocumentParams;

  factory DidCloseTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseTextDocumentParamsFromJson(json);
}

/// The parameters sent in a save text document notification
@freezed
abstract class DidSaveTextDocumentParams with _$DidSaveTextDocumentParams {
  const factory DidSaveTextDocumentParams({
    /// The document that was saved.
    required TextDocumentIdentifier textDocument,

    /// Optional the content when saved. Depends on the includeText value when
    /// the save notification was requested.
    String? text,
  }) = _DidSaveTextDocumentParams;

  factory DidSaveTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidSaveTextDocumentParamsFromJson(json);
}

/// Save registration options.
@freezed
abstract class TextDocumentSaveRegistrationOptions
    with _$TextDocumentSaveRegistrationOptions {
  const factory TextDocumentSaveRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The client is supposed to include the content on save.
    bool? includeText,
  }) = _TextDocumentSaveRegistrationOptions;

  factory TextDocumentSaveRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSaveRegistrationOptionsFromJson(json);
}

/// The parameters sent in a will save text document notification.
@freezed
abstract class WillSaveTextDocumentParams with _$WillSaveTextDocumentParams {
  const factory WillSaveTextDocumentParams({
    /// The document that will be saved.
    required TextDocumentIdentifier textDocument,

    /// The 'TextDocumentSaveReason'.
    required TextDocumentSaveReason reason,
  }) = _WillSaveTextDocumentParams;

  factory WillSaveTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$WillSaveTextDocumentParamsFromJson(json);
}

/// A text edit applicable to a text document.
@freezed
abstract class TextEdit with _$TextEdit {
  const factory TextEdit({
    /// The range of the text document to be manipulated. To insert text into a
    /// document create a range where start === end.
    required Range range,

    /// The string to be inserted. For delete operations use an empty string.
    required String newText,
  }) = _TextEdit;

  factory TextEdit.fromJson(Map<String, dynamic> json) =>
      _$TextEditFromJson(json);
}

/// The watched files change notification's parameters.
@freezed
abstract class DidChangeWatchedFilesParams with _$DidChangeWatchedFilesParams {
  const factory DidChangeWatchedFilesParams({
    /// The actual file events.
    required List<FileEvent> changes,
  }) = _DidChangeWatchedFilesParams;

  factory DidChangeWatchedFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWatchedFilesParamsFromJson(json);
}

/// Describe options to be used when registered for text document
/// change events.
@freezed
abstract class DidChangeWatchedFilesRegistrationOptions
    with _$DidChangeWatchedFilesRegistrationOptions {
  const factory DidChangeWatchedFilesRegistrationOptions({
    /// The watchers to register.
    required List<FileSystemWatcher> watchers,
  }) = _DidChangeWatchedFilesRegistrationOptions;

  factory DidChangeWatchedFilesRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesRegistrationOptionsFromJson(json);
}

/// The publish diagnostic notification's parameters.
@freezed
abstract class PublishDiagnosticsParams with _$PublishDiagnosticsParams {
  const factory PublishDiagnosticsParams({
    /// The URI for which diagnostic information is reported.
    required String uri,

    /// An array of diagnostic information items.
    required List<Diagnostic> diagnostics,

    /// Optional the version number of the document the diagnostics are
    /// published for.
    /// @since 3.15.0
    int? version,
  }) = _PublishDiagnosticsParams;

  factory PublishDiagnosticsParams.fromJson(Map<String, dynamic> json) =>
      _$PublishDiagnosticsParamsFromJson(json);
}

/// Completion parameters
@freezed
abstract class CompletionParams with _$CompletionParams {
  const factory CompletionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// The completion context. This is only available if the client specifies
    /// to send this using the client capability
    /// `textDocument.completion.contextSupport === true`
    CompletionContext? context,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _CompletionParams;

  factory CompletionParams.fromJson(Map<String, dynamic> json) =>
      _$CompletionParamsFromJson(json);
}

/// A completion item represents a text snippet that is proposed to
/// complete text that is being typed.
@freezed
abstract class CompletionItem with _$CompletionItem {
  const factory CompletionItem({
    /// The label of this completion item.
    /// The label property is also by default the text that is inserted when
    /// selecting this completion.
    /// If label details are provided the label itself should be an unqualified
    /// name of the completion item.
    required String label,

    /// A data entry field that is preserved on a completion item between a
    /// {@link CompletionRequest} and a {@link CompletionResolveRequest}.
    LSPAny? data,

    /// An optional {@link Command command} that is executed *after* inserting
    /// this completion. *Note* that additional modifications to the current
    /// document should be described with the {@link
    /// CompletionItem.additionalTextEdits additionalTextEdits}-property.
    Command? command,

    /// An optional set of characters that when pressed while this completion
    /// is active will accept it first and then type that character. *Note*
    /// that all commit characters should have `length=1` and that superfluous
    /// characters will be ignored.
    List<String>? commitCharacters,

    /// An optional array of additional {@link TextEdit text edits} that are
    /// applied when selecting this completion. Edits must not overlap
    /// (including the same insert position) with the main {@link
    /// CompletionItem.textEdit edit} nor with themselves.
    /// Additional text edits should be used to change text unrelated to the
    /// current cursor position (for example adding an import statement at the
    /// top of the file if the completion item will insert an unqualified
    /// type).
    List<TextEdit>? additionalTextEdits,

    /// The edit text used if the completion item is part of a CompletionList
    /// and CompletionList defines an item default for the text edit range.
    /// Clients will only honor this property if they opt into completion list
    /// item defaults using the capability `completionList.itemDefaults`.
    /// If not provided and a list's default range is provided the label
    /// property is used as a text.
    /// @since 3.17.0
    String? textEditText,

    /// An {@link TextEdit edit} which is applied to a document when selecting
    /// this completion. When an edit is provided the value of {@link
    /// CompletionItem.insertText insertText} is ignored.
    /// Most editors support two different operations when accepting a
    /// completion item. One is to insert a completion text and the other is to
    /// replace an existing text with a completion text. Since this can usually
    /// not be predetermined by a server it can report both ranges. Clients
    /// need to signal support for `InsertReplaceEdits` via the
    /// `textDocument.completion.insertReplaceSupport` client capability
    /// property.
    /// *Note 1:* The text edit's range as well as both ranges from an insert
    /// replace edit must be a [single line] and they must contain the position
    /// at which completion has been requested. *Note 2:* If an
    /// `InsertReplaceEdit` is returned the edit's insert range must be a
    /// prefix of the edit's replace range, that means it must be contained and
    /// starting at the same position.
    /// @since 3.16.0 additional type `InsertReplaceEdit`
    CompletionItemTextEditBase? textEdit,

    /// How whitespace and indentation is handled during completion item
    /// insertion. If not provided the clients default value depends on the
    /// `textDocument.completion.insertTextMode` client capability.
    /// @since 3.16.0
    InsertTextMode? insertTextMode,

    /// The format of the insert text. The format applies to both the
    /// `insertText` property and the `newText` property of a provided
    /// `textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
    /// Please note that the insertTextFormat doesn't apply to
    /// `additionalTextEdits`.
    InsertTextFormat? insertTextFormat,

    /// A string that should be inserted into a document when selecting this
    /// completion. When `falsy` the {@link CompletionItem.label label} is
    /// used.
    /// The `insertText` is subject to interpretation by the client side. Some
    /// tools might not take the string literally. For example VS Code when
    /// code complete is requested in this example `con<cursor position>` and a
    /// completion item with an `insertText` of `console` is provided it will
    /// only insert `sole`. Therefore it is recommended to use `textEdit`
    /// instead since it avoids additional client side interpretation.
    String? insertText,

    /// A string that should be used when filtering a set of completion items.
    /// When `falsy` the {@link CompletionItem.label label} is used.
    String? filterText,

    /// A string that should be used when comparing this item with other items.
    /// When `falsy` the {@link CompletionItem.label label} is used.
    String? sortText,

    /// Select this item when showing.
    /// *Note* that only one completion item can be selected and that the tool
    /// / client decides which item that is. The rule is that the *first* item
    /// of those that match best is selected.
    bool? preselect,

    /// Indicates if this item is deprecated. @deprecated Use `tags` instead.
    bool? deprecated,

    /// A human-readable string that represents a doc-comment.
    TooltipOrDocumentationBase? documentation,

    /// A human-readable string with additional information about this item,
    /// like type or symbol information.
    String? detail,

    /// Tags for this completion item.
    /// @since 3.15.0
    List<CompletionItemTag>? tags,

    /// The kind of this completion item. Based of the kind an icon is chosen
    /// by the editor.
    CompletionItemKind? kind,

    /// Additional details for the label
    /// @since 3.17.0
    CompletionItemLabelDetails? labelDetails,
  }) = _CompletionItem;

  factory CompletionItem.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemFromJson(json);
}

/// Represents a collection of {@link CompletionItem completion
/// items} to be presented in the editor.
@freezed
abstract class CompletionList with _$CompletionList {
  const factory CompletionList({
    /// This list it not complete. Further typing results in recomputing this
    /// list.
    /// Recomputed lists have all their items replaced (not appended) in the
    /// incomplete completion sessions.
    required bool isIncomplete,

    /// The completion items.
    required List<CompletionItem> items,

    /// In many cases the items of an actual completion result share the same
    /// value for properties like `commitCharacters` or the range of a text
    /// edit. A completion list can therefore define item defaults which will
    /// be used if a completion item itself doesn't specify the value.
    /// If a completion list specifies a default value and a completion item
    /// also specifies a corresponding value the one from the item is used.
    /// Servers are only allowed to return default values if the client signals
    /// support for this via the `completionList.itemDefaults` capability.
    /// @since 3.17.0
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

/// Registration options for a {@link CompletionRequest}.
@freezed
abstract class CompletionRegistrationOptions
    with _$CompletionRegistrationOptions {
  const factory CompletionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The server supports the following `CompletionItem` specific
    /// capabilities.
    /// @since 3.17.0
    ({bool? labelDetailsSupport})? completionItem,

    /// The server provides support to resolve additional information for a
    /// completion item.
    bool? resolveProvider,

    /// The list of all possible characters that commit a completion. This
    /// field can be used if clients don't support individual commit characters
    /// per completion item. See
    /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    /// If a server provides both `allCommitCharacters` and commit characters
    /// on an individual completion item the ones on the completion item win.
    /// @since 3.2.0
    List<String>? allCommitCharacters,

    /// Most tools trigger completion request automatically without explicitly
    /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
    /// they do so when the user starts to type an identifier. For example if
    /// the user types `c` in a JavaScript file code complete will
    /// automatically pop up present `console` besides others as a completion
    /// item. Characters that make up identifiers don't need to be listed here.
    /// If code complete should automatically be trigger on characters not
    /// being valid inside an identifier (for example `.` in JavaScript) list
    /// them in `triggerCharacters`.
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _CompletionRegistrationOptions;

  factory CompletionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CompletionRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link HoverRequest}.
@freezed
abstract class HoverParams with _$HoverParams {
  const factory HoverParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _HoverParams;

  factory HoverParams.fromJson(Map<String, dynamic> json) =>
      _$HoverParamsFromJson(json);
}

/// The result of a hover request.
@freezed
abstract class Hover with _$Hover {
  const factory Hover({
    /// The hover's content
    required HoverContentsBase contents,

    /// An optional range inside the text document that is used to visualize
    /// the hover, e.g. by changing the background color.
    Range? range,
  }) = _Hover;

  factory Hover.fromJson(Map<String, dynamic> json) => _$HoverFromJson(json);
}

/// Registration options for a {@link HoverRequest}.
@freezed
abstract class HoverRegistrationOptions with _$HoverRegistrationOptions {
  const factory HoverRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _HoverRegistrationOptions;

  factory HoverRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpParams with _$SignatureHelpParams {
  const factory SignatureHelpParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// The signature help context. This is only available if the client
    /// specifies to send this using the client capability
    /// `textDocument.signatureHelp.contextSupport === true`
    /// @since 3.15.0
    SignatureHelpContext? context,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _SignatureHelpParams;

  factory SignatureHelpParams.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpParamsFromJson(json);
}

/// Signature help represents the signature of something callable.
/// There can be multiple signature but only one active and only one
/// active parameter.
@freezed
abstract class SignatureHelp with _$SignatureHelp {
  const factory SignatureHelp({
    /// One or more signatures.
    required List<SignatureInformation> signatures,

    /// The active parameter of the active signature. If omitted or the value
    /// lies outside the range of `signatures[activeSignature].parameters`
    /// defaults to 0 if the active signature has parameters. If the active
    /// signature has no parameters it is ignored. In future version of the
    /// protocol this property might become mandatory to better express the
    /// active parameter if the active signature does have any.
    int? activeParameter,

    /// The active signature. If omitted or the value lies outside the range of
    /// `signatures` the value defaults to zero or is ignored if the
    /// `SignatureHelp` has no signatures.
    /// Whenever possible implementors should make an active decision about the
    /// active signature and shouldn't rely on a default value.
    /// In future version of the protocol this property might become mandatory
    /// to better express this.
    int? activeSignature,
  }) = _SignatureHelp;

  factory SignatureHelp.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpFromJson(json);
}

/// Registration options for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpRegistrationOptions
    with _$SignatureHelpRegistrationOptions {
  const factory SignatureHelpRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// List of characters that re-trigger signature help.
    /// These trigger characters are only active when signature help is already
    /// showing. All trigger characters are also counted as re-trigger
    /// characters.
    /// @since 3.15.0
    List<String>? retriggerCharacters,

    /// List of characters that trigger signature help automatically.
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _SignatureHelpRegistrationOptions;

  factory SignatureHelpRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SignatureHelpRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionParams with _$DefinitionParams {
  const factory DefinitionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DefinitionParams;

  factory DefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$DefinitionParamsFromJson(json);
}

/// Registration options for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionRegistrationOptions
    with _$DefinitionRegistrationOptions {
  const factory DefinitionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _DefinitionRegistrationOptions;

  factory DefinitionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceParams with _$ReferenceParams {
  const factory ReferenceParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,
    required ReferenceContext context,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _ReferenceParams;

  factory ReferenceParams.fromJson(Map<String, dynamic> json) =>
      _$ReferenceParamsFromJson(json);
}

/// Registration options for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceRegistrationOptions
    with _$ReferenceRegistrationOptions {
  const factory ReferenceRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _ReferenceRegistrationOptions;

  factory ReferenceRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightParams with _$DocumentHighlightParams {
  const factory DocumentHighlightParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentHighlightParams;

  factory DocumentHighlightParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightParamsFromJson(json);
}

/// A document highlight is a range inside a text document which
/// deserves special attention. Usually a document highlight is
/// visualized by changing the background color of its range.
@freezed
abstract class DocumentHighlight with _$DocumentHighlight {
  const factory DocumentHighlight({
    /// The range this highlight applies to.
    required Range range,

    /// The highlight kind, default is {@link DocumentHighlightKind.Text text}.
    DocumentHighlightKind? kind,
  }) = _DocumentHighlight;

  factory DocumentHighlight.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightFromJson(json);
}

/// Registration options for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightRegistrationOptions
    with _$DocumentHighlightRegistrationOptions {
  const factory DocumentHighlightRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _DocumentHighlightRegistrationOptions;

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolParams with _$DocumentSymbolParams {
  const factory DocumentSymbolParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentSymbolParams;

  factory DocumentSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolParamsFromJson(json);
}

/// Represents information about programming constructs like
/// variables, classes, interfaces etc.
@freezed
abstract class SymbolInformation with _$SymbolInformation {
  const factory SymbolInformation({
    /// The name of this symbol.
    required String name,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// The location of this symbol. The location's range is used by a tool to
    /// reveal the location in the editor. If the symbol is selected in the
    /// tool the range's start information is used to position the cursor. So
    /// the range usually spans more than the actual symbol's name and does
    /// normally include things like visibility modifiers.
    /// The range doesn't have to denote a node range in the sense of an
    /// abstract syntax tree. It can therefore not be used to re-construct a
    /// hierarchy of the symbols.
    required Location location,

    /// Indicates if this symbol is deprecated.
    /// @deprecated Use tags instead
    bool? deprecated,

    /// The name of the symbol containing this symbol. This information is for
    /// user interface purposes (e.g. to render a qualifier in the user
    /// interface if necessary). It can't be used to re-infer a hierarchy for
    /// the document symbols.
    String? containerName,

    /// Tags for this symbol.
    /// @since 3.16.0
    List<SymbolTag>? tags,
  }) = _SymbolInformation;

  factory SymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$SymbolInformationFromJson(json);
}

/// Represents programming constructs like variables, classes,
/// interfaces etc. that appear in a document. Document symbols can
/// be hierarchical and they have two ranges: one that encloses its
/// definition and one that points to its most interesting range,
/// e.g. the range of an identifier.
@freezed
abstract class DocumentSymbol with _$DocumentSymbol {
  const factory DocumentSymbol({
    /// The name of this symbol. Will be displayed in the user interface and
    /// therefore must not be an empty string or a string only consisting of
    /// white spaces.
    required String name,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// The range enclosing this symbol not including leading/trailing
    /// whitespace but everything else like comments. This information is
    /// typically used to determine if the clients cursor is inside the symbol
    /// to reveal in the symbol in the UI.
    required Range range,

    /// The range that should be selected and revealed when this symbol is
    /// being picked, e.g the name of a function. Must be contained by the
    /// `range`.
    required Range selectionRange,

    /// Children of this symbol, e.g. properties of a class.
    List<DocumentSymbol>? children,

    /// Indicates if this symbol is deprecated.
    /// @deprecated Use tags instead
    bool? deprecated,

    /// Tags for this document symbol.
    /// @since 3.16.0
    List<SymbolTag>? tags,

    /// More detail for this symbol, e.g the signature of a function.
    String? detail,
  }) = _DocumentSymbol;

  factory DocumentSymbol.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolFromJson(json);
}

/// Registration options for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolRegistrationOptions
    with _$DocumentSymbolRegistrationOptions {
  const factory DocumentSymbolRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// A human-readable string that is shown when multiple outlines trees are
    /// shown for the same document.
    /// @since 3.16.0
    String? label,
    bool? workDoneProgress,
  }) = _DocumentSymbolRegistrationOptions;

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link CodeActionRequest}.
@freezed
abstract class CodeActionParams with _$CodeActionParams {
  const factory CodeActionParams({
    /// The document in which the command was invoked.
    required TextDocumentIdentifier textDocument,

    /// The range for which the command was invoked.
    required Range range,

    /// Context carrying additional information.
    required CodeActionContext context,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _CodeActionParams;

  factory CodeActionParams.fromJson(Map<String, dynamic> json) =>
      _$CodeActionParamsFromJson(json);
}

/// Represents a reference to a command. Provides a title which will
/// be used to represent a command in the UI and, optionally, an
/// array of arguments which will be passed to the command handler
/// function when invoked.
@freezed
abstract class Command with _$Command {
  const factory Command({
    /// Title of the command, like `save`.
    required String title,

    /// The identifier of the actual command handler.
    required String command,

    /// Arguments that the command handler should be invoked with.
    List<LSPAny>? arguments,
  }) = _Command;

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}

/// A code action represents a change that can be performed in code,
/// e.g. to fix a problem or to refactor code.
/// A CodeAction must set either `edit` and/or a `command`. If both
/// are supplied, the `edit` is applied first, then the `command` is
/// executed.
@freezed
abstract class CodeAction with _$CodeAction {
  const factory CodeAction({
    /// A short, human-readable, title for this code action.
    required String title,

    /// A data entry field that is preserved on a code action between a
    /// `textDocument/codeAction` and a `codeAction/resolve` request.
    /// @since 3.16.0
    LSPAny? data,

    /// A command this code action executes. If a code action provides an edit
    /// and a command, first the edit is executed and then the command.
    Command? command,

    /// The workspace edit this code action performs.
    WorkspaceEdit? edit,

    /// Marks that the code action cannot currently be applied.
    /// Clients should follow the following guidelines regarding disabled code
    /// actions:
    /// - Disabled code actions are not shown in automatic
    /// [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
    /// code action menus.
    /// - Disabled actions are shown as faded out in the code action menu when
    /// the user requests a more specific type of code action, such as
    /// refactorings.
    /// - If the user has a
    /// [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
    /// that auto applies a code action and only disabled code actions are
    /// returned, the client should show the user an error message with
    /// `reason` in the editor.
    /// @since 3.16.0
    ({String reason})? disabled,

    /// Marks this as a preferred action. Preferred actions are used by the
    /// `auto fix` command and can be targeted by keybindings.
    /// A quick fix should be marked preferred if it properly addresses the
    /// underlying error. A refactoring should be marked preferred if it is the
    /// most reasonable choice of actions to take.
    /// @since 3.15.0
    bool? isPreferred,

    /// The diagnostics that this code action resolves.
    List<Diagnostic>? diagnostics,

    /// The kind of the code action.
    /// Used to filter code actions.
    CodeActionKind? kind,
  }) = _CodeAction;

  factory CodeAction.fromJson(Map<String, dynamic> json) =>
      _$CodeActionFromJson(json);
}

/// Registration options for a {@link CodeActionRequest}.
@freezed
abstract class CodeActionRegistrationOptions
    with _$CodeActionRegistrationOptions {
  const factory CodeActionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// The server provides support to resolve additional information for a
    /// code action.
    /// @since 3.16.0
    bool? resolveProvider,

    /// CodeActionKinds that this server may return.
    /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
    /// the server may list out every specific kind they provide.
    List<CodeActionKind>? codeActionKinds,
    bool? workDoneProgress,
  }) = _CodeActionRegistrationOptions;

  factory CodeActionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolParams with _$WorkspaceSymbolParams {
  const factory WorkspaceSymbolParams({
    /// A query string to filter symbols by. Clients may send an empty string
    /// here to request all symbols.
    required String query,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _WorkspaceSymbolParams;

  factory WorkspaceSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolParamsFromJson(json);
}

/// A special workspace symbol that supports locations without a
/// range.
/// See also SymbolInformation.
/// @since 3.17.0
@freezed
abstract class WorkspaceSymbol with _$WorkspaceSymbol {
  const factory WorkspaceSymbol({
    /// The name of this symbol.
    required String name,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// The location of the symbol. Whether a server is allowed to return a
    /// location without a range depends on the client capability
    /// `workspace.symbol.resolveSupport`.
    /// See SymbolInformation#location for more details.
    required WorkspaceSymbolLocationBase location,

    /// A data entry field that is preserved on a workspace symbol between a
    /// workspace symbol request and a workspace symbol resolve request.
    LSPAny? data,

    /// The name of the symbol containing this symbol. This information is for
    /// user interface purposes (e.g. to render a qualifier in the user
    /// interface if necessary). It can't be used to re-infer a hierarchy for
    /// the document symbols.
    String? containerName,

    /// Tags for this symbol.
    /// @since 3.16.0
    List<SymbolTag>? tags,
  }) = _WorkspaceSymbol;

  factory WorkspaceSymbol.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolFromJson(json);
}

/// Registration options for a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolRegistrationOptions
    with _$WorkspaceSymbolRegistrationOptions {
  const factory WorkspaceSymbolRegistrationOptions({
    /// The server provides support to resolve additional information for a
    /// workspace symbol.
    /// @since 3.17.0
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _WorkspaceSymbolRegistrationOptions;

  factory WorkspaceSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensParams with _$CodeLensParams {
  const factory CodeLensParams({
    /// The document to request code lens for.
    required TextDocumentIdentifier textDocument,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _CodeLensParams;

  factory CodeLensParams.fromJson(Map<String, dynamic> json) =>
      _$CodeLensParamsFromJson(json);
}

/// A code lens represents a {@link Command command} that should be
/// shown along with source text, like the number of references, a
/// way to run tests, etc.
/// A code lens is _unresolved_ when no command is associated to it.
/// For performance reasons the creation of a code lens and resolving
/// should be done in two stages.
@freezed
abstract class CodeLens with _$CodeLens {
  const factory CodeLens({
    /// The range in which this code lens is valid. Should only span a single
    /// line.
    required Range range,

    /// A data entry field that is preserved on a code lens item between a
    /// {@link CodeLensRequest} and a {@link CodeLensResolveRequest}
    LSPAny? data,

    /// The command this code lens represents.
    Command? command,
  }) = _CodeLens;

  factory CodeLens.fromJson(Map<String, dynamic> json) =>
      _$CodeLensFromJson(json);
}

/// Registration options for a {@link CodeLensRequest}.
@freezed
abstract class CodeLensRegistrationOptions with _$CodeLensRegistrationOptions {
  const factory CodeLensRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// Code lens has a resolve provider as well.
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _CodeLensRegistrationOptions;

  factory CodeLensRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkParams with _$DocumentLinkParams {
  const factory DocumentLinkParams({
    /// The document to provide document links for.
    required TextDocumentIdentifier textDocument,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentLinkParams;

  factory DocumentLinkParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkParamsFromJson(json);
}

/// A document link is a range in a text document that links to an
/// internal or external resource, like another text document or a
/// web site.
@freezed
abstract class DocumentLink with _$DocumentLink {
  const factory DocumentLink({
    /// The range this link applies to.
    required Range range,

    /// A data entry field that is preserved on a document link between a
    /// DocumentLinkRequest and a DocumentLinkResolveRequest.
    LSPAny? data,

    /// The tooltip text when you hover over this link.
    /// If a tooltip is provided, is will be displayed in a string that
    /// includes instructions on how to trigger the link, such as `{0} (ctrl +
    /// click)`. The specific instructions vary depending on OS, user settings,
    /// and localization.
    /// @since 3.15.0
    String? tooltip,

    /// The uri this link points to. If missing a resolve request is sent later.
    String? target,
  }) = _DocumentLink;

  factory DocumentLink.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkFromJson(json);
}

/// Registration options for a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkRegistrationOptions
    with _$DocumentLinkRegistrationOptions {
  const factory DocumentLinkRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// Document links have a resolve provider as well.
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _DocumentLinkRegistrationOptions;

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingParams with _$DocumentFormattingParams {
  const factory DocumentFormattingParams({
    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The format options.
    required FormattingOptions options,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentFormattingParams;

  factory DocumentFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingParamsFromJson(json);
}

/// Registration options for a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingRegistrationOptions
    with _$DocumentFormattingRegistrationOptions {
  const factory DocumentFormattingRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,
    bool? workDoneProgress,
  }) = _DocumentFormattingRegistrationOptions;

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingParams
    with _$DocumentRangeFormattingParams {
  const factory DocumentRangeFormattingParams({
    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The range to format
    required Range range,

    /// The format options
    required FormattingOptions options,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentRangeFormattingParams;

  factory DocumentRangeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingParamsFromJson(json);
}

/// Registration options for a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingRegistrationOptions
    with _$DocumentRangeFormattingRegistrationOptions {
  const factory DocumentRangeFormattingRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// Whether the server supports formatting multiple ranges at once.
    /// @since 3.18.0 @proposed
    bool? rangesSupport,
    bool? workDoneProgress,
  }) = _DocumentRangeFormattingRegistrationOptions;

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link DocumentRangesFormattingRequest}.
/// @since 3.18.0 @proposed
@freezed
abstract class DocumentRangesFormattingParams
    with _$DocumentRangesFormattingParams {
  const factory DocumentRangesFormattingParams({
    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The ranges to format
    required List<Range> ranges,

    /// The format options
    required FormattingOptions options,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _DocumentRangesFormattingParams;

  factory DocumentRangesFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangesFormattingParamsFromJson(json);
}

/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingParams
    with _$DocumentOnTypeFormattingParams {
  const factory DocumentOnTypeFormattingParams({
    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The position around which the on type formatting should happen. This is
    /// not necessarily the exact position where the character denoted by the
    /// property `ch` got typed.
    required Position position,

    /// The character that has been typed that triggered the formatting on type
    /// request. That is not necessarily the last character that got inserted
    /// into the document since the client could auto insert characters as well
    /// (e.g. like automatic brace completion).
    required String ch,

    /// The formatting options.
    required FormattingOptions options,
  }) = _DocumentOnTypeFormattingParams;

  factory DocumentOnTypeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingParamsFromJson(json);
}

/// Registration options for a {@link
/// DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingRegistrationOptions
    with _$DocumentOnTypeFormattingRegistrationOptions {
  const factory DocumentOnTypeFormattingRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// A character on which formatting should be triggered, like `{`.
    required String firstTriggerCharacter,

    /// More trigger characters.
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingRegistrationOptions;

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link RenameRequest}.
@freezed
abstract class RenameParams with _$RenameParams {
  const factory RenameParams({
    /// The document to rename.
    required TextDocumentIdentifier textDocument,

    /// The position at which this request was sent.
    required Position position,

    /// The new name of the symbol. If the given name is not valid the request
    /// must return a {@link ResponseError} with an appropriate message set.
    required String newName,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _RenameParams;

  factory RenameParams.fromJson(Map<String, dynamic> json) =>
      _$RenameParamsFromJson(json);
}

/// Registration options for a {@link RenameRequest}.
@freezed
abstract class RenameRegistrationOptions with _$RenameRegistrationOptions {
  const factory RenameRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set
    /// to null the document selector provided on the client side will be used.
    required TextDocumentRegistrationOptionsDocumentSelectorBase
    documentSelector,

    /// Renames should be checked and tested before being executed.
    /// @since version 3.12.0
    bool? prepareProvider,
    bool? workDoneProgress,
  }) = _RenameRegistrationOptions;

  factory RenameRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameRegistrationOptionsFromJson(json);
}

@freezed
abstract class PrepareRenameParams with _$PrepareRenameParams {
  const factory PrepareRenameParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _PrepareRenameParams;

  factory PrepareRenameParams.fromJson(Map<String, dynamic> json) =>
      _$PrepareRenameParamsFromJson(json);
}

/// The parameters of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandParams with _$ExecuteCommandParams {
  const factory ExecuteCommandParams({
    /// The identifier of the actual command handler.
    required String command,

    /// Arguments that the command should be invoked with.
    List<LSPAny>? arguments,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _ExecuteCommandParams;

  factory ExecuteCommandParams.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandParamsFromJson(json);
}

/// Registration options for a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandRegistrationOptions
    with _$ExecuteCommandRegistrationOptions {
  const factory ExecuteCommandRegistrationOptions({
    /// The commands to be executed on the server
    required List<String> commands,
    bool? workDoneProgress,
  }) = _ExecuteCommandRegistrationOptions;

  factory ExecuteCommandRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandRegistrationOptionsFromJson(json);
}

/// The parameters passed via an apply workspace edit request.
@freezed
abstract class ApplyWorkspaceEditParams with _$ApplyWorkspaceEditParams {
  const factory ApplyWorkspaceEditParams({
    /// The edits to apply.
    required WorkspaceEdit edit,

    /// An optional label of the workspace edit. This label is presented in the
    /// user interface for example on an undo stack to undo the workspace edit.
    String? label,
  }) = _ApplyWorkspaceEditParams;

  factory ApplyWorkspaceEditParams.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditParamsFromJson(json);
}

/// The result returned from the apply workspace edit request.
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
@freezed
abstract class ApplyWorkspaceEditResult with _$ApplyWorkspaceEditResult {
  const factory ApplyWorkspaceEditResult({
    /// Indicates whether the edit was applied or not.
    required bool applied,

    /// Depending on the client's failure handling strategy `failedChange`
    /// might contain the index of the change that failed. This property is
    /// only available if the client signals a `failureHandlingStrategy` in its
    /// client capabilities.
    int? failedChange,

    /// An optional textual description for why the edit was not applied. This
    /// may be used by the server for diagnostic logging or to provide a
    /// suitable error for a request that triggered the edit.
    String? failureReason,
  }) = _ApplyWorkspaceEditResult;

  factory ApplyWorkspaceEditResult.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditResultFromJson(json);
}

@freezed
abstract class WorkDoneProgressBegin with _$WorkDoneProgressBegin {
  const factory WorkDoneProgressBegin({
    required String kind,

    /// Mandatory title of the progress operation. Used to briefly inform about
    /// the kind of operation being performed.
    /// Examples: "Indexing" or "Linking dependencies".
    required String title,

    /// Optional progress percentage to display (value 100 is considered 100%).
    /// If not provided infinite progress is assumed and clients are allowed to
    /// ignore the `percentage` value in subsequent report notifications.
    /// The value should be steadily rising. Clients are free to ignore values
    /// that are not following this rule. The value range is [0, 100].
    int? percentage,

    /// Optional, more detailed associated progress message. Contains
    /// complementary information to the `title`.
    /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    /// If unset, the previous progress message (if any) is still valid.
    String? message,

    /// Controls if a cancel button should show to allow the user to cancel the
    /// long running operation. Clients that don't support cancellation are
    /// allowed to ignore the setting.
    bool? cancellable,
  }) = _WorkDoneProgressBegin;

  factory WorkDoneProgressBegin.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressBeginFromJson(json);
}

@freezed
abstract class WorkDoneProgressReport with _$WorkDoneProgressReport {
  const factory WorkDoneProgressReport({
    required String kind,

    /// Optional progress percentage to display (value 100 is considered 100%).
    /// If not provided infinite progress is assumed and clients are allowed to
    /// ignore the `percentage` value in subsequent report notifications.
    /// The value should be steadily rising. Clients are free to ignore values
    /// that are not following this rule. The value range is [0, 100].
    int? percentage,

    /// Optional, more detailed associated progress message. Contains
    /// complementary information to the `title`.
    /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    /// If unset, the previous progress message (if any) is still valid.
    String? message,

    /// Controls enablement state of a cancel button.
    /// Clients that don't support cancellation or don't support controlling
    /// the button's enablement state are allowed to ignore the property.
    bool? cancellable,
  }) = _WorkDoneProgressReport;

  factory WorkDoneProgressReport.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressReportFromJson(json);
}

@freezed
abstract class WorkDoneProgressEnd with _$WorkDoneProgressEnd {
  const factory WorkDoneProgressEnd({
    required String kind,

    /// Optional, a final message indicating to for example indicate the
    /// outcome of the operation.
    String? message,
  }) = _WorkDoneProgressEnd;

  factory WorkDoneProgressEnd.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressEndFromJson(json);
}

@freezed
abstract class SetTraceParams with _$SetTraceParams {
  const factory SetTraceParams({required TraceValues value}) = _SetTraceParams;

  factory SetTraceParams.fromJson(Map<String, dynamic> json) =>
      _$SetTraceParamsFromJson(json);
}

@freezed
abstract class LogTraceParams with _$LogTraceParams {
  const factory LogTraceParams({required String message, String? verbose}) =
      _LogTraceParams;

  factory LogTraceParams.fromJson(Map<String, dynamic> json) =>
      _$LogTraceParamsFromJson(json);
}

@freezed
abstract class CancelParams with _$CancelParams {
  const factory CancelParams({
    /// The request id to cancel.
    required ProgressTokenBase id,
  }) = _CancelParams;

  factory CancelParams.fromJson(Map<String, dynamic> json) =>
      _$CancelParamsFromJson(json);
}

@freezed
abstract class ProgressParams with _$ProgressParams {
  const factory ProgressParams({
    /// The progress token provided by the client or server.
    required ProgressToken token,

    /// The progress data.
    required LSPAny value,
  }) = _ProgressParams;

  factory ProgressParams.fromJson(Map<String, dynamic> json) =>
      _$ProgressParamsFromJson(json);
}

/// A parameter literal used in requests to pass a text document and
/// a position inside that document.
@freezed
abstract class TextDocumentPositionParams with _$TextDocumentPositionParams {
  const factory TextDocumentPositionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,
  }) = _TextDocumentPositionParams;

  factory TextDocumentPositionParams.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentPositionParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressParams with _$WorkDoneProgressParams {
  const factory WorkDoneProgressParams({
    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _WorkDoneProgressParams;

  factory WorkDoneProgressParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressParamsFromJson(json);
}

@freezed
abstract class PartialResultParams with _$PartialResultParams {
  const factory PartialResultParams({
    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    ProgressToken? partialResultToken,
  }) = _PartialResultParams;

  factory PartialResultParams.fromJson(Map<String, dynamic> json) =>
      _$PartialResultParamsFromJson(json);
}

/// Represents the connection of two locations. Provides additional
/// metadata over normal {@link Location locations}, including an
/// origin range.
@freezed
abstract class LocationLink with _$LocationLink {
  const factory LocationLink({
    /// The target resource identifier of this link.
    required String targetUri,

    /// The full target range of this link. If the target for example is a
    /// symbol then target range is the range enclosing this symbol not
    /// including leading/trailing whitespace but everything else like
    /// comments. This information is typically used to highlight the range in
    /// the editor.
    required Range targetRange,

    /// The range that should be selected and revealed when this link is being
    /// followed, e.g the name of a function. Must be contained by the
    /// `targetRange`. See also `DocumentSymbol#range`
    required Range targetSelectionRange,

    /// Span of the origin of this link.
    /// Used as the underlined span for mouse interaction. Defaults to the word
    /// range at the definition position.
    Range? originSelectionRange,
  }) = _LocationLink;

  factory LocationLink.fromJson(Map<String, dynamic> json) =>
      _$LocationLinkFromJson(json);
}

/// A range in a text document expressed as (zero-based) start and
/// end positions.
/// If you want to specify a range that contains a line including the
/// line ending character(s) then use an end position denoting the
/// start of the next line. For example: ```ts { start: { line: 5,
/// character: 23 } end : { line 6, character : 0 } } ```
@freezed
abstract class Range with _$Range {
  const factory Range({
    /// The range's start position.
    required Position start,

    /// The range's end position.
    required Position end,
  }) = _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

@freezed
abstract class ImplementationOptions with _$ImplementationOptions {
  const factory ImplementationOptions({bool? workDoneProgress}) =
      _ImplementationOptions;

  factory ImplementationOptions.fromJson(Map<String, dynamic> json) =>
      _$ImplementationOptionsFromJson(json);
}

/// Static registration options to be returned in the initialize
/// request.
@freezed
abstract class StaticRegistrationOptions with _$StaticRegistrationOptions {
  const factory StaticRegistrationOptions({
    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
  }) = _StaticRegistrationOptions;

  factory StaticRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$StaticRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionOptions with _$TypeDefinitionOptions {
  const factory TypeDefinitionOptions({bool? workDoneProgress}) =
      _TypeDefinitionOptions;

  factory TypeDefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionOptionsFromJson(json);
}

/// The workspace folder change event.
@freezed
abstract class WorkspaceFoldersChangeEvent with _$WorkspaceFoldersChangeEvent {
  const factory WorkspaceFoldersChangeEvent({
    /// The array of added workspace folders
    required List<WorkspaceFolder> added,

    /// The array of the removed workspace folders
    required List<WorkspaceFolder> removed,
  }) = _WorkspaceFoldersChangeEvent;

  factory WorkspaceFoldersChangeEvent.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFoldersChangeEventFromJson(json);
}

@freezed
abstract class ConfigurationItem with _$ConfigurationItem {
  const factory ConfigurationItem({
    /// The configuration section asked for.
    String? section,

    /// The scope to get the configuration section for.
    String? scopeUri,
  }) = _ConfigurationItem;

  factory ConfigurationItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationItemFromJson(json);
}

/// A literal to identify a text document in the client.
@freezed
abstract class TextDocumentIdentifier with _$TextDocumentIdentifier {
  const factory TextDocumentIdentifier({
    /// The text document's uri.
    required String uri,
  }) = _TextDocumentIdentifier;

  factory TextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentIdentifierFromJson(json);
}

/// Represents a color in RGBA space.
@freezed
abstract class Color with _$Color {
  const factory Color({
    /// The red component of this color in the range [0-1].
    required double red,

    /// The green component of this color in the range [0-1].
    required double green,

    /// The blue component of this color in the range [0-1].
    required double blue,

    /// The alpha component of this color in the range [0-1].
    required double alpha,
  }) = _Color;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}

@freezed
abstract class DocumentColorOptions with _$DocumentColorOptions {
  const factory DocumentColorOptions({bool? workDoneProgress}) =
      _DocumentColorOptions;

  factory DocumentColorOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorOptionsFromJson(json);
}

@freezed
abstract class FoldingRangeOptions with _$FoldingRangeOptions {
  const factory FoldingRangeOptions({bool? workDoneProgress}) =
      _FoldingRangeOptions;

  factory FoldingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeOptionsFromJson(json);
}

@freezed
abstract class DeclarationOptions with _$DeclarationOptions {
  const factory DeclarationOptions({bool? workDoneProgress}) =
      _DeclarationOptions;

  factory DeclarationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationOptionsFromJson(json);
}

/// Position in a text document expressed as zero-based line and
/// character offset. Prior to 3.17 the offsets were always based on
/// a UTF-16 string representation. So a string of the form `a𐐀b`
/// the character offset of the character `a` is 0, the character
/// offset of `𐐀` is 1 and the character offset of b is 3 since `𐐀`
/// is represented using two code units in UTF-16. Since 3.17 clients
/// and servers can agree on a different string encoding
/// representation (e.g. UTF-8). The client announces it's supported
/// encoding via the client capability
/// [`general.positionEncodings`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#clientCapabilities).
/// The value is an array of position encodings the client supports,
/// with decreasing preference (e.g. the encoding at index `0` is the
/// most preferred one). To stay backwards compatible the only
/// mandatory encoding is UTF-16 represented via the string `utf-16`.
/// The server can pick one of the encodings offered by the client
/// and signals that encoding back to the client via the initialize
/// result's property
/// [`capabilities.positionEncoding`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#serverCapabilities).
/// If the string value `utf-16` is missing from the client's
/// capability `general.positionEncodings` servers can safely assume
/// that the client supports UTF-16. If the server omits the position
/// encoding in its initialize result the encoding defaults to the
/// string value `utf-16`. Implementation considerations: since the
/// conversion from one encoding into another requires the content of
/// the file / line the conversion is best done where the file is
/// read which is usually on the server side.
/// Positions are line end character agnostic. So you can not specify
/// a position that denotes `\r|\n` or `\n|` where `|` represents the
/// character offset.
/// @since 3.17.0 - support for negotiated position encoding.
@freezed
abstract class Position with _$Position {
  const factory Position({
    /// Line position in a document (zero-based).
    /// If a line number is greater than the number of lines in a document, it
    /// defaults back to the number of lines in the document. If a line number
    /// is negative, it defaults to 0.
    required int line,

    /// Character offset on a line in a document (zero-based).
    /// The meaning of this offset is determined by the negotiated
    /// `PositionEncodingKind`.
    /// If the character value is greater than the line length it defaults back
    /// to the line length.
    required int character,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
abstract class SelectionRangeOptions with _$SelectionRangeOptions {
  const factory SelectionRangeOptions({bool? workDoneProgress}) =
      _SelectionRangeOptions;

  factory SelectionRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeOptionsFromJson(json);
}

/// Call hierarchy options used during static registration.
/// @since 3.16.0
@freezed
abstract class CallHierarchyOptions with _$CallHierarchyOptions {
  const factory CallHierarchyOptions({bool? workDoneProgress}) =
      _CallHierarchyOptions;

  factory CallHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOptionsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensOptions with _$SemanticTokensOptions {
  const factory SemanticTokensOptions({
    /// The legend used by the server
    required SemanticTokensLegend legend,

    /// Server supports providing semantic tokens for a full document.
    SemanticTokensOptionsFullBase? full,

    /// Server supports providing semantic tokens for a specific range of a
    /// document.
    RangeBase? range,
    bool? workDoneProgress,
  }) = _SemanticTokensOptions;

  factory SemanticTokensOptions.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensOptionsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensEdit with _$SemanticTokensEdit {
  const factory SemanticTokensEdit({
    /// The start offset of the edit.
    required int start,

    /// The count of elements to remove.
    required int deleteCount,

    /// The elements to insert.
    List<int>? data,
  }) = _SemanticTokensEdit;

  factory SemanticTokensEdit.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensEditFromJson(json);
}

@freezed
abstract class LinkedEditingRangeOptions with _$LinkedEditingRangeOptions {
  const factory LinkedEditingRangeOptions({bool? workDoneProgress}) =
      _LinkedEditingRangeOptions;

  factory LinkedEditingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeOptionsFromJson(json);
}

/// Represents information on a file/folder create.
/// @since 3.16.0
@freezed
abstract class FileCreate with _$FileCreate {
  const factory FileCreate({
    /// A file:// URI for the location of the file/folder being created.
    required String uri,
  }) = _FileCreate;

  factory FileCreate.fromJson(Map<String, dynamic> json) =>
      _$FileCreateFromJson(json);
}

/// Describes textual changes on a text document. A TextDocumentEdit
/// describes all changes on a document version Si and after they are
/// applied move the document to version Si+1. So the creator of a
/// TextDocumentEdit doesn't need to sort the array of edits or do
/// any kind of ordering. However the edits must be non overlapping.
@freezed
abstract class TextDocumentEdit with _$TextDocumentEdit {
  const factory TextDocumentEdit({
    /// The text document to change.
    required OptionalVersionedTextDocumentIdentifier textDocument,

    /// The edits to be applied.
    /// @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
    /// client capability.
    required List<TextDocumentEditEditsBase> edits,
  }) = _TextDocumentEdit;

  factory TextDocumentEdit.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentEditFromJson(json);
}

/// Create file operation.
@freezed
abstract class CreateFile with _$CreateFile {
  const factory CreateFile({
    /// A create
    required String kind,

    /// The resource to create.
    required String uri,

    /// Additional options
    CreateFileOptions? options,

    /// An optional annotation identifier describing the operation.
    /// @since 3.16.0
    ChangeAnnotationIdentifier? annotationId,
  }) = _CreateFile;

  factory CreateFile.fromJson(Map<String, dynamic> json) =>
      _$CreateFileFromJson(json);
}

/// Rename file operation
@freezed
abstract class RenameFile with _$RenameFile {
  const factory RenameFile({
    /// A rename
    required String kind,

    /// The old (existing) location.
    required String oldUri,

    /// The new location.
    required String newUri,

    /// Rename options.
    RenameFileOptions? options,

    /// An optional annotation identifier describing the operation.
    /// @since 3.16.0
    ChangeAnnotationIdentifier? annotationId,
  }) = _RenameFile;

  factory RenameFile.fromJson(Map<String, dynamic> json) =>
      _$RenameFileFromJson(json);
}

/// Delete file operation
@freezed
abstract class DeleteFile with _$DeleteFile {
  const factory DeleteFile({
    /// A delete
    required String kind,

    /// The file to delete.
    required String uri,

    /// Delete options.
    DeleteFileOptions? options,

    /// An optional annotation identifier describing the operation.
    /// @since 3.16.0
    ChangeAnnotationIdentifier? annotationId,
  }) = _DeleteFile;

  factory DeleteFile.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileFromJson(json);
}

/// Additional information that describes document changes.
/// @since 3.16.0
@freezed
abstract class ChangeAnnotation with _$ChangeAnnotation {
  const factory ChangeAnnotation({
    /// A human-readable string describing the actual change. The string is
    /// rendered prominent in the user interface.
    required String label,

    /// A human-readable string which is rendered less prominent in the user
    /// interface.
    String? description,

    /// A flag which indicates that user confirmation is needed before applying
    /// the change.
    bool? needsConfirmation,
  }) = _ChangeAnnotation;

  factory ChangeAnnotation.fromJson(Map<String, dynamic> json) =>
      _$ChangeAnnotationFromJson(json);
}

/// A filter to describe in which file operation requests or
/// notifications the server is interested in receiving.
/// @since 3.16.0
@freezed
abstract class FileOperationFilter with _$FileOperationFilter {
  const factory FileOperationFilter({
    /// The actual file operation pattern.
    required FileOperationPattern pattern,

    /// A Uri scheme like `file` or `untitled`.
    String? scheme,
  }) = _FileOperationFilter;

  factory FileOperationFilter.fromJson(Map<String, dynamic> json) =>
      _$FileOperationFilterFromJson(json);
}

/// Represents information on a file/folder rename.
/// @since 3.16.0
@freezed
abstract class FileRename with _$FileRename {
  const factory FileRename({
    /// A file:// URI for the original location of the file/folder being
    /// renamed.
    required String oldUri,

    /// A file:// URI for the new location of the file/folder being renamed.
    required String newUri,
  }) = _FileRename;

  factory FileRename.fromJson(Map<String, dynamic> json) =>
      _$FileRenameFromJson(json);
}

/// Represents information on a file/folder delete.
/// @since 3.16.0
@freezed
abstract class FileDelete with _$FileDelete {
  const factory FileDelete({
    /// A file:// URI for the location of the file/folder being deleted.
    required String uri,
  }) = _FileDelete;

  factory FileDelete.fromJson(Map<String, dynamic> json) =>
      _$FileDeleteFromJson(json);
}

@freezed
abstract class MonikerOptions with _$MonikerOptions {
  const factory MonikerOptions({bool? workDoneProgress}) = _MonikerOptions;

  factory MonikerOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerOptionsFromJson(json);
}

/// Type hierarchy options used during static registration.
/// @since 3.17.0
@freezed
abstract class TypeHierarchyOptions with _$TypeHierarchyOptions {
  const factory TypeHierarchyOptions({bool? workDoneProgress}) =
      _TypeHierarchyOptions;

  factory TypeHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyOptionsFromJson(json);
}

/// @since 3.17.0
@freezed
abstract class InlineValueContext with _$InlineValueContext {
  const factory InlineValueContext({
    /// The stack frame (as a DAP Id) where the execution has stopped.
    required int frameId,

    /// The document range where execution has stopped. Typically the end
    /// position of the range denotes the line where the inline values are
    /// shown.
    required Range stoppedLocation,
  }) = _InlineValueContext;

  factory InlineValueContext.fromJson(Map<String, dynamic> json) =>
      _$InlineValueContextFromJson(json);
}

/// Provide inline value as text.
/// @since 3.17.0
@freezed
abstract class InlineValueText with _$InlineValueText {
  const factory InlineValueText({
    /// The document range for which the inline value applies.
    required Range range,

    /// The text of the inline value.
    required String text,
  }) = _InlineValueText;

  factory InlineValueText.fromJson(Map<String, dynamic> json) =>
      _$InlineValueTextFromJson(json);
}

/// Provide inline value through a variable lookup. If only a range
/// is specified, the variable name will be extracted from the
/// underlying document. An optional variable name can be used to
/// override the extracted name.
/// @since 3.17.0
@freezed
abstract class InlineValueVariableLookup with _$InlineValueVariableLookup {
  const factory InlineValueVariableLookup({
    /// The document range for which the inline value applies. The range is
    /// used to extract the variable name from the underlying document.
    required Range range,

    /// How to perform the lookup.
    required bool caseSensitiveLookup,

    /// If specified the name of the variable to look up.
    String? variableName,
  }) = _InlineValueVariableLookup;

  factory InlineValueVariableLookup.fromJson(Map<String, dynamic> json) =>
      _$InlineValueVariableLookupFromJson(json);
}

/// Provide an inline value through an expression evaluation. If only
/// a range is specified, the expression will be extracted from the
/// underlying document. An optional expression can be used to
/// override the extracted expression.
/// @since 3.17.0
@freezed
abstract class InlineValueEvaluatableExpression
    with _$InlineValueEvaluatableExpression {
  const factory InlineValueEvaluatableExpression({
    /// The document range for which the inline value applies. The range is
    /// used to extract the evaluatable expression from the underlying
    /// document.
    required Range range,

    /// If specified the expression overrides the extracted expression.
    String? expression,
  }) = _InlineValueEvaluatableExpression;

  factory InlineValueEvaluatableExpression.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueEvaluatableExpressionFromJson(json);
}

/// Inline value options used during static registration.
/// @since 3.17.0
@freezed
abstract class InlineValueOptions with _$InlineValueOptions {
  const factory InlineValueOptions({bool? workDoneProgress}) =
      _InlineValueOptions;

  factory InlineValueOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueOptionsFromJson(json);
}

/// An inlay hint label part allows for interactive and composite
/// labels of inlay hints.
/// @since 3.17.0
@freezed
abstract class InlayHintLabelPart with _$InlayHintLabelPart {
  const factory InlayHintLabelPart({
    /// The value of this label part.
    required String value,

    /// An optional command for this label part.
    /// Depending on the client capability `inlayHint.resolveSupport` clients
    /// might resolve this property late using the resolve request.
    Command? command,

    /// An optional source code location that represents this label part.
    /// The editor will use this location for the hover and for code navigation
    /// features: This part will become a clickable link that resolves to the
    /// definition of the symbol at the given location (not necessarily the
    /// location itself), it shows the hover that shows at the given location,
    /// and it shows a context menu with further code navigation commands.
    /// Depending on the client capability `inlayHint.resolveSupport` clients
    /// might resolve this property late using the resolve request.
    Location? location,

    /// The tooltip text when you hover over this label part. Depending on the
    /// client capability `inlayHint.resolveSupport` clients might resolve this
    /// property late using the resolve request.
    TooltipOrDocumentationBase? tooltip,
  }) = _InlayHintLabelPart;

  factory InlayHintLabelPart.fromJson(Map<String, dynamic> json) =>
      _$InlayHintLabelPartFromJson(json);
}

/// A `MarkupContent` literal represents a string value which content
/// is interpreted base on its kind flag. Currently the protocol
/// supports `plaintext` and `markdown` as markup kinds.
/// If the kind is `markdown` then the value can contain fenced code
/// blocks like in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
/// Here is an example how such a string can be constructed using
/// JavaScript / TypeScript: ```ts let markdown: MarkdownContent = {
/// kind: MarkupKind.Markdown, value: [ '# Header', 'Some text',
/// '```typescript', 'someCode();', '```' ].join('\n') }; ```
/// *Please Note* that clients might sanitize the return markdown. A
/// client could decide to remove HTML from the markdown to avoid
/// script execution.
@freezed
abstract class MarkupContent with _$MarkupContent {
  const factory MarkupContent({
    /// The type of the Markup
    required MarkupKind kind,

    /// The content itself
    required String value,
  }) = _MarkupContent;

  factory MarkupContent.fromJson(Map<String, dynamic> json) =>
      _$MarkupContentFromJson(json);
}

/// Inlay hint options used during static registration.
/// @since 3.17.0
@freezed
abstract class InlayHintOptions with _$InlayHintOptions {
  const factory InlayHintOptions({
    /// The server provides support to resolve additional information for an
    /// inlay hint item.
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _InlayHintOptions;

  factory InlayHintOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintOptionsFromJson(json);
}

/// A full diagnostic report with a set of related documents.
/// @since 3.17.0
@freezed
abstract class RelatedFullDocumentDiagnosticReport
    with _$RelatedFullDocumentDiagnosticReport {
  const factory RelatedFullDocumentDiagnosticReport({
    /// A full document diagnostic report.
    required String kind,

    /// The actual items.
    required List<Diagnostic> items,

    /// Diagnostics of related documents. This information is useful in
    /// programming languages where code in a file A can generate diagnostics
    /// in a file B which A depends on. An example of such a language is C/C++
    /// where marco definitions in a file a.cpp and result in errors in a
    /// header file b.hpp.
    /// @since 3.17.0
    Map<String, RelatedDocumentsBase>? relatedDocuments,

    /// An optional result id. If provided it will be sent on the next
    /// diagnostic request for the same document.
    String? resultId,
  }) = _RelatedFullDocumentDiagnosticReport;

  factory RelatedFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedFullDocumentDiagnosticReportFromJson(json);
}

/// An unchanged diagnostic report with a set of related documents.
/// @since 3.17.0
@freezed
abstract class RelatedUnchangedDocumentDiagnosticReport
    with _$RelatedUnchangedDocumentDiagnosticReport {
  const factory RelatedUnchangedDocumentDiagnosticReport({
    /// A document diagnostic report indicating no changes to the last result.
    /// A server can only return `unchanged` if result ids are provided.
    required String kind,

    /// A result id which will be sent on the next diagnostic request for the
    /// same document.
    required String resultId,

    /// Diagnostics of related documents. This information is useful in
    /// programming languages where code in a file A can generate diagnostics
    /// in a file B which A depends on. An example of such a language is C/C++
    /// where marco definitions in a file a.cpp and result in errors in a
    /// header file b.hpp.
    /// @since 3.17.0
    Map<String, RelatedDocumentsBase>? relatedDocuments,
  }) = _RelatedUnchangedDocumentDiagnosticReport;

  factory RelatedUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedUnchangedDocumentDiagnosticReportFromJson(json);
}

/// A diagnostic report with a full set of problems.
/// @since 3.17.0
@freezed
abstract class FullDocumentDiagnosticReport
    with _$FullDocumentDiagnosticReport {
  const factory FullDocumentDiagnosticReport({
    /// A full document diagnostic report.
    required String kind,

    /// The actual items.
    required List<Diagnostic> items,

    /// An optional result id. If provided it will be sent on the next
    /// diagnostic request for the same document.
    String? resultId,
  }) = _FullDocumentDiagnosticReport;

  factory FullDocumentDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$FullDocumentDiagnosticReportFromJson(json);
}

/// A diagnostic report indicating that the last returned report is
/// still accurate.
/// @since 3.17.0
@freezed
abstract class UnchangedDocumentDiagnosticReport
    with _$UnchangedDocumentDiagnosticReport {
  const factory UnchangedDocumentDiagnosticReport({
    /// A document diagnostic report indicating no changes to the last result.
    /// A server can only return `unchanged` if result ids are provided.
    required String kind,

    /// A result id which will be sent on the next diagnostic request for the
    /// same document.
    required String resultId,
  }) = _UnchangedDocumentDiagnosticReport;

  factory UnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$UnchangedDocumentDiagnosticReportFromJson(json);
}

/// Diagnostic options.
/// @since 3.17.0
@freezed
abstract class DiagnosticOptions with _$DiagnosticOptions {
  const factory DiagnosticOptions({
    /// Whether the language has inter file dependencies meaning that editing
    /// code in one file can result in a different diagnostic set in another
    /// file. Inter file dependencies are common for most programming languages
    /// and typically uncommon for linters.
    required bool interFileDependencies,

    /// The server provides support for workspace diagnostics as well.
    required bool workspaceDiagnostics,

    /// An optional identifier under which the diagnostics are managed by the
    /// client.
    String? identifier,
    bool? workDoneProgress,
  }) = _DiagnosticOptions;

  factory DiagnosticOptions.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticOptionsFromJson(json);
}

/// A previous result id in a workspace pull request.
/// @since 3.17.0
@freezed
abstract class PreviousResultId with _$PreviousResultId {
  const factory PreviousResultId({
    /// The URI for which the client knowns a result id.
    required String uri,

    /// The value of the previous result id.
    required String value,
  }) = _PreviousResultId;

  factory PreviousResultId.fromJson(Map<String, dynamic> json) =>
      _$PreviousResultIdFromJson(json);
}

/// A notebook document.
/// @since 3.17.0
@freezed
abstract class NotebookDocument with _$NotebookDocument {
  const factory NotebookDocument({
    /// The notebook document's uri.
    required String uri,

    /// The type of the notebook.
    required String notebookType,

    /// The version number of this document (it will increase after each
    /// change, including undo/redo).
    required int version,

    /// The cells of a notebook.
    required List<NotebookCell> cells,

    /// Additional metadata stored with the notebook document.
    /// Note: should always be an object literal (e.g. LSPObject)
    LSPObject? metadata,
  }) = _NotebookDocument;

  factory NotebookDocument.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentFromJson(json);
}

/// An item to transfer a text document from the client to the server.
@freezed
abstract class TextDocumentItem with _$TextDocumentItem {
  const factory TextDocumentItem({
    /// The text document's uri.
    required String uri,

    /// The text document's language identifier.
    required String languageId,

    /// The version number of this document (it will increase after each
    /// change, including undo/redo).
    required int version,

    /// The content of the opened text document.
    required String text,
  }) = _TextDocumentItem;

  factory TextDocumentItem.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentItemFromJson(json);
}

/// A versioned notebook document identifier.
/// @since 3.17.0
@freezed
abstract class VersionedNotebookDocumentIdentifier
    with _$VersionedNotebookDocumentIdentifier {
  const factory VersionedNotebookDocumentIdentifier({
    /// The version number of this notebook document.
    required int version,

    /// The notebook document's uri.
    required String uri,
  }) = _VersionedNotebookDocumentIdentifier;

  factory VersionedNotebookDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) => _$VersionedNotebookDocumentIdentifierFromJson(json);
}

/// A change event for a notebook document.
/// @since 3.17.0
@freezed
abstract class NotebookDocumentChangeEvent with _$NotebookDocumentChangeEvent {
  const factory NotebookDocumentChangeEvent({
    /// Changes to cells
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

    /// The changed meta data if any.
    /// Note: should always be an object literal (e.g. LSPObject)
    LSPObject? metadata,
  }) = _NotebookDocumentChangeEvent;

  factory NotebookDocumentChangeEvent.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentChangeEventFromJson(json);
}

/// A literal to identify a notebook document in the client.
/// @since 3.17.0
@freezed
abstract class NotebookDocumentIdentifier with _$NotebookDocumentIdentifier {
  const factory NotebookDocumentIdentifier({
    /// The notebook document's uri.
    required String uri,
  }) = _NotebookDocumentIdentifier;

  factory NotebookDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentIdentifierFromJson(json);
}

/// Provides information about the context in which an inline
/// completion was requested.
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionContext with _$InlineCompletionContext {
  const factory InlineCompletionContext({
    /// Describes how the inline completion was triggered.
    required InlineCompletionTriggerKind triggerKind,

    /// Provides information about the currently selected item in the
    /// autocomplete widget if it is visible.
    SelectedCompletionInfo? selectedCompletionInfo,
  }) = _InlineCompletionContext;

  factory InlineCompletionContext.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionContextFromJson(json);
}

/// A string value used as a snippet is a template which allows to
/// insert text and to control the editor cursor when insertion
/// happens.
/// A snippet can define tab stops and placeholders with `$1`, `$2`
/// and `${3:foo}`. `$0` defines the final tab stop, it defaults to
/// the end of the snippet. Variables are defined with `$name` and
/// `${name:default value}`.
/// @since 3.18.0 @proposed
@freezed
abstract class StringValue with _$StringValue {
  const factory StringValue({
    /// The kind of string value.
    required String kind,

    /// The snippet string.
    required String value,
  }) = _StringValue;

  factory StringValue.fromJson(Map<String, dynamic> json) =>
      _$StringValueFromJson(json);
}

/// Inline completion options used during static registration.
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionOptions with _$InlineCompletionOptions {
  const factory InlineCompletionOptions({bool? workDoneProgress}) =
      _InlineCompletionOptions;

  factory InlineCompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionOptionsFromJson(json);
}

/// General parameters to register for a notification or to register
/// a provider.
@freezed
abstract class Registration with _$Registration {
  const factory Registration({
    /// The id used to register the request. The id can be used to deregister
    /// the request again.
    required String id,

    /// The method / capability to register for.
    required String method,

    /// Options necessary for the registration.
    LSPAny? registerOptions,
  }) = _Registration;

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);
}

/// General parameters to unregister a request or notification.
@freezed
abstract class Unregistration with _$Unregistration {
  const factory Unregistration({
    /// The id used to unregister the request or notification. Usually an id
    /// provided during the register request.
    required String id,

    /// The method to unregister for.
    required String method,
  }) = _Unregistration;

  factory Unregistration.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationFromJson(json);
}

/// The initialize parameters
@freezed
abstract class TInitializeParams with _$TInitializeParams {
  const factory TInitializeParams({
    /// The process Id of the parent process that started the server.
    /// Is `null` if the process has not been started by another process. If
    /// the parent process is not alive then the server should exit.
    required ProcessIdOrVersionBase processId,

    /// The rootUri of the workspace. Is null if no folder is open. If both
    /// `rootPath` and `rootUri` are set `rootUri` wins.
    /// @deprecated in favour of workspaceFolders.
    required InitializeParamsRootUriBase rootUri,

    /// The capabilities provided by the client (editor or tool)
    required ClientCapabilities capabilities,

    /// The initial trace setting. If omitted trace is disabled ('off').
    TraceValues? trace,

    /// User provided initialization options.
    LSPAny? initializationOptions,

    /// The rootPath of the workspace. Is null if no folder is open.
    /// @deprecated in favour of rootUri.
    InitializeParamsRootPathBase? rootPath,

    /// The locale the client is currently showing the user interface in. This
    /// must not necessarily be the locale of the operating system.
    /// Uses IETF language tags as the value's syntax (See
    /// https://en.wikipedia.org/wiki/IETF_language_tag)
    /// @since 3.16.0
    String? locale,

    /// Information about the client
    /// @since 3.15.0
    ({String name, String? version})? clientInfo,

    /// An optional token that a server can use to report work done progress.
    ProgressToken? workDoneToken,
  }) = _TInitializeParams;

  factory TInitializeParams.fromJson(Map<String, dynamic> json) =>
      _$TInitializeParamsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersInitializeParams
    with _$WorkspaceFoldersInitializeParams {
  const factory WorkspaceFoldersInitializeParams({
    /// The workspace folders configured in the client when the server starts.
    /// This property is only available if the client supports workspace
    /// folders. It can be `null` if the client supports workspace folders but
    /// none are configured.
    /// @since 3.6.0
    WorkspaceFoldersInitializeParamsWorkspaceFoldersBase? workspaceFolders,
  }) = _WorkspaceFoldersInitializeParams;

  factory WorkspaceFoldersInitializeParams.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersInitializeParamsFromJson(json);
}

/// Defines the capabilities provided by a language server.
@freezed
abstract class ServerCapabilities with _$ServerCapabilities {
  const factory ServerCapabilities({
    /// The server provides workspace symbol support.
    ServerCapabilitiesWorkspaceSymbolProviderBase? workspaceSymbolProvider,

    /// The server provides document highlight support.
    ServerCapabilitiesDocumentHighlightProviderBase? documentHighlightProvider,

    /// The server provides document formatting.
    ServerCapabilitiesDocumentFormattingProviderBase?
    documentFormattingProvider,

    /// The server provides code actions. CodeActionOptions may only be
    /// specified if the client states that it supports
    /// `codeActionLiteralSupport` in its initial `initialize` request.
    ServerCapabilitiesCodeActionProviderBase? codeActionProvider,

    /// The server provides completion support.
    CompletionOptions? completionProvider,

    /// Workspace specific server capabilities.
    ({
      WorkspaceFoldersServerCapabilities? workspaceFolders,
      FileOperationOptions? fileOperations,
    })?
    workspace,

    /// Inline completion options used during static registration.
    /// @since 3.18.0 @proposed
    ServerCapabilitiesInlineCompletionProviderBase? inlineCompletionProvider,

    /// The server has support for pull model diagnostics.
    /// @since 3.17.0
    ServerCapabilitiesDiagnosticProviderBase? diagnosticProvider,

    /// The server provides inlay hints.
    /// @since 3.17.0
    ServerCapabilitiesInlayHintProviderBase? inlayHintProvider,

    /// The server provides goto definition support.
    ServerCapabilitiesDefinitionProviderBase? definitionProvider,

    /// The server provides Goto Declaration support.
    ServerCapabilitiesDeclarationProviderBase? declarationProvider,

    /// The server provides moniker support.
    /// @since 3.16.0
    ServerCapabilitiesMonikerProviderBase? monikerProvider,

    /// The server provides semantic tokens support.
    /// @since 3.16.0
    ServerCapabilitiesSemanticTokensProviderBase? semanticTokensProvider,

    /// The server provides linked editing range support.
    /// @since 3.16.0
    ServerCapabilitiesLinkedEditingRangeProviderBase?
    linkedEditingRangeProvider,

    /// The server provides call hierarchy support.
    /// @since 3.16.0
    ServerCapabilitiesCallHierarchyProviderBase? callHierarchyProvider,

    /// The server provides execute command support.
    ExecuteCommandOptions? executeCommandProvider,

    /// Defines how text documents are synced. Is either a detailed structure
    /// defining each notification or for backwards compatibility the
    /// TextDocumentSyncKind number.
    ServerCapabilitiesTextDocumentSyncBase? textDocumentSync,

    /// The server provides folding provider support.
    ServerCapabilitiesFoldingRangeProviderBase? foldingRangeProvider,

    /// The server provides rename support. RenameOptions may only be specified
    /// if the client states that it supports `prepareSupport` in its initial
    /// `initialize` request.
    ServerCapabilitiesRenameProviderBase? renameProvider,

    /// The server provides document formatting on typing.
    DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider,

    /// The server provides document range formatting.
    ServerCapabilitiesDocumentRangeFormattingProviderBase?
    documentRangeFormattingProvider,

    /// Experimental server capabilities.
    LSPAny? experimental,

    /// The server provides selection range support.
    ServerCapabilitiesSelectionRangeProviderBase? selectionRangeProvider,

    /// The server provides color provider support.
    ServerCapabilitiesColorProviderBase? colorProvider,

    /// The server provides document link support.
    DocumentLinkOptions? documentLinkProvider,

    /// The server provides code lens.
    CodeLensOptions? codeLensProvider,

    /// Defines how notebook documents are synced.
    /// @since 3.17.0
    ServerCapabilitiesNotebookDocumentSyncBase? notebookDocumentSync,

    /// The server provides document symbol support.
    ServerCapabilitiesDocumentSymbolProviderBase? documentSymbolProvider,

    /// The position encoding the server picked from the encodings offered by
    /// the client via the client capability `general.positionEncodings`.
    /// If the client didn't provide any position encodings the only valid
    /// value that a server can return is 'utf-16'.
    /// If omitted it defaults to 'utf-16'.
    /// @since 3.17.0
    PositionEncodingKind? positionEncoding,

    /// The server provides find references support.
    ServerCapabilitiesReferencesProviderBase? referencesProvider,

    /// The server provides Goto Implementation support.
    ServerCapabilitiesImplementationProviderBase? implementationProvider,

    /// The server provides Goto Type Definition support.
    ServerCapabilitiesTypeDefinitionProviderBase? typeDefinitionProvider,

    /// The server provides inline values.
    /// @since 3.17.0
    ServerCapabilitiesInlineValueProviderBase? inlineValueProvider,

    /// The server provides type hierarchy support.
    /// @since 3.17.0
    ServerCapabilitiesTypeHierarchyProviderBase? typeHierarchyProvider,

    /// The server provides signature help support.
    SignatureHelpOptions? signatureHelpProvider,

    /// The server provides hover support.
    ServerCapabilitiesHoverProviderBase? hoverProvider,
  }) = _ServerCapabilities;

  factory ServerCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ServerCapabilitiesFromJson(json);
}

/// A text document identifier to denote a specific version of a text
/// document.
@freezed
abstract class VersionedTextDocumentIdentifier
    with _$VersionedTextDocumentIdentifier {
  const factory VersionedTextDocumentIdentifier({
    /// The text document's uri.
    required String uri,

    /// The version number of this document.
    required int version,
  }) = _VersionedTextDocumentIdentifier;

  factory VersionedTextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$VersionedTextDocumentIdentifierFromJson(json);
}

/// Save options.
@freezed
abstract class SaveOptions with _$SaveOptions {
  const factory SaveOptions({
    /// The client is supposed to include the content on save.
    bool? includeText,
  }) = _SaveOptions;

  factory SaveOptions.fromJson(Map<String, dynamic> json) =>
      _$SaveOptionsFromJson(json);
}

/// An event describing a file change.
@freezed
abstract class FileEvent with _$FileEvent {
  const factory FileEvent({
    /// The file's uri.
    required String uri,

    /// The change type.
    required FileChangeType type,
  }) = _FileEvent;

  factory FileEvent.fromJson(Map<String, dynamic> json) =>
      _$FileEventFromJson(json);
}

@freezed
abstract class FileSystemWatcher with _$FileSystemWatcher {
  const factory FileSystemWatcher({
    /// The glob pattern to watch. See {@link GlobPattern glob pattern} for
    /// more detail.
    /// @since 3.17.0 support for relative patterns.
    required GlobPattern globPattern,

    /// The kind of events of interest. If omitted it defaults to
    /// WatchKind.Create | WatchKind.Change | WatchKind.Delete which is 7.
    WatchKind? kind,
  }) = _FileSystemWatcher;

  factory FileSystemWatcher.fromJson(Map<String, dynamic> json) =>
      _$FileSystemWatcherFromJson(json);
}

/// Represents a diagnostic, such as a compiler error or warning.
/// Diagnostic objects are only valid in the scope of a resource.
@freezed
abstract class Diagnostic with _$Diagnostic {
  const factory Diagnostic({
    /// The range at which the message applies
    required Range range,

    /// The diagnostic's message. It usually appears in the user interface
    required String message,

    /// A data entry field that is preserved between a
    /// `textDocument/publishDiagnostics` notification and
    /// `textDocument/codeAction` request.
    /// @since 3.16.0
    LSPAny? data,

    /// An array of related diagnostic information, e.g. when symbol-names
    /// within a scope collide all definitions can be marked via this property.
    List<DiagnosticRelatedInformation>? relatedInformation,

    /// Additional metadata about the diagnostic.
    /// @since 3.15.0
    List<DiagnosticTag>? tags,

    /// A human-readable string describing the source of this diagnostic, e.g.
    /// 'typescript' or 'super lint'. It usually appears in the user interface.
    String? source,

    /// An optional property to describe the error code. Requires the code
    /// field (above) to be present/not null.
    /// @since 3.16.0
    CodeDescription? codeDescription,

    /// The diagnostic's code, which usually appear in the user interface.
    ProgressTokenBase? code,

    /// The diagnostic's severity. Can be omitted. If omitted it is up to the
    /// client to interpret diagnostics as error, warning, info or hint.
    DiagnosticSeverity? severity,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}

/// Contains additional information about the context in which a
/// completion request is triggered.
@freezed
abstract class CompletionContext with _$CompletionContext {
  const factory CompletionContext({
    /// How the completion was triggered.
    required CompletionTriggerKind triggerKind,

    /// The trigger character (a single character) that has trigger code
    /// complete. Is undefined if `triggerKind !==
    /// CompletionTriggerKind.TriggerCharacter`
    String? triggerCharacter,
  }) = _CompletionContext;

  factory CompletionContext.fromJson(Map<String, dynamic> json) =>
      _$CompletionContextFromJson(json);
}

/// Additional details for a completion item label.
/// @since 3.17.0
@freezed
abstract class CompletionItemLabelDetails with _$CompletionItemLabelDetails {
  const factory CompletionItemLabelDetails({
    /// An optional string which is rendered less prominently after {@link
    /// CompletionItem.detail}. Should be used for fully qualified names and
    /// file paths.
    String? description,

    /// An optional string which is rendered less prominently directly after
    /// {@link CompletionItem.label label}, without any spacing. Should be used
    /// for function signatures and type annotations.
    String? detail,
  }) = _CompletionItemLabelDetails;

  factory CompletionItemLabelDetails.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemLabelDetailsFromJson(json);
}

/// A special text edit to provide an insert and a replace operation.
/// @since 3.16.0
@freezed
abstract class InsertReplaceEdit with _$InsertReplaceEdit {
  const factory InsertReplaceEdit({
    /// The string to be inserted.
    required String newText,

    /// The range if the insert is requested
    required Range insert,

    /// The range if the replace is requested.
    required Range replace,
  }) = _InsertReplaceEdit;

  factory InsertReplaceEdit.fromJson(Map<String, dynamic> json) =>
      _$InsertReplaceEditFromJson(json);
}

/// Completion options.
@freezed
abstract class CompletionOptions with _$CompletionOptions {
  const factory CompletionOptions({
    /// The server supports the following `CompletionItem` specific
    /// capabilities.
    /// @since 3.17.0
    ({bool? labelDetailsSupport})? completionItem,

    /// The server provides support to resolve additional information for a
    /// completion item.
    bool? resolveProvider,

    /// The list of all possible characters that commit a completion. This
    /// field can be used if clients don't support individual commit characters
    /// per completion item. See
    /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    /// If a server provides both `allCommitCharacters` and commit characters
    /// on an individual completion item the ones on the completion item win.
    /// @since 3.2.0
    List<String>? allCommitCharacters,

    /// Most tools trigger completion request automatically without explicitly
    /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
    /// they do so when the user starts to type an identifier. For example if
    /// the user types `c` in a JavaScript file code complete will
    /// automatically pop up present `console` besides others as a completion
    /// item. Characters that make up identifiers don't need to be listed here.
    /// If code complete should automatically be trigger on characters not
    /// being valid inside an identifier (for example `.` in JavaScript) list
    /// them in `triggerCharacters`.
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _CompletionOptions;

  factory CompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$CompletionOptionsFromJson(json);
}

/// Hover options.
@freezed
abstract class HoverOptions with _$HoverOptions {
  const factory HoverOptions({bool? workDoneProgress}) = _HoverOptions;

  factory HoverOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverOptionsFromJson(json);
}

/// Additional information about the context in which a signature
/// help request was triggered.
/// @since 3.15.0
@freezed
abstract class SignatureHelpContext with _$SignatureHelpContext {
  const factory SignatureHelpContext({
    /// Action that caused signature help to be triggered.
    required SignatureHelpTriggerKind triggerKind,

    /// `true` if signature help was already showing when it was triggered.
    /// Retriggers occurs when the signature help is already active and can be
    /// caused by actions such as typing a trigger character, a cursor move, or
    /// document content changes.
    required bool isRetrigger,

    /// The currently active `SignatureHelp`.
    /// The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field
    /// updated based on the user navigating through available signatures.
    SignatureHelp? activeSignatureHelp,

    /// Character that caused signature help to be triggered.
    /// This is undefined when `triggerKind !==
    /// SignatureHelpTriggerKind.TriggerCharacter`
    String? triggerCharacter,
  }) = _SignatureHelpContext;

  factory SignatureHelpContext.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpContextFromJson(json);
}

/// Represents the signature of something callable. A signature can
/// have a label, like a function-name, a doc-comment, and a set of
/// parameters.
@freezed
abstract class SignatureInformation with _$SignatureInformation {
  const factory SignatureInformation({
    /// The label of this signature. Will be shown in the UI.
    required String label,

    /// The index of the active parameter.
    /// If provided, this is used in place of `SignatureHelp.activeParameter`.
    /// @since 3.16.0
    int? activeParameter,

    /// The parameters of this signature.
    List<ParameterInformation>? parameters,

    /// The human-readable doc-comment of this signature. Will be shown in the
    /// UI but can be omitted.
    TooltipOrDocumentationBase? documentation,
  }) = _SignatureInformation;

  factory SignatureInformation.fromJson(Map<String, dynamic> json) =>
      _$SignatureInformationFromJson(json);
}

/// Server Capabilities for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpOptions with _$SignatureHelpOptions {
  const factory SignatureHelpOptions({
    /// List of characters that re-trigger signature help.
    /// These trigger characters are only active when signature help is already
    /// showing. All trigger characters are also counted as re-trigger
    /// characters.
    /// @since 3.15.0
    List<String>? retriggerCharacters,

    /// List of characters that trigger signature help automatically.
    List<String>? triggerCharacters,
    bool? workDoneProgress,
  }) = _SignatureHelpOptions;

  factory SignatureHelpOptions.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpOptionsFromJson(json);
}

/// Server Capabilities for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionOptions with _$DefinitionOptions {
  const factory DefinitionOptions({bool? workDoneProgress}) =
      _DefinitionOptions;

  factory DefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionOptionsFromJson(json);
}

/// Value-object that contains additional information when requesting
/// references.
@freezed
abstract class ReferenceContext with _$ReferenceContext {
  const factory ReferenceContext({
    /// Include the declaration of the current symbol.
    required bool includeDeclaration,
  }) = _ReferenceContext;

  factory ReferenceContext.fromJson(Map<String, dynamic> json) =>
      _$ReferenceContextFromJson(json);
}

/// Reference options.
@freezed
abstract class ReferenceOptions with _$ReferenceOptions {
  const factory ReferenceOptions({bool? workDoneProgress}) = _ReferenceOptions;

  factory ReferenceOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceOptionsFromJson(json);
}

/// Provider options for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightOptions with _$DocumentHighlightOptions {
  const factory DocumentHighlightOptions({bool? workDoneProgress}) =
      _DocumentHighlightOptions;

  factory DocumentHighlightOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightOptionsFromJson(json);
}

/// A base for all symbol information.
@freezed
abstract class BaseSymbolInformation with _$BaseSymbolInformation {
  const factory BaseSymbolInformation({
    /// The name of this symbol.
    required String name,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// The name of the symbol containing this symbol. This information is for
    /// user interface purposes (e.g. to render a qualifier in the user
    /// interface if necessary). It can't be used to re-infer a hierarchy for
    /// the document symbols.
    String? containerName,

    /// Tags for this symbol.
    /// @since 3.16.0
    List<SymbolTag>? tags,
  }) = _BaseSymbolInformation;

  factory BaseSymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$BaseSymbolInformationFromJson(json);
}

/// Provider options for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolOptions with _$DocumentSymbolOptions {
  const factory DocumentSymbolOptions({
    /// A human-readable string that is shown when multiple outlines trees are
    /// shown for the same document.
    /// @since 3.16.0
    String? label,
    bool? workDoneProgress,
  }) = _DocumentSymbolOptions;

  factory DocumentSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolOptionsFromJson(json);
}

/// Contains additional diagnostic information about the context in
/// which a {@link CodeActionProvider.provideCodeActions code action}
/// is run.
@freezed
abstract class CodeActionContext with _$CodeActionContext {
  const factory CodeActionContext({
    /// An array of diagnostics known on the client side overlapping the range
    /// provided to the `textDocument/codeAction` request. They are provided so
    /// that the server knows which errors are currently presented to the user
    /// for the given range. There is no guarantee that these accurately
    /// reflect the error state of the resource. The primary parameter to
    /// compute code actions is the provided range.
    required List<Diagnostic> diagnostics,

    /// The reason why code actions were requested.
    /// @since 3.17.0
    CodeActionTriggerKind? triggerKind,

    /// Requested kind of actions to return.
    /// Actions not of this kind are filtered out by the client before being
    /// shown. So servers can omit computing them.
    List<CodeActionKind>? only,
  }) = _CodeActionContext;

  factory CodeActionContext.fromJson(Map<String, dynamic> json) =>
      _$CodeActionContextFromJson(json);
}

/// Provider options for a {@link CodeActionRequest}.
@freezed
abstract class CodeActionOptions with _$CodeActionOptions {
  const factory CodeActionOptions({
    /// The server provides support to resolve additional information for a
    /// code action.
    /// @since 3.16.0
    bool? resolveProvider,

    /// CodeActionKinds that this server may return.
    /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
    /// the server may list out every specific kind they provide.
    List<CodeActionKind>? codeActionKinds,
    bool? workDoneProgress,
  }) = _CodeActionOptions;

  factory CodeActionOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionOptionsFromJson(json);
}

/// Server capabilities for a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolOptions with _$WorkspaceSymbolOptions {
  const factory WorkspaceSymbolOptions({
    /// The server provides support to resolve additional information for a
    /// workspace symbol.
    /// @since 3.17.0
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _WorkspaceSymbolOptions;

  factory WorkspaceSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolOptionsFromJson(json);
}

/// Code Lens provider options of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensOptions with _$CodeLensOptions {
  const factory CodeLensOptions({
    /// Code lens has a resolve provider as well.
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _CodeLensOptions;

  factory CodeLensOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensOptionsFromJson(json);
}

/// Provider options for a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkOptions with _$DocumentLinkOptions {
  const factory DocumentLinkOptions({
    /// Document links have a resolve provider as well.
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _DocumentLinkOptions;

  factory DocumentLinkOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkOptionsFromJson(json);
}

/// Value-object describing what options formatting should use.
@freezed
abstract class FormattingOptions with _$FormattingOptions {
  const factory FormattingOptions({
    /// Size of a tab in spaces.
    required int tabSize,

    /// Prefer spaces over tabs.
    required bool insertSpaces,

    /// Trim all newlines after the final newline at the end of the file.
    /// @since 3.15.0
    bool? trimFinalNewlines,

    /// Insert a newline character at the end of the file if one does not exist.
    /// @since 3.15.0
    bool? insertFinalNewline,

    /// Trim trailing whitespace on a line.
    /// @since 3.15.0
    bool? trimTrailingWhitespace,
  }) = _FormattingOptions;

  factory FormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$FormattingOptionsFromJson(json);
}

/// Provider options for a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingOptions with _$DocumentFormattingOptions {
  const factory DocumentFormattingOptions({bool? workDoneProgress}) =
      _DocumentFormattingOptions;

  factory DocumentFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingOptionsFromJson(json);
}

/// Provider options for a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingOptions
    with _$DocumentRangeFormattingOptions {
  const factory DocumentRangeFormattingOptions({
    /// Whether the server supports formatting multiple ranges at once.
    /// @since 3.18.0 @proposed
    bool? rangesSupport,
    bool? workDoneProgress,
  }) = _DocumentRangeFormattingOptions;

  factory DocumentRangeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingOptionsFromJson(json);
}

/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingOptions
    with _$DocumentOnTypeFormattingOptions {
  const factory DocumentOnTypeFormattingOptions({
    /// A character on which formatting should be triggered, like `{`.
    required String firstTriggerCharacter,

    /// More trigger characters.
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingOptions;

  factory DocumentOnTypeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingOptionsFromJson(json);
}

/// Provider options for a {@link RenameRequest}.
@freezed
abstract class RenameOptions with _$RenameOptions {
  const factory RenameOptions({
    /// Renames should be checked and tested before being executed.
    /// @since version 3.12.0
    bool? prepareProvider,
    bool? workDoneProgress,
  }) = _RenameOptions;

  factory RenameOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameOptionsFromJson(json);
}

/// The server capabilities of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandOptions with _$ExecuteCommandOptions {
  const factory ExecuteCommandOptions({
    /// The commands to be executed on the server
    required List<String> commands,
    bool? workDoneProgress,
  }) = _ExecuteCommandOptions;

  factory ExecuteCommandOptions.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandOptionsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensLegend with _$SemanticTokensLegend {
  const factory SemanticTokensLegend({
    /// The token types a server uses.
    required List<String> tokenTypes,

    /// The token modifiers a server uses.
    required List<String> tokenModifiers,
  }) = _SemanticTokensLegend;

  factory SemanticTokensLegend.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensLegendFromJson(json);
}

/// A text document identifier to optionally denote a specific
/// version of a text document.
@freezed
abstract class OptionalVersionedTextDocumentIdentifier
    with _$OptionalVersionedTextDocumentIdentifier {
  const factory OptionalVersionedTextDocumentIdentifier({
    /// The text document's uri.
    required String uri,

    /// The version number of this document. If a versioned text document
    /// identifier is sent from the server to the client and the file is not
    /// open in the editor (the server has not received an open notification
    /// before) the server can send `null` to indicate that the version is
    /// unknown and the content on disk is the truth (as specified with
    /// document content ownership).
    required ProcessIdOrVersionBase version,
  }) = _OptionalVersionedTextDocumentIdentifier;

  factory OptionalVersionedTextDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) => _$OptionalVersionedTextDocumentIdentifierFromJson(json);
}

/// A special text edit with an additional change annotation.
/// @since 3.16.0.
@freezed
abstract class AnnotatedTextEdit with _$AnnotatedTextEdit {
  const factory AnnotatedTextEdit({
    /// The range of the text document to be manipulated. To insert text into a
    /// document create a range where start === end.
    required Range range,

    /// The string to be inserted. For delete operations use an empty string.
    required String newText,

    /// The actual identifier of the change annotation
    required ChangeAnnotationIdentifier annotationId,
  }) = _AnnotatedTextEdit;

  factory AnnotatedTextEdit.fromJson(Map<String, dynamic> json) =>
      _$AnnotatedTextEditFromJson(json);
}

/// A generic resource operation.
@freezed
abstract class ResourceOperation with _$ResourceOperation {
  const factory ResourceOperation({
    /// The resource operation kind.
    required String kind,

    /// An optional annotation identifier describing the operation.
    /// @since 3.16.0
    ChangeAnnotationIdentifier? annotationId,
  }) = _ResourceOperation;

  factory ResourceOperation.fromJson(Map<String, dynamic> json) =>
      _$ResourceOperationFromJson(json);
}

/// Options to create a file.
@freezed
abstract class CreateFileOptions with _$CreateFileOptions {
  const factory CreateFileOptions({
    /// Ignore if exists.
    bool? ignoreIfExists,

    /// Overwrite existing file. Overwrite wins over `ignoreIfExists`
    bool? overwrite,
  }) = _CreateFileOptions;

  factory CreateFileOptions.fromJson(Map<String, dynamic> json) =>
      _$CreateFileOptionsFromJson(json);
}

/// Rename file options
@freezed
abstract class RenameFileOptions with _$RenameFileOptions {
  const factory RenameFileOptions({
    /// Ignores if target exists.
    bool? ignoreIfExists,

    /// Overwrite target if existing. Overwrite wins over `ignoreIfExists`
    bool? overwrite,
  }) = _RenameFileOptions;

  factory RenameFileOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameFileOptionsFromJson(json);
}

/// Delete file options
@freezed
abstract class DeleteFileOptions with _$DeleteFileOptions {
  const factory DeleteFileOptions({
    /// Ignore the operation if the file doesn't exist.
    bool? ignoreIfNotExists,

    /// Delete the content recursively if a folder is denoted.
    bool? recursive,
  }) = _DeleteFileOptions;

  factory DeleteFileOptions.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileOptionsFromJson(json);
}

/// A pattern to describe in which file operation requests or
/// notifications the server is interested in receiving.
/// @since 3.16.0
@freezed
abstract class FileOperationPattern with _$FileOperationPattern {
  const factory FileOperationPattern({
    /// The glob pattern to match. Glob patterns can have the following syntax:
    /// - `*` to match zero or more characters in a path segment - `?` to match
    /// on one character in a path segment - `**` to match any number of path
    /// segments, including none - `{}` to group sub patterns into an OR
    /// expression. (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript
    /// files) - `[]` to declare a range of characters to match in a path
    /// segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
    /// - `[!...]` to negate a range of characters to match in a path segment
    /// (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not
    /// `example.0`)
    required String glob,

    /// Additional options used during matching.
    FileOperationPatternOptions? options,

    /// Whether to match files or folders with this pattern.
    /// Matches both if undefined.
    FileOperationPatternKind? matches,
  }) = _FileOperationPattern;

  factory FileOperationPattern.fromJson(Map<String, dynamic> json) =>
      _$FileOperationPatternFromJson(json);
}

/// A full document diagnostic report for a workspace diagnostic
/// result.
/// @since 3.17.0
@freezed
abstract class WorkspaceFullDocumentDiagnosticReport
    with _$WorkspaceFullDocumentDiagnosticReport {
  const factory WorkspaceFullDocumentDiagnosticReport({
    /// A full document diagnostic report.
    required String kind,

    /// The actual items.
    required List<Diagnostic> items,

    /// The URI for which diagnostic information is reported.
    required String uri,

    /// The version number for which the diagnostics are reported. If the
    /// document is not marked as open `null` can be provided.
    required ProcessIdOrVersionBase version,

    /// An optional result id. If provided it will be sent on the next
    /// diagnostic request for the same document.
    String? resultId,
  }) = _WorkspaceFullDocumentDiagnosticReport;

  factory WorkspaceFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFullDocumentDiagnosticReportFromJson(json);
}

/// An unchanged document diagnostic report for a workspace
/// diagnostic result.
/// @since 3.17.0
@freezed
abstract class WorkspaceUnchangedDocumentDiagnosticReport
    with _$WorkspaceUnchangedDocumentDiagnosticReport {
  const factory WorkspaceUnchangedDocumentDiagnosticReport({
    /// A document diagnostic report indicating no changes to the last result.
    /// A server can only return `unchanged` if result ids are provided.
    required String kind,

    /// A result id which will be sent on the next diagnostic request for the
    /// same document.
    required String resultId,

    /// The URI for which diagnostic information is reported.
    required String uri,

    /// The version number for which the diagnostics are reported. If the
    /// document is not marked as open `null` can be provided.
    required ProcessIdOrVersionBase version,
  }) = _WorkspaceUnchangedDocumentDiagnosticReport;

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceUnchangedDocumentDiagnosticReportFromJson(json);
}

/// A notebook cell.
/// A cell's document URI must be unique across ALL notebook cells
/// and can therefore be used to uniquely identify a notebook cell or
/// the cell's text document.
/// @since 3.17.0
@freezed
abstract class NotebookCell with _$NotebookCell {
  const factory NotebookCell({
    /// The cell's kind
    required NotebookCellKind kind,

    /// The URI of the cell's text document content.
    required String document,

    /// Additional execution summary information if supported by the client.
    ExecutionSummary? executionSummary,

    /// Additional metadata stored with the cell.
    /// Note: should always be an object literal (e.g. LSPObject)
    LSPObject? metadata,
  }) = _NotebookCell;

  factory NotebookCell.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellFromJson(json);
}

/// A change describing how to move a `NotebookCell` array from state
/// S to S'.
/// @since 3.17.0
@freezed
abstract class NotebookCellArrayChange with _$NotebookCellArrayChange {
  const factory NotebookCellArrayChange({
    /// The start oftest of the cell that changed.
    required int start,

    /// The deleted cells
    required int deleteCount,

    /// The new cells, if any
    List<NotebookCell>? cells,
  }) = _NotebookCellArrayChange;

  factory NotebookCellArrayChange.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellArrayChangeFromJson(json);
}

/// Describes the currently selected completion item.
/// @since 3.18.0 @proposed
@freezed
abstract class SelectedCompletionInfo with _$SelectedCompletionInfo {
  const factory SelectedCompletionInfo({
    /// The range that will be replaced if this completion item is accepted.
    required Range range,

    /// The text the range will be replaced with if this completion is accepted.
    required String text,
  }) = _SelectedCompletionInfo;

  factory SelectedCompletionInfo.fromJson(Map<String, dynamic> json) =>
      _$SelectedCompletionInfoFromJson(json);
}

/// Defines the capabilities provided by the client.
@freezed
abstract class ClientCapabilities with _$ClientCapabilities {
  const factory ClientCapabilities({
    /// Experimental client capabilities.
    LSPAny? experimental,

    /// General client capabilities.
    /// @since 3.16.0
    GeneralClientCapabilities? general,

    /// Window specific client capabilities.
    WindowClientCapabilities? window,

    /// Capabilities specific to the notebook document support.
    /// @since 3.17.0
    NotebookDocumentClientCapabilities? notebookDocument,

    /// Text document specific client capabilities.
    TextDocumentClientCapabilities? textDocument,

    /// Workspace specific client capabilities.
    WorkspaceClientCapabilities? workspace,
  }) = _ClientCapabilities;

  factory ClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ClientCapabilitiesFromJson(json);
}

@freezed
abstract class TextDocumentSyncOptions with _$TextDocumentSyncOptions {
  const factory TextDocumentSyncOptions({
    /// If present save notifications are sent to the server. If omitted the
    /// notification should not be sent.
    TextDocumentSyncOptionsSaveBase? save,

    /// If present will save wait until requests are sent to the server. If
    /// omitted the request should not be sent.
    bool? willSaveWaitUntil,

    /// If present will save notifications are sent to the server. If omitted
    /// the notification should not be sent.
    bool? willSave,

    /// Change notifications are sent to the server. See
    /// TextDocumentSyncKind.None, TextDocumentSyncKind.Full and
    /// TextDocumentSyncKind.Incremental. If omitted it defaults to
    /// TextDocumentSyncKind.None.
    TextDocumentSyncKind? change,

    /// Open and close notifications are sent to the server. If omitted open
    /// close notification should not be sent.
    bool? openClose,
  }) = _TextDocumentSyncOptions;

  factory TextDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentSyncOptionsFromJson(json);
}

/// Options specific to a notebook plus its cells to be synced to the
/// server.
/// If a selector provides a notebook document filter but no cell
/// selector all cells of a matching notebook document will be
/// synced.
/// If a selector provides no notebook document filter but only a
/// cell selector all notebook document that contain at least one
/// matching cell will be synced.
/// @since 3.17.0
@freezed
abstract class NotebookDocumentSyncOptions with _$NotebookDocumentSyncOptions {
  const factory NotebookDocumentSyncOptions({
    /// The notebooks to be synced
    required List<NotebookDocumentSyncOptionsNotebookSelectorBase>
    notebookSelector,

    /// Whether save notification should be forwarded to the server. Will only
    /// be honored if mode === `notebook`.
    bool? save,
  }) = _NotebookDocumentSyncOptions;

  factory NotebookDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentSyncOptionsFromJson(json);
}

/// Registration options specific to a notebook.
/// @since 3.17.0
@freezed
abstract class NotebookDocumentSyncRegistrationOptions
    with _$NotebookDocumentSyncRegistrationOptions {
  const factory NotebookDocumentSyncRegistrationOptions({
    /// The notebooks to be synced
    required List<NotebookDocumentSyncOptionsNotebookSelectorBase>
    notebookSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,

    /// Whether save notification should be forwarded to the server. Will only
    /// be honored if mode === `notebook`.
    bool? save,
  }) = _NotebookDocumentSyncRegistrationOptions;

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersServerCapabilities
    with _$WorkspaceFoldersServerCapabilities {
  const factory WorkspaceFoldersServerCapabilities({
    /// Whether the server wants to receive workspace folder change
    /// notifications.
    /// If a string is provided the string is treated as an ID under which the
    /// notification is registered on the client side. The ID can be used to
    /// unregister for these events using the `client/unregisterCapability`
    /// request.
    WorkspaceFoldersServerCapabilitiesChangeNotificationsBase?
    changeNotifications,

    /// The server has support for workspace folders
    bool? supported,
  }) = _WorkspaceFoldersServerCapabilities;

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersServerCapabilitiesFromJson(json);
}

/// Options for notifications/requests for user operations on files.
/// @since 3.16.0
@freezed
abstract class FileOperationOptions with _$FileOperationOptions {
  const factory FileOperationOptions({
    /// The server is interested in receiving willDeleteFiles file requests.
    FileOperationRegistrationOptions? willDelete,

    /// The server is interested in receiving didDeleteFiles file notifications.
    FileOperationRegistrationOptions? didDelete,

    /// The server is interested in receiving willRenameFiles requests.
    FileOperationRegistrationOptions? willRename,

    /// The server is interested in receiving didRenameFiles notifications.
    FileOperationRegistrationOptions? didRename,

    /// The server is interested in receiving willCreateFiles requests.
    FileOperationRegistrationOptions? willCreate,

    /// The server is interested in receiving didCreateFiles notifications.
    FileOperationRegistrationOptions? didCreate,
  }) = _FileOperationOptions;

  factory FileOperationOptions.fromJson(Map<String, dynamic> json) =>
      _$FileOperationOptionsFromJson(json);
}

/// Structure to capture a description for an error code.
/// @since 3.16.0
@freezed
abstract class CodeDescription with _$CodeDescription {
  const factory CodeDescription({
    /// An URI to open with more information about the diagnostic error.
    required String href,
  }) = _CodeDescription;

  factory CodeDescription.fromJson(Map<String, dynamic> json) =>
      _$CodeDescriptionFromJson(json);
}

/// Represents a related message and source code location for a
/// diagnostic. This should be used to point to code locations that
/// cause or related to a diagnostics, e.g when duplicating a symbol
/// in a scope.
@freezed
abstract class DiagnosticRelatedInformation
    with _$DiagnosticRelatedInformation {
  const factory DiagnosticRelatedInformation({
    /// The location of this related diagnostic information.
    required Location location,

    /// The message of this related diagnostic information.
    required String message,
  }) = _DiagnosticRelatedInformation;

  factory DiagnosticRelatedInformation.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticRelatedInformationFromJson(json);
}

/// Represents a parameter of a callable-signature. A parameter can
/// have a label and a doc-comment.
@freezed
abstract class ParameterInformation with _$ParameterInformation {
  const factory ParameterInformation({
    /// The label of this parameter information.
    /// Either a string or an inclusive start and exclusive end offsets within
    /// its containing signature label. (see SignatureInformation.label). The
    /// offsets are based on a UTF-16 string representation as `Position` and
    /// `Range` does.
    /// *Note*: a label of type string should be a substring of its containing
    /// signature label. Its intended use case is to highlight the parameter
    /// label part in the `SignatureInformation.label`.
    required ParameterInformationLabelBase label,

    /// The human-readable doc-comment of this parameter. Will be shown in the
    /// UI but can be omitted.
    TooltipOrDocumentationBase? documentation,
  }) = _ParameterInformation;

  factory ParameterInformation.fromJson(Map<String, dynamic> json) =>
      _$ParameterInformationFromJson(json);
}

/// A notebook cell text document filter denotes a cell text document
/// by different properties.
/// @since 3.17.0
@freezed
abstract class NotebookCellTextDocumentFilter
    with _$NotebookCellTextDocumentFilter {
  const factory NotebookCellTextDocumentFilter({
    /// A filter that matches against the notebook containing the notebook
    /// cell. If a string value is provided it matches against the notebook
    /// type. '*' matches every notebook.
    required NotebookCellTextDocumentFilterNotebookBase notebook,

    /// A language id like `python`.
    /// Will be matched against the language id of the notebook cell document.
    /// '*' matches every language.
    String? language,
  }) = _NotebookCellTextDocumentFilter;

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellTextDocumentFilterFromJson(json);
}

/// Matching options for the file operation pattern.
/// @since 3.16.0
@freezed
abstract class FileOperationPatternOptions with _$FileOperationPatternOptions {
  const factory FileOperationPatternOptions({
    /// The pattern should be matched ignoring casing.
    bool? ignoreCase,
  }) = _FileOperationPatternOptions;

  factory FileOperationPatternOptions.fromJson(Map<String, dynamic> json) =>
      _$FileOperationPatternOptionsFromJson(json);
}

@freezed
abstract class ExecutionSummary with _$ExecutionSummary {
  const factory ExecutionSummary({
    /// A strict monotonically increasing value indicating the execution order
    /// of a cell inside a notebook.
    required int executionOrder,

    /// Whether the execution was successful or not if known by the client.
    bool? success,
  }) = _ExecutionSummary;

  factory ExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$ExecutionSummaryFromJson(json);
}

/// Workspace specific client capabilities.
@freezed
abstract class WorkspaceClientCapabilities with _$WorkspaceClientCapabilities {
  const factory WorkspaceClientCapabilities({
    /// Capabilities specific to the folding range requests scoped to the
    /// workspace.
    /// @since 3.18.0 @proposed
    FoldingRangeWorkspaceClientCapabilities? foldingRange,

    /// Capabilities specific to the diagnostic requests scoped to the
    /// workspace.
    /// @since 3.17.0.
    DiagnosticWorkspaceClientCapabilities? diagnostics,

    /// Capabilities specific to the inlay hint requests scoped to the
    /// workspace.
    /// @since 3.17.0.
    InlayHintWorkspaceClientCapabilities? inlayHint,

    /// Capabilities specific to the inline values requests scoped to the
    /// workspace.
    /// @since 3.17.0.
    InlineValueWorkspaceClientCapabilities? inlineValue,

    /// The client has support for file notifications/requests for user
    /// operations on files.
    /// Since 3.16.0
    FileOperationClientCapabilities? fileOperations,

    /// Capabilities specific to the code lens requests scoped to the workspace.
    /// @since 3.16.0.
    CodeLensWorkspaceClientCapabilities? codeLens,

    /// Capabilities specific to the semantic token requests scoped to the
    /// workspace.
    /// @since 3.16.0.
    SemanticTokensWorkspaceClientCapabilities? semanticTokens,

    /// The client supports `workspace/configuration` requests.
    /// @since 3.6.0
    bool? configuration,

    /// The client has support for workspace folders.
    /// @since 3.6.0
    bool? workspaceFolders,

    /// Capabilities specific to the `workspace/executeCommand` request.
    ExecuteCommandClientCapabilities? executeCommand,

    /// Capabilities specific to the `workspace/symbol` request.
    WorkspaceSymbolClientCapabilities? symbol,

    /// Capabilities specific to the `workspace/didChangeWatchedFiles`
    /// notification.
    DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles,

    /// Capabilities specific to the `workspace/didChangeConfiguration`
    /// notification.
    DidChangeConfigurationClientCapabilities? didChangeConfiguration,

    /// Capabilities specific to `WorkspaceEdit`s.
    WorkspaceEditClientCapabilities? workspaceEdit,

    /// The client supports applying batch edits to the workspace by supporting
    /// the request 'workspace/applyEdit'
    bool? applyEdit,
  }) = _WorkspaceClientCapabilities;

  factory WorkspaceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceClientCapabilitiesFromJson(json);
}

/// Text document specific client capabilities.
@freezed
abstract class TextDocumentClientCapabilities
    with _$TextDocumentClientCapabilities {
  const factory TextDocumentClientCapabilities({
    /// Client capabilities specific to inline completions.
    /// @since 3.18.0 @proposed
    InlineCompletionClientCapabilities? inlineCompletion,

    /// Capabilities specific to the diagnostic pull model.
    /// @since 3.17.0
    DiagnosticClientCapabilities? diagnostic,

    /// Capabilities specific to the `textDocument/inlayHint` request.
    /// @since 3.17.0
    InlayHintClientCapabilities? inlayHint,

    /// Capabilities specific to the `textDocument/inlineValue` request.
    /// @since 3.17.0
    InlineValueClientCapabilities? inlineValue,

    /// Capabilities specific to the various type hierarchy requests.
    /// @since 3.17.0
    TypeHierarchyClientCapabilities? typeHierarchy,

    /// Client capabilities specific to the `textDocument/moniker` request.
    /// @since 3.16.0
    MonikerClientCapabilities? moniker,

    /// Capabilities specific to the `textDocument/linkedEditingRange` request.
    /// @since 3.16.0
    LinkedEditingRangeClientCapabilities? linkedEditingRange,

    /// Capabilities specific to the various semantic token request.
    /// @since 3.16.0
    SemanticTokensClientCapabilities? semanticTokens,

    /// Capabilities specific to the various call hierarchy requests.
    /// @since 3.16.0
    CallHierarchyClientCapabilities? callHierarchy,

    /// Capabilities specific to the `textDocument/publishDiagnostics`
    /// notification.
    PublishDiagnosticsClientCapabilities? publishDiagnostics,

    /// Capabilities specific to the `textDocument/selectionRange` request.
    /// @since 3.15.0
    SelectionRangeClientCapabilities? selectionRange,

    /// Capabilities specific to the `textDocument/foldingRange` request.
    /// @since 3.10.0
    FoldingRangeClientCapabilities? foldingRange,

    /// Capabilities specific to the `textDocument/rename` request.
    RenameClientCapabilities? rename,

    /// Capabilities specific to the `textDocument/onTypeFormatting` request.
    DocumentOnTypeFormattingClientCapabilities? onTypeFormatting,

    /// Capabilities specific to the `textDocument/rangeFormatting` request.
    DocumentRangeFormattingClientCapabilities? rangeFormatting,

    /// Capabilities specific to the `textDocument/formatting` request.
    DocumentFormattingClientCapabilities? formatting,

    /// Capabilities specific to the `textDocument/documentColor` and the
    /// `textDocument/colorPresentation` request.
    /// @since 3.6.0
    DocumentColorClientCapabilities? colorProvider,

    /// Capabilities specific to the `textDocument/documentLink` request.
    DocumentLinkClientCapabilities? documentLink,

    /// Capabilities specific to the `textDocument/codeLens` request.
    CodeLensClientCapabilities? codeLens,

    /// Capabilities specific to the `textDocument/codeAction` request.
    CodeActionClientCapabilities? codeAction,

    /// Capabilities specific to the `textDocument/documentSymbol` request.
    DocumentSymbolClientCapabilities? documentSymbol,

    /// Capabilities specific to the `textDocument/documentHighlight` request.
    DocumentHighlightClientCapabilities? documentHighlight,

    /// Capabilities specific to the `textDocument/references` request.
    ReferenceClientCapabilities? references,

    /// Capabilities specific to the `textDocument/implementation` request.
    /// @since 3.6.0
    ImplementationClientCapabilities? implementation,

    /// Capabilities specific to the `textDocument/typeDefinition` request.
    /// @since 3.6.0
    TypeDefinitionClientCapabilities? typeDefinition,

    /// Capabilities specific to the `textDocument/definition` request.
    DefinitionClientCapabilities? definition,

    /// Capabilities specific to the `textDocument/declaration` request.
    /// @since 3.14.0
    DeclarationClientCapabilities? declaration,

    /// Capabilities specific to the `textDocument/signatureHelp` request.
    SignatureHelpClientCapabilities? signatureHelp,

    /// Capabilities specific to the `textDocument/hover` request.
    HoverClientCapabilities? hover,

    /// Capabilities specific to the `textDocument/completion` request.
    CompletionClientCapabilities? completion,

    /// Defines which synchronization capabilities the client supports.
    TextDocumentSyncClientCapabilities? synchronization,
  }) = _TextDocumentClientCapabilities;

  factory TextDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentClientCapabilitiesFromJson(json);
}

/// Capabilities specific to the notebook document support.
/// @since 3.17.0
@freezed
abstract class NotebookDocumentClientCapabilities
    with _$NotebookDocumentClientCapabilities {
  const factory NotebookDocumentClientCapabilities({
    /// Capabilities specific to notebook document synchronization
    /// @since 3.17.0
    required NotebookDocumentSyncClientCapabilities synchronization,
  }) = _NotebookDocumentClientCapabilities;

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class WindowClientCapabilities with _$WindowClientCapabilities {
  const factory WindowClientCapabilities({
    /// Capabilities specific to the showDocument request.
    /// @since 3.16.0
    ShowDocumentClientCapabilities? showDocument,

    /// Capabilities specific to the showMessage request.
    /// @since 3.16.0
    ShowMessageRequestClientCapabilities? showMessage,

    /// It indicates whether the client supports server initiated progress
    /// using the `window/workDoneProgress/create` request.
    /// The capability also controls Whether client supports handling of
    /// progress notifications. If set servers are allowed to report a
    /// `workDoneProgress` property in the request specific server
    /// capabilities.
    /// @since 3.15.0
    bool? workDoneProgress,
  }) = _WindowClientCapabilities;

  factory WindowClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WindowClientCapabilitiesFromJson(json);
}

/// General client capabilities.
/// @since 3.16.0
@freezed
abstract class GeneralClientCapabilities with _$GeneralClientCapabilities {
  const factory GeneralClientCapabilities({
    /// The position encodings supported by the client. Client and server have
    /// to agree on the same position encoding to ensure that offsets (e.g.
    /// character position in a line) are interpreted the same on both sides.
    /// To keep the protocol backwards compatible the following applies: if the
    /// value 'utf-16' is missing from the array of position encodings servers
    /// can assume that the client supports UTF-16. UTF-16 is therefore a
    /// mandatory encoding.
    /// If omitted it defaults to ['utf-16'].
    /// Implementation considerations: since the conversion from one encoding
    /// into another requires the content of the file / line the conversion is
    /// best done where the file is read which is usually on the server side.
    /// @since 3.17.0
    List<PositionEncodingKind>? positionEncodings,

    /// Client capabilities specific to the client's markdown parser.
    /// @since 3.16.0
    MarkdownClientCapabilities? markdown,

    /// Client capabilities specific to regular expressions.
    /// @since 3.16.0
    RegularExpressionsClientCapabilities? regularExpressions,

    /// Client capability that signals how the client handles stale requests
    /// (e.g. a request for which the client will not process the response
    /// anymore since the information is outdated).
    /// @since 3.17.0
    ({bool cancel, List<String> retryOnContentModified})? staleRequestSupport,
  }) = _GeneralClientCapabilities;

  factory GeneralClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$GeneralClientCapabilitiesFromJson(json);
}

/// A relative pattern is a helper to construct glob patterns that
/// are matched relatively to a base URI. The common value for a
/// `baseUri` is a workspace folder root, but it can be another
/// absolute URI as well.
/// @since 3.17.0
@freezed
abstract class RelativePattern with _$RelativePattern {
  const factory RelativePattern({
    /// A workspace folder or a base URI to which this pattern will be matched
    /// against relatively.
    required RelativePatternBaseUriBase baseUri,

    /// The actual glob pattern;
    required Pattern pattern,
  }) = _RelativePattern;

  factory RelativePattern.fromJson(Map<String, dynamic> json) =>
      _$RelativePatternFromJson(json);
}

@freezed
abstract class WorkspaceEditClientCapabilities
    with _$WorkspaceEditClientCapabilities {
  const factory WorkspaceEditClientCapabilities({
    /// Whether the client in general supports change annotations on text
    /// edits, create file, rename file and delete file changes.
    /// @since 3.16.0
    ({bool? groupsOnLabel})? changeAnnotationSupport,

    /// Whether the client normalizes line endings to the client specific
    /// setting. If set to `true` the client will normalize line ending
    /// characters in a workspace edit to the client-specified new line
    /// character.
    /// @since 3.16.0
    bool? normalizesLineEndings,

    /// The failure handling strategy of a client if applying the workspace
    /// edit fails.
    /// @since 3.13.0
    FailureHandlingKind? failureHandling,

    /// The resource operations the client supports. Clients should at least
    /// support 'create', 'rename' and 'delete' files and folders.
    /// @since 3.13.0
    List<ResourceOperationKind>? resourceOperations,

    /// The client supports versioned document changes in `WorkspaceEdit`s
    bool? documentChanges,
  }) = _WorkspaceEditClientCapabilities;

  factory WorkspaceEditClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditClientCapabilitiesFromJson(json);
}

@freezed
abstract class DidChangeConfigurationClientCapabilities
    with _$DidChangeConfigurationClientCapabilities {
  const factory DidChangeConfigurationClientCapabilities({
    /// Did change configuration notification supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DidChangeConfigurationClientCapabilities;

  factory DidChangeConfigurationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationClientCapabilitiesFromJson(json);
}

@freezed
abstract class DidChangeWatchedFilesClientCapabilities
    with _$DidChangeWatchedFilesClientCapabilities {
  const factory DidChangeWatchedFilesClientCapabilities({
    /// Whether the client has support for {@link RelativePattern relative
    /// pattern} or not.
    /// @since 3.17.0
    bool? relativePatternSupport,

    /// Did change watched files notification supports dynamic registration.
    /// Please note that the current protocol doesn't support static
    /// configuration for file changes from the server side.
    bool? dynamicRegistration,
  }) = _DidChangeWatchedFilesClientCapabilities;

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesClientCapabilitiesFromJson(json);
}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolClientCapabilities
    with _$WorkspaceSymbolClientCapabilities {
  const factory WorkspaceSymbolClientCapabilities({
    /// The client support partial workspace symbols. The client will send the
    /// request `workspaceSymbol/resolve` to the server to resolve additional
    /// properties.
    /// @since 3.17.0
    ({List<String> properties})? resolveSupport,

    /// The client supports tags on `SymbolInformation`. Clients supporting
    /// tags have to handle unknown tags gracefully.
    /// @since 3.16.0
    ({List<SymbolTag> valueSet})? tagSupport,

    /// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
    /// request.
    ({List<SymbolKind>? valueSet})? symbolKind,

    /// Symbol request supports dynamic registration.
    bool? dynamicRegistration,
  }) = _WorkspaceSymbolClientCapabilities;

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolClientCapabilitiesFromJson(json);
}

/// The client capabilities of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandClientCapabilities
    with _$ExecuteCommandClientCapabilities {
  const factory ExecuteCommandClientCapabilities({
    /// Execute command supports dynamic registration.
    bool? dynamicRegistration,
  }) = _ExecuteCommandClientCapabilities;

  factory ExecuteCommandClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensWorkspaceClientCapabilities
    with _$SemanticTokensWorkspaceClientCapabilities {
  const factory SemanticTokensWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    /// Note that this event is global and will force the client to refresh all
    /// semantic tokens currently shown. It should be used with absolute care
    /// and is useful for situation where a server for example detects a
    /// project wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _SemanticTokensWorkspaceClientCapabilities;

  factory SemanticTokensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensWorkspaceClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class CodeLensWorkspaceClientCapabilities
    with _$CodeLensWorkspaceClientCapabilities {
  const factory CodeLensWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    /// Note that this event is global and will force the client to refresh all
    /// code lenses currently shown. It should be used with absolute care and
    /// is useful for situation where a server for example detect a project
    /// wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _CodeLensWorkspaceClientCapabilities;

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$CodeLensWorkspaceClientCapabilitiesFromJson(json);
}

/// Capabilities relating to events from file operations by the user
/// in the client.
/// These events do not come from the file system, they come from
/// user operations like renaming a file in the UI.
/// @since 3.16.0
@freezed
abstract class FileOperationClientCapabilities
    with _$FileOperationClientCapabilities {
  const factory FileOperationClientCapabilities({
    /// The client has support for sending willDeleteFiles requests.
    bool? willDelete,

    /// The client has support for sending didDeleteFiles notifications.
    bool? didDelete,

    /// The client has support for sending willRenameFiles requests.
    bool? willRename,

    /// The client has support for sending didRenameFiles notifications.
    bool? didRename,

    /// The client has support for sending willCreateFiles requests.
    bool? willCreate,

    /// The client has support for sending didCreateFiles notifications.
    bool? didCreate,

    /// Whether the client supports dynamic registration for file
    /// requests/notifications.
    bool? dynamicRegistration,
  }) = _FileOperationClientCapabilities;

  factory FileOperationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FileOperationClientCapabilitiesFromJson(json);
}

/// Client workspace capabilities specific to inline values.
/// @since 3.17.0
@freezed
abstract class InlineValueWorkspaceClientCapabilities
    with _$InlineValueWorkspaceClientCapabilities {
  const factory InlineValueWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    /// Note that this event is global and will force the client to refresh all
    /// inline values currently shown. It should be used with absolute care and
    /// is useful for situation where a server for example detects a project
    /// wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _InlineValueWorkspaceClientCapabilities;

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueWorkspaceClientCapabilitiesFromJson(json);
}

/// Client workspace capabilities specific to inlay hints.
/// @since 3.17.0
@freezed
abstract class InlayHintWorkspaceClientCapabilities
    with _$InlayHintWorkspaceClientCapabilities {
  const factory InlayHintWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    /// Note that this event is global and will force the client to refresh all
    /// inlay hints currently shown. It should be used with absolute care and
    /// is useful for situation where a server for example detects a project
    /// wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _InlayHintWorkspaceClientCapabilities;

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlayHintWorkspaceClientCapabilitiesFromJson(json);
}

/// Workspace client capabilities specific to diagnostic pull
/// requests.
/// @since 3.17.0
@freezed
abstract class DiagnosticWorkspaceClientCapabilities
    with _$DiagnosticWorkspaceClientCapabilities {
  const factory DiagnosticWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    /// Note that this event is global and will force the client to refresh all
    /// pulled diagnostics currently shown. It should be used with absolute
    /// care and is useful for situation where a server for example detects a
    /// project wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _DiagnosticWorkspaceClientCapabilities;

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticWorkspaceClientCapabilitiesFromJson(json);
}

/// Client workspace capabilities specific to folding ranges
/// @since 3.18.0 @proposed
@freezed
abstract class FoldingRangeWorkspaceClientCapabilities
    with _$FoldingRangeWorkspaceClientCapabilities {
  const factory FoldingRangeWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    /// Note that this event is global and will force the client to refresh all
    /// folding ranges currently shown. It should be used with absolute care
    /// and is useful for situation where a server for example detects a
    /// project wide change that requires such a calculation.
    /// @since 3.18.0 @proposed
    bool? refreshSupport,
  }) = _FoldingRangeWorkspaceClientCapabilities;

  factory FoldingRangeWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$FoldingRangeWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class TextDocumentSyncClientCapabilities
    with _$TextDocumentSyncClientCapabilities {
  const factory TextDocumentSyncClientCapabilities({
    /// The client supports did save notifications.
    bool? didSave,

    /// The client supports sending a will save request and waits for a
    /// response providing text edits which will be applied to the document
    /// before it is saved.
    bool? willSaveWaitUntil,

    /// The client supports sending will save notifications.
    bool? willSave,

    /// Whether text document synchronization supports dynamic registration.
    bool? dynamicRegistration,
  }) = _TextDocumentSyncClientCapabilities;

  factory TextDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSyncClientCapabilitiesFromJson(json);
}

/// Completion client capabilities
@freezed
abstract class CompletionClientCapabilities
    with _$CompletionClientCapabilities {
  const factory CompletionClientCapabilities({
    /// The client supports the following `CompletionList` specific
    /// capabilities.
    /// @since 3.17.0
    ({List<String>? itemDefaults})? completionList,

    /// The client supports to send additional context information for a
    /// `textDocument/completion` request.
    bool? contextSupport,

    /// Defines how the client handles whitespace and indentation when
    /// accepting a completion item that uses multi line text in either
    /// `insertText` or `textEdit`.
    /// @since 3.17.0
    InsertTextMode? insertTextMode,
    ({List<CompletionItemKind>? valueSet})? completionItemKind,

    /// The client supports the following `CompletionItem` specific
    /// capabilities.
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

    /// Whether completion supports dynamic registration.
    bool? dynamicRegistration,
  }) = _CompletionClientCapabilities;

  factory CompletionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CompletionClientCapabilitiesFromJson(json);
}

@freezed
abstract class HoverClientCapabilities with _$HoverClientCapabilities {
  const factory HoverClientCapabilities({
    /// Client supports the following content formats for the content property.
    /// The order describes the preferred format of the client.
    List<MarkupKind>? contentFormat,

    /// Whether hover supports dynamic registration.
    bool? dynamicRegistration,
  }) = _HoverClientCapabilities;

  factory HoverClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$HoverClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpClientCapabilities
    with _$SignatureHelpClientCapabilities {
  const factory SignatureHelpClientCapabilities({
    /// The client supports to send additional context information for a
    /// `textDocument/signatureHelp` request. A client that opts into
    /// contextSupport will also support the `retriggerCharacters` on
    /// `SignatureHelpOptions`.
    /// @since 3.15.0
    bool? contextSupport,

    /// The client supports the following `SignatureInformation` specific
    /// properties.
    ({
      List<MarkupKind>? documentationFormat,
      ({bool? labelOffsetSupport})? parameterInformation,
      bool? activeParameterSupport,
    })?
    signatureInformation,

    /// Whether signature help supports dynamic registration.
    bool? dynamicRegistration,
  }) = _SignatureHelpClientCapabilities;

  factory SignatureHelpClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpClientCapabilitiesFromJson(json);
}

/// @since 3.14.0
@freezed
abstract class DeclarationClientCapabilities
    with _$DeclarationClientCapabilities {
  const factory DeclarationClientCapabilities({
    /// The client supports additional metadata in the form of declaration
    /// links.
    bool? linkSupport,

    /// Whether declaration supports dynamic registration. If this is set to
    /// `true` the client supports the new `DeclarationRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _DeclarationClientCapabilities;

  factory DeclarationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeclarationClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionClientCapabilities
    with _$DefinitionClientCapabilities {
  const factory DefinitionClientCapabilities({
    /// The client supports additional metadata in the form of definition links.
    /// @since 3.14.0
    bool? linkSupport,

    /// Whether definition supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DefinitionClientCapabilities;

  factory DefinitionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DefinitionClientCapabilitiesFromJson(json);
}

/// Since 3.6.0
@freezed
abstract class TypeDefinitionClientCapabilities
    with _$TypeDefinitionClientCapabilities {
  const factory TypeDefinitionClientCapabilities({
    /// The client supports additional metadata in the form of definition links.
    /// Since 3.14.0
    bool? linkSupport,

    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `TypeDefinitionRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _TypeDefinitionClientCapabilities;

  factory TypeDefinitionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionClientCapabilitiesFromJson(json);
}

/// @since 3.6.0
@freezed
abstract class ImplementationClientCapabilities
    with _$ImplementationClientCapabilities {
  const factory ImplementationClientCapabilities({
    /// The client supports additional metadata in the form of definition links.
    /// @since 3.14.0
    bool? linkSupport,

    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `ImplementationRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _ImplementationClientCapabilities;

  factory ImplementationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceClientCapabilities with _$ReferenceClientCapabilities {
  const factory ReferenceClientCapabilities({
    /// Whether references supports dynamic registration.
    bool? dynamicRegistration,
  }) = _ReferenceClientCapabilities;

  factory ReferenceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ReferenceClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightClientCapabilities
    with _$DocumentHighlightClientCapabilities {
  const factory DocumentHighlightClientCapabilities({
    /// Whether document highlight supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentHighlightClientCapabilities;

  factory DocumentHighlightClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolClientCapabilities
    with _$DocumentSymbolClientCapabilities {
  const factory DocumentSymbolClientCapabilities({
    /// The client supports an additional label presented in the UI when
    /// registering a document symbol provider.
    /// @since 3.16.0
    bool? labelSupport,

    /// The client supports tags on `SymbolInformation`. Tags are supported on
    /// `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
    /// Clients supporting tags have to handle unknown tags gracefully.
    /// @since 3.16.0
    ({List<SymbolTag> valueSet})? tagSupport,

    /// The client supports hierarchical document symbols.
    bool? hierarchicalDocumentSymbolSupport,

    /// Specific capabilities for the `SymbolKind` in the
    /// `textDocument/documentSymbol` request.
    ({List<SymbolKind>? valueSet})? symbolKind,

    /// Whether document symbol supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentSymbolClientCapabilities;

  factory DocumentSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolClientCapabilitiesFromJson(json);
}

/// The Client Capabilities of a {@link CodeActionRequest}.
@freezed
abstract class CodeActionClientCapabilities
    with _$CodeActionClientCapabilities {
  const factory CodeActionClientCapabilities({
    /// Whether the client honors the change annotations in text edits and
    /// resource operations returned via the `CodeAction#edit` property by for
    /// example presenting the workspace edit in the user interface and asking
    /// for confirmation.
    /// @since 3.16.0
    bool? honorsChangeAnnotations,

    /// Whether the client supports resolving additional code action properties
    /// via a separate `codeAction/resolve` request.
    /// @since 3.16.0
    ({List<String> properties})? resolveSupport,

    /// Whether code action supports the `data` property which is preserved
    /// between a `textDocument/codeAction` and a `codeAction/resolve` request.
    /// @since 3.16.0
    bool? dataSupport,

    /// Whether code action supports the `disabled` property.
    /// @since 3.16.0
    bool? disabledSupport,

    /// Whether code action supports the `isPreferred` property.
    /// @since 3.15.0
    bool? isPreferredSupport,

    /// The client support code action literals of type `CodeAction` as a valid
    /// response of the `textDocument/codeAction` request. If the property is
    /// not set the request can only return `Command` literals.
    /// @since 3.8.0
    ({({List<CodeActionKind> valueSet}) codeActionKind})?
    codeActionLiteralSupport,

    /// Whether code action supports dynamic registration.
    bool? dynamicRegistration,
  }) = _CodeActionClientCapabilities;

  factory CodeActionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeActionClientCapabilitiesFromJson(json);
}

/// The client capabilities  of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensClientCapabilities with _$CodeLensClientCapabilities {
  const factory CodeLensClientCapabilities({
    /// Whether code lens supports dynamic registration.
    bool? dynamicRegistration,
  }) = _CodeLensClientCapabilities;

  factory CodeLensClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeLensClientCapabilitiesFromJson(json);
}

/// The client capabilities of a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkClientCapabilities
    with _$DocumentLinkClientCapabilities {
  const factory DocumentLinkClientCapabilities({
    /// Whether the client supports the `tooltip` property on `DocumentLink`.
    /// @since 3.15.0
    bool? tooltipSupport,

    /// Whether document link supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentLinkClientCapabilities;

  factory DocumentLinkClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentColorClientCapabilities
    with _$DocumentColorClientCapabilities {
  const factory DocumentColorClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `DocumentColorRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _DocumentColorClientCapabilities;

  factory DocumentColorClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorClientCapabilitiesFromJson(json);
}

/// Client capabilities of a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingClientCapabilities
    with _$DocumentFormattingClientCapabilities {
  const factory DocumentFormattingClientCapabilities({
    /// Whether formatting supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentFormattingClientCapabilities;

  factory DocumentFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingClientCapabilitiesFromJson(json);
}

/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingClientCapabilities
    with _$DocumentRangeFormattingClientCapabilities {
  const factory DocumentRangeFormattingClientCapabilities({
    /// Whether the client supports formatting multiple ranges at once.
    /// @since 3.18.0 @proposed
    bool? rangesSupport,

    /// Whether range formatting supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentRangeFormattingClientCapabilities;

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingClientCapabilitiesFromJson(json);
}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingClientCapabilities
    with _$DocumentOnTypeFormattingClientCapabilities {
  const factory DocumentOnTypeFormattingClientCapabilities({
    /// Whether on type formatting supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentOnTypeFormattingClientCapabilities;

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingClientCapabilitiesFromJson(json);
}

@freezed
abstract class RenameClientCapabilities with _$RenameClientCapabilities {
  const factory RenameClientCapabilities({
    /// Whether the client honors the change annotations in text edits and
    /// resource operations returned via the rename request's workspace edit by
    /// for example presenting the workspace edit in the user interface and
    /// asking for confirmation.
    /// @since 3.16.0
    bool? honorsChangeAnnotations,

    /// Client supports the default behavior result.
    /// The value indicates the default behavior used by the client.
    /// @since 3.16.0
    PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior,

    /// Client supports testing for validity of rename operations before
    /// execution.
    /// @since 3.12.0
    bool? prepareSupport,

    /// Whether rename supports dynamic registration.
    bool? dynamicRegistration,
  }) = _RenameClientCapabilities;

  factory RenameClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$RenameClientCapabilitiesFromJson(json);
}

@freezed
abstract class FoldingRangeClientCapabilities
    with _$FoldingRangeClientCapabilities {
  const factory FoldingRangeClientCapabilities({
    /// Specific options for the folding range.
    /// @since 3.17.0
    ({bool? collapsedText})? foldingRange,

    /// Specific options for the folding range kind.
    /// @since 3.17.0
    ({List<FoldingRangeKind>? valueSet})? foldingRangeKind,

    /// If set, the client signals that it only supports folding complete
    /// lines. If set, client will ignore specified `startCharacter` and
    /// `endCharacter` properties in a FoldingRange.
    bool? lineFoldingOnly,

    /// The maximum number of folding ranges that the client prefers to receive
    /// per document. The value serves as a hint, servers are free to follow
    /// the limit.
    int? rangeLimit,

    /// Whether implementation supports dynamic registration for folding range
    /// providers. If this is set to `true` the client supports the new
    /// `FoldingRangeRegistrationOptions` return value for the corresponding
    /// server capability as well.
    bool? dynamicRegistration,
  }) = _FoldingRangeClientCapabilities;

  factory FoldingRangeClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class SelectionRangeClientCapabilities
    with _$SelectionRangeClientCapabilities {
  const factory SelectionRangeClientCapabilities({
    /// Whether implementation supports dynamic registration for selection
    /// range providers. If this is set to `true` the client supports the new
    /// `SelectionRangeRegistrationOptions` return value for the corresponding
    /// server capability as well.
    bool? dynamicRegistration,
  }) = _SelectionRangeClientCapabilities;

  factory SelectionRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SelectionRangeClientCapabilitiesFromJson(json);
}

/// The publish diagnostic client capabilities.
@freezed
abstract class PublishDiagnosticsClientCapabilities
    with _$PublishDiagnosticsClientCapabilities {
  const factory PublishDiagnosticsClientCapabilities({
    /// Whether code action supports the `data` property which is preserved
    /// between a `textDocument/publishDiagnostics` and
    /// `textDocument/codeAction` request.
    /// @since 3.16.0
    bool? dataSupport,

    /// Client supports a codeDescription property
    /// @since 3.16.0
    bool? codeDescriptionSupport,

    /// Whether the client interprets the version property of the
    /// `textDocument/publishDiagnostics` notification's parameter.
    /// @since 3.15.0
    bool? versionSupport,

    /// Client supports the tag property to provide meta data about a
    /// diagnostic. Clients supporting tags have to handle unknown tags
    /// gracefully.
    /// @since 3.15.0
    ({List<DiagnosticTag> valueSet})? tagSupport,

    /// Whether the clients accepts diagnostics with related information.
    bool? relatedInformation,
  }) = _PublishDiagnosticsClientCapabilities;

  factory PublishDiagnosticsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$PublishDiagnosticsClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class CallHierarchyClientCapabilities
    with _$CallHierarchyClientCapabilities {
  const factory CallHierarchyClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _CallHierarchyClientCapabilities;

  factory CallHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensClientCapabilities
    with _$SemanticTokensClientCapabilities {
  const factory SemanticTokensClientCapabilities({
    /// Which requests the client supports and might send to the server
    /// depending on the server's capability. Please note that clients might
    /// not show semantic tokens or degrade some of the user experience if a
    /// range or full request is advertised by the client but not provided by
    /// the server. If for example the client capability `requests.full` and
    /// `request.range` are both set to true but the server only provides a
    /// range provider the client might not render a minimap correctly or might
    /// even decide to not show any semantic tokens at all.
    required ({
      RangeBase? range,
      SemanticTokensClientCapabilitiesFullBase? full,
    })
    requests,

    /// The token types that the client supports.
    required List<String> tokenTypes,

    /// The token modifiers that the client supports.
    required List<String> tokenModifiers,

    /// The token formats the clients supports.
    required List<TokenFormat> formats,

    /// Whether the client uses semantic tokens to augment existing syntax
    /// tokens. If set to `true` client side created syntax tokens and semantic
    /// tokens are both used for colorization. If set to `false` the client
    /// only uses the returned semantic tokens for colorization.
    /// If the value is `undefined` then the client behavior is not specified.
    /// @since 3.17.0
    bool? augmentsSyntaxTokens,

    /// Whether the client allows the server to actively cancel a semantic
    /// token request, e.g. supports returning LSPErrorCodes.ServerCancelled.
    /// If a server does the client needs to retrigger the request.
    /// @since 3.17.0
    bool? serverCancelSupport,

    /// Whether the client supports tokens that can span multiple lines.
    bool? multilineTokenSupport,

    /// Whether the client supports tokens that can overlap each other.
    bool? overlappingTokenSupport,

    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _SemanticTokensClientCapabilities;

  factory SemanticTokensClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensClientCapabilitiesFromJson(json);
}

/// Client capabilities for the linked editing range request.
/// @since 3.16.0
@freezed
abstract class LinkedEditingRangeClientCapabilities
    with _$LinkedEditingRangeClientCapabilities {
  const factory LinkedEditingRangeClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _LinkedEditingRangeClientCapabilities;

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to the moniker request.
/// @since 3.16.0
@freezed
abstract class MonikerClientCapabilities with _$MonikerClientCapabilities {
  const factory MonikerClientCapabilities({
    /// Whether moniker supports dynamic registration. If this is set to `true`
    /// the client supports the new `MonikerRegistrationOptions` return value
    /// for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _MonikerClientCapabilities;

  factory MonikerClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MonikerClientCapabilitiesFromJson(json);
}

/// @since 3.17.0
@freezed
abstract class TypeHierarchyClientCapabilities
    with _$TypeHierarchyClientCapabilities {
  const factory TypeHierarchyClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _TypeHierarchyClientCapabilities;

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to inline values.
/// @since 3.17.0
@freezed
abstract class InlineValueClientCapabilities
    with _$InlineValueClientCapabilities {
  const factory InlineValueClientCapabilities({
    /// Whether implementation supports dynamic registration for inline value
    /// providers.
    bool? dynamicRegistration,
  }) = _InlineValueClientCapabilities;

  factory InlineValueClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlineValueClientCapabilitiesFromJson(json);
}

/// Inlay hint client capabilities.
/// @since 3.17.0
@freezed
abstract class InlayHintClientCapabilities with _$InlayHintClientCapabilities {
  const factory InlayHintClientCapabilities({
    /// Indicates which properties a client can resolve lazily on an inlay hint.
    ({List<String> properties})? resolveSupport,

    /// Whether inlay hints support dynamic registration.
    bool? dynamicRegistration,
  }) = _InlayHintClientCapabilities;

  factory InlayHintClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlayHintClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
@freezed
abstract class DiagnosticClientCapabilities
    with _$DiagnosticClientCapabilities {
  const factory DiagnosticClientCapabilities({
    /// Whether the clients supports related documents for document diagnostic
    /// pulls.
    bool? relatedDocumentSupport,

    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _DiagnosticClientCapabilities;

  factory DiagnosticClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to inline completions.
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionClientCapabilities
    with _$InlineCompletionClientCapabilities {
  const factory InlineCompletionClientCapabilities({
    /// Whether implementation supports dynamic registration for inline
    /// completion providers.
    bool? dynamicRegistration,
  }) = _InlineCompletionClientCapabilities;

  factory InlineCompletionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionClientCapabilitiesFromJson(json);
}

/// Notebook specific client capabilities.
/// @since 3.17.0
@freezed
abstract class NotebookDocumentSyncClientCapabilities
    with _$NotebookDocumentSyncClientCapabilities {
  const factory NotebookDocumentSyncClientCapabilities({
    /// The client supports sending execution summary data per cell.
    bool? executionSummarySupport,

    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _NotebookDocumentSyncClientCapabilities;

  factory NotebookDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncClientCapabilitiesFromJson(json);
}

/// Show message request client capabilities
@freezed
abstract class ShowMessageRequestClientCapabilities
    with _$ShowMessageRequestClientCapabilities {
  const factory ShowMessageRequestClientCapabilities({
    /// Capabilities specific to the `MessageActionItem` type.
    ({bool? additionalPropertiesSupport})? messageActionItem,
  }) = _ShowMessageRequestClientCapabilities;

  factory ShowMessageRequestClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ShowMessageRequestClientCapabilitiesFromJson(json);
}

/// Client capabilities for the showDocument request.
/// @since 3.16.0
@freezed
abstract class ShowDocumentClientCapabilities
    with _$ShowDocumentClientCapabilities {
  const factory ShowDocumentClientCapabilities({
    /// The client has support for the showDocument request.
    required bool support,
  }) = _ShowDocumentClientCapabilities;

  factory ShowDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to regular expressions.
/// @since 3.16.0
@freezed
abstract class RegularExpressionsClientCapabilities
    with _$RegularExpressionsClientCapabilities {
  const factory RegularExpressionsClientCapabilities({
    /// The engine's name.
    required String engine,

    /// The engine's version.
    String? version,
  }) = _RegularExpressionsClientCapabilities;

  factory RegularExpressionsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$RegularExpressionsClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to the used markdown parser.
/// @since 3.16.0
@freezed
abstract class MarkdownClientCapabilities with _$MarkdownClientCapabilities {
  const factory MarkdownClientCapabilities({
    /// The name of the parser.
    required String parser,

    /// A list of HTML tags that the client allows / supports in Markdown.
    /// @since 3.17.0
    List<String>? allowedTags,

    /// The version of the parser.
    String? version,
  }) = _MarkdownClientCapabilities;

  factory MarkdownClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MarkdownClientCapabilitiesFromJson(json);
}

/// A set of predefined token types. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum SemanticTokenTypes {
  namespace('namespace'),

  /// Represents a generic type. Acts as a fallback for types which
  /// can't be mapped to a specific type like class or enum.
  type('type'),
  class_('class'),
  enum_('enum'),
  interface_('interface'),
  struct('struct'),
  typeParameter('typeParameter'),
  parameter('parameter'),
  variable('variable'),
  property('property'),
  enumMember('enumMember'),
  event('event'),
  function('function'),
  method('method'),
  macro_('macro'),
  keyword('keyword'),
  modifier('modifier'),
  comment('comment'),
  string('string'),
  number('number'),
  regexp('regexp'),
  operator_('operator'),

  /// @since 3.17.0
  decorator('decorator');

  // The list of all values in this enumeration.
  const SemanticTokenTypes(this.value);

  // The type of this enumeration.
  final String value;
}

/// A set of predefined token modifiers. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum SemanticTokenModifiers {
  declaration('declaration'),
  definition('definition'),
  readonly('readonly'),
  static_('static'),
  deprecated_('deprecated'),
  abstract_('abstract'),
  async_('async'),
  modification('modification'),
  documentation('documentation'),
  defaultLibrary('defaultLibrary');

  // The list of all values in this enumeration.
  const SemanticTokenModifiers(this.value);

  // The type of this enumeration.
  final String value;
}

/// The document diagnostic report kinds.
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum DocumentDiagnosticReportKind {
  /// A diagnostic report with a full set of problems.
  full('full'),

  /// A report indicating that the last returned report is still
  /// accurate.
  unchanged('unchanged');

  // The list of all values in this enumeration.
  const DocumentDiagnosticReportKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// Predefined error codes.
@JsonEnum(valueField: 'value')
enum ErrorCodes {
  parseError(-32700),
  invalidRequest(-32600),
  methodNotFound(-32601),
  invalidParams(-32602),
  internalError(-32603),

  /// Error code indicating that a server received a notification or
  /// request before the server has received the `initialize` request.
  serverNotInitialized(-32002),
  unknownErrorCode(-32001);

  // The list of all values in this enumeration.
  const ErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

@JsonEnum(valueField: 'value')
enum LSPErrorCodes {
  /// A request failed but it was syntactically correct, e.g the method
  /// name was known and the parameters were valid. The error message
  /// should contain human readable information about why the request
  /// failed.
  /// @since 3.17.0
  requestFailed(-32803),

  /// The server cancelled the request. This error code should only be
  /// used for requests that explicitly support being server
  /// cancellable.
  /// @since 3.17.0
  serverCancelled(-32802),

  /// The server detected that the content of a document got modified
  /// outside normal conditions. A server should NOT send this error
  /// code if it detects a content change in it unprocessed messages.
  /// The result even computed on an older state might still be useful
  /// for the client.
  /// If a client decides that a result is not of any use anymore the
  /// client should cancel the request.
  contentModified(-32801),

  /// The client has canceled a request and a server has detected the
  /// cancel.
  requestCancelled(-32800);

  // The list of all values in this enumeration.
  const LSPErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined range kinds.
@JsonEnum(valueField: 'value')
enum FoldingRangeKind {
  /// Folding range for a comment
  comment('comment'),

  /// Folding range for an import or include
  imports('imports'),

  /// Folding range for a region (e.g. `#region`)
  region('region');

  // The list of all values in this enumeration.
  const FoldingRangeKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// A symbol kind.
@JsonEnum(valueField: 'value')
enum SymbolKind {
  file(1),
  module(2),
  namespace(3),
  package(4),
  class_(5),
  method(6),
  property(7),
  field(8),
  constructor(9),
  enum_(10),
  interface_(11),
  function(12),
  variable(13),
  constant(14),
  string(15),
  number(16),
  boolean(17),
  array(18),
  object(19),
  key(20),
  null_(21),
  enumMember(22),
  struct(23),
  event(24),
  operator_(25),
  typeParameter(26);

  // The list of all values in this enumeration.
  const SymbolKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
/// @since 3.16
@JsonEnum(valueField: 'value')
enum SymbolTag {
  /// Render a symbol as obsolete, usually using a strike-out.
  deprecated_(1);

  // The list of all values in this enumeration.
  const SymbolTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// Moniker uniqueness level to define scope of the moniker.
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum UniquenessLevel {
  /// The moniker is only unique inside a document
  document('document'),

  /// The moniker is unique inside a project for which a dump got
  /// created
  project('project'),

  /// The moniker is unique inside the group to which a project belongs
  group('group'),

  /// The moniker is unique inside the moniker scheme.
  scheme('scheme'),

  /// The moniker is globally unique
  global('global');

  // The list of all values in this enumeration.
  const UniquenessLevel(this.value);

  // The type of this enumeration.
  final String value;
}

/// The moniker kind.
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum MonikerKind {
  /// The moniker represent a symbol that is imported into a project
  import('import'),

  /// The moniker represents a symbol that is exported from a project
  export('export'),

  /// The moniker represents a symbol that is local to a project (e.g.
  /// a local variable of a function, a class not visible outside the
  /// project, ...)
  local('local');

  // The list of all values in this enumeration.
  const MonikerKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// Inlay hint kinds.
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum InlayHintKind {
  /// An inlay hint that for a type annotation.
  type(1),

  /// An inlay hint that is for a parameter.
  parameter(2);

  // The list of all values in this enumeration.
  const InlayHintKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The message type
@JsonEnum(valueField: 'value')
enum MessageType {
  /// An error message.
  error(1),

  /// A warning message.
  warning(2),

  /// An information message.
  info(3),

  /// A log message.
  log(4),

  /// A debug message.
  /// @since 3.18.0
  debug(5);

  // The list of all values in this enumeration.
  const MessageType(this.value);

  // The type of this enumeration.
  final int value;
}

/// Defines how the host (editor) should sync document changes to the language
/// server.
@JsonEnum(valueField: 'value')
enum TextDocumentSyncKind {
  /// Documents should not be synced at all.
  none(0),

  /// Documents are synced by always sending the full content of the
  /// document.
  full(1),

  /// Documents are synced by sending the full content on open. After
  /// that only incremental updates to the document are send.
  incremental(2);

  // The list of all values in this enumeration.
  const TextDocumentSyncKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// Represents reasons why a text document is saved.
@JsonEnum(valueField: 'value')
enum TextDocumentSaveReason {
  /// Manually triggered, e.g. by the user pressing save, by starting
  /// debugging, or by an API call.
  manual(1),

  /// Automatic after a delay.
  afterDelay(2),

  /// When the editor lost focus.
  focusOut(3);

  // The list of all values in this enumeration.
  const TextDocumentSaveReason(this.value);

  // The type of this enumeration.
  final int value;
}

/// The kind of a completion entry.
@JsonEnum(valueField: 'value')
enum CompletionItemKind {
  text(1),
  method(2),
  function(3),
  constructor(4),
  field(5),
  variable(6),
  class_(7),
  interface_(8),
  module(9),
  property(10),
  unit(11),
  value_(12),
  enum_(13),
  keyword(14),
  snippet(15),
  color(16),
  file(17),
  reference(18),
  folder(19),
  enumMember(20),
  constant(21),
  struct(22),
  event(23),
  operator_(24),
  typeParameter(25);

  // The list of all values in this enumeration.
  const CompletionItemKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// Completion item tags are extra annotations that tweak the rendering of a
/// completion item.
/// @since 3.15.0
@JsonEnum(valueField: 'value')
enum CompletionItemTag {
  /// Render a completion as obsolete, usually using a strike-out.
  deprecated_(1);

  // The list of all values in this enumeration.
  const CompletionItemTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// Defines whether the insert text in a completion item should be interpreted
/// as plain text or a snippet.
@JsonEnum(valueField: 'value')
enum InsertTextFormat {
  /// The primary text to be inserted is treated as a plain string.
  plainText(1),

  /// The primary text to be inserted is treated as a snippet.
  /// A snippet can define tab stops and placeholders with `$1`, `$2`
  /// and `${3:foo}`. `$0` defines the final tab stop, it defaults to
  /// the end of the snippet. Placeholders with equal identifiers are
  /// linked, that is typing in one will update others too.
  /// See also:
  /// https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
  snippet(2);

  // The list of all values in this enumeration.
  const InsertTextFormat(this.value);

  // The type of this enumeration.
  final int value;
}

/// How whitespace and indentation is handled during completion item insertion.
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum InsertTextMode {
  /// The insertion or replace strings is taken as it is. If the value
  /// is multi line the lines below the cursor will be inserted using
  /// the indentation defined in the string value. The client will not
  /// apply any kind of adjustments to the string.
  asIs(1),

  /// The editor adjusts leading whitespace of new lines so that they
  /// match the indentation up to the cursor of the line for which the
  /// item is accepted.
  /// Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
  /// multi line completion item is indented using 2 tabs and all
  /// following lines inserted will be indented using 2 tabs as well.
  adjustIndentation(2);

  // The list of all values in this enumeration.
  const InsertTextMode(this.value);

  // The type of this enumeration.
  final int value;
}

/// A document highlight kind.
@JsonEnum(valueField: 'value')
enum DocumentHighlightKind {
  /// A textual occurrence.
  text(1),

  /// Read-access of a symbol, like reading a variable.
  read(2),

  /// Write-access of a symbol, like writing to a variable.
  write(3);

  // The list of all values in this enumeration.
  const DocumentHighlightKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined code action kinds
@JsonEnum(valueField: 'value')
enum CodeActionKind {
  /// Empty kind.
  empty(''),

  /// Base kind for quickfix actions: 'quickfix'
  quickFix('quickfix'),

  /// Base kind for refactoring actions: 'refactor'
  refactor('refactor'),

  /// Base kind for refactoring extraction actions: 'refactor.extract'
  /// Example extract actions:
  /// - Extract method - Extract function - Extract variable - Extract
  /// interface from class - ...
  refactorExtract('refactor.extract'),

  /// Base kind for refactoring inline actions: 'refactor.inline'
  /// Example inline actions:
  /// - Inline function - Inline variable - Inline constant - ...
  refactorInline('refactor.inline'),

  /// Base kind for refactoring rewrite actions: 'refactor.rewrite'
  /// Example rewrite actions:
  /// - Convert JavaScript function to class - Add or remove parameter
  /// - Encapsulate field - Make method static - Move method to base
  /// class - ...
  refactorRewrite('refactor.rewrite'),

  /// Base kind for source actions: `source`
  /// Source code actions apply to the entire file.
  source('source'),

  /// Base kind for an organize imports source action:
  /// `source.organizeImports`
  sourceOrganizeImports('source.organizeImports'),

  /// Base kind for auto-fix source actions: `source.fixAll`.
  /// Fix all actions automatically fix errors that have a clear fix
  /// that do not require user input. They should not suppress errors
  /// or perform unsafe fixes such as generating new types or classes.
  /// @since 3.15.0
  sourceFixAll('source.fixAll');

  // The list of all values in this enumeration.
  const CodeActionKind(this.value);

  // The type of this enumeration.
  final String value;
}

@JsonEnum(valueField: 'value')
enum TraceValues {
  /// Turn tracing off.
  off('off'),

  /// Trace messages only.
  messages('messages'),

  /// Verbose message tracing.
  verbose('verbose');

  // The list of all values in this enumeration.
  const TraceValues(this.value);

  // The type of this enumeration.
  final String value;
}

/// Describes the content type that a client supports in various result
/// literals like `Hover`, `ParameterInfo` or `CompletionItem`.
/// Please note that `MarkupKinds` must not start with a `$`. This kinds are
/// reserved for internal usage.
@JsonEnum(valueField: 'value')
enum MarkupKind {
  /// Plain text is supported as a content format
  plainText('plaintext'),

  /// Markdown is supported as a content format
  markdown('markdown');

  // The list of all values in this enumeration.
  const MarkupKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// Describes how an {@link InlineCompletionItemProvider inline completion
/// provider} was triggered.
/// @since 3.18.0 @proposed
@JsonEnum(valueField: 'value')
enum InlineCompletionTriggerKind {
  /// Completion was triggered explicitly by a user gesture.
  invoked(0),

  /// Completion was triggered automatically while editing.
  automatic(1);

  // The list of all values in this enumeration.
  const InlineCompletionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined position encoding kinds.
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum PositionEncodingKind {
  /// Character offsets count UTF-8 code units (e.g. bytes).
  uTF8('utf-8'),

  /// Character offsets count UTF-16 code units.
  /// This is the default and must always be supported by servers
  uTF16('utf-16'),

  /// Character offsets count UTF-32 code units.
  /// Implementation note: these are the same as Unicode codepoints, so
  /// this `PositionEncodingKind` may also be used for an
  /// encoding-agnostic representation of character offsets.
  uTF32('utf-32');

  // The list of all values in this enumeration.
  const PositionEncodingKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// The file event type
@JsonEnum(valueField: 'value')
enum FileChangeType {
  /// The file got created.
  created(1),

  /// The file got changed.
  changed(2),

  /// The file got deleted.
  deleted(3);

  // The list of all values in this enumeration.
  const FileChangeType(this.value);

  // The type of this enumeration.
  final int value;
}

@JsonEnum(valueField: 'value')
enum WatchKind {
  /// Interested in create events.
  create(1),

  /// Interested in change events
  change(2),

  /// Interested in delete events
  delete(4);

  // The list of all values in this enumeration.
  const WatchKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The diagnostic's severity.
@JsonEnum(valueField: 'value')
enum DiagnosticSeverity {
  /// Reports an error.
  error(1),

  /// Reports a warning.
  warning(2),

  /// Reports an information.
  information(3),

  /// Reports a hint.
  hint(4);

  // The list of all values in this enumeration.
  const DiagnosticSeverity(this.value);

  // The type of this enumeration.
  final int value;
}

/// The diagnostic tags.
/// @since 3.15.0
@JsonEnum(valueField: 'value')
enum DiagnosticTag {
  /// Unused or unnecessary code.
  /// Clients are allowed to render diagnostics with this tag faded out
  /// instead of having an error squiggle.
  unnecessary(1),

  /// Deprecated or obsolete code.
  /// Clients are allowed to rendered diagnostics with this tag strike
  /// through.
  deprecated_(2);

  // The list of all values in this enumeration.
  const DiagnosticTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// How a completion was triggered
@JsonEnum(valueField: 'value')
enum CompletionTriggerKind {
  /// Completion was triggered by typing an identifier (24x7 code
  /// complete), manual invocation (e.g Ctrl+Space) or via API.
  invoked(1),

  /// Completion was triggered by a trigger character specified by the
  /// `triggerCharacters` properties of the
  /// `CompletionRegistrationOptions`.
  triggerCharacter(2),

  /// Completion was re-triggered as current completion list is
  /// incomplete
  triggerForIncompleteCompletions(3);

  // The list of all values in this enumeration.
  const CompletionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// How a signature help was triggered.
/// @since 3.15.0
@JsonEnum(valueField: 'value')
enum SignatureHelpTriggerKind {
  /// Signature help was invoked manually by the user or by a command.
  invoked(1),

  /// Signature help was triggered by a trigger character.
  triggerCharacter(2),

  /// Signature help was triggered by the cursor moving or by the
  /// document content changing.
  contentChange(3);

  // The list of all values in this enumeration.
  const SignatureHelpTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The reason why code actions were requested.
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum CodeActionTriggerKind {
  /// Code actions were explicitly requested by the user or by an
  /// extension.
  invoked(1),

  /// Code actions were requested automatically.
  /// This typically happens when current selection in a file changes,
  /// but can also be triggered when file content changes.
  automatic(2);

  // The list of all values in this enumeration.
  const CodeActionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// A pattern kind describing if a glob pattern matches a file a folder or both.
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum FileOperationPatternKind {
  /// The pattern matches a file only.
  file('file'),

  /// The pattern matches a folder only.
  folder('folder');

  // The list of all values in this enumeration.
  const FileOperationPatternKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// A notebook cell kind.
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum NotebookCellKind {
  /// A markup-cell is formatted source that is used for display.
  markup(1),

  /// A code-cell is source code.
  code(2);

  // The list of all values in this enumeration.
  const NotebookCellKind(this.value);

  // The type of this enumeration.
  final int value;
}

@JsonEnum(valueField: 'value')
enum ResourceOperationKind {
  /// Supports creating new files and folders.
  create('create'),

  /// Supports renaming existing files and folders.
  rename('rename'),

  /// Supports deleting existing files and folders.
  delete('delete');

  // The list of all values in this enumeration.
  const ResourceOperationKind(this.value);

  // The type of this enumeration.
  final String value;
}

@JsonEnum(valueField: 'value')
enum FailureHandlingKind {
  /// Applying the workspace change is simply aborted if one of the
  /// changes provided fails. All operations executed before the
  /// failing operation stay executed.
  abort('abort'),

  /// All operations are executed transactional. That means they either
  /// all succeed or no changes at all are applied to the workspace.
  transactional('transactional'),

  /// If the workspace edit contains only textual file changes they are
  /// executed transactional. If resource changes (create, rename or
  /// delete file) are part of the change the failure handling strategy
  /// is abort.
  textOnlyTransactional('textOnlyTransactional'),

  /// The client tries to undo the operations already executed. But
  /// there is no guarantee that this is succeeding.
  undo('undo');

  // The list of all values in this enumeration.
  const FailureHandlingKind(this.value);

  // The type of this enumeration.
  final String value;
}

@JsonEnum(valueField: 'value')
enum PrepareSupportDefaultBehavior {
  /// The client's default behavior is to select the identifier
  /// according the to language's syntax rule.
  identifier(1);

  // The list of all values in this enumeration.
  const PrepareSupportDefaultBehavior(this.value);

  // The type of this enumeration.
  final int value;
}

@JsonEnum(valueField: 'value')
enum TokenFormat {
  relative('relative');

  // The list of all values in this enumeration.
  const TokenFormat(this.value);

  // The type of this enumeration.
  final String value;
}

/// This class contains methods for handling requests.
enum RequestMethod {
  /// Method: textDocument/implementation
  ///
  /// A request to resolve the implementation locations of a symbol at
  /// a given text document position. The request's parameter is of
  /// type {@link TextDocumentPositionParams} the response is of type
  /// {@link Definition} or a Thenable that resolves to such.
  textDocumentImplementation('textDocument/implementation'),

  /// Method: textDocument/typeDefinition
  ///
  /// A request to resolve the type definition locations of a symbol at
  /// a given text document position. The request's parameter is of
  /// type {@link TextDocumentPositionParams} the response is of type
  /// {@link Definition} or a Thenable that resolves to such.
  textDocumentTypeDefinition('textDocument/typeDefinition'),

  /// Method: workspace/workspaceFolders
  ///
  /// The `workspace/workspaceFolders` is sent from the server to the
  /// client to fetch the open workspace folders.
  workspaceWorkspaceFolders('workspace/workspaceFolders'),

  /// Method: workspace/configuration
  ///
  /// The 'workspace/configuration' request is sent from the server to
  /// the client to fetch a certain configuration setting.
  /// This pull model replaces the old push model where the client
  /// signaled configuration change via an event. If the server still
  /// needs to react to configuration changes (since the server caches
  /// the result of `workspace/configuration` requests) the server
  /// should register for an empty configuration change event and empty
  /// the cache if such an event is received.
  workspaceConfiguration('workspace/configuration'),

  /// Method: textDocument/documentColor
  ///
  /// A request to list all color symbols found in a given text
  /// document. The request's parameter is of type {@link
  /// DocumentColorParams} the response is of type {@link
  /// ColorInformation ColorInformation[]} or a Thenable that resolves
  /// to such.
  textDocumentDocumentColor('textDocument/documentColor'),

  /// Method: textDocument/colorPresentation
  ///
  /// A request to list all presentation for a color. The request's
  /// parameter is of type {@link ColorPresentationParams} the response
  /// is of type {@link ColorInformation ColorInformation[]} or a
  /// Thenable that resolves to such.
  textDocumentColorPresentation('textDocument/colorPresentation'),

  /// Method: textDocument/foldingRange
  ///
  /// A request to provide folding ranges in a document. The request's
  /// parameter is of type {@link FoldingRangeParams}, the response is
  /// of type {@link FoldingRangeList} or a Thenable that resolves to
  /// such.
  textDocumentFoldingRange('textDocument/foldingRange'),

  /// Method: workspace/foldingRange/refresh
  ///
  /// @since 3.18.0 @proposed
  workspaceFoldingRangeRefresh('workspace/foldingRange/refresh'),

  /// Method: textDocument/declaration
  ///
  /// A request to resolve the type definition locations of a symbol at
  /// a given text document position. The request's parameter is of
  /// type {@link TextDocumentPositionParams} the response is of type
  /// {@link Declaration} or a typed array of {@link DeclarationLink}
  /// or a Thenable that resolves to such.
  textDocumentDeclaration('textDocument/declaration'),

  /// Method: textDocument/selectionRange
  ///
  /// A request to provide selection ranges in a document. The
  /// request's parameter is of type {@link SelectionRangeParams}, the
  /// response is of type {@link SelectionRange SelectionRange[]} or a
  /// Thenable that resolves to such.
  textDocumentSelectionRange('textDocument/selectionRange'),

  /// Method: window/workDoneProgress/create
  ///
  /// The `window/workDoneProgress/create` request is sent from the
  /// server to the client to initiate progress reporting from the
  /// server.
  windowWorkDoneProgressCreate('window/workDoneProgress/create'),

  /// Method: textDocument/prepareCallHierarchy
  ///
  /// A request to result a `CallHierarchyItem` in a document at a
  /// given position. Can be used as an input to an incoming or
  /// outgoing call hierarchy.
  /// @since 3.16.0
  textDocumentPrepareCallHierarchy('textDocument/prepareCallHierarchy'),

  /// Method: callHierarchy/incomingCalls
  ///
  /// A request to resolve the incoming calls for a given
  /// `CallHierarchyItem`.
  /// @since 3.16.0
  callHierarchyIncomingCalls('callHierarchy/incomingCalls'),

  /// Method: callHierarchy/outgoingCalls
  ///
  /// A request to resolve the outgoing calls for a given
  /// `CallHierarchyItem`.
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
  /// A request to show a document. This request might open an external
  /// program depending on the value of the URI to open. For example a
  /// request to open `https://code.visualstudio.com/` will very likely
  /// open the URI in a WEB browser.
  /// @since 3.16.0
  windowShowDocument('window/showDocument'),

  /// Method: textDocument/linkedEditingRange
  ///
  /// A request to provide ranges that can be edited together.
  /// @since 3.16.0
  textDocumentLinkedEditingRange('textDocument/linkedEditingRange'),

  /// Method: workspace/willCreateFiles
  ///
  /// The will create files request is sent from the client to the
  /// server before files are actually created as long as the creation
  /// is triggered from within the client.
  /// The request can return a `WorkspaceEdit` which will be applied to
  /// workspace before the files are created. Hence the `WorkspaceEdit`
  /// can not manipulate the content of the file to be created.
  /// @since 3.16.0
  workspaceWillCreateFiles('workspace/willCreateFiles'),

  /// Method: workspace/willRenameFiles
  ///
  /// The will rename files request is sent from the client to the
  /// server before files are actually renamed as long as the rename is
  /// triggered from within the client.
  /// @since 3.16.0
  workspaceWillRenameFiles('workspace/willRenameFiles'),

  /// Method: workspace/willDeleteFiles
  ///
  /// The did delete files notification is sent from the client to the
  /// server when files were deleted from within the client.
  /// @since 3.16.0
  workspaceWillDeleteFiles('workspace/willDeleteFiles'),

  /// Method: textDocument/moniker
  ///
  /// A request to get the moniker of a symbol at a given text document
  /// position. The request parameter is of type {@link
  /// TextDocumentPositionParams}. The response is of type {@link
  /// Moniker Moniker[]} or `null`.
  textDocumentMoniker('textDocument/moniker'),

  /// Method: textDocument/prepareTypeHierarchy
  ///
  /// A request to result a `TypeHierarchyItem` in a document at a
  /// given position. Can be used as an input to a subtypes or
  /// supertypes type hierarchy.
  /// @since 3.17.0
  textDocumentPrepareTypeHierarchy('textDocument/prepareTypeHierarchy'),

  /// Method: typeHierarchy/supertypes
  ///
  /// A request to resolve the supertypes for a given
  /// `TypeHierarchyItem`.
  /// @since 3.17.0
  typeHierarchySupertypes('typeHierarchy/supertypes'),

  /// Method: typeHierarchy/subtypes
  ///
  /// A request to resolve the subtypes for a given `TypeHierarchyItem`.
  /// @since 3.17.0
  typeHierarchySubtypes('typeHierarchy/subtypes'),

  /// Method: textDocument/inlineValue
  ///
  /// A request to provide inline values in a document. The request's
  /// parameter is of type {@link InlineValueParams}, the response is
  /// of type {@link InlineValue InlineValue[]} or a Thenable that
  /// resolves to such.
  /// @since 3.17.0
  textDocumentInlineValue('textDocument/inlineValue'),

  /// Method: workspace/inlineValue/refresh
  ///
  /// @since 3.17.0
  workspaceInlineValueRefresh('workspace/inlineValue/refresh'),

  /// Method: textDocument/inlayHint
  ///
  /// A request to provide inlay hints in a document. The request's
  /// parameter is of type {@link InlayHintsParams}, the response is of
  /// type {@link InlayHint InlayHint[]} or a Thenable that resolves to
  /// such.
  /// @since 3.17.0
  textDocumentInlayHint('textDocument/inlayHint'),

  /// Method: inlayHint/resolve
  ///
  /// A request to resolve additional properties for an inlay hint. The
  /// request's parameter is of type {@link InlayHint}, the response is
  /// of type {@link InlayHint} or a Thenable that resolves to such.
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
  /// A request to provide inline completions in a document. The
  /// request's parameter is of type {@link InlineCompletionParams},
  /// the response is of type {@link InlineCompletion
  /// InlineCompletion[]} or a Thenable that resolves to such.
  /// @since 3.18.0 @proposed
  textDocumentInlineCompletion('textDocument/inlineCompletion'),

  /// Method: client/registerCapability
  ///
  /// The `client/registerCapability` request is sent from the server
  /// to the client to register a new capability handler on the client
  /// side.
  clientRegisterCapability('client/registerCapability'),

  /// Method: client/unregisterCapability
  ///
  /// The `client/unregisterCapability` request is sent from the server
  /// to the client to unregister a previously registered capability
  /// handler on the client side.
  clientUnregisterCapability('client/unregisterCapability'),

  /// Method: initialize
  ///
  /// The initialize request is sent from the client to the server. It
  /// is sent once as the request after starting up the server. The
  /// requests parameter is of type {@link InitializeParams} the
  /// response if of type {@link InitializeResult} of a Thenable that
  /// resolves to such.
  initialize('initialize'),

  /// Method: shutdown
  ///
  /// A shutdown request is sent from the client to the server. It is
  /// sent once when the client decides to shutdown the server. The
  /// only notification that is sent after a shutdown request is the
  /// exit event.
  shutdown('shutdown'),

  /// Method: window/showMessageRequest
  ///
  /// The show message request is sent from the server to the client to
  /// show a message and a set of options actions to the user.
  windowShowMessageRequest('window/showMessageRequest'),

  /// Method: textDocument/willSaveWaitUntil
  ///
  /// A document will save request is sent from the client to the
  /// server before the document is actually saved. The request can
  /// return an array of TextEdits which will be applied to the text
  /// document before it is saved. Please note that clients might drop
  /// results if computing the text edits took too long or if a server
  /// constantly fails on this request. This is done to keep the save
  /// fast and reliable.
  textDocumentWillSaveWaitUntil('textDocument/willSaveWaitUntil'),

  /// Method: textDocument/completion
  ///
  /// Request to request completion at a given text document position.
  /// The request's parameter is of type {@link TextDocumentPosition}
  /// the response is of type {@link CompletionItem CompletionItem[]}
  /// or {@link CompletionList} or a Thenable that resolves to such.
  /// The request can delay the computation of the {@link
  /// CompletionItem.detail `detail`} and {@link
  /// CompletionItem.documentation `documentation`} properties to the
  /// `completionItem/resolve` request. However, properties that are
  /// needed for the initial sorting and filtering, like `sortText`,
  /// `filterText`, `insertText`, and `textEdit`, must not be changed
  /// during resolve.
  textDocumentCompletion('textDocument/completion'),

  /// Method: completionItem/resolve
  ///
  /// Request to resolve additional information for a given completion
  /// item.The request's parameter is of type {@link CompletionItem}
  /// the response is of type {@link CompletionItem} or a Thenable that
  /// resolves to such.
  completionItemResolve('completionItem/resolve'),

  /// Method: textDocument/hover
  ///
  /// Request to request hover information at a given text document
  /// position. The request's parameter is of type {@link
  /// TextDocumentPosition} the response is of type {@link Hover} or a
  /// Thenable that resolves to such.
  textDocumentHover('textDocument/hover'),

  /// Method: textDocument/signatureHelp
  ///
  textDocumentSignatureHelp('textDocument/signatureHelp'),

  /// Method: textDocument/definition
  ///
  /// A request to resolve the definition location of a symbol at a
  /// given text document position. The request's parameter is of type
  /// {@link TextDocumentPosition} the response is of either type
  /// {@link Definition} or a typed array of {@link DefinitionLink} or
  /// a Thenable that resolves to such.
  textDocumentDefinition('textDocument/definition'),

  /// Method: textDocument/references
  ///
  /// A request to resolve project-wide references for the symbol
  /// denoted by the given text document position. The request's
  /// parameter is of type {@link ReferenceParams} the response is of
  /// type {@link Location Location[]} or a Thenable that resolves to
  /// such.
  textDocumentReferences('textDocument/references'),

  /// Method: textDocument/documentHighlight
  ///
  /// Request to resolve a {@link DocumentHighlight} for a given text
  /// document position. The request's parameter is of type {@link
  /// TextDocumentPosition} the request response is an array of type
  /// {@link DocumentHighlight} or a Thenable that resolves to such.
  textDocumentDocumentHighlight('textDocument/documentHighlight'),

  /// Method: textDocument/documentSymbol
  ///
  /// A request to list all symbols found in a given text document. The
  /// request's parameter is of type {@link TextDocumentIdentifier} the
  /// response is of type {@link SymbolInformation SymbolInformation[]}
  /// or a Thenable that resolves to such.
  textDocumentDocumentSymbol('textDocument/documentSymbol'),

  /// Method: textDocument/codeAction
  ///
  /// A request to provide commands for the given text document and
  /// range.
  textDocumentCodeAction('textDocument/codeAction'),

  /// Method: codeAction/resolve
  ///
  /// Request to resolve additional information for a given code
  /// action.The request's parameter is of type {@link CodeAction} the
  /// response is of type {@link CodeAction} or a Thenable that
  /// resolves to such.
  codeActionResolve('codeAction/resolve'),

  /// Method: workspace/symbol
  ///
  /// A request to list project-wide symbols matching the query string
  /// given by the {@link WorkspaceSymbolParams}. The response is of
  /// type {@link SymbolInformation SymbolInformation[]} or a Thenable
  /// that resolves to such.
  /// @since 3.17.0 - support for WorkspaceSymbol in the returned data.
  /// Clients need to advertise support for WorkspaceSymbols via the
  /// client capability `workspace.symbol.resolveSupport`.
  workspaceSymbol('workspace/symbol'),

  /// Method: workspaceSymbol/resolve
  ///
  /// A request to resolve the range inside the workspace symbol's
  /// location.
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
  /// Request to resolve additional information for a given document
  /// link. The request's parameter is of type {@link DocumentLink} the
  /// response is of type {@link DocumentLink} or a Thenable that
  /// resolves to such.
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
  /// A request send from the client to the server to execute a
  /// command. The request might return a workspace edit which the
  /// client will apply to the workspace.
  workspaceExecuteCommand('workspace/executeCommand'),

  /// Method: workspace/applyEdit
  ///
  /// A request sent from the server to the client to modified certain
  /// resources.
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
  /// The `workspace/didChangeWorkspaceFolders` notification is sent
  /// from the client to the server when the workspace folder
  /// configuration changes.
  workspaceDidChangeWorkspaceFolders('workspace/didChangeWorkspaceFolders'),

  /// Method: window/workDoneProgress/cancel
  ///
  /// The `window/workDoneProgress/cancel` notification is sent from
  /// the client to the server to cancel a progress initiated on the
  /// server side.
  windowWorkDoneProgressCancel('window/workDoneProgress/cancel'),

  /// Method: workspace/didCreateFiles
  ///
  /// The did create files notification is sent from the client to the
  /// server when files were created from within the client.
  /// @since 3.16.0
  workspaceDidCreateFiles('workspace/didCreateFiles'),

  /// Method: workspace/didRenameFiles
  ///
  /// The did rename files notification is sent from the client to the
  /// server when files were renamed from within the client.
  /// @since 3.16.0
  workspaceDidRenameFiles('workspace/didRenameFiles'),

  /// Method: workspace/didDeleteFiles
  ///
  /// The will delete files request is sent from the client to the
  /// server before files are actually deleted as long as the deletion
  /// is triggered from within the client.
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
  /// The initialized notification is sent from the client to the
  /// server after the client is fully initialized and the server is
  /// allowed to send requests from the server to the client.
  initialized('initialized'),

  /// Method: exit
  ///
  /// The exit event is sent from the client to the server to ask the
  /// server to exit its process.
  exit('exit'),

  /// Method: workspace/didChangeConfiguration
  ///
  /// The configuration change notification is sent from the client to
  /// the server when the client's configuration has changed. The
  /// notification contains the changed configuration as defined by the
  /// language client.
  workspaceDidChangeConfiguration('workspace/didChangeConfiguration'),

  /// Method: window/showMessage
  ///
  /// The show message notification is sent from a server to a client
  /// to ask the client to display a particular message in the user
  /// interface.
  windowShowMessage('window/showMessage'),

  /// Method: window/logMessage
  ///
  /// The log message notification is sent from the server to the
  /// client to ask the client to log a particular message.
  windowLogMessage('window/logMessage'),

  /// Method: telemetry/event
  ///
  /// The telemetry event notification is sent from the server to the
  /// client to ask the client to log telemetry data.
  telemetryEvent('telemetry/event'),

  /// Method: textDocument/didOpen
  ///
  /// The document open notification is sent from the client to the
  /// server to signal newly opened text documents. The document's
  /// truth is now managed by the client and the server must not try to
  /// read the document's truth using the document's uri. Open in this
  /// sense means it is managed by the client. It doesn't necessarily
  /// mean that its content is presented in an editor. An open
  /// notification must not be sent more than once without a
  /// corresponding close notification send before. This means open and
  /// close notification must be balanced and the max open count is
  /// one.
  textDocumentDidOpen('textDocument/didOpen'),

  /// Method: textDocument/didChange
  ///
  /// The document change notification is sent from the client to the
  /// server to signal changes to a text document.
  textDocumentDidChange('textDocument/didChange'),

  /// Method: textDocument/didClose
  ///
  /// The document close notification is sent from the client to the
  /// server when the document got closed in the client. The document's
  /// truth now exists where the document's uri points to (e.g. if the
  /// document's uri is a file uri the truth now exists on disk). As
  /// with the open notification the close notification is about
  /// managing the document's content. Receiving a close notification
  /// doesn't mean that the document was open in an editor before. A
  /// close notification requires a previous open notification to be
  /// sent.
  textDocumentDidClose('textDocument/didClose'),

  /// Method: textDocument/didSave
  ///
  /// The document save notification is sent from the client to the
  /// server when the document got saved in the client.
  textDocumentDidSave('textDocument/didSave'),

  /// Method: textDocument/willSave
  ///
  /// A document will save notification is sent from the client to the
  /// server before the document is actually saved.
  textDocumentWillSave('textDocument/willSave'),

  /// Method: workspace/didChangeWatchedFiles
  ///
  /// The watched files notification is sent from the client to the
  /// server when the client detects changes to file watched by the
  /// language client.
  workspaceDidChangeWatchedFiles('workspace/didChangeWatchedFiles'),

  /// Method: textDocument/publishDiagnostics
  ///
  /// Diagnostics notification are sent from the server to the client
  /// to signal results of validation runs.
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
