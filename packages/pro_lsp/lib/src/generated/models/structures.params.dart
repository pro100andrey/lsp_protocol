// GENERATED — do not edit.

part of 'structures.dart';

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

@freezed
abstract class ImplementationRegistrationOptions
    with _$ImplementationRegistrationOptions {
  const factory ImplementationRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
  }) = _TypeDefinitionRegistrationOptions;

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionRegistrationOptionsFromJson(json);
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

@freezed
abstract class DocumentColorRegistrationOptions
    with _$DocumentColorRegistrationOptions {
  const factory DocumentColorRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

@freezed
abstract class FoldingRangeRegistrationOptions
    with _$FoldingRangeRegistrationOptions {
  const factory FoldingRangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

@freezed
abstract class SelectionRangeRegistrationOptions
    with _$SelectionRangeRegistrationOptions {
  const factory SelectionRangeRegistrationOptions({
    bool? workDoneProgress,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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
    ///
    /// Type: bool | Object
    @_SemanticTokensRegistrationOptionsRangeConverter()
    SemanticTokensRegistrationOptionsRange? range,

    /// Server supports providing semantic tokens for a full document.
    ///
    /// Type: bool | Object
    @_SemanticTokensRegistrationOptionsFullConverter()
    SemanticTokensRegistrationOptionsFull? full,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

    /// The result id of a previous response. The result Id can either point to
    /// a full response or a delta response depending on what was received last.
    required String previousResultId,
  }) = _SemanticTokensDeltaParams;

  factory SemanticTokensDeltaParams.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensDeltaParamsFromJson(json);
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

    /// Indicates to show the resource in an external program. To show, for
    /// example, `https://code.visualstudio.com/` in the default WEB browser set
    /// `external` to `true`.
    bool? external,

    /// An optional property to indicate whether the editor showing the document
    /// should take focus or not. Clients might ignore this property if an
    /// external program is started.
    bool? takeFocus,

    /// An optional selection range if the document is a text document. Clients
    /// might ignore the property if an external program is started or the file
    /// is not a text file.
    Range? selection,
  }) = _ShowDocumentParams;

  factory ShowDocumentParams.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentParamsFromJson(json);
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

@freezed
abstract class LinkedEditingRangeRegistrationOptions
    with _$LinkedEditingRangeRegistrationOptions {
  const factory LinkedEditingRangeRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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
    /// An array of all files/folders renamed in this operation. When a folder
    /// is renamed, only the folder will be included, and not its children.
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

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

/// Inlay hint options used during static or dynamic registration.
///
/// @since 3.17.0
@freezed
abstract class InlayHintRegistrationOptions
    with _$InlayHintRegistrationOptions {
  const factory InlayHintRegistrationOptions({
    bool? workDoneProgress,

    /// The server provides support to resolve additional information for an
    /// inlay hint item.
    bool? resolveProvider,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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

    /// The additional identifier provided during registration.
    String? identifier,

    /// The result id of a previous response if provided.
    String? previousResultId,
  }) = _DocumentDiagnosticParams;

  factory DocumentDiagnosticParams.fromJson(Map<String, dynamic> json) =>
      _$DocumentDiagnosticParamsFromJson(json);
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
    /// document content of a cell changes the notebook version doesn't
    /// necessarily have to change.
    required VersionedNotebookDocumentIdentifier notebookDocument,

    /// The actual changes to the notebook document.
    ///
    /// The changes describe single state changes to the notebook document. So
    /// if there are two changes c1 (at array index 0) and c2 (at array index 1)
    /// for a notebook in state S then c1 moves the notebook from S to S' and c2
    /// from S' to S''. So c1 is computed on the state S and c2 is computed on
    /// the state S'.
    ///
    /// To mirror the content of a notebook using change events use the
    /// following approach: - start with the same initial content - apply the
    /// 'notebookDocument/didChange' notifications in the order you receive
    /// them. - apply the `NotebookChangeEvent`s in a single notification in the
    /// order you receive them.
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

    /// The text documents that represent the content of a notebook cell that
    /// got closed.
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
  const factory InlineCompletionParams({
    /// The text document.
    required TextDocumentIdentifier textDocument,

    /// The position inside the text document.
    required Position position,

    /// An optional token that a server can use to report work done progress.
    @_ProgressTokenConverter() ProgressToken? workDoneToken,

    /// Additional information about the context in which inline completions
    /// were requested.
    required InlineCompletionContext context,
  }) = _InlineCompletionParams;

  factory InlineCompletionParams.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionParamsFromJson(json);
}

/// Inline completion options used during static or dynamic registration.
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionRegistrationOptions
    with _$InlineCompletionRegistrationOptions {
  const factory InlineCompletionRegistrationOptions({
    bool? workDoneProgress,

    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
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
    ({String name, String? version})? clientInfo,

    /// The locale the client is currently showing the user interface in. This
    /// must not necessarily be the locale of the operating system.
    ///
    /// Uses IETF language tags as the value's syntax (See
    /// https://en.wikipedia.org/wiki/IETF_language_tag)
    String? locale,

    /// The rootPath of the workspace. Is null if no folder is open.
    ///
    /// @deprecated in favour of rootUri.
    @Deprecated('in favour of rootUri.') String? rootPath,

    /// The rootUri of the workspace. Is null if no folder is open. If both
    /// `rootPath` and `rootUri` are set `rootUri` wins.
    ///
    /// @deprecated in favour of workspaceFolders.
    @Deprecated('in favour of workspaceFolders.') required String? rootUri,

    /// The capabilities provided by the client (editor or tool)
    required ClientCapabilities capabilities,

    /// User provided initialization options.
    LSPAny? initializationOptions,

    /// The initial trace setting. If omitted trace is disabled ('off').
    TraceValues? trace,

    /// The workspace folders configured in the client when the server starts.
    ///
    /// This property is only available if the client supports workspace
    /// folders. It can be `null` if the client supports workspace folders but
    /// none are configured.
    List<WorkspaceFolder>? workspaceFolders,
  }) = _InitializeParams;

  factory InitializeParams.fromJson(Map<String, dynamic> json) =>
      _$InitializeParamsFromJson(json);
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
    /// The document that did change. The version number points to the version
    /// after all provided content changes have been applied.
    required VersionedTextDocumentIdentifier textDocument,

    /// The actual content changes. The content changes describe single state
    /// changes to the document. So if there are two content changes c1 (at
    /// array index 0) and c2 (at array index 1) for a document in state S then
    /// c1 moves the document from S to S' and c2 from S' to S''. So c1 is
    /// computed on the state S and c2 is computed on the state S'.
    ///
    /// To mirror the content of a document using change events use the
    /// following approach: - start with the same initial content - apply the
    /// 'textDocument/didChange' notifications in the order you receive them. -
    /// apply the `TextDocumentContentChangeEvent`s in a single notification in
    /// the order you receive them.
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

    /// Optional the version number of the document the diagnostics are
    /// published for.
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

    /// The completion context. This is only available if the client specifies
    /// to send this using the client capability
    /// `textDocument.completion.contextSupport === true`
    CompletionContext? context,
  }) = _CompletionParams;

  factory CompletionParams.fromJson(Map<String, dynamic> json) =>
      _$CompletionParamsFromJson(json);
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
    /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
    /// they do so when the user starts to type an identifier. For example if
    /// the user types `c` in a JavaScript file code complete will automatically
    /// pop up present `console` besides others as a completion item. Characters
    /// that make up identifiers don't need to be listed here.
    ///
    /// If code complete should automatically be trigger on characters not being
    /// valid inside an identifier (for example `.` in JavaScript) list them in
    /// `triggerCharacters`.
    List<String>? triggerCharacters,

    /// The list of all possible characters that commit a completion. This field
    /// can be used if clients don't support individual commit characters per
    /// completion item. See
    /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    ///
    /// If a server provides both `allCommitCharacters` and commit characters on
    /// an individual completion item the ones on the completion item win.
    List<String>? allCommitCharacters,

    /// The server provides support to resolve additional information for a
    /// completion item.
    bool? resolveProvider,

    /// The server supports the following `CompletionItem` specific
    /// capabilities.
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

    /// The signature help context. This is only available if the client
    /// specifies to send this using the client capability
    /// `textDocument.signatureHelp.contextSupport === true`
    SignatureHelpContext? context,
  }) = _SignatureHelpParams;

  factory SignatureHelpParams.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpParamsFromJson(json);
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
    /// showing. All trigger characters are also counted as re-trigger
    /// characters.
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

/// Registration options for a [DocumentSymbolRequest].
@freezed
abstract class DocumentSymbolRegistrationOptions
    with _$DocumentSymbolRegistrationOptions {
  const factory DocumentSymbolRegistrationOptions({
    /// A document selector to identify the scope of the registration. If set to
    /// null the document selector provided on the client side will be used.
    required DocumentSelector? documentSelector,
    bool? workDoneProgress,

    /// A human-readable string that is shown when multiple outlines trees are
    /// shown for the same document.
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
    /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
    /// the server may list out every specific kind they provide.
    List<CodeActionKind>? codeActionKinds,

    /// The server provides support to resolve additional information for a code
    /// action.
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

    /// A query string to filter symbols by. Clients may send an empty string
    /// here to request all symbols.
    required String query,
  }) = _WorkspaceSymbolParams;

  factory WorkspaceSymbolParams.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolParamsFromJson(json);
}

/// Registration options for a [WorkspaceSymbolRequest].
@freezed
abstract class WorkspaceSymbolRegistrationOptions
    with _$WorkspaceSymbolRegistrationOptions {
  const factory WorkspaceSymbolRegistrationOptions({
    bool? workDoneProgress,

    /// The server provides support to resolve additional information for a
    /// workspace symbol.
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
    bool? rangesSupport,
  }) = _DocumentRangeFormattingRegistrationOptions;

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingRegistrationOptionsFromJson(json);
}

/// The parameters of a [DocumentRangesFormattingRequest].
///
/// @since 3.18.0
/// @proposed
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

    /// The new name of the symbol. If the given name is not valid the request
    /// must return a [ResponseError] with an appropriate message set.
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
    /// 3.12.0
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
    /// An optional label of the workspace edit. This label is presented in the
    /// user interface for example on an undo stack to undo the workspace edit.
    String? label,

    /// The edits to apply.
    required WorkspaceEdit edit,
  }) = _ApplyWorkspaceEditParams;

  factory ApplyWorkspaceEditParams.fromJson(Map<String, dynamic> json) =>
      _$ApplyWorkspaceEditParamsFromJson(json);
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
    ///
    /// Type: int | String
    @_CancelParamsIdConverter() required CancelParamsId id,
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
    ///
    /// Type: bool | Object
    @_SemanticTokensOptionsRangeConverter() SemanticTokensOptionsRange? range,

    /// Server supports providing semantic tokens for a full document.
    ///
    /// Type: bool | Object
    @_SemanticTokensOptionsFullConverter() SemanticTokensOptionsFull? full,
  }) = _SemanticTokensOptions;

  factory SemanticTokensOptions.fromJson(Map<String, dynamic> json) =>
      _$SemanticTokensOptionsFromJson(json);
}

@freezed
abstract class LinkedEditingRangeOptions with _$LinkedEditingRangeOptions {
  const factory LinkedEditingRangeOptions({bool? workDoneProgress}) =
      _LinkedEditingRangeOptions;

  factory LinkedEditingRangeOptions.fromJson(Map<String, dynamic> json) =>
      _$LinkedEditingRangeOptionsFromJson(json);
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

/// Inlay hint options used during static registration.
///
/// @since 3.17.0
@freezed
abstract class InlayHintOptions with _$InlayHintOptions {
  const factory InlayHintOptions({
    bool? workDoneProgress,

    /// The server provides support to resolve additional information for an
    /// inlay hint item.
    bool? resolveProvider,
  }) = _InlayHintOptions;

  factory InlayHintOptions.fromJson(Map<String, dynamic> json) =>
      _$InlayHintOptionsFromJson(json);
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

    /// Whether the language has inter file dependencies meaning that editing
    /// code in one file can result in a different diagnostic set in another
    /// file. Inter file dependencies are common for most programming languages
    /// and typically uncommon for linters.
    required bool interFileDependencies,

    /// The server provides support for workspace diagnostics as well.
    required bool workspaceDiagnostics,
  }) = _DiagnosticOptions;

  factory DiagnosticOptions.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticOptionsFromJson(json);
}

/// Inline completion options used during static registration.
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionOptions with _$InlineCompletionOptions {
  const factory InlineCompletionOptions({bool? workDoneProgress}) =
      _InlineCompletionOptions;

  factory InlineCompletionOptions.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionOptionsFromJson(json);
}

@freezed
abstract class WorkspaceFoldersInitializeParams
    with _$WorkspaceFoldersInitializeParams {
  const factory WorkspaceFoldersInitializeParams({
    /// The workspace folders configured in the client when the server starts.
    ///
    /// This property is only available if the client supports workspace
    /// folders. It can be `null` if the client supports workspace folders but
    /// none are configured.
    List<WorkspaceFolder>? workspaceFolders,
  }) = _WorkspaceFoldersInitializeParams;

  factory WorkspaceFoldersInitializeParams.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersInitializeParamsFromJson(json);
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

/// Completion options.
@freezed
abstract class CompletionOptions with _$CompletionOptions {
  const factory CompletionOptions({
    bool? workDoneProgress,

    /// Most tools trigger completion request automatically without explicitly
    /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
    /// they do so when the user starts to type an identifier. For example if
    /// the user types `c` in a JavaScript file code complete will automatically
    /// pop up present `console` besides others as a completion item. Characters
    /// that make up identifiers don't need to be listed here.
    ///
    /// If code complete should automatically be trigger on characters not being
    /// valid inside an identifier (for example `.` in JavaScript) list them in
    /// `triggerCharacters`.
    List<String>? triggerCharacters,

    /// The list of all possible characters that commit a completion. This field
    /// can be used if clients don't support individual commit characters per
    /// completion item. See
    /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    ///
    /// If a server provides both `allCommitCharacters` and commit characters on
    /// an individual completion item the ones on the completion item win.
    List<String>? allCommitCharacters,

    /// The server provides support to resolve additional information for a
    /// completion item.
    bool? resolveProvider,

    /// The server supports the following `CompletionItem` specific
    /// capabilities.
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
    /// showing. All trigger characters are also counted as re-trigger
    /// characters.
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

/// Provider options for a [DocumentSymbolRequest].
@freezed
abstract class DocumentSymbolOptions with _$DocumentSymbolOptions {
  const factory DocumentSymbolOptions({
    bool? workDoneProgress,

    /// A human-readable string that is shown when multiple outlines trees are
    /// shown for the same document.
    String? label,
  }) = _DocumentSymbolOptions;

  factory DocumentSymbolOptions.fromJson(Map<String, dynamic> json) =>
      _$DocumentSymbolOptionsFromJson(json);
}

/// Provider options for a [CodeActionRequest].
@freezed
abstract class CodeActionOptions with _$CodeActionOptions {
  const factory CodeActionOptions({
    bool? workDoneProgress,

    /// CodeActionKinds that this server may return.
    ///
    /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
    /// the server may list out every specific kind they provide.
    List<CodeActionKind>? codeActionKinds,

    /// The server provides support to resolve additional information for a code
    /// action.
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
    bool? trimTrailingWhitespace,

    /// Insert a newline character at the end of the file if one does not exist.
    bool? insertFinalNewline,

    /// Trim all newlines after the final newline at the end of the file.
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
    /// 3.12.0
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

@freezed
abstract class TextDocumentSyncOptions with _$TextDocumentSyncOptions {
  const factory TextDocumentSyncOptions({
    /// Open and close notifications are sent to the server. If omitted open
    /// close notification should not be sent.
    bool? openClose,

    /// Change notifications are sent to the server. See
    /// TextDocumentSyncKind.None, TextDocumentSyncKind.Full and
    /// TextDocumentSyncKind.Incremental. If omitted it defaults to
    /// TextDocumentSyncKind.None.
    TextDocumentSyncKind? change,

    /// If present will save notifications are sent to the server. If omitted
    /// the notification should not be sent.
    bool? willSave,

    /// If present will save wait until requests are sent to the server. If
    /// omitted the request should not be sent.
    bool? willSaveWaitUntil,

    /// If present save notifications are sent to the server. If omitted the
    /// notification should not be sent.
    ///
    /// Type: bool | SaveOptions
    @_TextDocumentSyncOptionsSaveConverter() TextDocumentSyncOptionsSave? save,
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

    /// Whether save notification should be forwarded to the server. Will only
    /// be honored if mode === `notebook`.
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

    /// Whether save notification should be forwarded to the server. Will only
    /// be honored if mode === `notebook`.
    bool? save,

    /// The id used to register the request. The id can be used to deregister
    /// the request again. See also Registration#id.
    String? id,
  }) = _NotebookDocumentSyncRegistrationOptions;

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncRegistrationOptionsFromJson(json);
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
