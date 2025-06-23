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

class ImplementationParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

/// Represents a location inside a resource, such as a line inside a text file.
class Location extends ToJson {}

class ImplementationRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        ImplementationOptions,
        StaticRegistrationOptions {}

class TypeDefinitionParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

class TypeDefinitionRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        TypeDefinitionOptions,
        StaticRegistrationOptions {}

/// A workspace folder inside a client.
class WorkspaceFolder extends ToJson {}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
class DidChangeWorkspaceFoldersParams extends ToJson {}

/// The parameters of a configuration request.
class ConfigurationParams extends ToJson {}

/// Parameters for a {@link DocumentColorRequest}.
class DocumentColorParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// Represents a color range from a document.
class ColorInformation extends ToJson {}

class DocumentColorRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        DocumentColorOptions,
        StaticRegistrationOptions {}

/// Parameters for a {@link ColorPresentationRequest}.
class ColorPresentationParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

class ColorPresentation extends ToJson {}

class WorkDoneProgressOptions extends ToJson {}

/// General text document registration options.
class TextDocumentRegistrationOptions extends ToJson {}

/// Parameters for a {@link FoldingRangeRequest}.
class FoldingRangeParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// Represents a folding range. To be valid, start and end line must be bigger
/// than zero and smaller than the number of lines in the document. Clients are
/// free to ignore invalid ranges.
class FoldingRange extends ToJson {}

class FoldingRangeRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        FoldingRangeOptions,
        StaticRegistrationOptions {}

class DeclarationParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

class DeclarationRegistrationOptions extends ToJson
    implements
        DeclarationOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {}

/// A parameter literal used in selection range requests.
class SelectionRangeParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// A selection range represents a part of a selection hierarchy. A selection
/// range may have a parent selection range that contains it.
class SelectionRange extends ToJson {}

class SelectionRangeRegistrationOptions extends ToJson
    implements
        SelectionRangeOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {}

class WorkDoneProgressCreateParams extends ToJson {}

class WorkDoneProgressCancelParams extends ToJson {}

/// The parameter of a `textDocument/prepareCallHierarchy` request.
/// @since 3.16.0
class CallHierarchyPrepareParams extends ToJson
    implements TextDocumentPositionParams, WorkDoneProgressParams {}

/// Represents programming constructs like functions or constructors in the
/// context of call hierarchy.
/// @since 3.16.0
class CallHierarchyItem extends ToJson {}

/// Call hierarchy options used during static or dynamic registration.
/// @since 3.16.0
class CallHierarchyRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        CallHierarchyOptions,
        StaticRegistrationOptions {}

/// The parameter of a `callHierarchy/incomingCalls` request.
/// @since 3.16.0
class CallHierarchyIncomingCallsParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// Represents an incoming call, e.g. a caller of a method or constructor.
/// @since 3.16.0
class CallHierarchyIncomingCall extends ToJson {}

/// The parameter of a `callHierarchy/outgoingCalls` request.
/// @since 3.16.0
class CallHierarchyOutgoingCallsParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// Represents an outgoing call, e.g. calling a getter from a method or a
/// method from a constructor etc.
/// @since 3.16.0
class CallHierarchyOutgoingCall extends ToJson {}

/// @since 3.16.0
class SemanticTokensParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// @since 3.16.0
class SemanticTokens extends ToJson {}

/// @since 3.16.0
class SemanticTokensPartialResult extends ToJson {}

/// @since 3.16.0
class SemanticTokensRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        SemanticTokensOptions,
        StaticRegistrationOptions {}

/// @since 3.16.0
class SemanticTokensDeltaParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// @since 3.16.0
class SemanticTokensDelta extends ToJson {}

/// @since 3.16.0
class SemanticTokensDeltaPartialResult extends ToJson {}

/// @since 3.16.0
class SemanticTokensRangeParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// Params to show a resource in the UI.
/// @since 3.16.0
class ShowDocumentParams extends ToJson {}

/// The result of a showDocument request.
/// @since 3.16.0
class ShowDocumentResult extends ToJson {}

class LinkedEditingRangeParams extends ToJson
    implements TextDocumentPositionParams, WorkDoneProgressParams {}

/// The result of a linked editing range request.
/// @since 3.16.0
class LinkedEditingRanges extends ToJson {}

class LinkedEditingRangeRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        LinkedEditingRangeOptions,
        StaticRegistrationOptions {}

/// The parameters sent in notifications/requests for user-initiated creation
/// of files.
/// @since 3.16.0
class CreateFilesParams extends ToJson {}

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
class WorkspaceEdit extends ToJson {}

/// The options to register for file operations.
/// @since 3.16.0
class FileOperationRegistrationOptions extends ToJson {}

/// The parameters sent in notifications/requests for user-initiated renames of
/// files.
/// @since 3.16.0
class RenameFilesParams extends ToJson {}

/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
/// @since 3.16.0
class DeleteFilesParams extends ToJson {}

class MonikerParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

/// Moniker definition to match LSIF 0.5 moniker definition.
/// @since 3.16.0
class Moniker extends ToJson {}

class MonikerRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, MonikerOptions {}

/// The parameter of a `textDocument/prepareTypeHierarchy` request.
/// @since 3.17.0
class TypeHierarchyPrepareParams extends ToJson
    implements TextDocumentPositionParams, WorkDoneProgressParams {}

/// @since 3.17.0
class TypeHierarchyItem extends ToJson {}

/// Type hierarchy options used during static or dynamic registration.
/// @since 3.17.0
class TypeHierarchyRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        TypeHierarchyOptions,
        StaticRegistrationOptions {}

/// The parameter of a `typeHierarchy/supertypes` request.
/// @since 3.17.0
class TypeHierarchySupertypesParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// The parameter of a `typeHierarchy/subtypes` request.
/// @since 3.17.0
class TypeHierarchySubtypesParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// A parameter literal used in inline value requests.
/// @since 3.17.0
class InlineValueParams extends ToJson implements WorkDoneProgressParams {}

/// Inline value options used during static or dynamic registration.
/// @since 3.17.0
class InlineValueRegistrationOptions extends ToJson
    implements
        InlineValueOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {}

/// A parameter literal used in inlay hint requests.
/// @since 3.17.0
class InlayHintParams extends ToJson implements WorkDoneProgressParams {}

/// Inlay hint information.
/// @since 3.17.0
class InlayHint extends ToJson {}

/// Inlay hint options used during static or dynamic registration.
/// @since 3.17.0
class InlayHintRegistrationOptions extends ToJson
    implements
        InlayHintOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {}

/// Parameters of the document diagnostic request.
/// @since 3.17.0
class DocumentDiagnosticParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// A partial result for a document diagnostic report.
/// @since 3.17.0
class DocumentDiagnosticReportPartialResult extends ToJson {}

/// Cancellation data returned from a diagnostic request.
/// @since 3.17.0
class DiagnosticServerCancellationData extends ToJson {}

/// Diagnostic registration options.
/// @since 3.17.0
class DiagnosticRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        DiagnosticOptions,
        StaticRegistrationOptions {}

/// Parameters of the workspace diagnostic request.
/// @since 3.17.0
class WorkspaceDiagnosticParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// A workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReport extends ToJson {}

/// A partial result for a workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReportPartialResult extends ToJson {}

/// The params sent in an open notebook document notification.
/// @since 3.17.0
class DidOpenNotebookDocumentParams extends ToJson {}

/// The params sent in a change notebook document notification.
/// @since 3.17.0
class DidChangeNotebookDocumentParams extends ToJson {}

/// The params sent in a save notebook document notification.
/// @since 3.17.0
class DidSaveNotebookDocumentParams extends ToJson {}

/// The params sent in a close notebook document notification.
/// @since 3.17.0
class DidCloseNotebookDocumentParams extends ToJson {}

/// A parameter literal used in inline completion requests.
/// @since 3.18.0 @proposed
class InlineCompletionParams extends ToJson
    implements TextDocumentPositionParams, WorkDoneProgressParams {}

/// Represents a collection of {@link InlineCompletionItem inline completion
/// items} to be presented in the editor.
/// @since 3.18.0 @proposed
class InlineCompletionList extends ToJson {}

/// An inline completion item represents a text snippet that is proposed inline
/// to complete text that is being typed.
/// @since 3.18.0 @proposed
class InlineCompletionItem extends ToJson {}

/// Inline completion options used during static or dynamic registration.
/// @since 3.18.0 @proposed
class InlineCompletionRegistrationOptions extends ToJson
    implements
        InlineCompletionOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {}

class RegistrationParams extends ToJson {}

class UnregistrationParams extends ToJson {}

class InitializeParams extends ToJson
    implements _InitializeParams, WorkspaceFoldersInitializeParams {}

/// The result returned from an initialize request.
class InitializeResult extends ToJson {}

/// The data type of the ResponseError if the initialize request fails.
class InitializeError extends ToJson {}

class InitializedParams extends ToJson {}

/// The parameters of a change configuration notification.
class DidChangeConfigurationParams extends ToJson {}

class DidChangeConfigurationRegistrationOptions extends ToJson {}

/// The parameters of a notification message.
class ShowMessageParams extends ToJson {}

class ShowMessageRequestParams extends ToJson {}

class MessageActionItem extends ToJson {}

/// The log message parameters.
class LogMessageParams extends ToJson {}

/// The parameters sent in an open text document notification
class DidOpenTextDocumentParams extends ToJson {}

/// The change text document notification's parameters.
class DidChangeTextDocumentParams extends ToJson {}

/// Describe options to be used when registered for text document change events.
class TextDocumentChangeRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions {}

/// The parameters sent in a close text document notification
class DidCloseTextDocumentParams extends ToJson {}

/// The parameters sent in a save text document notification
class DidSaveTextDocumentParams extends ToJson {}

/// Save registration options.
class TextDocumentSaveRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, SaveOptions {}

/// The parameters sent in a will save text document notification.
class WillSaveTextDocumentParams extends ToJson {}

/// A text edit applicable to a text document.
class TextEdit extends ToJson {}

/// The watched files change notification's parameters.
class DidChangeWatchedFilesParams extends ToJson {}

/// Describe options to be used when registered for text document change events.
class DidChangeWatchedFilesRegistrationOptions extends ToJson {}

/// The publish diagnostic notification's parameters.
class PublishDiagnosticsParams extends ToJson {}

/// Completion parameters
class CompletionParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

/// A completion item represents a text snippet that is proposed to complete
/// text that is being typed.
class CompletionItem extends ToJson {}

/// Represents a collection of {@link CompletionItem completion items} to be
/// presented in the editor.
class CompletionList extends ToJson {}

/// Registration options for a {@link CompletionRequest}.
class CompletionRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, CompletionOptions {}

/// Parameters for a {@link HoverRequest}.
class HoverParams extends ToJson
    implements TextDocumentPositionParams, WorkDoneProgressParams {}

/// The result of a hover request.
class Hover extends ToJson {}

/// Registration options for a {@link HoverRequest}.
class HoverRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, HoverOptions {}

/// Parameters for a {@link SignatureHelpRequest}.
class SignatureHelpParams extends ToJson
    implements TextDocumentPositionParams, WorkDoneProgressParams {}

/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
class SignatureHelp extends ToJson {}

/// Registration options for a {@link SignatureHelpRequest}.
class SignatureHelpRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, SignatureHelpOptions {}

/// Parameters for a {@link DefinitionRequest}.
class DefinitionParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

/// Registration options for a {@link DefinitionRequest}.
class DefinitionRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, DefinitionOptions {}

/// Parameters for a {@link ReferencesRequest}.
class ReferenceParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

/// Registration options for a {@link ReferencesRequest}.
class ReferenceRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, ReferenceOptions {}

/// Parameters for a {@link DocumentHighlightRequest}.
class DocumentHighlightParams extends ToJson
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {}

/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
class DocumentHighlight extends ToJson {}

/// Registration options for a {@link DocumentHighlightRequest}.
class DocumentHighlightRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, DocumentHighlightOptions {}

/// Parameters for a {@link DocumentSymbolRequest}.
class DocumentSymbolParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// Represents information about programming constructs like variables,
/// classes, interfaces etc.
class SymbolInformation extends ToJson implements BaseSymbolInformation {}

/// Represents programming constructs like variables, classes, interfaces etc.
/// that appear in a document. Document symbols can be hierarchical and they
/// have two ranges: one that encloses its definition and one that points to
/// its most interesting range, e.g. the range of an identifier.
class DocumentSymbol extends ToJson {}

/// Registration options for a {@link DocumentSymbolRequest}.
class DocumentSymbolRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, DocumentSymbolOptions {}

/// The parameters of a {@link CodeActionRequest}.
class CodeActionParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// Represents a reference to a command. Provides a title which will be used to
/// represent a command in the UI and, optionally, an array of arguments which
/// will be passed to the command handler function when invoked.
class Command extends ToJson {}

/// A code action represents a change that can be performed in code, e.g. to
/// fix a problem or to refactor code.
/// A CodeAction must set either `edit` and/or a `command`. If both are
/// supplied, the `edit` is applied first, then the `command` is executed.
class CodeAction extends ToJson {}

/// Registration options for a {@link CodeActionRequest}.
class CodeActionRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, CodeActionOptions {}

/// The parameters of a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// A special workspace symbol that supports locations without a range.
/// See also SymbolInformation.
/// @since 3.17.0
class WorkspaceSymbol extends ToJson implements BaseSymbolInformation {}

/// Registration options for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolRegistrationOptions extends ToJson
    implements WorkspaceSymbolOptions {}

/// The parameters of a {@link CodeLensRequest}.
class CodeLensParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// A code lens represents a {@link Command command} that should be shown along
/// with source text, like the number of references, a way to run tests, etc.
/// A code lens is _unresolved_ when no command is associated to it. For
/// performance reasons the creation of a code lens and resolving should be
/// done in two stages.
class CodeLens extends ToJson {}

/// Registration options for a {@link CodeLensRequest}.
class CodeLensRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, CodeLensOptions {}

/// The parameters of a {@link DocumentLinkRequest}.
class DocumentLinkParams extends ToJson
    implements WorkDoneProgressParams, PartialResultParams {}

/// A document link is a range in a text document that links to an internal or
/// external resource, like another text document or a web site.
class DocumentLink extends ToJson {}

/// Registration options for a {@link DocumentLinkRequest}.
class DocumentLinkRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, DocumentLinkOptions {}

/// The parameters of a {@link DocumentFormattingRequest}.
class DocumentFormattingParams extends ToJson
    implements WorkDoneProgressParams {}

/// Registration options for a {@link DocumentFormattingRequest}.
class DocumentFormattingRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, DocumentFormattingOptions {}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingParams extends ToJson
    implements WorkDoneProgressParams {}

/// Registration options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        DocumentRangeFormattingOptions {}

/// The parameters of a {@link DocumentRangesFormattingRequest}.
/// @since 3.18.0 @proposed
class DocumentRangesFormattingParams extends ToJson
    implements WorkDoneProgressParams {}

/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingParams extends ToJson {}

/// Registration options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingRegistrationOptions extends ToJson
    implements
        TextDocumentRegistrationOptions,
        DocumentOnTypeFormattingOptions {}

/// The parameters of a {@link RenameRequest}.
class RenameParams extends ToJson implements WorkDoneProgressParams {}

/// Registration options for a {@link RenameRequest}.
class RenameRegistrationOptions extends ToJson
    implements TextDocumentRegistrationOptions, RenameOptions {}

class PrepareRenameParams extends ToJson
    implements TextDocumentPositionParams, WorkDoneProgressParams {}

/// The parameters of a {@link ExecuteCommandRequest}.
class ExecuteCommandParams extends ToJson implements WorkDoneProgressParams {}

/// Registration options for a {@link ExecuteCommandRequest}.
class ExecuteCommandRegistrationOptions extends ToJson
    implements ExecuteCommandOptions {}

/// The parameters passed via an apply workspace edit request.
class ApplyWorkspaceEditParams extends ToJson {}

/// The result returned from the apply workspace edit request.
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
class ApplyWorkspaceEditResult extends ToJson {}

class WorkDoneProgressBegin extends ToJson {}

class WorkDoneProgressReport extends ToJson {}

class WorkDoneProgressEnd extends ToJson {}

class SetTraceParams extends ToJson {}

class LogTraceParams extends ToJson {}

class CancelParams extends ToJson {}

class ProgressParams extends ToJson {}

/// A parameter literal used in requests to pass a text document and a position
/// inside that document.
class TextDocumentPositionParams extends ToJson {}

class WorkDoneProgressParams extends ToJson {}

class PartialResultParams extends ToJson {}

/// Represents the connection of two locations. Provides additional metadata
/// over normal {@link Location locations}, including an origin range.
class LocationLink extends ToJson {}

/// A range in a text document expressed as (zero-based) start and end
/// positions.
/// If you want to specify a range that contains a line including the line
/// ending character(s) then use an end position denoting the start of the next
/// line. For example: ```ts { start: { line: 5, character: 23 } end : { line
/// 6, character : 0 } } ```
class Range extends ToJson {}

class ImplementationOptions extends ToJson implements WorkDoneProgressOptions {}

/// Static registration options to be returned in the initialize request.
class StaticRegistrationOptions extends ToJson {}

class TypeDefinitionOptions extends ToJson implements WorkDoneProgressOptions {}

/// The workspace folder change event.
class WorkspaceFoldersChangeEvent extends ToJson {}

class ConfigurationItem extends ToJson {}

/// A literal to identify a text document in the client.
class TextDocumentIdentifier extends ToJson {}

/// Represents a color in RGBA space.
class Color extends ToJson {}

class DocumentColorOptions extends ToJson implements WorkDoneProgressOptions {}

class FoldingRangeOptions extends ToJson implements WorkDoneProgressOptions {}

class DeclarationOptions extends ToJson implements WorkDoneProgressOptions {}

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
class Position extends ToJson {}

class SelectionRangeOptions extends ToJson implements WorkDoneProgressOptions {}

/// Call hierarchy options used during static registration.
/// @since 3.16.0
class CallHierarchyOptions extends ToJson implements WorkDoneProgressOptions {}

/// @since 3.16.0
class SemanticTokensOptions extends ToJson implements WorkDoneProgressOptions {}

/// @since 3.16.0
class SemanticTokensEdit extends ToJson {}

class LinkedEditingRangeOptions extends ToJson
    implements WorkDoneProgressOptions {}

/// Represents information on a file/folder create.
/// @since 3.16.0
class FileCreate extends ToJson {}

/// Describes textual changes on a text document. A TextDocumentEdit describes
/// all changes on a document version Si and after they are applied move the
/// document to version Si+1. So the creator of a TextDocumentEdit doesn't need
/// to sort the array of edits or do any kind of ordering. However the edits
/// must be non overlapping.
class TextDocumentEdit extends ToJson {}

/// Create file operation.
class CreateFile extends ToJson implements ResourceOperation {}

/// Rename file operation
class RenameFile extends ToJson implements ResourceOperation {}

/// Delete file operation
class DeleteFile extends ToJson implements ResourceOperation {}

/// Additional information that describes document changes.
/// @since 3.16.0
class ChangeAnnotation extends ToJson {}

/// A filter to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationFilter extends ToJson {}

/// Represents information on a file/folder rename.
/// @since 3.16.0
class FileRename extends ToJson {}

/// Represents information on a file/folder delete.
/// @since 3.16.0
class FileDelete extends ToJson {}

class MonikerOptions extends ToJson implements WorkDoneProgressOptions {}

/// Type hierarchy options used during static registration.
/// @since 3.17.0
class TypeHierarchyOptions extends ToJson implements WorkDoneProgressOptions {}

/// @since 3.17.0
class InlineValueContext extends ToJson {}

/// Provide inline value as text.
/// @since 3.17.0
class InlineValueText extends ToJson {}

/// Provide inline value through a variable lookup. If only a range is
/// specified, the variable name will be extracted from the underlying
/// document. An optional variable name can be used to override the extracted
/// name.
/// @since 3.17.0
class InlineValueVariableLookup extends ToJson {}

/// Provide an inline value through an expression evaluation. If only a range
/// is specified, the expression will be extracted from the underlying
/// document. An optional expression can be used to override the extracted
/// expression.
/// @since 3.17.0
class InlineValueEvaluatableExpression extends ToJson {}

/// Inline value options used during static registration.
/// @since 3.17.0
class InlineValueOptions extends ToJson implements WorkDoneProgressOptions {}

/// An inlay hint label part allows for interactive and composite labels of
/// inlay hints.
/// @since 3.17.0
class InlayHintLabelPart extends ToJson {}

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
class MarkupContent extends ToJson {}

/// Inlay hint options used during static registration.
/// @since 3.17.0
class InlayHintOptions extends ToJson implements WorkDoneProgressOptions {}

/// A full diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedFullDocumentDiagnosticReport extends ToJson
    implements FullDocumentDiagnosticReport {}

/// An unchanged diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedUnchangedDocumentDiagnosticReport extends ToJson
    implements UnchangedDocumentDiagnosticReport {}

/// A diagnostic report with a full set of problems.
/// @since 3.17.0
class FullDocumentDiagnosticReport extends ToJson {}

/// A diagnostic report indicating that the last returned report is still
/// accurate.
/// @since 3.17.0
class UnchangedDocumentDiagnosticReport extends ToJson {}

/// Diagnostic options.
/// @since 3.17.0
class DiagnosticOptions extends ToJson implements WorkDoneProgressOptions {}

/// A previous result id in a workspace pull request.
/// @since 3.17.0
class PreviousResultId extends ToJson {}

/// A notebook document.
/// @since 3.17.0
class NotebookDocument extends ToJson {}

/// An item to transfer a text document from the client to the server.
class TextDocumentItem extends ToJson {}

/// A versioned notebook document identifier.
/// @since 3.17.0
class VersionedNotebookDocumentIdentifier extends ToJson {}

/// A change event for a notebook document.
/// @since 3.17.0
class NotebookDocumentChangeEvent extends ToJson {}

/// A literal to identify a notebook document in the client.
/// @since 3.17.0
class NotebookDocumentIdentifier extends ToJson {}

/// Provides information about the context in which an inline completion was
/// requested.
/// @since 3.18.0 @proposed
class InlineCompletionContext extends ToJson {}

/// A string value used as a snippet is a template which allows to insert text
/// and to control the editor cursor when insertion happens.
/// A snippet can define tab stops and placeholders with `$1`, `$2` and
/// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
/// snippet. Variables are defined with `$name` and `${name:default value}`.
/// @since 3.18.0 @proposed
class StringValue extends ToJson {}

/// Inline completion options used during static registration.
/// @since 3.18.0 @proposed
class InlineCompletionOptions extends ToJson
    implements WorkDoneProgressOptions {}

/// General parameters to register for a notification or to register a provider.
class Registration extends ToJson {}

/// General parameters to unregister a request or notification.
class Unregistration extends ToJson {}

/// The initialize parameters
class _InitializeParams extends ToJson implements WorkDoneProgressParams {}

class WorkspaceFoldersInitializeParams extends ToJson {}

/// Defines the capabilities provided by a language server.
class ServerCapabilities extends ToJson {}

/// A text document identifier to denote a specific version of a text document.
class VersionedTextDocumentIdentifier extends ToJson
    implements TextDocumentIdentifier {}

/// Save options.
class SaveOptions extends ToJson {}

/// An event describing a file change.
class FileEvent extends ToJson {}

class FileSystemWatcher extends ToJson {}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic
/// objects are only valid in the scope of a resource.
class Diagnostic extends ToJson {}

/// Contains additional information about the context in which a completion
/// request is triggered.
class CompletionContext extends ToJson {}

/// Additional details for a completion item label.
/// @since 3.17.0
class CompletionItemLabelDetails extends ToJson {}

/// A special text edit to provide an insert and a replace operation.
/// @since 3.16.0
class InsertReplaceEdit extends ToJson {}

/// Completion options.
class CompletionOptions extends ToJson implements WorkDoneProgressOptions {}

/// Hover options.
class HoverOptions extends ToJson implements WorkDoneProgressOptions {}

/// Additional information about the context in which a signature help request
/// was triggered.
/// @since 3.15.0
class SignatureHelpContext extends ToJson {}

/// Represents the signature of something callable. A signature can have a
/// label, like a function-name, a doc-comment, and a set of parameters.
class SignatureInformation extends ToJson {}

/// Server Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpOptions extends ToJson implements WorkDoneProgressOptions {}

/// Server Capabilities for a {@link DefinitionRequest}.
class DefinitionOptions extends ToJson implements WorkDoneProgressOptions {}

/// Value-object that contains additional information when requesting
/// references.
class ReferenceContext extends ToJson {}

/// Reference options.
class ReferenceOptions extends ToJson implements WorkDoneProgressOptions {}

/// Provider options for a {@link DocumentHighlightRequest}.
class DocumentHighlightOptions extends ToJson
    implements WorkDoneProgressOptions {}

/// A base for all symbol information.
class BaseSymbolInformation extends ToJson {}

/// Provider options for a {@link DocumentSymbolRequest}.
class DocumentSymbolOptions extends ToJson implements WorkDoneProgressOptions {}

/// Contains additional diagnostic information about the context in which a
/// {@link CodeActionProvider.provideCodeActions code action} is run.
class CodeActionContext extends ToJson {}

/// Provider options for a {@link CodeActionRequest}.
class CodeActionOptions extends ToJson implements WorkDoneProgressOptions {}

/// Server capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolOptions extends ToJson
    implements WorkDoneProgressOptions {}

/// Code Lens provider options of a {@link CodeLensRequest}.
class CodeLensOptions extends ToJson implements WorkDoneProgressOptions {}

/// Provider options for a {@link DocumentLinkRequest}.
class DocumentLinkOptions extends ToJson implements WorkDoneProgressOptions {}

/// Value-object describing what options formatting should use.
class FormattingOptions extends ToJson {}

/// Provider options for a {@link DocumentFormattingRequest}.
class DocumentFormattingOptions extends ToJson
    implements WorkDoneProgressOptions {}

/// Provider options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingOptions extends ToJson
    implements WorkDoneProgressOptions {}

/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingOptions extends ToJson {}

/// Provider options for a {@link RenameRequest}.
class RenameOptions extends ToJson implements WorkDoneProgressOptions {}

/// The server capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandOptions extends ToJson implements WorkDoneProgressOptions {}

/// @since 3.16.0
class SemanticTokensLegend extends ToJson {}

/// A text document identifier to optionally denote a specific version of a
/// text document.
class OptionalVersionedTextDocumentIdentifier extends ToJson
    implements TextDocumentIdentifier {}

/// A special text edit with an additional change annotation.
/// @since 3.16.0.
class AnnotatedTextEdit extends ToJson implements TextEdit {}

/// A generic resource operation.
class ResourceOperation extends ToJson {}

/// Options to create a file.
class CreateFileOptions extends ToJson {}

/// Rename file options
class RenameFileOptions extends ToJson {}

/// Delete file options
class DeleteFileOptions extends ToJson {}

/// A pattern to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationPattern extends ToJson {}

/// A full document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceFullDocumentDiagnosticReport extends ToJson
    implements FullDocumentDiagnosticReport {}

/// An unchanged document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceUnchangedDocumentDiagnosticReport extends ToJson
    implements UnchangedDocumentDiagnosticReport {}

/// A notebook cell.
/// A cell's document URI must be unique across ALL notebook cells and can
/// therefore be used to uniquely identify a notebook cell or the cell's text
/// document.
/// @since 3.17.0
class NotebookCell extends ToJson {}

/// A change describing how to move a `NotebookCell` array from state S to S'.
/// @since 3.17.0
class NotebookCellArrayChange extends ToJson {}

/// Describes the currently selected completion item.
/// @since 3.18.0 @proposed
class SelectedCompletionInfo extends ToJson {}

/// Defines the capabilities provided by the client.
class ClientCapabilities extends ToJson {}

class TextDocumentSyncOptions extends ToJson {}

/// Options specific to a notebook plus its cells to be synced to the server.
/// If a selector provides a notebook document filter but no cell selector all
/// cells of a matching notebook document will be synced.
/// If a selector provides no notebook document filter but only a cell selector
/// all notebook document that contain at least one matching cell will be
/// synced.
/// @since 3.17.0
class NotebookDocumentSyncOptions extends ToJson {}

/// Registration options specific to a notebook.
/// @since 3.17.0
class NotebookDocumentSyncRegistrationOptions extends ToJson
    implements NotebookDocumentSyncOptions, StaticRegistrationOptions {}

class WorkspaceFoldersServerCapabilities extends ToJson {}

/// Options for notifications/requests for user operations on files.
/// @since 3.16.0
class FileOperationOptions extends ToJson {}

/// Structure to capture a description for an error code.
/// @since 3.16.0
class CodeDescription extends ToJson {}

/// Represents a related message and source code location for a diagnostic.
/// This should be used to point to code locations that cause or related to a
/// diagnostics, e.g when duplicating a symbol in a scope.
class DiagnosticRelatedInformation extends ToJson {}

/// Represents a parameter of a callable-signature. A parameter can have a
/// label and a doc-comment.
class ParameterInformation extends ToJson {}

/// A notebook cell text document filter denotes a cell text document by
/// different properties.
/// @since 3.17.0
class NotebookCellTextDocumentFilter extends ToJson {}

/// Matching options for the file operation pattern.
/// @since 3.16.0
class FileOperationPatternOptions extends ToJson {}

class ExecutionSummary extends ToJson {}

/// Workspace specific client capabilities.
class WorkspaceClientCapabilities extends ToJson {}

/// Text document specific client capabilities.
class TextDocumentClientCapabilities extends ToJson {}

/// Capabilities specific to the notebook document support.
/// @since 3.17.0
class NotebookDocumentClientCapabilities extends ToJson {}

class WindowClientCapabilities extends ToJson {}

/// General client capabilities.
/// @since 3.16.0
class GeneralClientCapabilities extends ToJson {}

/// A relative pattern is a helper to construct glob patterns that are matched
/// relatively to a base URI. The common value for a `baseUri` is a workspace
/// folder root, but it can be another absolute URI as well.
/// @since 3.17.0
class RelativePattern extends ToJson {}

class WorkspaceEditClientCapabilities extends ToJson {}

class DidChangeConfigurationClientCapabilities extends ToJson {}

class DidChangeWatchedFilesClientCapabilities extends ToJson {}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolClientCapabilities extends ToJson {}

/// The client capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandClientCapabilities extends ToJson {}

/// @since 3.16.0
class SemanticTokensWorkspaceClientCapabilities extends ToJson {}

/// @since 3.16.0
class CodeLensWorkspaceClientCapabilities extends ToJson {}

/// Capabilities relating to events from file operations by the user in the
/// client.
/// These events do not come from the file system, they come from user
/// operations like renaming a file in the UI.
/// @since 3.16.0
class FileOperationClientCapabilities extends ToJson {}

/// Client workspace capabilities specific to inline values.
/// @since 3.17.0
class InlineValueWorkspaceClientCapabilities extends ToJson {}

/// Client workspace capabilities specific to inlay hints.
/// @since 3.17.0
class InlayHintWorkspaceClientCapabilities extends ToJson {}

/// Workspace client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticWorkspaceClientCapabilities extends ToJson {}

/// Client workspace capabilities specific to folding ranges
/// @since 3.18.0 @proposed
class FoldingRangeWorkspaceClientCapabilities extends ToJson {}

class TextDocumentSyncClientCapabilities extends ToJson {}

/// Completion client capabilities
class CompletionClientCapabilities extends ToJson {}

class HoverClientCapabilities extends ToJson {}

/// Client Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpClientCapabilities extends ToJson {}

/// @since 3.14.0
class DeclarationClientCapabilities extends ToJson {}

/// Client Capabilities for a {@link DefinitionRequest}.
class DefinitionClientCapabilities extends ToJson {}

/// Since 3.6.0
class TypeDefinitionClientCapabilities extends ToJson {}

/// @since 3.6.0
class ImplementationClientCapabilities extends ToJson {}

/// Client Capabilities for a {@link ReferencesRequest}.
class ReferenceClientCapabilities extends ToJson {}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
class DocumentHighlightClientCapabilities extends ToJson {}

/// Client Capabilities for a {@link DocumentSymbolRequest}.
class DocumentSymbolClientCapabilities extends ToJson {}

/// The Client Capabilities of a {@link CodeActionRequest}.
class CodeActionClientCapabilities extends ToJson {}

/// The client capabilities  of a {@link CodeLensRequest}.
class CodeLensClientCapabilities extends ToJson {}

/// The client capabilities of a {@link DocumentLinkRequest}.
class DocumentLinkClientCapabilities extends ToJson {}

class DocumentColorClientCapabilities extends ToJson {}

/// Client capabilities of a {@link DocumentFormattingRequest}.
class DocumentFormattingClientCapabilities extends ToJson {}

/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingClientCapabilities extends ToJson {}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingClientCapabilities extends ToJson {}

class RenameClientCapabilities extends ToJson {}

class FoldingRangeClientCapabilities extends ToJson {}

class SelectionRangeClientCapabilities extends ToJson {}

/// The publish diagnostic client capabilities.
class PublishDiagnosticsClientCapabilities extends ToJson {}

/// @since 3.16.0
class CallHierarchyClientCapabilities extends ToJson {}

/// @since 3.16.0
class SemanticTokensClientCapabilities extends ToJson {}

/// Client capabilities for the linked editing range request.
/// @since 3.16.0
class LinkedEditingRangeClientCapabilities extends ToJson {}

/// Client capabilities specific to the moniker request.
/// @since 3.16.0
class MonikerClientCapabilities extends ToJson {}

/// @since 3.17.0
class TypeHierarchyClientCapabilities extends ToJson {}

/// Client capabilities specific to inline values.
/// @since 3.17.0
class InlineValueClientCapabilities extends ToJson {}

/// Inlay hint client capabilities.
/// @since 3.17.0
class InlayHintClientCapabilities extends ToJson {}

/// Client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticClientCapabilities extends ToJson {}

/// Client capabilities specific to inline completions.
/// @since 3.18.0 @proposed
class InlineCompletionClientCapabilities extends ToJson {}

/// Notebook specific client capabilities.
/// @since 3.17.0
class NotebookDocumentSyncClientCapabilities extends ToJson {}

/// Show message request client capabilities
class ShowMessageRequestClientCapabilities extends ToJson {}

/// Client capabilities for the showDocument request.
/// @since 3.16.0
class ShowDocumentClientCapabilities extends ToJson {}

/// Client capabilities specific to regular expressions.
/// @since 3.16.0
class RegularExpressionsClientCapabilities extends ToJson {}

/// Client capabilities specific to the used markdown parser.
/// @since 3.16.0
class MarkdownClientCapabilities extends ToJson {}
