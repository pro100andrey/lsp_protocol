// GENERATED — do not edit.

import 'package:json_annotation/json_annotation.dart';

/// A set of predefined token types. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
final class SemanticTokenTypes {
  const SemanticTokenTypes(this.value);

  final String value;

  static const SemanticTokenTypes namespace = SemanticTokenTypes('namespace');

  /// Represents a generic type. Acts as a fallback for types which can't be mapped to
  /// a specific type like class or enum.
  static const SemanticTokenTypes type_ = SemanticTokenTypes('type');

  static const SemanticTokenTypes class_ = SemanticTokenTypes('class');

  static const SemanticTokenTypes enum_ = SemanticTokenTypes('enum');

  static const SemanticTokenTypes interface_ = SemanticTokenTypes('interface');

  static const SemanticTokenTypes struct = SemanticTokenTypes('struct');

  static const SemanticTokenTypes typeParameter = SemanticTokenTypes(
    'typeParameter',
  );

  static const SemanticTokenTypes parameter = SemanticTokenTypes('parameter');

  static const SemanticTokenTypes variable = SemanticTokenTypes('variable');

  static const SemanticTokenTypes property = SemanticTokenTypes('property');

  static const SemanticTokenTypes enumMember = SemanticTokenTypes('enumMember');

  static const SemanticTokenTypes event = SemanticTokenTypes('event');

  static const SemanticTokenTypes function = SemanticTokenTypes('function');

  static const SemanticTokenTypes method = SemanticTokenTypes('method');

  static const SemanticTokenTypes macro = SemanticTokenTypes('macro');

  static const SemanticTokenTypes keyword = SemanticTokenTypes('keyword');

  static const SemanticTokenTypes modifier = SemanticTokenTypes('modifier');

  static const SemanticTokenTypes comment = SemanticTokenTypes('comment');

  static const SemanticTokenTypes string = SemanticTokenTypes('string');

  static const SemanticTokenTypes number = SemanticTokenTypes('number');

  static const SemanticTokenTypes regexp = SemanticTokenTypes('regexp');

  static const SemanticTokenTypes operator_ = SemanticTokenTypes('operator');

  /// @since 3.17.0
  static const SemanticTokenTypes decorator = SemanticTokenTypes('decorator');
}

/// A set of predefined token modifiers. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
final class SemanticTokenModifiers {
  const SemanticTokenModifiers(this.value);

  final String value;

  static const SemanticTokenModifiers declaration = SemanticTokenModifiers(
    'declaration',
  );

  static const SemanticTokenModifiers definition = SemanticTokenModifiers(
    'definition',
  );

  static const SemanticTokenModifiers readonly = SemanticTokenModifiers(
    'readonly',
  );

  static const SemanticTokenModifiers static_ = SemanticTokenModifiers(
    'static',
  );

  static const SemanticTokenModifiers deprecated = SemanticTokenModifiers(
    'deprecated',
  );

  static const SemanticTokenModifiers abstract_ = SemanticTokenModifiers(
    'abstract',
  );

  static const SemanticTokenModifiers async_ = SemanticTokenModifiers('async');

  static const SemanticTokenModifiers modification = SemanticTokenModifiers(
    'modification',
  );

  static const SemanticTokenModifiers documentation = SemanticTokenModifiers(
    'documentation',
  );

  static const SemanticTokenModifiers defaultLibrary = SemanticTokenModifiers(
    'defaultLibrary',
  );
}

/// The document diagnostic report kinds.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum DocumentDiagnosticReportKind {
  /// A diagnostic report with a full
  /// set of problems.
  Full('full'),

  /// A report indicating that the last
  /// returned report is still accurate.
  Unchanged('unchanged');

  const DocumentDiagnosticReportKind(this.value);

  final String value;
}

/// Predefined error codes.
final class ErrorCodes {
  const ErrorCodes(this.value);

  final int value;

  static const ErrorCodes ParseError = ErrorCodes(-32700);

  static const ErrorCodes InvalidRequest = ErrorCodes(-32600);

  static const ErrorCodes MethodNotFound = ErrorCodes(-32601);

  static const ErrorCodes InvalidParams = ErrorCodes(-32602);

  static const ErrorCodes InternalError = ErrorCodes(-32603);

  /// Error code indicating that a server received a notification or
  /// request before the server has received the `initialize` request.
  static const ErrorCodes ServerNotInitialized = ErrorCodes(-32002);

  static const ErrorCodes UnknownErrorCode = ErrorCodes(-32001);
}

final class LSPErrorCodes {
  const LSPErrorCodes(this.value);

  final int value;

  /// A request failed but it was syntactically correct, e.g the
  /// method name was known and the parameters were valid. The error
  /// message should contain human readable information about why
  /// the request failed.
  ///
  /// @since 3.17.0
  static const LSPErrorCodes RequestFailed = LSPErrorCodes(-32803);

  /// The server cancelled the request. This error code should
  /// only be used for requests that explicitly support being
  /// server cancellable.
  ///
  /// @since 3.17.0
  static const LSPErrorCodes ServerCancelled = LSPErrorCodes(-32802);

  /// The server detected that the content of a document got
  /// modified outside normal conditions. A server should
  /// NOT send this error code if it detects a content change
  /// in it unprocessed messages. The result even computed
  /// on an older state might still be useful for the client.
  ///
  /// If a client decides that a result is not of any use anymore
  /// the client should cancel the request.
  static const LSPErrorCodes ContentModified = LSPErrorCodes(-32801);

  /// The client has canceled a request and a server has detected
  /// the cancel.
  static const LSPErrorCodes RequestCancelled = LSPErrorCodes(-32800);
}

/// A set of predefined range kinds.
final class FoldingRangeKind {
  const FoldingRangeKind(this.value);

  final String value;

  /// Folding range for a comment
  static const FoldingRangeKind Comment = FoldingRangeKind('comment');

  /// Folding range for an import or include
  static const FoldingRangeKind Imports = FoldingRangeKind('imports');

  /// Folding range for a region (e.g. `#region`)
  static const FoldingRangeKind Region = FoldingRangeKind('region');
}

/// A symbol kind.
@JsonEnum(valueField: 'value')
enum SymbolKind {
  File(1),
  Module(2),
  Namespace(3),
  Package(4),
  Class(5),
  Method(6),
  Property(7),
  Field(8),
  Constructor(9),
  Enum(10),
  Interface(11),
  Function_(12),
  Variable(13),
  Constant(14),
  String(15),
  Number(16),
  Boolean(17),
  Array(18),
  Object(19),
  Key(20),
  Null(21),
  EnumMember(22),
  Struct(23),
  Event(24),
  Operator(25),
  TypeParameter(26);

  const SymbolKind(this.value);

  final int value;
}

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
///
/// @since 3.16
@JsonEnum(valueField: 'value')
enum SymbolTag {
  /// Render a symbol as obsolete, usually using a strike-out.
  Deprecated(1);

  const SymbolTag(this.value);

  final int value;
}

/// Moniker uniqueness level to define scope of the moniker.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum UniquenessLevel {
  /// The moniker is only unique inside a document
  document('document'),

  /// The moniker is unique inside a project for which a dump got created
  project('project'),

  /// The moniker is unique inside the group to which a project belongs
  group('group'),

  /// The moniker is unique inside the moniker scheme.
  scheme('scheme'),

  /// The moniker is globally unique
  global('global');

  const UniquenessLevel(this.value);

  final String value;
}

/// The moniker kind.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum MonikerKind {
  /// The moniker represent a symbol that is imported into a project
  import_('import'),

  /// The moniker represents a symbol that is exported from a project
  export_('export'),

  /// The moniker represents a symbol that is local to a project (e.g. a local
  /// variable of a function, a class not visible outside the project, ...)
  local('local');

  const MonikerKind(this.value);

  final String value;
}

/// Inlay hint kinds.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum InlayHintKind {
  /// An inlay hint that for a type annotation.
  Type(1),

  /// An inlay hint that is for a parameter.
  Parameter(2);

  const InlayHintKind(this.value);

  final int value;
}

/// The message type
@JsonEnum(valueField: 'value')
enum MessageType {
  /// An error message.
  Error(1),

  /// A warning message.
  Warning(2),

  /// An information message.
  Info(3),

  /// A log message.
  Log(4),

  /// A debug message.
  ///
  /// @since 3.18.0
  Debug(5);

  const MessageType(this.value);

  final int value;
}

/// Defines how the host (editor) should sync
/// document changes to the language server.
@JsonEnum(valueField: 'value')
enum TextDocumentSyncKind {
  /// Documents should not be synced at all.
  None(0),

  /// Documents are synced by always sending the full content
  /// of the document.
  Full(1),

  /// Documents are synced by sending the full content on open.
  /// After that only incremental updates to the document are
  /// send.
  Incremental(2);

  const TextDocumentSyncKind(this.value);

  final int value;
}

/// Represents reasons why a text document is saved.
@JsonEnum(valueField: 'value')
enum TextDocumentSaveReason {
  /// Manually triggered, e.g. by the user pressing save, by starting debugging,
  /// or by an API call.
  Manual(1),

  /// Automatic after a delay.
  AfterDelay(2),

  /// When the editor lost focus.
  FocusOut(3);

  const TextDocumentSaveReason(this.value);

  final int value;
}

/// The kind of a completion entry.
@JsonEnum(valueField: 'value')
enum CompletionItemKind {
  Text(1),
  Method(2),
  Function_(3),
  Constructor(4),
  Field(5),
  Variable(6),
  Class(7),
  Interface(8),
  Module(9),
  Property(10),
  Unit(11),
  Value(12),
  Enum(13),
  Keyword(14),
  Snippet(15),
  Color(16),
  File(17),
  Reference(18),
  Folder(19),
  EnumMember(20),
  Constant(21),
  Struct(22),
  Event(23),
  Operator(24),
  TypeParameter(25);

  const CompletionItemKind(this.value);

  final int value;
}

/// Completion item tags are extra annotations that tweak the rendering of a completion
/// item.
///
/// @since 3.15.0
@JsonEnum(valueField: 'value')
enum CompletionItemTag {
  /// Render a completion as obsolete, usually using a strike-out.
  Deprecated(1);

  const CompletionItemTag(this.value);

  final int value;
}

/// Defines whether the insert text in a completion item should be interpreted as
/// plain text or a snippet.
@JsonEnum(valueField: 'value')
enum InsertTextFormat {
  /// The primary text to be inserted is treated as a plain string.
  PlainText(1),

  /// The primary text to be inserted is treated as a snippet.
  ///
  /// A snippet can define tab stops and placeholders with `$1`, `$2`
  /// and `${3:foo}`. `$0` defines the final tab stop, it defaults to
  /// the end of the snippet. Placeholders with equal identifiers are linked,
  /// that is typing in one will update others too.
  ///
  /// See also: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
  Snippet(2);

  const InsertTextFormat(this.value);

  final int value;
}

/// How whitespace and indentation is handled during completion
/// item insertion.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum InsertTextMode {
  /// The insertion or replace strings is taken as it is. If the
  /// value is multi line the lines below the cursor will be
  /// inserted using the indentation defined in the string value.
  /// The client will not apply any kind of adjustments to the
  /// string.
  asIs(1),

  /// The editor adjusts leading whitespace of new lines so that
  /// they match the indentation up to the cursor of the line for
  /// which the item is accepted.
  ///
  /// Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
  /// multi line completion item is indented using 2 tabs and all
  /// following lines inserted will be indented using 2 tabs as well.
  adjustIndentation(2);

  const InsertTextMode(this.value);

  final int value;
}

/// A document highlight kind.
@JsonEnum(valueField: 'value')
enum DocumentHighlightKind {
  /// A textual occurrence.
  Text(1),

  /// Read-access of a symbol, like reading a variable.
  Read(2),

  /// Write-access of a symbol, like writing to a variable.
  Write(3);

  const DocumentHighlightKind(this.value);

  final int value;
}

/// A set of predefined code action kinds
final class CodeActionKind {
  const CodeActionKind(this.value);

  final String value;

  /// Empty kind.
  static const CodeActionKind Empty = CodeActionKind('');

  /// Base kind for quickfix actions: 'quickfix'
  static const CodeActionKind QuickFix = CodeActionKind('quickfix');

  /// Base kind for refactoring actions: 'refactor'
  static const CodeActionKind Refactor = CodeActionKind('refactor');

  /// Base kind for refactoring extraction actions: 'refactor.extract'
  ///
  /// Example extract actions:
  ///
  /// - Extract method
  /// - Extract function
  /// - Extract variable
  /// - Extract interface from class
  /// - ...
  static const CodeActionKind RefactorExtract = CodeActionKind(
    'refactor.extract',
  );

  /// Base kind for refactoring inline actions: 'refactor.inline'
  ///
  /// Example inline actions:
  ///
  /// - Inline function
  /// - Inline variable
  /// - Inline constant
  /// - ...
  static const CodeActionKind RefactorInline = CodeActionKind(
    'refactor.inline',
  );

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
  static const CodeActionKind RefactorRewrite = CodeActionKind(
    'refactor.rewrite',
  );

  /// Base kind for source actions: `source`
  ///
  /// Source code actions apply to the entire file.
  static const CodeActionKind Source = CodeActionKind('source');

  /// Base kind for an organize imports source action: `source.organizeImports`
  static const CodeActionKind SourceOrganizeImports = CodeActionKind(
    'source.organizeImports',
  );

  /// Base kind for auto-fix source actions: `source.fixAll`.
  ///
  /// Fix all actions automatically fix errors that have a clear fix that do not require user input.
  /// They should not suppress errors or perform unsafe fixes such as generating new types or classes.
  ///
  /// @since 3.15.0
  static const CodeActionKind SourceFixAll = CodeActionKind('source.fixAll');
}

@JsonEnum(valueField: 'value')
enum TraceValues {
  /// Turn tracing off.
  Off('off'),

  /// Trace messages only.
  Messages('messages'),

  /// Verbose message tracing.
  Verbose('verbose');

  const TraceValues(this.value);

  final String value;
}

/// Describes the content type that a client supports in various
/// result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
///
/// Please note that `MarkupKinds` must not start with a `$`. This kinds
/// are reserved for internal usage.
@JsonEnum(valueField: 'value')
enum MarkupKind {
  /// Plain text is supported as a content format
  PlainText('plaintext'),

  /// Markdown is supported as a content format
  Markdown('markdown');

  const MarkupKind(this.value);

  final String value;
}

/// Describes how an {@link InlineCompletionItemProvider inline completion provider} was triggered.
///
/// @since 3.18.0
/// @proposed
@JsonEnum(valueField: 'value')
enum InlineCompletionTriggerKind {
  /// Completion was triggered explicitly by a user gesture.
  Invoked(0),

  /// Completion was triggered automatically while editing.
  Automatic(1);

  const InlineCompletionTriggerKind(this.value);

  final int value;
}

/// A set of predefined position encoding kinds.
///
/// @since 3.17.0
final class PositionEncodingKind {
  const PositionEncodingKind(this.value);

  final String value;

  /// Character offsets count UTF-8 code units (e.g. bytes).
  static const PositionEncodingKind UTF8 = PositionEncodingKind('utf-8');

  /// Character offsets count UTF-16 code units.
  ///
  /// This is the default and must always be supported
  /// by servers
  static const PositionEncodingKind UTF16 = PositionEncodingKind('utf-16');

  /// Character offsets count UTF-32 code units.
  ///
  /// Implementation note: these are the same as Unicode codepoints,
  /// so this `PositionEncodingKind` may also be used for an
  /// encoding-agnostic representation of character offsets.
  static const PositionEncodingKind UTF32 = PositionEncodingKind('utf-32');
}

/// The file event type
@JsonEnum(valueField: 'value')
enum FileChangeType {
  /// The file got created.
  Created(1),

  /// The file got changed.
  Changed(2),

  /// The file got deleted.
  Deleted(3);

  const FileChangeType(this.value);

  final int value;
}

final class WatchKind {
  const WatchKind(this.value);

  final int value;

  /// Interested in create events.
  static const WatchKind Create = WatchKind(1);

  /// Interested in change events
  static const WatchKind Change = WatchKind(2);

  /// Interested in delete events
  static const WatchKind Delete = WatchKind(4);
}

/// The diagnostic's severity.
@JsonEnum(valueField: 'value')
enum DiagnosticSeverity {
  /// Reports an error.
  Error(1),

  /// Reports a warning.
  Warning(2),

  /// Reports an information.
  Information(3),

  /// Reports a hint.
  Hint(4);

  const DiagnosticSeverity(this.value);

  final int value;
}

/// The diagnostic tags.
///
/// @since 3.15.0
@JsonEnum(valueField: 'value')
enum DiagnosticTag {
  /// Unused or unnecessary code.
  ///
  /// Clients are allowed to render diagnostics with this tag faded out instead of having
  /// an error squiggle.
  Unnecessary(1),

  /// Deprecated or obsolete code.
  ///
  /// Clients are allowed to rendered diagnostics with this tag strike through.
  Deprecated(2);

  const DiagnosticTag(this.value);

  final int value;
}

/// How a completion was triggered
@JsonEnum(valueField: 'value')
enum CompletionTriggerKind {
  /// Completion was triggered by typing an identifier (24x7 code
  /// complete), manual invocation (e.g Ctrl+Space) or via API.
  Invoked(1),

  /// Completion was triggered by a trigger character specified by
  /// the `triggerCharacters` properties of the `CompletionRegistrationOptions`.
  TriggerCharacter(2),

  /// Completion was re-triggered as current completion list is incomplete
  TriggerForIncompleteCompletions(3);

  const CompletionTriggerKind(this.value);

  final int value;
}

/// How a signature help was triggered.
///
/// @since 3.15.0
@JsonEnum(valueField: 'value')
enum SignatureHelpTriggerKind {
  /// Signature help was invoked manually by the user or by a command.
  Invoked(1),

  /// Signature help was triggered by a trigger character.
  TriggerCharacter(2),

  /// Signature help was triggered by the cursor moving or by the document content changing.
  ContentChange(3);

  const SignatureHelpTriggerKind(this.value);

  final int value;
}

/// The reason why code actions were requested.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum CodeActionTriggerKind {
  /// Code actions were explicitly requested by the user or by an extension.
  Invoked(1),

  /// Code actions were requested automatically.
  ///
  /// This typically happens when current selection in a file changes, but can
  /// also be triggered when file content changes.
  Automatic(2);

  const CodeActionTriggerKind(this.value);

  final int value;
}

/// A pattern kind describing if a glob pattern matches a file a folder or
/// both.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value')
enum FileOperationPatternKind {
  /// The pattern matches a file only.
  file('file'),

  /// The pattern matches a folder only.
  folder('folder');

  const FileOperationPatternKind(this.value);

  final String value;
}

/// A notebook cell kind.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value')
enum NotebookCellKind {
  /// A markup-cell is formatted source that is used for display.
  Markup(1),

  /// A code-cell is source code.
  Code(2);

  const NotebookCellKind(this.value);

  final int value;
}

@JsonEnum(valueField: 'value')
enum ResourceOperationKind {
  /// Supports creating new files and folders.
  Create('create'),

  /// Supports renaming existing files and folders.
  Rename('rename'),

  /// Supports deleting existing files and folders.
  Delete('delete');

  const ResourceOperationKind(this.value);

  final String value;
}

@JsonEnum(valueField: 'value')
enum FailureHandlingKind {
  /// Applying the workspace change is simply aborted if one of the changes provided
  /// fails. All operations executed before the failing operation stay executed.
  Abort('abort'),

  /// All operations are executed transactional. That means they either all
  /// succeed or no changes at all are applied to the workspace.
  Transactional('transactional'),

  /// If the workspace edit contains only textual file changes they are executed transactional.
  /// If resource changes (create, rename or delete file) are part of the change the failure
  /// handling strategy is abort.
  TextOnlyTransactional('textOnlyTransactional'),

  /// The client tries to undo the operations already executed. But there is no
  /// guarantee that this is succeeding.
  Undo('undo');

  const FailureHandlingKind(this.value);

  final String value;
}

@JsonEnum(valueField: 'value')
enum PrepareSupportDefaultBehavior {
  /// The client's default behavior is to select the identifier
  /// according the to language's syntax rule.
  Identifier(1);

  const PrepareSupportDefaultBehavior(this.value);

  final int value;
}

@JsonEnum(valueField: 'value')
enum TokenFormat {
  Relative('relative');

  const TokenFormat(this.value);

  final String value;
}
