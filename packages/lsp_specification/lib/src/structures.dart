// GENERATED — do not edit.

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enumerations.dart';
import 'scalar_unions.dart';
import 'type_aliases.dart';
import 'unions.dart';

part 'structures.freezed.dart';
part 'structures.g.dart';

@freezed
abstract class ImplementationParams with _$ImplementationParams {
  const ImplementationParams._();

  const factory ImplementationParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _ImplementationParams;

  factory ImplementationParams.fromJson(Map<String, dynamic> json) =>
      _$ImplementationParamsFromJson(json);
}

/// Represents a location inside a resource, such as a line
/// inside a text file.
@freezed
abstract class Location with _$Location {
  const Location._();

  const factory Location({required String uri, required Range range}) =
      _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
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

  factory ImplementationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionParams with _$TypeDefinitionParams {
  const TypeDefinitionParams._();

  const factory TypeDefinitionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _TypeDefinitionParams;

  factory TypeDefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionParamsFromJson(json);
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

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionRegistrationOptionsFromJson(json);
}

/// A workspace folder inside a client.
@freezed
abstract class WorkspaceFolder with _$WorkspaceFolder {
  const WorkspaceFolder._();

  const factory WorkspaceFolder({required String uri, required String name}) =
      _WorkspaceFolder;

  factory WorkspaceFolder.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFolderFromJson(json);
}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
@freezed
abstract class DidChangeWorkspaceFoldersParams
    with _$DidChangeWorkspaceFoldersParams {
  const DidChangeWorkspaceFoldersParams._();

  const factory DidChangeWorkspaceFoldersParams({
    required WorkspaceFoldersChangeEvent event,
  }) = _DidChangeWorkspaceFoldersParams;

  factory DidChangeWorkspaceFoldersParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWorkspaceFoldersParamsFromJson(json);
}

/// The parameters of a configuration request.
@freezed
abstract class ConfigurationParams with _$ConfigurationParams {
  const ConfigurationParams._();

  const factory ConfigurationParams({required List<ConfigurationItem> items}) =
      _ConfigurationParams;

  factory ConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationParamsFromJson(json);
}

/// Parameters for a {@link DocumentColorRequest}.
@freezed
abstract class DocumentColorParams with _$DocumentColorParams {
  const DocumentColorParams._();

  const factory DocumentColorParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _DocumentColorParams;

  factory DocumentColorParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorParamsFromJson(json);
}

/// Represents a color range from a document.
@freezed
abstract class ColorInformation with _$ColorInformation {
  const ColorInformation._();

  const factory ColorInformation({required Range range, required Color color}) =
      _ColorInformation;

  factory ColorInformation.fromJson(Map<String, dynamic> json) =>
      _$ColorInformationFromJson(json);
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

  factory DocumentColorRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentColorRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link ColorPresentationRequest}.
@freezed
abstract class ColorPresentationParams with _$ColorPresentationParams {
  const ColorPresentationParams._();

  const factory ColorPresentationParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required Color color,
    required Range range,
  }) = _ColorPresentationParams;

  factory ColorPresentationParams.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationParamsFromJson(json);
}

@freezed
abstract class ColorPresentation with _$ColorPresentation {
  const ColorPresentation._();

  const factory ColorPresentation({
    required String label,
    TextEdit? textEdit,
    List<TextEdit>? additionalTextEdits,
  }) = _ColorPresentation;

  factory ColorPresentation.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationFromJson(json);
}

@freezed
abstract class WorkDoneProgressOptions with _$WorkDoneProgressOptions {
  const WorkDoneProgressOptions._();

  const factory WorkDoneProgressOptions({bool? workDoneProgress}) =
      _WorkDoneProgressOptions;

  factory WorkDoneProgressOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressOptionsFromJson(json);
}

/// General text document registration options.
@freezed
abstract class TextDocumentRegistrationOptions
    with _$TextDocumentRegistrationOptions {
  const TextDocumentRegistrationOptions._();

  const factory TextDocumentRegistrationOptions({
    required DocumentSelector? documentSelector,
  }) = _TextDocumentRegistrationOptions;

  factory TextDocumentRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link FoldingRangeRequest}.
@freezed
abstract class FoldingRangeParams with _$FoldingRangeParams {
  const FoldingRangeParams._();

  const factory FoldingRangeParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _FoldingRangeParams;

  factory FoldingRangeParams.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeParamsFromJson(json);
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

  factory FoldingRange.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeFromJson(json);
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

  factory FoldingRangeRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class DeclarationParams with _$DeclarationParams {
  const DeclarationParams._();

  const factory DeclarationParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _DeclarationParams;

  factory DeclarationParams.fromJson(Map<String, dynamic> json) =>
      _$DeclarationParamsFromJson(json);
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

  factory DeclarationRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationRegistrationOptionsFromJson(json);
}

/// A parameter literal used in selection range requests.
@freezed
abstract class SelectionRangeParams with _$SelectionRangeParams {
  const SelectionRangeParams._();

  const factory SelectionRangeParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required List<Position> positions,
  }) = _SelectionRangeParams;

  factory SelectionRangeParams.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeParamsFromJson(json);
}

/// A selection range represents a part of a selection hierarchy. A selection range
/// may have a parent selection range that contains it.
@freezed
abstract class SelectionRange with _$SelectionRange {
  const SelectionRange._();

  const factory SelectionRange({required Range range, SelectionRange? parent}) =
      _SelectionRange;

  factory SelectionRange.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeFromJson(json);
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

  factory SelectionRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SelectionRangeRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkDoneProgressCreateParams
    with _$WorkDoneProgressCreateParams {
  const WorkDoneProgressCreateParams._();

  const factory WorkDoneProgressCreateParams({
    @_ProgressTokenConverter() required ProgressToken token,
  }) = _WorkDoneProgressCreateParams;

  factory WorkDoneProgressCreateParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCreateParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressCancelParams
    with _$WorkDoneProgressCancelParams {
  const WorkDoneProgressCancelParams._();

  const factory WorkDoneProgressCancelParams({
    @_ProgressTokenConverter() required ProgressToken token,
  }) = _WorkDoneProgressCancelParams;

  factory WorkDoneProgressCancelParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCancelParamsFromJson(json);
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
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _CallHierarchyPrepareParams;

  factory CallHierarchyPrepareParams.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyPrepareParamsFromJson(json);
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

  factory CallHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyItemFromJson(json);
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

  factory CallHierarchyRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyRegistrationOptionsFromJson(json);
}

/// The parameter of a `callHierarchy/incomingCalls` request.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyIncomingCallsParams
    with _$CallHierarchyIncomingCallsParams {
  const CallHierarchyIncomingCallsParams._();

  const factory CallHierarchyIncomingCallsParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required CallHierarchyItem item,
  }) = _CallHierarchyIncomingCallsParams;

  factory CallHierarchyIncomingCallsParams.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyIncomingCallsParamsFromJson(json);
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

  factory CallHierarchyIncomingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyIncomingCallFromJson(json);
}

/// The parameter of a `callHierarchy/outgoingCalls` request.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyOutgoingCallsParams
    with _$CallHierarchyOutgoingCallsParams {
  const CallHierarchyOutgoingCallsParams._();

  const factory CallHierarchyOutgoingCallsParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required CallHierarchyItem item,
  }) = _CallHierarchyOutgoingCallsParams;

  factory CallHierarchyOutgoingCallsParams.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyOutgoingCallsParamsFromJson(json);
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

  factory CallHierarchyOutgoingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOutgoingCallFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensParams with _$SemanticTokensParams {
  const SemanticTokensParams._();

  const factory SemanticTokensParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _SemanticTokensParams;

  factory SemanticTokensParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensParamsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokens with _$SemanticTokens {
  const SemanticTokens._();

  const factory SemanticTokens({String? resultId, required List<int> data}) =
      _SemanticTokens;

  factory SemanticTokens.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensPartialResult with _$SemanticTokensPartialResult {
  const SemanticTokensPartialResult._();

  const factory SemanticTokensPartialResult({required List<int> data}) =
      _SemanticTokensPartialResult;

  factory SemanticTokensPartialResult.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensPartialResultFromJson(json);
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

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensRegistrationOptionsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDeltaParams with _$SemanticTokensDeltaParams {
  const SemanticTokensDeltaParams._();

  const factory SemanticTokensDeltaParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required String previousResultId,
  }) = _SemanticTokensDeltaParams;

  factory SemanticTokensDeltaParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaParamsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDelta with _$SemanticTokensDelta {
  const SemanticTokensDelta._();

  const factory SemanticTokensDelta({
    String? resultId,
    required List<SemanticTokensEdit> edits,
  }) = _SemanticTokensDelta;

  factory SemanticTokensDelta.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDeltaPartialResult
    with _$SemanticTokensDeltaPartialResult {
  const SemanticTokensDeltaPartialResult._();

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
  const SemanticTokensRangeParams._();

  const factory SemanticTokensRangeParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
  }) = _SemanticTokensRangeParams;

  factory SemanticTokensRangeParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensRangeParamsFromJson(json);
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

  factory ShowDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentParamsFromJson(json);
}

/// The result of a showDocument request.
///
/// @since 3.16.0
@freezed
abstract class ShowDocumentResult with _$ShowDocumentResult {
  const ShowDocumentResult._();

  const factory ShowDocumentResult({required bool success}) =
      _ShowDocumentResult;

  factory ShowDocumentResult.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentResultFromJson(json);
}

@freezed
abstract class LinkedEditingRangeParams with _$LinkedEditingRangeParams {
  const LinkedEditingRangeParams._();

  const factory LinkedEditingRangeParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _LinkedEditingRangeParams;

  factory LinkedEditingRangeParams.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeParamsFromJson(json);
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

  factory LinkedEditingRanges.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangesFromJson(json);
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

  factory LinkedEditingRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeRegistrationOptionsFromJson(json);
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

  factory CreateFilesParams.fromJson(Map<String, dynamic> json) =>
      _$CreateFilesParamsFromJson(json);
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

  factory WorkspaceEdit.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditFromJson(json);
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

  factory FileOperationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$FileOperationRegistrationOptionsFromJson(json);
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

  factory RenameFilesParams.fromJson(Map<String, dynamic> json) =>
      _$RenameFilesParamsFromJson(json);
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

  factory DeleteFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteFilesParamsFromJson(json);
}

@freezed
abstract class MonikerParams with _$MonikerParams {
  const MonikerParams._();

  const factory MonikerParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _MonikerParams;

  factory MonikerParams.fromJson(Map<String, dynamic> json) =>
      _$MonikerParamsFromJson(json);
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

  factory Moniker.fromJson(Map<String, dynamic> json) =>
      _$MonikerFromJson(json);
}

@freezed
abstract class MonikerRegistrationOptions with _$MonikerRegistrationOptions {
  const MonikerRegistrationOptions._();

  const factory MonikerRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _MonikerRegistrationOptions;

  factory MonikerRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerRegistrationOptionsFromJson(json);
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
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _TypeHierarchyPrepareParams;

  factory TypeHierarchyPrepareParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyPrepareParamsFromJson(json);
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

  factory TypeHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyItemFromJson(json);
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

  factory TypeHierarchyRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeHierarchyRegistrationOptionsFromJson(json);
}

/// The parameter of a `typeHierarchy/supertypes` request.
///
/// @since 3.17.0
@freezed
abstract class TypeHierarchySupertypesParams
    with _$TypeHierarchySupertypesParams {
  const TypeHierarchySupertypesParams._();

  const factory TypeHierarchySupertypesParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TypeHierarchyItem item,
  }) = _TypeHierarchySupertypesParams;

  factory TypeHierarchySupertypesParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchySupertypesParamsFromJson(json);
}

/// The parameter of a `typeHierarchy/subtypes` request.
///
/// @since 3.17.0
@freezed
abstract class TypeHierarchySubtypesParams with _$TypeHierarchySubtypesParams {
  const TypeHierarchySubtypesParams._();

  const factory TypeHierarchySubtypesParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TypeHierarchyItem item,
  }) = _TypeHierarchySubtypesParams;

  factory TypeHierarchySubtypesParams.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchySubtypesParamsFromJson(json);
}

/// A parameter literal used in inline value requests.
///
/// @since 3.17.0
@freezed
abstract class InlineValueParams with _$InlineValueParams {
  const InlineValueParams._();

  const factory InlineValueParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
    required InlineValueContext context,
  }) = _InlineValueParams;

  factory InlineValueParams.fromJson(Map<String, dynamic> json) =>
      _$InlineValueParamsFromJson(json);
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

  factory InlineValueRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueRegistrationOptionsFromJson(json);
}

/// A parameter literal used in inlay hint requests.
///
/// @since 3.17.0
@freezed
abstract class InlayHintParams with _$InlayHintParams {
  const InlayHintParams._();

  const factory InlayHintParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
  }) = _InlayHintParams;

  factory InlayHintParams.fromJson(Map<String, dynamic> json) =>
      _$InlayHintParamsFromJson(json);
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

  factory InlayHint.fromJson(Map<String, dynamic> json) =>
      _$InlayHintFromJson(json);
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

  factory InlayHintRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintRegistrationOptionsFromJson(json);
}

/// Parameters of the document diagnostic request.
///
/// @since 3.17.0
@freezed
abstract class DocumentDiagnosticParams with _$DocumentDiagnosticParams {
  const DocumentDiagnosticParams._();

  const factory DocumentDiagnosticParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    String? identifier,
    String? previousResultId,
  }) = _DocumentDiagnosticParams;

  factory DocumentDiagnosticParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentDiagnosticParamsFromJson(json);
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

  factory DocumentDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentDiagnosticReportPartialResultFromJson(json);
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

  factory DiagnosticServerCancellationData.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticServerCancellationDataFromJson(json);
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

  factory DiagnosticRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticRegistrationOptionsFromJson(json);
}

/// Parameters of the workspace diagnostic request.
///
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticParams with _$WorkspaceDiagnosticParams {
  const WorkspaceDiagnosticParams._();

  const factory WorkspaceDiagnosticParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    String? identifier,
    required List<PreviousResultId> previousResultIds,
  }) = _WorkspaceDiagnosticParams;

  factory WorkspaceDiagnosticParams.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDiagnosticParamsFromJson(json);
}

/// A workspace diagnostic report.
///
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticReport with _$WorkspaceDiagnosticReport {
  const WorkspaceDiagnosticReport._();

  const factory WorkspaceDiagnosticReport({
    @_WorkspaceDocumentDiagnosticReportListConverter()
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReport;

  factory WorkspaceDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDiagnosticReportFromJson(json);
}

/// A partial result for a workspace diagnostic report.
///
/// @since 3.17.0
@freezed
abstract class WorkspaceDiagnosticReportPartialResult
    with _$WorkspaceDiagnosticReportPartialResult {
  const WorkspaceDiagnosticReportPartialResult._();

  const factory WorkspaceDiagnosticReportPartialResult({
    @_WorkspaceDocumentDiagnosticReportListConverter()
    required List<WorkspaceDocumentDiagnosticReport> items,
  }) = _WorkspaceDiagnosticReportPartialResult;

  factory WorkspaceDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceDiagnosticReportPartialResultFromJson(json);
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

  factory DidOpenNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidOpenNotebookDocumentParamsFromJson(json);
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

  factory DidChangeNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeNotebookDocumentParamsFromJson(json);
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

  factory DidSaveNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidSaveNotebookDocumentParamsFromJson(json);
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

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseNotebookDocumentParamsFromJson(json);
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
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required InlineCompletionContext context,
  }) = _InlineCompletionParams;

  factory InlineCompletionParams.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionParamsFromJson(json);
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

  factory InlineCompletionList.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionListFromJson(json);
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

  factory InlineCompletionItem.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionItemFromJson(json);
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

  factory InlineCompletionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionRegistrationOptionsFromJson(json);
}

@freezed
abstract class RegistrationParams with _$RegistrationParams {
  const RegistrationParams._();

  const factory RegistrationParams({
    required List<Registration> registrations,
  }) = _RegistrationParams;

  factory RegistrationParams.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParamsFromJson(json);
}

@freezed
abstract class UnregistrationParams with _$UnregistrationParams {
  const UnregistrationParams._();

  const factory UnregistrationParams({
    required List<Unregistration> unregisterations,
  }) = _UnregistrationParams;

  factory UnregistrationParams.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationParamsFromJson(json);
}

@freezed
abstract class InitializeParams with _$InitializeParams {
  const InitializeParams._();

  const factory InitializeParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required int? processId,
    ({String name, String? version})? clientInfo,
    String? locale,
    String? rootPath,
    required String? rootUri,
    required ClientCapabilities capabilities,
    LSPAny? initializationOptions,
    TraceValues? trace,
    List<WorkspaceFolder>? workspaceFolders,
  }) = _InitializeParams;

  factory InitializeParams.fromJson(Map<String, dynamic> json) =>
      _$InitializeParamsFromJson(json);
}

/// The result returned from an initialize request.
@freezed
abstract class InitializeResult with _$InitializeResult {
  const InitializeResult._();

  const factory InitializeResult({
    required ServerCapabilities capabilities,
    ({String name, String? version})? serverInfo,
  }) = _InitializeResult;

  factory InitializeResult.fromJson(Map<String, dynamic> json) =>
      _$InitializeResultFromJson(json);
}

/// The data type of the ResponseError if the
/// initialize request fails.
@freezed
abstract class InitializeError with _$InitializeError {
  const InitializeError._();

  const factory InitializeError({required bool retry}) = _InitializeError;

  factory InitializeError.fromJson(Map<String, dynamic> json) =>
      _$InitializeErrorFromJson(json);
}

@freezed
abstract class InitializedParams with _$InitializedParams {
  const InitializedParams._();

  const factory InitializedParams() = _InitializedParams;

  factory InitializedParams.fromJson(Map<String, dynamic> json) =>
      _$InitializedParamsFromJson(json);
}

/// The parameters of a change configuration notification.
@freezed
abstract class DidChangeConfigurationParams
    with _$DidChangeConfigurationParams {
  const DidChangeConfigurationParams._();

  const factory DidChangeConfigurationParams({required LSPAny settings}) =
      _DidChangeConfigurationParams;

  factory DidChangeConfigurationParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeConfigurationParamsFromJson(json);
}

@freezed
abstract class DidChangeConfigurationRegistrationOptions
    with _$DidChangeConfigurationRegistrationOptions {
  const DidChangeConfigurationRegistrationOptions._();

  const factory DidChangeConfigurationRegistrationOptions({Object? section}) =
      _DidChangeConfigurationRegistrationOptions;

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationRegistrationOptionsFromJson(json);
}

/// The parameters of a notification message.
@freezed
abstract class ShowMessageParams with _$ShowMessageParams {
  const ShowMessageParams._();

  const factory ShowMessageParams({
    required MessageType type,
    required String message,
  }) = _ShowMessageParams;

  factory ShowMessageParams.fromJson(Map<String, dynamic> json) =>
      _$ShowMessageParamsFromJson(json);
}

@freezed
abstract class ShowMessageRequestParams with _$ShowMessageRequestParams {
  const ShowMessageRequestParams._();

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
  const MessageActionItem._();

  const factory MessageActionItem({required String title}) = _MessageActionItem;

  factory MessageActionItem.fromJson(Map<String, dynamic> json) =>
      _$MessageActionItemFromJson(json);
}

/// The log message parameters.
@freezed
abstract class LogMessageParams with _$LogMessageParams {
  const LogMessageParams._();

  const factory LogMessageParams({
    required MessageType type,
    required String message,
  }) = _LogMessageParams;

  factory LogMessageParams.fromJson(Map<String, dynamic> json) =>
      _$LogMessageParamsFromJson(json);
}

/// The parameters sent in an open text document notification
@freezed
abstract class DidOpenTextDocumentParams with _$DidOpenTextDocumentParams {
  const DidOpenTextDocumentParams._();

  const factory DidOpenTextDocumentParams({
    required TextDocumentItem textDocument,
  }) = _DidOpenTextDocumentParams;

  factory DidOpenTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidOpenTextDocumentParamsFromJson(json);
}

/// The change text document notification's parameters.
@freezed
abstract class DidChangeTextDocumentParams with _$DidChangeTextDocumentParams {
  const DidChangeTextDocumentParams._();

  const factory DidChangeTextDocumentParams({
    required VersionedTextDocumentIdentifier textDocument,
    @_TextDocumentContentChangeEventListConverter()
    required List<TextDocumentContentChangeEvent> contentChanges,
  }) = _DidChangeTextDocumentParams;

  factory DidChangeTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeTextDocumentParamsFromJson(json);
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

  factory TextDocumentChangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentChangeRegistrationOptionsFromJson(json);
}

/// The parameters sent in a close text document notification
@freezed
abstract class DidCloseTextDocumentParams with _$DidCloseTextDocumentParams {
  const DidCloseTextDocumentParams._();

  const factory DidCloseTextDocumentParams({
    required TextDocumentIdentifier textDocument,
  }) = _DidCloseTextDocumentParams;

  factory DidCloseTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseTextDocumentParamsFromJson(json);
}

/// The parameters sent in a save text document notification
@freezed
abstract class DidSaveTextDocumentParams with _$DidSaveTextDocumentParams {
  const DidSaveTextDocumentParams._();

  const factory DidSaveTextDocumentParams({
    required TextDocumentIdentifier textDocument,
    String? text,
  }) = _DidSaveTextDocumentParams;

  factory DidSaveTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidSaveTextDocumentParamsFromJson(json);
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

  factory TextDocumentSaveRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSaveRegistrationOptionsFromJson(json);
}

/// The parameters sent in a will save text document notification.
@freezed
abstract class WillSaveTextDocumentParams with _$WillSaveTextDocumentParams {
  const WillSaveTextDocumentParams._();

  const factory WillSaveTextDocumentParams({
    required TextDocumentIdentifier textDocument,
    required TextDocumentSaveReason reason,
  }) = _WillSaveTextDocumentParams;

  factory WillSaveTextDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$WillSaveTextDocumentParamsFromJson(json);
}

/// A text edit applicable to a text document.
@freezed
abstract class TextEdit with _$TextEdit {
  const TextEdit._();

  const factory TextEdit({required Range range, required String newText}) =
      _TextEdit;

  factory TextEdit.fromJson(Map<String, dynamic> json) =>
      _$TextEditFromJson(json);
}

/// The watched files change notification's parameters.
@freezed
abstract class DidChangeWatchedFilesParams with _$DidChangeWatchedFilesParams {
  const DidChangeWatchedFilesParams._();

  const factory DidChangeWatchedFilesParams({
    required List<FileEvent> changes,
  }) = _DidChangeWatchedFilesParams;

  factory DidChangeWatchedFilesParams.fromJson(Map<String, dynamic> json) =>
      _$DidChangeWatchedFilesParamsFromJson(json);
}

/// Describe options to be used when registered for text document change events.
@freezed
abstract class DidChangeWatchedFilesRegistrationOptions
    with _$DidChangeWatchedFilesRegistrationOptions {
  const DidChangeWatchedFilesRegistrationOptions._();

  const factory DidChangeWatchedFilesRegistrationOptions({
    required List<FileSystemWatcher> watchers,
  }) = _DidChangeWatchedFilesRegistrationOptions;

  factory DidChangeWatchedFilesRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesRegistrationOptionsFromJson(json);
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

  factory PublishDiagnosticsParams.fromJson(Map<String, dynamic> json) =>
      _$PublishDiagnosticsParamsFromJson(json);
}

/// Completion parameters
@freezed
abstract class CompletionParams with _$CompletionParams {
  const CompletionParams._();

  const factory CompletionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    CompletionContext? context,
  }) = _CompletionParams;

  factory CompletionParams.fromJson(Map<String, dynamic> json) =>
      _$CompletionParamsFromJson(json);
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

  factory CompletionItem.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemFromJson(json);
}

/// Represents a collection of {@link CompletionItem completion items} to be presented
/// in the editor.
@freezed
abstract class CompletionList with _$CompletionList {
  const CompletionList._();

  const factory CompletionList({
    required bool isIncomplete,
    ({
      List<String>? commitCharacters,
      Object? editRange,
      InsertTextFormat? insertTextFormat,
      InsertTextMode? insertTextMode,
      LSPAny? data,
    })?
    itemDefaults,
    required List<CompletionItem> items,
  }) = _CompletionList;

  factory CompletionList.fromJson(Map<String, dynamic> json) =>
      _$CompletionListFromJson(json);
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
    ({bool? labelDetailsSupport})? completionItem,
  }) = _CompletionRegistrationOptions;

  factory CompletionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CompletionRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link HoverRequest}.
@freezed
abstract class HoverParams with _$HoverParams {
  const HoverParams._();

  const factory HoverParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _HoverParams;

  factory HoverParams.fromJson(Map<String, dynamic> json) =>
      _$HoverParamsFromJson(json);
}

/// The result of a hover request.
@freezed
abstract class Hover with _$Hover {
  const Hover._();

  const factory Hover({required Object contents, Range? range}) = _Hover;

  factory Hover.fromJson(Map<String, dynamic> json) => _$HoverFromJson(json);
}

/// Registration options for a {@link HoverRequest}.
@freezed
abstract class HoverRegistrationOptions with _$HoverRegistrationOptions {
  const HoverRegistrationOptions._();

  const factory HoverRegistrationOptions({
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _HoverRegistrationOptions;

  factory HoverRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpParams with _$SignatureHelpParams {
  const SignatureHelpParams._();

  const factory SignatureHelpParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    SignatureHelpContext? context,
  }) = _SignatureHelpParams;

  factory SignatureHelpParams.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpParamsFromJson(json);
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

  factory SignatureHelp.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpFromJson(json);
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

  factory SignatureHelpRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SignatureHelpRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionParams with _$DefinitionParams {
  const DefinitionParams._();

  const factory DefinitionParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _DefinitionParams;

  factory DefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$DefinitionParamsFromJson(json);
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

  factory DefinitionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceParams with _$ReferenceParams {
  const ReferenceParams._();

  const factory ReferenceParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required ReferenceContext context,
  }) = _ReferenceParams;

  factory ReferenceParams.fromJson(Map<String, dynamic> json) =>
      _$ReferenceParamsFromJson(json);
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

  factory ReferenceRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightParams with _$DocumentHighlightParams {
  const DocumentHighlightParams._();

  const factory DocumentHighlightParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _DocumentHighlightParams;

  factory DocumentHighlightParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightParamsFromJson(json);
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

  factory DocumentHighlight.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightFromJson(json);
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

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightRegistrationOptionsFromJson(json);
}

/// Parameters for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolParams with _$DocumentSymbolParams {
  const DocumentSymbolParams._();

  const factory DocumentSymbolParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _DocumentSymbolParams;

  factory DocumentSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolParamsFromJson(json);
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

  factory SymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$SymbolInformationFromJson(json);
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

  factory DocumentSymbol.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolFromJson(json);
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

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link CodeActionRequest}.
@freezed
abstract class CodeActionParams with _$CodeActionParams {
  const CodeActionParams._();

  const factory CodeActionParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
    required CodeActionContext context,
  }) = _CodeActionParams;

  factory CodeActionParams.fromJson(Map<String, dynamic> json) =>
      _$CodeActionParamsFromJson(json);
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

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
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
    ({String reason})? disabled,
    WorkspaceEdit? edit,
    Command? command,
    LSPAny? data,
  }) = _CodeAction;

  factory CodeAction.fromJson(Map<String, dynamic> json) =>
      _$CodeActionFromJson(json);
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

  factory CodeActionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolParams with _$WorkspaceSymbolParams {
  const WorkspaceSymbolParams._();

  const factory WorkspaceSymbolParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required String query,
  }) = _WorkspaceSymbolParams;

  factory WorkspaceSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolParamsFromJson(json);
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

  factory WorkspaceSymbol.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolFromJson(json);
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

  factory WorkspaceSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensParams with _$CodeLensParams {
  const CodeLensParams._();

  const factory CodeLensParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _CodeLensParams;

  factory CodeLensParams.fromJson(Map<String, dynamic> json) =>
      _$CodeLensParamsFromJson(json);
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

  factory CodeLens.fromJson(Map<String, dynamic> json) =>
      _$CodeLensFromJson(json);
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

  factory CodeLensRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkParams with _$DocumentLinkParams {
  const DocumentLinkParams._();

  const factory DocumentLinkParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required TextDocumentIdentifier textDocument,
  }) = _DocumentLinkParams;

  factory DocumentLinkParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkParamsFromJson(json);
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

  factory DocumentLink.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkFromJson(json);
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

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingParams with _$DocumentFormattingParams {
  const DocumentFormattingParams._();

  const factory DocumentFormattingParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required FormattingOptions options,
  }) = _DocumentFormattingParams;

  factory DocumentFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingParamsFromJson(json);
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

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
@freezed
abstract class DocumentRangeFormattingParams
    with _$DocumentRangeFormattingParams {
  const DocumentRangeFormattingParams._();

  const factory DocumentRangeFormattingParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Range range,
    required FormattingOptions options,
  }) = _DocumentRangeFormattingParams;

  factory DocumentRangeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingParamsFromJson(json);
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

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingRegistrationOptionsFromJson(json);
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
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required List<Range> ranges,
    required FormattingOptions options,
  }) = _DocumentRangesFormattingParams;

  factory DocumentRangesFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangesFormattingParamsFromJson(json);
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

  factory DocumentOnTypeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingParamsFromJson(json);
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

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a {@link RenameRequest}.
@freezed
abstract class RenameParams with _$RenameParams {
  const RenameParams._();

  const factory RenameParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required TextDocumentIdentifier textDocument,
    required Position position,
    required String newName,
  }) = _RenameParams;

  factory RenameParams.fromJson(Map<String, dynamic> json) =>
      _$RenameParamsFromJson(json);
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

  factory RenameRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameRegistrationOptionsFromJson(json);
}

@freezed
abstract class PrepareRenameParams with _$PrepareRenameParams {
  const PrepareRenameParams._();

  const factory PrepareRenameParams({
    required TextDocumentIdentifier textDocument,
    required Position position,
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _PrepareRenameParams;

  factory PrepareRenameParams.fromJson(Map<String, dynamic> json) =>
      _$PrepareRenameParamsFromJson(json);
}

/// The parameters of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandParams with _$ExecuteCommandParams {
  const ExecuteCommandParams._();

  const factory ExecuteCommandParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
    required String command,
    List<LSPAny>? arguments,
  }) = _ExecuteCommandParams;

  factory ExecuteCommandParams.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandParamsFromJson(json);
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

  factory ExecuteCommandRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandRegistrationOptionsFromJson(json);
}

/// The parameters passed via an apply workspace edit request.
@freezed
abstract class ApplyWorkspaceEditParams with _$ApplyWorkspaceEditParams {
  const ApplyWorkspaceEditParams._();

  const factory ApplyWorkspaceEditParams({
    String? label,
    required WorkspaceEdit edit,
  }) = _ApplyWorkspaceEditParams;

  factory ApplyWorkspaceEditParams.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditParamsFromJson(json);
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

  factory ApplyWorkspaceEditResult.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditResultFromJson(json);
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

  factory WorkDoneProgressBegin.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressBeginFromJson(json);
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

  factory WorkDoneProgressReport.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressReportFromJson(json);
}

@freezed
abstract class WorkDoneProgressEnd with _$WorkDoneProgressEnd {
  const WorkDoneProgressEnd._();

  const factory WorkDoneProgressEnd({required String kind, String? message}) =
      _WorkDoneProgressEnd;

  factory WorkDoneProgressEnd.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressEndFromJson(json);
}

@freezed
abstract class SetTraceParams with _$SetTraceParams {
  const SetTraceParams._();

  const factory SetTraceParams({required TraceValues value}) = _SetTraceParams;

  factory SetTraceParams.fromJson(Map<String, dynamic> json) =>
      _$SetTraceParamsFromJson(json);
}

@freezed
abstract class LogTraceParams with _$LogTraceParams {
  const LogTraceParams._();

  const factory LogTraceParams({required String message, String? verbose}) =
      _LogTraceParams;

  factory LogTraceParams.fromJson(Map<String, dynamic> json) =>
      _$LogTraceParamsFromJson(json);
}

@freezed
abstract class CancelParams with _$CancelParams {
  const CancelParams._();

  const factory CancelParams({required Object id}) = _CancelParams;

  factory CancelParams.fromJson(Map<String, dynamic> json) =>
      _$CancelParamsFromJson(json);
}

@freezed
abstract class ProgressParams with _$ProgressParams {
  const ProgressParams._();

  const factory ProgressParams({
    @_ProgressTokenConverter() required ProgressToken token,
    required LSPAny value,
  }) = _ProgressParams;

  factory ProgressParams.fromJson(Map<String, dynamic> json) =>
      _$ProgressParamsFromJson(json);
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

  factory TextDocumentPositionParams.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentPositionParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressParams with _$WorkDoneProgressParams {
  const WorkDoneProgressParams._();

  const factory WorkDoneProgressParams({
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _WorkDoneProgressParams;

  factory WorkDoneProgressParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressParamsFromJson(json);
}

@freezed
abstract class PartialResultParams with _$PartialResultParams {
  const PartialResultParams._();

  const factory PartialResultParams({
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _PartialResultParams;

  factory PartialResultParams.fromJson(Map<String, dynamic> json) =>
      _$PartialResultParamsFromJson(json);
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

  factory LocationLink.fromJson(Map<String, dynamic> json) =>
      _$LocationLinkFromJson(json);
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

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

@freezed
abstract class ImplementationOptions with _$ImplementationOptions {
  const ImplementationOptions._();

  const factory ImplementationOptions({bool? workDoneProgress}) =
      _ImplementationOptions;

  factory ImplementationOptions.fromJson(Map<String, dynamic> json) =>
      _$ImplementationOptionsFromJson(json);
}

/// Static registration options to be returned in the initialize
/// request.
@freezed
abstract class StaticRegistrationOptions with _$StaticRegistrationOptions {
  const StaticRegistrationOptions._();

  const factory StaticRegistrationOptions({String? id}) =
      _StaticRegistrationOptions;

  factory StaticRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$StaticRegistrationOptionsFromJson(json);
}

@freezed
abstract class TypeDefinitionOptions with _$TypeDefinitionOptions {
  const TypeDefinitionOptions._();

  const factory TypeDefinitionOptions({bool? workDoneProgress}) =
      _TypeDefinitionOptions;

  factory TypeDefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionOptionsFromJson(json);
}

/// The workspace folder change event.
@freezed
abstract class WorkspaceFoldersChangeEvent with _$WorkspaceFoldersChangeEvent {
  const WorkspaceFoldersChangeEvent._();

  const factory WorkspaceFoldersChangeEvent({
    required List<WorkspaceFolder> added,
    required List<WorkspaceFolder> removed,
  }) = _WorkspaceFoldersChangeEvent;

  factory WorkspaceFoldersChangeEvent.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFoldersChangeEventFromJson(json);
}

@freezed
abstract class ConfigurationItem with _$ConfigurationItem {
  const ConfigurationItem._();

  const factory ConfigurationItem({String? scopeUri, String? section}) =
      _ConfigurationItem;

  factory ConfigurationItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationItemFromJson(json);
}

/// A literal to identify a text document in the client.
@freezed
abstract class TextDocumentIdentifier with _$TextDocumentIdentifier {
  const TextDocumentIdentifier._();

  const factory TextDocumentIdentifier({required String uri}) =
      _TextDocumentIdentifier;

  factory TextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentIdentifierFromJson(json);
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

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}

@freezed
abstract class DocumentColorOptions with _$DocumentColorOptions {
  const DocumentColorOptions._();

  const factory DocumentColorOptions({bool? workDoneProgress}) =
      _DocumentColorOptions;

  factory DocumentColorOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorOptionsFromJson(json);
}

@freezed
abstract class FoldingRangeOptions with _$FoldingRangeOptions {
  const FoldingRangeOptions._();

  const factory FoldingRangeOptions({bool? workDoneProgress}) =
      _FoldingRangeOptions;

  factory FoldingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeOptionsFromJson(json);
}

@freezed
abstract class DeclarationOptions with _$DeclarationOptions {
  const DeclarationOptions._();

  const factory DeclarationOptions({bool? workDoneProgress}) =
      _DeclarationOptions;

  factory DeclarationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationOptionsFromJson(json);
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

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
abstract class SelectionRangeOptions with _$SelectionRangeOptions {
  const SelectionRangeOptions._();

  const factory SelectionRangeOptions({bool? workDoneProgress}) =
      _SelectionRangeOptions;

  factory SelectionRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeOptionsFromJson(json);
}

/// Call hierarchy options used during static registration.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyOptions with _$CallHierarchyOptions {
  const CallHierarchyOptions._();

  const factory CallHierarchyOptions({bool? workDoneProgress}) =
      _CallHierarchyOptions;

  factory CallHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOptionsFromJson(json);
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

  factory SemanticTokensOptions.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensOptionsFromJson(json);
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

  factory SemanticTokensEdit.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensEditFromJson(json);
}

@freezed
abstract class LinkedEditingRangeOptions with _$LinkedEditingRangeOptions {
  const LinkedEditingRangeOptions._();

  const factory LinkedEditingRangeOptions({bool? workDoneProgress}) =
      _LinkedEditingRangeOptions;

  factory LinkedEditingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeOptionsFromJson(json);
}

/// Represents information on a file/folder create.
///
/// @since 3.16.0
@freezed
abstract class FileCreate with _$FileCreate {
  const FileCreate._();

  const factory FileCreate({required String uri}) = _FileCreate;

  factory FileCreate.fromJson(Map<String, dynamic> json) =>
      _$FileCreateFromJson(json);
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

  factory TextDocumentEdit.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentEditFromJson(json);
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

  factory CreateFile.fromJson(Map<String, dynamic> json) =>
      _$CreateFileFromJson(json);
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

  factory RenameFile.fromJson(Map<String, dynamic> json) =>
      _$RenameFileFromJson(json);
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

  factory DeleteFile.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileFromJson(json);
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

  factory ChangeAnnotation.fromJson(Map<String, dynamic> json) =>
      _$ChangeAnnotationFromJson(json);
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

  factory FileOperationFilter.fromJson(Map<String, dynamic> json) =>
      _$FileOperationFilterFromJson(json);
}

/// Represents information on a file/folder rename.
///
/// @since 3.16.0
@freezed
abstract class FileRename with _$FileRename {
  const FileRename._();

  const factory FileRename({required String oldUri, required String newUri}) =
      _FileRename;

  factory FileRename.fromJson(Map<String, dynamic> json) =>
      _$FileRenameFromJson(json);
}

/// Represents information on a file/folder delete.
///
/// @since 3.16.0
@freezed
abstract class FileDelete with _$FileDelete {
  const FileDelete._();

  const factory FileDelete({required String uri}) = _FileDelete;

  factory FileDelete.fromJson(Map<String, dynamic> json) =>
      _$FileDeleteFromJson(json);
}

@freezed
abstract class MonikerOptions with _$MonikerOptions {
  const MonikerOptions._();

  const factory MonikerOptions({bool? workDoneProgress}) = _MonikerOptions;

  factory MonikerOptions.fromJson(Map<String, dynamic> json) =>
      _$MonikerOptionsFromJson(json);
}

/// Type hierarchy options used during static registration.
///
/// @since 3.17.0
@freezed
abstract class TypeHierarchyOptions with _$TypeHierarchyOptions {
  const TypeHierarchyOptions._();

  const factory TypeHierarchyOptions({bool? workDoneProgress}) =
      _TypeHierarchyOptions;

  factory TypeHierarchyOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyOptionsFromJson(json);
}

/// @since 3.17.0
@freezed
abstract class InlineValueContext with _$InlineValueContext {
  const InlineValueContext._();

  const factory InlineValueContext({
    required int frameId,
    required Range stoppedLocation,
  }) = _InlineValueContext;

  factory InlineValueContext.fromJson(Map<String, dynamic> json) =>
      _$InlineValueContextFromJson(json);
}

/// Provide inline value as text.
///
/// @since 3.17.0
@freezed
abstract class InlineValueText with _$InlineValueText {
  const InlineValueText._();

  const factory InlineValueText({required Range range, required String text}) =
      _InlineValueText;

  factory InlineValueText.fromJson(Map<String, dynamic> json) =>
      _$InlineValueTextFromJson(json);
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

  factory InlineValueVariableLookup.fromJson(Map<String, dynamic> json) =>
      _$InlineValueVariableLookupFromJson(json);
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

  factory InlineValueEvaluatableExpression.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueEvaluatableExpressionFromJson(json);
}

/// Inline value options used during static registration.
///
/// @since 3.17.0
@freezed
abstract class InlineValueOptions with _$InlineValueOptions {
  const InlineValueOptions._();

  const factory InlineValueOptions({bool? workDoneProgress}) =
      _InlineValueOptions;

  factory InlineValueOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueOptionsFromJson(json);
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

  factory InlayHintLabelPart.fromJson(Map<String, dynamic> json) =>
      _$InlayHintLabelPartFromJson(json);
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

  factory MarkupContent.fromJson(Map<String, dynamic> json) =>
      _$MarkupContentFromJson(json);
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

  factory InlayHintOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintOptionsFromJson(json);
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

  factory RelatedFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedFullDocumentDiagnosticReportFromJson(json);
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

  factory RelatedUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$RelatedUnchangedDocumentDiagnosticReportFromJson(json);
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

  factory FullDocumentDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$FullDocumentDiagnosticReportFromJson(json);
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

  factory UnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$UnchangedDocumentDiagnosticReportFromJson(json);
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

  factory DiagnosticOptions.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticOptionsFromJson(json);
}

/// A previous result id in a workspace pull request.
///
/// @since 3.17.0
@freezed
abstract class PreviousResultId with _$PreviousResultId {
  const PreviousResultId._();

  const factory PreviousResultId({required String uri, required String value}) =
      _PreviousResultId;

  factory PreviousResultId.fromJson(Map<String, dynamic> json) =>
      _$PreviousResultIdFromJson(json);
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

  factory NotebookDocument.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentFromJson(json);
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

  factory TextDocumentItem.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentItemFromJson(json);
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

  factory VersionedNotebookDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) => _$VersionedNotebookDocumentIdentifierFromJson(json);
}

/// A change event for a notebook document.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentChangeEvent with _$NotebookDocumentChangeEvent {
  const NotebookDocumentChangeEvent._();

  const factory NotebookDocumentChangeEvent({
    LSPObject? metadata,
    ({
      ({
        NotebookCellArrayChange array,
        List<TextDocumentItem>? didOpen,
        List<TextDocumentIdentifier>? didClose,
      })?
      structure,
      List<NotebookCell>? data,
      List<Object>? textContent,
    })?
    cells,
  }) = _NotebookDocumentChangeEvent;

  factory NotebookDocumentChangeEvent.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentChangeEventFromJson(json);
}

/// A literal to identify a notebook document in the client.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentIdentifier with _$NotebookDocumentIdentifier {
  const NotebookDocumentIdentifier._();

  const factory NotebookDocumentIdentifier({required String uri}) =
      _NotebookDocumentIdentifier;

  factory NotebookDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentIdentifierFromJson(json);
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

  factory InlineCompletionContext.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionContextFromJson(json);
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

  factory StringValue.fromJson(Map<String, dynamic> json) =>
      _$StringValueFromJson(json);
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

  factory InlineCompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionOptionsFromJson(json);
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

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);
}

/// General parameters to unregister a request or notification.
@freezed
abstract class Unregistration with _$Unregistration {
  const Unregistration._();

  const factory Unregistration({required String id, required String method}) =
      _Unregistration;

  factory Unregistration.fromJson(Map<String, dynamic> json) =>
      _$UnregistrationFromJson(json);
}

@freezed
abstract class WorkspaceFoldersInitializeParams
    with _$WorkspaceFoldersInitializeParams {
  const WorkspaceFoldersInitializeParams._();

  const factory WorkspaceFoldersInitializeParams({
    List<WorkspaceFolder>? workspaceFolders,
  }) = _WorkspaceFoldersInitializeParams;

  factory WorkspaceFoldersInitializeParams.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersInitializeParamsFromJson(json);
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
    ({
      WorkspaceFoldersServerCapabilities? workspaceFolders,
      FileOperationOptions? fileOperations,
    })?
    workspace,
    LSPAny? experimental,
  }) = _ServerCapabilities;

  factory ServerCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ServerCapabilitiesFromJson(json);
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

  factory VersionedTextDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$VersionedTextDocumentIdentifierFromJson(json);
}

/// Save options.
@freezed
abstract class SaveOptions with _$SaveOptions {
  const SaveOptions._();

  const factory SaveOptions({bool? includeText}) = _SaveOptions;

  factory SaveOptions.fromJson(Map<String, dynamic> json) =>
      _$SaveOptionsFromJson(json);
}

/// An event describing a file change.
@freezed
abstract class FileEvent with _$FileEvent {
  const FileEvent._();

  const factory FileEvent({required String uri, required FileChangeType type}) =
      _FileEvent;

  factory FileEvent.fromJson(Map<String, dynamic> json) =>
      _$FileEventFromJson(json);
}

@freezed
abstract class FileSystemWatcher with _$FileSystemWatcher {
  const FileSystemWatcher._();

  const factory FileSystemWatcher({
    required GlobPattern globPattern,
    WatchKind? kind,
  }) = _FileSystemWatcher;

  factory FileSystemWatcher.fromJson(Map<String, dynamic> json) =>
      _$FileSystemWatcherFromJson(json);
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

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}

/// Contains additional information about the context in which a completion request is triggered.
@freezed
abstract class CompletionContext with _$CompletionContext {
  const CompletionContext._();

  const factory CompletionContext({
    required CompletionTriggerKind triggerKind,
    String? triggerCharacter,
  }) = _CompletionContext;

  factory CompletionContext.fromJson(Map<String, dynamic> json) =>
      _$CompletionContextFromJson(json);
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

  factory CompletionItemLabelDetails.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemLabelDetailsFromJson(json);
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

  factory InsertReplaceEdit.fromJson(Map<String, dynamic> json) =>
      _$InsertReplaceEditFromJson(json);
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
    ({bool? labelDetailsSupport})? completionItem,
  }) = _CompletionOptions;

  factory CompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$CompletionOptionsFromJson(json);
}

/// Hover options.
@freezed
abstract class HoverOptions with _$HoverOptions {
  const HoverOptions._();

  const factory HoverOptions({bool? workDoneProgress}) = _HoverOptions;

  factory HoverOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverOptionsFromJson(json);
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

  factory SignatureHelpContext.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpContextFromJson(json);
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

  factory SignatureInformation.fromJson(Map<String, dynamic> json) =>
      _$SignatureInformationFromJson(json);
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

  factory SignatureHelpOptions.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpOptionsFromJson(json);
}

/// Server Capabilities for a {@link DefinitionRequest}.
@freezed
abstract class DefinitionOptions with _$DefinitionOptions {
  const DefinitionOptions._();

  const factory DefinitionOptions({bool? workDoneProgress}) =
      _DefinitionOptions;

  factory DefinitionOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionOptionsFromJson(json);
}

/// Value-object that contains additional information when
/// requesting references.
@freezed
abstract class ReferenceContext with _$ReferenceContext {
  const ReferenceContext._();

  const factory ReferenceContext({required bool includeDeclaration}) =
      _ReferenceContext;

  factory ReferenceContext.fromJson(Map<String, dynamic> json) =>
      _$ReferenceContextFromJson(json);
}

/// Reference options.
@freezed
abstract class ReferenceOptions with _$ReferenceOptions {
  const ReferenceOptions._();

  const factory ReferenceOptions({bool? workDoneProgress}) = _ReferenceOptions;

  factory ReferenceOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceOptionsFromJson(json);
}

/// Provider options for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightOptions with _$DocumentHighlightOptions {
  const DocumentHighlightOptions._();

  const factory DocumentHighlightOptions({bool? workDoneProgress}) =
      _DocumentHighlightOptions;

  factory DocumentHighlightOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightOptionsFromJson(json);
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

  factory BaseSymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$BaseSymbolInformationFromJson(json);
}

/// Provider options for a {@link DocumentSymbolRequest}.
@freezed
abstract class DocumentSymbolOptions with _$DocumentSymbolOptions {
  const DocumentSymbolOptions._();

  const factory DocumentSymbolOptions({bool? workDoneProgress, String? label}) =
      _DocumentSymbolOptions;

  factory DocumentSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolOptionsFromJson(json);
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

  factory CodeActionContext.fromJson(Map<String, dynamic> json) =>
      _$CodeActionContextFromJson(json);
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

  factory CodeActionOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionOptionsFromJson(json);
}

/// Server capabilities for a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolOptions with _$WorkspaceSymbolOptions {
  const WorkspaceSymbolOptions._();

  const factory WorkspaceSymbolOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _WorkspaceSymbolOptions;

  factory WorkspaceSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolOptionsFromJson(json);
}

/// Code Lens provider options of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensOptions with _$CodeLensOptions {
  const CodeLensOptions._();

  const factory CodeLensOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _CodeLensOptions;

  factory CodeLensOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensOptionsFromJson(json);
}

/// Provider options for a {@link DocumentLinkRequest}.
@freezed
abstract class DocumentLinkOptions with _$DocumentLinkOptions {
  const DocumentLinkOptions._();

  const factory DocumentLinkOptions({
    bool? workDoneProgress,
    bool? resolveProvider,
  }) = _DocumentLinkOptions;

  factory DocumentLinkOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkOptionsFromJson(json);
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

  factory FormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$FormattingOptionsFromJson(json);
}

/// Provider options for a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingOptions with _$DocumentFormattingOptions {
  const DocumentFormattingOptions._();

  const factory DocumentFormattingOptions({bool? workDoneProgress}) =
      _DocumentFormattingOptions;

  factory DocumentFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingOptionsFromJson(json);
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

  factory DocumentRangeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingOptionsFromJson(json);
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

  factory DocumentOnTypeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingOptionsFromJson(json);
}

/// Provider options for a {@link RenameRequest}.
@freezed
abstract class RenameOptions with _$RenameOptions {
  const RenameOptions._();

  const factory RenameOptions({bool? workDoneProgress, bool? prepareProvider}) =
      _RenameOptions;

  factory RenameOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameOptionsFromJson(json);
}

/// The server capabilities of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandOptions with _$ExecuteCommandOptions {
  const ExecuteCommandOptions._();

  const factory ExecuteCommandOptions({
    bool? workDoneProgress,
    required List<String> commands,
  }) = _ExecuteCommandOptions;

  factory ExecuteCommandOptions.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandOptionsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensLegend with _$SemanticTokensLegend {
  const SemanticTokensLegend._();

  const factory SemanticTokensLegend({
    required List<String> tokenTypes,
    required List<String> tokenModifiers,
  }) = _SemanticTokensLegend;

  factory SemanticTokensLegend.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensLegendFromJson(json);
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

  factory OptionalVersionedTextDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) => _$OptionalVersionedTextDocumentIdentifierFromJson(json);
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

  factory AnnotatedTextEdit.fromJson(Map<String, dynamic> json) =>
      _$AnnotatedTextEditFromJson(json);
}

/// A generic resource operation.
@freezed
abstract class ResourceOperation with _$ResourceOperation {
  const ResourceOperation._();

  const factory ResourceOperation({
    required String kind,
    ChangeAnnotationIdentifier? annotationId,
  }) = _ResourceOperation;

  factory ResourceOperation.fromJson(Map<String, dynamic> json) =>
      _$ResourceOperationFromJson(json);
}

/// Options to create a file.
@freezed
abstract class CreateFileOptions with _$CreateFileOptions {
  const CreateFileOptions._();

  const factory CreateFileOptions({bool? overwrite, bool? ignoreIfExists}) =
      _CreateFileOptions;

  factory CreateFileOptions.fromJson(Map<String, dynamic> json) =>
      _$CreateFileOptionsFromJson(json);
}

/// Rename file options
@freezed
abstract class RenameFileOptions with _$RenameFileOptions {
  const RenameFileOptions._();

  const factory RenameFileOptions({bool? overwrite, bool? ignoreIfExists}) =
      _RenameFileOptions;

  factory RenameFileOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameFileOptionsFromJson(json);
}

/// Delete file options
@freezed
abstract class DeleteFileOptions with _$DeleteFileOptions {
  const DeleteFileOptions._();

  const factory DeleteFileOptions({bool? recursive, bool? ignoreIfNotExists}) =
      _DeleteFileOptions;

  factory DeleteFileOptions.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileOptionsFromJson(json);
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

  factory FileOperationPattern.fromJson(Map<String, dynamic> json) =>
      _$FileOperationPatternFromJson(json);
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

  factory WorkspaceFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFullDocumentDiagnosticReportFromJson(json);
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

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceUnchangedDocumentDiagnosticReportFromJson(json);
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

  factory NotebookCell.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellFromJson(json);
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

  factory NotebookCellArrayChange.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellArrayChangeFromJson(json);
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

  factory SelectedCompletionInfo.fromJson(Map<String, dynamic> json) =>
      _$SelectedCompletionInfoFromJson(json);
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

  factory ClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ClientCapabilitiesFromJson(json);
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

  factory TextDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentSyncOptionsFromJson(json);
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

  factory NotebookDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentSyncOptionsFromJson(json);
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

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersServerCapabilities
    with _$WorkspaceFoldersServerCapabilities {
  const WorkspaceFoldersServerCapabilities._();

  const factory WorkspaceFoldersServerCapabilities({
    bool? supported,
    Object? changeNotifications,
  }) = _WorkspaceFoldersServerCapabilities;

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersServerCapabilitiesFromJson(json);
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

  factory FileOperationOptions.fromJson(Map<String, dynamic> json) =>
      _$FileOperationOptionsFromJson(json);
}

/// Structure to capture a description for an error code.
///
/// @since 3.16.0
@freezed
abstract class CodeDescription with _$CodeDescription {
  const CodeDescription._();

  const factory CodeDescription({required String href}) = _CodeDescription;

  factory CodeDescription.fromJson(Map<String, dynamic> json) =>
      _$CodeDescriptionFromJson(json);
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

  factory DiagnosticRelatedInformation.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticRelatedInformationFromJson(json);
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

  factory ParameterInformation.fromJson(Map<String, dynamic> json) =>
      _$ParameterInformationFromJson(json);
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

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellTextDocumentFilterFromJson(json);
}

/// Matching options for the file operation pattern.
///
/// @since 3.16.0
@freezed
abstract class FileOperationPatternOptions with _$FileOperationPatternOptions {
  const FileOperationPatternOptions._();

  const factory FileOperationPatternOptions({bool? ignoreCase}) =
      _FileOperationPatternOptions;

  factory FileOperationPatternOptions.fromJson(Map<String, dynamic> json) =>
      _$FileOperationPatternOptionsFromJson(json);
}

@freezed
abstract class ExecutionSummary with _$ExecutionSummary {
  const ExecutionSummary._();

  const factory ExecutionSummary({required int executionOrder, bool? success}) =
      _ExecutionSummary;

  factory ExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$ExecutionSummaryFromJson(json);
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

  factory WorkspaceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceClientCapabilitiesFromJson(json);
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

  factory TextDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentClientCapabilitiesFromJson(json);
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

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class WindowClientCapabilities with _$WindowClientCapabilities {
  const WindowClientCapabilities._();

  const factory WindowClientCapabilities({
    bool? workDoneProgress,
    ShowMessageRequestClientCapabilities? showMessage,
    ShowDocumentClientCapabilities? showDocument,
  }) = _WindowClientCapabilities;

  factory WindowClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WindowClientCapabilitiesFromJson(json);
}

/// General client capabilities.
///
/// @since 3.16.0
@freezed
abstract class GeneralClientCapabilities with _$GeneralClientCapabilities {
  const GeneralClientCapabilities._();

  const factory GeneralClientCapabilities({
    ({bool cancel, List<String> retryOnContentModified})? staleRequestSupport,
    RegularExpressionsClientCapabilities? regularExpressions,
    MarkdownClientCapabilities? markdown,
    List<PositionEncodingKind>? positionEncodings,
  }) = _GeneralClientCapabilities;

  factory GeneralClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$GeneralClientCapabilitiesFromJson(json);
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

  factory RelativePattern.fromJson(Map<String, dynamic> json) =>
      _$RelativePatternFromJson(json);
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
    ({bool? groupsOnLabel})? changeAnnotationSupport,
  }) = _WorkspaceEditClientCapabilities;

  factory WorkspaceEditClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditClientCapabilitiesFromJson(json);
}

@freezed
abstract class DidChangeConfigurationClientCapabilities
    with _$DidChangeConfigurationClientCapabilities {
  const DidChangeConfigurationClientCapabilities._();

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
  const DidChangeWatchedFilesClientCapabilities._();

  const factory DidChangeWatchedFilesClientCapabilities({
    bool? dynamicRegistration,
    bool? relativePatternSupport,
  }) = _DidChangeWatchedFilesClientCapabilities;

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesClientCapabilitiesFromJson(json);
}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
@freezed
abstract class WorkspaceSymbolClientCapabilities
    with _$WorkspaceSymbolClientCapabilities {
  const WorkspaceSymbolClientCapabilities._();

  const factory WorkspaceSymbolClientCapabilities({
    bool? dynamicRegistration,
    ({List<SymbolKind>? valueSet})? symbolKind,
    ({List<SymbolTag> valueSet})? tagSupport,
    ({List<String> properties})? resolveSupport,
  }) = _WorkspaceSymbolClientCapabilities;

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolClientCapabilitiesFromJson(json);
}

/// The client capabilities of a {@link ExecuteCommandRequest}.
@freezed
abstract class ExecuteCommandClientCapabilities
    with _$ExecuteCommandClientCapabilities {
  const ExecuteCommandClientCapabilities._();

  const factory ExecuteCommandClientCapabilities({bool? dynamicRegistration}) =
      _ExecuteCommandClientCapabilities;

  factory ExecuteCommandClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensWorkspaceClientCapabilities
    with _$SemanticTokensWorkspaceClientCapabilities {
  const SemanticTokensWorkspaceClientCapabilities._();

  const factory SemanticTokensWorkspaceClientCapabilities({
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
  const CodeLensWorkspaceClientCapabilities._();

  const factory CodeLensWorkspaceClientCapabilities({bool? refreshSupport}) =
      _CodeLensWorkspaceClientCapabilities;

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$CodeLensWorkspaceClientCapabilitiesFromJson(json);
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

  factory FileOperationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FileOperationClientCapabilitiesFromJson(json);
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

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueWorkspaceClientCapabilitiesFromJson(json);
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

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlayHintWorkspaceClientCapabilitiesFromJson(json);
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

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticWorkspaceClientCapabilitiesFromJson(json);
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

  factory FoldingRangeWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$FoldingRangeWorkspaceClientCapabilitiesFromJson(json);
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

  factory TextDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSyncClientCapabilitiesFromJson(json);
}

/// Completion client capabilities
@freezed
abstract class CompletionClientCapabilities
    with _$CompletionClientCapabilities {
  const CompletionClientCapabilities._();

  const factory CompletionClientCapabilities({
    bool? dynamicRegistration,
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
    ({List<CompletionItemKind>? valueSet})? completionItemKind,
    InsertTextMode? insertTextMode,
    bool? contextSupport,
    ({List<String>? itemDefaults})? completionList,
  }) = _CompletionClientCapabilities;

  factory CompletionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CompletionClientCapabilitiesFromJson(json);
}

@freezed
abstract class HoverClientCapabilities with _$HoverClientCapabilities {
  const HoverClientCapabilities._();

  const factory HoverClientCapabilities({
    bool? dynamicRegistration,
    List<MarkupKind>? contentFormat,
  }) = _HoverClientCapabilities;

  factory HoverClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$HoverClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link SignatureHelpRequest}.
@freezed
abstract class SignatureHelpClientCapabilities
    with _$SignatureHelpClientCapabilities {
  const SignatureHelpClientCapabilities._();

  const factory SignatureHelpClientCapabilities({
    bool? dynamicRegistration,
    ({
      List<MarkupKind>? documentationFormat,
      ({bool? labelOffsetSupport})? parameterInformation,
      bool? activeParameterSupport,
    })?
    signatureInformation,
    bool? contextSupport,
  }) = _SignatureHelpClientCapabilities;

  factory SignatureHelpClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpClientCapabilitiesFromJson(json);
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

  factory DeclarationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeclarationClientCapabilitiesFromJson(json);
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

  factory DefinitionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DefinitionClientCapabilitiesFromJson(json);
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

  factory TypeDefinitionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionClientCapabilitiesFromJson(json);
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

  factory ImplementationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link ReferencesRequest}.
@freezed
abstract class ReferenceClientCapabilities with _$ReferenceClientCapabilities {
  const ReferenceClientCapabilities._();

  const factory ReferenceClientCapabilities({bool? dynamicRegistration}) =
      _ReferenceClientCapabilities;

  factory ReferenceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ReferenceClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
@freezed
abstract class DocumentHighlightClientCapabilities
    with _$DocumentHighlightClientCapabilities {
  const DocumentHighlightClientCapabilities._();

  const factory DocumentHighlightClientCapabilities({
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
  const DocumentSymbolClientCapabilities._();

  const factory DocumentSymbolClientCapabilities({
    bool? dynamicRegistration,
    ({List<SymbolKind>? valueSet})? symbolKind,
    bool? hierarchicalDocumentSymbolSupport,
    ({List<SymbolTag> valueSet})? tagSupport,
    bool? labelSupport,
  }) = _DocumentSymbolClientCapabilities;

  factory DocumentSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolClientCapabilitiesFromJson(json);
}

/// The Client Capabilities of a {@link CodeActionRequest}.
@freezed
abstract class CodeActionClientCapabilities
    with _$CodeActionClientCapabilities {
  const CodeActionClientCapabilities._();

  const factory CodeActionClientCapabilities({
    bool? dynamicRegistration,
    ({({List<CodeActionKind> valueSet}) codeActionKind})?
    codeActionLiteralSupport,
    bool? isPreferredSupport,
    bool? disabledSupport,
    bool? dataSupport,
    ({List<String> properties})? resolveSupport,
    bool? honorsChangeAnnotations,
  }) = _CodeActionClientCapabilities;

  factory CodeActionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeActionClientCapabilitiesFromJson(json);
}

/// The client capabilities  of a {@link CodeLensRequest}.
@freezed
abstract class CodeLensClientCapabilities with _$CodeLensClientCapabilities {
  const CodeLensClientCapabilities._();

  const factory CodeLensClientCapabilities({bool? dynamicRegistration}) =
      _CodeLensClientCapabilities;

  factory CodeLensClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeLensClientCapabilitiesFromJson(json);
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

  factory DocumentLinkClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentColorClientCapabilities
    with _$DocumentColorClientCapabilities {
  const DocumentColorClientCapabilities._();

  const factory DocumentColorClientCapabilities({bool? dynamicRegistration}) =
      _DocumentColorClientCapabilities;

  factory DocumentColorClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorClientCapabilitiesFromJson(json);
}

/// Client capabilities of a {@link DocumentFormattingRequest}.
@freezed
abstract class DocumentFormattingClientCapabilities
    with _$DocumentFormattingClientCapabilities {
  const DocumentFormattingClientCapabilities._();

  const factory DocumentFormattingClientCapabilities({
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
  const DocumentRangeFormattingClientCapabilities._();

  const factory DocumentRangeFormattingClientCapabilities({
    bool? dynamicRegistration,
    bool? rangesSupport,
  }) = _DocumentRangeFormattingClientCapabilities;

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingClientCapabilitiesFromJson(json);
}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
@freezed
abstract class DocumentOnTypeFormattingClientCapabilities
    with _$DocumentOnTypeFormattingClientCapabilities {
  const DocumentOnTypeFormattingClientCapabilities._();

  const factory DocumentOnTypeFormattingClientCapabilities({
    bool? dynamicRegistration,
  }) = _DocumentOnTypeFormattingClientCapabilities;

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingClientCapabilitiesFromJson(json);
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

  factory RenameClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$RenameClientCapabilitiesFromJson(json);
}

@freezed
abstract class FoldingRangeClientCapabilities
    with _$FoldingRangeClientCapabilities {
  const FoldingRangeClientCapabilities._();

  const factory FoldingRangeClientCapabilities({
    bool? dynamicRegistration,
    int? rangeLimit,
    bool? lineFoldingOnly,
    ({List<FoldingRangeKind>? valueSet})? foldingRangeKind,
    ({bool? collapsedText})? foldingRange,
  }) = _FoldingRangeClientCapabilities;

  factory FoldingRangeClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class SelectionRangeClientCapabilities
    with _$SelectionRangeClientCapabilities {
  const SelectionRangeClientCapabilities._();

  const factory SelectionRangeClientCapabilities({bool? dynamicRegistration}) =
      _SelectionRangeClientCapabilities;

  factory SelectionRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SelectionRangeClientCapabilitiesFromJson(json);
}

/// The publish diagnostic client capabilities.
@freezed
abstract class PublishDiagnosticsClientCapabilities
    with _$PublishDiagnosticsClientCapabilities {
  const PublishDiagnosticsClientCapabilities._();

  const factory PublishDiagnosticsClientCapabilities({
    bool? relatedInformation,
    ({List<DiagnosticTag> valueSet})? tagSupport,
    bool? versionSupport,
    bool? codeDescriptionSupport,
    bool? dataSupport,
  }) = _PublishDiagnosticsClientCapabilities;

  factory PublishDiagnosticsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$PublishDiagnosticsClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class CallHierarchyClientCapabilities
    with _$CallHierarchyClientCapabilities {
  const CallHierarchyClientCapabilities._();

  const factory CallHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _CallHierarchyClientCapabilities;

  factory CallHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensClientCapabilities
    with _$SemanticTokensClientCapabilities {
  const SemanticTokensClientCapabilities._();

  const factory SemanticTokensClientCapabilities({
    bool? dynamicRegistration,
    required ({Object? range, Object? full}) requests,
    required List<String> tokenTypes,
    required List<String> tokenModifiers,
    required List<TokenFormat> formats,
    bool? overlappingTokenSupport,
    bool? multilineTokenSupport,
    bool? serverCancelSupport,
    bool? augmentsSyntaxTokens,
  }) = _SemanticTokensClientCapabilities;

  factory SemanticTokensClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensClientCapabilitiesFromJson(json);
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

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to the moniker request.
///
/// @since 3.16.0
@freezed
abstract class MonikerClientCapabilities with _$MonikerClientCapabilities {
  const MonikerClientCapabilities._();

  const factory MonikerClientCapabilities({bool? dynamicRegistration}) =
      _MonikerClientCapabilities;

  factory MonikerClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MonikerClientCapabilitiesFromJson(json);
}

/// @since 3.17.0
@freezed
abstract class TypeHierarchyClientCapabilities
    with _$TypeHierarchyClientCapabilities {
  const TypeHierarchyClientCapabilities._();

  const factory TypeHierarchyClientCapabilities({bool? dynamicRegistration}) =
      _TypeHierarchyClientCapabilities;

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyClientCapabilitiesFromJson(json);
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

  factory InlineValueClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlineValueClientCapabilitiesFromJson(json);
}

/// Inlay hint client capabilities.
///
/// @since 3.17.0
@freezed
abstract class InlayHintClientCapabilities with _$InlayHintClientCapabilities {
  const InlayHintClientCapabilities._();

  const factory InlayHintClientCapabilities({
    bool? dynamicRegistration,
    ({List<String> properties})? resolveSupport,
  }) = _InlayHintClientCapabilities;

  factory InlayHintClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlayHintClientCapabilitiesFromJson(json);
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

  factory DiagnosticClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticClientCapabilitiesFromJson(json);
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

  factory InlineCompletionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionClientCapabilitiesFromJson(json);
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

  factory NotebookDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncClientCapabilitiesFromJson(json);
}

/// Show message request client capabilities
@freezed
abstract class ShowMessageRequestClientCapabilities
    with _$ShowMessageRequestClientCapabilities {
  const ShowMessageRequestClientCapabilities._();

  const factory ShowMessageRequestClientCapabilities({
    ({bool? additionalPropertiesSupport})? messageActionItem,
  }) = _ShowMessageRequestClientCapabilities;

  factory ShowMessageRequestClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ShowMessageRequestClientCapabilitiesFromJson(json);
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

  factory ShowDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentClientCapabilitiesFromJson(json);
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

  factory RegularExpressionsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$RegularExpressionsClientCapabilitiesFromJson(json);
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

  factory MarkdownClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MarkdownClientCapabilitiesFromJson(json);
}

class _ProgressTokenConverter extends JsonConverter<ProgressToken, Object> {
  const _ProgressTokenConverter();

  @override
  ProgressToken fromJson(Object json) => ProgressToken.fromJson(json);

  @override
  Object toJson(ProgressToken object) => object.toJson();
}

class _WorkspaceDocumentDiagnosticReportListConverter
    extends
        JsonConverter<List<WorkspaceDocumentDiagnosticReport>, List<dynamic>> {
  const _WorkspaceDocumentDiagnosticReportListConverter();

  @override
  List<WorkspaceDocumentDiagnosticReport> fromJson(List<dynamic> json) => json
      .map(
        (e) => WorkspaceDocumentDiagnosticReport.fromJson(
          (e as Map<String, Object?>),
        ),
      )
      .toList();

  @override
  List<dynamic> toJson(List<WorkspaceDocumentDiagnosticReport> object) =>
      object.map<Object>((e) => e.toJson()).toList();
}

class _TextDocumentContentChangeEventListConverter
    extends JsonConverter<List<TextDocumentContentChangeEvent>, List<dynamic>> {
  const _TextDocumentContentChangeEventListConverter();

  @override
  List<TextDocumentContentChangeEvent> fromJson(List<dynamic> json) => json
      .map(
        (e) => TextDocumentContentChangeEvent.fromJson(
          (e as Map<String, Object?>),
        ),
      )
      .toList();

  @override
  List<dynamic> toJson(List<TextDocumentContentChangeEvent> object) =>
      object.map<Object>((e) => e.toJson()).toList();
}
