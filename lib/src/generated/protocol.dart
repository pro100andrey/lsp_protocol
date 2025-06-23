/// Do not edit it manually.
///
/// To regenerate, run `dart run lsp_meta:generate`.

// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: one_member_abstracts
// ignore_for_file: unused_element
// ignore_for_file: doc_directive_unknown
library;

typedef Definition = Object?;
typedef DefinitionLink = LocationLink;
typedef LSPArray = Object?;
typedef LSPAny = Object?;
typedef Declaration = Object?;
typedef DeclarationLink = LocationLink;
typedef InlineValue = Object?;
typedef DocumentDiagnosticReport = Object?;
typedef PrepareRenameResult = Object?;
typedef DocumentSelector = Object?;
typedef ProgressToken = Object?;
typedef ChangeAnnotationIdentifier = String;
typedef WorkspaceDocumentDiagnosticReport = Object?;
typedef TextDocumentContentChangeEvent = Object?;
typedef MarkedString = Object?;
typedef DocumentFilter = Object?;
typedef LSPObject = Object?;
typedef GlobPattern = Object?;
typedef TextDocumentFilter = Object?;
typedef NotebookDocumentFilter = Object?;
typedef Pattern = String;

abstract class ToJson {
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class ImplementationParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a location inside a resource, such as a line inside a text file.
class Location implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ImplementationRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        ImplementationOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TypeDefinitionParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TypeDefinitionRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        TypeDefinitionOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A workspace folder inside a client.
class WorkspaceFolder implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
class DidChangeWorkspaceFoldersParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a configuration request.
class ConfigurationParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DocumentColorRequest}.
class DocumentColorParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a color range from a document.
class ColorInformation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DocumentColorRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        DocumentColorOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link ColorPresentationRequest}.
class ColorPresentationParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ColorPresentation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General text document registration options.
class TextDocumentRegistrationOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link FoldingRangeRequest}.
class FoldingRangeParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a folding range. To be valid, start and end line must be bigger
/// than zero and smaller than the number of lines in the document. Clients are
/// free to ignore invalid ranges.
class FoldingRange implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FoldingRangeRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        FoldingRangeOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeclarationParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeclarationRegistrationOptions
    implements
        ToJson,
        DeclarationOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in selection range requests.
class SelectionRangeParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A selection range represents a part of a selection hierarchy. A selection
/// range may have a parent selection range that contains it.
class SelectionRange implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SelectionRangeRegistrationOptions
    implements
        ToJson,
        SelectionRangeOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressCreateParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressCancelParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `textDocument/prepareCallHierarchy` request.
/// @since 3.16.0
class CallHierarchyPrepareParams
    implements ToJson, TextDocumentPositionParams, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents programming constructs like functions or constructors in the
/// context of call hierarchy.
/// @since 3.16.0
class CallHierarchyItem implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Call hierarchy options used during static or dynamic registration.
/// @since 3.16.0
class CallHierarchyRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        CallHierarchyOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `callHierarchy/incomingCalls` request.
/// @since 3.16.0
class CallHierarchyIncomingCallsParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents an incoming call, e.g. a caller of a method or constructor.
/// @since 3.16.0
class CallHierarchyIncomingCall implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `callHierarchy/outgoingCalls` request.
/// @since 3.16.0
class CallHierarchyOutgoingCallsParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents an outgoing call, e.g. calling a getter from a method or a
/// method from a constructor etc.
/// @since 3.16.0
class CallHierarchyOutgoingCall implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokens implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensPartialResult implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        SemanticTokensOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensDeltaParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensDelta implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensDeltaPartialResult implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensRangeParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Params to show a resource in the UI.
/// @since 3.16.0
class ShowDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of a showDocument request.
/// @since 3.16.0
class ShowDocumentResult implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LinkedEditingRangeParams
    implements ToJson, TextDocumentPositionParams, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of a linked editing range request.
/// @since 3.16.0
class LinkedEditingRanges implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LinkedEditingRangeRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        LinkedEditingRangeOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in notifications/requests for user-initiated creation
/// of files.
/// @since 3.16.0
class CreateFilesParams implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The options to register for file operations.
/// @since 3.16.0
class FileOperationRegistrationOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in notifications/requests for user-initiated renames of
/// files.
/// @since 3.16.0
class RenameFilesParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
/// @since 3.16.0
class DeleteFilesParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MonikerParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Moniker definition to match LSIF 0.5 moniker definition.
/// @since 3.16.0
class Moniker implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MonikerRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, MonikerOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `textDocument/prepareTypeHierarchy` request.
/// @since 3.17.0
class TypeHierarchyPrepareParams
    implements ToJson, TextDocumentPositionParams, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.17.0
class TypeHierarchyItem implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Type hierarchy options used during static or dynamic registration.
/// @since 3.17.0
class TypeHierarchyRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        TypeHierarchyOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `typeHierarchy/supertypes` request.
/// @since 3.17.0
class TypeHierarchySupertypesParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameter of a `typeHierarchy/subtypes` request.
/// @since 3.17.0
class TypeHierarchySubtypesParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in inline value requests.
/// @since 3.17.0
class InlineValueParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline value options used during static or dynamic registration.
/// @since 3.17.0
class InlineValueRegistrationOptions
    implements
        ToJson,
        InlineValueOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in inlay hint requests.
/// @since 3.17.0
class InlayHintParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint information.
/// @since 3.17.0
class InlayHint implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint options used during static or dynamic registration.
/// @since 3.17.0
class InlayHintRegistrationOptions
    implements
        ToJson,
        InlayHintOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters of the document diagnostic request.
/// @since 3.17.0
class DocumentDiagnosticParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A partial result for a document diagnostic report.
/// @since 3.17.0
class DocumentDiagnosticReportPartialResult implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Cancellation data returned from a diagnostic request.
/// @since 3.17.0
class DiagnosticServerCancellationData implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Diagnostic registration options.
/// @since 3.17.0
class DiagnosticRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        DiagnosticOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters of the workspace diagnostic request.
/// @since 3.17.0
class WorkspaceDiagnosticParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReport implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A partial result for a workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReportPartialResult implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in an open notebook document notification.
/// @since 3.17.0
class DidOpenNotebookDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in a change notebook document notification.
/// @since 3.17.0
class DidChangeNotebookDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in a save notebook document notification.
/// @since 3.17.0
class DidSaveNotebookDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The params sent in a close notebook document notification.
/// @since 3.17.0
class DidCloseNotebookDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in inline completion requests.
/// @since 3.18.0 @proposed
class InlineCompletionParams
    implements ToJson, TextDocumentPositionParams, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a collection of {@link InlineCompletionItem inline completion
/// items} to be presented in the editor.
/// @since 3.18.0 @proposed
class InlineCompletionList implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An inline completion item represents a text snippet that is proposed inline
/// to complete text that is being typed.
/// @since 3.18.0 @proposed
class InlineCompletionItem implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline completion options used during static or dynamic registration.
/// @since 3.18.0 @proposed
class InlineCompletionRegistrationOptions
    implements
        ToJson,
        InlineCompletionOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class RegistrationParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class UnregistrationParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class InitializeParams
    implements ToJson, _InitializeParams, WorkspaceFoldersInitializeParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result returned from an initialize request.
class InitializeResult implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The data type of the ResponseError if the initialize request fails.
class InitializeError implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class InitializedParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a change configuration notification.
class DidChangeConfigurationParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DidChangeConfigurationRegistrationOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a notification message.
class ShowMessageParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ShowMessageRequestParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MessageActionItem implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The log message parameters.
class LogMessageParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in an open text document notification
class DidOpenTextDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The change text document notification's parameters.
class DidChangeTextDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describe options to be used when registered for text document change events.
class TextDocumentChangeRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in a close text document notification
class DidCloseTextDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in a save text document notification
class DidSaveTextDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Save registration options.
class TextDocumentSaveRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, SaveOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters sent in a will save text document notification.
class WillSaveTextDocumentParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A text edit applicable to a text document.
class TextEdit implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The watched files change notification's parameters.
class DidChangeWatchedFilesParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describe options to be used when registered for text document change events.
class DidChangeWatchedFilesRegistrationOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The publish diagnostic notification's parameters.
class PublishDiagnosticsParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Completion parameters
class CompletionParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A completion item represents a text snippet that is proposed to complete
/// text that is being typed.
class CompletionItem implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a collection of {@link CompletionItem completion items} to be
/// presented in the editor.
class CompletionList implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link CompletionRequest}.
class CompletionRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, CompletionOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link HoverRequest}.
class HoverParams
    implements ToJson, TextDocumentPositionParams, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of a hover request.
class Hover implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link HoverRequest}.
class HoverRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, HoverOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link SignatureHelpRequest}.
class SignatureHelpParams
    implements ToJson, TextDocumentPositionParams, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
class SignatureHelp implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link SignatureHelpRequest}.
class SignatureHelpRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, SignatureHelpOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DefinitionRequest}.
class DefinitionParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DefinitionRequest}.
class DefinitionRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, DefinitionOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link ReferencesRequest}.
class ReferenceParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link ReferencesRequest}.
class ReferenceRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, ReferenceOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DocumentHighlightRequest}.
class DocumentHighlightParams
    implements
        ToJson,
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
class DocumentHighlight implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentHighlightRequest}.
class DocumentHighlightRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        DocumentHighlightOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters for a {@link DocumentSymbolRequest}.
class DocumentSymbolParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information about programming constructs like variables,
/// classes, interfaces etc.
class SymbolInformation implements ToJson, BaseSymbolInformation {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentSymbolRequest}.
class DocumentSymbolRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, DocumentSymbolOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link CodeActionRequest}.
class CodeActionParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a reference to a command. Provides a title which will be used to
/// represent a command in the UI and, optionally, an array of arguments which
/// will be passed to the command handler function when invoked.
class Command implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link CodeActionRequest}.
class CodeActionRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, CodeActionOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A special workspace symbol that supports locations without a range.
/// See also SymbolInformation.
/// @since 3.17.0
class WorkspaceSymbol implements ToJson, BaseSymbolInformation {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolRegistrationOptions
    implements ToJson, WorkspaceSymbolOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link CodeLensRequest}.
class CodeLensParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link CodeLensRequest}.
class CodeLensRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, CodeLensOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentLinkRequest}.
class DocumentLinkParams
    implements ToJson, WorkDoneProgressParams, PartialResultParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A document link is a range in a text document that links to an internal or
/// external resource, like another text document or a web site.
class DocumentLink implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentLinkRequest}.
class DocumentLinkRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, DocumentLinkOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentFormattingRequest}.
class DocumentFormattingParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentFormattingRequest}.
class DocumentFormattingRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        DocumentFormattingOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        DocumentRangeFormattingOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentRangesFormattingRequest}.
/// @since 3.18.0 @proposed
class DocumentRangesFormattingParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingRegistrationOptions
    implements
        ToJson,
        TextDocumentRegistrationOptions,
        DocumentOnTypeFormattingOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link RenameRequest}.
class RenameParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link RenameRequest}.
class RenameRegistrationOptions
    implements ToJson, TextDocumentRegistrationOptions, RenameOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class PrepareRenameParams
    implements ToJson, TextDocumentPositionParams, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a {@link ExecuteCommandRequest}.
class ExecuteCommandParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options for a {@link ExecuteCommandRequest}.
class ExecuteCommandRegistrationOptions
    implements ToJson, ExecuteCommandOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters passed via an apply workspace edit request.
class ApplyWorkspaceEditParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result returned from the apply workspace edit request.
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
class ApplyWorkspaceEditResult implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressBegin implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressReport implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressEnd implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SetTraceParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LogTraceParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ProgressParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter literal used in requests to pass a text document and a position
/// inside that document.
class TextDocumentPositionParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkDoneProgressParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class PartialResultParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the connection of two locations. Provides additional metadata
/// over normal {@link Location locations}, including an origin range.
class LocationLink implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ImplementationOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Static registration options to be returned in the initialize request.
class StaticRegistrationOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TypeDefinitionOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The workspace folder change event.
class WorkspaceFoldersChangeEvent implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConfigurationItem implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A literal to identify a text document in the client.
class TextDocumentIdentifier implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a color in RGBA space.
class Color implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DocumentColorOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FoldingRangeOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeclarationOptions implements ToJson, WorkDoneProgressOptions {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SelectionRangeOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Call hierarchy options used during static registration.
/// @since 3.16.0
class CallHierarchyOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensEdit implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LinkedEditingRangeOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information on a file/folder create.
/// @since 3.16.0
class FileCreate implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Create file operation.
class CreateFile implements ToJson, ResourceOperation {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Rename file operation
class RenameFile implements ToJson, ResourceOperation {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Delete file operation
class DeleteFile implements ToJson, ResourceOperation {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Additional information that describes document changes.
/// @since 3.16.0
class ChangeAnnotation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A filter to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationFilter implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information on a file/folder rename.
/// @since 3.16.0
class FileRename implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information on a file/folder delete.
/// @since 3.16.0
class FileDelete implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class MonikerOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Type hierarchy options used during static registration.
/// @since 3.17.0
class TypeHierarchyOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.17.0
class InlineValueContext implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provide inline value as text.
/// @since 3.17.0
class InlineValueText implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline value options used during static registration.
/// @since 3.17.0
class InlineValueOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An inlay hint label part allows for interactive and composite labels of
/// inlay hints.
/// @since 3.17.0
class InlayHintLabelPart implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint options used during static registration.
/// @since 3.17.0
class InlayHintOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A full diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedFullDocumentDiagnosticReport
    implements ToJson, FullDocumentDiagnosticReport {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An unchanged diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedUnchangedDocumentDiagnosticReport
    implements ToJson, UnchangedDocumentDiagnosticReport {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A diagnostic report with a full set of problems.
/// @since 3.17.0
class FullDocumentDiagnosticReport implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A diagnostic report indicating that the last returned report is still
/// accurate.
/// @since 3.17.0
class UnchangedDocumentDiagnosticReport implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Diagnostic options.
/// @since 3.17.0
class DiagnosticOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A previous result id in a workspace pull request.
/// @since 3.17.0
class PreviousResultId implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A notebook document.
/// @since 3.17.0
class NotebookDocument implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An item to transfer a text document from the client to the server.
class TextDocumentItem implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A versioned notebook document identifier.
/// @since 3.17.0
class VersionedNotebookDocumentIdentifier implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A change event for a notebook document.
/// @since 3.17.0
class NotebookDocumentChangeEvent implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A literal to identify a notebook document in the client.
/// @since 3.17.0
class NotebookDocumentIdentifier implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides information about the context in which an inline completion was
/// requested.
/// @since 3.18.0 @proposed
class InlineCompletionContext implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inline completion options used during static registration.
/// @since 3.18.0 @proposed
class InlineCompletionOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General parameters to register for a notification or to register a provider.
class Registration implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General parameters to unregister a request or notification.
class Unregistration implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The initialize parameters
class _InitializeParams implements ToJson, WorkDoneProgressParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkspaceFoldersInitializeParams implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines the capabilities provided by a language server.
class ServerCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A text document identifier to denote a specific version of a text document.
class VersionedTextDocumentIdentifier
    implements ToJson, TextDocumentIdentifier {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Save options.
class SaveOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An event describing a file change.
class FileEvent implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FileSystemWatcher implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic
/// objects are only valid in the scope of a resource.
class Diagnostic implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains additional information about the context in which a completion
/// request is triggered.
class CompletionContext implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Additional details for a completion item label.
/// @since 3.17.0
class CompletionItemLabelDetails implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A special text edit to provide an insert and a replace operation.
/// @since 3.16.0
class InsertReplaceEdit implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Completion options.
class CompletionOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Hover options.
class HoverOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Additional information about the context in which a signature help request
/// was triggered.
/// @since 3.15.0
class SignatureHelpContext implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the signature of something callable. A signature can have a
/// label, like a function-name, a doc-comment, and a set of parameters.
class SignatureInformation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Server Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Server Capabilities for a {@link DefinitionRequest}.
class DefinitionOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Value-object that contains additional information when requesting
/// references.
class ReferenceContext implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Reference options.
class ReferenceOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentHighlightRequest}.
class DocumentHighlightOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A base for all symbol information.
class BaseSymbolInformation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentSymbolRequest}.
class DocumentSymbolOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains additional diagnostic information about the context in which a
/// {@link CodeActionProvider.provideCodeActions code action} is run.
class CodeActionContext implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link CodeActionRequest}.
class CodeActionOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Server capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Code Lens provider options of a {@link CodeLensRequest}.
class CodeLensOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentLinkRequest}.
class DocumentLinkOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Value-object describing what options formatting should use.
class FormattingOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentFormattingRequest}.
class DocumentFormattingOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingOptions
    implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provider options for a {@link RenameRequest}.
class RenameOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The server capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandOptions implements ToJson, WorkDoneProgressOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensLegend implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A text document identifier to optionally denote a specific version of a
/// text document.
class OptionalVersionedTextDocumentIdentifier
    implements ToJson, TextDocumentIdentifier {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A special text edit with an additional change annotation.
/// @since 3.16.0.
class AnnotatedTextEdit implements ToJson, TextEdit {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A generic resource operation.
class ResourceOperation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Options to create a file.
class CreateFileOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Rename file options
class RenameFileOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Delete file options
class DeleteFileOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A pattern to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationPattern implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A full document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceFullDocumentDiagnosticReport
    implements ToJson, FullDocumentDiagnosticReport {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An unchanged document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceUnchangedDocumentDiagnosticReport
    implements ToJson, UnchangedDocumentDiagnosticReport {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A change describing how to move a `NotebookCell` array from state S to S'.
/// @since 3.17.0
class NotebookCellArrayChange implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the currently selected completion item.
/// @since 3.18.0 @proposed
class SelectedCompletionInfo implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines the capabilities provided by the client.
class ClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TextDocumentSyncOptions implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Registration options specific to a notebook.
/// @since 3.17.0
class NotebookDocumentSyncRegistrationOptions
    implements ToJson, NotebookDocumentSyncOptions, StaticRegistrationOptions {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkspaceFoldersServerCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Options for notifications/requests for user operations on files.
/// @since 3.16.0
class FileOperationOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Structure to capture a description for an error code.
/// @since 3.16.0
class CodeDescription implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a related message and source code location for a diagnostic.
/// This should be used to point to code locations that cause or related to a
/// diagnostics, e.g when duplicating a symbol in a scope.
class DiagnosticRelatedInformation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a parameter of a callable-signature. A parameter can have a
/// label and a doc-comment.
class ParameterInformation implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A notebook cell text document filter denotes a cell text document by
/// different properties.
/// @since 3.17.0
class NotebookCellTextDocumentFilter implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Matching options for the file operation pattern.
/// @since 3.16.0
class FileOperationPatternOptions implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class ExecutionSummary implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Workspace specific client capabilities.
class WorkspaceClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Text document specific client capabilities.
class TextDocumentClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Capabilities specific to the notebook document support.
/// @since 3.17.0
class NotebookDocumentClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WindowClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// General client capabilities.
/// @since 3.16.0
class GeneralClientCapabilities implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class WorkspaceEditClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DidChangeConfigurationClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DidChangeWatchedFilesClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The client capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensWorkspaceClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class CodeLensWorkspaceClientCapabilities implements ToJson {
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
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client workspace capabilities specific to inline values.
/// @since 3.17.0
class InlineValueWorkspaceClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client workspace capabilities specific to inlay hints.
/// @since 3.17.0
class InlayHintWorkspaceClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Workspace client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticWorkspaceClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client workspace capabilities specific to folding ranges
/// @since 3.18.0 @proposed
class FoldingRangeWorkspaceClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class TextDocumentSyncClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Completion client capabilities
class CompletionClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class HoverClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.14.0
class DeclarationClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link DefinitionRequest}.
class DefinitionClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Since 3.6.0
class TypeDefinitionClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.6.0
class ImplementationClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link ReferencesRequest}.
class ReferenceClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
class DocumentHighlightClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client Capabilities for a {@link DocumentSymbolRequest}.
class DocumentSymbolClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The Client Capabilities of a {@link CodeActionRequest}.
class CodeActionClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The client capabilities  of a {@link CodeLensRequest}.
class CodeLensClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The client capabilities of a {@link DocumentLinkRequest}.
class DocumentLinkClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class DocumentColorClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities of a {@link DocumentFormattingRequest}.
class DocumentFormattingClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class RenameClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class FoldingRangeClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class SelectionRangeClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The publish diagnostic client capabilities.
class PublishDiagnosticsClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class CallHierarchyClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.16.0
class SemanticTokensClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities for the linked editing range request.
/// @since 3.16.0
class LinkedEditingRangeClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to the moniker request.
/// @since 3.16.0
class MonikerClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @since 3.17.0
class TypeHierarchyClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to inline values.
/// @since 3.17.0
class InlineValueClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inlay hint client capabilities.
/// @since 3.17.0
class InlayHintClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to inline completions.
/// @since 3.18.0 @proposed
class InlineCompletionClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Notebook specific client capabilities.
/// @since 3.17.0
class NotebookDocumentSyncClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Show message request client capabilities
class ShowMessageRequestClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities for the showDocument request.
/// @since 3.16.0
class ShowDocumentClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to regular expressions.
/// @since 3.16.0
class RegularExpressionsClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Client capabilities specific to the used markdown parser.
/// @since 3.16.0
class MarkdownClientCapabilities implements ToJson {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
