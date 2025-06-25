/// Do not edit it manually.
///
/// To regenerate, run `dart run lsp_meta:generate`.

// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: one_member_abstracts
// ignore_for_file: unused_element
// ignore_for_file: doc_directive_unknown
// ignore_for_file: directives_ordering
library;

abstract class ToJson {
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

typedef Definition = Object;
typedef DefinitionLink = LocationLink;
typedef LSPArray = List<LSPAny>;
typedef LSPAny = Object;
typedef Declaration = Object;
typedef DeclarationLink = LocationLink;
typedef InlineValue = Object;
typedef DocumentDiagnosticReport = Object;
typedef PrepareRenameResult = Object;
typedef DocumentSelector = List<DocumentFilter>;
typedef ProgressToken = Object;
typedef ChangeAnnotationIdentifier = String;
typedef WorkspaceDocumentDiagnosticReport = Object;
typedef TextDocumentContentChangeEvent = Object;
typedef MarkedString = Object;
typedef DocumentFilter = Object;
typedef LSPObject = Map<String, LSPAny>;
typedef GlobPattern = Object;
typedef TextDocumentFilter = Object;
typedef NotebookDocumentFilter = Object;
typedef Pattern = String;

class ImplementationParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  ImplementationParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a location inside a resource, such as a line inside a text file.
class Location implements ToJson {
  Location({required this.range, required this.uri});

  final Range range;

  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ImplementationRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        ImplementationOptions,
        StaticRegistrationOptions {
  ImplementationRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TypeDefinitionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  TypeDefinitionParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TypeDefinitionRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        TypeDefinitionOptions,
        StaticRegistrationOptions {
  TypeDefinitionRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A workspace folder inside a client.
class WorkspaceFolder implements ToJson {
  WorkspaceFolder({required this.name, required this.uri});

  /// The name of the workspace folder. Used to refer to this workspace
  /// folder in the user interface.
  final String name;

  /// The associated URI for this workspace folder.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
class DidChangeWorkspaceFoldersParams implements ToJson {
  DidChangeWorkspaceFoldersParams({required this.event});

  /// The actual workspace folder change event.
  final WorkspaceFoldersChangeEvent event;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a configuration request.
class ConfigurationParams implements ToJson {
  ConfigurationParams({required this.items});

  final List<ConfigurationItem> items;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DocumentColorRequest}.
class DocumentColorParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentColorParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a color range from a document.
class ColorInformation implements ToJson {
  ColorInformation({required this.color, required this.range});

  /// The actual color value for this color range.
  final Color color;

  /// The range in the document where this color appears.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DocumentColorRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentColorOptions,
        StaticRegistrationOptions {
  DocumentColorRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link ColorPresentationRequest}.
class ColorPresentationParams
    implements WorkDoneProgressParams, PartialResultParams {
  ColorPresentationParams({
    required this.color,
    required this.partialResultToken,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The color to request presentations for.
  final Color color;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The range where the color would be inserted. Serves as a context.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ColorPresentation implements ToJson {
  ColorPresentation({
    required this.additionalTextEdits,
    required this.label,
    required this.textEdit,
  });

  /// An optional array of additional {@link TextEdit text edits} that are
  /// applied when selecting this color presentation. Edits must not overlap
  /// with the main {@link ColorPresentation.textEdit edit} nor with
  /// themselves.
  final List<TextEdit> additionalTextEdits;

  /// The label of this color presentation. It will be shown on the color
  /// picker header. By default this is also the text that is inserted when
  /// selecting this color presentation.
  final String label;

  /// An {@link TextEdit edit} which is applied to a document when selecting
  /// this presentation for the color. When `falsy` the {@link
  /// ColorPresentation.label label} is used.
  final TextEdit textEdit;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressOptions implements ToJson {
  WorkDoneProgressOptions({required this.workDoneProgress});

  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General text document registration options.
class TextDocumentRegistrationOptions implements ToJson {
  TextDocumentRegistrationOptions({required this.documentSelector});

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  final Object documentSelector;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link FoldingRangeRequest}.
class FoldingRangeParams
    implements WorkDoneProgressParams, PartialResultParams {
  FoldingRangeParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a folding range. To be valid, start and end line must be bigger
/// than zero and smaller than the number of lines in the document. Clients are
/// free to ignore invalid ranges.
class FoldingRange implements ToJson {
  FoldingRange({
    required this.collapsedText,
    required this.endCharacter,
    required this.endLine,
    required this.kind,
    required this.startCharacter,
    required this.startLine,
  });

  /// The text that the client should show when the specified range is
  /// collapsed. If not defined or not supported by the client, a default
  /// will be chosen by the client.
  /// @since 3.17.0
  final String collapsedText;

  /// The zero-based character offset before the folded range ends. If not
  /// defined, defaults to the length of the end line.
  final int endCharacter;

  /// The zero-based end line of the range to fold. The folded area ends with
  /// the line's last character. To be valid, the end must be zero or larger
  /// and smaller than the number of lines in the document.
  final int endLine;

  /// Describes the kind of the folding range such as `comment' or 'region'.
  /// The kind is used to categorize folding ranges and used by commands like
  /// 'Fold all comments'. See {@link FoldingRangeKind} for an enumeration of
  /// standardized kinds.
  final FoldingRangeKind kind;

  /// The zero-based character offset from where the folded range starts. If
  /// not defined, defaults to the length of the start line.
  final int startCharacter;

  /// The zero-based start line of the range to fold. The folded area starts
  /// after the line's last character. To be valid, the end must be zero or
  /// larger and smaller than the number of lines in the document.
  final int startLine;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FoldingRangeRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        FoldingRangeOptions,
        StaticRegistrationOptions {
  FoldingRangeRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeclarationParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  DeclarationParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeclarationRegistrationOptions
    implements
        DeclarationOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  DeclarationRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in selection range requests.
class SelectionRangeParams
    implements WorkDoneProgressParams, PartialResultParams {
  SelectionRangeParams({
    required this.partialResultToken,
    required this.positions,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The positions inside the text document.
  final List<Position> positions;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A selection range represents a part of a selection hierarchy. A selection
/// range may have a parent selection range that contains it.
class SelectionRange implements ToJson {
  SelectionRange({required this.parent, required this.range});

  /// The parent selection range containing this range. Therefore
  /// `parent.range` must contain `this.range`.
  final SelectionRange parent;

  /// The {@link Range range} of this selection range.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SelectionRangeRegistrationOptions
    implements
        SelectionRangeOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  SelectionRangeRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressCreateParams implements ToJson {
  WorkDoneProgressCreateParams({required this.token});

  /// The token to be used to report progress.
  final ProgressToken token;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressCancelParams implements ToJson {
  WorkDoneProgressCancelParams({required this.token});

  /// The token to be used to report progress.
  final ProgressToken token;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `textDocument/prepareCallHierarchy` request.
/// @since 3.16.0
class CallHierarchyPrepareParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  CallHierarchyPrepareParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents programming constructs like functions or constructors in the
/// context of call hierarchy.
/// @since 3.16.0
class CallHierarchyItem implements ToJson {
  CallHierarchyItem({
    required this.data,
    required this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    required this.tags,
    required this.uri,
  });

  /// A data entry field that is preserved between a call hierarchy prepare
  /// and incoming calls or outgoing calls requests.
  final LSPAny data;

  /// More detail for this item, e.g. the signature of a function.
  final String detail;

  /// The kind of this item.
  final SymbolKind kind;

  /// The name of this item.
  final String name;

  /// The range enclosing this symbol not including leading/trailing
  /// whitespace but everything else, e.g. comments and code.
  final Range range;

  /// The range that should be selected and revealed when this symbol is
  /// being picked, e.g. the name of a function. Must be contained by the
  /// {@link CallHierarchyItem.range `range`}.
  final Range selectionRange;

  /// Tags for this item.
  final List<SymbolTag> tags;

  /// The resource identifier of this item.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Call hierarchy options used during static or dynamic registration.
/// @since 3.16.0
class CallHierarchyRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        CallHierarchyOptions,
        StaticRegistrationOptions {
  CallHierarchyRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `callHierarchy/incomingCalls` request.
/// @since 3.16.0
class CallHierarchyIncomingCallsParams
    implements WorkDoneProgressParams, PartialResultParams {
  CallHierarchyIncomingCallsParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  final CallHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents an incoming call, e.g. a caller of a method or constructor.
/// @since 3.16.0
class CallHierarchyIncomingCall implements ToJson {
  CallHierarchyIncomingCall({required this.from, required this.fromRanges});

  /// The item that makes the call.
  final CallHierarchyItem from;

  /// The ranges at which the calls appear. This is relative to the caller
  /// denoted by {@link CallHierarchyIncomingCall.from `this.from`}.
  final List<Range> fromRanges;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `callHierarchy/outgoingCalls` request.
/// @since 3.16.0
class CallHierarchyOutgoingCallsParams
    implements WorkDoneProgressParams, PartialResultParams {
  CallHierarchyOutgoingCallsParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  final CallHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents an outgoing call, e.g. calling a getter from a method or a
/// method from a constructor etc.
/// @since 3.16.0
class CallHierarchyOutgoingCall implements ToJson {
  CallHierarchyOutgoingCall({required this.fromRanges, required this.to});

  /// The range at which this item is called. This is the range relative to
  /// the caller, e.g the item passed to {@link
  /// CallHierarchyItemProvider.provideCallHierarchyOutgoingCalls
  /// `provideCallHierarchyOutgoingCalls`} and not {@link
  /// CallHierarchyOutgoingCall.to `this.to`}.
  final List<Range> fromRanges;

  /// The item that is called.
  final CallHierarchyItem to;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensParams
    implements WorkDoneProgressParams, PartialResultParams {
  SemanticTokensParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokens implements ToJson {
  SemanticTokens({required this.data, required this.resultId});

  /// The actual tokens.
  final List<int> data;

  /// An optional result id. If provided and clients support delta updating
  /// the client will include the result id in the next semantic token
  /// request. A server can then instead of computing all semantic tokens
  /// again simply send a delta.
  final String resultId;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensPartialResult implements ToJson {
  SemanticTokensPartialResult({required this.data});

  final List<int> data;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        SemanticTokensOptions,
        StaticRegistrationOptions {
  SemanticTokensRegistrationOptions({
    required this.documentSelector,
    required this.full,
    required this.id,
    required this.legend,
    required this.range,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// Server supports providing semantic tokens for a full document.
  @override
  final Object full;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  /// The legend used by the server
  @override
  final SemanticTokensLegend legend;

  /// Server supports providing semantic tokens for a specific range of a
  /// document.
  @override
  final Object range;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensDeltaParams
    implements WorkDoneProgressParams, PartialResultParams {
  SemanticTokensDeltaParams({
    required this.partialResultToken,
    required this.previousResultId,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The result id of a previous response. The result Id can either point to
  /// a full response or a delta response depending on what was received
  /// last.
  final String previousResultId;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensDelta implements ToJson {
  SemanticTokensDelta({required this.edits, required this.resultId});

  /// The semantic token edits to transform a previous result into a new
  /// result.
  final List<SemanticTokensEdit> edits;

  final String resultId;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensDeltaPartialResult implements ToJson {
  SemanticTokensDeltaPartialResult({required this.edits});

  final List<SemanticTokensEdit> edits;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensRangeParams
    implements WorkDoneProgressParams, PartialResultParams {
  SemanticTokensRangeParams({
    required this.partialResultToken,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The range the semantic tokens are requested for.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Params to show a resource in the UI.
/// @since 3.16.0
class ShowDocumentParams implements ToJson {
  ShowDocumentParams({
    required this.external,
    required this.selection,
    required this.takeFocus,
    required this.uri,
  });

  /// Indicates to show the resource in an external program. To show, for
  /// example, `https://code.visualstudio.com/` in the default WEB browser
  /// set `external` to `true`.
  final bool external;

  /// An optional selection range if the document is a text document. Clients
  /// might ignore the property if an external program is started or the file
  /// is not a text file.
  final Range selection;

  /// An optional property to indicate whether the editor showing the
  /// document should take focus or not. Clients might ignore this property
  /// if an external program is started.
  final bool takeFocus;

  /// The uri to show.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of a showDocument request.
/// @since 3.16.0
class ShowDocumentResult implements ToJson {
  ShowDocumentResult({required this.success});

  /// A boolean indicating if the show was successful.
  final bool success;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LinkedEditingRangeParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  LinkedEditingRangeParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of a linked editing range request.
/// @since 3.16.0
class LinkedEditingRanges implements ToJson {
  LinkedEditingRanges({required this.ranges, required this.wordPattern});

  /// A list of ranges that can be edited together. The ranges must have
  /// identical length and contain identical text content. The ranges cannot
  /// overlap.
  final List<Range> ranges;

  /// An optional word pattern (regular expression) that describes valid
  /// contents for the given ranges. If no pattern is provided, the client
  /// configuration's word pattern will be used.
  final String wordPattern;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LinkedEditingRangeRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        LinkedEditingRangeOptions,
        StaticRegistrationOptions {
  LinkedEditingRangeRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in notifications/requests for user-initiated creation
/// of files.
/// @since 3.16.0
class CreateFilesParams implements ToJson {
  CreateFilesParams({required this.files});

  /// An array of all files/folders created in this operation.
  final List<FileCreate> files;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A workspace edit represents changes to many resources managed in the
/// workspace. The edit should either provide `changes` or `documentChanges`.
/// If documentChanges are present they are preferred over `changes` if the
/// client can handle versioned document edits.
/// Since version 3.13.0 a workspace edit can contain resource operations as
/// well. If resource operations are present clients need to execute the
/// operations in the order in which they are provided. So a workspace edit for
/// example can consist of the following two changes: (1) a create file a.txt
/// and (2) a text document edit which insert text into file a.txt.
/// An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into
/// file a.txt) will cause failure of the operation. How the client recovers
/// from the failure is described by the client capability:
/// `workspace.workspaceEdit.failureHandling`
class WorkspaceEdit implements ToJson {
  WorkspaceEdit({
    required this.changeAnnotations,
    required this.changes,
    required this.documentChanges,
  });

  /// A map of change annotations that can be referenced in
  /// `AnnotatedTextEdit`s or create, rename and delete file / folder
  /// operations.
  /// Whether clients honor this property depends on the client capability
  /// `workspace.changeAnnotationSupport`.
  /// @since 3.16.0
  final Map<ChangeAnnotationIdentifier, ChangeAnnotation> changeAnnotations;

  /// Holds changes to existing resources.
  final Map<Uri, List<TextEdit>> changes;

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
  final List<Object> documentChanges;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The options to register for file operations.
/// @since 3.16.0
class FileOperationRegistrationOptions implements ToJson {
  FileOperationRegistrationOptions({required this.filters});

  /// The actual filters.
  final List<FileOperationFilter> filters;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in notifications/requests for user-initiated renames of
/// files.
/// @since 3.16.0
class RenameFilesParams implements ToJson {
  RenameFilesParams({required this.files});

  /// An array of all files/folders renamed in this operation. When a folder
  /// is renamed, only the folder will be included, and not its children.
  final List<FileRename> files;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
/// @since 3.16.0
class DeleteFilesParams implements ToJson {
  DeleteFilesParams({required this.files});

  /// An array of all files/folders deleted in this operation.
  final List<FileDelete> files;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MonikerParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  MonikerParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Moniker definition to match LSIF 0.5 moniker definition.
/// @since 3.16.0
class Moniker implements ToJson {
  Moniker({
    required this.identifier,
    required this.kind,
    required this.scheme,
    required this.unique,
  });

  /// The identifier of the moniker. The value is opaque in LSIF however
  /// schema owners are allowed to define the structure if they want.
  final String identifier;

  /// The moniker kind if known.
  final MonikerKind kind;

  /// The scheme of the moniker. For example tsc or .Net
  final String scheme;

  /// The scope in which the moniker is unique
  final UniquenessLevel unique;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MonikerRegistrationOptions
    implements TextDocumentRegistrationOptions, MonikerOptions {
  MonikerRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `textDocument/prepareTypeHierarchy` request.
/// @since 3.17.0
class TypeHierarchyPrepareParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  TypeHierarchyPrepareParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.17.0
class TypeHierarchyItem implements ToJson {
  TypeHierarchyItem({
    required this.data,
    required this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    required this.tags,
    required this.uri,
  });

  /// A data entry field that is preserved between a type hierarchy prepare
  /// and supertypes or subtypes requests. It could also be used to identify
  /// the type hierarchy in the server, helping improve the performance on
  /// resolving supertypes and subtypes.
  final LSPAny data;

  /// More detail for this item, e.g. the signature of a function.
  final String detail;

  /// The kind of this item.
  final SymbolKind kind;

  /// The name of this item.
  final String name;

  /// The range enclosing this symbol not including leading/trailing
  /// whitespace but everything else, e.g. comments and code.
  final Range range;

  /// The range that should be selected and revealed when this symbol is
  /// being picked, e.g. the name of a function. Must be contained by the
  /// {@link TypeHierarchyItem.range `range`}.
  final Range selectionRange;

  /// Tags for this item.
  final List<SymbolTag> tags;

  /// The resource identifier of this item.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Type hierarchy options used during static or dynamic registration.
/// @since 3.17.0
class TypeHierarchyRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        TypeHierarchyOptions,
        StaticRegistrationOptions {
  TypeHierarchyRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `typeHierarchy/supertypes` request.
/// @since 3.17.0
class TypeHierarchySupertypesParams
    implements WorkDoneProgressParams, PartialResultParams {
  TypeHierarchySupertypesParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  final TypeHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `typeHierarchy/subtypes` request.
/// @since 3.17.0
class TypeHierarchySubtypesParams
    implements WorkDoneProgressParams, PartialResultParams {
  TypeHierarchySubtypesParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  final TypeHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in inline value requests.
/// @since 3.17.0
class InlineValueParams implements WorkDoneProgressParams {
  InlineValueParams({
    required this.context,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// Additional information about the context in which inline values were
  /// requested.
  final InlineValueContext context;

  /// The document range for which inline values should be computed.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline value options used during static or dynamic registration.
/// @since 3.17.0
class InlineValueRegistrationOptions
    implements
        InlineValueOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  InlineValueRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in inlay hint requests.
/// @since 3.17.0
class InlayHintParams implements WorkDoneProgressParams {
  InlayHintParams({
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The document range for which inlay hints should be computed.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint information.
/// @since 3.17.0
class InlayHint implements ToJson {
  InlayHint({
    required this.data,
    required this.kind,
    required this.label,
    required this.paddingLeft,
    required this.paddingRight,
    required this.position,
    required this.textEdits,
    required this.tooltip,
  });

  /// A data entry field that is preserved on an inlay hint between a
  /// `textDocument/inlayHint` and a `inlayHint/resolve` request.
  final LSPAny data;

  /// The kind of this hint. Can be omitted in which case the client should
  /// fall back to a reasonable default.
  final InlayHintKind kind;

  /// The label of this hint. A human readable string or an array of
  /// InlayHintLabelPart label parts.
  /// *Note* that neither the string nor the label part can be empty.
  final Object label;

  /// Render padding before the hint.
  /// Note: Padding should use the editor's background color, not the
  /// background color of the hint itself. That means padding can be used to
  /// visually align/separate an inlay hint.
  final bool paddingLeft;

  /// Render padding after the hint.
  /// Note: Padding should use the editor's background color, not the
  /// background color of the hint itself. That means padding can be used to
  /// visually align/separate an inlay hint.
  final bool paddingRight;

  /// The position of this hint.
  /// If multiple hints have the same position, they will be shown in the
  /// order they appear in the response.
  final Position position;

  /// Optional text edits that are performed when accepting this inlay hint.
  /// *Note* that edits are expected to change the document so that the inlay
  /// hint (or its nearest variant) is now part of the document and the inlay
  /// hint itself is now obsolete.
  final List<TextEdit> textEdits;

  /// The tooltip text when you hover over this item.
  final Object tooltip;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint options used during static or dynamic registration.
/// @since 3.17.0
class InlayHintRegistrationOptions
    implements
        InlayHintOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  InlayHintRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  /// The server provides support to resolve additional information for an
  /// inlay hint item.
  @override
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters of the document diagnostic request.
/// @since 3.17.0
class DocumentDiagnosticParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentDiagnosticParams({
    required this.identifier,
    required this.partialResultToken,
    required this.previousResultId,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The additional identifier  provided during registration.
  final String identifier;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The result id of a previous response if provided.
  final String previousResultId;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A partial result for a document diagnostic report.
/// @since 3.17.0
class DocumentDiagnosticReportPartialResult implements ToJson {
  DocumentDiagnosticReportPartialResult({required this.relatedDocuments});

  final Map<Uri, Object> relatedDocuments;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Cancellation data returned from a diagnostic request.
/// @since 3.17.0
class DiagnosticServerCancellationData implements ToJson {
  DiagnosticServerCancellationData({required this.retriggerRequest});

  final bool retriggerRequest;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Diagnostic registration options.
/// @since 3.17.0
class DiagnosticRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DiagnosticOptions,
        StaticRegistrationOptions {
  DiagnosticRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.identifier,
    required this.interFileDependencies,
    required this.workDoneProgress,
    required this.workspaceDiagnostics,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  /// An optional identifier under which the diagnostics are managed by the
  /// client.
  @override
  final String identifier;

  /// Whether the language has inter file dependencies meaning that editing
  /// code in one file can result in a different diagnostic set in another
  /// file. Inter file dependencies are common for most programming languages
  /// and typically uncommon for linters.
  @override
  final bool interFileDependencies;

  @override
  final bool workDoneProgress;

  /// The server provides support for workspace diagnostics as well.
  @override
  final bool workspaceDiagnostics;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters of the workspace diagnostic request.
/// @since 3.17.0
class WorkspaceDiagnosticParams
    implements WorkDoneProgressParams, PartialResultParams {
  WorkspaceDiagnosticParams({
    required this.identifier,
    required this.partialResultToken,
    required this.previousResultIds,
    required this.workDoneToken,
  });

  /// The additional identifier provided during registration.
  final String identifier;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The currently known diagnostic reports with their previous result ids.
  final List<PreviousResultId> previousResultIds;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReport implements ToJson {
  WorkspaceDiagnosticReport({required this.items});

  final List<WorkspaceDocumentDiagnosticReport> items;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A partial result for a workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReportPartialResult implements ToJson {
  WorkspaceDiagnosticReportPartialResult({required this.items});

  final List<WorkspaceDocumentDiagnosticReport> items;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in an open notebook document notification.
/// @since 3.17.0
class DidOpenNotebookDocumentParams implements ToJson {
  DidOpenNotebookDocumentParams({
    required this.cellTextDocuments,
    required this.notebookDocument,
  });

  /// The text documents that represent the content of a notebook cell.
  final List<TextDocumentItem> cellTextDocuments;

  /// The notebook document that got opened.
  final NotebookDocument notebookDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in a change notebook document notification.
/// @since 3.17.0
class DidChangeNotebookDocumentParams implements ToJson {
  DidChangeNotebookDocumentParams({
    required this.change,
    required this.notebookDocument,
  });

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
  final NotebookDocumentChangeEvent change;

  /// The notebook document that did change. The version number points to the
  /// version after all provided changes have been applied. If only the text
  /// document content of a cell changes the notebook version doesn't
  /// necessarily have to change.
  final VersionedNotebookDocumentIdentifier notebookDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in a save notebook document notification.
/// @since 3.17.0
class DidSaveNotebookDocumentParams implements ToJson {
  DidSaveNotebookDocumentParams({required this.notebookDocument});

  /// The notebook document that got saved.
  final NotebookDocumentIdentifier notebookDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in a close notebook document notification.
/// @since 3.17.0
class DidCloseNotebookDocumentParams implements ToJson {
  DidCloseNotebookDocumentParams({
    required this.cellTextDocuments,
    required this.notebookDocument,
  });

  /// The text documents that represent the content of a notebook cell that
  /// got closed.
  final List<TextDocumentIdentifier> cellTextDocuments;

  /// The notebook document that got closed.
  final NotebookDocumentIdentifier notebookDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in inline completion requests.
/// @since 3.18.0 @proposed
class InlineCompletionParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  InlineCompletionParams({
    required this.context,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// Additional information about the context in which inline completions
  /// were requested.
  final InlineCompletionContext context;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a collection of {@link InlineCompletionItem inline completion
/// items} to be presented in the editor.
/// @since 3.18.0 @proposed
class InlineCompletionList implements ToJson {
  InlineCompletionList({required this.items});

  /// The inline completion items
  final List<InlineCompletionItem> items;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An inline completion item represents a text snippet that is proposed inline
/// to complete text that is being typed.
/// @since 3.18.0 @proposed
class InlineCompletionItem implements ToJson {
  InlineCompletionItem({
    required this.command,
    required this.filterText,
    required this.insertText,
    required this.range,
  });

  /// An optional {@link Command} that is executed *after* inserting this
  /// completion.
  final Command command;

  /// A text that is used to decide if this inline completion should be
  /// shown. When `falsy` the {@link InlineCompletionItem.insertText} is
  /// used.
  final String filterText;

  /// The text to replace the range with. Must be set.
  final Object insertText;

  /// The range to replace. Must begin and end on the same line.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline completion options used during static or dynamic registration.
/// @since 3.18.0 @proposed
class InlineCompletionRegistrationOptions
    implements
        InlineCompletionOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  InlineCompletionRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class RegistrationParams implements ToJson {
  RegistrationParams({required this.registrations});

  final List<Registration> registrations;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class UnregistrationParams implements ToJson {
  UnregistrationParams({required this.unregisterations});

  final List<Unregistration> unregisterations;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class InitializeParams
    implements _InitializeParams, WorkspaceFoldersInitializeParams {
  InitializeParams({
    required this.capabilities,
    required this.clientInfo,
    required this.initializationOptions,
    required this.locale,
    required this.processId,
    required this.rootPath,
    required this.rootUri,
    required this.trace,
    required this.workDoneToken,
    required this.workspaceFolders,
  });

  /// The capabilities provided by the client (editor or tool)
  @override
  final ClientCapabilities capabilities;

  /// Information about the client
  /// @since 3.15.0
  @override
  final Object clientInfo;

  /// User provided initialization options.
  @override
  final LSPAny initializationOptions;

  /// The locale the client is currently showing the user interface in. This
  /// must not necessarily be the locale of the operating system.
  /// Uses IETF language tags as the value's syntax (See
  /// https://en.wikipedia.org/wiki/IETF_language_tag)
  /// @since 3.16.0
  @override
  final String locale;

  /// The process Id of the parent process that started the server.
  /// Is `null` if the process has not been started by another process. If
  /// the parent process is not alive then the server should exit.
  @override
  final Object processId;

  /// The rootPath of the workspace. Is null if no folder is open.
  /// @deprecated in favour of rootUri.
  @override
  final Object rootPath;

  /// The rootUri of the workspace. Is null if no folder is open. If both
  /// `rootPath` and `rootUri` are set `rootUri` wins.
  /// @deprecated in favour of workspaceFolders.
  @override
  final Object rootUri;

  /// The initial trace setting. If omitted trace is disabled ('off').
  @override
  final TraceValues trace;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  /// The workspace folders configured in the client when the server starts.
  /// This property is only available if the client supports workspace
  /// folders. It can be `null` if the client supports workspace folders but
  /// none are configured.
  /// @since 3.6.0
  @override
  final Object workspaceFolders;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result returned from an initialize request.
class InitializeResult implements ToJson {
  InitializeResult({required this.capabilities, required this.serverInfo});

  /// The capabilities the language server provides.
  final ServerCapabilities capabilities;

  /// Information about the server.
  /// @since 3.15.0
  final Object serverInfo;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The data type of the ResponseError if the initialize request fails.
class InitializeError implements ToJson {
  InitializeError({required this.retry});

  /// Indicates whether the client execute the following retry logic: (1)
  /// show the message provided by the ResponseError to the user (2) user
  /// selects retry or cancel (3) if user selected retry the initialize
  /// method is sent again.
  final bool retry;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class InitializedParams implements ToJson {
  InitializedParams();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a change configuration notification.
class DidChangeConfigurationParams implements ToJson {
  DidChangeConfigurationParams({required this.settings});

  /// The actual changed settings
  final LSPAny settings;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DidChangeConfigurationRegistrationOptions implements ToJson {
  DidChangeConfigurationRegistrationOptions({required this.section});

  final Object section;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a notification message.
class ShowMessageParams implements ToJson {
  ShowMessageParams({required this.message, required this.type});

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ShowMessageRequestParams implements ToJson {
  ShowMessageRequestParams({
    required this.actions,
    required this.message,
    required this.type,
  });

  /// The message action items to present.
  final List<MessageActionItem> actions;

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MessageActionItem implements ToJson {
  MessageActionItem({required this.title});

  /// A short title like 'Retry', 'Open Log' etc.
  final String title;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The log message parameters.
class LogMessageParams implements ToJson {
  LogMessageParams({required this.message, required this.type});

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in an open text document notification
class DidOpenTextDocumentParams implements ToJson {
  DidOpenTextDocumentParams({required this.textDocument});

  /// The document that was opened.
  final TextDocumentItem textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The change text document notification's parameters.
class DidChangeTextDocumentParams implements ToJson {
  DidChangeTextDocumentParams({
    required this.contentChanges,
    required this.textDocument,
  });

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
  final List<TextDocumentContentChangeEvent> contentChanges;

  /// The document that did change. The version number points to the version
  /// after all provided content changes have been applied.
  final VersionedTextDocumentIdentifier textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describe options to be used when registered for text document change events.
class TextDocumentChangeRegistrationOptions
    implements TextDocumentRegistrationOptions {
  TextDocumentChangeRegistrationOptions({
    required this.documentSelector,
    required this.syncKind,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// How documents are synced to the server.
  final TextDocumentSyncKind syncKind;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in a close text document notification
class DidCloseTextDocumentParams implements ToJson {
  DidCloseTextDocumentParams({required this.textDocument});

  /// The document that was closed.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in a save text document notification
class DidSaveTextDocumentParams implements ToJson {
  DidSaveTextDocumentParams({required this.text, required this.textDocument});

  /// Optional the content when saved. Depends on the includeText value when
  /// the save notification was requested.
  final String text;

  /// The document that was saved.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Save registration options.
class TextDocumentSaveRegistrationOptions
    implements TextDocumentRegistrationOptions, SaveOptions {
  TextDocumentSaveRegistrationOptions({
    required this.documentSelector,
    required this.includeText,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The client is supposed to include the content on save.
  @override
  final bool includeText;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in a will save text document notification.
class WillSaveTextDocumentParams implements ToJson {
  WillSaveTextDocumentParams({
    required this.reason,
    required this.textDocument,
  });

  /// The 'TextDocumentSaveReason'.
  final TextDocumentSaveReason reason;

  /// The document that will be saved.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A text edit applicable to a text document.
class TextEdit implements ToJson {
  TextEdit({required this.newText, required this.range});

  /// The string to be inserted. For delete operations use an empty string.
  final String newText;

  /// The range of the text document to be manipulated. To insert text into a
  /// document create a range where start === end.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The watched files change notification's parameters.
class DidChangeWatchedFilesParams implements ToJson {
  DidChangeWatchedFilesParams({required this.changes});

  /// The actual file events.
  final List<FileEvent> changes;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describe options to be used when registered for text document change events.
class DidChangeWatchedFilesRegistrationOptions implements ToJson {
  DidChangeWatchedFilesRegistrationOptions({required this.watchers});

  /// The watchers to register.
  final List<FileSystemWatcher> watchers;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The publish diagnostic notification's parameters.
class PublishDiagnosticsParams implements ToJson {
  PublishDiagnosticsParams({
    required this.diagnostics,
    required this.uri,
    required this.version,
  });

  /// An array of diagnostic information items.
  final List<Diagnostic> diagnostics;

  /// The URI for which diagnostic information is reported.
  final Uri uri;

  /// Optional the version number of the document the diagnostics are
  /// published for.
  /// @since 3.15.0
  final int version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Completion parameters
class CompletionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  CompletionParams({
    required this.context,
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The completion context. This is only available if the client specifies
  /// to send this using the client capability
  /// `textDocument.completion.contextSupport === true`
  final CompletionContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A completion item represents a text snippet that is proposed to complete
/// text that is being typed.
class CompletionItem implements ToJson {
  CompletionItem({
    required this.additionalTextEdits,
    required this.command,
    required this.commitCharacters,
    required this.data,
    required this.deprecated,
    required this.detail,
    required this.documentation,
    required this.filterText,
    required this.insertText,
    required this.insertTextFormat,
    required this.insertTextMode,
    required this.kind,
    required this.label,
    required this.labelDetails,
    required this.preselect,
    required this.sortText,
    required this.tags,
    required this.textEdit,
    required this.textEditText,
  });

  /// An optional array of additional {@link TextEdit text edits} that are
  /// applied when selecting this completion. Edits must not overlap
  /// (including the same insert position) with the main {@link
  /// CompletionItem.textEdit edit} nor with themselves.
  /// Additional text edits should be used to change text unrelated to the
  /// current cursor position (for example adding an import statement at the
  /// top of the file if the completion item will insert an unqualified
  /// type).
  final List<TextEdit> additionalTextEdits;

  /// An optional {@link Command command} that is executed *after* inserting
  /// this completion. *Note* that additional modifications to the current
  /// document should be described with the {@link
  /// CompletionItem.additionalTextEdits additionalTextEdits}-property.
  final Command command;

  /// An optional set of characters that when pressed while this completion
  /// is active will accept it first and then type that character. *Note*
  /// that all commit characters should have `length=1` and that superfluous
  /// characters will be ignored.
  final List<String> commitCharacters;

  /// A data entry field that is preserved on a completion item between a
  /// {@link CompletionRequest} and a {@link CompletionResolveRequest}.
  final LSPAny data;

  /// Indicates if this item is deprecated. @deprecated Use `tags` instead.
  final bool deprecated;

  /// A human-readable string with additional information about this item,
  /// like type or symbol information.
  final String detail;

  /// A human-readable string that represents a doc-comment.
  final Object documentation;

  /// A string that should be used when filtering a set of completion items.
  /// When `falsy` the {@link CompletionItem.label label} is used.
  final String filterText;

  /// A string that should be inserted into a document when selecting this
  /// completion. When `falsy` the {@link CompletionItem.label label} is
  /// used.
  /// The `insertText` is subject to interpretation by the client side. Some
  /// tools might not take the string literally. For example VS Code when
  /// code complete is requested in this example `con<cursor position>` and a
  /// completion item with an `insertText` of `console` is provided it will
  /// only insert `sole`. Therefore it is recommended to use `textEdit`
  /// instead since it avoids additional client side interpretation.
  final String insertText;

  /// The format of the insert text. The format applies to both the
  /// `insertText` property and the `newText` property of a provided
  /// `textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
  /// Please note that the insertTextFormat doesn't apply to
  /// `additionalTextEdits`.
  final InsertTextFormat insertTextFormat;

  /// How whitespace and indentation is handled during completion item
  /// insertion. If not provided the clients default value depends on the
  /// `textDocument.completion.insertTextMode` client capability.
  /// @since 3.16.0
  final InsertTextMode insertTextMode;

  /// The kind of this completion item. Based of the kind an icon is chosen
  /// by the editor.
  final CompletionItemKind kind;

  /// The label of this completion item.
  /// The label property is also by default the text that is inserted when
  /// selecting this completion.
  /// If label details are provided the label itself should be an unqualified
  /// name of the completion item.
  final String label;

  /// Additional details for the label
  /// @since 3.17.0
  final CompletionItemLabelDetails labelDetails;

  /// Select this item when showing.
  /// *Note* that only one completion item can be selected and that the tool
  /// / client decides which item that is. The rule is that the *first* item
  /// of those that match best is selected.
  final bool preselect;

  /// A string that should be used when comparing this item with other items.
  /// When `falsy` the {@link CompletionItem.label label} is used.
  final String sortText;

  /// Tags for this completion item.
  /// @since 3.15.0
  final List<CompletionItemTag> tags;

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
  final Object textEdit;

  /// The edit text used if the completion item is part of a CompletionList
  /// and CompletionList defines an item default for the text edit range.
  /// Clients will only honor this property if they opt into completion list
  /// item defaults using the capability `completionList.itemDefaults`.
  /// If not provided and a list's default range is provided the label
  /// property is used as a text.
  /// @since 3.17.0
  final String textEditText;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a collection of {@link CompletionItem completion items} to be
/// presented in the editor.
class CompletionList implements ToJson {
  CompletionList({
    required this.isIncomplete,
    required this.itemDefaults,
    required this.items,
  });

  /// This list it not complete. Further typing results in recomputing this
  /// list.
  /// Recomputed lists have all their items replaced (not appended) in the
  /// incomplete completion sessions.
  final bool isIncomplete;

  /// In many cases the items of an actual completion result share the same
  /// value for properties like `commitCharacters` or the range of a text
  /// edit. A completion list can therefore define item defaults which will
  /// be used if a completion item itself doesn't specify the value.
  /// If a completion list specifies a default value and a completion item
  /// also specifies a corresponding value the one from the item is used.
  /// Servers are only allowed to return default values if the client signals
  /// support for this via the `completionList.itemDefaults` capability.
  /// @since 3.17.0
  final Object itemDefaults;

  /// The completion items.
  final List<CompletionItem> items;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link CompletionRequest}.
class CompletionRegistrationOptions
    implements TextDocumentRegistrationOptions, CompletionOptions {
  CompletionRegistrationOptions({
    required this.allCommitCharacters,
    required this.completionItem,
    required this.documentSelector,
    required this.resolveProvider,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  /// The list of all possible characters that commit a completion. This
  /// field can be used if clients don't support individual commit characters
  /// per completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
  /// If a server provides both `allCommitCharacters` and commit characters
  /// on an individual completion item the ones on the completion item win.
  /// @since 3.2.0
  @override
  final List<String> allCommitCharacters;

  /// The server supports the following `CompletionItem` specific
  /// capabilities.
  /// @since 3.17.0
  @override
  final Object completionItem;

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The server provides support to resolve additional information for a
  /// completion item.
  @override
  final bool resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
  /// they do so when the user starts to type an identifier. For example if
  /// the user types `c` in a JavaScript file code complete will
  /// automatically pop up present `console` besides others as a completion
  /// item. Characters that make up identifiers don't need to be listed here.
  /// If code complete should automatically be trigger on characters not
  /// being valid inside an identifier (for example `.` in JavaScript) list
  /// them in `triggerCharacters`.
  @override
  final List<String> triggerCharacters;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link HoverRequest}.
class HoverParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  HoverParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of a hover request.
class Hover implements ToJson {
  Hover({required this.contents, required this.range});

  /// The hover's content
  final Object contents;

  /// An optional range inside the text document that is used to visualize
  /// the hover, e.g. by changing the background color.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link HoverRequest}.
class HoverRegistrationOptions
    implements TextDocumentRegistrationOptions, HoverOptions {
  HoverRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link SignatureHelpRequest}.
class SignatureHelpParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  SignatureHelpParams({
    required this.context,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The signature help context. This is only available if the client
  /// specifies to send this using the client capability
  /// `textDocument.signatureHelp.contextSupport === true`
  /// @since 3.15.0
  final SignatureHelpContext context;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
class SignatureHelp implements ToJson {
  SignatureHelp({
    required this.activeParameter,
    required this.activeSignature,
    required this.signatures,
  });

  /// The active parameter of the active signature. If omitted or the value
  /// lies outside the range of `signatures[activeSignature].parameters`
  /// defaults to 0 if the active signature has parameters. If the active
  /// signature has no parameters it is ignored. In future version of the
  /// protocol this property might become mandatory to better express the
  /// active parameter if the active signature does have any.
  final int activeParameter;

  /// The active signature. If omitted or the value lies outside the range of
  /// `signatures` the value defaults to zero or is ignored if the
  /// `SignatureHelp` has no signatures.
  /// Whenever possible implementors should make an active decision about the
  /// active signature and shouldn't rely on a default value.
  /// In future version of the protocol this property might become mandatory
  /// to better express this.
  final int activeSignature;

  /// One or more signatures.
  final List<SignatureInformation> signatures;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link SignatureHelpRequest}.
class SignatureHelpRegistrationOptions
    implements TextDocumentRegistrationOptions, SignatureHelpOptions {
  SignatureHelpRegistrationOptions({
    required this.documentSelector,
    required this.retriggerCharacters,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// List of characters that re-trigger signature help.
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger
  /// characters.
  /// @since 3.15.0
  @override
  final List<String> retriggerCharacters;

  /// List of characters that trigger signature help automatically.
  @override
  final List<String> triggerCharacters;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DefinitionRequest}.
class DefinitionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  DefinitionParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DefinitionRequest}.
class DefinitionRegistrationOptions
    implements TextDocumentRegistrationOptions, DefinitionOptions {
  DefinitionRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link ReferencesRequest}.
class ReferenceParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  ReferenceParams({
    required this.context,
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  final ReferenceContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link ReferencesRequest}.
class ReferenceRegistrationOptions
    implements TextDocumentRegistrationOptions, ReferenceOptions {
  ReferenceRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DocumentHighlightRequest}.
class DocumentHighlightParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  DocumentHighlightParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
class DocumentHighlight implements ToJson {
  DocumentHighlight({required this.kind, required this.range});

  /// The highlight kind, default is {@link DocumentHighlightKind.Text text}.
  final DocumentHighlightKind kind;

  /// The range this highlight applies to.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentHighlightRequest}.
class DocumentHighlightRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentHighlightOptions {
  DocumentHighlightRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DocumentSymbolRequest}.
class DocumentSymbolParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentSymbolParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information about programming constructs like variables,
/// classes, interfaces etc.
class SymbolInformation implements BaseSymbolInformation {
  SymbolInformation({
    required this.containerName,
    required this.deprecated,
    required this.kind,
    required this.location,
    required this.name,
    required this.tags,
  });

  /// The name of the symbol containing this symbol. This information is for
  /// user interface purposes (e.g. to render a qualifier in the user
  /// interface if necessary). It can't be used to re-infer a hierarchy for
  /// the document symbols.
  @override
  final String containerName;

  /// Indicates if this symbol is deprecated.
  /// @deprecated Use tags instead
  final bool deprecated;

  /// The kind of this symbol.
  @override
  final SymbolKind kind;

  /// The location of this symbol. The location's range is used by a tool to
  /// reveal the location in the editor. If the symbol is selected in the
  /// tool the range's start information is used to position the cursor. So
  /// the range usually spans more than the actual symbol's name and does
  /// normally include things like visibility modifiers.
  /// The range doesn't have to denote a node range in the sense of an
  /// abstract syntax tree. It can therefore not be used to re-construct a
  /// hierarchy of the symbols.
  final Location location;

  /// The name of this symbol.
  @override
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  @override
  final List<SymbolTag> tags;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents programming constructs like variables, classes, interfaces etc.
/// that appear in a document. Document symbols can be hierarchical and they
/// have two ranges: one that encloses its definition and one that points to
/// its most interesting range, e.g. the range of an identifier.
class DocumentSymbol implements ToJson {
  DocumentSymbol({
    required this.children,
    required this.deprecated,
    required this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    required this.tags,
  });

  /// Children of this symbol, e.g. properties of a class.
  final List<DocumentSymbol> children;

  /// Indicates if this symbol is deprecated.
  /// @deprecated Use tags instead
  final bool deprecated;

  /// More detail for this symbol, e.g the signature of a function.
  final String detail;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The name of this symbol. Will be displayed in the user interface and
  /// therefore must not be an empty string or a string only consisting of
  /// white spaces.
  final String name;

  /// The range enclosing this symbol not including leading/trailing
  /// whitespace but everything else like comments. This information is
  /// typically used to determine if the clients cursor is inside the symbol
  /// to reveal in the symbol in the UI.
  final Range range;

  /// The range that should be selected and revealed when this symbol is
  /// being picked, e.g the name of a function. Must be contained by the
  /// `range`.
  final Range selectionRange;

  /// Tags for this document symbol.
  /// @since 3.16.0
  final List<SymbolTag> tags;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentSymbolRequest}.
class DocumentSymbolRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentSymbolOptions {
  DocumentSymbolRegistrationOptions({
    required this.documentSelector,
    required this.label,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// A human-readable string that is shown when multiple outlines trees are
  /// shown for the same document.
  /// @since 3.16.0
  @override
  final String label;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link CodeActionRequest}.
class CodeActionParams implements WorkDoneProgressParams, PartialResultParams {
  CodeActionParams({
    required this.context,
    required this.partialResultToken,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// Context carrying additional information.
  final CodeActionContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The range for which the command was invoked.
  final Range range;

  /// The document in which the command was invoked.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a reference to a command. Provides a title which will be used to
/// represent a command in the UI and, optionally, an array of arguments which
/// will be passed to the command handler function when invoked.
class Command implements ToJson {
  Command({
    required this.arguments,
    required this.command,
    required this.title,
  });

  /// Arguments that the command handler should be invoked with.
  final List<LSPAny> arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// Title of the command, like `save`.
  final String title;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A code action represents a change that can be performed in code, e.g. to
/// fix a problem or to refactor code.
/// A CodeAction must set either `edit` and/or a `command`. If both are
/// supplied, the `edit` is applied first, then the `command` is executed.
class CodeAction implements ToJson {
  CodeAction({
    required this.command,
    required this.data,
    required this.diagnostics,
    required this.disabled,
    required this.edit,
    required this.isPreferred,
    required this.kind,
    required this.title,
  });

  /// A command this code action executes. If a code action provides an edit
  /// and a command, first the edit is executed and then the command.
  final Command command;

  /// A data entry field that is preserved on a code action between a
  /// `textDocument/codeAction` and a `codeAction/resolve` request.
  /// @since 3.16.0
  final LSPAny data;

  /// The diagnostics that this code action resolves.
  final List<Diagnostic> diagnostics;

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
  final Object disabled;

  /// The workspace edit this code action performs.
  final WorkspaceEdit edit;

  /// Marks this as a preferred action. Preferred actions are used by the
  /// `auto fix` command and can be targeted by keybindings.
  /// A quick fix should be marked preferred if it properly addresses the
  /// underlying error. A refactoring should be marked preferred if it is the
  /// most reasonable choice of actions to take.
  /// @since 3.15.0
  final bool isPreferred;

  /// The kind of the code action.
  /// Used to filter code actions.
  final CodeActionKind kind;

  /// A short, human-readable, title for this code action.
  final String title;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link CodeActionRequest}.
class CodeActionRegistrationOptions
    implements TextDocumentRegistrationOptions, CodeActionOptions {
  CodeActionRegistrationOptions({
    required this.codeActionKinds,
    required this.documentSelector,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// CodeActionKinds that this server may return.
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
  /// the server may list out every specific kind they provide.
  @override
  final List<CodeActionKind> codeActionKinds;

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// The server provides support to resolve additional information for a
  /// code action.
  /// @since 3.16.0
  @override
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolParams
    implements WorkDoneProgressParams, PartialResultParams {
  WorkspaceSymbolParams({
    required this.partialResultToken,
    required this.query,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// A query string to filter symbols by. Clients may send an empty string
  /// here to request all symbols.
  final String query;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A special workspace symbol that supports locations without a range.
/// See also SymbolInformation.
/// @since 3.17.0
class WorkspaceSymbol implements BaseSymbolInformation {
  WorkspaceSymbol({
    required this.containerName,
    required this.data,
    required this.kind,
    required this.location,
    required this.name,
    required this.tags,
  });

  /// The name of the symbol containing this symbol. This information is for
  /// user interface purposes (e.g. to render a qualifier in the user
  /// interface if necessary). It can't be used to re-infer a hierarchy for
  /// the document symbols.
  @override
  final String containerName;

  /// A data entry field that is preserved on a workspace symbol between a
  /// workspace symbol request and a workspace symbol resolve request.
  final LSPAny data;

  /// The kind of this symbol.
  @override
  final SymbolKind kind;

  /// The location of the symbol. Whether a server is allowed to return a
  /// location without a range depends on the client capability
  /// `workspace.symbol.resolveSupport`.
  /// See SymbolInformation#location for more details.
  final Object location;

  /// The name of this symbol.
  @override
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  @override
  final List<SymbolTag> tags;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolRegistrationOptions implements WorkspaceSymbolOptions {
  WorkspaceSymbolRegistrationOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// The server provides support to resolve additional information for a
  /// workspace symbol.
  /// @since 3.17.0
  @override
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link CodeLensRequest}.
class CodeLensParams implements WorkDoneProgressParams, PartialResultParams {
  CodeLensParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The document to request code lens for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A code lens represents a {@link Command command} that should be shown along
/// with source text, like the number of references, a way to run tests, etc.
/// A code lens is _unresolved_ when no command is associated to it. For
/// performance reasons the creation of a code lens and resolving should be
/// done in two stages.
class CodeLens implements ToJson {
  CodeLens({required this.command, required this.data, required this.range});

  /// The command this code lens represents.
  final Command command;

  /// A data entry field that is preserved on a code lens item between a
  /// {@link CodeLensRequest} and a {@link CodeLensResolveRequest}
  final LSPAny data;

  /// The range in which this code lens is valid. Should only span a single
  /// line.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link CodeLensRequest}.
class CodeLensRegistrationOptions
    implements TextDocumentRegistrationOptions, CodeLensOptions {
  CodeLensRegistrationOptions({
    required this.documentSelector,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// Code lens has a resolve provider as well.
  @override
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentLinkRequest}.
class DocumentLinkParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentLinkParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken partialResultToken;

  /// The document to provide document links for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A document link is a range in a text document that links to an internal or
/// external resource, like another text document or a web site.
class DocumentLink implements ToJson {
  DocumentLink({
    required this.data,
    required this.range,
    required this.target,
    required this.tooltip,
  });

  /// A data entry field that is preserved on a document link between a
  /// DocumentLinkRequest and a DocumentLinkResolveRequest.
  final LSPAny data;

  /// The range this link applies to.
  final Range range;

  /// The uri this link points to. If missing a resolve request is sent later.
  final Uri target;

  /// The tooltip text when you hover over this link.
  /// If a tooltip is provided, is will be displayed in a string that
  /// includes instructions on how to trigger the link, such as `{0} (ctrl +
  /// click)`. The specific instructions vary depending on OS, user settings,
  /// and localization.
  /// @since 3.15.0
  final String tooltip;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentLinkRequest}.
class DocumentLinkRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentLinkOptions {
  DocumentLinkRegistrationOptions({
    required this.documentSelector,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// Document links have a resolve provider as well.
  @override
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentFormattingRequest}.
class DocumentFormattingParams implements WorkDoneProgressParams {
  DocumentFormattingParams({
    required this.options,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The format options.
  final FormattingOptions options;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentFormattingRequest}.
class DocumentFormattingRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentFormattingOptions {
  DocumentFormattingRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingParams implements WorkDoneProgressParams {
  DocumentRangeFormattingParams({
    required this.options,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The format options
  final FormattingOptions options;

  /// The range to format
  final Range range;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentRangeFormattingOptions {
  DocumentRangeFormattingRegistrationOptions({
    required this.documentSelector,
    required this.rangesSupport,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// Whether the server supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  @override
  final bool rangesSupport;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentRangesFormattingRequest}.
/// @since 3.18.0 @proposed
class DocumentRangesFormattingParams implements WorkDoneProgressParams {
  DocumentRangesFormattingParams({
    required this.options,
    required this.ranges,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The format options
  final FormattingOptions options;

  /// The ranges to format
  final List<Range> ranges;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingParams implements ToJson {
  DocumentOnTypeFormattingParams({
    required this.ch,
    required this.options,
    required this.position,
    required this.textDocument,
  });

  /// The character that has been typed that triggered the formatting on type
  /// request. That is not necessarily the last character that got inserted
  /// into the document since the client could auto insert characters as well
  /// (e.g. like automatic brace completion).
  final String ch;

  /// The formatting options.
  final FormattingOptions options;

  /// The position around which the on type formatting should happen. This is
  /// not necessarily the exact position where the character denoted by the
  /// property `ch` got typed.
  final Position position;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentOnTypeFormattingOptions {
  DocumentOnTypeFormattingRegistrationOptions({
    required this.documentSelector,
    required this.firstTriggerCharacter,
    required this.moreTriggerCharacter,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// A character on which formatting should be triggered, like `{`.
  @override
  final String firstTriggerCharacter;

  /// More trigger characters.
  @override
  final List<String> moreTriggerCharacter;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link RenameRequest}.
class RenameParams implements WorkDoneProgressParams {
  RenameParams({
    required this.newName,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The new name of the symbol. If the given name is not valid the request
  /// must return a {@link ResponseError} with an appropriate message set.
  final String newName;

  /// The position at which this request was sent.
  final Position position;

  /// The document to rename.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link RenameRequest}.
class RenameRegistrationOptions
    implements TextDocumentRegistrationOptions, RenameOptions {
  RenameRegistrationOptions({
    required this.documentSelector,
    required this.prepareProvider,
    required this.workDoneProgress,
  });

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final Object documentSelector;

  /// Renames should be checked and tested before being executed.
  /// @since version 3.12.0
  @override
  final bool prepareProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class PrepareRenameParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  PrepareRenameParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link ExecuteCommandRequest}.
class ExecuteCommandParams implements WorkDoneProgressParams {
  ExecuteCommandParams({
    required this.arguments,
    required this.command,
    required this.workDoneToken,
  });

  /// Arguments that the command should be invoked with.
  final List<LSPAny> arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link ExecuteCommandRequest}.
class ExecuteCommandRegistrationOptions implements ExecuteCommandOptions {
  ExecuteCommandRegistrationOptions({
    required this.commands,
    required this.workDoneProgress,
  });

  /// The commands to be executed on the server
  @override
  final List<String> commands;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters passed via an apply workspace edit request.
class ApplyWorkspaceEditParams implements ToJson {
  ApplyWorkspaceEditParams({required this.edit, required this.label});

  /// The edits to apply.
  final WorkspaceEdit edit;

  /// An optional label of the workspace edit. This label is presented in the
  /// user interface for example on an undo stack to undo the workspace edit.
  final String label;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result returned from the apply workspace edit request.
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
class ApplyWorkspaceEditResult implements ToJson {
  ApplyWorkspaceEditResult({
    required this.applied,
    required this.failedChange,
    required this.failureReason,
  });

  /// Indicates whether the edit was applied or not.
  final bool applied;

  /// Depending on the client's failure handling strategy `failedChange`
  /// might contain the index of the change that failed. This property is
  /// only available if the client signals a `failureHandlingStrategy` in its
  /// client capabilities.
  final int failedChange;

  /// An optional textual description for why the edit was not applied. This
  /// may be used by the server for diagnostic logging or to provide a
  /// suitable error for a request that triggered the edit.
  final String failureReason;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressBegin implements ToJson {
  WorkDoneProgressBegin({
    required this.cancellable,
    required this.kind,
    required this.message,
    required this.percentage,
    required this.title,
  });

  /// Controls if a cancel button should show to allow the user to cancel the
  /// long running operation. Clients that don't support cancellation are
  /// allowed to ignore the setting.
  final bool cancellable;

  final String kind;

  /// Optional, more detailed associated progress message. Contains
  /// complementary information to the `title`.
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
  /// If unset, the previous progress message (if any) is still valid.
  final String message;

  /// Optional progress percentage to display (value 100 is considered 100%).
  /// If not provided infinite progress is assumed and clients are allowed to
  /// ignore the `percentage` value in subsequent report notifications.
  /// The value should be steadily rising. Clients are free to ignore values
  /// that are not following this rule. The value range is [0, 100].
  final int percentage;

  /// Mandatory title of the progress operation. Used to briefly inform about
  /// the kind of operation being performed.
  /// Examples: "Indexing" or "Linking dependencies".
  final String title;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressReport implements ToJson {
  WorkDoneProgressReport({
    required this.cancellable,
    required this.kind,
    required this.message,
    required this.percentage,
  });

  /// Controls enablement state of a cancel button.
  /// Clients that don't support cancellation or don't support controlling
  /// the button's enablement state are allowed to ignore the property.
  final bool cancellable;

  final String kind;

  /// Optional, more detailed associated progress message. Contains
  /// complementary information to the `title`.
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
  /// If unset, the previous progress message (if any) is still valid.
  final String message;

  /// Optional progress percentage to display (value 100 is considered 100%).
  /// If not provided infinite progress is assumed and clients are allowed to
  /// ignore the `percentage` value in subsequent report notifications.
  /// The value should be steadily rising. Clients are free to ignore values
  /// that are not following this rule. The value range is [0, 100].
  final int percentage;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressEnd implements ToJson {
  WorkDoneProgressEnd({required this.kind, required this.message});

  final String kind;

  /// Optional, a final message indicating to for example indicate the
  /// outcome of the operation.
  final String message;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SetTraceParams implements ToJson {
  SetTraceParams({required this.value});

  final TraceValues value;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LogTraceParams implements ToJson {
  LogTraceParams({required this.message, required this.verbose});

  final String message;

  final String verbose;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelParams implements ToJson {
  CancelParams({required this.id});

  /// The request id to cancel.
  final Object id;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ProgressParams implements ToJson {
  ProgressParams({required this.token, required this.value});

  /// The progress token provided by the client or server.
  final ProgressToken token;

  /// The progress data.
  final LSPAny value;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in requests to pass a text document and a position
/// inside that document.
class TextDocumentPositionParams implements ToJson {
  TextDocumentPositionParams({
    required this.position,
    required this.textDocument,
  });

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressParams implements ToJson {
  WorkDoneProgressParams({required this.workDoneToken});

  /// An optional token that a server can use to report work done progress.
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class PartialResultParams implements ToJson {
  PartialResultParams({required this.partialResultToken});

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken partialResultToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the connection of two locations. Provides additional metadata
/// over normal {@link Location locations}, including an origin range.
class LocationLink implements ToJson {
  LocationLink({
    required this.originSelectionRange,
    required this.targetRange,
    required this.targetSelectionRange,
    required this.targetUri,
  });

  /// Span of the origin of this link.
  /// Used as the underlined span for mouse interaction. Defaults to the word
  /// range at the definition position.
  final Range originSelectionRange;

  /// The full target range of this link. If the target for example is a
  /// symbol then target range is the range enclosing this symbol not
  /// including leading/trailing whitespace but everything else like
  /// comments. This information is typically used to highlight the range in
  /// the editor.
  final Range targetRange;

  /// The range that should be selected and revealed when this link is being
  /// followed, e.g the name of a function. Must be contained by the
  /// `targetRange`. See also `DocumentSymbol#range`
  final Range targetSelectionRange;

  /// The target resource identifier of this link.
  final Uri targetUri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A range in a text document expressed as (zero-based) start and end
/// positions.
/// If you want to specify a range that contains a line including the line
/// ending character(s) then use an end position denoting the start of the next
/// line. For example: ```ts { start: { line: 5, character: 23 } end : { line
/// 6, character : 0 } } ```
class Range implements ToJson {
  Range({required this.end, required this.start});

  /// The range's end position.
  final Position end;

  /// The range's start position.
  final Position start;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ImplementationOptions implements WorkDoneProgressOptions {
  ImplementationOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Static registration options to be returned in the initialize request.
class StaticRegistrationOptions implements ToJson {
  StaticRegistrationOptions({required this.id});

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  final String id;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TypeDefinitionOptions implements WorkDoneProgressOptions {
  TypeDefinitionOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The workspace folder change event.
class WorkspaceFoldersChangeEvent implements ToJson {
  WorkspaceFoldersChangeEvent({required this.added, required this.removed});

  /// The array of added workspace folders
  final List<WorkspaceFolder> added;

  /// The array of the removed workspace folders
  final List<WorkspaceFolder> removed;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConfigurationItem implements ToJson {
  ConfigurationItem({required this.scopeUri, required this.section});

  /// The scope to get the configuration section for.
  final Uri scopeUri;

  /// The configuration section asked for.
  final String section;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A literal to identify a text document in the client.
class TextDocumentIdentifier implements ToJson {
  TextDocumentIdentifier({required this.uri});

  /// The text document's uri.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a color in RGBA space.
class Color implements ToJson {
  Color({
    required this.alpha,
    required this.blue,
    required this.green,
    required this.red,
  });

  /// The alpha component of this color in the range [0-1].
  final double alpha;

  /// The blue component of this color in the range [0-1].
  final double blue;

  /// The green component of this color in the range [0-1].
  final double green;

  /// The red component of this color in the range [0-1].
  final double red;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DocumentColorOptions implements WorkDoneProgressOptions {
  DocumentColorOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FoldingRangeOptions implements WorkDoneProgressOptions {
  FoldingRangeOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeclarationOptions implements WorkDoneProgressOptions {
  DeclarationOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
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
/// encodings offered by the client and signals that encoding back to the
/// client via the initialize result's property
/// [`capabilities.positionEncoding`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#serverCapabilities).
/// If the string value `utf-16` is missing from the client's capability
/// `general.positionEncodings` servers can safely assume that the client
/// supports UTF-16. If the server omits the position encoding in its
/// initialize result the encoding defaults to the string value `utf-16`.
/// Implementation considerations: since the conversion from one encoding into
/// another requires the content of the file / line the conversion is best done
/// where the file is read which is usually on the server side.
/// Positions are line end character agnostic. So you can not specify a
/// position that denotes `\r|\n` or `\n|` where `|` represents the character
/// offset.
/// @since 3.17.0 - support for negotiated position encoding.
class Position implements ToJson {
  Position({required this.character, required this.line});

  /// Character offset on a line in a document (zero-based).
  /// The meaning of this offset is determined by the negotiated
  /// `PositionEncodingKind`.
  /// If the character value is greater than the line length it defaults back
  /// to the line length.
  final int character;

  /// Line position in a document (zero-based).
  /// If a line number is greater than the number of lines in a document, it
  /// defaults back to the number of lines in the document. If a line number
  /// is negative, it defaults to 0.
  final int line;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SelectionRangeOptions implements WorkDoneProgressOptions {
  SelectionRangeOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Call hierarchy options used during static registration.
/// @since 3.16.0
class CallHierarchyOptions implements WorkDoneProgressOptions {
  CallHierarchyOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensOptions implements WorkDoneProgressOptions {
  SemanticTokensOptions({
    required this.full,
    required this.legend,
    required this.range,
    required this.workDoneProgress,
  });

  /// Server supports providing semantic tokens for a full document.
  final Object full;

  /// The legend used by the server
  final SemanticTokensLegend legend;

  /// Server supports providing semantic tokens for a specific range of a
  /// document.
  final Object range;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensEdit implements ToJson {
  SemanticTokensEdit({
    required this.data,
    required this.deleteCount,
    required this.start,
  });

  /// The elements to insert.
  final List<int> data;

  /// The count of elements to remove.
  final int deleteCount;

  /// The start offset of the edit.
  final int start;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LinkedEditingRangeOptions implements WorkDoneProgressOptions {
  LinkedEditingRangeOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information on a file/folder create.
/// @since 3.16.0
class FileCreate implements ToJson {
  FileCreate({required this.uri});

  /// A file:// URI for the location of the file/folder being created.
  final String uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes textual changes on a text document. A TextDocumentEdit describes
/// all changes on a document version Si and after they are applied move the
/// document to version Si+1. So the creator of a TextDocumentEdit doesn't need
/// to sort the array of edits or do any kind of ordering. However the edits
/// must be non overlapping.
class TextDocumentEdit implements ToJson {
  TextDocumentEdit({required this.edits, required this.textDocument});

  /// The edits to be applied.
  /// @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
  /// client capability.
  final List<Object> edits;

  /// The text document to change.
  final OptionalVersionedTextDocumentIdentifier textDocument;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Create file operation.
class CreateFile implements ResourceOperation {
  CreateFile({
    required this.annotationId,
    required this.kind,
    required this.options,
    required this.uri,
  });

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  @override
  final ChangeAnnotationIdentifier annotationId;

  /// A create
  final String kind;

  /// Additional options
  final CreateFileOptions options;

  /// The resource to create.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Rename file operation
class RenameFile implements ResourceOperation {
  RenameFile({
    required this.annotationId,
    required this.kind,
    required this.newUri,
    required this.oldUri,
    required this.options,
  });

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  @override
  final ChangeAnnotationIdentifier annotationId;

  /// A rename
  final String kind;

  /// The new location.
  final Uri newUri;

  /// The old (existing) location.
  final Uri oldUri;

  /// Rename options.
  final RenameFileOptions options;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Delete file operation
class DeleteFile implements ResourceOperation {
  DeleteFile({
    required this.annotationId,
    required this.kind,
    required this.options,
    required this.uri,
  });

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  @override
  final ChangeAnnotationIdentifier annotationId;

  /// A delete
  final String kind;

  /// Delete options.
  final DeleteFileOptions options;

  /// The file to delete.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Additional information that describes document changes.
/// @since 3.16.0
class ChangeAnnotation implements ToJson {
  ChangeAnnotation({
    required this.description,
    required this.label,
    required this.needsConfirmation,
  });

  /// A human-readable string which is rendered less prominent in the user
  /// interface.
  final String description;

  /// A human-readable string describing the actual change. The string is
  /// rendered prominent in the user interface.
  final String label;

  /// A flag which indicates that user confirmation is needed before applying
  /// the change.
  final bool needsConfirmation;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A filter to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationFilter implements ToJson {
  FileOperationFilter({required this.pattern, required this.scheme});

  /// The actual file operation pattern.
  final FileOperationPattern pattern;

  /// A Uri scheme like `file` or `untitled`.
  final String scheme;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information on a file/folder rename.
/// @since 3.16.0
class FileRename implements ToJson {
  FileRename({required this.newUri, required this.oldUri});

  /// A file:// URI for the new location of the file/folder being renamed.
  final String newUri;

  /// A file:// URI for the original location of the file/folder being
  /// renamed.
  final String oldUri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information on a file/folder delete.
/// @since 3.16.0
class FileDelete implements ToJson {
  FileDelete({required this.uri});

  /// A file:// URI for the location of the file/folder being deleted.
  final String uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MonikerOptions implements WorkDoneProgressOptions {
  MonikerOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Type hierarchy options used during static registration.
/// @since 3.17.0
class TypeHierarchyOptions implements WorkDoneProgressOptions {
  TypeHierarchyOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.17.0
class InlineValueContext implements ToJson {
  InlineValueContext({required this.frameId, required this.stoppedLocation});

  /// The stack frame (as a DAP Id) where the execution has stopped.
  final int frameId;

  /// The document range where execution has stopped. Typically the end
  /// position of the range denotes the line where the inline values are
  /// shown.
  final Range stoppedLocation;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provide inline value as text.
/// @since 3.17.0
class InlineValueText implements ToJson {
  InlineValueText({required this.range, required this.text});

  /// The document range for which the inline value applies.
  final Range range;

  /// The text of the inline value.
  final String text;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provide inline value through a variable lookup. If only a range is
/// specified, the variable name will be extracted from the underlying
/// document. An optional variable name can be used to override the extracted
/// name.
/// @since 3.17.0
class InlineValueVariableLookup implements ToJson {
  InlineValueVariableLookup({
    required this.caseSensitiveLookup,
    required this.range,
    required this.variableName,
  });

  /// How to perform the lookup.
  final bool caseSensitiveLookup;

  /// The document range for which the inline value applies. The range is
  /// used to extract the variable name from the underlying document.
  final Range range;

  /// If specified the name of the variable to look up.
  final String variableName;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provide an inline value through an expression evaluation. If only a range
/// is specified, the expression will be extracted from the underlying
/// document. An optional expression can be used to override the extracted
/// expression.
/// @since 3.17.0
class InlineValueEvaluatableExpression implements ToJson {
  InlineValueEvaluatableExpression({
    required this.expression,
    required this.range,
  });

  /// If specified the expression overrides the extracted expression.
  final String expression;

  /// The document range for which the inline value applies. The range is
  /// used to extract the evaluatable expression from the underlying
  /// document.
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline value options used during static registration.
/// @since 3.17.0
class InlineValueOptions implements WorkDoneProgressOptions {
  InlineValueOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An inlay hint label part allows for interactive and composite labels of
/// inlay hints.
/// @since 3.17.0
class InlayHintLabelPart implements ToJson {
  InlayHintLabelPart({
    required this.command,
    required this.location,
    required this.tooltip,
    required this.value,
  });

  /// An optional command for this label part.
  /// Depending on the client capability `inlayHint.resolveSupport` clients
  /// might resolve this property late using the resolve request.
  final Command command;

  /// An optional source code location that represents this label part.
  /// The editor will use this location for the hover and for code navigation
  /// features: This part will become a clickable link that resolves to the
  /// definition of the symbol at the given location (not necessarily the
  /// location itself), it shows the hover that shows at the given location,
  /// and it shows a context menu with further code navigation commands.
  /// Depending on the client capability `inlayHint.resolveSupport` clients
  /// might resolve this property late using the resolve request.
  final Location location;

  /// The tooltip text when you hover over this label part. Depending on the
  /// client capability `inlayHint.resolveSupport` clients might resolve this
  /// property late using the resolve request.
  final Object tooltip;

  /// The value of this label part.
  final String value;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A `MarkupContent` literal represents a string value which content is
/// interpreted base on its kind flag. Currently the protocol supports
/// `plaintext` and `markdown` as markup kinds.
/// If the kind is `markdown` then the value can contain fenced code blocks
/// like in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
/// Here is an example how such a string can be constructed using JavaScript /
/// TypeScript: ```ts let markdown: MarkdownContent = { kind:
/// MarkupKind.Markdown, value: [ '# Header', 'Some text', '```typescript',
/// 'someCode();', '```' ].join('\n') }; ```
/// *Please Note* that clients might sanitize the return markdown. A client
/// could decide to remove HTML from the markdown to avoid script execution.
class MarkupContent implements ToJson {
  MarkupContent({required this.kind, required this.value});

  /// The type of the Markup
  final MarkupKind kind;

  /// The content itself
  final String value;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint options used during static registration.
/// @since 3.17.0
class InlayHintOptions implements WorkDoneProgressOptions {
  InlayHintOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// The server provides support to resolve additional information for an
  /// inlay hint item.
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A full diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedFullDocumentDiagnosticReport
    implements FullDocumentDiagnosticReport {
  RelatedFullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    required this.relatedDocuments,
    required this.resultId,
  });

  /// The actual items.
  @override
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  @override
  final String kind;

  /// Diagnostics of related documents. This information is useful in
  /// programming languages where code in a file A can generate diagnostics
  /// in a file B which A depends on. An example of such a language is C/C++
  /// where marco definitions in a file a.cpp and result in errors in a
  /// header file b.hpp.
  /// @since 3.17.0
  final Map<Uri, Object> relatedDocuments;

  /// An optional result id. If provided it will be sent on the next
  /// diagnostic request for the same document.
  @override
  final String resultId;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An unchanged diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedUnchangedDocumentDiagnosticReport
    implements UnchangedDocumentDiagnosticReport {
  RelatedUnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.relatedDocuments,
    required this.resultId,
  });

  /// A document diagnostic report indicating no changes to the last result.
  /// A server can only return `unchanged` if result ids are provided.
  @override
  final String kind;

  /// Diagnostics of related documents. This information is useful in
  /// programming languages where code in a file A can generate diagnostics
  /// in a file B which A depends on. An example of such a language is C/C++
  /// where marco definitions in a file a.cpp and result in errors in a
  /// header file b.hpp.
  /// @since 3.17.0
  final Map<Uri, Object> relatedDocuments;

  /// A result id which will be sent on the next diagnostic request for the
  /// same document.
  @override
  final String resultId;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A diagnostic report with a full set of problems.
/// @since 3.17.0
class FullDocumentDiagnosticReport implements ToJson {
  FullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    required this.resultId,
  });

  /// The actual items.
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  final String kind;

  /// An optional result id. If provided it will be sent on the next
  /// diagnostic request for the same document.
  final String resultId;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A diagnostic report indicating that the last returned report is still
/// accurate.
/// @since 3.17.0
class UnchangedDocumentDiagnosticReport implements ToJson {
  UnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
  });

  /// A document diagnostic report indicating no changes to the last result.
  /// A server can only return `unchanged` if result ids are provided.
  final String kind;

  /// A result id which will be sent on the next diagnostic request for the
  /// same document.
  final String resultId;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Diagnostic options.
/// @since 3.17.0
class DiagnosticOptions implements WorkDoneProgressOptions {
  DiagnosticOptions({
    required this.identifier,
    required this.interFileDependencies,
    required this.workDoneProgress,
    required this.workspaceDiagnostics,
  });

  /// An optional identifier under which the diagnostics are managed by the
  /// client.
  final String identifier;

  /// Whether the language has inter file dependencies meaning that editing
  /// code in one file can result in a different diagnostic set in another
  /// file. Inter file dependencies are common for most programming languages
  /// and typically uncommon for linters.
  final bool interFileDependencies;

  @override
  final bool workDoneProgress;

  /// The server provides support for workspace diagnostics as well.
  final bool workspaceDiagnostics;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A previous result id in a workspace pull request.
/// @since 3.17.0
class PreviousResultId implements ToJson {
  PreviousResultId({required this.uri, required this.value});

  /// The URI for which the client knowns a result id.
  final Uri uri;

  /// The value of the previous result id.
  final String value;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A notebook document.
/// @since 3.17.0
class NotebookDocument implements ToJson {
  NotebookDocument({
    required this.cells,
    required this.metadata,
    required this.notebookType,
    required this.uri,
    required this.version,
  });

  /// The cells of a notebook.
  final List<NotebookCell> cells;

  /// Additional metadata stored with the notebook document.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject metadata;

  /// The type of the notebook.
  final String notebookType;

  /// The notebook document's uri.
  final Uri uri;

  /// The version number of this document (it will increase after each
  /// change, including undo/redo).
  final int version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An item to transfer a text document from the client to the server.
class TextDocumentItem implements ToJson {
  TextDocumentItem({
    required this.languageId,
    required this.text,
    required this.uri,
    required this.version,
  });

  /// The text document's language identifier.
  final String languageId;

  /// The content of the opened text document.
  final String text;

  /// The text document's uri.
  final Uri uri;

  /// The version number of this document (it will increase after each
  /// change, including undo/redo).
  final int version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A versioned notebook document identifier.
/// @since 3.17.0
class VersionedNotebookDocumentIdentifier implements ToJson {
  VersionedNotebookDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  /// The notebook document's uri.
  final Uri uri;

  /// The version number of this notebook document.
  final int version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A change event for a notebook document.
/// @since 3.17.0
class NotebookDocumentChangeEvent implements ToJson {
  NotebookDocumentChangeEvent({required this.cells, required this.metadata});

  /// Changes to cells
  final Object cells;

  /// The changed meta data if any.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject metadata;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A literal to identify a notebook document in the client.
/// @since 3.17.0
class NotebookDocumentIdentifier implements ToJson {
  NotebookDocumentIdentifier({required this.uri});

  /// The notebook document's uri.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides information about the context in which an inline completion was
/// requested.
/// @since 3.18.0 @proposed
class InlineCompletionContext implements ToJson {
  InlineCompletionContext({
    required this.selectedCompletionInfo,
    required this.triggerKind,
  });

  /// Provides information about the currently selected item in the
  /// autocomplete widget if it is visible.
  final SelectedCompletionInfo selectedCompletionInfo;

  /// Describes how the inline completion was triggered.
  final InlineCompletionTriggerKind triggerKind;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A string value used as a snippet is a template which allows to insert text
/// and to control the editor cursor when insertion happens.
/// A snippet can define tab stops and placeholders with `$1`, `$2` and
/// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
/// snippet. Variables are defined with `$name` and `${name:default value}`.
/// @since 3.18.0 @proposed
class StringValue implements ToJson {
  StringValue({required this.kind, required this.value});

  /// The kind of string value.
  final String kind;

  /// The snippet string.
  final String value;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline completion options used during static registration.
/// @since 3.18.0 @proposed
class InlineCompletionOptions implements WorkDoneProgressOptions {
  InlineCompletionOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General parameters to register for a notification or to register a provider.
class Registration implements ToJson {
  Registration({
    required this.id,
    required this.method,
    required this.registerOptions,
  });

  /// The id used to register the request. The id can be used to deregister
  /// the request again.
  final String id;

  /// The method / capability to register for.
  final String method;

  /// Options necessary for the registration.
  final LSPAny registerOptions;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General parameters to unregister a request or notification.
class Unregistration implements ToJson {
  Unregistration({required this.id, required this.method});

  /// The id used to unregister the request or notification. Usually an id
  /// provided during the register request.
  final String id;

  /// The method to unregister for.
  final String method;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The initialize parameters
class _InitializeParams implements WorkDoneProgressParams {
  _InitializeParams({
    required this.capabilities,
    required this.clientInfo,
    required this.initializationOptions,
    required this.locale,
    required this.processId,
    required this.rootPath,
    required this.rootUri,
    required this.trace,
    required this.workDoneToken,
  });

  /// The capabilities provided by the client (editor or tool)
  final ClientCapabilities capabilities;

  /// Information about the client
  /// @since 3.15.0
  final Object clientInfo;

  /// User provided initialization options.
  final LSPAny initializationOptions;

  /// The locale the client is currently showing the user interface in. This
  /// must not necessarily be the locale of the operating system.
  /// Uses IETF language tags as the value's syntax (See
  /// https://en.wikipedia.org/wiki/IETF_language_tag)
  /// @since 3.16.0
  final String locale;

  /// The process Id of the parent process that started the server.
  /// Is `null` if the process has not been started by another process. If
  /// the parent process is not alive then the server should exit.
  final Object processId;

  /// The rootPath of the workspace. Is null if no folder is open.
  /// @deprecated in favour of rootUri.
  final Object rootPath;

  /// The rootUri of the workspace. Is null if no folder is open. If both
  /// `rootPath` and `rootUri` are set `rootUri` wins.
  /// @deprecated in favour of workspaceFolders.
  final Object rootUri;

  /// The initial trace setting. If omitted trace is disabled ('off').
  final TraceValues trace;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken workDoneToken;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkspaceFoldersInitializeParams implements ToJson {
  WorkspaceFoldersInitializeParams({required this.workspaceFolders});

  /// The workspace folders configured in the client when the server starts.
  /// This property is only available if the client supports workspace
  /// folders. It can be `null` if the client supports workspace folders but
  /// none are configured.
  /// @since 3.6.0
  final Object workspaceFolders;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines the capabilities provided by a language server.
class ServerCapabilities implements ToJson {
  ServerCapabilities({
    required this.callHierarchyProvider,
    required this.codeActionProvider,
    required this.codeLensProvider,
    required this.colorProvider,
    required this.completionProvider,
    required this.declarationProvider,
    required this.definitionProvider,
    required this.diagnosticProvider,
    required this.documentFormattingProvider,
    required this.documentHighlightProvider,
    required this.documentLinkProvider,
    required this.documentOnTypeFormattingProvider,
    required this.documentRangeFormattingProvider,
    required this.documentSymbolProvider,
    required this.executeCommandProvider,
    required this.experimental,
    required this.foldingRangeProvider,
    required this.hoverProvider,
    required this.implementationProvider,
    required this.inlayHintProvider,
    required this.inlineCompletionProvider,
    required this.inlineValueProvider,
    required this.linkedEditingRangeProvider,
    required this.monikerProvider,
    required this.notebookDocumentSync,
    required this.positionEncoding,
    required this.referencesProvider,
    required this.renameProvider,
    required this.selectionRangeProvider,
    required this.semanticTokensProvider,
    required this.signatureHelpProvider,
    required this.textDocumentSync,
    required this.typeDefinitionProvider,
    required this.typeHierarchyProvider,
    required this.workspace,
    required this.workspaceSymbolProvider,
  });

  /// The server provides call hierarchy support.
  /// @since 3.16.0
  final Object callHierarchyProvider;

  /// The server provides code actions. CodeActionOptions may only be
  /// specified if the client states that it supports
  /// `codeActionLiteralSupport` in its initial `initialize` request.
  final Object codeActionProvider;

  /// The server provides code lens.
  final CodeLensOptions codeLensProvider;

  /// The server provides color provider support.
  final Object colorProvider;

  /// The server provides completion support.
  final CompletionOptions completionProvider;

  /// The server provides Goto Declaration support.
  final Object declarationProvider;

  /// The server provides goto definition support.
  final Object definitionProvider;

  /// The server has support for pull model diagnostics.
  /// @since 3.17.0
  final Object diagnosticProvider;

  /// The server provides document formatting.
  final Object documentFormattingProvider;

  /// The server provides document highlight support.
  final Object documentHighlightProvider;

  /// The server provides document link support.
  final DocumentLinkOptions documentLinkProvider;

  /// The server provides document formatting on typing.
  final DocumentOnTypeFormattingOptions documentOnTypeFormattingProvider;

  /// The server provides document range formatting.
  final Object documentRangeFormattingProvider;

  /// The server provides document symbol support.
  final Object documentSymbolProvider;

  /// The server provides execute command support.
  final ExecuteCommandOptions executeCommandProvider;

  /// Experimental server capabilities.
  final LSPAny experimental;

  /// The server provides folding provider support.
  final Object foldingRangeProvider;

  /// The server provides hover support.
  final Object hoverProvider;

  /// The server provides Goto Implementation support.
  final Object implementationProvider;

  /// The server provides inlay hints.
  /// @since 3.17.0
  final Object inlayHintProvider;

  /// Inline completion options used during static registration.
  /// @since 3.18.0 @proposed
  final Object inlineCompletionProvider;

  /// The server provides inline values.
  /// @since 3.17.0
  final Object inlineValueProvider;

  /// The server provides linked editing range support.
  /// @since 3.16.0
  final Object linkedEditingRangeProvider;

  /// The server provides moniker support.
  /// @since 3.16.0
  final Object monikerProvider;

  /// Defines how notebook documents are synced.
  /// @since 3.17.0
  final Object notebookDocumentSync;

  /// The position encoding the server picked from the encodings offered by
  /// the client via the client capability `general.positionEncodings`.
  /// If the client didn't provide any position encodings the only valid
  /// value that a server can return is 'utf-16'.
  /// If omitted it defaults to 'utf-16'.
  /// @since 3.17.0
  final PositionEncodingKind positionEncoding;

  /// The server provides find references support.
  final Object referencesProvider;

  /// The server provides rename support. RenameOptions may only be specified
  /// if the client states that it supports `prepareSupport` in its initial
  /// `initialize` request.
  final Object renameProvider;

  /// The server provides selection range support.
  final Object selectionRangeProvider;

  /// The server provides semantic tokens support.
  /// @since 3.16.0
  final Object semanticTokensProvider;

  /// The server provides signature help support.
  final SignatureHelpOptions signatureHelpProvider;

  /// Defines how text documents are synced. Is either a detailed structure
  /// defining each notification or for backwards compatibility the
  /// TextDocumentSyncKind number.
  final Object textDocumentSync;

  /// The server provides Goto Type Definition support.
  final Object typeDefinitionProvider;

  /// The server provides type hierarchy support.
  /// @since 3.17.0
  final Object typeHierarchyProvider;

  /// Workspace specific server capabilities.
  final Object workspace;

  /// The server provides workspace symbol support.
  final Object workspaceSymbolProvider;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A text document identifier to denote a specific version of a text document.
class VersionedTextDocumentIdentifier implements TextDocumentIdentifier {
  VersionedTextDocumentIdentifier({required this.uri, required this.version});

  /// The text document's uri.
  @override
  final Uri uri;

  /// The version number of this document.
  final int version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Save options.
class SaveOptions implements ToJson {
  SaveOptions({required this.includeText});

  /// The client is supposed to include the content on save.
  final bool includeText;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An event describing a file change.
class FileEvent implements ToJson {
  FileEvent({required this.type, required this.uri});

  /// The change type.
  final FileChangeType type;

  /// The file's uri.
  final Uri uri;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FileSystemWatcher implements ToJson {
  FileSystemWatcher({required this.globPattern, required this.kind});

  /// The glob pattern to watch. See {@link GlobPattern glob pattern} for
  /// more detail.
  /// @since 3.17.0 support for relative patterns.
  final GlobPattern globPattern;

  /// The kind of events of interest. If omitted it defaults to
  /// WatchKind.Create | WatchKind.Change | WatchKind.Delete which is 7.
  final WatchKind kind;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic
/// objects are only valid in the scope of a resource.
class Diagnostic implements ToJson {
  Diagnostic({
    required this.code,
    required this.codeDescription,
    required this.data,
    required this.message,
    required this.range,
    required this.relatedInformation,
    required this.severity,
    required this.source,
    required this.tags,
  });

  /// The diagnostic's code, which usually appear in the user interface.
  final Object code;

  /// An optional property to describe the error code. Requires the code
  /// field (above) to be present/not null.
  /// @since 3.16.0
  final CodeDescription codeDescription;

  /// A data entry field that is preserved between a
  /// `textDocument/publishDiagnostics` notification and
  /// `textDocument/codeAction` request.
  /// @since 3.16.0
  final LSPAny data;

  /// The diagnostic's message. It usually appears in the user interface
  final String message;

  /// The range at which the message applies
  final Range range;

  /// An array of related diagnostic information, e.g. when symbol-names
  /// within a scope collide all definitions can be marked via this property.
  final List<DiagnosticRelatedInformation> relatedInformation;

  /// The diagnostic's severity. Can be omitted. If omitted it is up to the
  /// client to interpret diagnostics as error, warning, info or hint.
  final DiagnosticSeverity severity;

  /// A human-readable string describing the source of this diagnostic, e.g.
  /// 'typescript' or 'super lint'. It usually appears in the user interface.
  final String source;

  /// Additional metadata about the diagnostic.
  /// @since 3.15.0
  final List<DiagnosticTag> tags;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains additional information about the context in which a completion
/// request is triggered.
class CompletionContext implements ToJson {
  CompletionContext({
    required this.triggerCharacter,
    required this.triggerKind,
  });

  /// The trigger character (a single character) that has trigger code
  /// complete. Is undefined if `triggerKind !==
  /// CompletionTriggerKind.TriggerCharacter`
  final String triggerCharacter;

  /// How the completion was triggered.
  final CompletionTriggerKind triggerKind;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Additional details for a completion item label.
/// @since 3.17.0
class CompletionItemLabelDetails implements ToJson {
  CompletionItemLabelDetails({required this.description, required this.detail});

  /// An optional string which is rendered less prominently after {@link
  /// CompletionItem.detail}. Should be used for fully qualified names and
  /// file paths.
  final String description;

  /// An optional string which is rendered less prominently directly after
  /// {@link CompletionItem.label label}, without any spacing. Should be used
  /// for function signatures and type annotations.
  final String detail;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A special text edit to provide an insert and a replace operation.
/// @since 3.16.0
class InsertReplaceEdit implements ToJson {
  InsertReplaceEdit({
    required this.insert,
    required this.newText,
    required this.replace,
  });

  /// The range if the insert is requested
  final Range insert;

  /// The string to be inserted.
  final String newText;

  /// The range if the replace is requested.
  final Range replace;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Completion options.
class CompletionOptions implements WorkDoneProgressOptions {
  CompletionOptions({
    required this.allCommitCharacters,
    required this.completionItem,
    required this.resolveProvider,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  /// The list of all possible characters that commit a completion. This
  /// field can be used if clients don't support individual commit characters
  /// per completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
  /// If a server provides both `allCommitCharacters` and commit characters
  /// on an individual completion item the ones on the completion item win.
  /// @since 3.2.0
  final List<String> allCommitCharacters;

  /// The server supports the following `CompletionItem` specific
  /// capabilities.
  /// @since 3.17.0
  final Object completionItem;

  /// The server provides support to resolve additional information for a
  /// completion item.
  final bool resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
  /// they do so when the user starts to type an identifier. For example if
  /// the user types `c` in a JavaScript file code complete will
  /// automatically pop up present `console` besides others as a completion
  /// item. Characters that make up identifiers don't need to be listed here.
  /// If code complete should automatically be trigger on characters not
  /// being valid inside an identifier (for example `.` in JavaScript) list
  /// them in `triggerCharacters`.
  final List<String> triggerCharacters;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Hover options.
class HoverOptions implements WorkDoneProgressOptions {
  HoverOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Additional information about the context in which a signature help request
/// was triggered.
/// @since 3.15.0
class SignatureHelpContext implements ToJson {
  SignatureHelpContext({
    required this.activeSignatureHelp,
    required this.isRetrigger,
    required this.triggerCharacter,
    required this.triggerKind,
  });

  /// The currently active `SignatureHelp`.
  /// The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field
  /// updated based on the user navigating through available signatures.
  final SignatureHelp activeSignatureHelp;

  /// `true` if signature help was already showing when it was triggered.
  /// Retriggers occurs when the signature help is already active and can be
  /// caused by actions such as typing a trigger character, a cursor move, or
  /// document content changes.
  final bool isRetrigger;

  /// Character that caused signature help to be triggered.
  /// This is undefined when `triggerKind !==
  /// SignatureHelpTriggerKind.TriggerCharacter`
  final String triggerCharacter;

  /// Action that caused signature help to be triggered.
  final SignatureHelpTriggerKind triggerKind;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the signature of something callable. A signature can have a
/// label, like a function-name, a doc-comment, and a set of parameters.
class SignatureInformation implements ToJson {
  SignatureInformation({
    required this.activeParameter,
    required this.documentation,
    required this.label,
    required this.parameters,
  });

  /// The index of the active parameter.
  /// If provided, this is used in place of `SignatureHelp.activeParameter`.
  /// @since 3.16.0
  final int activeParameter;

  /// The human-readable doc-comment of this signature. Will be shown in the
  /// UI but can be omitted.
  final Object documentation;

  /// The label of this signature. Will be shown in the UI.
  final String label;

  /// The parameters of this signature.
  final List<ParameterInformation> parameters;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Server Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpOptions implements WorkDoneProgressOptions {
  SignatureHelpOptions({
    required this.retriggerCharacters,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  /// List of characters that re-trigger signature help.
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger
  /// characters.
  /// @since 3.15.0
  final List<String> retriggerCharacters;

  /// List of characters that trigger signature help automatically.
  final List<String> triggerCharacters;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Server Capabilities for a {@link DefinitionRequest}.
class DefinitionOptions implements WorkDoneProgressOptions {
  DefinitionOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Value-object that contains additional information when requesting
/// references.
class ReferenceContext implements ToJson {
  ReferenceContext({required this.includeDeclaration});

  /// Include the declaration of the current symbol.
  final bool includeDeclaration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Reference options.
class ReferenceOptions implements WorkDoneProgressOptions {
  ReferenceOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentHighlightRequest}.
class DocumentHighlightOptions implements WorkDoneProgressOptions {
  DocumentHighlightOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A base for all symbol information.
class BaseSymbolInformation implements ToJson {
  BaseSymbolInformation({
    required this.containerName,
    required this.kind,
    required this.name,
    required this.tags,
  });

  /// The name of the symbol containing this symbol. This information is for
  /// user interface purposes (e.g. to render a qualifier in the user
  /// interface if necessary). It can't be used to re-infer a hierarchy for
  /// the document symbols.
  final String containerName;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The name of this symbol.
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  final List<SymbolTag> tags;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentSymbolRequest}.
class DocumentSymbolOptions implements WorkDoneProgressOptions {
  DocumentSymbolOptions({required this.label, required this.workDoneProgress});

  /// A human-readable string that is shown when multiple outlines trees are
  /// shown for the same document.
  /// @since 3.16.0
  final String label;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains additional diagnostic information about the context in which a
/// {@link CodeActionProvider.provideCodeActions code action} is run.
class CodeActionContext implements ToJson {
  CodeActionContext({
    required this.diagnostics,
    required this.only,
    required this.triggerKind,
  });

  /// An array of diagnostics known on the client side overlapping the range
  /// provided to the `textDocument/codeAction` request. They are provided so
  /// that the server knows which errors are currently presented to the user
  /// for the given range. There is no guarantee that these accurately
  /// reflect the error state of the resource. The primary parameter to
  /// compute code actions is the provided range.
  final List<Diagnostic> diagnostics;

  /// Requested kind of actions to return.
  /// Actions not of this kind are filtered out by the client before being
  /// shown. So servers can omit computing them.
  final List<CodeActionKind> only;

  /// The reason why code actions were requested.
  /// @since 3.17.0
  final CodeActionTriggerKind triggerKind;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link CodeActionRequest}.
class CodeActionOptions implements WorkDoneProgressOptions {
  CodeActionOptions({
    required this.codeActionKinds,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// CodeActionKinds that this server may return.
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
  /// the server may list out every specific kind they provide.
  final List<CodeActionKind> codeActionKinds;

  /// The server provides support to resolve additional information for a
  /// code action.
  /// @since 3.16.0
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Server capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolOptions implements WorkDoneProgressOptions {
  WorkspaceSymbolOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// The server provides support to resolve additional information for a
  /// workspace symbol.
  /// @since 3.17.0
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Code Lens provider options of a {@link CodeLensRequest}.
class CodeLensOptions implements WorkDoneProgressOptions {
  CodeLensOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// Code lens has a resolve provider as well.
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentLinkRequest}.
class DocumentLinkOptions implements WorkDoneProgressOptions {
  DocumentLinkOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  /// Document links have a resolve provider as well.
  final bool resolveProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Value-object describing what options formatting should use.
class FormattingOptions implements ToJson {
  FormattingOptions({
    required this.insertFinalNewline,
    required this.insertSpaces,
    required this.tabSize,
    required this.trimFinalNewlines,
    required this.trimTrailingWhitespace,
  });

  /// Insert a newline character at the end of the file if one does not exist.
  /// @since 3.15.0
  final bool insertFinalNewline;

  /// Prefer spaces over tabs.
  final bool insertSpaces;

  /// Size of a tab in spaces.
  final int tabSize;

  /// Trim all newlines after the final newline at the end of the file.
  /// @since 3.15.0
  final bool trimFinalNewlines;

  /// Trim trailing whitespace on a line.
  /// @since 3.15.0
  final bool trimTrailingWhitespace;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentFormattingRequest}.
class DocumentFormattingOptions implements WorkDoneProgressOptions {
  DocumentFormattingOptions({required this.workDoneProgress});

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingOptions implements WorkDoneProgressOptions {
  DocumentRangeFormattingOptions({
    required this.rangesSupport,
    required this.workDoneProgress,
  });

  /// Whether the server supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  final bool rangesSupport;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingOptions implements ToJson {
  DocumentOnTypeFormattingOptions({
    required this.firstTriggerCharacter,
    required this.moreTriggerCharacter,
  });

  /// A character on which formatting should be triggered, like `{`.
  final String firstTriggerCharacter;

  /// More trigger characters.
  final List<String> moreTriggerCharacter;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link RenameRequest}.
class RenameOptions implements WorkDoneProgressOptions {
  RenameOptions({
    required this.prepareProvider,
    required this.workDoneProgress,
  });

  /// Renames should be checked and tested before being executed.
  /// @since version 3.12.0
  final bool prepareProvider;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The server capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandOptions implements WorkDoneProgressOptions {
  ExecuteCommandOptions({
    required this.commands,
    required this.workDoneProgress,
  });

  /// The commands to be executed on the server
  final List<String> commands;

  @override
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensLegend implements ToJson {
  SemanticTokensLegend({
    required this.tokenModifiers,
    required this.tokenTypes,
  });

  /// The token modifiers a server uses.
  final List<String> tokenModifiers;

  /// The token types a server uses.
  final List<String> tokenTypes;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A text document identifier to optionally denote a specific version of a
/// text document.
class OptionalVersionedTextDocumentIdentifier
    implements TextDocumentIdentifier {
  OptionalVersionedTextDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  /// The text document's uri.
  @override
  final Uri uri;

  /// The version number of this document. If a versioned text document
  /// identifier is sent from the server to the client and the file is not
  /// open in the editor (the server has not received an open notification
  /// before) the server can send `null` to indicate that the version is
  /// unknown and the content on disk is the truth (as specified with
  /// document content ownership).
  final Object version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A special text edit with an additional change annotation.
/// @since 3.16.0.
class AnnotatedTextEdit implements TextEdit {
  AnnotatedTextEdit({
    required this.annotationId,
    required this.newText,
    required this.range,
  });

  /// The actual identifier of the change annotation
  final ChangeAnnotationIdentifier annotationId;

  /// The string to be inserted. For delete operations use an empty string.
  @override
  final String newText;

  /// The range of the text document to be manipulated. To insert text into a
  /// document create a range where start === end.
  @override
  final Range range;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A generic resource operation.
class ResourceOperation implements ToJson {
  ResourceOperation({required this.annotationId, required this.kind});

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  final ChangeAnnotationIdentifier annotationId;

  /// The resource operation kind.
  final String kind;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Options to create a file.
class CreateFileOptions implements ToJson {
  CreateFileOptions({required this.ignoreIfExists, required this.overwrite});

  /// Ignore if exists.
  final bool ignoreIfExists;

  /// Overwrite existing file. Overwrite wins over `ignoreIfExists`
  final bool overwrite;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Rename file options
class RenameFileOptions implements ToJson {
  RenameFileOptions({required this.ignoreIfExists, required this.overwrite});

  /// Ignores if target exists.
  final bool ignoreIfExists;

  /// Overwrite target if existing. Overwrite wins over `ignoreIfExists`
  final bool overwrite;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Delete file options
class DeleteFileOptions implements ToJson {
  DeleteFileOptions({required this.ignoreIfNotExists, required this.recursive});

  /// Ignore the operation if the file doesn't exist.
  final bool ignoreIfNotExists;

  /// Delete the content recursively if a folder is denoted.
  final bool recursive;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A pattern to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationPattern implements ToJson {
  FileOperationPattern({
    required this.glob,
    required this.matches,
    required this.options,
  });

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
  final String glob;

  /// Whether to match files or folders with this pattern.
  /// Matches both if undefined.
  final FileOperationPatternKind matches;

  /// Additional options used during matching.
  final FileOperationPatternOptions options;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A full document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceFullDocumentDiagnosticReport
    implements FullDocumentDiagnosticReport {
  WorkspaceFullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    required this.resultId,
    required this.uri,
    required this.version,
  });

  /// The actual items.
  @override
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  @override
  final String kind;

  /// An optional result id. If provided it will be sent on the next
  /// diagnostic request for the same document.
  @override
  final String resultId;

  /// The URI for which diagnostic information is reported.
  final Uri uri;

  /// The version number for which the diagnostics are reported. If the
  /// document is not marked as open `null` can be provided.
  final Object version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An unchanged document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceUnchangedDocumentDiagnosticReport
    implements UnchangedDocumentDiagnosticReport {
  WorkspaceUnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
    required this.uri,
    required this.version,
  });

  /// A document diagnostic report indicating no changes to the last result.
  /// A server can only return `unchanged` if result ids are provided.
  @override
  final String kind;

  /// A result id which will be sent on the next diagnostic request for the
  /// same document.
  @override
  final String resultId;

  /// The URI for which diagnostic information is reported.
  final Uri uri;

  /// The version number for which the diagnostics are reported. If the
  /// document is not marked as open `null` can be provided.
  final Object version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A notebook cell.
/// A cell's document URI must be unique across ALL notebook cells and can
/// therefore be used to uniquely identify a notebook cell or the cell's text
/// document.
/// @since 3.17.0
class NotebookCell implements ToJson {
  NotebookCell({
    required this.document,
    required this.executionSummary,
    required this.kind,
    required this.metadata,
  });

  /// The URI of the cell's text document content.
  final Uri document;

  /// Additional execution summary information if supported by the client.
  final ExecutionSummary executionSummary;

  /// The cell's kind
  final NotebookCellKind kind;

  /// Additional metadata stored with the cell.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject metadata;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A change describing how to move a `NotebookCell` array from state S to S'.
/// @since 3.17.0
class NotebookCellArrayChange implements ToJson {
  NotebookCellArrayChange({
    required this.cells,
    required this.deleteCount,
    required this.start,
  });

  /// The new cells, if any
  final List<NotebookCell> cells;

  /// The deleted cells
  final int deleteCount;

  /// The start oftest of the cell that changed.
  final int start;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the currently selected completion item.
/// @since 3.18.0 @proposed
class SelectedCompletionInfo implements ToJson {
  SelectedCompletionInfo({required this.range, required this.text});

  /// The range that will be replaced if this completion item is accepted.
  final Range range;

  /// The text the range will be replaced with if this completion is accepted.
  final String text;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines the capabilities provided by the client.
class ClientCapabilities implements ToJson {
  ClientCapabilities({
    required this.experimental,
    required this.general,
    required this.notebookDocument,
    required this.textDocument,
    required this.window,
    required this.workspace,
  });

  /// Experimental client capabilities.
  final LSPAny experimental;

  /// General client capabilities.
  /// @since 3.16.0
  final GeneralClientCapabilities general;

  /// Capabilities specific to the notebook document support.
  /// @since 3.17.0
  final NotebookDocumentClientCapabilities notebookDocument;

  /// Text document specific client capabilities.
  final TextDocumentClientCapabilities textDocument;

  /// Window specific client capabilities.
  final WindowClientCapabilities window;

  /// Workspace specific client capabilities.
  final WorkspaceClientCapabilities workspace;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TextDocumentSyncOptions implements ToJson {
  TextDocumentSyncOptions({
    required this.change,
    required this.openClose,
    required this.save,
    required this.willSave,
    required this.willSaveWaitUntil,
  });

  /// Change notifications are sent to the server. See
  /// TextDocumentSyncKind.None, TextDocumentSyncKind.Full and
  /// TextDocumentSyncKind.Incremental. If omitted it defaults to
  /// TextDocumentSyncKind.None.
  final TextDocumentSyncKind change;

  /// Open and close notifications are sent to the server. If omitted open
  /// close notification should not be sent.
  final bool openClose;

  /// If present save notifications are sent to the server. If omitted the
  /// notification should not be sent.
  final Object save;

  /// If present will save notifications are sent to the server. If omitted
  /// the notification should not be sent.
  final bool willSave;

  /// If present will save wait until requests are sent to the server. If
  /// omitted the request should not be sent.
  final bool willSaveWaitUntil;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Options specific to a notebook plus its cells to be synced to the server.
/// If a selector provides a notebook document filter but no cell selector all
/// cells of a matching notebook document will be synced.
/// If a selector provides no notebook document filter but only a cell selector
/// all notebook document that contain at least one matching cell will be
/// synced.
/// @since 3.17.0
class NotebookDocumentSyncOptions implements ToJson {
  NotebookDocumentSyncOptions({
    required this.notebookSelector,
    required this.save,
  });

  /// The notebooks to be synced
  final List<Object> notebookSelector;

  /// Whether save notification should be forwarded to the server. Will only
  /// be honored if mode === `notebook`.
  final bool save;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options specific to a notebook.
/// @since 3.17.0
class NotebookDocumentSyncRegistrationOptions
    implements NotebookDocumentSyncOptions, StaticRegistrationOptions {
  NotebookDocumentSyncRegistrationOptions({
    required this.id,
    required this.notebookSelector,
    required this.save,
  });

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String id;

  /// The notebooks to be synced
  @override
  final List<Object> notebookSelector;

  /// Whether save notification should be forwarded to the server. Will only
  /// be honored if mode === `notebook`.
  @override
  final bool save;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkspaceFoldersServerCapabilities implements ToJson {
  WorkspaceFoldersServerCapabilities({
    required this.changeNotifications,
    required this.supported,
  });

  /// Whether the server wants to receive workspace folder change
  /// notifications.
  /// If a string is provided the string is treated as an ID under which the
  /// notification is registered on the client side. The ID can be used to
  /// unregister for these events using the `client/unregisterCapability`
  /// request.
  final Object changeNotifications;

  /// The server has support for workspace folders
  final bool supported;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Options for notifications/requests for user operations on files.
/// @since 3.16.0
class FileOperationOptions implements ToJson {
  FileOperationOptions({
    required this.didCreate,
    required this.didDelete,
    required this.didRename,
    required this.willCreate,
    required this.willDelete,
    required this.willRename,
  });

  /// The server is interested in receiving didCreateFiles notifications.
  final FileOperationRegistrationOptions didCreate;

  /// The server is interested in receiving didDeleteFiles file notifications.
  final FileOperationRegistrationOptions didDelete;

  /// The server is interested in receiving didRenameFiles notifications.
  final FileOperationRegistrationOptions didRename;

  /// The server is interested in receiving willCreateFiles requests.
  final FileOperationRegistrationOptions willCreate;

  /// The server is interested in receiving willDeleteFiles file requests.
  final FileOperationRegistrationOptions willDelete;

  /// The server is interested in receiving willRenameFiles requests.
  final FileOperationRegistrationOptions willRename;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Structure to capture a description for an error code.
/// @since 3.16.0
class CodeDescription implements ToJson {
  CodeDescription({required this.href});

  /// An URI to open with more information about the diagnostic error.
  final Uri href;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a related message and source code location for a diagnostic.
/// This should be used to point to code locations that cause or related to a
/// diagnostics, e.g when duplicating a symbol in a scope.
class DiagnosticRelatedInformation implements ToJson {
  DiagnosticRelatedInformation({required this.location, required this.message});

  /// The location of this related diagnostic information.
  final Location location;

  /// The message of this related diagnostic information.
  final String message;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a parameter of a callable-signature. A parameter can have a
/// label and a doc-comment.
class ParameterInformation implements ToJson {
  ParameterInformation({required this.documentation, required this.label});

  /// The human-readable doc-comment of this parameter. Will be shown in the
  /// UI but can be omitted.
  final Object documentation;

  /// The label of this parameter information.
  /// Either a string or an inclusive start and exclusive end offsets within
  /// its containing signature label. (see SignatureInformation.label). The
  /// offsets are based on a UTF-16 string representation as `Position` and
  /// `Range` does.
  /// *Note*: a label of type string should be a substring of its containing
  /// signature label. Its intended use case is to highlight the parameter
  /// label part in the `SignatureInformation.label`.
  final Object label;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A notebook cell text document filter denotes a cell text document by
/// different properties.
/// @since 3.17.0
class NotebookCellTextDocumentFilter implements ToJson {
  NotebookCellTextDocumentFilter({
    required this.language,
    required this.notebook,
  });

  /// A language id like `python`.
  /// Will be matched against the language id of the notebook cell document.
  /// '*' matches every language.
  final String language;

  /// A filter that matches against the notebook containing the notebook
  /// cell. If a string value is provided it matches against the notebook
  /// type. '*' matches every notebook.
  final Object notebook;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Matching options for the file operation pattern.
/// @since 3.16.0
class FileOperationPatternOptions implements ToJson {
  FileOperationPatternOptions({required this.ignoreCase});

  /// The pattern should be matched ignoring casing.
  final bool ignoreCase;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ExecutionSummary implements ToJson {
  ExecutionSummary({required this.executionOrder, required this.success});

  /// A strict monotonically increasing value indicating the execution order
  /// of a cell inside a notebook.
  final int executionOrder;

  /// Whether the execution was successful or not if known by the client.
  final bool success;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Workspace specific client capabilities.
class WorkspaceClientCapabilities implements ToJson {
  WorkspaceClientCapabilities({
    required this.applyEdit,
    required this.codeLens,
    required this.configuration,
    required this.diagnostics,
    required this.didChangeConfiguration,
    required this.didChangeWatchedFiles,
    required this.executeCommand,
    required this.fileOperations,
    required this.foldingRange,
    required this.inlayHint,
    required this.inlineValue,
    required this.semanticTokens,
    required this.symbol,
    required this.workspaceEdit,
    required this.workspaceFolders,
  });

  /// The client supports applying batch edits to the workspace by supporting
  /// the request 'workspace/applyEdit'
  final bool applyEdit;

  /// Capabilities specific to the code lens requests scoped to the workspace.
  /// @since 3.16.0.
  final CodeLensWorkspaceClientCapabilities codeLens;

  /// The client supports `workspace/configuration` requests.
  /// @since 3.6.0
  final bool configuration;

  /// Capabilities specific to the diagnostic requests scoped to the
  /// workspace.
  /// @since 3.17.0.
  final DiagnosticWorkspaceClientCapabilities diagnostics;

  /// Capabilities specific to the `workspace/didChangeConfiguration`
  /// notification.
  final DidChangeConfigurationClientCapabilities didChangeConfiguration;

  /// Capabilities specific to the `workspace/didChangeWatchedFiles`
  /// notification.
  final DidChangeWatchedFilesClientCapabilities didChangeWatchedFiles;

  /// Capabilities specific to the `workspace/executeCommand` request.
  final ExecuteCommandClientCapabilities executeCommand;

  /// The client has support for file notifications/requests for user
  /// operations on files.
  /// Since 3.16.0
  final FileOperationClientCapabilities fileOperations;

  /// Capabilities specific to the folding range requests scoped to the
  /// workspace.
  /// @since 3.18.0 @proposed
  final FoldingRangeWorkspaceClientCapabilities foldingRange;

  /// Capabilities specific to the inlay hint requests scoped to the
  /// workspace.
  /// @since 3.17.0.
  final InlayHintWorkspaceClientCapabilities inlayHint;

  /// Capabilities specific to the inline values requests scoped to the
  /// workspace.
  /// @since 3.17.0.
  final InlineValueWorkspaceClientCapabilities inlineValue;

  /// Capabilities specific to the semantic token requests scoped to the
  /// workspace.
  /// @since 3.16.0.
  final SemanticTokensWorkspaceClientCapabilities semanticTokens;

  /// Capabilities specific to the `workspace/symbol` request.
  final WorkspaceSymbolClientCapabilities symbol;

  /// Capabilities specific to `WorkspaceEdit`s.
  final WorkspaceEditClientCapabilities workspaceEdit;

  /// The client has support for workspace folders.
  /// @since 3.6.0
  final bool workspaceFolders;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Text document specific client capabilities.
class TextDocumentClientCapabilities implements ToJson {
  TextDocumentClientCapabilities({
    required this.callHierarchy,
    required this.codeAction,
    required this.codeLens,
    required this.colorProvider,
    required this.completion,
    required this.declaration,
    required this.definition,
    required this.diagnostic,
    required this.documentHighlight,
    required this.documentLink,
    required this.documentSymbol,
    required this.foldingRange,
    required this.formatting,
    required this.hover,
    required this.implementation,
    required this.inlayHint,
    required this.inlineCompletion,
    required this.inlineValue,
    required this.linkedEditingRange,
    required this.moniker,
    required this.onTypeFormatting,
    required this.publishDiagnostics,
    required this.rangeFormatting,
    required this.references,
    required this.rename,
    required this.selectionRange,
    required this.semanticTokens,
    required this.signatureHelp,
    required this.synchronization,
    required this.typeDefinition,
    required this.typeHierarchy,
  });

  /// Capabilities specific to the various call hierarchy requests.
  /// @since 3.16.0
  final CallHierarchyClientCapabilities callHierarchy;

  /// Capabilities specific to the `textDocument/codeAction` request.
  final CodeActionClientCapabilities codeAction;

  /// Capabilities specific to the `textDocument/codeLens` request.
  final CodeLensClientCapabilities codeLens;

  /// Capabilities specific to the `textDocument/documentColor` and the
  /// `textDocument/colorPresentation` request.
  /// @since 3.6.0
  final DocumentColorClientCapabilities colorProvider;

  /// Capabilities specific to the `textDocument/completion` request.
  final CompletionClientCapabilities completion;

  /// Capabilities specific to the `textDocument/declaration` request.
  /// @since 3.14.0
  final DeclarationClientCapabilities declaration;

  /// Capabilities specific to the `textDocument/definition` request.
  final DefinitionClientCapabilities definition;

  /// Capabilities specific to the diagnostic pull model.
  /// @since 3.17.0
  final DiagnosticClientCapabilities diagnostic;

  /// Capabilities specific to the `textDocument/documentHighlight` request.
  final DocumentHighlightClientCapabilities documentHighlight;

  /// Capabilities specific to the `textDocument/documentLink` request.
  final DocumentLinkClientCapabilities documentLink;

  /// Capabilities specific to the `textDocument/documentSymbol` request.
  final DocumentSymbolClientCapabilities documentSymbol;

  /// Capabilities specific to the `textDocument/foldingRange` request.
  /// @since 3.10.0
  final FoldingRangeClientCapabilities foldingRange;

  /// Capabilities specific to the `textDocument/formatting` request.
  final DocumentFormattingClientCapabilities formatting;

  /// Capabilities specific to the `textDocument/hover` request.
  final HoverClientCapabilities hover;

  /// Capabilities specific to the `textDocument/implementation` request.
  /// @since 3.6.0
  final ImplementationClientCapabilities implementation;

  /// Capabilities specific to the `textDocument/inlayHint` request.
  /// @since 3.17.0
  final InlayHintClientCapabilities inlayHint;

  /// Client capabilities specific to inline completions.
  /// @since 3.18.0 @proposed
  final InlineCompletionClientCapabilities inlineCompletion;

  /// Capabilities specific to the `textDocument/inlineValue` request.
  /// @since 3.17.0
  final InlineValueClientCapabilities inlineValue;

  /// Capabilities specific to the `textDocument/linkedEditingRange` request.
  /// @since 3.16.0
  final LinkedEditingRangeClientCapabilities linkedEditingRange;

  /// Client capabilities specific to the `textDocument/moniker` request.
  /// @since 3.16.0
  final MonikerClientCapabilities moniker;

  /// Capabilities specific to the `textDocument/onTypeFormatting` request.
  final DocumentOnTypeFormattingClientCapabilities onTypeFormatting;

  /// Capabilities specific to the `textDocument/publishDiagnostics`
  /// notification.
  final PublishDiagnosticsClientCapabilities publishDiagnostics;

  /// Capabilities specific to the `textDocument/rangeFormatting` request.
  final DocumentRangeFormattingClientCapabilities rangeFormatting;

  /// Capabilities specific to the `textDocument/references` request.
  final ReferenceClientCapabilities references;

  /// Capabilities specific to the `textDocument/rename` request.
  final RenameClientCapabilities rename;

  /// Capabilities specific to the `textDocument/selectionRange` request.
  /// @since 3.15.0
  final SelectionRangeClientCapabilities selectionRange;

  /// Capabilities specific to the various semantic token request.
  /// @since 3.16.0
  final SemanticTokensClientCapabilities semanticTokens;

  /// Capabilities specific to the `textDocument/signatureHelp` request.
  final SignatureHelpClientCapabilities signatureHelp;

  /// Defines which synchronization capabilities the client supports.
  final TextDocumentSyncClientCapabilities synchronization;

  /// Capabilities specific to the `textDocument/typeDefinition` request.
  /// @since 3.6.0
  final TypeDefinitionClientCapabilities typeDefinition;

  /// Capabilities specific to the various type hierarchy requests.
  /// @since 3.17.0
  final TypeHierarchyClientCapabilities typeHierarchy;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Capabilities specific to the notebook document support.
/// @since 3.17.0
class NotebookDocumentClientCapabilities implements ToJson {
  NotebookDocumentClientCapabilities({required this.synchronization});

  /// Capabilities specific to notebook document synchronization
  /// @since 3.17.0
  final NotebookDocumentSyncClientCapabilities synchronization;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WindowClientCapabilities implements ToJson {
  WindowClientCapabilities({
    required this.showDocument,
    required this.showMessage,
    required this.workDoneProgress,
  });

  /// Capabilities specific to the showDocument request.
  /// @since 3.16.0
  final ShowDocumentClientCapabilities showDocument;

  /// Capabilities specific to the showMessage request.
  /// @since 3.16.0
  final ShowMessageRequestClientCapabilities showMessage;

  /// It indicates whether the client supports server initiated progress
  /// using the `window/workDoneProgress/create` request.
  /// The capability also controls Whether client supports handling of
  /// progress notifications. If set servers are allowed to report a
  /// `workDoneProgress` property in the request specific server
  /// capabilities.
  /// @since 3.15.0
  final bool workDoneProgress;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General client capabilities.
/// @since 3.16.0
class GeneralClientCapabilities implements ToJson {
  GeneralClientCapabilities({
    required this.markdown,
    required this.positionEncodings,
    required this.regularExpressions,
    required this.staleRequestSupport,
  });

  /// Client capabilities specific to the client's markdown parser.
  /// @since 3.16.0
  final MarkdownClientCapabilities markdown;

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
  final List<PositionEncodingKind> positionEncodings;

  /// Client capabilities specific to regular expressions.
  /// @since 3.16.0
  final RegularExpressionsClientCapabilities regularExpressions;

  /// Client capability that signals how the client handles stale requests
  /// (e.g. a request for which the client will not process the response
  /// anymore since the information is outdated).
  /// @since 3.17.0
  final Object staleRequestSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A relative pattern is a helper to construct glob patterns that are matched
/// relatively to a base URI. The common value for a `baseUri` is a workspace
/// folder root, but it can be another absolute URI as well.
/// @since 3.17.0
class RelativePattern implements ToJson {
  RelativePattern({required this.baseUri, required this.pattern});

  /// A workspace folder or a base URI to which this pattern will be matched
  /// against relatively.
  final Object baseUri;

  /// The actual glob pattern;
  final Pattern pattern;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkspaceEditClientCapabilities implements ToJson {
  WorkspaceEditClientCapabilities({
    required this.changeAnnotationSupport,
    required this.documentChanges,
    required this.failureHandling,
    required this.normalizesLineEndings,
    required this.resourceOperations,
  });

  /// Whether the client in general supports change annotations on text
  /// edits, create file, rename file and delete file changes.
  /// @since 3.16.0
  final Object changeAnnotationSupport;

  /// The client supports versioned document changes in `WorkspaceEdit`s
  final bool documentChanges;

  /// The failure handling strategy of a client if applying the workspace
  /// edit fails.
  /// @since 3.13.0
  final FailureHandlingKind failureHandling;

  /// Whether the client normalizes line endings to the client specific
  /// setting. If set to `true` the client will normalize line ending
  /// characters in a workspace edit to the client-specified new line
  /// character.
  /// @since 3.16.0
  final bool normalizesLineEndings;

  /// The resource operations the client supports. Clients should at least
  /// support 'create', 'rename' and 'delete' files and folders.
  /// @since 3.13.0
  final List<ResourceOperationKind> resourceOperations;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DidChangeConfigurationClientCapabilities implements ToJson {
  DidChangeConfigurationClientCapabilities({required this.dynamicRegistration});

  /// Did change configuration notification supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DidChangeWatchedFilesClientCapabilities implements ToJson {
  DidChangeWatchedFilesClientCapabilities({
    required this.dynamicRegistration,
    required this.relativePatternSupport,
  });

  /// Did change watched files notification supports dynamic registration.
  /// Please note that the current protocol doesn't support static
  /// configuration for file changes from the server side.
  final bool dynamicRegistration;

  /// Whether the client has support for {@link RelativePattern relative
  /// pattern} or not.
  /// @since 3.17.0
  final bool relativePatternSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolClientCapabilities implements ToJson {
  WorkspaceSymbolClientCapabilities({
    required this.dynamicRegistration,
    required this.resolveSupport,
    required this.symbolKind,
    required this.tagSupport,
  });

  /// Symbol request supports dynamic registration.
  final bool dynamicRegistration;

  /// The client support partial workspace symbols. The client will send the
  /// request `workspaceSymbol/resolve` to the server to resolve additional
  /// properties.
  /// @since 3.17.0
  final Object resolveSupport;

  /// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
  /// request.
  final Object symbolKind;

  /// The client supports tags on `SymbolInformation`. Clients supporting
  /// tags have to handle unknown tags gracefully.
  /// @since 3.16.0
  final Object tagSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The client capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandClientCapabilities implements ToJson {
  ExecuteCommandClientCapabilities({required this.dynamicRegistration});

  /// Execute command supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensWorkspaceClientCapabilities implements ToJson {
  SemanticTokensWorkspaceClientCapabilities({required this.refreshSupport});

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// semantic tokens currently shown. It should be used with absolute care
  /// and is useful for situation where a server for example detects a
  /// project wide change that requires such a calculation.
  final bool refreshSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class CodeLensWorkspaceClientCapabilities implements ToJson {
  CodeLensWorkspaceClientCapabilities({required this.refreshSupport});

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// code lenses currently shown. It should be used with absolute care and
  /// is useful for situation where a server for example detect a project
  /// wide change that requires such a calculation.
  final bool refreshSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Capabilities relating to events from file operations by the user in the
/// client.
/// These events do not come from the file system, they come from user
/// operations like renaming a file in the UI.
/// @since 3.16.0
class FileOperationClientCapabilities implements ToJson {
  FileOperationClientCapabilities({
    required this.didCreate,
    required this.didDelete,
    required this.didRename,
    required this.dynamicRegistration,
    required this.willCreate,
    required this.willDelete,
    required this.willRename,
  });

  /// The client has support for sending didCreateFiles notifications.
  final bool didCreate;

  /// The client has support for sending didDeleteFiles notifications.
  final bool didDelete;

  /// The client has support for sending didRenameFiles notifications.
  final bool didRename;

  /// Whether the client supports dynamic registration for file
  /// requests/notifications.
  final bool dynamicRegistration;

  /// The client has support for sending willCreateFiles requests.
  final bool willCreate;

  /// The client has support for sending willDeleteFiles requests.
  final bool willDelete;

  /// The client has support for sending willRenameFiles requests.
  final bool willRename;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client workspace capabilities specific to inline values.
/// @since 3.17.0
class InlineValueWorkspaceClientCapabilities implements ToJson {
  InlineValueWorkspaceClientCapabilities({required this.refreshSupport});

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// inline values currently shown. It should be used with absolute care and
  /// is useful for situation where a server for example detects a project
  /// wide change that requires such a calculation.
  final bool refreshSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client workspace capabilities specific to inlay hints.
/// @since 3.17.0
class InlayHintWorkspaceClientCapabilities implements ToJson {
  InlayHintWorkspaceClientCapabilities({required this.refreshSupport});

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// inlay hints currently shown. It should be used with absolute care and
  /// is useful for situation where a server for example detects a project
  /// wide change that requires such a calculation.
  final bool refreshSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Workspace client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticWorkspaceClientCapabilities implements ToJson {
  DiagnosticWorkspaceClientCapabilities({required this.refreshSupport});

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// pulled diagnostics currently shown. It should be used with absolute
  /// care and is useful for situation where a server for example detects a
  /// project wide change that requires such a calculation.
  final bool refreshSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client workspace capabilities specific to folding ranges
/// @since 3.18.0 @proposed
class FoldingRangeWorkspaceClientCapabilities implements ToJson {
  FoldingRangeWorkspaceClientCapabilities({required this.refreshSupport});

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// folding ranges currently shown. It should be used with absolute care
  /// and is useful for situation where a server for example detects a
  /// project wide change that requires such a calculation.
  /// @since 3.18.0 @proposed
  final bool refreshSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TextDocumentSyncClientCapabilities implements ToJson {
  TextDocumentSyncClientCapabilities({
    required this.didSave,
    required this.dynamicRegistration,
    required this.willSave,
    required this.willSaveWaitUntil,
  });

  /// The client supports did save notifications.
  final bool didSave;

  /// Whether text document synchronization supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports sending will save notifications.
  final bool willSave;

  /// The client supports sending a will save request and waits for a
  /// response providing text edits which will be applied to the document
  /// before it is saved.
  final bool willSaveWaitUntil;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Completion client capabilities
class CompletionClientCapabilities implements ToJson {
  CompletionClientCapabilities({
    required this.completionItem,
    required this.completionItemKind,
    required this.completionList,
    required this.contextSupport,
    required this.dynamicRegistration,
    required this.insertTextMode,
  });

  /// The client supports the following `CompletionItem` specific
  /// capabilities.
  final Object completionItem;

  final Object completionItemKind;

  /// The client supports the following `CompletionList` specific
  /// capabilities.
  /// @since 3.17.0
  final Object completionList;

  /// The client supports to send additional context information for a
  /// `textDocument/completion` request.
  final bool contextSupport;

  /// Whether completion supports dynamic registration.
  final bool dynamicRegistration;

  /// Defines how the client handles whitespace and indentation when
  /// accepting a completion item that uses multi line text in either
  /// `insertText` or `textEdit`.
  /// @since 3.17.0
  final InsertTextMode insertTextMode;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class HoverClientCapabilities implements ToJson {
  HoverClientCapabilities({
    required this.contentFormat,
    required this.dynamicRegistration,
  });

  /// Client supports the following content formats for the content property.
  /// The order describes the preferred format of the client.
  final List<MarkupKind> contentFormat;

  /// Whether hover supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpClientCapabilities implements ToJson {
  SignatureHelpClientCapabilities({
    required this.contextSupport,
    required this.dynamicRegistration,
    required this.signatureInformation,
  });

  /// The client supports to send additional context information for a
  /// `textDocument/signatureHelp` request. A client that opts into
  /// contextSupport will also support the `retriggerCharacters` on
  /// `SignatureHelpOptions`.
  /// @since 3.15.0
  final bool contextSupport;

  /// Whether signature help supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports the following `SignatureInformation` specific
  /// properties.
  final Object signatureInformation;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.14.0
class DeclarationClientCapabilities implements ToJson {
  DeclarationClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  /// Whether declaration supports dynamic registration. If this is set to
  /// `true` the client supports the new `DeclarationRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of declaration
  /// links.
  final bool linkSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link DefinitionRequest}.
class DefinitionClientCapabilities implements ToJson {
  DefinitionClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  /// Whether definition supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// @since 3.14.0
  final bool linkSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Since 3.6.0
class TypeDefinitionClientCapabilities implements ToJson {
  TypeDefinitionClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `TypeDefinitionRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// Since 3.14.0
  final bool linkSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.6.0
class ImplementationClientCapabilities implements ToJson {
  ImplementationClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `ImplementationRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// @since 3.14.0
  final bool linkSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link ReferencesRequest}.
class ReferenceClientCapabilities implements ToJson {
  ReferenceClientCapabilities({required this.dynamicRegistration});

  /// Whether references supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
class DocumentHighlightClientCapabilities implements ToJson {
  DocumentHighlightClientCapabilities({required this.dynamicRegistration});

  /// Whether document highlight supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link DocumentSymbolRequest}.
class DocumentSymbolClientCapabilities implements ToJson {
  DocumentSymbolClientCapabilities({
    required this.dynamicRegistration,
    required this.hierarchicalDocumentSymbolSupport,
    required this.labelSupport,
    required this.symbolKind,
    required this.tagSupport,
  });

  /// Whether document symbol supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports hierarchical document symbols.
  final bool hierarchicalDocumentSymbolSupport;

  /// The client supports an additional label presented in the UI when
  /// registering a document symbol provider.
  /// @since 3.16.0
  final bool labelSupport;

  /// Specific capabilities for the `SymbolKind` in the
  /// `textDocument/documentSymbol` request.
  final Object symbolKind;

  /// The client supports tags on `SymbolInformation`. Tags are supported on
  /// `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
  /// Clients supporting tags have to handle unknown tags gracefully.
  /// @since 3.16.0
  final Object tagSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The Client Capabilities of a {@link CodeActionRequest}.
class CodeActionClientCapabilities implements ToJson {
  CodeActionClientCapabilities({
    required this.codeActionLiteralSupport,
    required this.dataSupport,
    required this.disabledSupport,
    required this.dynamicRegistration,
    required this.honorsChangeAnnotations,
    required this.isPreferredSupport,
    required this.resolveSupport,
  });

  /// The client support code action literals of type `CodeAction` as a valid
  /// response of the `textDocument/codeAction` request. If the property is
  /// not set the request can only return `Command` literals.
  /// @since 3.8.0
  final Object codeActionLiteralSupport;

  /// Whether code action supports the `data` property which is preserved
  /// between a `textDocument/codeAction` and a `codeAction/resolve` request.
  /// @since 3.16.0
  final bool dataSupport;

  /// Whether code action supports the `disabled` property.
  /// @since 3.16.0
  final bool disabledSupport;

  /// Whether code action supports dynamic registration.
  final bool dynamicRegistration;

  /// Whether the client honors the change annotations in text edits and
  /// resource operations returned via the `CodeAction#edit` property by for
  /// example presenting the workspace edit in the user interface and asking
  /// for confirmation.
  /// @since 3.16.0
  final bool honorsChangeAnnotations;

  /// Whether code action supports the `isPreferred` property.
  /// @since 3.15.0
  final bool isPreferredSupport;

  /// Whether the client supports resolving additional code action properties
  /// via a separate `codeAction/resolve` request.
  /// @since 3.16.0
  final Object resolveSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The client capabilities  of a {@link CodeLensRequest}.
class CodeLensClientCapabilities implements ToJson {
  CodeLensClientCapabilities({required this.dynamicRegistration});

  /// Whether code lens supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The client capabilities of a {@link DocumentLinkRequest}.
class DocumentLinkClientCapabilities implements ToJson {
  DocumentLinkClientCapabilities({
    required this.dynamicRegistration,
    required this.tooltipSupport,
  });

  /// Whether document link supports dynamic registration.
  final bool dynamicRegistration;

  /// Whether the client supports the `tooltip` property on `DocumentLink`.
  /// @since 3.15.0
  final bool tooltipSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DocumentColorClientCapabilities implements ToJson {
  DocumentColorClientCapabilities({required this.dynamicRegistration});

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `DocumentColorRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities of a {@link DocumentFormattingRequest}.
class DocumentFormattingClientCapabilities implements ToJson {
  DocumentFormattingClientCapabilities({required this.dynamicRegistration});

  /// Whether formatting supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingClientCapabilities implements ToJson {
  DocumentRangeFormattingClientCapabilities({
    required this.dynamicRegistration,
    required this.rangesSupport,
  });

  /// Whether range formatting supports dynamic registration.
  final bool dynamicRegistration;

  /// Whether the client supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  final bool rangesSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingClientCapabilities implements ToJson {
  DocumentOnTypeFormattingClientCapabilities({
    required this.dynamicRegistration,
  });

  /// Whether on type formatting supports dynamic registration.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class RenameClientCapabilities implements ToJson {
  RenameClientCapabilities({
    required this.dynamicRegistration,
    required this.honorsChangeAnnotations,
    required this.prepareSupport,
    required this.prepareSupportDefaultBehavior,
  });

  /// Whether rename supports dynamic registration.
  final bool dynamicRegistration;

  /// Whether the client honors the change annotations in text edits and
  /// resource operations returned via the rename request's workspace edit by
  /// for example presenting the workspace edit in the user interface and
  /// asking for confirmation.
  /// @since 3.16.0
  final bool honorsChangeAnnotations;

  /// Client supports testing for validity of rename operations before
  /// execution.
  /// @since 3.12.0
  final bool prepareSupport;

  /// Client supports the default behavior result.
  /// The value indicates the default behavior used by the client.
  /// @since 3.16.0
  final PrepareSupportDefaultBehavior prepareSupportDefaultBehavior;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FoldingRangeClientCapabilities implements ToJson {
  FoldingRangeClientCapabilities({
    required this.dynamicRegistration,
    required this.foldingRange,
    required this.foldingRangeKind,
    required this.lineFoldingOnly,
    required this.rangeLimit,
  });

  /// Whether implementation supports dynamic registration for folding range
  /// providers. If this is set to `true` the client supports the new
  /// `FoldingRangeRegistrationOptions` return value for the corresponding
  /// server capability as well.
  final bool dynamicRegistration;

  /// Specific options for the folding range.
  /// @since 3.17.0
  final Object foldingRange;

  /// Specific options for the folding range kind.
  /// @since 3.17.0
  final Object foldingRangeKind;

  /// If set, the client signals that it only supports folding complete
  /// lines. If set, client will ignore specified `startCharacter` and
  /// `endCharacter` properties in a FoldingRange.
  final bool lineFoldingOnly;

  /// The maximum number of folding ranges that the client prefers to receive
  /// per document. The value serves as a hint, servers are free to follow
  /// the limit.
  final int rangeLimit;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SelectionRangeClientCapabilities implements ToJson {
  SelectionRangeClientCapabilities({required this.dynamicRegistration});

  /// Whether implementation supports dynamic registration for selection
  /// range providers. If this is set to `true` the client supports the new
  /// `SelectionRangeRegistrationOptions` return value for the corresponding
  /// server capability as well.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The publish diagnostic client capabilities.
class PublishDiagnosticsClientCapabilities implements ToJson {
  PublishDiagnosticsClientCapabilities({
    required this.codeDescriptionSupport,
    required this.dataSupport,
    required this.relatedInformation,
    required this.tagSupport,
    required this.versionSupport,
  });

  /// Client supports a codeDescription property
  /// @since 3.16.0
  final bool codeDescriptionSupport;

  /// Whether code action supports the `data` property which is preserved
  /// between a `textDocument/publishDiagnostics` and
  /// `textDocument/codeAction` request.
  /// @since 3.16.0
  final bool dataSupport;

  /// Whether the clients accepts diagnostics with related information.
  final bool relatedInformation;

  /// Client supports the tag property to provide meta data about a
  /// diagnostic. Clients supporting tags have to handle unknown tags
  /// gracefully.
  /// @since 3.15.0
  final Object tagSupport;

  /// Whether the client interprets the version property of the
  /// `textDocument/publishDiagnostics` notification's parameter.
  /// @since 3.15.0
  final bool versionSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class CallHierarchyClientCapabilities implements ToJson {
  CallHierarchyClientCapabilities({required this.dynamicRegistration});

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensClientCapabilities implements ToJson {
  SemanticTokensClientCapabilities({
    required this.augmentsSyntaxTokens,
    required this.dynamicRegistration,
    required this.formats,
    required this.multilineTokenSupport,
    required this.overlappingTokenSupport,
    required this.requests,
    required this.serverCancelSupport,
    required this.tokenModifiers,
    required this.tokenTypes,
  });

  /// Whether the client uses semantic tokens to augment existing syntax
  /// tokens. If set to `true` client side created syntax tokens and semantic
  /// tokens are both used for colorization. If set to `false` the client
  /// only uses the returned semantic tokens for colorization.
  /// If the value is `undefined` then the client behavior is not specified.
  /// @since 3.17.0
  final bool augmentsSyntaxTokens;

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool dynamicRegistration;

  /// The token formats the clients supports.
  final List<TokenFormat> formats;

  /// Whether the client supports tokens that can span multiple lines.
  final bool multilineTokenSupport;

  /// Whether the client supports tokens that can overlap each other.
  final bool overlappingTokenSupport;

  /// Which requests the client supports and might send to the server
  /// depending on the server's capability. Please note that clients might
  /// not show semantic tokens or degrade some of the user experience if a
  /// range or full request is advertised by the client but not provided by
  /// the server. If for example the client capability `requests.full` and
  /// `request.range` are both set to true but the server only provides a
  /// range provider the client might not render a minimap correctly or might
  /// even decide to not show any semantic tokens at all.
  final Object requests;

  /// Whether the client allows the server to actively cancel a semantic
  /// token request, e.g. supports returning LSPErrorCodes.ServerCancelled.
  /// If a server does the client needs to retrigger the request.
  /// @since 3.17.0
  final bool serverCancelSupport;

  /// The token modifiers that the client supports.
  final List<String> tokenModifiers;

  /// The token types that the client supports.
  final List<String> tokenTypes;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities for the linked editing range request.
/// @since 3.16.0
class LinkedEditingRangeClientCapabilities implements ToJson {
  LinkedEditingRangeClientCapabilities({required this.dynamicRegistration});

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to the moniker request.
/// @since 3.16.0
class MonikerClientCapabilities implements ToJson {
  MonikerClientCapabilities({required this.dynamicRegistration});

  /// Whether moniker supports dynamic registration. If this is set to `true`
  /// the client supports the new `MonikerRegistrationOptions` return value
  /// for the corresponding server capability as well.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.17.0
class TypeHierarchyClientCapabilities implements ToJson {
  TypeHierarchyClientCapabilities({required this.dynamicRegistration});

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to inline values.
/// @since 3.17.0
class InlineValueClientCapabilities implements ToJson {
  InlineValueClientCapabilities({required this.dynamicRegistration});

  /// Whether implementation supports dynamic registration for inline value
  /// providers.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint client capabilities.
/// @since 3.17.0
class InlayHintClientCapabilities implements ToJson {
  InlayHintClientCapabilities({
    required this.dynamicRegistration,
    required this.resolveSupport,
  });

  /// Whether inlay hints support dynamic registration.
  final bool dynamicRegistration;

  /// Indicates which properties a client can resolve lazily on an inlay hint.
  final Object resolveSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticClientCapabilities implements ToJson {
  DiagnosticClientCapabilities({
    required this.dynamicRegistration,
    required this.relatedDocumentSupport,
  });

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool dynamicRegistration;

  /// Whether the clients supports related documents for document diagnostic
  /// pulls.
  final bool relatedDocumentSupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to inline completions.
/// @since 3.18.0 @proposed
class InlineCompletionClientCapabilities implements ToJson {
  InlineCompletionClientCapabilities({required this.dynamicRegistration});

  /// Whether implementation supports dynamic registration for inline
  /// completion providers.
  final bool dynamicRegistration;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Notebook specific client capabilities.
/// @since 3.17.0
class NotebookDocumentSyncClientCapabilities implements ToJson {
  NotebookDocumentSyncClientCapabilities({
    required this.dynamicRegistration,
    required this.executionSummarySupport,
  });

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool dynamicRegistration;

  /// The client supports sending execution summary data per cell.
  final bool executionSummarySupport;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Show message request client capabilities
class ShowMessageRequestClientCapabilities implements ToJson {
  ShowMessageRequestClientCapabilities({required this.messageActionItem});

  /// Capabilities specific to the `MessageActionItem` type.
  final Object messageActionItem;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities for the showDocument request.
/// @since 3.16.0
class ShowDocumentClientCapabilities implements ToJson {
  ShowDocumentClientCapabilities({required this.support});

  /// The client has support for the showDocument request.
  final bool support;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to regular expressions.
/// @since 3.16.0
class RegularExpressionsClientCapabilities implements ToJson {
  RegularExpressionsClientCapabilities({
    required this.engine,
    required this.version,
  });

  /// The engine's name.
  final String engine;

  /// The engine's version.
  final String version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to the used markdown parser.
/// @since 3.16.0
class MarkdownClientCapabilities implements ToJson {
  MarkdownClientCapabilities({
    required this.allowedTags,
    required this.parser,
    required this.version,
  });

  /// A list of HTML tags that the client allows / supports in Markdown.
  /// @since 3.17.0
  final List<String> allowedTags;

  /// The name of the parser.
  final String parser;

  /// The version of the parser.
  final String version;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
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

// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaRequest visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
