// GENERATED — do not edit.

import 'package:json_annotation/json_annotation.dart';

/// A set of predefined token types. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
@JsonEnum()
enum SemanticTokenTypes {
  @JsonValue('namespace')
  namespace,

  /// Represents a generic type. Acts as a fallback for types which can't be mapped to
  /// a specific type like class or enum.
  @JsonValue('type')
  type_,
  @JsonValue('class')
  class_,
  @JsonValue('enum')
  enum_,
  @JsonValue('interface')
  interface_,
  @JsonValue('struct')
  struct,
  @JsonValue('typeParameter')
  typeParameter,
  @JsonValue('parameter')
  parameter,
  @JsonValue('variable')
  variable,
  @JsonValue('property')
  property,
  @JsonValue('enumMember')
  enumMember,
  @JsonValue('event')
  event,
  @JsonValue('function')
  function,
  @JsonValue('method')
  method,
  @JsonValue('macro')
  macro,
  @JsonValue('keyword')
  keyword,
  @JsonValue('modifier')
  modifier,
  @JsonValue('comment')
  comment,
  @JsonValue('string')
  string,
  @JsonValue('number')
  number,
  @JsonValue('regexp')
  regexp,
  @JsonValue('operator')
  operator_,

  /// @since 3.17.0
  @JsonValue('decorator')
  decorator,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(r'$unknown')
  $unknown,
}

/// A set of predefined token modifiers. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
@JsonEnum()
enum SemanticTokenModifiers {
  @JsonValue('declaration')
  declaration,
  @JsonValue('definition')
  definition,
  @JsonValue('readonly')
  readonly,
  @JsonValue('static')
  static_,
  @JsonValue('deprecated')
  deprecated,
  @JsonValue('abstract')
  abstract_,
  @JsonValue('async')
  async_,
  @JsonValue('modification')
  modification,
  @JsonValue('documentation')
  documentation,
  @JsonValue('defaultLibrary')
  defaultLibrary,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(r'$unknown')
  $unknown,
}

/// The document diagnostic report kinds.
///
/// @since 3.17.0
@JsonEnum()
enum DocumentDiagnosticReportKind {
  /// A diagnostic report with a full
  /// set of problems.
  @JsonValue('full')
  Full,

  /// A report indicating that the last
  /// returned report is still accurate.
  @JsonValue('unchanged')
  Unchanged,
}

/// Predefined error codes.
@JsonEnum()
enum ErrorCodes {
  @JsonValue(-32700)
  ParseError,
  @JsonValue(-32600)
  InvalidRequest,
  @JsonValue(-32601)
  MethodNotFound,
  @JsonValue(-32602)
  InvalidParams,
  @JsonValue(-32603)
  InternalError,

  /// Error code indicating that a server received a notification or
  /// request before the server has received the `initialize` request.
  @JsonValue(-32002)
  ServerNotInitialized,
  @JsonValue(-32001)
  UnknownErrorCode,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(0)
  $unknown,
}

@JsonEnum()
enum LSPErrorCodes {
  /// A request failed but it was syntactically correct, e.g the
  /// method name was known and the parameters were valid. The error
  /// message should contain human readable information about why
  /// the request failed.
  ///
  /// @since 3.17.0
  @JsonValue(-32803)
  RequestFailed,

  /// The server cancelled the request. This error code should
  /// only be used for requests that explicitly support being
  /// server cancellable.
  ///
  /// @since 3.17.0
  @JsonValue(-32802)
  ServerCancelled,

  /// The server detected that the content of a document got
  /// modified outside normal conditions. A server should
  /// NOT send this error code if it detects a content change
  /// in it unprocessed messages. The result even computed
  /// on an older state might still be useful for the client.
  ///
  /// If a client decides that a result is not of any use anymore
  /// the client should cancel the request.
  @JsonValue(-32801)
  ContentModified,

  /// The client has canceled a request and a server has detected
  /// the cancel.
  @JsonValue(-32800)
  RequestCancelled,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(0)
  $unknown,
}

/// A set of predefined range kinds.
@JsonEnum()
enum FoldingRangeKind {
  /// Folding range for a comment
  @JsonValue('comment')
  Comment,

  /// Folding range for an import or include
  @JsonValue('imports')
  Imports,

  /// Folding range for a region (e.g. `#region`)
  @JsonValue('region')
  Region,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(r'$unknown')
  $unknown,
}

/// A symbol kind.
@JsonEnum()
enum SymbolKind {
  @JsonValue(1)
  File,
  @JsonValue(2)
  Module,
  @JsonValue(3)
  Namespace,
  @JsonValue(4)
  Package,
  @JsonValue(5)
  Class,
  @JsonValue(6)
  Method,
  @JsonValue(7)
  Property,
  @JsonValue(8)
  Field,
  @JsonValue(9)
  Constructor,
  @JsonValue(10)
  Enum,
  @JsonValue(11)
  Interface,
  @JsonValue(12)
  Function_,
  @JsonValue(13)
  Variable,
  @JsonValue(14)
  Constant,
  @JsonValue(15)
  String,
  @JsonValue(16)
  Number,
  @JsonValue(17)
  Boolean,
  @JsonValue(18)
  Array,
  @JsonValue(19)
  Object,
  @JsonValue(20)
  Key,
  @JsonValue(21)
  Null,
  @JsonValue(22)
  EnumMember,
  @JsonValue(23)
  Struct,
  @JsonValue(24)
  Event,
  @JsonValue(25)
  Operator,
  @JsonValue(26)
  TypeParameter,
}

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
///
/// @since 3.16
@JsonEnum()
enum SymbolTag {
  /// Render a symbol as obsolete, usually using a strike-out.
  @JsonValue(1)
  Deprecated,
}

/// Moniker uniqueness level to define scope of the moniker.
///
/// @since 3.16.0
@JsonEnum()
enum UniquenessLevel {
  /// The moniker is only unique inside a document
  @JsonValue('document')
  document,

  /// The moniker is unique inside a project for which a dump got created
  @JsonValue('project')
  project,

  /// The moniker is unique inside the group to which a project belongs
  @JsonValue('group')
  group,

  /// The moniker is unique inside the moniker scheme.
  @JsonValue('scheme')
  scheme,

  /// The moniker is globally unique
  @JsonValue('global')
  global,
}

/// The moniker kind.
///
/// @since 3.16.0
@JsonEnum()
enum MonikerKind {
  /// The moniker represent a symbol that is imported into a project
  @JsonValue('import')
  import_,

  /// The moniker represents a symbol that is exported from a project
  @JsonValue('export')
  export_,

  /// The moniker represents a symbol that is local to a project (e.g. a local
  /// variable of a function, a class not visible outside the project, ...)
  @JsonValue('local')
  local,
}

/// Inlay hint kinds.
///
/// @since 3.17.0
@JsonEnum()
enum InlayHintKind {
  /// An inlay hint that for a type annotation.
  @JsonValue(1)
  Type,

  /// An inlay hint that is for a parameter.
  @JsonValue(2)
  Parameter,
}

/// The message type
@JsonEnum()
enum MessageType {
  /// An error message.
  @JsonValue(1)
  Error,

  /// A warning message.
  @JsonValue(2)
  Warning,

  /// An information message.
  @JsonValue(3)
  Info,

  /// A log message.
  @JsonValue(4)
  Log,

  /// A debug message.
  ///
  /// @since 3.18.0
  @JsonValue(5)
  Debug,
}

/// Defines how the host (editor) should sync
/// document changes to the language server.
@JsonEnum()
enum TextDocumentSyncKind {
  /// Documents should not be synced at all.
  @JsonValue(0)
  None,

  /// Documents are synced by always sending the full content
  /// of the document.
  @JsonValue(1)
  Full,

  /// Documents are synced by sending the full content on open.
  /// After that only incremental updates to the document are
  /// send.
  @JsonValue(2)
  Incremental,
}

/// Represents reasons why a text document is saved.
@JsonEnum()
enum TextDocumentSaveReason {
  /// Manually triggered, e.g. by the user pressing save, by starting debugging,
  /// or by an API call.
  @JsonValue(1)
  Manual,

  /// Automatic after a delay.
  @JsonValue(2)
  AfterDelay,

  /// When the editor lost focus.
  @JsonValue(3)
  FocusOut,
}

/// The kind of a completion entry.
@JsonEnum()
enum CompletionItemKind {
  @JsonValue(1)
  Text,
  @JsonValue(2)
  Method,
  @JsonValue(3)
  Function_,
  @JsonValue(4)
  Constructor,
  @JsonValue(5)
  Field,
  @JsonValue(6)
  Variable,
  @JsonValue(7)
  Class,
  @JsonValue(8)
  Interface,
  @JsonValue(9)
  Module,
  @JsonValue(10)
  Property,
  @JsonValue(11)
  Unit,
  @JsonValue(12)
  Value,
  @JsonValue(13)
  Enum,
  @JsonValue(14)
  Keyword,
  @JsonValue(15)
  Snippet,
  @JsonValue(16)
  Color,
  @JsonValue(17)
  File,
  @JsonValue(18)
  Reference,
  @JsonValue(19)
  Folder,
  @JsonValue(20)
  EnumMember,
  @JsonValue(21)
  Constant,
  @JsonValue(22)
  Struct,
  @JsonValue(23)
  Event,
  @JsonValue(24)
  Operator,
  @JsonValue(25)
  TypeParameter,
}

/// Completion item tags are extra annotations that tweak the rendering of a completion
/// item.
///
/// @since 3.15.0
@JsonEnum()
enum CompletionItemTag {
  /// Render a completion as obsolete, usually using a strike-out.
  @JsonValue(1)
  Deprecated,
}

/// Defines whether the insert text in a completion item should be interpreted as
/// plain text or a snippet.
@JsonEnum()
enum InsertTextFormat {
  /// The primary text to be inserted is treated as a plain string.
  @JsonValue(1)
  PlainText,

  /// The primary text to be inserted is treated as a snippet.
  ///
  /// A snippet can define tab stops and placeholders with `$1`, `$2`
  /// and `${3:foo}`. `$0` defines the final tab stop, it defaults to
  /// the end of the snippet. Placeholders with equal identifiers are linked,
  /// that is typing in one will update others too.
  ///
  /// See also: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
  @JsonValue(2)
  Snippet,
}

/// How whitespace and indentation is handled during completion
/// item insertion.
///
/// @since 3.16.0
@JsonEnum()
enum InsertTextMode {
  /// The insertion or replace strings is taken as it is. If the
  /// value is multi line the lines below the cursor will be
  /// inserted using the indentation defined in the string value.
  /// The client will not apply any kind of adjustments to the
  /// string.
  @JsonValue(1)
  asIs,

  /// The editor adjusts leading whitespace of new lines so that
  /// they match the indentation up to the cursor of the line for
  /// which the item is accepted.
  ///
  /// Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
  /// multi line completion item is indented using 2 tabs and all
  /// following lines inserted will be indented using 2 tabs as well.
  @JsonValue(2)
  adjustIndentation,
}

/// A document highlight kind.
@JsonEnum()
enum DocumentHighlightKind {
  /// A textual occurrence.
  @JsonValue(1)
  Text,

  /// Read-access of a symbol, like reading a variable.
  @JsonValue(2)
  Read,

  /// Write-access of a symbol, like writing to a variable.
  @JsonValue(3)
  Write,
}

/// A set of predefined code action kinds
@JsonEnum()
enum CodeActionKind {
  /// Empty kind.
  @JsonValue('')
  Empty,

  /// Base kind for quickfix actions: 'quickfix'
  @JsonValue('quickfix')
  QuickFix,

  /// Base kind for refactoring actions: 'refactor'
  @JsonValue('refactor')
  Refactor,

  /// Base kind for refactoring extraction actions: 'refactor.extract'
  ///
  /// Example extract actions:
  ///
  /// - Extract method
  /// - Extract function
  /// - Extract variable
  /// - Extract interface from class
  /// - ...
  @JsonValue('refactor.extract')
  RefactorExtract,

  /// Base kind for refactoring inline actions: 'refactor.inline'
  ///
  /// Example inline actions:
  ///
  /// - Inline function
  /// - Inline variable
  /// - Inline constant
  /// - ...
  @JsonValue('refactor.inline')
  RefactorInline,

  /// Base kind for refactoring rewrite actions: 'refactor.rewrite'
  ///
  /// Example rewrite actions:
  ///
  /// - Convert JavaScript function to class
  /// - Add or remove parameter
  /// - Encapsulate field
  /// - Make method static
  /// - Move method to base class
  /// - ...
  @JsonValue('refactor.rewrite')
  RefactorRewrite,

  /// Base kind for source actions: `source`
  ///
  /// Source code actions apply to the entire file.
  @JsonValue('source')
  Source,

  /// Base kind for an organize imports source action: `source.organizeImports`
  @JsonValue('source.organizeImports')
  SourceOrganizeImports,

  /// Base kind for auto-fix source actions: `source.fixAll`.
  ///
  /// Fix all actions automatically fix errors that have a clear fix that do not require user input.
  /// They should not suppress errors or perform unsafe fixes such as generating new types or classes.
  ///
  /// @since 3.15.0
  @JsonValue('source.fixAll')
  SourceFixAll,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(r'$unknown')
  $unknown,
}

@JsonEnum()
enum TraceValues {
  /// Turn tracing off.
  @JsonValue('off')
  Off,

  /// Trace messages only.
  @JsonValue('messages')
  Messages,

  /// Verbose message tracing.
  @JsonValue('verbose')
  Verbose,
}

/// Describes the content type that a client supports in various
/// result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
///
/// Please note that `MarkupKinds` must not start with a `$`. This kinds
/// are reserved for internal usage.
@JsonEnum()
enum MarkupKind {
  /// Plain text is supported as a content format
  @JsonValue('plaintext')
  PlainText,

  /// Markdown is supported as a content format
  @JsonValue('markdown')
  Markdown,
}

/// Describes how an {@link InlineCompletionItemProvider inline completion provider} was triggered.
///
/// @since 3.18.0
/// @proposed
@JsonEnum()
enum InlineCompletionTriggerKind {
  /// Completion was triggered explicitly by a user gesture.
  @JsonValue(0)
  Invoked,

  /// Completion was triggered automatically while editing.
  @JsonValue(1)
  Automatic,
}

/// A set of predefined position encoding kinds.
///
/// @since 3.17.0
@JsonEnum()
enum PositionEncodingKind {
  /// Character offsets count UTF-8 code units (e.g. bytes).
  @JsonValue('utf-8')
  UTF8,

  /// Character offsets count UTF-16 code units.
  ///
  /// This is the default and must always be supported
  /// by servers
  @JsonValue('utf-16')
  UTF16,

  /// Character offsets count UTF-32 code units.
  ///
  /// Implementation note: these are the same as Unicode codepoints,
  /// so this `PositionEncodingKind` may also be used for an
  /// encoding-agnostic representation of character offsets.
  @JsonValue('utf-32')
  UTF32,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(r'$unknown')
  $unknown,
}

/// The file event type
@JsonEnum()
enum FileChangeType {
  /// The file got created.
  @JsonValue(1)
  Created,

  /// The file got changed.
  @JsonValue(2)
  Changed,

  /// The file got deleted.
  @JsonValue(3)
  Deleted,
}

@JsonEnum()
enum WatchKind {
  /// Interested in create events.
  @JsonValue(1)
  Create,

  /// Interested in change events
  @JsonValue(2)
  Change,

  /// Interested in delete events
  @JsonValue(4)
  Delete,

  /// Sentinel returned when an unrecognised value is received.
  @JsonValue(0)
  $unknown,
}

/// The diagnostic's severity.
@JsonEnum()
enum DiagnosticSeverity {
  /// Reports an error.
  @JsonValue(1)
  Error,

  /// Reports a warning.
  @JsonValue(2)
  Warning,

  /// Reports an information.
  @JsonValue(3)
  Information,

  /// Reports a hint.
  @JsonValue(4)
  Hint,
}

/// The diagnostic tags.
///
/// @since 3.15.0
@JsonEnum()
enum DiagnosticTag {
  /// Unused or unnecessary code.
  ///
  /// Clients are allowed to render diagnostics with this tag faded out instead of having
  /// an error squiggle.
  @JsonValue(1)
  Unnecessary,

  /// Deprecated or obsolete code.
  ///
  /// Clients are allowed to rendered diagnostics with this tag strike through.
  @JsonValue(2)
  Deprecated,
}

/// How a completion was triggered
@JsonEnum()
enum CompletionTriggerKind {
  /// Completion was triggered by typing an identifier (24x7 code
  /// complete), manual invocation (e.g Ctrl+Space) or via API.
  @JsonValue(1)
  Invoked,

  /// Completion was triggered by a trigger character specified by
  /// the `triggerCharacters` properties of the `CompletionRegistrationOptions`.
  @JsonValue(2)
  TriggerCharacter,

  /// Completion was re-triggered as current completion list is incomplete
  @JsonValue(3)
  TriggerForIncompleteCompletions,
}

/// How a signature help was triggered.
///
/// @since 3.15.0
@JsonEnum()
enum SignatureHelpTriggerKind {
  /// Signature help was invoked manually by the user or by a command.
  @JsonValue(1)
  Invoked,

  /// Signature help was triggered by a trigger character.
  @JsonValue(2)
  TriggerCharacter,

  /// Signature help was triggered by the cursor moving or by the document content changing.
  @JsonValue(3)
  ContentChange,
}

/// The reason why code actions were requested.
///
/// @since 3.17.0
@JsonEnum()
enum CodeActionTriggerKind {
  /// Code actions were explicitly requested by the user or by an extension.
  @JsonValue(1)
  Invoked,

  /// Code actions were requested automatically.
  ///
  /// This typically happens when current selection in a file changes, but can
  /// also be triggered when file content changes.
  @JsonValue(2)
  Automatic,
}

/// A pattern kind describing if a glob pattern matches a file a folder or
/// both.
///
/// @since 3.16.0
@JsonEnum()
enum FileOperationPatternKind {
  /// The pattern matches a file only.
  @JsonValue('file')
  file,

  /// The pattern matches a folder only.
  @JsonValue('folder')
  folder,
}

/// A notebook cell kind.
///
/// @since 3.17.0
@JsonEnum()
enum NotebookCellKind {
  /// A markup-cell is formatted source that is used for display.
  @JsonValue(1)
  Markup,

  /// A code-cell is source code.
  @JsonValue(2)
  Code,
}

@JsonEnum()
enum ResourceOperationKind {
  /// Supports creating new files and folders.
  @JsonValue('create')
  Create,

  /// Supports renaming existing files and folders.
  @JsonValue('rename')
  Rename,

  /// Supports deleting existing files and folders.
  @JsonValue('delete')
  Delete,
}

@JsonEnum()
enum FailureHandlingKind {
  /// Applying the workspace change is simply aborted if one of the changes provided
  /// fails. All operations executed before the failing operation stay executed.
  @JsonValue('abort')
  Abort,

  /// All operations are executed transactional. That means they either all
  /// succeed or no changes at all are applied to the workspace.
  @JsonValue('transactional')
  Transactional,

  /// If the workspace edit contains only textual file changes they are executed transactional.
  /// If resource changes (create, rename or delete file) are part of the change the failure
  /// handling strategy is abort.
  @JsonValue('textOnlyTransactional')
  TextOnlyTransactional,

  /// The client tries to undo the operations already executed. But there is no
  /// guarantee that this is succeeding.
  @JsonValue('undo')
  Undo,
}

@JsonEnum()
enum PrepareSupportDefaultBehavior {
  /// The client's default behavior is to select the identifier
  /// according the to language's syntax rule.
  @JsonValue(1)
  Identifier,
}

@JsonEnum()
enum TokenFormat {
  @JsonValue('relative')
  Relative,
}
