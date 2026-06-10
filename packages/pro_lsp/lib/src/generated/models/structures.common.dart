// GENERATED — do not edit.

part of 'structures.dart';

/// Represents a location inside a resource, such as a line inside a text file.
@freezed
abstract class Location with _$Location {
  const factory Location({required String uri, required Range range}) =
      _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

/// A workspace folder inside a client.
@freezed
abstract class WorkspaceFolder with _$WorkspaceFolder {
  const factory WorkspaceFolder({
    /// The associated URI for this workspace folder.
    required String uri,

    /// The name of the workspace folder. Used to refer to this workspace folder
    /// in the user interface.
    required String name,
  }) = _WorkspaceFolder;

  factory WorkspaceFolder.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFolderFromJson(json);
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
abstract class ColorPresentation with _$ColorPresentation {
  const factory ColorPresentation({
    /// The label of this color presentation. It will be shown on the color
    /// picker header. By default this is also the text that is inserted when
    /// selecting this color presentation.
    required String label,

    /// An [edit] which is applied to a document when selecting this
    /// presentation for the color. When `falsy` the [label] is used.
    TextEdit? textEdit,

    /// An optional array of additional [TextEdit] that are applied when
    /// selecting this color presentation. Edits must not overlap with the main
    /// [edit] nor with themselves.
    List<TextEdit>? additionalTextEdits,
  }) = _ColorPresentation;

  factory ColorPresentation.fromJson(Map<String, dynamic> json) =>
      _$ColorPresentationFromJson(json);
}

/// Represents a folding range. To be valid, start and end line must be bigger
/// than zero and smaller than the number of lines in the document. Clients are
/// free to ignore invalid ranges.
@freezed
abstract class FoldingRange with _$FoldingRange {
  const factory FoldingRange({
    /// The zero-based start line of the range to fold. The folded area starts
    /// after the line's last character. To be valid, the end must be zero or
    /// larger and smaller than the number of lines in the document.
    required int startLine,

    /// The zero-based character offset from where the folded range starts. If
    /// not defined, defaults to the length of the start line.
    int? startCharacter,

    /// The zero-based end line of the range to fold. The folded area ends with
    /// the line's last character. To be valid, the end must be zero or larger
    /// and smaller than the number of lines in the document.
    required int endLine,

    /// The zero-based character offset before the folded range ends. If not
    /// defined, defaults to the length of the end line.
    int? endCharacter,

    /// Describes the kind of the folding range such as `comment' or 'region'.
    /// The kind is used to categorize folding ranges and used by commands like
    /// 'Fold all comments'. See [FoldingRangeKind] for an enumeration of
    /// standardized kinds.
    FoldingRangeKind? kind,

    /// The text that the client should show when the specified range is
    /// collapsed. If not defined or not supported by the client, a default will
    /// be chosen by the client.
    String? collapsedText,
  }) = _FoldingRange;

  factory FoldingRange.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeFromJson(json);
}

/// A selection range represents a part of a selection hierarchy. A selection
/// range may have a parent selection range that contains it.
@freezed
abstract class SelectionRange with _$SelectionRange {
  const factory SelectionRange({
    /// The [range] of this selection range.
    required Range range,

    /// The parent selection range containing this range. Therefore
    /// `parent.range` must contain `this.range`.
    SelectionRange? parent,
  }) = _SelectionRange;

  factory SelectionRange.fromJson(Map<String, dynamic> json) =>
      _$SelectionRangeFromJson(json);
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

    /// The range enclosing this symbol not including leading/trailing
    /// whitespace but everything else, e.g. comments and code.
    required Range range,

    /// The range that should be selected and revealed when this symbol is being
    /// picked, e.g. the name of a function. Must be contained by the [range].
    required Range selectionRange,

    /// A data entry field that is preserved between a call hierarchy prepare
    /// and incoming calls or outgoing calls requests.
    LSPAny? data,
  }) = _CallHierarchyItem;

  factory CallHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyItemFromJson(json);
}

/// Represents an incoming call, e.g. a caller of a method or constructor.
///
/// @since 3.16.0
@freezed
abstract class CallHierarchyIncomingCall with _$CallHierarchyIncomingCall {
  const factory CallHierarchyIncomingCall({
    /// The item that makes the call.
    required CallHierarchyItem from,

    /// The ranges at which the calls appear. This is relative to the caller
    /// denoted by [CallHierarchyIncomingCall].
    required List<Range> fromRanges,
  }) = _CallHierarchyIncomingCall;

  factory CallHierarchyIncomingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyIncomingCallFromJson(json);
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

    /// The range at which this item is called. This is the range relative to
    /// the caller, e.g the item passed to [provideCallHierarchyOutgoingCalls]
    /// and not [CallHierarchyOutgoingCall].
    required List<Range> fromRanges,
  }) = _CallHierarchyOutgoingCall;

  factory CallHierarchyOutgoingCall.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyOutgoingCallFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokens with _$SemanticTokens {
  const factory SemanticTokens({
    /// An optional result id. If provided and clients support delta updating
    /// the client will include the result id in the next semantic token
    /// request. A server can then instead of computing all semantic tokens
    /// again simply send a delta.
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
abstract class SemanticTokensDelta with _$SemanticTokensDelta {
  const factory SemanticTokensDelta({
    String? resultId,

    /// The semantic token edits to transform a previous result into a new
    /// result.
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

/// The result of a linked editing range request.
///
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
    /// `workspace.workspaceEdit.resourceOperations` document changes are either
    /// an array of `TextDocumentEdit`s to express changes to n different text
    /// documents where each text document edit addresses a specific version of
    /// a text document. Or it can contain above `TextDocumentEdit`s mixed with
    /// create, rename and delete file / folder operations.
    ///
    /// Whether a client supports versioned document edits is expressed via
    /// `workspace.workspaceEdit.documentChanges` client capability.
    ///
    /// If a client neither supports `documentChanges` nor
    /// `workspace.workspaceEdit.resourceOperations` then only plain `TextEdit`s
    /// using the `changes` property are supported.
    List<Object>? documentChanges,

    /// A map of change annotations that can be referenced in
    /// `AnnotatedTextEdit`s or create, rename and delete file / folder
    /// operations.
    ///
    /// Whether clients honor this property depends on the client capability
    /// `workspace.changeAnnotationSupport`.
    Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations,
  }) = _WorkspaceEdit;

  factory WorkspaceEdit.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditFromJson(json);
}

/// Moniker definition to match LSIF 0.5 moniker definition.
///
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

    /// The range enclosing this symbol not including leading/trailing
    /// whitespace but everything else, e.g. comments and code.
    required Range range,

    /// The range that should be selected and revealed when this symbol is being
    /// picked, e.g. the name of a function. Must be contained by the [range].
    required Range selectionRange,

    /// A data entry field that is preserved between a type hierarchy prepare
    /// and supertypes or subtypes requests. It could also be used to identify
    /// the type hierarchy in the server, helping improve the performance on
    /// resolving supertypes and subtypes.
    LSPAny? data,
  }) = _TypeHierarchyItem;

  factory TypeHierarchyItem.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyItemFromJson(json);
}

/// Inlay hint information.
///
/// @since 3.17.0
@freezed
abstract class InlayHint with _$InlayHint {
  const factory InlayHint({
    /// The position of this hint.
    ///
    /// If multiple hints have the same position, they will be shown in the
    /// order they appear in the response.
    required Position position,

    /// The label of this hint. A human readable string or an array of
    /// InlayHintLabelPart label parts.
    ///
    /// *Note* that neither the string nor the label part can be empty.
    ///
    /// Type: String | List<InlayHintLabelPart>
    required Object label,

    /// The kind of this hint. Can be omitted in which case the client should
    /// fall back to a reasonable default.
    InlayHintKind? kind,

    /// Optional text edits that are performed when accepting this inlay hint.
    ///
    /// *Note* that edits are expected to change the document so that the inlay
    /// hint (or its nearest variant) is now part of the document and the inlay
    /// hint itself is now obsolete.
    List<TextEdit>? textEdits,

    /// The tooltip text when you hover over this item.
    ///
    /// Type: String | MarkupContent
    @_InlayHintTooltipConverter() InlayHintTooltip? tooltip,

    /// Render padding before the hint.
    ///
    /// Note: Padding should use the editor's background color, not the
    /// background color of the hint itself. That means padding can be used to
    /// visually align/separate an inlay hint.
    bool? paddingLeft,

    /// Render padding after the hint.
    ///
    /// Note: Padding should use the editor's background color, not the
    /// background color of the hint itself. That means padding can be used to
    /// visually align/separate an inlay hint.
    bool? paddingRight,

    /// A data entry field that is preserved on an inlay hint between a
    /// `textDocument/inlayHint` and a `inlayHint/resolve` request.
    LSPAny? data,
  }) = _InlayHint;

  factory InlayHint.fromJson(Map<String, dynamic> json) =>
      _$InlayHintFromJson(json);
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

/// Represents a collection of [InlineCompletionItem] to be presented in the
/// editor.
///
/// @since 3.18.0
/// @proposed
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
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionItem with _$InlineCompletionItem {
  const factory InlineCompletionItem({
    /// The text to replace the range with. Must be set.
    ///
    /// Type: String | StringValue
    @_InlineCompletionItemInsertTextConverter()
    required InlineCompletionItemInsertText insertText,

    /// A text that is used to decide if this inline completion should be shown.
    /// When `falsy` the [InlineCompletionItem.insertText] is used.
    String? filterText,

    /// The range to replace. Must begin and end on the same line.
    Range? range,

    /// An optional [Command] that is executed *after* inserting this
    /// completion.
    Command? command,
  }) = _InlineCompletionItem;

  factory InlineCompletionItem.fromJson(Map<String, dynamic> json) =>
      _$InlineCompletionItemFromJson(json);
}

/// The result returned from an initialize request.
@freezed
abstract class InitializeResult with _$InitializeResult {
  const factory InitializeResult({
    /// The capabilities the language server provides.
    required ServerCapabilities capabilities,

    /// Information about the server.
    ({String name, String? version})? serverInfo,
  }) = _InitializeResult;

  factory InitializeResult.fromJson(Map<String, dynamic> json) =>
      _$InitializeResultFromJson(json);
}

/// The data type of the ResponseError if the initialize request fails.
@freezed
abstract class InitializeError with _$InitializeError {
  const factory InitializeError({
    /// Indicates whether the client execute the following retry logic: (1) show
    /// the message provided by the ResponseError to the user (2) user selects
    /// retry or cancel (3) if user selected retry the initialize method is sent
    /// again.
    required bool retry,
  }) = _InitializeError;

  factory InitializeError.fromJson(Map<String, dynamic> json) =>
      _$InitializeErrorFromJson(json);
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
    /// If label details are provided the label itself should be an unqualified
    /// name of the completion item.
    required String label,

    /// Additional details for the label
    CompletionItemLabelDetails? labelDetails,

    /// The kind of this completion item. Based of the kind an icon is chosen by
    /// the editor.
    CompletionItemKind? kind,

    /// Tags for this completion item.
    List<CompletionItemTag>? tags,

    /// A human-readable string with additional information about this item,
    /// like type or symbol information.
    String? detail,

    /// A human-readable string that represents a doc-comment.
    ///
    /// Type: String | MarkupContent
    @_CompletionItemDocumentationConverter()
    CompletionItemDocumentation? documentation,

    /// Indicates if this item is deprecated. @deprecated Use `tags` instead.
    @Deprecated('Use `tags` instead.') bool? deprecated,

    /// Select this item when showing.
    ///
    /// *Note* that only one completion item can be selected and that the tool /
    /// client decides which item that is. The rule is that the *first* item of
    /// those that match best is selected.
    bool? preselect,

    /// A string that should be used when comparing this item with other items.
    /// When `falsy` the [label] is used.
    String? sortText,

    /// A string that should be used when filtering a set of completion items.
    /// When `falsy` the [label] is used.
    String? filterText,

    /// A string that should be inserted into a document when selecting this
    /// completion. When `falsy` the [label] is used.
    ///
    /// The `insertText` is subject to interpretation by the client side. Some
    /// tools might not take the string literally. For example VS Code when code
    /// complete is requested in this example `con<cursor position>` and a
    /// completion item with an `insertText` of `console` is provided it will
    /// only insert `sole`. Therefore it is recommended to use `textEdit`
    /// instead since it avoids additional client side interpretation.
    String? insertText,

    /// The format of the insert text. The format applies to both the
    /// `insertText` property and the `newText` property of a provided
    /// `textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
    ///
    /// Please note that the insertTextFormat doesn't apply to
    /// `additionalTextEdits`.
    InsertTextFormat? insertTextFormat,

    /// How whitespace and indentation is handled during completion item
    /// insertion. If not provided the clients default value depends on the
    /// `textDocument.completion.insertTextMode` client capability.
    InsertTextMode? insertTextMode,

    /// An [edit] which is applied to a document when selecting this completion.
    /// When an edit is provided the value of [insertText] is ignored.
    ///
    /// Most editors support two different operations when accepting a
    /// completion item. One is to insert a completion text and the other is to
    /// replace an existing text with a completion text. Since this can usually
    /// not be predetermined by a server it can report both ranges. Clients need
    /// to signal support for `InsertReplaceEdits` via the
    /// `textDocument.completion.insertReplaceSupport` client capability
    /// property.
    ///
    /// *Note 1:* The text edit's range as well as both ranges from an insert
    /// replace edit must be a [single line] and they must contain the position
    /// at which completion has been requested. *Note 2:* If an
    /// `InsertReplaceEdit` is returned the edit's insert range must be a prefix
    /// of the edit's replace range, that means it must be contained and
    /// starting at the same position.
    ///
    /// additional type `InsertReplaceEdit`
    ///
    /// Type: TextEdit | InsertReplaceEdit
    @_CompletionItemTextEditConverter() CompletionItemTextEdit? textEdit,

    /// The edit text used if the completion item is part of a CompletionList
    /// and CompletionList defines an item default for the text edit range.
    ///
    /// Clients will only honor this property if they opt into completion list
    /// item defaults using the capability `completionList.itemDefaults`.
    ///
    /// If not provided and a list's default range is provided the label
    /// property is used as a text.
    String? textEditText,

    /// An optional array of additional [TextEdit] that are applied when
    /// selecting this completion. Edits must not overlap (including the same
    /// insert position) with the main [edit] nor with themselves.
    ///
    /// Additional text edits should be used to change text unrelated to the
    /// current cursor position (for example adding an import statement at the
    /// top of the file if the completion item will insert an unqualified type).
    List<TextEdit>? additionalTextEdits,

    /// An optional set of characters that when pressed while this completion is
    /// active will accept it first and then type that character. *Note* that
    /// all commit characters should have `length=1` and that superfluous
    /// characters will be ignored.
    List<String>? commitCharacters,

    /// An optional [command] that is executed *after* inserting this
    /// completion. *Note* that additional modifications to the current document
    /// should be described with the [additionalTextEdits]-property.
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
    /// This list it not complete. Further typing results in recomputing this
    /// list.
    ///
    /// Recomputed lists have all their items replaced (not appended) in the
    /// incomplete completion sessions.
    required bool isIncomplete,

    /// In many cases the items of an actual completion result share the same
    /// value for properties like `commitCharacters` or the range of a text
    /// edit. A completion list can therefore define item defaults which will be
    /// used if a completion item itself doesn't specify the value.
    ///
    /// If a completion list specifies a default value and a completion item
    /// also specifies a corresponding value the one from the item is used.
    ///
    /// Servers are only allowed to return default values if the client signals
    /// support for this via the `completionList.itemDefaults` capability.
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

/// The result of a hover request.
@freezed
abstract class Hover with _$Hover {
  const factory Hover({
    /// The hover's content
    ///
    /// Type: MarkupContent | MarkedString | List<MarkedString>
    required Object contents,

    /// An optional range inside the text document that is used to visualize the
    /// hover, e.g. by changing the background color.
    Range? range,
  }) = _Hover;

  factory Hover.fromJson(Map<String, dynamic> json) => _$HoverFromJson(json);
}

/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
@freezed
abstract class SignatureHelp with _$SignatureHelp {
  const factory SignatureHelp({
    /// One or more signatures.
    required List<SignatureInformation> signatures,

    /// The active signature. If omitted or the value lies outside the range of
    /// `signatures` the value defaults to zero or is ignored if the
    /// `SignatureHelp` has no signatures.
    ///
    /// Whenever possible implementors should make an active decision about the
    /// active signature and shouldn't rely on a default value.
    ///
    /// In future version of the protocol this property might become mandatory
    /// to better express this.
    int? activeSignature,

    /// The active parameter of the active signature. If omitted or the value
    /// lies outside the range of `signatures[activeSignature].parameters`
    /// defaults to 0 if the active signature has parameters. If the active
    /// signature has no parameters it is ignored. In future version of the
    /// protocol this property might become mandatory to better express the
    /// active parameter if the active signature does have any.
    int? activeParameter,
  }) = _SignatureHelp;

  factory SignatureHelp.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpFromJson(json);
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
    List<SymbolTag>? tags,

    /// The name of the symbol containing this symbol. This information is for
    /// user interface purposes (e.g. to render a qualifier in the user
    /// interface if necessary). It can't be used to re-infer a hierarchy for
    /// the document symbols.
    String? containerName,

    /// Indicates if this symbol is deprecated.
    ///
    /// @deprecated Use tags instead
    @Deprecated('Use tags instead') bool? deprecated,

    /// The location of this symbol. The location's range is used by a tool to
    /// reveal the location in the editor. If the symbol is selected in the tool
    /// the range's start information is used to position the cursor. So the
    /// range usually spans more than the actual symbol's name and does normally
    /// include things like visibility modifiers.
    ///
    /// The range doesn't have to denote a node range in the sense of an
    /// abstract syntax tree. It can therefore not be used to re-construct a
    /// hierarchy of the symbols.
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
    /// therefore must not be an empty string or a string only consisting of
    /// white spaces.
    required String name,

    /// More detail for this symbol, e.g the signature of a function.
    String? detail,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// Tags for this document symbol.
    List<SymbolTag>? tags,

    /// Indicates if this symbol is deprecated.
    ///
    /// @deprecated Use tags instead
    @Deprecated('Use tags instead') bool? deprecated,

    /// The range enclosing this symbol not including leading/trailing
    /// whitespace but everything else like comments. This information is
    /// typically used to determine if the clients cursor is inside the symbol
    /// to reveal in the symbol in the UI.
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
  const factory CodeAction({
    /// A short, human-readable, title for this code action.
    required String title,

    /// The kind of the code action.
    ///
    /// Used to filter code actions.
    CodeActionKind? kind,

    /// The diagnostics that this code action resolves.
    List<Diagnostic>? diagnostics,

    /// Marks this as a preferred action. Preferred actions are used by the
    /// `auto fix` command and can be targeted by keybindings.
    ///
    /// A quick fix should be marked preferred if it properly addresses the
    /// underlying error. A refactoring should be marked preferred if it is the
    /// most reasonable choice of actions to take.
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
    /// - Disabled actions are shown as faded out in the code action menu when
    /// the user requests a more specific type of code action, such as
    /// refactorings.
    ///
    /// - If the user has a
    /// [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
    /// that auto applies a code action and only disabled code actions are
    /// returned, the client should show the user an error message with `reason`
    /// in the editor.
    ({String reason})? disabled,

    /// The workspace edit this code action performs.
    WorkspaceEdit? edit,

    /// A command this code action executes. If a code action provides an edit
    /// and a command, first the edit is executed and then the command.
    Command? command,

    /// A data entry field that is preserved on a code action between a
    /// `textDocument/codeAction` and a `codeAction/resolve` request.
    LSPAny? data,
  }) = _CodeAction;

  factory CodeAction.fromJson(Map<String, dynamic> json) =>
      _$CodeActionFromJson(json);
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
    List<SymbolTag>? tags,

    /// The name of the symbol containing this symbol. This information is for
    /// user interface purposes (e.g. to render a qualifier in the user
    /// interface if necessary). It can't be used to re-infer a hierarchy for
    /// the document symbols.
    String? containerName,

    /// The location of the symbol. Whether a server is allowed to return a
    /// location without a range depends on the client capability
    /// `workspace.symbol.resolveSupport`.
    ///
    /// See SymbolInformation#location for more details.
    ///
    /// Type: Location | Object
    @_WorkspaceSymbolLocationConverter()
    required WorkspaceSymbolLocation location,

    /// A data entry field that is preserved on a workspace symbol between a
    /// workspace symbol request and a workspace symbol resolve request.
    LSPAny? data,
  }) = _WorkspaceSymbol;

  factory WorkspaceSymbol.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSymbolFromJson(json);
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
    /// The range in which this code lens is valid. Should only span a single
    /// line.
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
    /// instructions on how to trigger the link, such as `{0} (ctrl + click)`.
    /// The specific instructions vary depending on OS, user settings, and
    /// localization.
    String? tooltip,

    /// A data entry field that is preserved on a document link between a
    /// DocumentLinkRequest and a DocumentLinkResolveRequest.
    LSPAny? data,
  }) = _DocumentLink;

  factory DocumentLink.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkFromJson(json);
}

/// The result returned from the apply workspace edit request.
///
/// renamed from ApplyWorkspaceEditResponse
///
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
@freezed
abstract class ApplyWorkspaceEditResult with _$ApplyWorkspaceEditResult {
  const factory ApplyWorkspaceEditResult({
    /// Indicates whether the edit was applied or not.
    required bool applied,

    /// An optional textual description for why the edit was not applied. This
    /// may be used by the server for diagnostic logging or to provide a
    /// suitable error for a request that triggered the edit.
    String? failureReason,

    /// Depending on the client's failure handling strategy `failedChange` might
    /// contain the index of the change that failed. This property is only
    /// available if the client signals a `failureHandlingStrategy` in its
    /// client capabilities.
    int? failedChange,
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
    ///
    /// Examples: "Indexing" or "Linking dependencies".
    required String title,

    /// Controls if a cancel button should show to allow the user to cancel the
    /// long running operation. Clients that don't support cancellation are
    /// allowed to ignore the setting.
    bool? cancellable,

    /// Optional, more detailed associated progress message. Contains
    /// complementary information to the `title`.
    ///
    /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    /// If unset, the previous progress message (if any) is still valid.
    String? message,

    /// Optional progress percentage to display (value 100 is considered 100%).
    /// If not provided infinite progress is assumed and clients are allowed to
    /// ignore the `percentage` value in subsequent report notifications.
    ///
    /// The value should be steadily rising. Clients are free to ignore values
    /// that are not following this rule. The value range is [0, 100].
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

    /// Optional, more detailed associated progress message. Contains
    /// complementary information to the `title`.
    ///
    /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    /// If unset, the previous progress message (if any) is still valid.
    String? message,

    /// Optional progress percentage to display (value 100 is considered 100%).
    /// If not provided infinite progress is assumed and clients are allowed to
    /// ignore the `percentage` value in subsequent report notifications.
    ///
    /// The value should be steadily rising. Clients are free to ignore values
    /// that are not following this rule. The value range is [0, 100].
    int? percentage,
  }) = _WorkDoneProgressReport;

  factory WorkDoneProgressReport.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressReportFromJson(json);
}

@freezed
abstract class WorkDoneProgressEnd with _$WorkDoneProgressEnd {
  const factory WorkDoneProgressEnd({
    required String kind,

    /// Optional, a final message indicating to for example indicate the outcome
    /// of the operation.
    String? message,
  }) = _WorkDoneProgressEnd;

  factory WorkDoneProgressEnd.fromJson(Map<String, dynamic> json) =>
      _$WorkDoneProgressEndFromJson(json);
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

    /// The full target range of this link. If the target for example is a
    /// symbol then target range is the range enclosing this symbol not
    /// including leading/trailing whitespace but everything else like comments.
    /// This information is typically used to highlight the range in the editor.
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
/// - support for negotiated position encoding.
///
/// @since 3.17.0 - support for negotiated position encoding.
@freezed
abstract class Position with _$Position {
  const factory Position({
    /// Line position in a document (zero-based).
    ///
    /// If a line number is greater than the number of lines in a document, it
    /// defaults back to the number of lines in the document. If a line number
    /// is negative, it defaults to 0.
    required int line,

    /// Character offset on a line in a document (zero-based).
    ///
    /// The meaning of this offset is determined by the negotiated
    /// `PositionEncodingKind`.
    ///
    /// If the character value is greater than the line length it defaults back
    /// to the line length.
    required int character,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
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
    /// - support for AnnotatedTextEdit. This is guarded using a client
    /// capability.
    @_TextDocumentEditEditsItemListConverter()
    required List<TextDocumentEditEditsItem> edits,
  }) = _TextDocumentEdit;

  factory TextDocumentEdit.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentEditFromJson(json);
}

/// Create file operation.
@freezed
abstract class CreateFile with _$CreateFile {
  const factory CreateFile({
    /// An optional annotation identifier describing the operation.
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
    /// A human-readable string describing the actual change. The string is
    /// rendered prominent in the user interface.
    required String label,

    /// A flag which indicates that user confirmation is needed before applying
    /// the change.
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
    /// The document range for which the inline value applies. The range is used
    /// to extract the variable name from the underlying document.
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
    /// The document range for which the inline value applies. The range is used
    /// to extract the evaluatable expression from the underlying document.
    required Range range,

    /// If specified the expression overrides the extracted expression.
    String? expression,
  }) = _InlineValueEvaluatableExpression;

  factory InlineValueEvaluatableExpression.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueEvaluatableExpressionFromJson(json);
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
    ///
    /// Type: String | MarkupContent
    @_InlayHintLabelPartTooltipConverter() InlayHintLabelPartTooltip? tooltip,

    /// An optional source code location that represents this label part.
    ///
    /// The editor will use this location for the hover and for code navigation
    /// features: This part will become a clickable link that resolves to the
    /// definition of the symbol at the given location (not necessarily the
    /// location itself), it shows the hover that shows at the given location,
    /// and it shows a context menu with further code navigation commands.
    ///
    /// Depending on the client capability `inlayHint.resolveSupport` clients
    /// might resolve this property late using the resolve request.
    Location? location,

    /// An optional command for this label part.
    ///
    /// Depending on the client capability `inlayHint.resolveSupport` clients
    /// might resolve this property late using the resolve request.
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

/// A full diagnostic report with a set of related documents.
///
/// @since 3.17.0
@freezed
abstract class RelatedFullDocumentDiagnosticReport
    with _$RelatedFullDocumentDiagnosticReport {
  const factory RelatedFullDocumentDiagnosticReport({
    /// A full document diagnostic report.
    required String kind,

    /// An optional result id. If provided it will be sent on the next
    /// diagnostic request for the same document.
    String? resultId,

    /// The actual items.
    required List<Diagnostic> items,

    /// Diagnostics of related documents. This information is useful in
    /// programming languages where code in a file A can generate diagnostics in
    /// a file B which A depends on. An example of such a language is C/C++
    /// where marco definitions in a file a.cpp and result in errors in a header
    /// file b.hpp.
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

    /// A result id which will be sent on the next diagnostic request for the
    /// same document.
    required String resultId,

    /// Diagnostics of related documents. This information is useful in
    /// programming languages where code in a file A can generate diagnostics in
    /// a file B which A depends on. An example of such a language is C/C++
    /// where marco definitions in a file a.cpp and result in errors in a header
    /// file b.hpp.
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

    /// An optional result id. If provided it will be sent on the next
    /// diagnostic request for the same document.
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

    /// A result id which will be sent on the next diagnostic request for the
    /// same document.
    required String resultId,
  }) = _UnchangedDocumentDiagnosticReport;

  factory UnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) => _$UnchangedDocumentDiagnosticReportFromJson(json);
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
/// @since 3.18.0
/// @proposed
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

/// A string value used as a snippet is a template which allows to insert text
/// and to control the editor cursor when insertion happens.
///
/// A snippet can define tab stops and placeholders with `$1`, `$2` and
/// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
/// snippet. Variables are defined with `$name` and `${name:default value}`.
///
/// @since 3.18.0
/// @proposed
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

/// General parameters to register for a notification or to register a provider.
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
    /// The glob pattern to watch. See [GlobPattern] for more detail.
    ///
    /// support for relative patterns.
    required GlobPattern globPattern,

    /// The kind of events of interest. If omitted it defaults to
    /// WatchKind.Create | WatchKind.Change | WatchKind.Delete which is 7.
    WatchKind? kind,
  }) = _FileSystemWatcher;

  factory FileSystemWatcher.fromJson(Map<String, dynamic> json) =>
      _$FileSystemWatcherFromJson(json);
}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic
/// objects are only valid in the scope of a resource.
@freezed
abstract class Diagnostic with _$Diagnostic {
  const factory Diagnostic({
    /// The range at which the message applies
    required Range range,

    /// The diagnostic's severity. Can be omitted. If omitted it is up to the
    /// client to interpret diagnostics as error, warning, info or hint.
    DiagnosticSeverity? severity,

    /// The diagnostic's code, which usually appear in the user interface.
    ///
    /// Type: int | String
    @_DiagnosticCodeConverter() DiagnosticCode? code,

    /// An optional property to describe the error code. Requires the code field
    /// (above) to be present/not null.
    CodeDescription? codeDescription,

    /// A human-readable string describing the source of this diagnostic, e.g.
    /// 'typescript' or 'super lint'. It usually appears in the user interface.
    String? source,

    /// The diagnostic's message. It usually appears in the user interface
    required String message,

    /// Additional metadata about the diagnostic.
    List<DiagnosticTag>? tags,

    /// An array of related diagnostic information, e.g. when symbol-names
    /// within a scope collide all definitions can be marked via this property.
    List<DiagnosticRelatedInformation>? relatedInformation,

    /// A data entry field that is preserved between a
    /// `textDocument/publishDiagnostics` notification and
    /// `textDocument/codeAction` request.
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

    /// The trigger character (a single character) that has trigger code
    /// complete. Is undefined if `triggerKind !==
    /// CompletionTriggerKind.TriggerCharacter`
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
    /// [CompletionItem.detail]. Should be used for fully qualified names and
    /// file paths.
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

    /// The human-readable doc-comment of this signature. Will be shown in the
    /// UI but can be omitted.
    ///
    /// Type: String | MarkupContent
    @_SignatureInformationDocumentationConverter()
    SignatureInformationDocumentation? documentation,

    /// The parameters of this signature.
    List<ParameterInformation>? parameters,

    /// The index of the active parameter.
    ///
    /// If provided, this is used in place of `SignatureHelp.activeParameter`.
    int? activeParameter,
  }) = _SignatureInformation;

  factory SignatureInformation.fromJson(Map<String, dynamic> json) =>
      _$SignatureInformationFromJson(json);
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

/// A base for all symbol information.
@freezed
abstract class BaseSymbolInformation with _$BaseSymbolInformation {
  const factory BaseSymbolInformation({
    /// The name of this symbol.
    required String name,

    /// The kind of this symbol.
    required SymbolKind kind,

    /// Tags for this symbol.
    List<SymbolTag>? tags,

    /// The name of the symbol containing this symbol. This information is for
    /// user interface purposes (e.g. to render a qualifier in the user
    /// interface if necessary). It can't be used to re-infer a hierarchy for
    /// the document symbols.
    String? containerName,
  }) = _BaseSymbolInformation;

  factory BaseSymbolInformation.fromJson(Map<String, dynamic> json) =>
      _$BaseSymbolInformationFromJson(json);
}

/// Contains additional diagnostic information about the context in which a
/// [CodeActionProvider] is run.
@freezed
abstract class CodeActionContext with _$CodeActionContext {
  const factory CodeActionContext({
    /// An array of diagnostics known on the client side overlapping the range
    /// provided to the `textDocument/codeAction` request. They are provided so
    /// that the server knows which errors are currently presented to the user
    /// for the given range. There is no guarantee that these accurately reflect
    /// the error state of the resource. The primary parameter to compute code
    /// actions is the provided range.
    required List<Diagnostic> diagnostics,

    /// Requested kind of actions to return.
    ///
    /// Actions not of this kind are filtered out by the client before being
    /// shown. So servers can omit computing them.
    List<CodeActionKind>? only,

    /// The reason why code actions were requested.
    CodeActionTriggerKind? triggerKind,
  }) = _CodeActionContext;

  factory CodeActionContext.fromJson(Map<String, dynamic> json) =>
      _$CodeActionContextFromJson(json);
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

    /// The version number of this document. If a versioned text document
    /// identifier is sent from the server to the client and the file is not
    /// open in the editor (the server has not received an open notification
    /// before) the server can send `null` to indicate that the version is
    /// unknown and the content on disk is the truth (as specified with document
    /// content ownership).
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
    ChangeAnnotationIdentifier? annotationId,
  }) = _ResourceOperation;

  factory ResourceOperation.fromJson(Map<String, dynamic> json) =>
      _$ResourceOperationFromJson(json);
}

/// A pattern to describe in which file operation requests or notifications the
/// server is interested in receiving.
///
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

    /// An optional result id. If provided it will be sent on the next
    /// diagnostic request for the same document.
    String? resultId,

    /// The actual items.
    required List<Diagnostic> items,

    /// The URI for which diagnostic information is reported.
    required String uri,

    /// The version number for which the diagnostics are reported. If the
    /// document is not marked as open `null` can be provided.
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

    /// A result id which will be sent on the next diagnostic request for the
    /// same document.
    required String resultId,

    /// The URI for which diagnostic information is reported.
    required String uri,

    /// The version number for which the diagnostics are reported. If the
    /// document is not marked as open `null` can be provided.
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
/// @since 3.18.0
/// @proposed
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
    /// Either a string or an inclusive start and exclusive end offsets within
    /// its containing signature label. (see SignatureInformation.label). The
    /// offsets are based on a UTF-16 string representation as `Position` and
    /// `Range` does.
    ///
    /// *Note*: a label of type string should be a substring of its containing
    /// signature label. Its intended use case is to highlight the parameter
    /// label part in the `SignatureInformation.label`.
    ///
    /// Type: String | (int, int)
    @_ParameterInformationLabelConverter()
    required ParameterInformationLabel label,

    /// The human-readable doc-comment of this parameter. Will be shown in the
    /// UI but can be omitted.
    ///
    /// Type: String | MarkupContent
    @_ParameterInformationDocumentationConverter()
    ParameterInformationDocumentation? documentation,
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
    /// A filter that matches against the notebook containing the notebook cell.
    /// If a string value is provided it matches against the notebook type. '*'
    /// matches every notebook.
    ///
    /// Type: String | NotebookDocumentFilter
    required Object notebook,

    /// A language id like `python`.
    ///
    /// Will be matched against the language id of the notebook cell document.
    /// '*' matches every language.
    String? language,
  }) = _NotebookCellTextDocumentFilter;

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$NotebookCellTextDocumentFilterFromJson(json);
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
    ///
    /// Type: WorkspaceFolder | String
    @_RelativePatternBaseUriConverter() required RelativePatternBaseUri baseUri,

    /// The actual glob pattern;
    required Pattern pattern,
  }) = _RelativePattern;

  factory RelativePattern.fromJson(Map<String, dynamic> json) =>
      _$RelativePatternFromJson(json);
}
