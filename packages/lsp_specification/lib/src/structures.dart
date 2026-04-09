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
  const factory ImplementationParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _ImplementationParams;

  factory ImplementationParams.fromJson(Map<String, dynamic> json) =>
      _$ImplementationParamsFromJson(json);
}

/// Represents a location inside a resource, such as a line inside a text file.
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
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
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

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _TypeDefinitionParams;

  factory TypeDefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$TypeDefinitionParamsFromJson(json);
}

@freezed
abstract class TypeDefinitionRegistrationOptions
    with _$TypeDefinitionRegistrationOptions {
  const factory TypeDefinitionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
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

    /// The name of the workspace folder. Used to refer to this workspace folder in
    /// the user interface.
    required String name,
  }) = _WorkspaceFolder;

  factory WorkspaceFolder.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFolderFromJson(json);
}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
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

/// Parameters for a [DocumentColorRequest].
@freezed
abstract class DocumentColorParams with _$DocumentColorParams {
  const factory DocumentColorParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,
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
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
  }) = _DocumentColorRegistrationOptions;

  factory DocumentColorRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentColorRegistrationOptionsFromJson(json);
}

/// Parameters for a [ColorPresentationRequest].
@freezed
abstract class ColorPresentationParams with _$ColorPresentationParams {
  const factory ColorPresentationParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The color to request presentations for.
    required Color color,

    /// The range where the color would be inserted. Serves as a context.
    required Range range,
  }) = _ColorPresentationParams;

  factory ColorPresentationParams.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationParamsFromJson(json);
}

@freezed
abstract class ColorPresentation with _$ColorPresentation {
  const factory ColorPresentation({
    /// The label of this color presentation. It will be shown on the color picker
    /// header. By default this is also the text that is inserted when selecting
    /// this color presentation.
    required String label,

    /// An [edit] which is applied to a document when selecting this presentation
    /// for the color. When `falsy` the [label] is used.
    TextEdit? textEdit,

    /// An optional array of additional [TextEdit] that are applied when selecting
    /// this color presentation. Edits must not overlap with the main [edit] nor
    /// with themselves.
    List<TextEdit>? additionalTextEdits,
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
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
  }) = _TextDocumentRegistrationOptions;

  factory TextDocumentRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentRegistrationOptionsFromJson(json);
}

/// Parameters for a [FoldingRangeRequest].
@freezed
abstract class FoldingRangeParams with _$FoldingRangeParams {
  const factory FoldingRangeParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,
  }) = _FoldingRangeParams;

  factory FoldingRangeParams.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeParamsFromJson(json);
}

/// Represents a folding range. To be valid, start and end line must be bigger
/// than zero and smaller than the number of lines in the document. Clients are
/// free to ignore invalid ranges.
@freezed
abstract class FoldingRange with _$FoldingRange {
  const FoldingRange._();

  const factory FoldingRange({
    /// The zero-based start line of the range to fold. The folded area starts after
    /// the line's last character. To be valid, the end must be zero or larger and
    /// smaller than the number of lines in the document.
    required int startLine,

    /// The zero-based character offset from where the folded range starts. If not
    /// defined, defaults to the length of the start line.
    int? startCharacter,

    /// The zero-based end line of the range to fold. The folded area ends with the
    /// line's last character. To be valid, the end must be zero or larger and
    /// smaller than the number of lines in the document.
    required int endLine,

    /// The zero-based character offset before the folded range ends. If not
    /// defined, defaults to the length of the end line.
    int? endCharacter,

    /// Describes the kind of the folding range such as `comment' or 'region'. The
    /// kind is used to categorize folding ranges and used by commands like 'Fold
    /// all comments'. See [FoldingRangeKind] for an enumeration of standardized
    /// kinds.
    String? kind,

    /// The text that the client should show when the specified range is collapsed.
    /// If not defined or not supported by the client, a default will be chosen by
    /// the client.
    ///
    /// @since 3.17.0
    String? collapsedText,
  }) = _FoldingRange;

  factory FoldingRange.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeFromJson(json);

  FoldingRangeKind? get kindEnum =>
      kind != null ? FoldingRangeKind.decode(kind!) : null;
}

@freezed
abstract class FoldingRangeRegistrationOptions
    with _$FoldingRangeRegistrationOptions {
  const factory FoldingRangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
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

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _DeclarationParams;

  factory DeclarationParams.fromJson(Map<String, dynamic> json) =>
      _$DeclarationParamsFromJson(json);
}

@freezed
abstract class DeclarationRegistrationOptions
    with _$DeclarationRegistrationOptions {
  const factory DeclarationRegistrationOptions({
    bool? workDoneProgress,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
  }) = _DeclarationRegistrationOptions;

  factory DeclarationRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DeclarationRegistrationOptionsFromJson(json);
}

/// A parameter literal used in selection range requests.
@freezed
abstract class SelectionRangeParams with _$SelectionRangeParams {
  const factory SelectionRangeParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The positions inside the text document.
    required List<Position> positions,
  }) = _SelectionRangeParams;

  factory SelectionRangeParams.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeParamsFromJson(json);
}

/// A selection range represents a part of a selection hierarchy. A selection
/// range may have a parent selection range that contains it.
@freezed
abstract class SelectionRange with _$SelectionRange {
  const factory SelectionRange({
    /// The [range] of this selection range.
    required Range range,

    /// The parent selection range containing this range. Therefore `parent.range`
    /// must contain `this.range`.
    SelectionRange? parent,
  }) = _SelectionRange;

  factory SelectionRange.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeFromJson(json);
}

@freezed
abstract class SelectionRangeRegistrationOptions
    with _$SelectionRangeRegistrationOptions {
  const factory SelectionRangeRegistrationOptions({
    bool? workDoneProgress,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
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
    @_ProgressTokenConverter() required ProgressToken token,
  }) = _WorkDoneProgressCreateParams;

  factory WorkDoneProgressCreateParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressCreateParamsFromJson(json);
}

@freezed
abstract class WorkDoneProgressCancelParams
    with _$WorkDoneProgressCancelParams {
  const factory WorkDoneProgressCancelParams({
    /// The token to be used to report progress.
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
  const factory CallHierarchyPrepareParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _CallHierarchyPrepareParams;

  factory CallHierarchyPrepareParams.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyPrepareParamsFromJson(json);
}

/// Represents programming constructs like functions or constructors in the
/// context of call hierarchy.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyItem with _$CallHierarchyItem {
  const factory CallHierarchyItem({
    /// The name of this item.
    required String name,

    /// The kind of this item.
    required SymbolKind kind,

    /// Tags for this item.
    List<SymbolTag>? tags,

    /// More detail for this item, e.g. the signature of a function.
    String? detail,

    /// The resource identifier of this item.
    required String uri,

    /// The range enclosing this symbol not including leading/trailing whitespace
    /// but everything else, e.g. comments and code.
    required Range range,

    /// The range that should be selected and revealed when this symbol is being
    /// picked, e.g. the name of a function. Must be contained by the [range].
    required Range selectionRange,

    /// A data entry field that is preserved between a call hierarchy prepare and
    /// incoming calls or outgoing calls requests.
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
  const factory CallHierarchyRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
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
  const factory CallHierarchyIncomingCallsParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
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
  const factory CallHierarchyIncomingCall({
    /// The item that makes the call.
    required CallHierarchyItem from,

    /// The ranges at which the calls appear. This is relative to the caller denoted
    /// by [CallHierarchyIncomingCall].
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
  const factory CallHierarchyOutgoingCallsParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required CallHierarchyItem item,
  }) = _CallHierarchyOutgoingCallsParams;

  factory CallHierarchyOutgoingCallsParams.fromJson(
    Map<String, dynamic> json,
  ) => _$CallHierarchyOutgoingCallsParamsFromJson(json);
}

/// Represents an outgoing call, e.g. calling a getter from a method or a method
/// from a constructor etc.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyOutgoingCall with _$CallHierarchyOutgoingCall {
  const factory CallHierarchyOutgoingCall({
    /// The item that is called.
    required CallHierarchyItem to,

    /// The range at which this item is called. This is the range relative to the
    /// caller, e.g the item passed to [provideCallHierarchyOutgoingCalls] and not
    /// [CallHierarchyOutgoingCall].
    required List<Range> fromRanges,
  }) = _CallHierarchyOutgoingCall;

  factory CallHierarchyOutgoingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOutgoingCallFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensParams with _$SemanticTokensParams {
  const factory SemanticTokensParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,
  }) = _SemanticTokensParams;

  factory SemanticTokensParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensParamsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokens with _$SemanticTokens {
  const factory SemanticTokens({
    /// An optional result id. If provided and clients support delta updating the
    /// client will include the result id in the next semantic token request. A
    /// server can then instead of computing all semantic tokens again simply send a
    /// delta.
    String? resultId,

    /// The actual tokens.
    required List<int> data,
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
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The legend used by the server
    required SemanticTokensLegend legend,

    /// Server supports providing semantic tokens for a specific range of a
    /// document.
    Object? range,

    /// Server supports providing semantic tokens for a full document.
    Object? full,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
  }) = _SemanticTokensRegistrationOptions;

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensRegistrationOptionsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDeltaParams with _$SemanticTokensDeltaParams {
  const factory SemanticTokensDeltaParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The result id of a previous response. The result Id can either point to a
    /// full response or a delta response depending on what was received last.
    required String previousResultId,
  }) = _SemanticTokensDeltaParams;

  factory SemanticTokensDeltaParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaParamsFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensDelta with _$SemanticTokensDelta {
  const factory SemanticTokensDelta({
    String? resultId,

    /// The semantic token edits to transform a previous result into a new result.
    required List<SemanticTokensEdit> edits,
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
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The range the semantic tokens are requested for.
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
  const factory ShowDocumentParams({
    /// The uri to show.
    required String uri,

    /// Indicates to show the resource in an external program. To show, for example,
    /// `https://code.visualstudio.com/` in the default WEB browser set `external`
    /// to `true`.
    bool? external,

    /// An optional property to indicate whether the editor showing the document
    /// should take focus or not. Clients might ignore this property if an external
    /// program is started.
    bool? takeFocus,

    /// An optional selection range if the document is a text document. Clients
    /// might ignore the property if an external program is started or the file is
    /// not a text file.
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
  const factory LinkedEditingRanges({
    /// A list of ranges that can be edited together. The ranges must have identical
    /// length and contain identical text content. The ranges cannot overlap.
    required List<Range> ranges,

    /// An optional word pattern (regular expression) that describes valid contents
    /// for the given ranges. If no pattern is provided, the client configuration's
    /// word pattern will be used.
    String? wordPattern,
  }) = _LinkedEditingRanges;

  factory LinkedEditingRanges.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangesFromJson(json);
}

@freezed
abstract class LinkedEditingRangeRegistrationOptions
    with _$LinkedEditingRangeRegistrationOptions {
  const factory LinkedEditingRangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
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
  const factory CreateFilesParams({
    /// An array of all files/folders created in this operation.
    required List<FileCreate> files,
  }) = _CreateFilesParams;

  factory CreateFilesParams.fromJson(Map<String, dynamic> json) =>
      _$CreateFilesParamsFromJson(json);
}

/// A workspace edit represents changes to many resources managed in the
/// workspace. The edit should either provide `changes` or `documentChanges`. If
/// documentChanges are present they are preferred over `changes` if the client
/// can handle versioned document edits.
///
/// Since version 3.13.0 a workspace edit can contain resource operations as
/// well. If resource operations are present clients need to execute the
/// operations in the order in which they are provided. So a workspace edit for
/// example can consist of the following two changes: (1) a create file a.txt
/// and (2) a text document edit which insert text into file a.txt.
///
/// An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into
/// file a.txt) will cause failure of the operation. How the client recovers
/// from the failure is described by the client capability:
/// `workspace.workspaceEdit.failureHandling`
@freezed
abstract class WorkspaceEdit with _$WorkspaceEdit {
  const factory WorkspaceEdit({
    /// Holds changes to existing resources.
    Map<String, List<TextEdit>>? changes,

    /// Depending on the client capability
    /// `workspace.workspaceEdit.resourceOperations` document changes are either an
    /// array of `TextDocumentEdit`s to express changes to n different text
    /// documents where each text document edit addresses a specific version of a
    /// text document. Or it can contain above `TextDocumentEdit`s mixed with
    /// create, rename and delete file / folder operations.
    ///
    /// Whether a client supports versioned document edits is expressed via
    /// `workspace.workspaceEdit.documentChanges` client capability.
    ///
    /// If a client neither supports `documentChanges` nor
    /// `workspace.workspaceEdit.resourceOperations` then only plain `TextEdit`s
    /// using the `changes` property are supported.
    List<Object>? documentChanges,

    /// A map of change annotations that can be referenced in `AnnotatedTextEdit`s
    /// or create, rename and delete file / folder operations.
    ///
    /// Whether clients honor this property depends on the client capability
    /// `workspace.changeAnnotationSupport`.
    ///
    /// @since 3.16.0
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
  const factory FileOperationRegistrationOptions({
    /// The actual filters.
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
  const factory RenameFilesParams({
    /// An array of all files/folders renamed in this operation. When a folder is
    /// renamed, only the folder will be included, and not its children.
    required List<FileRename> files,
  }) = _RenameFilesParams;

  factory RenameFilesParams.fromJson(Map<String, dynamic> json) =>
      _$RenameFilesParamsFromJson(json);
}

/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
///
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

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
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
  const factory Moniker({
    /// The scheme of the moniker. For example tsc or .Net
    required String scheme,

    /// The identifier of the moniker. The value is opaque in LSIF however schema
    /// owners are allowed to define the structure if they want.
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
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
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
  const factory TypeHierarchyPrepareParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
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

    /// Tags for this item.
    List<SymbolTag>? tags,

    /// More detail for this item, e.g. the signature of a function.
    String? detail,

    /// The resource identifier of this item.
    required String uri,

    /// The range enclosing this symbol not including leading/trailing whitespace
    /// but everything else, e.g. comments and code.
    required Range range,

    /// The range that should be selected and revealed when this symbol is being
    /// picked, e.g. the name of a function. Must be contained by the [range].
    required Range selectionRange,

    /// A data entry field that is preserved between a type hierarchy prepare and
    /// supertypes or subtypes requests. It could also be used to identify the type
    /// hierarchy in the server, helping improve the performance on resolving
    /// supertypes and subtypes.
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
  const factory TypeHierarchyRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
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
  const factory TypeHierarchySupertypesParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
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
  const factory TypeHierarchySubtypesParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
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
  const factory InlineValueParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The document range for which inline values should be computed.
    required Range range,

    /// Additional information about the context in which inline values were
    /// requested.
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
  const factory InlineValueRegistrationOptions({
    bool? workDoneProgress,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
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
  const factory InlayHintParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The document range for which inlay hints should be computed.
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
  const factory InlayHint({
    /// The position of this hint.
    ///
    /// If multiple hints have the same position, they will be shown in the order
    /// they appear in the response.
    required Position position,

    /// The label of this hint. A human readable string or an array of
    /// InlayHintLabelPart label parts.
    ///
    /// *Note* that neither the string nor the label part can be empty.
    required Object label,

    /// The kind of this hint. Can be omitted in which case the client should fall
    /// back to a reasonable default.
    InlayHintKind? kind,

    /// Optional text edits that are performed when accepting this inlay hint.
    ///
    /// *Note* that edits are expected to change the document so that the inlay hint
    /// (or its nearest variant) is now part of the document and the inlay hint
    /// itself is now obsolete.
    List<TextEdit>? textEdits,

    /// The tooltip text when you hover over this item.
    Object? tooltip,

    /// Render padding before the hint.
    ///
    /// Note: Padding should use the editor's background color, not the background
    /// color of the hint itself. That means padding can be used to visually
    /// align/separate an inlay hint.
    bool? paddingLeft,

    /// Render padding after the hint.
    ///
    /// Note: Padding should use the editor's background color, not the background
    /// color of the hint itself. That means padding can be used to visually
    /// align/separate an inlay hint.
    bool? paddingRight,

    /// A data entry field that is preserved on an inlay hint between a
    /// `textDocument/inlayHint` and a `inlayHint/resolve` request.
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
  const factory InlayHintRegistrationOptions({
    bool? workDoneProgress,

    /// The server provides support to resolve additional information for an inlay
    /// hint item.
    bool? resolveProvider,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
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
  const factory DocumentDiagnosticParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The additional identifier  provided during registration.
    String? identifier,

    /// The result id of a previous response if provided.
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
  const factory DiagnosticRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// An optional identifier under which the diagnostics are managed by the
    /// client.
    String? identifier,

    /// Whether the language has inter file dependencies meaning that editing code
    /// in one file can result in a different diagnostic set in another file. Inter
    /// file dependencies are common for most programming languages and typically
    /// uncommon for linters.
    required bool interFileDependencies,

    /// The server provides support for workspace diagnostics as well.
    required bool workspaceDiagnostics,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
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
  const factory WorkspaceDiagnosticParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The additional identifier provided during registration.
    String? identifier,

    /// The currently known diagnostic reports with their previous result ids.
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
///
/// @since 3.17.0
@freezed
abstract class DidChangeNotebookDocumentParams
    with _$DidChangeNotebookDocumentParams {
  const factory DidChangeNotebookDocumentParams({
    /// The notebook document that did change. The version number points to the
    /// version after all provided changes have been applied. If only the text
    /// document content of a cell changes the notebook version doesn't necessarily
    /// have to change.
    required VersionedNotebookDocumentIdentifier notebookDocument,

    /// The actual changes to the notebook document.
    ///
    /// The changes describe single state changes to the notebook document. So if
    /// there are two changes c1 (at array index 0) and c2 (at array index 1) for a
    /// notebook in state S then c1 moves the notebook from S to S' and c2 from S'
    /// to S''. So c1 is computed on the state S and c2 is computed on the state S'.
    ///
    /// To mirror the content of a notebook using change events use the following
    /// approach: - start with the same initial content - apply the
    /// 'notebookDocument/didChange' notifications in the order you receive them. -
    /// apply the `NotebookChangeEvent`s in a single notification in the order you
    /// receive them.
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
  const factory DidSaveNotebookDocumentParams({
    /// The notebook document that got saved.
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
  const factory DidCloseNotebookDocumentParams({
    /// The notebook document that got closed.
    required NotebookDocumentIdentifier notebookDocument,

    /// The text documents that represent the content of a notebook cell that got
    /// closed.
    required List<TextDocumentIdentifier> cellTextDocuments,
  }) = _DidCloseNotebookDocumentParams;

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$DidCloseNotebookDocumentParamsFromJson(json);
}

/// A parameter literal used in inline completion requests.
///
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionParams with _$InlineCompletionParams {
  const factory InlineCompletionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// Additional information about the context in which inline completions were
    /// requested.
    required InlineCompletionContext context,
  }) = _InlineCompletionParams;

  factory InlineCompletionParams.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionParamsFromJson(json);
}

/// Represents a collection of [InlineCompletionItem] to be presented in the
/// editor.
///
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

/// An inline completion item represents a text snippet that is proposed inline
/// to complete text that is being typed.
///
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionItem with _$InlineCompletionItem {
  const factory InlineCompletionItem({
    /// The text to replace the range with. Must be set.
    required Object insertText,

    /// A text that is used to decide if this inline completion should be shown.
    /// When `falsy` the [InlineCompletionItem.insertText] is used.
    String? filterText,

    /// The range to replace. Must begin and end on the same line.
    Range? range,

    /// An optional [Command] that is executed *after* inserting this completion.
    Command? command,
  }) = _InlineCompletionItem;

  factory InlineCompletionItem.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionItemFromJson(json);
}

/// Inline completion options used during static or dynamic registration.
///
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionRegistrationOptions
    with _$InlineCompletionRegistrationOptions {
  const factory InlineCompletionRegistrationOptions({
    bool? workDoneProgress,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
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
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The process Id of the parent process that started the server.
    ///
    /// Is `null` if the process has not been started by another process. If the
    /// parent process is not alive then the server should exit.
    required int? processId,

    /// Information about the client
    ///
    /// @since 3.15.0
    ({String name, String? version})? clientInfo,

    /// The locale the client is currently showing the user interface in. This must
    /// not necessarily be the locale of the operating system.
    ///
    /// Uses IETF language tags as the value's syntax (See
    /// https://en.wikipedia.org/wiki/IETF_language_tag)
    ///
    /// @since 3.16.0
    String? locale,

    /// The rootPath of the workspace. Is null if no folder is open.
    ///
    /// @deprecated in favour of rootUri.
    String? rootPath,

    /// The rootUri of the workspace. Is null if no folder is open. If both
    /// `rootPath` and `rootUri` are set `rootUri` wins.
    ///
    /// @deprecated in favour of workspaceFolders.
    required String? rootUri,

    /// The capabilities provided by the client (editor or tool)
    required ClientCapabilities capabilities,

    /// User provided initialization options.
    LSPAny? initializationOptions,

    /// The initial trace setting. If omitted trace is disabled ('off').
    TraceValues? trace,

    /// The workspace folders configured in the client when the server starts.
    ///
    /// This property is only available if the client supports workspace folders. It
    /// can be `null` if the client supports workspace folders but none are
    /// configured.
    ///
    /// @since 3.6.0
    List<WorkspaceFolder>? workspaceFolders,
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
    ///
    /// @since 3.15.0
    ({String name, String? version})? serverInfo,
  }) = _InitializeResult;

  factory InitializeResult.fromJson(Map<String, dynamic> json) =>
      _$InitializeResultFromJson(json);
}

/// The data type of the ResponseError if the initialize request fails.
@freezed
abstract class InitializeError with _$InitializeError {
  const factory InitializeError({
    /// Indicates whether the client execute the following retry logic: (1) show the
    /// message provided by the ResponseError to the user (2) user selects retry or
    /// cancel (3) if user selected retry the initialize method is sent again.
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
  const factory DidChangeConfigurationRegistrationOptions({Object? section}) =
      _DidChangeConfigurationRegistrationOptions;

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationRegistrationOptionsFromJson(json);
}

/// The parameters of a notification message.
@freezed
abstract class ShowMessageParams with _$ShowMessageParams {
  const factory ShowMessageParams({
    /// The message type. See [MessageType]
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
    /// The message type. See [MessageType]
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
    /// The message type. See [MessageType]
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
    /// The document that did change. The version number points to the version after
    /// all provided content changes have been applied.
    required VersionedTextDocumentIdentifier textDocument,

    /// The actual content changes. The content changes describe single state
    /// changes to the document. So if there are two content changes c1 (at array
    /// index 0) and c2 (at array index 1) for a document in state S then c1 moves
    /// the document from S to S' and c2 from S' to S''. So c1 is computed on the
    /// state S and c2 is computed on the state S'.
    ///
    /// To mirror the content of a document using change events use the following
    /// approach: - start with the same initial content - apply the
    /// 'textDocument/didChange' notifications in the order you receive them. -
    /// apply the `TextDocumentContentChangeEvent`s in a single notification in the
    /// order you receive them.
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
  const factory TextDocumentChangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

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

    /// Optional the content when saved. Depends on the includeText value when the
    /// save notification was requested.
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
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

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

/// Describe options to be used when registered for text document change events.
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

    /// Optional the version number of the document the diagnostics are published
    /// for.
    ///
    /// @since 3.15.0
    int? version,

    /// An array of diagnostic information items.
    required List<Diagnostic> diagnostics,
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

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The completion context. This is only available if the client specifies to
    /// send this using the client capability
    /// `textDocument.completion.contextSupport === true`
    CompletionContext? context,
  }) = _CompletionParams;

  factory CompletionParams.fromJson(Map<String, dynamic> json) =>
      _$CompletionParamsFromJson(json);
}

/// A completion item represents a text snippet that is proposed to complete
/// text that is being typed.
@freezed
abstract class CompletionItem with _$CompletionItem {
  const factory CompletionItem({
    /// The label of this completion item.
    ///
    /// The label property is also by default the text that is inserted when
    /// selecting this completion.
    ///
    /// If label details are provided the label itself should be an unqualified name
    /// of the completion item.
    required String label,

    /// Additional details for the label
    ///
    /// @since 3.17.0
    CompletionItemLabelDetails? labelDetails,

    /// The kind of this completion item. Based of the kind an icon is chosen by the
    /// editor.
    CompletionItemKind? kind,

    /// Tags for this completion item.
    ///
    /// @since 3.15.0
    List<CompletionItemTag>? tags,

    /// A human-readable string with additional information about this item, like
    /// type or symbol information.
    String? detail,

    /// A human-readable string that represents a doc-comment.
    Object? documentation,

    /// Indicates if this item is deprecated. @deprecated Use `tags` instead.
    bool? deprecated,

    /// Select this item when showing.
    ///
    /// *Note* that only one completion item can be selected and that the tool /
    /// client decides which item that is. The rule is that the *first* item of
    /// those that match best is selected.
    bool? preselect,

    /// A string that should be used when comparing this item with other items. When
    /// `falsy` the [label] is used.
    String? sortText,

    /// A string that should be used when filtering a set of completion items. When
    /// `falsy` the [label] is used.
    String? filterText,

    /// A string that should be inserted into a document when selecting this
    /// completion. When `falsy` the [label] is used.
    ///
    /// The `insertText` is subject to interpretation by the client side. Some tools
    /// might not take the string literally. For example VS Code when code complete
    /// is requested in this example `con<cursor position>` and a completion item
    /// with an `insertText` of `console` is provided it will only insert `sole`.
    /// Therefore it is recommended to use `textEdit` instead since it avoids
    /// additional client side interpretation.
    String? insertText,

    /// The format of the insert text. The format applies to both the `insertText`
    /// property and the `newText` property of a provided `textEdit`. If omitted
    /// defaults to `InsertTextFormat.PlainText`.
    ///
    /// Please note that the insertTextFormat doesn't apply to
    /// `additionalTextEdits`.
    InsertTextFormat? insertTextFormat,

    /// How whitespace and indentation is handled during completion item insertion.
    /// If not provided the clients default value depends on the
    /// `textDocument.completion.insertTextMode` client capability.
    ///
    /// @since 3.16.0
    InsertTextMode? insertTextMode,

    /// An [edit] which is applied to a document when selecting this completion.
    /// When an edit is provided the value of [insertText] is ignored.
    ///
    /// Most editors support two different operations when accepting a completion
    /// item. One is to insert a completion text and the other is to replace an
    /// existing text with a completion text. Since this can usually not be
    /// predetermined by a server it can report both ranges. Clients need to signal
    /// support for `InsertReplaceEdits` via the
    /// `textDocument.completion.insertReplaceSupport` client capability property.
    ///
    /// *Note 1:* The text edit's range as well as both ranges from an insert
    /// replace edit must be a [single line] and they must contain the position at
    /// which completion has been requested. *Note 2:* If an `InsertReplaceEdit` is
    /// returned the edit's insert range must be a prefix of the edit's replace
    /// range, that means it must be contained and starting at the same position.
    ///
    /// @since 3.16.0 additional type `InsertReplaceEdit`
    Object? textEdit,

    /// The edit text used if the completion item is part of a CompletionList and
    /// CompletionList defines an item default for the text edit range.
    ///
    /// Clients will only honor this property if they opt into completion list item
    /// defaults using the capability `completionList.itemDefaults`.
    ///
    /// If not provided and a list's default range is provided the label property is
    /// used as a text.
    ///
    /// @since 3.17.0
    String? textEditText,

    /// An optional array of additional [TextEdit] that are applied when selecting
    /// this completion. Edits must not overlap (including the same insert position)
    /// with the main [edit] nor with themselves.
    ///
    /// Additional text edits should be used to change text unrelated to the current
    /// cursor position (for example adding an import statement at the top of the
    /// file if the completion item will insert an unqualified type).
    List<TextEdit>? additionalTextEdits,

    /// An optional set of characters that when pressed while this completion is
    /// active will accept it first and then type that character. *Note* that all
    /// commit characters should have `length=1` and that superfluous characters
    /// will be ignored.
    List<String>? commitCharacters,

    /// An optional [command] that is executed *after* inserting this completion.
    /// *Note* that additional modifications to the current document should be
    /// described with the [additionalTextEdits]-property.
    Command? command,

    /// A data entry field that is preserved on a completion item between a
    /// [CompletionRequest] and a [CompletionResolveRequest].
    LSPAny? data,
  }) = _CompletionItem;

  factory CompletionItem.fromJson(Map<String, dynamic> json) =>
      _$CompletionItemFromJson(json);
}

/// Represents a collection of [CompletionItem] to be presented in the editor.
@freezed
abstract class CompletionList with _$CompletionList {
  const factory CompletionList({
    /// This list it not complete. Further typing results in recomputing this list.
    ///
    /// Recomputed lists have all their items replaced (not appended) in the
    /// incomplete completion sessions.
    required bool isIncomplete,

    /// In many cases the items of an actual completion result share the same value
    /// for properties like `commitCharacters` or the range of a text edit. A
    /// completion list can therefore define item defaults which will be used if a
    /// completion item itself doesn't specify the value.
    ///
    /// If a completion list specifies a default value and a completion item also
    /// specifies a corresponding value the one from the item is used.
    ///
    /// Servers are only allowed to return default values if the client signals
    /// support for this via the `completionList.itemDefaults` capability.
    ///
    /// @since 3.17.0
    ({
      List<String>? commitCharacters,
      Object? editRange,
      InsertTextFormat? insertTextFormat,
      InsertTextMode? insertTextMode,
      LSPAny? data,
    })?
    itemDefaults,

    /// The completion items.
    required List<CompletionItem> items,
  }) = _CompletionList;

  factory CompletionList.fromJson(Map<String, dynamic> json) =>
      _$CompletionListFromJson(json);
}

/// Registration options for a [CompletionRequest].
@freezed
abstract class CompletionRegistrationOptions
    with _$CompletionRegistrationOptions {
  const factory CompletionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// Most tools trigger completion request automatically without explicitly
    /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do
    /// so when the user starts to type an identifier. For example if the user types
    /// `c` in a JavaScript file code complete will automatically pop up present
    /// `console` besides others as a completion item. Characters that make up
    /// identifiers don't need to be listed here.
    ///
    /// If code complete should automatically be trigger on characters not being
    /// valid inside an identifier (for example `.` in JavaScript) list them in
    /// `triggerCharacters`.
    List<String>? triggerCharacters,

    /// The list of all possible characters that commit a completion. This field can
    /// be used if clients don't support individual commit characters per completion
    /// item. See
    /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    ///
    /// If a server provides both `allCommitCharacters` and commit characters on an
    /// individual completion item the ones on the completion item win.
    ///
    /// @since 3.2.0
    List<String>? allCommitCharacters,

    /// The server provides support to resolve additional information for a
    /// completion item.
    bool? resolveProvider,

    /// The server supports the following `CompletionItem` specific capabilities.
    ///
    /// @since 3.17.0
    ({bool? labelDetailsSupport})? completionItem,
  }) = _CompletionRegistrationOptions;

  factory CompletionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CompletionRegistrationOptionsFromJson(json);
}

/// Parameters for a [HoverRequest].
@freezed
abstract class HoverParams with _$HoverParams {
  const factory HoverParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _HoverParams;

  factory HoverParams.fromJson(Map<String, dynamic> json) =>
      _$HoverParamsFromJson(json);
}

/// The result of a hover request.
@freezed
abstract class Hover with _$Hover {
  const factory Hover({
    /// The hover's content
    required Object contents,

    /// An optional range inside the text document that is used to visualize the
    /// hover, e.g. by changing the background color.
    Range? range,
  }) = _Hover;

  factory Hover.fromJson(Map<String, dynamic> json) => _$HoverFromJson(json);
}

/// Registration options for a [HoverRequest].
@freezed
abstract class HoverRegistrationOptions with _$HoverRegistrationOptions {
  const factory HoverRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _HoverRegistrationOptions;

  factory HoverRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$HoverRegistrationOptionsFromJson(json);
}

/// Parameters for a [SignatureHelpRequest].
@freezed
abstract class SignatureHelpParams with _$SignatureHelpParams {
  const factory SignatureHelpParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The signature help context. This is only available if the client specifies
    /// to send this using the client capability
    /// `textDocument.signatureHelp.contextSupport === true`
    ///
    /// @since 3.15.0
    SignatureHelpContext? context,
  }) = _SignatureHelpParams;

  factory SignatureHelpParams.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpParamsFromJson(json);
}

/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
@freezed
abstract class SignatureHelp with _$SignatureHelp {
  const factory SignatureHelp({
    /// One or more signatures.
    required List<SignatureInformation> signatures,

    /// The active signature. If omitted or the value lies outside the range of
    /// `signatures` the value defaults to zero or is ignored if the `SignatureHelp`
    /// has no signatures.
    ///
    /// Whenever possible implementors should make an active decision about the
    /// active signature and shouldn't rely on a default value.
    ///
    /// In future version of the protocol this property might become mandatory to
    /// better express this.
    int? activeSignature,

    /// The active parameter of the active signature. If omitted or the value lies
    /// outside the range of `signatures[activeSignature].parameters` defaults to 0
    /// if the active signature has parameters. If the active signature has no
    /// parameters it is ignored. In future version of the protocol this property
    /// might become mandatory to better express the active parameter if the active
    /// signature does have any.
    int? activeParameter,
  }) = _SignatureHelp;

  factory SignatureHelp.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpFromJson(json);
}

/// Registration options for a [SignatureHelpRequest].
@freezed
abstract class SignatureHelpRegistrationOptions
    with _$SignatureHelpRegistrationOptions {
  const factory SignatureHelpRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// List of characters that trigger signature help automatically.
    List<String>? triggerCharacters,

    /// List of characters that re-trigger signature help.
    ///
    /// These trigger characters are only active when signature help is already
    /// showing. All trigger characters are also counted as re-trigger characters.
    ///
    /// @since 3.15.0
    List<String>? retriggerCharacters,
  }) = _SignatureHelpRegistrationOptions;

  factory SignatureHelpRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$SignatureHelpRegistrationOptionsFromJson(json);
}

/// Parameters for a [DefinitionRequest].
@freezed
abstract class DefinitionParams with _$DefinitionParams {
  const factory DefinitionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _DefinitionParams;

  factory DefinitionParams.fromJson(Map<String, dynamic> json) =>
      _$DefinitionParamsFromJson(json);
}

/// Registration options for a [DefinitionRequest].
@freezed
abstract class DefinitionRegistrationOptions
    with _$DefinitionRegistrationOptions {
  const factory DefinitionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _DefinitionRegistrationOptions;

  factory DefinitionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionRegistrationOptionsFromJson(json);
}

/// Parameters for a [ReferencesRequest].
@freezed
abstract class ReferenceParams with _$ReferenceParams {
  const factory ReferenceParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
    required ReferenceContext context,
  }) = _ReferenceParams;

  factory ReferenceParams.fromJson(Map<String, dynamic> json) =>
      _$ReferenceParamsFromJson(json);
}

/// Registration options for a [ReferencesRequest].
@freezed
abstract class ReferenceRegistrationOptions
    with _$ReferenceRegistrationOptions {
  const factory ReferenceRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _ReferenceRegistrationOptions;

  factory ReferenceRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$ReferenceRegistrationOptionsFromJson(json);
}

/// Parameters for a [DocumentHighlightRequest].
@freezed
abstract class DocumentHighlightParams with _$DocumentHighlightParams {
  const factory DocumentHighlightParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
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
  const factory DocumentHighlight({
    /// The range this highlight applies to.
    required Range range,

    /// The highlight kind, default is [text].
    DocumentHighlightKind? kind,
  }) = _DocumentHighlight;

  factory DocumentHighlight.fromJson(Map<String, dynamic> json) =>
      _$DocumentHighlightFromJson(json);
}

/// Registration options for a [DocumentHighlightRequest].
@freezed
abstract class DocumentHighlightRegistrationOptions
    with _$DocumentHighlightRegistrationOptions {
  const factory DocumentHighlightRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _DocumentHighlightRegistrationOptions;

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightRegistrationOptionsFromJson(json);
}

/// Parameters for a [DocumentSymbolRequest].
@freezed
abstract class DocumentSymbolParams with _$DocumentSymbolParams {
  const factory DocumentSymbolParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The text document.
    required TextDocumentIdentifier textDocument,
  }) = _DocumentSymbolParams;

  factory DocumentSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolParamsFromJson(json);
}

/// Represents information about programming constructs like variables, classes,
/// interfaces etc.
@freezed
abstract class SymbolInformation with _$SymbolInformation {
  const factory SymbolInformation({
    /// The name of this symbol.
    required String name,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// Tags for this symbol.
    ///
    /// @since 3.16.0
    List<SymbolTag>? tags,

    /// The name of the symbol containing this symbol. This information is for user
    /// interface purposes (e.g. to render a qualifier in the user interface if
    /// necessary). It can't be used to re-infer a hierarchy for the document
    /// symbols.
    String? containerName,

    /// Indicates if this symbol is deprecated.
    ///
    /// @deprecated Use tags instead
    bool? deprecated,

    /// The location of this symbol. The location's range is used by a tool to
    /// reveal the location in the editor. If the symbol is selected in the tool the
    /// range's start information is used to position the cursor. So the range
    /// usually spans more than the actual symbol's name and does normally include
    /// things like visibility modifiers.
    ///
    /// The range doesn't have to denote a node range in the sense of an abstract
    /// syntax tree. It can therefore not be used to re-construct a hierarchy of the
    /// symbols.
    required Location location,
  }) = _SymbolInformation;

  factory SymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$SymbolInformationFromJson(json);
}

/// Represents programming constructs like variables, classes, interfaces etc.
/// that appear in a document. Document symbols can be hierarchical and they
/// have two ranges: one that encloses its definition and one that points to its
/// most interesting range, e.g. the range of an identifier.
@freezed
abstract class DocumentSymbol with _$DocumentSymbol {
  const factory DocumentSymbol({
    /// The name of this symbol. Will be displayed in the user interface and
    /// therefore must not be an empty string or a string only consisting of white
    /// spaces.
    required String name,

    /// More detail for this symbol, e.g the signature of a function.
    String? detail,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// Tags for this document symbol.
    ///
    /// @since 3.16.0
    List<SymbolTag>? tags,

    /// Indicates if this symbol is deprecated.
    ///
    /// @deprecated Use tags instead
    bool? deprecated,

    /// The range enclosing this symbol not including leading/trailing whitespace
    /// but everything else like comments. This information is typically used to
    /// determine if the clients cursor is inside the symbol to reveal in the symbol
    /// in the UI.
    required Range range,

    /// The range that should be selected and revealed when this symbol is being
    /// picked, e.g the name of a function. Must be contained by the `range`.
    required Range selectionRange,

    /// Children of this symbol, e.g. properties of a class.
    List<DocumentSymbol>? children,
  }) = _DocumentSymbol;

  factory DocumentSymbol.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolFromJson(json);
}

/// Registration options for a [DocumentSymbolRequest].
@freezed
abstract class DocumentSymbolRegistrationOptions
    with _$DocumentSymbolRegistrationOptions {
  const factory DocumentSymbolRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// A human-readable string that is shown when multiple outlines trees are shown
    /// for the same document.
    ///
    /// @since 3.16.0
    String? label,
  }) = _DocumentSymbolRegistrationOptions;

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolRegistrationOptionsFromJson(json);
}

/// The parameters of a [CodeActionRequest].
@freezed
abstract class CodeActionParams with _$CodeActionParams {
  const factory CodeActionParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The document in which the command was invoked.
    required TextDocumentIdentifier textDocument,

    /// The range for which the command was invoked.
    required Range range,

    /// Context carrying additional information.
    required CodeActionContext context,
  }) = _CodeActionParams;

  factory CodeActionParams.fromJson(Map<String, dynamic> json) =>
      _$CodeActionParamsFromJson(json);
}

/// Represents a reference to a command. Provides a title which will be used to
/// represent a command in the UI and, optionally, an array of arguments which
/// will be passed to the command handler function when invoked.
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

/// A code action represents a change that can be performed in code, e.g. to fix
/// a problem or to refactor code.
///
/// A CodeAction must set either `edit` and/or a `command`. If both are
/// supplied, the `edit` is applied first, then the `command` is executed.
@freezed
abstract class CodeAction with _$CodeAction {
  const CodeAction._();

  const factory CodeAction({
    /// A short, human-readable, title for this code action.
    required String title,

    /// The kind of the code action.
    ///
    /// Used to filter code actions.
    String? kind,

    /// The diagnostics that this code action resolves.
    List<Diagnostic>? diagnostics,

    /// Marks this as a preferred action. Preferred actions are used by the `auto
    /// fix` command and can be targeted by keybindings.
    ///
    /// A quick fix should be marked preferred if it properly addresses the
    /// underlying error. A refactoring should be marked preferred if it is the most
    /// reasonable choice of actions to take.
    ///
    /// @since 3.15.0
    bool? isPreferred,

    /// Marks that the code action cannot currently be applied.
    ///
    /// Clients should follow the following guidelines regarding disabled code
    /// actions:
    ///
    /// - Disabled code actions are not shown in automatic
    /// [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
    /// code action menus.
    ///
    /// - Disabled actions are shown as faded out in the code action menu when the
    /// user requests a more specific type of code action, such as refactorings.
    ///
    /// - If the user has a
    /// [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
    /// that auto applies a code action and only disabled code actions are returned,
    /// the client should show the user an error message with `reason` in the
    /// editor.
    ///
    /// @since 3.16.0
    ({String reason})? disabled,

    /// The workspace edit this code action performs.
    WorkspaceEdit? edit,

    /// A command this code action executes. If a code action provides an edit and a
    /// command, first the edit is executed and then the command.
    Command? command,

    /// A data entry field that is preserved on a code action between a
    /// `textDocument/codeAction` and a `codeAction/resolve` request.
    ///
    /// @since 3.16.0
    LSPAny? data,
  }) = _CodeAction;

  factory CodeAction.fromJson(Map<String, dynamic> json) =>
      _$CodeActionFromJson(json);

  CodeActionKind? get kindEnum =>
      kind != null ? CodeActionKind.decode(kind!) : null;
}

/// Registration options for a [CodeActionRequest].
@freezed
abstract class CodeActionRegistrationOptions
    with _$CodeActionRegistrationOptions {
  const factory CodeActionRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// CodeActionKinds that this server may return.
    ///
    /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the
    /// server may list out every specific kind they provide.
    List<CodeActionKind>? codeActionKinds,

    /// The server provides support to resolve additional information for a code
    /// action.
    ///
    /// @since 3.16.0
    bool? resolveProvider,
  }) = _CodeActionRegistrationOptions;

  factory CodeActionRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionRegistrationOptionsFromJson(json);
}

/// The parameters of a [WorkspaceSymbolRequest].
@freezed
abstract class WorkspaceSymbolParams with _$WorkspaceSymbolParams {
  const factory WorkspaceSymbolParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// A query string to filter symbols by. Clients may send an empty string here
    /// to request all symbols.
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
  const factory WorkspaceSymbol({
    /// The name of this symbol.
    required String name,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// Tags for this symbol.
    ///
    /// @since 3.16.0
    List<SymbolTag>? tags,

    /// The name of the symbol containing this symbol. This information is for user
    /// interface purposes (e.g. to render a qualifier in the user interface if
    /// necessary). It can't be used to re-infer a hierarchy for the document
    /// symbols.
    String? containerName,

    /// The location of the symbol. Whether a server is allowed to return a location
    /// without a range depends on the client capability
    /// `workspace.symbol.resolveSupport`.
    ///
    /// See SymbolInformation#location for more details.
    required Object location,

    /// A data entry field that is preserved on a workspace symbol between a
    /// workspace symbol request and a workspace symbol resolve request.
    LSPAny? data,
  }) = _WorkspaceSymbol;

  factory WorkspaceSymbol.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolFromJson(json);
}

/// Registration options for a [WorkspaceSymbolRequest].
@freezed
abstract class WorkspaceSymbolRegistrationOptions
    with _$WorkspaceSymbolRegistrationOptions {
  const factory WorkspaceSymbolRegistrationOptions({
    bool? workDoneProgress,

    /// The server provides support to resolve additional information for a
    /// workspace symbol.
    ///
    /// @since 3.17.0
    bool? resolveProvider,
  }) = _WorkspaceSymbolRegistrationOptions;

  factory WorkspaceSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolRegistrationOptionsFromJson(json);
}

/// The parameters of a [CodeLensRequest].
@freezed
abstract class CodeLensParams with _$CodeLensParams {
  const factory CodeLensParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The document to request code lens for.
    required TextDocumentIdentifier textDocument,
  }) = _CodeLensParams;

  factory CodeLensParams.fromJson(Map<String, dynamic> json) =>
      _$CodeLensParamsFromJson(json);
}

/// A code lens represents a [command] that should be shown along with source
/// text, like the number of references, a way to run tests, etc.
///
/// A code lens is _unresolved_ when no command is associated to it. For
/// performance reasons the creation of a code lens and resolving should be done
/// in two stages.
@freezed
abstract class CodeLens with _$CodeLens {
  const factory CodeLens({
    /// The range in which this code lens is valid. Should only span a single line.
    required Range range,

    /// The command this code lens represents.
    Command? command,

    /// A data entry field that is preserved on a code lens item between a
    /// [CodeLensRequest] and a [CodeLensResolveRequest]
    LSPAny? data,
  }) = _CodeLens;

  factory CodeLens.fromJson(Map<String, dynamic> json) =>
      _$CodeLensFromJson(json);
}

/// Registration options for a [CodeLensRequest].
@freezed
abstract class CodeLensRegistrationOptions with _$CodeLensRegistrationOptions {
  const factory CodeLensRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// Code lens has a resolve provider as well.
    bool? resolveProvider,
  }) = _CodeLensRegistrationOptions;

  factory CodeLensRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensRegistrationOptionsFromJson(json);
}

/// The parameters of a [DocumentLinkRequest].
@freezed
abstract class DocumentLinkParams with _$DocumentLinkParams {
  const factory DocumentLinkParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,

    /// The document to provide document links for.
    required TextDocumentIdentifier textDocument,
  }) = _DocumentLinkParams;

  factory DocumentLinkParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkParamsFromJson(json);
}

/// A document link is a range in a text document that links to an internal or
/// external resource, like another text document or a web site.
@freezed
abstract class DocumentLink with _$DocumentLink {
  const factory DocumentLink({
    /// The range this link applies to.
    required Range range,

    /// The uri this link points to. If missing a resolve request is sent later.
    String? target,

    /// The tooltip text when you hover over this link.
    ///
    /// If a tooltip is provided, is will be displayed in a string that includes
    /// instructions on how to trigger the link, such as `{0} (ctrl + click)`. The
    /// specific instructions vary depending on OS, user settings, and localization.
    ///
    /// @since 3.15.0
    String? tooltip,

    /// A data entry field that is preserved on a document link between a
    /// DocumentLinkRequest and a DocumentLinkResolveRequest.
    LSPAny? data,
  }) = _DocumentLink;

  factory DocumentLink.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkFromJson(json);
}

/// Registration options for a [DocumentLinkRequest].
@freezed
abstract class DocumentLinkRegistrationOptions
    with _$DocumentLinkRegistrationOptions {
  const factory DocumentLinkRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// Document links have a resolve provider as well.
    bool? resolveProvider,
  }) = _DocumentLinkRegistrationOptions;

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkRegistrationOptionsFromJson(json);
}

/// The parameters of a [DocumentFormattingRequest].
@freezed
abstract class DocumentFormattingParams with _$DocumentFormattingParams {
  const factory DocumentFormattingParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The format options.
    required FormattingOptions options,
  }) = _DocumentFormattingParams;

  factory DocumentFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingParamsFromJson(json);
}

/// Registration options for a [DocumentFormattingRequest].
@freezed
abstract class DocumentFormattingRegistrationOptions
    with _$DocumentFormattingRegistrationOptions {
  const factory DocumentFormattingRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,
  }) = _DocumentFormattingRegistrationOptions;

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a [DocumentRangeFormattingRequest].
@freezed
abstract class DocumentRangeFormattingParams
    with _$DocumentRangeFormattingParams {
  const factory DocumentRangeFormattingParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The range to format
    required Range range,

    /// The format options
    required FormattingOptions options,
  }) = _DocumentRangeFormattingParams;

  factory DocumentRangeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingParamsFromJson(json);
}

/// Registration options for a [DocumentRangeFormattingRequest].
@freezed
abstract class DocumentRangeFormattingRegistrationOptions
    with _$DocumentRangeFormattingRegistrationOptions {
  const factory DocumentRangeFormattingRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// Whether the server supports formatting multiple ranges at once.
    ///
    /// @since 3.18.0 @proposed
    bool? rangesSupport,
  }) = _DocumentRangeFormattingRegistrationOptions;

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a [DocumentRangesFormattingRequest].
///
/// @since 3.18.0 @proposed
@freezed
abstract class DocumentRangesFormattingParams
    with _$DocumentRangesFormattingParams {
  const factory DocumentRangesFormattingParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The ranges to format
    required List<Range> ranges,

    /// The format options
    required FormattingOptions options,
  }) = _DocumentRangesFormattingParams;

  factory DocumentRangesFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangesFormattingParamsFromJson(json);
}

/// The parameters of a [DocumentOnTypeFormattingRequest].
@freezed
abstract class DocumentOnTypeFormattingParams
    with _$DocumentOnTypeFormattingParams {
  const factory DocumentOnTypeFormattingParams({
    /// The document to format.
    required TextDocumentIdentifier textDocument,

    /// The position around which the on type formatting should happen. This is not
    /// necessarily the exact position where the character denoted by the property
    /// `ch` got typed.
    required Position position,

    /// The character that has been typed that triggered the formatting on type
    /// request. That is not necessarily the last character that got inserted into
    /// the document since the client could auto insert characters as well (e.g.
    /// like automatic brace completion).
    required String ch,

    /// The formatting options.
    required FormattingOptions options,
  }) = _DocumentOnTypeFormattingParams;

  factory DocumentOnTypeFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentOnTypeFormattingParamsFromJson(json);
}

/// Registration options for a [DocumentOnTypeFormattingRequest].
@freezed
abstract class DocumentOnTypeFormattingRegistrationOptions
    with _$DocumentOnTypeFormattingRegistrationOptions {
  const factory DocumentOnTypeFormattingRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// A character on which formatting should be triggered, like `{`.
    required String firstTriggerCharacter,

    /// More trigger characters.
    List<String>? moreTriggerCharacter,
  }) = _DocumentOnTypeFormattingRegistrationOptions;

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a [RenameRequest].
@freezed
abstract class RenameParams with _$RenameParams {
  const factory RenameParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The document to rename.
    required TextDocumentIdentifier textDocument,

    /// The position at which this request was sent.
    required Position position,

    /// The new name of the symbol. If the given name is not valid the request must
    /// return a [ResponseError] with an appropriate message set.
    required String newName,
  }) = _RenameParams;

  factory RenameParams.fromJson(Map<String, dynamic> json) =>
      _$RenameParamsFromJson(json);
}

/// Registration options for a [RenameRequest].
@freezed
abstract class RenameRegistrationOptions with _$RenameRegistrationOptions {
  const factory RenameRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// Renames should be checked and tested before being executed.
    ///
    /// @since version 3.12.0
    bool? prepareProvider,
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
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _PrepareRenameParams;

  factory PrepareRenameParams.fromJson(Map<String, dynamic> json) =>
      _$PrepareRenameParamsFromJson(json);
}

/// The parameters of a [ExecuteCommandRequest].
@freezed
abstract class ExecuteCommandParams with _$ExecuteCommandParams {
  const factory ExecuteCommandParams({
    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// The identifier of the actual command handler.
    required String command,

    /// Arguments that the command should be invoked with.
    List<LSPAny>? arguments,
  }) = _ExecuteCommandParams;

  factory ExecuteCommandParams.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandParamsFromJson(json);
}

/// Registration options for a [ExecuteCommandRequest].
@freezed
abstract class ExecuteCommandRegistrationOptions
    with _$ExecuteCommandRegistrationOptions {
  const factory ExecuteCommandRegistrationOptions({
    bool? workDoneProgress,

    /// The commands to be executed on the server
    required List<String> commands,
  }) = _ExecuteCommandRegistrationOptions;

  factory ExecuteCommandRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandRegistrationOptionsFromJson(json);
}

/// The parameters passed via an apply workspace edit request.
@freezed
abstract class ApplyWorkspaceEditParams with _$ApplyWorkspaceEditParams {
  const factory ApplyWorkspaceEditParams({
    /// An optional label of the workspace edit. This label is presented in the user
    /// interface for example on an undo stack to undo the workspace edit.
    String? label,

    /// The edits to apply.
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
  const factory ApplyWorkspaceEditResult({
    /// Indicates whether the edit was applied or not.
    required bool applied,

    /// An optional textual description for why the edit was not applied. This may
    /// be used by the server for diagnostic logging or to provide a suitable error
    /// for a request that triggered the edit.
    String? failureReason,

    /// Depending on the client's failure handling strategy `failedChange` might
    /// contain the index of the change that failed. This property is only available
    /// if the client signals a `failureHandlingStrategy` in its client
    /// capabilities.
    int? failedChange,
  }) = _ApplyWorkspaceEditResult;

  factory ApplyWorkspaceEditResult.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditResultFromJson(json);
}

@freezed
abstract class WorkDoneProgressBegin with _$WorkDoneProgressBegin {
  const factory WorkDoneProgressBegin({
    required String kind,

    /// Mandatory title of the progress operation. Used to briefly inform about the
    /// kind of operation being performed.
    ///
    /// Examples: "Indexing" or "Linking dependencies".
    required String title,

    /// Controls if a cancel button should show to allow the user to cancel the long
    /// running operation. Clients that don't support cancellation are allowed to
    /// ignore the setting.
    bool? cancellable,

    /// Optional, more detailed associated progress message. Contains complementary
    /// information to the `title`.
    ///
    /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep". If
    /// unset, the previous progress message (if any) is still valid.
    String? message,

    /// Optional progress percentage to display (value 100 is considered 100%). If
    /// not provided infinite progress is assumed and clients are allowed to ignore
    /// the `percentage` value in subsequent report notifications.
    ///
    /// The value should be steadily rising. Clients are free to ignore values that
    /// are not following this rule. The value range is [0, 100].
    int? percentage,
  }) = _WorkDoneProgressBegin;

  factory WorkDoneProgressBegin.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressBeginFromJson(json);
}

@freezed
abstract class WorkDoneProgressReport with _$WorkDoneProgressReport {
  const factory WorkDoneProgressReport({
    required String kind,

    /// Controls enablement state of a cancel button.
    ///
    /// Clients that don't support cancellation or don't support controlling the
    /// button's enablement state are allowed to ignore the property.
    bool? cancellable,

    /// Optional, more detailed associated progress message. Contains complementary
    /// information to the `title`.
    ///
    /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep". If
    /// unset, the previous progress message (if any) is still valid.
    String? message,

    /// Optional progress percentage to display (value 100 is considered 100%). If
    /// not provided infinite progress is assumed and clients are allowed to ignore
    /// the `percentage` value in subsequent report notifications.
    ///
    /// The value should be steadily rising. Clients are free to ignore values that
    /// are not following this rule. The value range is [0, 100].
    int? percentage,
  }) = _WorkDoneProgressReport;

  factory WorkDoneProgressReport.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressReportFromJson(json);
}

@freezed
abstract class WorkDoneProgressEnd with _$WorkDoneProgressEnd {
  const factory WorkDoneProgressEnd({
    required String kind,

    /// Optional, a final message indicating to for example indicate the outcome of
    /// the operation.
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
    required Object id,
  }) = _CancelParams;

  factory CancelParams.fromJson(Map<String, dynamic> json) =>
      _$CancelParamsFromJson(json);
}

@freezed
abstract class ProgressParams with _$ProgressParams {
  const factory ProgressParams({
    /// The progress token provided by the client or server.
    @_ProgressTokenConverter() required ProgressToken token,

    /// The progress data.
    required LSPAny value,
  }) = _ProgressParams;

  factory ProgressParams.fromJson(Map<String, dynamic> json) =>
      _$ProgressParamsFromJson(json);
}

/// A parameter literal used in requests to pass a text document and a position
/// inside that document.
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
    @_ProgressTokenConverter() ProgressToken? workDoneToken,
  }) = _WorkDoneProgressParams;

  factory WorkDoneProgressParams.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressParamsFromJson(json);
}

@freezed
abstract class PartialResultParams with _$PartialResultParams {
  const factory PartialResultParams({
    /// An optional token that a server can use to report partial results (e.g.
    /// streaming) to the client.
    @_ProgressTokenConverter() ProgressToken? partialResultToken,
  }) = _PartialResultParams;

  factory PartialResultParams.fromJson(Map<String, dynamic> json) =>
      _$PartialResultParamsFromJson(json);
}

/// Represents the connection of two locations. Provides additional metadata
/// over normal [locations], including an origin range.
@freezed
abstract class LocationLink with _$LocationLink {
  const factory LocationLink({
    /// Span of the origin of this link.
    ///
    /// Used as the underlined span for mouse interaction. Defaults to the word
    /// range at the definition position.
    Range? originSelectionRange,

    /// The target resource identifier of this link.
    required String targetUri,

    /// The full target range of this link. If the target for example is a symbol
    /// then target range is the range enclosing this symbol not including
    /// leading/trailing whitespace but everything else like comments. This
    /// information is typically used to highlight the range in the editor.
    required Range targetRange,

    /// The range that should be selected and revealed when this link is being
    /// followed, e.g the name of a function. Must be contained by the
    /// `targetRange`. See also `DocumentSymbol#range`
    required Range targetSelectionRange,
  }) = _LocationLink;

  factory LocationLink.fromJson(Map<String, dynamic> json) =>
      _$LocationLinkFromJson(json);
}

/// A range in a text document expressed as (zero-based) start and end
/// positions.
///
/// If you want to specify a range that contains a line including the line
/// ending character(s) then use an end position denoting the start of the next
/// line. For example: ```ts { start: { line: 5, character: 23 } end : { line 6,
/// character : 0 } } ```
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

/// Static registration options to be returned in the initialize request.
@freezed
abstract class StaticRegistrationOptions with _$StaticRegistrationOptions {
  const factory StaticRegistrationOptions({
    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
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
    /// The scope to get the configuration section for.
    String? scopeUri,

    /// The configuration section asked for.
    String? section,
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

/// Position in a text document expressed as zero-based line and character
/// offset. Prior to 3.17 the offsets were always based on a UTF-16 string
/// representation. So a string of the form `a𐐀b` the character offset of the
/// character `a` is 0, the character offset of `𐐀` is 1 and the character
/// offset of b is 3 since `𐐀` is represented using two code units in UTF-16.
/// Since 3.17 clients and servers can agree on a different string encoding
/// representation (e.g. UTF-8). The client announces it's supported encoding
/// via the client capability
/// [`general.positionEncodings`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#clientCapabilities).
/// The value is an array of position encodings the client supports, with
/// decreasing preference (e.g. the encoding at index `0` is the most preferred
/// one). To stay backwards compatible the only mandatory encoding is UTF-16
/// represented via the string `utf-16`. The server can pick one of the
/// encodings offered by the client and signals that encoding back to the client
/// via the initialize result's property
/// [`capabilities.positionEncoding`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#serverCapabilities).
/// If the string value `utf-16` is missing from the client's capability
/// `general.positionEncodings` servers can safely assume that the client
/// supports UTF-16. If the server omits the position encoding in its initialize
/// result the encoding defaults to the string value `utf-16`. Implementation
/// considerations: since the conversion from one encoding into another requires
/// the content of the file / line the conversion is best done where the file is
/// read which is usually on the server side.
///
/// Positions are line end character agnostic. So you can not specify a position
/// that denotes `\r|\n` or `\n|` where `|` represents the character offset.
///
/// @since 3.17.0 - support for negotiated position encoding.
@freezed
abstract class Position with _$Position {
  const factory Position({
    /// Line position in a document (zero-based).
    ///
    /// If a line number is greater than the number of lines in a document, it
    /// defaults back to the number of lines in the document. If a line number is
    /// negative, it defaults to 0.
    required int line,

    /// Character offset on a line in a document (zero-based).
    ///
    /// The meaning of this offset is determined by the negotiated
    /// `PositionEncodingKind`.
    ///
    /// If the character value is greater than the line length it defaults back to
    /// the line length.
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
///
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
    bool? workDoneProgress,

    /// The legend used by the server
    required SemanticTokensLegend legend,

    /// Server supports providing semantic tokens for a specific range of a
    /// document.
    Object? range,

    /// Server supports providing semantic tokens for a full document.
    Object? full,
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
///
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

/// Describes textual changes on a text document. A TextDocumentEdit describes
/// all changes on a document version Si and after they are applied move the
/// document to version Si+1. So the creator of a TextDocumentEdit doesn't need
/// to sort the array of edits or do any kind of ordering. However the edits
/// must be non overlapping.
@freezed
abstract class TextDocumentEdit with _$TextDocumentEdit {
  const factory TextDocumentEdit({
    /// The text document to change.
    required OptionalVersionedTextDocumentIdentifier textDocument,

    /// The edits to be applied.
    ///
    /// @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
    /// client capability.
    required List<Object> edits,
  }) = _TextDocumentEdit;

  factory TextDocumentEdit.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentEditFromJson(json);
}

/// Create file operation.
@freezed
abstract class CreateFile with _$CreateFile {
  const factory CreateFile({
    /// An optional annotation identifier describing the operation.
    ///
    /// @since 3.16.0
    ChangeAnnotationIdentifier? annotationId,

    /// A create
    required String kind,

    /// The resource to create.
    required String uri,

    /// Additional options
    CreateFileOptions? options,
  }) = _CreateFile;

  factory CreateFile.fromJson(Map<String, dynamic> json) =>
      _$CreateFileFromJson(json);
}

/// Rename file operation
@freezed
abstract class RenameFile with _$RenameFile {
  const factory RenameFile({
    /// An optional annotation identifier describing the operation.
    ///
    /// @since 3.16.0
    ChangeAnnotationIdentifier? annotationId,

    /// A rename
    required String kind,

    /// The old (existing) location.
    required String oldUri,

    /// The new location.
    required String newUri,

    /// Rename options.
    RenameFileOptions? options,
  }) = _RenameFile;

  factory RenameFile.fromJson(Map<String, dynamic> json) =>
      _$RenameFileFromJson(json);
}

/// Delete file operation
@freezed
abstract class DeleteFile with _$DeleteFile {
  const factory DeleteFile({
    /// An optional annotation identifier describing the operation.
    ///
    /// @since 3.16.0
    ChangeAnnotationIdentifier? annotationId,

    /// A delete
    required String kind,

    /// The file to delete.
    required String uri,

    /// Delete options.
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
  const factory ChangeAnnotation({
    /// A human-readable string describing the actual change. The string is rendered
    /// prominent in the user interface.
    required String label,

    /// A flag which indicates that user confirmation is needed before applying the
    /// change.
    bool? needsConfirmation,

    /// A human-readable string which is rendered less prominent in the user
    /// interface.
    String? description,
  }) = _ChangeAnnotation;

  factory ChangeAnnotation.fromJson(Map<String, dynamic> json) =>
      _$ChangeAnnotationFromJson(json);
}

/// A filter to describe in which file operation requests or notifications the
/// server is interested in receiving.
///
/// @since 3.16.0
@freezed
abstract class FileOperationFilter with _$FileOperationFilter {
  const factory FileOperationFilter({
    /// A Uri scheme like `file` or `untitled`.
    String? scheme,

    /// The actual file operation pattern.
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
  const factory FileRename({
    /// A file:// URI for the original location of the file/folder being renamed.
    required String oldUri,

    /// A file:// URI for the new location of the file/folder being renamed.
    required String newUri,
  }) = _FileRename;

  factory FileRename.fromJson(Map<String, dynamic> json) =>
      _$FileRenameFromJson(json);
}

/// Represents information on a file/folder delete.
///
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
///
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

    /// The document range where execution has stopped. Typically the end position
    /// of the range denotes the line where the inline values are shown.
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
  const factory InlineValueText({
    /// The document range for which the inline value applies.
    required Range range,

    /// The text of the inline value.
    required String text,
  }) = _InlineValueText;

  factory InlineValueText.fromJson(Map<String, dynamic> json) =>
      _$InlineValueTextFromJson(json);
}

/// Provide inline value through a variable lookup. If only a range is
/// specified, the variable name will be extracted from the underlying document.
/// An optional variable name can be used to override the extracted name.
///
/// @since 3.17.0
@freezed
abstract class InlineValueVariableLookup with _$InlineValueVariableLookup {
  const factory InlineValueVariableLookup({
    /// The document range for which the inline value applies. The range is used to
    /// extract the variable name from the underlying document.
    required Range range,

    /// If specified the name of the variable to look up.
    String? variableName,

    /// How to perform the lookup.
    required bool caseSensitiveLookup,
  }) = _InlineValueVariableLookup;

  factory InlineValueVariableLookup.fromJson(Map<String, dynamic> json) =>
      _$InlineValueVariableLookupFromJson(json);
}

/// Provide an inline value through an expression evaluation. If only a range is
/// specified, the expression will be extracted from the underlying document. An
/// optional expression can be used to override the extracted expression.
///
/// @since 3.17.0
@freezed
abstract class InlineValueEvaluatableExpression
    with _$InlineValueEvaluatableExpression {
  const factory InlineValueEvaluatableExpression({
    /// The document range for which the inline value applies. The range is used to
    /// extract the evaluatable expression from the underlying document.
    required Range range,

    /// If specified the expression overrides the extracted expression.
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
  const factory InlineValueOptions({bool? workDoneProgress}) =
      _InlineValueOptions;

  factory InlineValueOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineValueOptionsFromJson(json);
}

/// An inlay hint label part allows for interactive and composite labels of
/// inlay hints.
///
/// @since 3.17.0
@freezed
abstract class InlayHintLabelPart with _$InlayHintLabelPart {
  const factory InlayHintLabelPart({
    /// The value of this label part.
    required String value,

    /// The tooltip text when you hover over this label part. Depending on the
    /// client capability `inlayHint.resolveSupport` clients might resolve this
    /// property late using the resolve request.
    Object? tooltip,

    /// An optional source code location that represents this label part.
    ///
    /// The editor will use this location for the hover and for code navigation
    /// features: This part will become a clickable link that resolves to the
    /// definition of the symbol at the given location (not necessarily the location
    /// itself), it shows the hover that shows at the given location, and it shows a
    /// context menu with further code navigation commands.
    ///
    /// Depending on the client capability `inlayHint.resolveSupport` clients might
    /// resolve this property late using the resolve request.
    Location? location,

    /// An optional command for this label part.
    ///
    /// Depending on the client capability `inlayHint.resolveSupport` clients might
    /// resolve this property late using the resolve request.
    Command? command,
  }) = _InlayHintLabelPart;

  factory InlayHintLabelPart.fromJson(Map<String, dynamic> json) =>
      _$InlayHintLabelPartFromJson(json);
}

/// A `MarkupContent` literal represents a string value which content is
/// interpreted base on its kind flag. Currently the protocol supports
/// `plaintext` and `markdown` as markup kinds.
///
/// If the kind is `markdown` then the value can contain fenced code blocks like
/// in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
///
/// Here is an example how such a string can be constructed using JavaScript /
/// TypeScript: ```ts let markdown: MarkdownContent = { kind:
/// MarkupKind.Markdown, value: [ '# Header', 'Some text', '```typescript',
/// 'someCode();', '```' ].join('\n') }; ```
///
/// *Please Note* that clients might sanitize the return markdown. A client
/// could decide to remove HTML from the markdown to avoid script execution.
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
///
/// @since 3.17.0
@freezed
abstract class InlayHintOptions with _$InlayHintOptions {
  const factory InlayHintOptions({
    bool? workDoneProgress,

    /// The server provides support to resolve additional information for an inlay
    /// hint item.
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
  const factory RelatedFullDocumentDiagnosticReport({
    /// A full document diagnostic report.
    required String kind,

    /// An optional result id. If provided it will be sent on the next diagnostic
    /// request for the same document.
    String? resultId,

    /// The actual items.
    required List<Diagnostic> items,

    /// Diagnostics of related documents. This information is useful in programming
    /// languages where code in a file A can generate diagnostics in a file B which
    /// A depends on. An example of such a language is C/C++ where marco definitions
    /// in a file a.cpp and result in errors in a header file b.hpp.
    ///
    /// @since 3.17.0
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
  const factory RelatedUnchangedDocumentDiagnosticReport({
    /// A document diagnostic report indicating no changes to the last result. A
    /// server can only return `unchanged` if result ids are provided.
    required String kind,

    /// A result id which will be sent on the next diagnostic request for the same
    /// document.
    required String resultId,

    /// Diagnostics of related documents. This information is useful in programming
    /// languages where code in a file A can generate diagnostics in a file B which
    /// A depends on. An example of such a language is C/C++ where marco definitions
    /// in a file a.cpp and result in errors in a header file b.hpp.
    ///
    /// @since 3.17.0
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
  const factory FullDocumentDiagnosticReport({
    /// A full document diagnostic report.
    required String kind,

    /// An optional result id. If provided it will be sent on the next diagnostic
    /// request for the same document.
    String? resultId,

    /// The actual items.
    required List<Diagnostic> items,
  }) = _FullDocumentDiagnosticReport;

  factory FullDocumentDiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$FullDocumentDiagnosticReportFromJson(json);
}

/// A diagnostic report indicating that the last returned report is still
/// accurate.
///
/// @since 3.17.0
@freezed
abstract class UnchangedDocumentDiagnosticReport
    with _$UnchangedDocumentDiagnosticReport {
  const factory UnchangedDocumentDiagnosticReport({
    /// A document diagnostic report indicating no changes to the last result. A
    /// server can only return `unchanged` if result ids are provided.
    required String kind,

    /// A result id which will be sent on the next diagnostic request for the same
    /// document.
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
  const factory DiagnosticOptions({
    bool? workDoneProgress,

    /// An optional identifier under which the diagnostics are managed by the
    /// client.
    String? identifier,

    /// Whether the language has inter file dependencies meaning that editing code
    /// in one file can result in a different diagnostic set in another file. Inter
    /// file dependencies are common for most programming languages and typically
    /// uncommon for linters.
    required bool interFileDependencies,

    /// The server provides support for workspace diagnostics as well.
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
///
/// @since 3.17.0
@freezed
abstract class NotebookDocument with _$NotebookDocument {
  const factory NotebookDocument({
    /// The notebook document's uri.
    required String uri,

    /// The type of the notebook.
    required String notebookType,

    /// The version number of this document (it will increase after each change,
    /// including undo/redo).
    required int version,

    /// Additional metadata stored with the notebook document.
    ///
    /// Note: should always be an object literal (e.g. LSPObject)
    LSPObject? metadata,

    /// The cells of a notebook.
    required List<NotebookCell> cells,
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

    /// The version number of this document (it will increase after each change,
    /// including undo/redo).
    required int version,

    /// The content of the opened text document.
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
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentChangeEvent with _$NotebookDocumentChangeEvent {
  const factory NotebookDocumentChangeEvent({
    /// The changed meta data if any.
    ///
    /// Note: should always be an object literal (e.g. LSPObject)
    LSPObject? metadata,

    /// Changes to cells
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
  const factory NotebookDocumentIdentifier({
    /// The notebook document's uri.
    required String uri,
  }) = _NotebookDocumentIdentifier;

  factory NotebookDocumentIdentifier.fromJson(Map<String, dynamic> json) =>
      _$NotebookDocumentIdentifierFromJson(json);
}

/// Provides information about the context in which an inline completion was
/// requested.
///
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionContext with _$InlineCompletionContext {
  const factory InlineCompletionContext({
    /// Describes how the inline completion was triggered.
    required InlineCompletionTriggerKind triggerKind,

    /// Provides information about the currently selected item in the autocomplete
    /// widget if it is visible.
    SelectedCompletionInfo? selectedCompletionInfo,
  }) = _InlineCompletionContext;

  factory InlineCompletionContext.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionContextFromJson(json);
}

/// A string value used as a snippet is a template which allows to insert text
/// and to control the editor cursor when insertion happens.
///
/// A snippet can define tab stops and placeholders with `$1`, `$2` and
/// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
/// snippet. Variables are defined with `$name` and `${name:default value}`.
///
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
///
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionOptions with _$InlineCompletionOptions {
  const factory InlineCompletionOptions({bool? workDoneProgress}) =
      _InlineCompletionOptions;

  factory InlineCompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionOptionsFromJson(json);
}

/// General parameters to register for a notification or to register a provider.
@freezed
abstract class Registration with _$Registration {
  const factory Registration({
    /// The id used to register the request. The id can be used to deregister the
    /// request again.
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

@freezed
abstract class WorkspaceFoldersInitializeParams
    with _$WorkspaceFoldersInitializeParams {
  const factory WorkspaceFoldersInitializeParams({
    /// The workspace folders configured in the client when the server starts.
    ///
    /// This property is only available if the client supports workspace folders. It
    /// can be `null` if the client supports workspace folders but none are
    /// configured.
    ///
    /// @since 3.6.0
    List<WorkspaceFolder>? workspaceFolders,
  }) = _WorkspaceFoldersInitializeParams;

  factory WorkspaceFoldersInitializeParams.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersInitializeParamsFromJson(json);
}

/// Defines the capabilities provided by a language server.
@freezed
abstract class ServerCapabilities with _$ServerCapabilities {
  const ServerCapabilities._();

  const factory ServerCapabilities({
    /// The position encoding the server picked from the encodings offered by the
    /// client via the client capability `general.positionEncodings`.
    ///
    /// If the client didn't provide any position encodings the only valid value
    /// that a server can return is 'utf-16'.
    ///
    /// If omitted it defaults to 'utf-16'.
    ///
    /// @since 3.17.0
    String? positionEncoding,

    /// Defines how text documents are synced. Is either a detailed structure
    /// defining each notification or for backwards compatibility the
    /// TextDocumentSyncKind number.
    Object? textDocumentSync,

    /// Defines how notebook documents are synced.
    ///
    /// @since 3.17.0
    Object? notebookDocumentSync,

    /// The server provides completion support.
    CompletionOptions? completionProvider,

    /// The server provides hover support.
    Object? hoverProvider,

    /// The server provides signature help support.
    SignatureHelpOptions? signatureHelpProvider,

    /// The server provides Goto Declaration support.
    Object? declarationProvider,

    /// The server provides goto definition support.
    Object? definitionProvider,

    /// The server provides Goto Type Definition support.
    Object? typeDefinitionProvider,

    /// The server provides Goto Implementation support.
    Object? implementationProvider,

    /// The server provides find references support.
    Object? referencesProvider,

    /// The server provides document highlight support.
    Object? documentHighlightProvider,

    /// The server provides document symbol support.
    Object? documentSymbolProvider,

    /// The server provides code actions. CodeActionOptions may only be specified if
    /// the client states that it supports `codeActionLiteralSupport` in its initial
    /// `initialize` request.
    Object? codeActionProvider,

    /// The server provides code lens.
    CodeLensOptions? codeLensProvider,

    /// The server provides document link support.
    DocumentLinkOptions? documentLinkProvider,

    /// The server provides color provider support.
    Object? colorProvider,

    /// The server provides workspace symbol support.
    Object? workspaceSymbolProvider,

    /// The server provides document formatting.
    Object? documentFormattingProvider,

    /// The server provides document range formatting.
    Object? documentRangeFormattingProvider,

    /// The server provides document formatting on typing.
    DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider,

    /// The server provides rename support. RenameOptions may only be specified if
    /// the client states that it supports `prepareSupport` in its initial
    /// `initialize` request.
    Object? renameProvider,

    /// The server provides folding provider support.
    Object? foldingRangeProvider,

    /// The server provides selection range support.
    Object? selectionRangeProvider,

    /// The server provides execute command support.
    ExecuteCommandOptions? executeCommandProvider,

    /// The server provides call hierarchy support.
    ///
    /// @since 3.16.0
    Object? callHierarchyProvider,

    /// The server provides linked editing range support.
    ///
    /// @since 3.16.0
    Object? linkedEditingRangeProvider,

    /// The server provides semantic tokens support.
    ///
    /// @since 3.16.0
    Object? semanticTokensProvider,

    /// The server provides moniker support.
    ///
    /// @since 3.16.0
    Object? monikerProvider,

    /// The server provides type hierarchy support.
    ///
    /// @since 3.17.0
    Object? typeHierarchyProvider,

    /// The server provides inline values.
    ///
    /// @since 3.17.0
    Object? inlineValueProvider,

    /// The server provides inlay hints.
    ///
    /// @since 3.17.0
    Object? inlayHintProvider,

    /// The server has support for pull model diagnostics.
    ///
    /// @since 3.17.0
    Object? diagnosticProvider,

    /// Inline completion options used during static registration.
    ///
    /// @since 3.18.0 @proposed
    Object? inlineCompletionProvider,

    /// Workspace specific server capabilities.
    ({
      WorkspaceFoldersServerCapabilities? workspaceFolders,
      FileOperationOptions? fileOperations,
    })?
    workspace,

    /// Experimental server capabilities.
    LSPAny? experimental,
  }) = _ServerCapabilities;

  factory ServerCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ServerCapabilitiesFromJson(json);

  PositionEncodingKind? get positionEncodingEnum => positionEncoding != null
      ? PositionEncodingKind.decode(positionEncoding!)
      : null;
}

/// A text document identifier to denote a specific version of a text document.
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
  const FileSystemWatcher._();

  const factory FileSystemWatcher({
    /// The glob pattern to watch. See [GlobPattern] for more detail.
    ///
    /// @since 3.17.0 support for relative patterns.
    required GlobPattern globPattern,

    /// The kind of events of interest. If omitted it defaults to WatchKind.Create |
    /// WatchKind.Change | WatchKind.Delete which is 7.
    int? kind,
  }) = _FileSystemWatcher;

  factory FileSystemWatcher.fromJson(Map<String, dynamic> json) =>
      _$FileSystemWatcherFromJson(json);

  WatchKind? get kindEnum => kind != null ? WatchKind.decode(kind!) : null;
}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic
/// objects are only valid in the scope of a resource.
@freezed
abstract class Diagnostic with _$Diagnostic {
  const factory Diagnostic({
    /// The range at which the message applies
    required Range range,

    /// The diagnostic's severity. Can be omitted. If omitted it is up to the client
    /// to interpret diagnostics as error, warning, info or hint.
    DiagnosticSeverity? severity,

    /// The diagnostic's code, which usually appear in the user interface.
    Object? code,

    /// An optional property to describe the error code. Requires the code field
    /// (above) to be present/not null.
    ///
    /// @since 3.16.0
    CodeDescription? codeDescription,

    /// A human-readable string describing the source of this diagnostic, e.g.
    /// 'typescript' or 'super lint'. It usually appears in the user interface.
    String? source,

    /// The diagnostic's message. It usually appears in the user interface
    required String message,

    /// Additional metadata about the diagnostic.
    ///
    /// @since 3.15.0
    List<DiagnosticTag>? tags,

    /// An array of related diagnostic information, e.g. when symbol-names within a
    /// scope collide all definitions can be marked via this property.
    List<DiagnosticRelatedInformation>? relatedInformation,

    /// A data entry field that is preserved between a
    /// `textDocument/publishDiagnostics` notification and `textDocument/codeAction`
    /// request.
    ///
    /// @since 3.16.0
    LSPAny? data,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}

/// Contains additional information about the context in which a completion
/// request is triggered.
@freezed
abstract class CompletionContext with _$CompletionContext {
  const factory CompletionContext({
    /// How the completion was triggered.
    required CompletionTriggerKind triggerKind,

    /// The trigger character (a single character) that has trigger code complete.
    /// Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`
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
  const factory CompletionItemLabelDetails({
    /// An optional string which is rendered less prominently directly after
    /// [label], without any spacing. Should be used for function signatures and
    /// type annotations.
    String? detail,

    /// An optional string which is rendered less prominently after
    /// [CompletionItem.detail]. Should be used for fully qualified names and file
    /// paths.
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
    bool? workDoneProgress,

    /// Most tools trigger completion request automatically without explicitly
    /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do
    /// so when the user starts to type an identifier. For example if the user types
    /// `c` in a JavaScript file code complete will automatically pop up present
    /// `console` besides others as a completion item. Characters that make up
    /// identifiers don't need to be listed here.
    ///
    /// If code complete should automatically be trigger on characters not being
    /// valid inside an identifier (for example `.` in JavaScript) list them in
    /// `triggerCharacters`.
    List<String>? triggerCharacters,

    /// The list of all possible characters that commit a completion. This field can
    /// be used if clients don't support individual commit characters per completion
    /// item. See
    /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    ///
    /// If a server provides both `allCommitCharacters` and commit characters on an
    /// individual completion item the ones on the completion item win.
    ///
    /// @since 3.2.0
    List<String>? allCommitCharacters,

    /// The server provides support to resolve additional information for a
    /// completion item.
    bool? resolveProvider,

    /// The server supports the following `CompletionItem` specific capabilities.
    ///
    /// @since 3.17.0
    ({bool? labelDetailsSupport})? completionItem,
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

/// Additional information about the context in which a signature help request
/// was triggered.
///
/// @since 3.15.0
@freezed
abstract class SignatureHelpContext with _$SignatureHelpContext {
  const factory SignatureHelpContext({
    /// Action that caused signature help to be triggered.
    required SignatureHelpTriggerKind triggerKind,

    /// Character that caused signature help to be triggered.
    ///
    /// This is undefined when `triggerKind !==
    /// SignatureHelpTriggerKind.TriggerCharacter`
    String? triggerCharacter,

    /// `true` if signature help was already showing when it was triggered.
    ///
    /// Retriggers occurs when the signature help is already active and can be
    /// caused by actions such as typing a trigger character, a cursor move, or
    /// document content changes.
    required bool isRetrigger,

    /// The currently active `SignatureHelp`.
    ///
    /// The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field
    /// updated based on the user navigating through available signatures.
    SignatureHelp? activeSignatureHelp,
  }) = _SignatureHelpContext;

  factory SignatureHelpContext.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpContextFromJson(json);
}

/// Represents the signature of something callable. A signature can have a
/// label, like a function-name, a doc-comment, and a set of parameters.
@freezed
abstract class SignatureInformation with _$SignatureInformation {
  const factory SignatureInformation({
    /// The label of this signature. Will be shown in the UI.
    required String label,

    /// The human-readable doc-comment of this signature. Will be shown in the UI
    /// but can be omitted.
    Object? documentation,

    /// The parameters of this signature.
    List<ParameterInformation>? parameters,

    /// The index of the active parameter.
    ///
    /// If provided, this is used in place of `SignatureHelp.activeParameter`.
    ///
    /// @since 3.16.0
    int? activeParameter,
  }) = _SignatureInformation;

  factory SignatureInformation.fromJson(Map<String, dynamic> json) =>
      _$SignatureInformationFromJson(json);
}

/// Server Capabilities for a [SignatureHelpRequest].
@freezed
abstract class SignatureHelpOptions with _$SignatureHelpOptions {
  const factory SignatureHelpOptions({
    bool? workDoneProgress,

    /// List of characters that trigger signature help automatically.
    List<String>? triggerCharacters,

    /// List of characters that re-trigger signature help.
    ///
    /// These trigger characters are only active when signature help is already
    /// showing. All trigger characters are also counted as re-trigger characters.
    ///
    /// @since 3.15.0
    List<String>? retriggerCharacters,
  }) = _SignatureHelpOptions;

  factory SignatureHelpOptions.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpOptionsFromJson(json);
}

/// Server Capabilities for a [DefinitionRequest].
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

/// Provider options for a [DocumentHighlightRequest].
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

    /// Tags for this symbol.
    ///
    /// @since 3.16.0
    List<SymbolTag>? tags,

    /// The name of the symbol containing this symbol. This information is for user
    /// interface purposes (e.g. to render a qualifier in the user interface if
    /// necessary). It can't be used to re-infer a hierarchy for the document
    /// symbols.
    String? containerName,
  }) = _BaseSymbolInformation;

  factory BaseSymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$BaseSymbolInformationFromJson(json);
}

/// Provider options for a [DocumentSymbolRequest].
@freezed
abstract class DocumentSymbolOptions with _$DocumentSymbolOptions {
  const factory DocumentSymbolOptions({
    bool? workDoneProgress,

    /// A human-readable string that is shown when multiple outlines trees are shown
    /// for the same document.
    ///
    /// @since 3.16.0
    String? label,
  }) = _DocumentSymbolOptions;

  factory DocumentSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolOptionsFromJson(json);
}

/// Contains additional diagnostic information about the context in which a
/// [CodeActionProvider] is run.
@freezed
abstract class CodeActionContext with _$CodeActionContext {
  const factory CodeActionContext({
    /// An array of diagnostics known on the client side overlapping the range
    /// provided to the `textDocument/codeAction` request. They are provided so that
    /// the server knows which errors are currently presented to the user for the
    /// given range. There is no guarantee that these accurately reflect the error
    /// state of the resource. The primary parameter to compute code actions is the
    /// provided range.
    required List<Diagnostic> diagnostics,

    /// Requested kind of actions to return.
    ///
    /// Actions not of this kind are filtered out by the client before being shown.
    /// So servers can omit computing them.
    List<CodeActionKind>? only,

    /// The reason why code actions were requested.
    ///
    /// @since 3.17.0
    CodeActionTriggerKind? triggerKind,
  }) = _CodeActionContext;

  factory CodeActionContext.fromJson(Map<String, dynamic> json) =>
      _$CodeActionContextFromJson(json);
}

/// Provider options for a [CodeActionRequest].
@freezed
abstract class CodeActionOptions with _$CodeActionOptions {
  const factory CodeActionOptions({
    bool? workDoneProgress,

    /// CodeActionKinds that this server may return.
    ///
    /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the
    /// server may list out every specific kind they provide.
    List<CodeActionKind>? codeActionKinds,

    /// The server provides support to resolve additional information for a code
    /// action.
    ///
    /// @since 3.16.0
    bool? resolveProvider,
  }) = _CodeActionOptions;

  factory CodeActionOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeActionOptionsFromJson(json);
}

/// Server capabilities for a [WorkspaceSymbolRequest].
@freezed
abstract class WorkspaceSymbolOptions with _$WorkspaceSymbolOptions {
  const factory WorkspaceSymbolOptions({
    bool? workDoneProgress,

    /// The server provides support to resolve additional information for a
    /// workspace symbol.
    ///
    /// @since 3.17.0
    bool? resolveProvider,
  }) = _WorkspaceSymbolOptions;

  factory WorkspaceSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolOptionsFromJson(json);
}

/// Code Lens provider options of a [CodeLensRequest].
@freezed
abstract class CodeLensOptions with _$CodeLensOptions {
  const factory CodeLensOptions({
    bool? workDoneProgress,

    /// Code lens has a resolve provider as well.
    bool? resolveProvider,
  }) = _CodeLensOptions;

  factory CodeLensOptions.fromJson(Map<String, dynamic> json) =>
      _$CodeLensOptionsFromJson(json);
}

/// Provider options for a [DocumentLinkRequest].
@freezed
abstract class DocumentLinkOptions with _$DocumentLinkOptions {
  const factory DocumentLinkOptions({
    bool? workDoneProgress,

    /// Document links have a resolve provider as well.
    bool? resolveProvider,
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

    /// Trim trailing whitespace on a line.
    ///
    /// @since 3.15.0
    bool? trimTrailingWhitespace,

    /// Insert a newline character at the end of the file if one does not exist.
    ///
    /// @since 3.15.0
    bool? insertFinalNewline,

    /// Trim all newlines after the final newline at the end of the file.
    ///
    /// @since 3.15.0
    bool? trimFinalNewlines,
  }) = _FormattingOptions;

  factory FormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$FormattingOptionsFromJson(json);
}

/// Provider options for a [DocumentFormattingRequest].
@freezed
abstract class DocumentFormattingOptions with _$DocumentFormattingOptions {
  const factory DocumentFormattingOptions({bool? workDoneProgress}) =
      _DocumentFormattingOptions;

  factory DocumentFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentFormattingOptionsFromJson(json);
}

/// Provider options for a [DocumentRangeFormattingRequest].
@freezed
abstract class DocumentRangeFormattingOptions
    with _$DocumentRangeFormattingOptions {
  const factory DocumentRangeFormattingOptions({
    bool? workDoneProgress,

    /// Whether the server supports formatting multiple ranges at once.
    ///
    /// @since 3.18.0 @proposed
    bool? rangesSupport,
  }) = _DocumentRangeFormattingOptions;

  factory DocumentRangeFormattingOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentRangeFormattingOptionsFromJson(json);
}

/// Provider options for a [DocumentOnTypeFormattingRequest].
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

/// Provider options for a [RenameRequest].
@freezed
abstract class RenameOptions with _$RenameOptions {
  const factory RenameOptions({
    bool? workDoneProgress,

    /// Renames should be checked and tested before being executed.
    ///
    /// @since version 3.12.0
    bool? prepareProvider,
  }) = _RenameOptions;

  factory RenameOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameOptionsFromJson(json);
}

/// The server capabilities of a [ExecuteCommandRequest].
@freezed
abstract class ExecuteCommandOptions with _$ExecuteCommandOptions {
  const factory ExecuteCommandOptions({
    bool? workDoneProgress,

    /// The commands to be executed on the server
    required List<String> commands,
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

/// A text document identifier to optionally denote a specific version of a text
/// document.
@freezed
abstract class OptionalVersionedTextDocumentIdentifier
    with _$OptionalVersionedTextDocumentIdentifier {
  const factory OptionalVersionedTextDocumentIdentifier({
    /// The text document's uri.
    required String uri,

    /// The version number of this document. If a versioned text document identifier
    /// is sent from the server to the client and the file is not open in the editor
    /// (the server has not received an open notification before) the server can
    /// send `null` to indicate that the version is unknown and the content on disk
    /// is the truth (as specified with document content ownership).
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
    ///
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
    /// Overwrite existing file. Overwrite wins over `ignoreIfExists`
    bool? overwrite,

    /// Ignore if exists.
    bool? ignoreIfExists,
  }) = _CreateFileOptions;

  factory CreateFileOptions.fromJson(Map<String, dynamic> json) =>
      _$CreateFileOptionsFromJson(json);
}

/// Rename file options
@freezed
abstract class RenameFileOptions with _$RenameFileOptions {
  const factory RenameFileOptions({
    /// Overwrite target if existing. Overwrite wins over `ignoreIfExists`
    bool? overwrite,

    /// Ignores if target exists.
    bool? ignoreIfExists,
  }) = _RenameFileOptions;

  factory RenameFileOptions.fromJson(Map<String, dynamic> json) =>
      _$RenameFileOptionsFromJson(json);
}

/// Delete file options
@freezed
abstract class DeleteFileOptions with _$DeleteFileOptions {
  const factory DeleteFileOptions({
    /// Delete the content recursively if a folder is denoted.
    bool? recursive,

    /// Ignore the operation if the file doesn't exist.
    bool? ignoreIfNotExists,
  }) = _DeleteFileOptions;

  factory DeleteFileOptions.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileOptionsFromJson(json);
}

/// A pattern to describe in which file operation requests or notifications the
/// server is interested in receiving.
///
/// @since 3.16.0
@freezed
abstract class FileOperationPattern with _$FileOperationPattern {
  const factory FileOperationPattern({
    /// The glob pattern to match. Glob patterns can have the following syntax: -
    /// `*` to match zero or more characters in a path segment - `?` to match on one
    /// character in a path segment - `**` to match any number of path segments,
    /// including none - `{}` to group sub patterns into an OR expression. (e.g.
    /// `**​/*.{ts,js}` matches all TypeScript and JavaScript files) - `[]` to
    /// declare a range of characters to match in a path segment (e.g.,
    /// `example.[0-9]` to match on `example.0`, `example.1`, …) - `[!...]` to
    /// negate a range of characters to match in a path segment (e.g.,
    /// `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
    required String glob,

    /// Whether to match files or folders with this pattern.
    ///
    /// Matches both if undefined.
    FileOperationPatternKind? matches,

    /// Additional options used during matching.
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
  const factory WorkspaceFullDocumentDiagnosticReport({
    /// A full document diagnostic report.
    required String kind,

    /// An optional result id. If provided it will be sent on the next diagnostic
    /// request for the same document.
    String? resultId,

    /// The actual items.
    required List<Diagnostic> items,

    /// The URI for which diagnostic information is reported.
    required String uri,

    /// The version number for which the diagnostics are reported. If the document
    /// is not marked as open `null` can be provided.
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
  const factory WorkspaceUnchangedDocumentDiagnosticReport({
    /// A document diagnostic report indicating no changes to the last result. A
    /// server can only return `unchanged` if result ids are provided.
    required String kind,

    /// A result id which will be sent on the next diagnostic request for the same
    /// document.
    required String resultId,

    /// The URI for which diagnostic information is reported.
    required String uri,

    /// The version number for which the diagnostics are reported. If the document
    /// is not marked as open `null` can be provided.
    required int? version,
  }) = _WorkspaceUnchangedDocumentDiagnosticReport;

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceUnchangedDocumentDiagnosticReportFromJson(json);
}

/// A notebook cell.
///
/// A cell's document URI must be unique across ALL notebook cells and can
/// therefore be used to uniquely identify a notebook cell or the cell's text
/// document.
///
/// @since 3.17.0
@freezed
abstract class NotebookCell with _$NotebookCell {
  const factory NotebookCell({
    /// The cell's kind
    required NotebookCellKind kind,

    /// The URI of the cell's text document content.
    required String document,

    /// Additional metadata stored with the cell.
    ///
    /// Note: should always be an object literal (e.g. LSPObject)
    LSPObject? metadata,

    /// Additional execution summary information if supported by the client.
    ExecutionSummary? executionSummary,
  }) = _NotebookCell;

  factory NotebookCell.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellFromJson(json);
}

/// A change describing how to move a `NotebookCell` array from state S to S'.
///
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
///
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
    /// Workspace specific client capabilities.
    WorkspaceClientCapabilities? workspace,

    /// Text document specific client capabilities.
    TextDocumentClientCapabilities? textDocument,

    /// Capabilities specific to the notebook document support.
    ///
    /// @since 3.17.0
    NotebookDocumentClientCapabilities? notebookDocument,

    /// Window specific client capabilities.
    WindowClientCapabilities? window,

    /// General client capabilities.
    ///
    /// @since 3.16.0
    GeneralClientCapabilities? general,

    /// Experimental client capabilities.
    LSPAny? experimental,
  }) = _ClientCapabilities;

  factory ClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ClientCapabilitiesFromJson(json);
}

@freezed
abstract class TextDocumentSyncOptions with _$TextDocumentSyncOptions {
  const factory TextDocumentSyncOptions({
    /// Open and close notifications are sent to the server. If omitted open close
    /// notification should not be sent.
    bool? openClose,

    /// Change notifications are sent to the server. See TextDocumentSyncKind.None,
    /// TextDocumentSyncKind.Full and TextDocumentSyncKind.Incremental. If omitted
    /// it defaults to TextDocumentSyncKind.None.
    TextDocumentSyncKind? change,

    /// If present will save notifications are sent to the server. If omitted the
    /// notification should not be sent.
    bool? willSave,

    /// If present will save wait until requests are sent to the server. If omitted
    /// the request should not be sent.
    bool? willSaveWaitUntil,

    /// If present save notifications are sent to the server. If omitted the
    /// notification should not be sent.
    Object? save,
  }) = _TextDocumentSyncOptions;

  factory TextDocumentSyncOptions.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentSyncOptionsFromJson(json);
}

/// Options specific to a notebook plus its cells to be synced to the server.
///
/// If a selector provides a notebook document filter but no cell selector all
/// cells of a matching notebook document will be synced.
///
/// If a selector provides no notebook document filter but only a cell selector
/// all notebook document that contain at least one matching cell will be
/// synced.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentSyncOptions with _$NotebookDocumentSyncOptions {
  const factory NotebookDocumentSyncOptions({
    /// The notebooks to be synced
    required List<Object> notebookSelector,

    /// Whether save notification should be forwarded to the server. Will only be
    /// honored if mode === `notebook`.
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
  const factory NotebookDocumentSyncRegistrationOptions({
    /// The notebooks to be synced
    required List<Object> notebookSelector,

    /// Whether save notification should be forwarded to the server. Will only be
    /// honored if mode === `notebook`.
    bool? save,

    /// The id used to register the request. The id can be used to deregister the
    /// request again. See also Registration#id.
    String? id,
  }) = _NotebookDocumentSyncRegistrationOptions;

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncRegistrationOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersServerCapabilities
    with _$WorkspaceFoldersServerCapabilities {
  const factory WorkspaceFoldersServerCapabilities({
    /// The server has support for workspace folders
    bool? supported,

    /// Whether the server wants to receive workspace folder change notifications.
    ///
    /// If a string is provided the string is treated as an ID under which the
    /// notification is registered on the client side. The ID can be used to
    /// unregister for these events using the `client/unregisterCapability` request.
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
  const factory FileOperationOptions({
    /// The server is interested in receiving didCreateFiles notifications.
    FileOperationRegistrationOptions? didCreate,

    /// The server is interested in receiving willCreateFiles requests.
    FileOperationRegistrationOptions? willCreate,

    /// The server is interested in receiving didRenameFiles notifications.
    FileOperationRegistrationOptions? didRename,

    /// The server is interested in receiving willRenameFiles requests.
    FileOperationRegistrationOptions? willRename,

    /// The server is interested in receiving didDeleteFiles file notifications.
    FileOperationRegistrationOptions? didDelete,

    /// The server is interested in receiving willDeleteFiles file requests.
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
  const factory CodeDescription({
    /// An URI to open with more information about the diagnostic error.
    required String href,
  }) = _CodeDescription;

  factory CodeDescription.fromJson(Map<String, dynamic> json) =>
      _$CodeDescriptionFromJson(json);
}

/// Represents a related message and source code location for a diagnostic. This
/// should be used to point to code locations that cause or related to a
/// diagnostics, e.g when duplicating a symbol in a scope.
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

/// Represents a parameter of a callable-signature. A parameter can have a label
/// and a doc-comment.
@freezed
abstract class ParameterInformation with _$ParameterInformation {
  const factory ParameterInformation({
    /// The label of this parameter information.
    ///
    /// Either a string or an inclusive start and exclusive end offsets within its
    /// containing signature label. (see SignatureInformation.label). The offsets
    /// are based on a UTF-16 string representation as `Position` and `Range` does.
    ///
    /// *Note*: a label of type string should be a substring of its containing
    /// signature label. Its intended use case is to highlight the parameter label
    /// part in the `SignatureInformation.label`.
    required Object label,

    /// The human-readable doc-comment of this parameter. Will be shown in the UI
    /// but can be omitted.
    Object? documentation,
  }) = _ParameterInformation;

  factory ParameterInformation.fromJson(Map<String, dynamic> json) =>
      _$ParameterInformationFromJson(json);
}

/// A notebook cell text document filter denotes a cell text document by
/// different properties.
///
/// @since 3.17.0
@freezed
abstract class NotebookCellTextDocumentFilter
    with _$NotebookCellTextDocumentFilter {
  const factory NotebookCellTextDocumentFilter({
    /// A filter that matches against the notebook containing the notebook cell. If
    /// a string value is provided it matches against the notebook type. '*' matches
    /// every notebook.
    required Object notebook,

    /// A language id like `python`.
    ///
    /// Will be matched against the language id of the notebook cell document. '*'
    /// matches every language.
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
    /// A strict monotonically increasing value indicating the execution order of a
    /// cell inside a notebook.
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
    /// The client supports applying batch edits to the workspace by supporting the
    /// request 'workspace/applyEdit'
    bool? applyEdit,

    /// Capabilities specific to `WorkspaceEdit`s.
    WorkspaceEditClientCapabilities? workspaceEdit,

    /// Capabilities specific to the `workspace/didChangeConfiguration`
    /// notification.
    DidChangeConfigurationClientCapabilities? didChangeConfiguration,

    /// Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
    DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles,

    /// Capabilities specific to the `workspace/symbol` request.
    WorkspaceSymbolClientCapabilities? symbol,

    /// Capabilities specific to the `workspace/executeCommand` request.
    ExecuteCommandClientCapabilities? executeCommand,

    /// The client has support for workspace folders.
    ///
    /// @since 3.6.0
    bool? workspaceFolders,

    /// The client supports `workspace/configuration` requests.
    ///
    /// @since 3.6.0
    bool? configuration,

    /// Capabilities specific to the semantic token requests scoped to the
    /// workspace.
    ///
    /// @since 3.16.0.
    SemanticTokensWorkspaceClientCapabilities? semanticTokens,

    /// Capabilities specific to the code lens requests scoped to the workspace.
    ///
    /// @since 3.16.0.
    CodeLensWorkspaceClientCapabilities? codeLens,

    /// The client has support for file notifications/requests for user operations
    /// on files.
    ///
    /// Since 3.16.0
    FileOperationClientCapabilities? fileOperations,

    /// Capabilities specific to the inline values requests scoped to the workspace.
    ///
    /// @since 3.17.0.
    InlineValueWorkspaceClientCapabilities? inlineValue,

    /// Capabilities specific to the inlay hint requests scoped to the workspace.
    ///
    /// @since 3.17.0.
    InlayHintWorkspaceClientCapabilities? inlayHint,

    /// Capabilities specific to the diagnostic requests scoped to the workspace.
    ///
    /// @since 3.17.0.
    DiagnosticWorkspaceClientCapabilities? diagnostics,

    /// Capabilities specific to the folding range requests scoped to the workspace.
    ///
    /// @since 3.18.0 @proposed
    FoldingRangeWorkspaceClientCapabilities? foldingRange,
  }) = _WorkspaceClientCapabilities;

  factory WorkspaceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceClientCapabilitiesFromJson(json);
}

/// Text document specific client capabilities.
@freezed
abstract class TextDocumentClientCapabilities
    with _$TextDocumentClientCapabilities {
  const factory TextDocumentClientCapabilities({
    /// Defines which synchronization capabilities the client supports.
    TextDocumentSyncClientCapabilities? synchronization,

    /// Capabilities specific to the `textDocument/completion` request.
    CompletionClientCapabilities? completion,

    /// Capabilities specific to the `textDocument/hover` request.
    HoverClientCapabilities? hover,

    /// Capabilities specific to the `textDocument/signatureHelp` request.
    SignatureHelpClientCapabilities? signatureHelp,

    /// Capabilities specific to the `textDocument/declaration` request.
    ///
    /// @since 3.14.0
    DeclarationClientCapabilities? declaration,

    /// Capabilities specific to the `textDocument/definition` request.
    DefinitionClientCapabilities? definition,

    /// Capabilities specific to the `textDocument/typeDefinition` request.
    ///
    /// @since 3.6.0
    TypeDefinitionClientCapabilities? typeDefinition,

    /// Capabilities specific to the `textDocument/implementation` request.
    ///
    /// @since 3.6.0
    ImplementationClientCapabilities? implementation,

    /// Capabilities specific to the `textDocument/references` request.
    ReferenceClientCapabilities? references,

    /// Capabilities specific to the `textDocument/documentHighlight` request.
    DocumentHighlightClientCapabilities? documentHighlight,

    /// Capabilities specific to the `textDocument/documentSymbol` request.
    DocumentSymbolClientCapabilities? documentSymbol,

    /// Capabilities specific to the `textDocument/codeAction` request.
    CodeActionClientCapabilities? codeAction,

    /// Capabilities specific to the `textDocument/codeLens` request.
    CodeLensClientCapabilities? codeLens,

    /// Capabilities specific to the `textDocument/documentLink` request.
    DocumentLinkClientCapabilities? documentLink,

    /// Capabilities specific to the `textDocument/documentColor` and the
    /// `textDocument/colorPresentation` request.
    ///
    /// @since 3.6.0
    DocumentColorClientCapabilities? colorProvider,

    /// Capabilities specific to the `textDocument/formatting` request.
    DocumentFormattingClientCapabilities? formatting,

    /// Capabilities specific to the `textDocument/rangeFormatting` request.
    DocumentRangeFormattingClientCapabilities? rangeFormatting,

    /// Capabilities specific to the `textDocument/onTypeFormatting` request.
    DocumentOnTypeFormattingClientCapabilities? onTypeFormatting,

    /// Capabilities specific to the `textDocument/rename` request.
    RenameClientCapabilities? rename,

    /// Capabilities specific to the `textDocument/foldingRange` request.
    ///
    /// @since 3.10.0
    FoldingRangeClientCapabilities? foldingRange,

    /// Capabilities specific to the `textDocument/selectionRange` request.
    ///
    /// @since 3.15.0
    SelectionRangeClientCapabilities? selectionRange,

    /// Capabilities specific to the `textDocument/publishDiagnostics` notification.
    PublishDiagnosticsClientCapabilities? publishDiagnostics,

    /// Capabilities specific to the various call hierarchy requests.
    ///
    /// @since 3.16.0
    CallHierarchyClientCapabilities? callHierarchy,

    /// Capabilities specific to the various semantic token request.
    ///
    /// @since 3.16.0
    SemanticTokensClientCapabilities? semanticTokens,

    /// Capabilities specific to the `textDocument/linkedEditingRange` request.
    ///
    /// @since 3.16.0
    LinkedEditingRangeClientCapabilities? linkedEditingRange,

    /// Client capabilities specific to the `textDocument/moniker` request.
    ///
    /// @since 3.16.0
    MonikerClientCapabilities? moniker,

    /// Capabilities specific to the various type hierarchy requests.
    ///
    /// @since 3.17.0
    TypeHierarchyClientCapabilities? typeHierarchy,

    /// Capabilities specific to the `textDocument/inlineValue` request.
    ///
    /// @since 3.17.0
    InlineValueClientCapabilities? inlineValue,

    /// Capabilities specific to the `textDocument/inlayHint` request.
    ///
    /// @since 3.17.0
    InlayHintClientCapabilities? inlayHint,

    /// Capabilities specific to the diagnostic pull model.
    ///
    /// @since 3.17.0
    DiagnosticClientCapabilities? diagnostic,

    /// Client capabilities specific to inline completions.
    ///
    /// @since 3.18.0 @proposed
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
  const factory NotebookDocumentClientCapabilities({
    /// Capabilities specific to notebook document synchronization
    ///
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
    /// It indicates whether the client supports server initiated progress using the
    /// `window/workDoneProgress/create` request.
    ///
    /// The capability also controls Whether client supports handling of progress
    /// notifications. If set servers are allowed to report a `workDoneProgress`
    /// property in the request specific server capabilities.
    ///
    /// @since 3.15.0
    bool? workDoneProgress,

    /// Capabilities specific to the showMessage request.
    ///
    /// @since 3.16.0
    ShowMessageRequestClientCapabilities? showMessage,

    /// Capabilities specific to the showDocument request.
    ///
    /// @since 3.16.0
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
  const factory GeneralClientCapabilities({
    /// Client capability that signals how the client handles stale requests (e.g. a
    /// request for which the client will not process the response anymore since the
    /// information is outdated).
    ///
    /// @since 3.17.0
    ({bool cancel, List<String> retryOnContentModified})? staleRequestSupport,

    /// Client capabilities specific to regular expressions.
    ///
    /// @since 3.16.0
    RegularExpressionsClientCapabilities? regularExpressions,

    /// Client capabilities specific to the client's markdown parser.
    ///
    /// @since 3.16.0
    MarkdownClientCapabilities? markdown,

    /// The position encodings supported by the client. Client and server have to
    /// agree on the same position encoding to ensure that offsets (e.g. character
    /// position in a line) are interpreted the same on both sides.
    ///
    /// To keep the protocol backwards compatible the following applies: if the
    /// value 'utf-16' is missing from the array of position encodings servers can
    /// assume that the client supports UTF-16. UTF-16 is therefore a mandatory
    /// encoding.
    ///
    /// If omitted it defaults to ['utf-16'].
    ///
    /// Implementation considerations: since the conversion from one encoding into
    /// another requires the content of the file / line the conversion is best done
    /// where the file is read which is usually on the server side.
    ///
    /// @since 3.17.0
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
  const factory RelativePattern({
    /// A workspace folder or a base URI to which this pattern will be matched
    /// against relatively.
    required Object baseUri,

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
    /// The client supports versioned document changes in `WorkspaceEdit`s
    bool? documentChanges,

    /// The resource operations the client supports. Clients should at least support
    /// 'create', 'rename' and 'delete' files and folders.
    ///
    /// @since 3.13.0
    List<ResourceOperationKind>? resourceOperations,

    /// The failure handling strategy of a client if applying the workspace edit
    /// fails.
    ///
    /// @since 3.13.0
    FailureHandlingKind? failureHandling,

    /// Whether the client normalizes line endings to the client specific setting.
    /// If set to `true` the client will normalize line ending characters in a
    /// workspace edit to the client-specified new line character.
    ///
    /// @since 3.16.0
    bool? normalizesLineEndings,

    /// Whether the client in general supports change annotations on text edits,
    /// create file, rename file and delete file changes.
    ///
    /// @since 3.16.0
    ({bool? groupsOnLabel})? changeAnnotationSupport,
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
    /// Did change watched files notification supports dynamic registration. Please
    /// note that the current protocol doesn't support static configuration for file
    /// changes from the server side.
    bool? dynamicRegistration,

    /// Whether the client has support for [RelativePattern] or not.
    ///
    /// @since 3.17.0
    bool? relativePatternSupport,
  }) = _DidChangeWatchedFilesClientCapabilities;

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesClientCapabilitiesFromJson(json);
}

/// Client capabilities for a [WorkspaceSymbolRequest].
@freezed
abstract class WorkspaceSymbolClientCapabilities
    with _$WorkspaceSymbolClientCapabilities {
  const factory WorkspaceSymbolClientCapabilities({
    /// Symbol request supports dynamic registration.
    bool? dynamicRegistration,

    /// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
    /// request.
    ({List<SymbolKind>? valueSet})? symbolKind,

    /// The client supports tags on `SymbolInformation`. Clients supporting tags
    /// have to handle unknown tags gracefully.
    ///
    /// @since 3.16.0
    ({List<SymbolTag> valueSet})? tagSupport,

    /// The client support partial workspace symbols. The client will send the
    /// request `workspaceSymbol/resolve` to the server to resolve additional
    /// properties.
    ///
    /// @since 3.17.0
    ({List<String> properties})? resolveSupport,
  }) = _WorkspaceSymbolClientCapabilities;

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolClientCapabilitiesFromJson(json);
}

/// The client capabilities of a [ExecuteCommandRequest].
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
    /// Whether the client implementation supports a refresh request sent from the
    /// server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// semantic tokens currently shown. It should be used with absolute care and is
    /// useful for situation where a server for example detects a project wide
    /// change that requires such a calculation.
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
    /// Whether the client implementation supports a refresh request sent from the
    /// server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all code
    /// lenses currently shown. It should be used with absolute care and is useful
    /// for situation where a server for example detect a project wide change that
    /// requires such a calculation.
    bool? refreshSupport,
  }) = _CodeLensWorkspaceClientCapabilities;

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$CodeLensWorkspaceClientCapabilitiesFromJson(json);
}

/// Capabilities relating to events from file operations by the user in the
/// client.
///
/// These events do not come from the file system, they come from user
/// operations like renaming a file in the UI.
///
/// @since 3.16.0
@freezed
abstract class FileOperationClientCapabilities
    with _$FileOperationClientCapabilities {
  const factory FileOperationClientCapabilities({
    /// Whether the client supports dynamic registration for file
    /// requests/notifications.
    bool? dynamicRegistration,

    /// The client has support for sending didCreateFiles notifications.
    bool? didCreate,

    /// The client has support for sending willCreateFiles requests.
    bool? willCreate,

    /// The client has support for sending didRenameFiles notifications.
    bool? didRename,

    /// The client has support for sending willRenameFiles requests.
    bool? willRename,

    /// The client has support for sending didDeleteFiles notifications.
    bool? didDelete,

    /// The client has support for sending willDeleteFiles requests.
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
  const factory InlineValueWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from the
    /// server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// inline values currently shown. It should be used with absolute care and is
    /// useful for situation where a server for example detects a project wide
    /// change that requires such a calculation.
    bool? refreshSupport,
  }) = _InlineValueWorkspaceClientCapabilities;

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
  const factory InlayHintWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from the
    /// server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// inlay hints currently shown. It should be used with absolute care and is
    /// useful for situation where a server for example detects a project wide
    /// change that requires such a calculation.
    bool? refreshSupport,
  }) = _InlayHintWorkspaceClientCapabilities;

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
  const factory DiagnosticWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from the
    /// server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// pulled diagnostics currently shown. It should be used with absolute care and
    /// is useful for situation where a server for example detects a project wide
    /// change that requires such a calculation.
    bool? refreshSupport,
  }) = _DiagnosticWorkspaceClientCapabilities;

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticWorkspaceClientCapabilitiesFromJson(json);
}

/// Client workspace capabilities specific to folding ranges
///
/// @since 3.18.0 @proposed
@freezed
abstract class FoldingRangeWorkspaceClientCapabilities
    with _$FoldingRangeWorkspaceClientCapabilities {
  const factory FoldingRangeWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from the
    /// server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// folding ranges currently shown. It should be used with absolute care and is
    /// useful for situation where a server for example detects a project wide
    /// change that requires such a calculation.
    ///
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
    /// Whether text document synchronization supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports sending will save notifications.
    bool? willSave,

    /// The client supports sending a will save request and waits for a response
    /// providing text edits which will be applied to the document before it is
    /// saved.
    bool? willSaveWaitUntil,

    /// The client supports did save notifications.
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
  const factory CompletionClientCapabilities({
    /// Whether completion supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports the following `CompletionItem` specific capabilities.
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

    /// Defines how the client handles whitespace and indentation when accepting a
    /// completion item that uses multi line text in either `insertText` or
    /// `textEdit`.
    ///
    /// @since 3.17.0
    InsertTextMode? insertTextMode,

    /// The client supports to send additional context information for a
    /// `textDocument/completion` request.
    bool? contextSupport,

    /// The client supports the following `CompletionList` specific capabilities.
    ///
    /// @since 3.17.0
    ({List<String>? itemDefaults})? completionList,
  }) = _CompletionClientCapabilities;

  factory CompletionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CompletionClientCapabilitiesFromJson(json);
}

@freezed
abstract class HoverClientCapabilities with _$HoverClientCapabilities {
  const factory HoverClientCapabilities({
    /// Whether hover supports dynamic registration.
    bool? dynamicRegistration,

    /// Client supports the following content formats for the content property. The
    /// order describes the preferred format of the client.
    List<MarkupKind>? contentFormat,
  }) = _HoverClientCapabilities;

  factory HoverClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$HoverClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [SignatureHelpRequest].
@freezed
abstract class SignatureHelpClientCapabilities
    with _$SignatureHelpClientCapabilities {
  const factory SignatureHelpClientCapabilities({
    /// Whether signature help supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports the following `SignatureInformation` specific
    /// properties.
    ({
      List<MarkupKind>? documentationFormat,
      ({bool? labelOffsetSupport})? parameterInformation,
      bool? activeParameterSupport,
    })?
    signatureInformation,

    /// The client supports to send additional context information for a
    /// `textDocument/signatureHelp` request. A client that opts into contextSupport
    /// will also support the `retriggerCharacters` on `SignatureHelpOptions`.
    ///
    /// @since 3.15.0
    bool? contextSupport,
  }) = _SignatureHelpClientCapabilities;

  factory SignatureHelpClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpClientCapabilitiesFromJson(json);
}

/// @since 3.14.0
@freezed
abstract class DeclarationClientCapabilities
    with _$DeclarationClientCapabilities {
  const factory DeclarationClientCapabilities({
    /// Whether declaration supports dynamic registration. If this is set to `true`
    /// the client supports the new `DeclarationRegistrationOptions` return value
    /// for the corresponding server capability as well.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of declaration links.
    bool? linkSupport,
  }) = _DeclarationClientCapabilities;

  factory DeclarationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeclarationClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [DefinitionRequest].
@freezed
abstract class DefinitionClientCapabilities
    with _$DefinitionClientCapabilities {
  const factory DefinitionClientCapabilities({
    /// Whether definition supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of definition links.
    ///
    /// @since 3.14.0
    bool? linkSupport,
  }) = _DefinitionClientCapabilities;

  factory DefinitionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DefinitionClientCapabilitiesFromJson(json);
}

/// Since 3.6.0
@freezed
abstract class TypeDefinitionClientCapabilities
    with _$TypeDefinitionClientCapabilities {
  const factory TypeDefinitionClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `TypeDefinitionRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of definition links.
    ///
    /// Since 3.14.0
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
  const factory ImplementationClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `ImplementationRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of definition links.
    ///
    /// @since 3.14.0
    bool? linkSupport,
  }) = _ImplementationClientCapabilities;

  factory ImplementationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [ReferencesRequest].
@freezed
abstract class ReferenceClientCapabilities with _$ReferenceClientCapabilities {
  const factory ReferenceClientCapabilities({
    /// Whether references supports dynamic registration.
    bool? dynamicRegistration,
  }) = _ReferenceClientCapabilities;

  factory ReferenceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ReferenceClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [DocumentHighlightRequest].
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

/// Client Capabilities for a [DocumentSymbolRequest].
@freezed
abstract class DocumentSymbolClientCapabilities
    with _$DocumentSymbolClientCapabilities {
  const factory DocumentSymbolClientCapabilities({
    /// Whether document symbol supports dynamic registration.
    bool? dynamicRegistration,

    /// Specific capabilities for the `SymbolKind` in the
    /// `textDocument/documentSymbol` request.
    ({List<SymbolKind>? valueSet})? symbolKind,

    /// The client supports hierarchical document symbols.
    bool? hierarchicalDocumentSymbolSupport,

    /// The client supports tags on `SymbolInformation`. Tags are supported on
    /// `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
    /// Clients supporting tags have to handle unknown tags gracefully.
    ///
    /// @since 3.16.0
    ({List<SymbolTag> valueSet})? tagSupport,

    /// The client supports an additional label presented in the UI when registering
    /// a document symbol provider.
    ///
    /// @since 3.16.0
    bool? labelSupport,
  }) = _DocumentSymbolClientCapabilities;

  factory DocumentSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolClientCapabilitiesFromJson(json);
}

/// The Client Capabilities of a [CodeActionRequest].
@freezed
abstract class CodeActionClientCapabilities
    with _$CodeActionClientCapabilities {
  const factory CodeActionClientCapabilities({
    /// Whether code action supports dynamic registration.
    bool? dynamicRegistration,

    /// The client support code action literals of type `CodeAction` as a valid
    /// response of the `textDocument/codeAction` request. If the property is not
    /// set the request can only return `Command` literals.
    ///
    /// @since 3.8.0
    ({({List<CodeActionKind> valueSet}) codeActionKind})?
    codeActionLiteralSupport,

    /// Whether code action supports the `isPreferred` property.
    ///
    /// @since 3.15.0
    bool? isPreferredSupport,

    /// Whether code action supports the `disabled` property.
    ///
    /// @since 3.16.0
    bool? disabledSupport,

    /// Whether code action supports the `data` property which is preserved between
    /// a `textDocument/codeAction` and a `codeAction/resolve` request.
    ///
    /// @since 3.16.0
    bool? dataSupport,

    /// Whether the client supports resolving additional code action properties via
    /// a separate `codeAction/resolve` request.
    ///
    /// @since 3.16.0
    ({List<String> properties})? resolveSupport,

    /// Whether the client honors the change annotations in text edits and resource
    /// operations returned via the `CodeAction#edit` property by for example
    /// presenting the workspace edit in the user interface and asking for
    /// confirmation.
    ///
    /// @since 3.16.0
    bool? honorsChangeAnnotations,
  }) = _CodeActionClientCapabilities;

  factory CodeActionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeActionClientCapabilitiesFromJson(json);
}

/// The client capabilities  of a [CodeLensRequest].
@freezed
abstract class CodeLensClientCapabilities with _$CodeLensClientCapabilities {
  const factory CodeLensClientCapabilities({
    /// Whether code lens supports dynamic registration.
    bool? dynamicRegistration,
  }) = _CodeLensClientCapabilities;

  factory CodeLensClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeLensClientCapabilitiesFromJson(json);
}

/// The client capabilities of a [DocumentLinkRequest].
@freezed
abstract class DocumentLinkClientCapabilities
    with _$DocumentLinkClientCapabilities {
  const factory DocumentLinkClientCapabilities({
    /// Whether document link supports dynamic registration.
    bool? dynamicRegistration,

    /// Whether the client supports the `tooltip` property on `DocumentLink`.
    ///
    /// @since 3.15.0
    bool? tooltipSupport,
  }) = _DocumentLinkClientCapabilities;

  factory DocumentLinkClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentColorClientCapabilities
    with _$DocumentColorClientCapabilities {
  const factory DocumentColorClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `DocumentColorRegistrationOptions` return
    /// value for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _DocumentColorClientCapabilities;

  factory DocumentColorClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorClientCapabilitiesFromJson(json);
}

/// Client capabilities of a [DocumentFormattingRequest].
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

/// Client capabilities of a [DocumentRangeFormattingRequest].
@freezed
abstract class DocumentRangeFormattingClientCapabilities
    with _$DocumentRangeFormattingClientCapabilities {
  const factory DocumentRangeFormattingClientCapabilities({
    /// Whether range formatting supports dynamic registration.
    bool? dynamicRegistration,

    /// Whether the client supports formatting multiple ranges at once.
    ///
    /// @since 3.18.0 @proposed
    bool? rangesSupport,
  }) = _DocumentRangeFormattingClientCapabilities;

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingClientCapabilitiesFromJson(json);
}

/// Client capabilities of a [DocumentOnTypeFormattingRequest].
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
    /// Whether rename supports dynamic registration.
    bool? dynamicRegistration,

    /// Client supports testing for validity of rename operations before execution.
    ///
    /// @since 3.12.0
    bool? prepareSupport,

    /// Client supports the default behavior result.
    ///
    /// The value indicates the default behavior used by the client.
    ///
    /// @since 3.16.0
    PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior,

    /// Whether the client honors the change annotations in text edits and resource
    /// operations returned via the rename request's workspace edit by for example
    /// presenting the workspace edit in the user interface and asking for
    /// confirmation.
    ///
    /// @since 3.16.0
    bool? honorsChangeAnnotations,
  }) = _RenameClientCapabilities;

  factory RenameClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$RenameClientCapabilitiesFromJson(json);
}

@freezed
abstract class FoldingRangeClientCapabilities
    with _$FoldingRangeClientCapabilities {
  const factory FoldingRangeClientCapabilities({
    /// Whether implementation supports dynamic registration for folding range
    /// providers. If this is set to `true` the client supports the new
    /// `FoldingRangeRegistrationOptions` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,

    /// The maximum number of folding ranges that the client prefers to receive per
    /// document. The value serves as a hint, servers are free to follow the limit.
    int? rangeLimit,

    /// If set, the client signals that it only supports folding complete lines. If
    /// set, client will ignore specified `startCharacter` and `endCharacter`
    /// properties in a FoldingRange.
    bool? lineFoldingOnly,

    /// Specific options for the folding range kind.
    ///
    /// @since 3.17.0
    ({List<FoldingRangeKind>? valueSet})? foldingRangeKind,

    /// Specific options for the folding range.
    ///
    /// @since 3.17.0
    ({bool? collapsedText})? foldingRange,
  }) = _FoldingRangeClientCapabilities;

  factory FoldingRangeClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class SelectionRangeClientCapabilities
    with _$SelectionRangeClientCapabilities {
  const factory SelectionRangeClientCapabilities({
    /// Whether implementation supports dynamic registration for selection range
    /// providers. If this is set to `true` the client supports the new
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
    /// Whether the clients accepts diagnostics with related information.
    bool? relatedInformation,

    /// Client supports the tag property to provide meta data about a diagnostic.
    /// Clients supporting tags have to handle unknown tags gracefully.
    ///
    /// @since 3.15.0
    ({List<DiagnosticTag> valueSet})? tagSupport,

    /// Whether the client interprets the version property of the
    /// `textDocument/publishDiagnostics` notification's parameter.
    ///
    /// @since 3.15.0
    bool? versionSupport,

    /// Client supports a codeDescription property
    ///
    /// @since 3.16.0
    bool? codeDescriptionSupport,

    /// Whether code action supports the `data` property which is preserved between
    /// a `textDocument/publishDiagnostics` and `textDocument/codeAction` request.
    ///
    /// @since 3.16.0
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
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,

    /// Which requests the client supports and might send to the server depending on
    /// the server's capability. Please note that clients might not show semantic
    /// tokens or degrade some of the user experience if a range or full request is
    /// advertised by the client but not provided by the server. If for example the
    /// client capability `requests.full` and `request.range` are both set to true
    /// but the server only provides a range provider the client might not render a
    /// minimap correctly or might even decide to not show any semantic tokens at
    /// all.
    required ({Object? range, Object? full}) requests,

    /// The token types that the client supports.
    required List<String> tokenTypes,

    /// The token modifiers that the client supports.
    required List<String> tokenModifiers,

    /// The token formats the clients supports.
    required List<TokenFormat> formats,

    /// Whether the client supports tokens that can overlap each other.
    bool? overlappingTokenSupport,

    /// Whether the client supports tokens that can span multiple lines.
    bool? multilineTokenSupport,

    /// Whether the client allows the server to actively cancel a semantic token
    /// request, e.g. supports returning LSPErrorCodes.ServerCancelled. If a server
    /// does the client needs to retrigger the request.
    ///
    /// @since 3.17.0
    bool? serverCancelSupport,

    /// Whether the client uses semantic tokens to augment existing syntax tokens.
    /// If set to `true` client side created syntax tokens and semantic tokens are
    /// both used for colorization. If set to `false` the client only uses the
    /// returned semantic tokens for colorization.
    ///
    /// If the value is `undefined` then the client behavior is not specified.
    ///
    /// @since 3.17.0
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
///
/// @since 3.16.0
@freezed
abstract class MonikerClientCapabilities with _$MonikerClientCapabilities {
  const factory MonikerClientCapabilities({
    /// Whether moniker supports dynamic registration. If this is set to `true` the
    /// client supports the new `MonikerRegistrationOptions` return value for the
    /// corresponding server capability as well.
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
///
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
///
/// @since 3.17.0
@freezed
abstract class InlayHintClientCapabilities with _$InlayHintClientCapabilities {
  const factory InlayHintClientCapabilities({
    /// Whether inlay hints support dynamic registration.
    bool? dynamicRegistration,

    /// Indicates which properties a client can resolve lazily on an inlay hint.
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
  const factory DiagnosticClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,

    /// Whether the clients supports related documents for document diagnostic
    /// pulls.
    bool? relatedDocumentSupport,
  }) = _DiagnosticClientCapabilities;

  factory DiagnosticClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to inline completions.
///
/// @since 3.18.0 @proposed
@freezed
abstract class InlineCompletionClientCapabilities
    with _$InlineCompletionClientCapabilities {
  const factory InlineCompletionClientCapabilities({
    /// Whether implementation supports dynamic registration for inline completion
    /// providers.
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
  const factory NotebookDocumentSyncClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,

    /// The client supports sending execution summary data per cell.
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
  const factory ShowMessageRequestClientCapabilities({
    /// Capabilities specific to the `MessageActionItem` type.
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
  const factory ShowDocumentClientCapabilities({
    /// The client has support for the showDocument request.
    required bool support,
  }) = _ShowDocumentClientCapabilities;

  factory ShowDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to regular expressions.
///
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
///
/// @since 3.16.0
@freezed
abstract class MarkdownClientCapabilities with _$MarkdownClientCapabilities {
  const factory MarkdownClientCapabilities({
    /// The name of the parser.
    required String parser,

    /// The version of the parser.
    String? version,

    /// A list of HTML tags that the client allows / supports in Markdown.
    ///
    /// @since 3.17.0
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
