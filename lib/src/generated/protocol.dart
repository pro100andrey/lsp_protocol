/// Do not edit it manually.

// ignore_for_file: doc_directive_unknown
library; // Freezed header not implemented for generation

import 'package:freezed_annotation/freezed_annotation.dart';
part 'protocol.freezed.dart';
part 'protocol.g.dart';

const String kLSPVersion = '3.17.0';

/// The definition of a symbol represented as one or many {@link Location
/// locations}. For most programming languages there is only one location at
/// which a symbol is defined.
/// Servers should prefer returning `DefinitionLink` over `Definition` if
/// supported by the client.
typedef Definition = dynamic;

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
typedef LSPAny = dynamic;

/// The declaration of a symbol representation as one or many {@link Location
/// locations}.
typedef Declaration = dynamic;

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
typedef InlineValue = dynamic;

/// The result of a document diagnostic pull request. A report can either be a
/// full report containing all diagnostics for the requested document or an
/// unchanged report indicating that nothing has changed in terms of
/// diagnostics in comparison to the last pull request.
/// @since 3.17.0
typedef DocumentDiagnosticReport = dynamic;
typedef PrepareRenameResult = dynamic;

/// A document selector is the combination of one or many document filters.
/// @sample `let sel:DocumentSelector = [{ language: 'typescript' }, {
/// language: 'json', pattern: '**∕tsconfig.json' }]`;
/// The use of a string as a document filter is deprecated @since 3.16.0.
typedef DocumentSelector = List<DocumentFilter>;
typedef ProgressToken = dynamic;

/// An identifier to refer to a change annotation stored with a workspace edit.
typedef ChangeAnnotationIdentifier = String;

/// A workspace diagnostic document report.
/// @since 3.17.0
typedef WorkspaceDocumentDiagnosticReport = dynamic;

/// An event describing a change to a text document. If only a text is provided
/// it is considered to be the full content of the document.
typedef TextDocumentContentChangeEvent = dynamic;

/// MarkedString can be used to render human readable text. It is either a
/// markdown string or a code-block that provides a language and a code
/// snippet. The language identifier is semantically equal to the optional
/// language identifier in fenced code blocks in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
/// The pair of a language and a value is an equivalent to markdown:
/// ```${language} ${value} ```
/// Note that markdown strings will be sanitized - that means html will be
/// escaped. @deprecated use MarkupContent instead.
typedef MarkedString = dynamic;

/// A document filter describes a top level text document or a notebook cell
/// document.
/// @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
typedef DocumentFilter = dynamic;

/// LSP object definition. @since 3.17.0
typedef LSPObject = Map<String, LSPAny>;

/// The glob pattern. Either a string pattern or a relative pattern.
/// @since 3.17.0
typedef GlobPattern = dynamic;

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
typedef TextDocumentFilter = dynamic;

/// A notebook document filter denotes a notebook document by different
/// properties. The properties will be match against the notebook's URI (same
/// as with documents)
/// @since 3.17.0
typedef NotebookDocumentFilter = dynamic;

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

@freezed
abstract class ImplementationParams with _$ImplementationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory Location({required String uri, required Range range}) =
      _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
abstract class ImplementationRegistrationOptions
    with _$ImplementationRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ImplementationRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _ImplementationRegistrationOptions;

  factory ImplementationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionParams with _$TypeDefinitionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TypeDefinitionRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _TypeDefinitionRegistrationOptions;

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFolder with _$WorkspaceFolder {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceFolder({required String uri, required String name}) =
      _WorkspaceFolder;

  factory WorkspaceFolder.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFolderFromJson(json);
}

@freezed
abstract class DidChangeWorkspaceFoldersParams
    with _$DidChangeWorkspaceFoldersParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidChangeWorkspaceFoldersParams({
    required WorkspaceFoldersChangeEvent event,
  }) = _DidChangeWorkspaceFoldersParams;

  factory DidChangeWorkspaceFoldersParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWorkspaceFoldersParamsFromJson(json);
}

@freezed
abstract class ConfigurationParams with _$ConfigurationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ConfigurationParams({required List<ConfigurationItem> items}) =
      _ConfigurationParams;

  factory ConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationParamsFromJson(json);
}

@freezed
abstract class DocumentColorParams with _$DocumentColorParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ColorInformation({required Range range, required Color color}) =
      _ColorInformation;

  factory ColorInformation.fromJson(Map<String, dynamic> json) =>
      _$ColorInformationFromJson(json);
}

@freezed
abstract class DocumentColorRegistrationOptions
    with _$DocumentColorRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentColorRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _DocumentColorRegistrationOptions;

  factory DocumentColorRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentColorRegistrationOptionsFromJson(json);
}

@freezed
abstract class ColorPresentationParams with _$ColorPresentationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkDoneProgressOptions({bool? workDoneProgress}) =
      _WorkDoneProgressOptions;

  factory WorkDoneProgressOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressOptionsFromJson(json);
}

@freezed
abstract class TextDocumentRegistrationOptions
    with _$TextDocumentRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextDocumentRegistrationOptions({
    required dynamic documentSelector,
  }) = _TextDocumentRegistrationOptions;

  factory TextDocumentRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentRegistrationOptionsFromJson(json);
}

@freezed
abstract class FoldingRangeParams with _$FoldingRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FoldingRangeRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _FoldingRangeRegistrationOptions;

  factory FoldingRangeRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class DeclarationParams with _$DeclarationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DeclarationRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _DeclarationRegistrationOptions;

  factory DeclarationRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationRegistrationOptionsFromJson(json);
}

@freezed
abstract class SelectionRangeParams with _$SelectionRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SelectionRange({required Range range, SelectionRange? parent}) =
      _SelectionRange;

  factory SelectionRange.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeFromJson(json);
}

@freezed
abstract class SelectionRangeRegistrationOptions
    with _$SelectionRangeRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SelectionRangeRegistrationOptions({
    required dynamic documentSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkDoneProgressCreateParams({required ProgressToken token}) =
      _WorkDoneProgressCreateParams;

  factory WorkDoneProgressCreateParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCreateParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressCancelParams
    with _$WorkDoneProgressCancelParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkDoneProgressCancelParams({required ProgressToken token}) =
      _WorkDoneProgressCancelParams;

  factory WorkDoneProgressCancelParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCancelParamsFromJson(json);
}

@freezed
abstract class CallHierarchyPrepareParams with _$CallHierarchyPrepareParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CallHierarchyRegistrationOptions({
    required dynamic documentSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CallHierarchyOutgoingCall({
    required CallHierarchyItem to,
    required List<Range> fromRanges,
  }) = _CallHierarchyOutgoingCall;

  factory CallHierarchyOutgoingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOutgoingCallFromJson(json);
}

@freezed
abstract class SemanticTokensParams with _$SemanticTokensParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SemanticTokens({required List<int> data, String? resultId}) =
      _SemanticTokens;

  factory SemanticTokens.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensFromJson(json);
}

@freezed
abstract class SemanticTokensPartialResult with _$SemanticTokensPartialResult {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SemanticTokensPartialResult({required List<int> data}) =
      _SemanticTokensPartialResult;

  factory SemanticTokensPartialResult.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensPartialResultFromJson(json);
}

@freezed
abstract class SemanticTokensRegistrationOptions
    with _$SemanticTokensRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SemanticTokensRegistrationOptions({
    required dynamic documentSelector,
    required SemanticTokensLegend legend,
    String? id,
    dynamic? full,
    dynamic? range,
    bool? workDoneProgress,
  }) = _SemanticTokensRegistrationOptions;

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensRegistrationOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensDeltaParams with _$SemanticTokensDeltaParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SemanticTokensDeltaPartialResult({
    required List<SemanticTokensEdit> edits,
  }) = _SemanticTokensDeltaPartialResult;

  factory SemanticTokensDeltaPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensDeltaPartialResultFromJson(json);
}

@freezed
abstract class SemanticTokensRangeParams with _$SemanticTokensRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ShowDocumentResult({required bool success}) =
      _ShowDocumentResult;

  factory ShowDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentResultFromJson(json);
}

@freezed
abstract class LinkedEditingRangeParams with _$LinkedEditingRangeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory LinkedEditingRangeRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _LinkedEditingRangeRegistrationOptions;

  factory LinkedEditingRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class CreateFilesParams with _$CreateFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CreateFilesParams({required List<FileCreate> files}) =
      _CreateFilesParams;

  factory CreateFilesParams.fromJson(Map<String, dynamic> json) =>
      _$CreateFilesParamsFromJson(json);
}

@freezed
abstract class WorkspaceEdit with _$WorkspaceEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceEdit({
    Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations,
    List<dynamic>? documentChanges,
    Map<String, List<TextEdit>>? changes,
  }) = _WorkspaceEdit;

  factory WorkspaceEdit.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditFromJson(json);
}

@freezed
abstract class FileOperationRegistrationOptions
    with _$FileOperationRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileOperationRegistrationOptions({
    required List<FileOperationFilter> filters,
  }) = _FileOperationRegistrationOptions;

  factory FileOperationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$FileOperationRegistrationOptionsFromJson(json);
}

@freezed
abstract class RenameFilesParams with _$RenameFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RenameFilesParams({required List<FileRename> files}) =
      _RenameFilesParams;

  factory RenameFilesParams.fromJson(Map<String, dynamic> json) =>
      _$RenameFilesParamsFromJson(json);
}

@freezed
abstract class DeleteFilesParams with _$DeleteFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DeleteFilesParams({required List<FileDelete> files}) =
      _DeleteFilesParams;

  factory DeleteFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteFilesParamsFromJson(json);
}

@freezed
abstract class MonikerParams with _$MonikerParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory MonikerRegistrationOptions({
    required dynamic documentSelector,
    bool? workDoneProgress,
  }) = _MonikerRegistrationOptions;

  factory MonikerRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeHierarchyPrepareParams with _$TypeHierarchyPrepareParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TypeHierarchyRegistrationOptions({
    required dynamic documentSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineValueRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _InlineValueRegistrationOptions;

  factory InlineValueRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueRegistrationOptionsFromJson(json);
}

@freezed
abstract class InlayHintParams with _$InlayHintParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlayHint({
    required Position position,
    required dynamic label,
    LSPAny? data,
    bool? paddingRight,
    bool? paddingLeft,
    dynamic? tooltip,
    List<TextEdit>? textEdits,
    InlayHintKind? kind,
  }) = _InlayHint;

  factory InlayHint.fromJson(Map<String, dynamic> json) =>
      _$InlayHintFromJson(json);
}

@freezed
abstract class InlayHintRegistrationOptions
    with _$InlayHintRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlayHintRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _InlayHintRegistrationOptions;

  factory InlayHintRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentDiagnosticParams with _$DocumentDiagnosticParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentDiagnosticReportPartialResult({
    required Map<String, dynamic> relatedDocuments,
  }) = _DocumentDiagnosticReportPartialResult;

  factory DocumentDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentDiagnosticReportPartialResultFromJson(json);
}

@freezed
abstract class DiagnosticServerCancellationData
    with _$DiagnosticServerCancellationData {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DiagnosticRegistrationOptions({
    required dynamic documentSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceDiagnosticReport({
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReport;

  factory WorkspaceDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDiagnosticReportFromJson(json);
}

@freezed
abstract class WorkspaceDiagnosticReportPartialResult
    with _$WorkspaceDiagnosticReportPartialResult {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidSaveNotebookDocumentParams({
    required NotebookDocumentIdentifier notebookDocument,
  }) = _DidSaveNotebookDocumentParams;

  factory DidSaveNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidSaveNotebookDocumentParamsFromJson(json);
}

@freezed
abstract class DidCloseNotebookDocumentParams
    with _$DidCloseNotebookDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidCloseNotebookDocumentParams({
    required NotebookDocumentIdentifier notebookDocument,
    required List<TextDocumentIdentifier> cellTextDocuments,
  }) = _DidCloseNotebookDocumentParams;

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseNotebookDocumentParamsFromJson(json);
}

@freezed
abstract class InlineCompletionParams with _$InlineCompletionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineCompletionList({
    required List<InlineCompletionItem> items,
  }) = _InlineCompletionList;

  factory InlineCompletionList.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionListFromJson(json);
}

@freezed
abstract class InlineCompletionItem with _$InlineCompletionItem {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineCompletionItem({
    required dynamic insertText,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineCompletionRegistrationOptions({
    required dynamic documentSelector,
    String? id,
    bool? workDoneProgress,
  }) = _InlineCompletionRegistrationOptions;

  factory InlineCompletionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionRegistrationOptionsFromJson(json);
}

@freezed
abstract class RegistrationParams with _$RegistrationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RegistrationParams({
    required List<Registration> registrations,
  }) = _RegistrationParams;

  factory RegistrationParams.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParamsFromJson(json);
}

@freezed
abstract class UnregistrationParams with _$UnregistrationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory UnregistrationParams({
    required List<Unregistration> unregisterations,
  }) = _UnregistrationParams;

  factory UnregistrationParams.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationParamsFromJson(json);
}

@freezed
abstract class InitializeParams with _$InitializeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InitializeParams({
    required dynamic processId,
    required dynamic rootUri,
    required ClientCapabilities capabilities,
    dynamic? workspaceFolders,
    TraceValues? trace,
    LSPAny? initializationOptions,
    dynamic? rootPath,
    String? locale,
    ({String name, String? version})? clientInfo,
    ProgressToken? workDoneToken,
  }) = _InitializeParams;

  factory InitializeParams.fromJson(Map<String, dynamic> json) =>
      _$InitializeParamsFromJson(json);
}

@freezed
abstract class InitializeResult with _$InitializeResult {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InitializeResult({
    required ServerCapabilities capabilities,
    ({String name, String? version})? serverInfo,
  }) = _InitializeResult;

  factory InitializeResult.fromJson(Map<String, dynamic> json) =>
      _$InitializeResultFromJson(json);
}

@freezed
abstract class InitializeError with _$InitializeError {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InitializeError({required bool retry}) = _InitializeError;

  factory InitializeError.fromJson(Map<String, dynamic> json) =>
      _$InitializeErrorFromJson(json);
}

@freezed
abstract class InitializedParams with _$InitializedParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InitializedParams() = _InitializedParams;

  factory InitializedParams.fromJson(Map<String, dynamic> json) =>
      _$InitializedParamsFromJson(json);
}

@freezed
abstract class DidChangeConfigurationParams
    with _$DidChangeConfigurationParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidChangeConfigurationParams({required LSPAny settings}) =
      _DidChangeConfigurationParams;

  factory DidChangeConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeConfigurationParamsFromJson(json);
}

@freezed
abstract class DidChangeConfigurationRegistrationOptions
    with _$DidChangeConfigurationRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidChangeConfigurationRegistrationOptions({dynamic? section}) =
      _DidChangeConfigurationRegistrationOptions;

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationRegistrationOptionsFromJson(json);
}

@freezed
abstract class ShowMessageParams with _$ShowMessageParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ShowMessageParams({
    required MessageType type,
    required String message,
  }) = _ShowMessageParams;

  factory ShowMessageParams.fromJson(Map<String, dynamic> json) =>
      _$ShowMessageParamsFromJson(json);
}

@freezed
abstract class ShowMessageRequestParams with _$ShowMessageRequestParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory MessageActionItem({required String title}) = _MessageActionItem;

  factory MessageActionItem.fromJson(Map<String, dynamic> json) =>
      _$MessageActionItemFromJson(json);
}

@freezed
abstract class LogMessageParams with _$LogMessageParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory LogMessageParams({
    required MessageType type,
    required String message,
  }) = _LogMessageParams;

  factory LogMessageParams.fromJson(Map<String, dynamic> json) =>
      _$LogMessageParamsFromJson(json);
}

@freezed
abstract class DidOpenTextDocumentParams with _$DidOpenTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidOpenTextDocumentParams({
    required TextDocumentItem textDocument,
  }) = _DidOpenTextDocumentParams;

  factory DidOpenTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidOpenTextDocumentParamsFromJson(json);
}

@freezed
abstract class DidChangeTextDocumentParams with _$DidChangeTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextDocumentChangeRegistrationOptions({
    required dynamic documentSelector,
    required TextDocumentSyncKind syncKind,
  }) = _TextDocumentChangeRegistrationOptions;

  factory TextDocumentChangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentChangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class DidCloseTextDocumentParams with _$DidCloseTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidCloseTextDocumentParams({
    required TextDocumentIdentifier textDocument,
  }) = _DidCloseTextDocumentParams;

  factory DidCloseTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseTextDocumentParamsFromJson(json);
}

@freezed
abstract class DidSaveTextDocumentParams with _$DidSaveTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextDocumentSaveRegistrationOptions({
    required dynamic documentSelector,
    bool? includeText,
  }) = _TextDocumentSaveRegistrationOptions;

  factory TextDocumentSaveRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSaveRegistrationOptionsFromJson(json);
}

@freezed
abstract class WillSaveTextDocumentParams with _$WillSaveTextDocumentParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WillSaveTextDocumentParams({
    required TextDocumentIdentifier textDocument,
    required TextDocumentSaveReason reason,
  }) = _WillSaveTextDocumentParams;

  factory WillSaveTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$WillSaveTextDocumentParamsFromJson(json);
}

@freezed
abstract class TextEdit with _$TextEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextEdit({required Range range, required String newText}) =
      _TextEdit;

  factory TextEdit.fromJson(Map<String, dynamic> json) =>
      _$TextEditFromJson(json);
}

@freezed
abstract class DidChangeWatchedFilesParams with _$DidChangeWatchedFilesParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidChangeWatchedFilesParams({
    required List<FileEvent> changes,
  }) = _DidChangeWatchedFilesParams;

  factory DidChangeWatchedFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWatchedFilesParamsFromJson(json);
}

@freezed
abstract class DidChangeWatchedFilesRegistrationOptions
    with _$DidChangeWatchedFilesRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DidChangeWatchedFilesRegistrationOptions({
    required List<FileSystemWatcher> watchers,
  }) = _DidChangeWatchedFilesRegistrationOptions;

  factory DidChangeWatchedFilesRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesRegistrationOptionsFromJson(json);
}

@freezed
abstract class PublishDiagnosticsParams with _$PublishDiagnosticsParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CompletionItem({
    required String label,
    LSPAny? data,
    Command? command,
    List<String>? commitCharacters,
    List<TextEdit>? additionalTextEdits,
    String? textEditText,
    dynamic? textEdit,
    InsertTextMode? insertTextMode,
    InsertTextFormat? insertTextFormat,
    String? insertText,
    String? filterText,
    String? sortText,
    bool? preselect,
    bool? deprecated,
    dynamic? documentation,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CompletionList({
    required bool isIncomplete,
    required List<CompletionItem> items,
    ({
      List<String>? commitCharacters,
      dynamic? editRange,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CompletionRegistrationOptions({
    required dynamic documentSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory Hover({required dynamic contents, Range? range}) = _Hover;

  factory Hover.fromJson(Map<String, dynamic> json) => _$HoverFromJson(json);
}

@freezed
abstract class HoverRegistrationOptions with _$HoverRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory HoverRegistrationOptions({
    required dynamic documentSelector,
    bool? workDoneProgress,
  }) = _HoverRegistrationOptions;

  factory HoverRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverRegistrationOptionsFromJson(json);
}

@freezed
abstract class SignatureHelpParams with _$SignatureHelpParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SignatureHelpRegistrationOptions({
    required dynamic documentSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DefinitionRegistrationOptions({
    required dynamic documentSelector,
    bool? workDoneProgress,
  }) = _DefinitionRegistrationOptions;

  factory DefinitionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionRegistrationOptionsFromJson(json);
}

@freezed
abstract class ReferenceParams with _$ReferenceParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ReferenceRegistrationOptions({
    required dynamic documentSelector,
    bool? workDoneProgress,
  }) = _ReferenceRegistrationOptions;

  factory ReferenceRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentHighlightParams with _$DocumentHighlightParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentHighlightRegistrationOptions({
    required dynamic documentSelector,
    bool? workDoneProgress,
  }) = _DocumentHighlightRegistrationOptions;

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentSymbolParams with _$DocumentSymbolParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentSymbolRegistrationOptions({
    required dynamic documentSelector,
    String? label,
    bool? workDoneProgress,
  }) = _DocumentSymbolRegistrationOptions;

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolRegistrationOptionsFromJson(json);
}

@freezed
abstract class CodeActionParams with _$CodeActionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CodeActionRegistrationOptions({
    required dynamic documentSelector,
    bool? resolveProvider,
    List<CodeActionKind>? codeActionKinds,
    bool? workDoneProgress,
  }) = _CodeActionRegistrationOptions;

  factory CodeActionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceSymbolParams with _$WorkspaceSymbolParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceSymbol({
    required String name,
    required SymbolKind kind,
    required dynamic location,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CodeLensRegistrationOptions({
    required dynamic documentSelector,
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _CodeLensRegistrationOptions;

  factory CodeLensRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentLinkParams with _$DocumentLinkParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentLinkRegistrationOptions({
    required dynamic documentSelector,
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _DocumentLinkRegistrationOptions;

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentFormattingParams with _$DocumentFormattingParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentFormattingRegistrationOptions({
    required dynamic documentSelector,
    bool? workDoneProgress,
  }) = _DocumentFormattingRegistrationOptions;

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingRegistrationOptionsFromJson(json);
}

@freezed
abstract class DocumentRangeFormattingParams
    with _$DocumentRangeFormattingParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentRangeFormattingRegistrationOptions({
    required dynamic documentSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentOnTypeFormattingRegistrationOptions({
    required dynamic documentSelector,
    required String firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingRegistrationOptions;

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingRegistrationOptionsFromJson(json);
}

@freezed
abstract class RenameParams with _$RenameParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RenameRegistrationOptions({
    required dynamic documentSelector,
    bool? prepareProvider,
    bool? workDoneProgress,
  }) = _RenameRegistrationOptions;

  factory RenameRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameRegistrationOptionsFromJson(json);
}

@freezed
abstract class PrepareRenameParams with _$PrepareRenameParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ApplyWorkspaceEditParams({
    required WorkspaceEdit edit,
    String? label,
  }) = _ApplyWorkspaceEditParams;

  factory ApplyWorkspaceEditParams.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditParamsFromJson(json);
}

@freezed
abstract class ApplyWorkspaceEditResult with _$ApplyWorkspaceEditResult {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkDoneProgressEnd({required String kind, String? message}) =
      _WorkDoneProgressEnd;

  factory WorkDoneProgressEnd.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressEndFromJson(json);
}

@freezed
abstract class SetTraceParams with _$SetTraceParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SetTraceParams({required TraceValues value}) = _SetTraceParams;

  factory SetTraceParams.fromJson(Map<String, dynamic> json) =>
      _$SetTraceParamsFromJson(json);
}

@freezed
abstract class LogTraceParams with _$LogTraceParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory LogTraceParams({required String message, String? verbose}) =
      _LogTraceParams;

  factory LogTraceParams.fromJson(Map<String, dynamic> json) =>
      _$LogTraceParamsFromJson(json);
}

@freezed
abstract class CancelParams with _$CancelParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CancelParams({required dynamic id}) = _CancelParams;

  factory CancelParams.fromJson(Map<String, dynamic> json) =>
      _$CancelParamsFromJson(json);
}

@freezed
abstract class ProgressParams with _$ProgressParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ProgressParams({
    required ProgressToken token,
    required LSPAny value,
  }) = _ProgressParams;

  factory ProgressParams.fromJson(Map<String, dynamic> json) =>
      _$ProgressParamsFromJson(json);
}

@freezed
abstract class TextDocumentPositionParams with _$TextDocumentPositionParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextDocumentPositionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
  }) = _TextDocumentPositionParams;

  factory TextDocumentPositionParams.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentPositionParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressParams with _$WorkDoneProgressParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkDoneProgressParams({ProgressToken? workDoneToken}) =
      _WorkDoneProgressParams;

  factory WorkDoneProgressParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressParamsFromJson(json);
}

@freezed
abstract class PartialResultParams with _$PartialResultParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory PartialResultParams({ProgressToken? partialResultToken}) =
      _PartialResultParams;

  factory PartialResultParams.fromJson(Map<String, dynamic> json) =>
      _$PartialResultParamsFromJson(json);
}

@freezed
abstract class LocationLink with _$LocationLink {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory Range({required Position start, required Position end}) =
      _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

@freezed
abstract class ImplementationOptions with _$ImplementationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ImplementationOptions({bool? workDoneProgress}) =
      _ImplementationOptions;

  factory ImplementationOptions.fromJson(Map<String, dynamic> json) =>
      _$ImplementationOptionsFromJson(json);
}

@freezed
abstract class StaticRegistrationOptions with _$StaticRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory StaticRegistrationOptions({String? id}) =
      _StaticRegistrationOptions;

  factory StaticRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$StaticRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionOptions with _$TypeDefinitionOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TypeDefinitionOptions({bool? workDoneProgress}) =
      _TypeDefinitionOptions;

  factory TypeDefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersChangeEvent with _$WorkspaceFoldersChangeEvent {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceFoldersChangeEvent({
    required List<WorkspaceFolder> added,
    required List<WorkspaceFolder> removed,
  }) = _WorkspaceFoldersChangeEvent;

  factory WorkspaceFoldersChangeEvent.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFoldersChangeEventFromJson(json);
}

@freezed
abstract class ConfigurationItem with _$ConfigurationItem {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ConfigurationItem({String? section, String? scopeUri}) =
      _ConfigurationItem;

  factory ConfigurationItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationItemFromJson(json);
}

@freezed
abstract class TextDocumentIdentifier with _$TextDocumentIdentifier {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextDocumentIdentifier({required String uri}) =
      _TextDocumentIdentifier;

  factory TextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentIdentifierFromJson(json);
}

@freezed
abstract class Color with _$Color {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentColorOptions({bool? workDoneProgress}) =
      _DocumentColorOptions;

  factory DocumentColorOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorOptionsFromJson(json);
}

@freezed
abstract class FoldingRangeOptions with _$FoldingRangeOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FoldingRangeOptions({bool? workDoneProgress}) =
      _FoldingRangeOptions;

  factory FoldingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeOptionsFromJson(json);
}

@freezed
abstract class DeclarationOptions with _$DeclarationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DeclarationOptions({bool? workDoneProgress}) =
      _DeclarationOptions;

  factory DeclarationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationOptionsFromJson(json);
}

@freezed
abstract class Position with _$Position {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory Position({required int line, required int character}) =
      _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
abstract class SelectionRangeOptions with _$SelectionRangeOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SelectionRangeOptions({bool? workDoneProgress}) =
      _SelectionRangeOptions;

  factory SelectionRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeOptionsFromJson(json);
}

@freezed
abstract class CallHierarchyOptions with _$CallHierarchyOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CallHierarchyOptions({bool? workDoneProgress}) =
      _CallHierarchyOptions;

  factory CallHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensOptions with _$SemanticTokensOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SemanticTokensOptions({
    required SemanticTokensLegend legend,
    dynamic? full,
    dynamic? range,
    bool? workDoneProgress,
  }) = _SemanticTokensOptions;

  factory SemanticTokensOptions.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensEdit with _$SemanticTokensEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory LinkedEditingRangeOptions({bool? workDoneProgress}) =
      _LinkedEditingRangeOptions;

  factory LinkedEditingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeOptionsFromJson(json);
}

@freezed
abstract class FileCreate with _$FileCreate {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileCreate({required String uri}) = _FileCreate;

  factory FileCreate.fromJson(Map<String, dynamic> json) =>
      _$FileCreateFromJson(json);
}

@freezed
abstract class TextDocumentEdit with _$TextDocumentEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextDocumentEdit({
    required OptionalVersionedTextDocumentIdentifier textDocument,
    required List<dynamic> edits,
  }) = _TextDocumentEdit;

  factory TextDocumentEdit.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentEditFromJson(json);
}

@freezed
abstract class CreateFile with _$CreateFile {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileOperationFilter({
    required FileOperationPattern pattern,
    String? scheme,
  }) = _FileOperationFilter;

  factory FileOperationFilter.fromJson(Map<String, dynamic> json) =>
      _$FileOperationFilterFromJson(json);
}

@freezed
abstract class FileRename with _$FileRename {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileRename({required String oldUri, required String newUri}) =
      _FileRename;

  factory FileRename.fromJson(Map<String, dynamic> json) =>
      _$FileRenameFromJson(json);
}

@freezed
abstract class FileDelete with _$FileDelete {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileDelete({required String uri}) = _FileDelete;

  factory FileDelete.fromJson(Map<String, dynamic> json) =>
      _$FileDeleteFromJson(json);
}

@freezed
abstract class MonikerOptions with _$MonikerOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory MonikerOptions({bool? workDoneProgress}) = _MonikerOptions;

  factory MonikerOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerOptionsFromJson(json);
}

@freezed
abstract class TypeHierarchyOptions with _$TypeHierarchyOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TypeHierarchyOptions({bool? workDoneProgress}) =
      _TypeHierarchyOptions;

  factory TypeHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyOptionsFromJson(json);
}

@freezed
abstract class InlineValueContext with _$InlineValueContext {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineValueContext({
    required int frameId,
    required Range stoppedLocation,
  }) = _InlineValueContext;

  factory InlineValueContext.fromJson(Map<String, dynamic> json) =>
      _$InlineValueContextFromJson(json);
}

@freezed
abstract class InlineValueText with _$InlineValueText {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineValueText({required Range range, required String text}) =
      _InlineValueText;

  factory InlineValueText.fromJson(Map<String, dynamic> json) =>
      _$InlineValueTextFromJson(json);
}

@freezed
abstract class InlineValueVariableLookup with _$InlineValueVariableLookup {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineValueOptions({bool? workDoneProgress}) =
      _InlineValueOptions;

  factory InlineValueOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueOptionsFromJson(json);
}

@freezed
abstract class InlayHintLabelPart with _$InlayHintLabelPart {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlayHintLabelPart({
    required String value,
    Command? command,
    Location? location,
    dynamic? tooltip,
  }) = _InlayHintLabelPart;

  factory InlayHintLabelPart.fromJson(Map<String, dynamic> json) =>
      _$InlayHintLabelPartFromJson(json);
}

@freezed
abstract class MarkupContent with _$MarkupContent {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory MarkupContent({
    required MarkupKind kind,
    required String value,
  }) = _MarkupContent;

  factory MarkupContent.fromJson(Map<String, dynamic> json) =>
      _$MarkupContentFromJson(json);
}

@freezed
abstract class InlayHintOptions with _$InlayHintOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RelatedFullDocumentDiagnosticReport({
    required String kind,
    required List<Diagnostic> items,
    Map<String, dynamic>? relatedDocuments,
    String? resultId,
  }) = _RelatedFullDocumentDiagnosticReport;

  factory RelatedFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedFullDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class RelatedUnchangedDocumentDiagnosticReport
    with _$RelatedUnchangedDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RelatedUnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
    Map<String, dynamic>? relatedDocuments,
  }) = _RelatedUnchangedDocumentDiagnosticReport;

  factory RelatedUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedUnchangedDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class FullDocumentDiagnosticReport
    with _$FullDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory PreviousResultId({required String uri, required String value}) =
      _PreviousResultId;

  factory PreviousResultId.fromJson(Map<String, dynamic> json) =>
      _$PreviousResultIdFromJson(json);
}

@freezed
abstract class NotebookDocument with _$NotebookDocument {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory NotebookDocumentIdentifier({required String uri}) =
      _NotebookDocumentIdentifier;

  factory NotebookDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentIdentifierFromJson(json);
}

@freezed
abstract class InlineCompletionContext with _$InlineCompletionContext {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineCompletionContext({
    required InlineCompletionTriggerKind triggerKind,
    SelectedCompletionInfo? selectedCompletionInfo,
  }) = _InlineCompletionContext;

  factory InlineCompletionContext.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionContextFromJson(json);
}

@freezed
abstract class StringValue with _$StringValue {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory StringValue({required String kind, required String value}) =
      _StringValue;

  factory StringValue.fromJson(Map<String, dynamic> json) =>
      _$StringValueFromJson(json);
}

@freezed
abstract class InlineCompletionOptions with _$InlineCompletionOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineCompletionOptions({bool? workDoneProgress}) =
      _InlineCompletionOptions;

  factory InlineCompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionOptionsFromJson(json);
}

@freezed
abstract class Registration with _$Registration {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory Unregistration({required String id, required String method}) =
      _Unregistration;

  factory Unregistration.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationFromJson(json);
}

@freezed
abstract class TInitializeParams with _$TInitializeParams {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TInitializeParams({
    required dynamic processId,
    required dynamic rootUri,
    required ClientCapabilities capabilities,
    TraceValues? trace,
    LSPAny? initializationOptions,
    dynamic? rootPath,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceFoldersInitializeParams({dynamic? workspaceFolders}) =
      _WorkspaceFoldersInitializeParams;

  factory WorkspaceFoldersInitializeParams.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersInitializeParamsFromJson(json);
}

@freezed
abstract class ServerCapabilities with _$ServerCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ServerCapabilities({
    dynamic? workspaceSymbolProvider,
    dynamic? documentHighlightProvider,
    dynamic? documentFormattingProvider,
    dynamic? codeActionProvider,
    CompletionOptions? completionProvider,
    ({
      WorkspaceFoldersServerCapabilities? workspaceFolders,
      FileOperationOptions? fileOperations,
    })?
    workspace,
    dynamic? inlineCompletionProvider,
    dynamic? diagnosticProvider,
    dynamic? inlayHintProvider,
    dynamic? definitionProvider,
    dynamic? declarationProvider,
    dynamic? monikerProvider,
    dynamic? semanticTokensProvider,
    dynamic? linkedEditingRangeProvider,
    dynamic? callHierarchyProvider,
    ExecuteCommandOptions? executeCommandProvider,
    dynamic? textDocumentSync,
    dynamic? foldingRangeProvider,
    dynamic? renameProvider,
    DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider,
    dynamic? documentRangeFormattingProvider,
    LSPAny? experimental,
    dynamic? selectionRangeProvider,
    dynamic? colorProvider,
    DocumentLinkOptions? documentLinkProvider,
    CodeLensOptions? codeLensProvider,
    dynamic? notebookDocumentSync,
    dynamic? documentSymbolProvider,
    PositionEncodingKind? positionEncoding,
    dynamic? referencesProvider,
    dynamic? implementationProvider,
    dynamic? typeDefinitionProvider,
    dynamic? inlineValueProvider,
    dynamic? typeHierarchyProvider,
    SignatureHelpOptions? signatureHelpProvider,
    dynamic? hoverProvider,
  }) = _ServerCapabilities;

  factory ServerCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ServerCapabilitiesFromJson(json);
}

@freezed
abstract class VersionedTextDocumentIdentifier
    with _$VersionedTextDocumentIdentifier {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory VersionedTextDocumentIdentifier({
    required String uri,
    required int version,
  }) = _VersionedTextDocumentIdentifier;

  factory VersionedTextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$VersionedTextDocumentIdentifierFromJson(json);
}

@freezed
abstract class SaveOptions with _$SaveOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SaveOptions({bool? includeText}) = _SaveOptions;

  factory SaveOptions.fromJson(Map<String, dynamic> json) =>
      _$SaveOptionsFromJson(json);
}

@freezed
abstract class FileEvent with _$FileEvent {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileEvent({required String uri, required FileChangeType type}) =
      _FileEvent;

  factory FileEvent.fromJson(Map<String, dynamic> json) =>
      _$FileEventFromJson(json);
}

@freezed
abstract class FileSystemWatcher with _$FileSystemWatcher {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileSystemWatcher({
    required GlobPattern globPattern,
    WatchKind? kind,
  }) = _FileSystemWatcher;

  factory FileSystemWatcher.fromJson(Map<String, dynamic> json) =>
      _$FileSystemWatcherFromJson(json);
}

@freezed
abstract class Diagnostic with _$Diagnostic {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory Diagnostic({
    required Range range,
    required String message,
    LSPAny? data,
    List<DiagnosticRelatedInformation>? relatedInformation,
    List<DiagnosticTag>? tags,
    String? source,
    CodeDescription? codeDescription,
    dynamic? code,
    DiagnosticSeverity? severity,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}

@freezed
abstract class CompletionContext with _$CompletionContext {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CompletionContext({
    required CompletionTriggerKind triggerKind,
    String? triggerCharacter,
  }) = _CompletionContext;

  factory CompletionContext.fromJson(Map<String, dynamic> json) =>
      _$CompletionContextFromJson(json);
}

@freezed
abstract class CompletionItemLabelDetails with _$CompletionItemLabelDetails {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CompletionItemLabelDetails({
    String? description,
    String? detail,
  }) = _CompletionItemLabelDetails;

  factory CompletionItemLabelDetails.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemLabelDetailsFromJson(json);
}

@freezed
abstract class InsertReplaceEdit with _$InsertReplaceEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory HoverOptions({bool? workDoneProgress}) = _HoverOptions;

  factory HoverOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverOptionsFromJson(json);
}

@freezed
abstract class SignatureHelpContext with _$SignatureHelpContext {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SignatureInformation({
    required String label,
    int? activeParameter,
    List<ParameterInformation>? parameters,
    dynamic? documentation,
  }) = _SignatureInformation;

  factory SignatureInformation.fromJson(Map<String, dynamic> json) =>
      _$SignatureInformationFromJson(json);
}

@freezed
abstract class SignatureHelpOptions with _$SignatureHelpOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DefinitionOptions({bool? workDoneProgress}) =
      _DefinitionOptions;

  factory DefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionOptionsFromJson(json);
}

@freezed
abstract class ReferenceContext with _$ReferenceContext {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ReferenceContext({required bool includeDeclaration}) =
      _ReferenceContext;

  factory ReferenceContext.fromJson(Map<String, dynamic> json) =>
      _$ReferenceContextFromJson(json);
}

@freezed
abstract class ReferenceOptions with _$ReferenceOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ReferenceOptions({bool? workDoneProgress}) = _ReferenceOptions;

  factory ReferenceOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceOptionsFromJson(json);
}

@freezed
abstract class DocumentHighlightOptions with _$DocumentHighlightOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentHighlightOptions({bool? workDoneProgress}) =
      _DocumentHighlightOptions;

  factory DocumentHighlightOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightOptionsFromJson(json);
}

@freezed
abstract class BaseSymbolInformation with _$BaseSymbolInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentSymbolOptions({String? label, bool? workDoneProgress}) =
      _DocumentSymbolOptions;

  factory DocumentSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolOptionsFromJson(json);
}

@freezed
abstract class CodeActionContext with _$CodeActionContext {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceSymbolOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _WorkspaceSymbolOptions;

  factory WorkspaceSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolOptionsFromJson(json);
}

@freezed
abstract class CodeLensOptions with _$CodeLensOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CodeLensOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _CodeLensOptions;

  factory CodeLensOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensOptionsFromJson(json);
}

@freezed
abstract class DocumentLinkOptions with _$DocumentLinkOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentLinkOptions({
    bool? resolveProvider,
    bool? workDoneProgress,
  }) = _DocumentLinkOptions;

  factory DocumentLinkOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkOptionsFromJson(json);
}

@freezed
abstract class FormattingOptions with _$FormattingOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentFormattingOptions({bool? workDoneProgress}) =
      _DocumentFormattingOptions;

  factory DocumentFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingOptionsFromJson(json);
}

@freezed
abstract class DocumentRangeFormattingOptions
    with _$DocumentRangeFormattingOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentOnTypeFormattingOptions({
    required String firstTriggerCharacter,
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingOptions;

  factory DocumentOnTypeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingOptionsFromJson(json);
}

@freezed
abstract class RenameOptions with _$RenameOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RenameOptions({bool? prepareProvider, bool? workDoneProgress}) =
      _RenameOptions;

  factory RenameOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameOptionsFromJson(json);
}

@freezed
abstract class ExecuteCommandOptions with _$ExecuteCommandOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ExecuteCommandOptions({
    required List<String> commands,
    bool? workDoneProgress,
  }) = _ExecuteCommandOptions;

  factory ExecuteCommandOptions.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandOptionsFromJson(json);
}

@freezed
abstract class SemanticTokensLegend with _$SemanticTokensLegend {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory OptionalVersionedTextDocumentIdentifier({
    required String uri,
    required dynamic version,
  }) = _OptionalVersionedTextDocumentIdentifier;

  factory OptionalVersionedTextDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) => _$OptionalVersionedTextDocumentIdentifierFromJson(json);
}

@freezed
abstract class AnnotatedTextEdit with _$AnnotatedTextEdit {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ResourceOperation({
    required String kind,
    ChangeAnnotationIdentifier? annotationId,
  }) = _ResourceOperation;

  factory ResourceOperation.fromJson(Map<String, dynamic> json) =>
      _$ResourceOperationFromJson(json);
}

@freezed
abstract class CreateFileOptions with _$CreateFileOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CreateFileOptions({bool? ignoreIfExists, bool? overwrite}) =
      _CreateFileOptions;

  factory CreateFileOptions.fromJson(Map<String, dynamic> json) =>
      _$CreateFileOptionsFromJson(json);
}

@freezed
abstract class RenameFileOptions with _$RenameFileOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RenameFileOptions({bool? ignoreIfExists, bool? overwrite}) =
      _RenameFileOptions;

  factory RenameFileOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameFileOptionsFromJson(json);
}

@freezed
abstract class DeleteFileOptions with _$DeleteFileOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DeleteFileOptions({bool? ignoreIfNotExists, bool? recursive}) =
      _DeleteFileOptions;

  factory DeleteFileOptions.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileOptionsFromJson(json);
}

@freezed
abstract class FileOperationPattern with _$FileOperationPattern {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceFullDocumentDiagnosticReport({
    required String kind,
    required List<Diagnostic> items,
    required String uri,
    required dynamic version,
    String? resultId,
  }) = _WorkspaceFullDocumentDiagnosticReport;

  factory WorkspaceFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFullDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class WorkspaceUnchangedDocumentDiagnosticReport
    with _$WorkspaceUnchangedDocumentDiagnosticReport {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceUnchangedDocumentDiagnosticReport({
    required String kind,
    required String resultId,
    required String uri,
    required dynamic version,
  }) = _WorkspaceUnchangedDocumentDiagnosticReport;

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceUnchangedDocumentDiagnosticReportFromJson(json);
}

@freezed
abstract class NotebookCell with _$NotebookCell {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SelectedCompletionInfo({
    required Range range,
    required String text,
  }) = _SelectedCompletionInfo;

  factory SelectedCompletionInfo.fromJson(Map<String, dynamic> json) =>
      _$SelectedCompletionInfoFromJson(json);
}

@freezed
abstract class ClientCapabilities with _$ClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TextDocumentSyncOptions({
    dynamic? save,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory NotebookDocumentSyncOptions({
    required List<dynamic> notebookSelector,
    bool? save,
  }) = _NotebookDocumentSyncOptions;

  factory NotebookDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentSyncOptionsFromJson(json);
}

@freezed
abstract class NotebookDocumentSyncRegistrationOptions
    with _$NotebookDocumentSyncRegistrationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory NotebookDocumentSyncRegistrationOptions({
    required List<dynamic> notebookSelector,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory WorkspaceFoldersServerCapabilities({
    dynamic? changeNotifications,
    bool? supported,
  }) = _WorkspaceFoldersServerCapabilities;

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersServerCapabilitiesFromJson(json);
}

@freezed
abstract class FileOperationOptions with _$FileOperationOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CodeDescription({required String href}) = _CodeDescription;

  factory CodeDescription.fromJson(Map<String, dynamic> json) =>
      _$CodeDescriptionFromJson(json);
}

@freezed
abstract class DiagnosticRelatedInformation
    with _$DiagnosticRelatedInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DiagnosticRelatedInformation({
    required Location location,
    required String message,
  }) = _DiagnosticRelatedInformation;

  factory DiagnosticRelatedInformation.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticRelatedInformationFromJson(json);
}

@freezed
abstract class ParameterInformation with _$ParameterInformation {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ParameterInformation({
    required dynamic label,
    dynamic? documentation,
  }) = _ParameterInformation;

  factory ParameterInformation.fromJson(Map<String, dynamic> json) =>
      _$ParameterInformationFromJson(json);
}

@freezed
abstract class NotebookCellTextDocumentFilter
    with _$NotebookCellTextDocumentFilter {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory NotebookCellTextDocumentFilter({
    required dynamic notebook,
    String? language,
  }) = _NotebookCellTextDocumentFilter;

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellTextDocumentFilterFromJson(json);
}

@freezed
abstract class FileOperationPatternOptions with _$FileOperationPatternOptions {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory FileOperationPatternOptions({bool? ignoreCase}) =
      _FileOperationPatternOptions;

  factory FileOperationPatternOptions.fromJson(Map<String, dynamic> json) =>
      _$FileOperationPatternOptionsFromJson(json);
}

@freezed
abstract class ExecutionSummary with _$ExecutionSummary {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ExecutionSummary({required int executionOrder, bool? success}) =
      _ExecutionSummary;

  factory ExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$ExecutionSummaryFromJson(json);
}

@freezed
abstract class WorkspaceClientCapabilities with _$WorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory NotebookDocumentClientCapabilities({
    required NotebookDocumentSyncClientCapabilities synchronization,
  }) = _NotebookDocumentClientCapabilities;

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class WindowClientCapabilities with _$WindowClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory RelativePattern({
    required dynamic baseUri,
    required Pattern pattern,
  }) = _RelativePattern;

  factory RelativePattern.fromJson(Map<String, dynamic> json) =>
      _$RelativePatternFromJson(json);
}

@freezed
abstract class WorkspaceEditClientCapabilities
    with _$WorkspaceEditClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ExecuteCommandClientCapabilities({bool? dynamicRegistration}) =
      _ExecuteCommandClientCapabilities;

  factory ExecuteCommandClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandClientCapabilitiesFromJson(json);
}

@freezed
abstract class SemanticTokensWorkspaceClientCapabilities
    with _$SemanticTokensWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CodeLensWorkspaceClientCapabilities({bool? refreshSupport}) =
      _CodeLensWorkspaceClientCapabilities;

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$CodeLensWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class FileOperationClientCapabilities
    with _$FileOperationClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineValueWorkspaceClientCapabilities({bool? refreshSupport}) =
      _InlineValueWorkspaceClientCapabilities;

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlayHintWorkspaceClientCapabilities
    with _$InlayHintWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlayHintWorkspaceClientCapabilities({bool? refreshSupport}) =
      _InlayHintWorkspaceClientCapabilities;

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlayHintWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class DiagnosticWorkspaceClientCapabilities
    with _$DiagnosticWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DiagnosticWorkspaceClientCapabilities({bool? refreshSupport}) =
      _DiagnosticWorkspaceClientCapabilities;

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class FoldingRangeWorkspaceClientCapabilities
    with _$FoldingRangeWorkspaceClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ReferenceClientCapabilities({bool? dynamicRegistration}) =
      _ReferenceClientCapabilities;

  factory ReferenceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ReferenceClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentHighlightClientCapabilities
    with _$DocumentHighlightClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CodeLensClientCapabilities({bool? dynamicRegistration}) =
      _CodeLensClientCapabilities;

  factory CodeLensClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeLensClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentLinkClientCapabilities
    with _$DocumentLinkClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentColorClientCapabilities({bool? dynamicRegistration}) =
      _DocumentColorClientCapabilities;

  factory DocumentColorClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentFormattingClientCapabilities
    with _$DocumentFormattingClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory DocumentOnTypeFormattingClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentOnTypeFormattingClientCapabilities;

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingClientCapabilitiesFromJson(json);
}

@freezed
abstract class RenameClientCapabilities with _$RenameClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SelectionRangeClientCapabilities({bool? dynamicRegistration}) =
      _SelectionRangeClientCapabilities;

  factory SelectionRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SelectionRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class PublishDiagnosticsClientCapabilities
    with _$PublishDiagnosticsClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory CallHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _CallHierarchyClientCapabilities;

  factory CallHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyClientCapabilitiesFromJson(json);
}

@freezed
abstract class SemanticTokensClientCapabilities
    with _$SemanticTokensClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory SemanticTokensClientCapabilities({
    required ({dynamic? range, dynamic? full}) requests,
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory LinkedEditingRangeClientCapabilities({
    bool? dynamicRegistration,
  }) = _LinkedEditingRangeClientCapabilities;

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class MonikerClientCapabilities with _$MonikerClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory MonikerClientCapabilities({bool? dynamicRegistration}) =
      _MonikerClientCapabilities;

  factory MonikerClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MonikerClientCapabilitiesFromJson(json);
}

@freezed
abstract class TypeHierarchyClientCapabilities
    with _$TypeHierarchyClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory TypeHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _TypeHierarchyClientCapabilities;

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlineValueClientCapabilities
    with _$InlineValueClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory InlineValueClientCapabilities({bool? dynamicRegistration}) =
      _InlineValueClientCapabilities;

  factory InlineValueClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlineValueClientCapabilitiesFromJson(json);
}

@freezed
abstract class InlayHintClientCapabilities with _$InlayHintClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
  const factory ShowDocumentClientCapabilities({required bool support}) =
      _ShowDocumentClientCapabilities;

  factory ShowDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class RegularExpressionsClientCapabilities
    with _$RegularExpressionsClientCapabilities {
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
  @JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: false)
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
@JsonEnum(valueField: 'value')
enum SemanticTokenTypes {
  namespace('namespace'),
  type('type'),
  class$('class'),
  enum$('enum'),
  interface$('interface'),
  struct('struct'),
  typeParameter('typeParameter'),
  parameter('parameter'),
  variable('variable'),
  property('property'),
  enumMember('enumMember'),
  event('event'),
  function('function'),
  method('method'),
  macro$('macro'),
  keyword('keyword'),
  modifier('modifier'),
  comment('comment'),
  string('string'),
  number('number'),
  regexp('regexp'),
  operator$('operator'),
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
  static$('static'),
  deprecated$('deprecated'),
  abstract$('abstract'),
  async$('async'),
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
  full('full'),
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
  serverNotInitialized(-32002),
  unknownErrorCode(-32001);

  // The list of all values in this enumeration.
  const ErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

@JsonEnum(valueField: 'value')
enum LSPErrorCodes {
  requestFailed(-32803),
  serverCancelled(-32802),
  contentModified(-32801),
  requestCancelled(-32800);

  // The list of all values in this enumeration.
  const LSPErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined range kinds.
@JsonEnum(valueField: 'value')
enum FoldingRangeKind {
  comment('comment'),
  imports('imports'),
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
  class$(5),
  method(6),
  property(7),
  field(8),
  constructor(9),
  enum$(10),
  interface$(11),
  function(12),
  variable(13),
  constant(14),
  string(15),
  number(16),
  boolean(17),
  array(18),
  object(19),
  key(20),
  null$(21),
  enumMember(22),
  struct(23),
  event(24),
  operator$(25),
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
  deprecated$(1);

  // The list of all values in this enumeration.
  const SymbolTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// Moniker uniqueness level to define scope of the moniker.
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum UniquenessLevel {
  document('document'),
  project('project'),
  group('group'),
  scheme('scheme'),
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
  import('import'),
  export('export'),
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
  type(1),
  parameter(2);

  // The list of all values in this enumeration.
  const InlayHintKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The message type
@JsonEnum(valueField: 'value')
enum MessageType {
  error(1),
  warning(2),
  info(3),
  log(4),
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
  none(0),
  full(1),
  incremental(2);

  // The list of all values in this enumeration.
  const TextDocumentSyncKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// Represents reasons why a text document is saved.
@JsonEnum(valueField: 'value')
enum TextDocumentSaveReason {
  manual(1),
  afterDelay(2),
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
  class$(7),
  interface$(8),
  module(9),
  property(10),
  unit(11),
  value$(12),
  enum$(13),
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
  operator$(24),
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
  deprecated$(1);

  // The list of all values in this enumeration.
  const CompletionItemTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// Defines whether the insert text in a completion item should be interpreted
/// as plain text or a snippet.
@JsonEnum(valueField: 'value')
enum InsertTextFormat {
  plainText(1),
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
  asIs(1),
  adjustIndentation(2);

  // The list of all values in this enumeration.
  const InsertTextMode(this.value);

  // The type of this enumeration.
  final int value;
}

/// A document highlight kind.
@JsonEnum(valueField: 'value')
enum DocumentHighlightKind {
  text(1),
  read(2),
  write(3);

  // The list of all values in this enumeration.
  const DocumentHighlightKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// A set of predefined code action kinds
@JsonEnum(valueField: 'value')
enum CodeActionKind {
  empty(''),
  quickFix('quickfix'),
  refactor('refactor'),
  refactorExtract('refactor.extract'),
  refactorInline('refactor.inline'),
  refactorRewrite('refactor.rewrite'),
  source('source'),
  sourceOrganizeImports('source.organizeImports'),
  sourceFixAll('source.fixAll');

  // The list of all values in this enumeration.
  const CodeActionKind(this.value);

  // The type of this enumeration.
  final String value;
}

@JsonEnum(valueField: 'value')
enum TraceValues {
  off('off'),
  messages('messages'),
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
  plainText('plaintext'),
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
  invoked(0),
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
  uTF8('utf-8'),
  uTF16('utf-16'),
  uTF32('utf-32');

  // The list of all values in this enumeration.
  const PositionEncodingKind(this.value);

  // The type of this enumeration.
  final String value;
}

/// The file event type
@JsonEnum(valueField: 'value')
enum FileChangeType {
  created(1),
  changed(2),
  deleted(3);

  // The list of all values in this enumeration.
  const FileChangeType(this.value);

  // The type of this enumeration.
  final int value;
}

@JsonEnum(valueField: 'value')
enum WatchKind {
  create(1),
  change(2),
  delete(4);

  // The list of all values in this enumeration.
  const WatchKind(this.value);

  // The type of this enumeration.
  final int value;
}

/// The diagnostic's severity.
@JsonEnum(valueField: 'value')
enum DiagnosticSeverity {
  error(1),
  warning(2),
  information(3),
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
  unnecessary(1),
  deprecated$(2);

  // The list of all values in this enumeration.
  const DiagnosticTag(this.value);

  // The type of this enumeration.
  final int value;
}

/// How a completion was triggered
@JsonEnum(valueField: 'value')
enum CompletionTriggerKind {
  invoked(1),
  triggerCharacter(2),
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
  invoked(1),
  triggerCharacter(2),
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
  invoked(1),
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
  file('file'),
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
  markup(1),
  code(2);

  // The list of all values in this enumeration.
  const NotebookCellKind(this.value);

  // The type of this enumeration.
  final int value;
}

@JsonEnum(valueField: 'value')
enum ResourceOperationKind {
  create('create'),
  rename('rename'),
  delete('delete');

  // The list of all values in this enumeration.
  const ResourceOperationKind(this.value);

  // The type of this enumeration.
  final String value;
}

@JsonEnum(valueField: 'value')
enum FailureHandlingKind {
  abort('abort'),
  transactional('transactional'),
  textOnlyTransactional('textOnlyTransactional'),
  undo('undo');

  // The list of all values in this enumeration.
  const FailureHandlingKind(this.value);

  // The type of this enumeration.
  final String value;
}

@JsonEnum(valueField: 'value')
enum PrepareSupportDefaultBehavior {
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
