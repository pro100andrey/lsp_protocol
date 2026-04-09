// GENERATED — do not edit.

import 'package:json_annotation/json_annotation.dart';

part 'enumerations.g.dart';

/// A set of predefined token types. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum SemanticTokenTypes {
  namespace('namespace'),

  /// Represents a generic type. Acts as a fallback for types which can't be mapped to
  /// a specific type like class or enum.
  type_('type'),
  class_('class'),
  enum_('enum'),
  interface_('interface'),
  struct('struct'),
  typeParameter('typeParameter'),
  parameter('parameter'),
  variable('variable'),
  property('property'),
  enumMember('enumMember'),
  event('event'),
  function('function'),
  method('method'),
  macro('macro'),
  keyword('keyword'),
  modifier('modifier'),
  comment('comment'),
  string('string'),
  number('number'),
  regexp('regexp'),
  operator_('operator'),

  /// @since 3.17.0
  decorator('decorator');

  const SemanticTokenTypes(this.value);

  final String value;

  static SemanticTokenTypes? decode(String json) =>
      $enumDecodeNullable(_$SemanticTokenTypesEnumMap, json);
}

/// A set of predefined token modifiers. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum SemanticTokenModifiers {
  declaration('declaration'),
  definition('definition'),
  readonly('readonly'),
  static_('static'),
  deprecated('deprecated'),
  abstract_('abstract'),
  async_('async'),
  modification('modification'),
  documentation('documentation'),
  defaultLibrary('defaultLibrary');

  const SemanticTokenModifiers(this.value);

  final String value;

  static SemanticTokenModifiers? decode(String json) =>
      $enumDecodeNullable(_$SemanticTokenModifiersEnumMap, json);
}

/// The document diagnostic report kinds.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum DocumentDiagnosticReportKind {
  /// A diagnostic report with a full
  /// set of problems.
  Full('full'),

  /// A report indicating that the last
  /// returned report is still accurate.
  Unchanged('unchanged');

  const DocumentDiagnosticReportKind(this.value);

  final String value;

  static DocumentDiagnosticReportKind? decode(String json) =>
      $enumDecodeNullable(_$DocumentDiagnosticReportKindEnumMap, json);
}

/// Predefined error codes.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum ErrorCodes {
  ParseError(-32700),
  InvalidRequest(-32600),
  MethodNotFound(-32601),
  InvalidParams(-32602),
  InternalError(-32603),

  /// Error code indicating that a server received a notification or
  /// request before the server has received the `initialize` request.
  ServerNotInitialized(-32002),
  UnknownErrorCode(-32001);

  const ErrorCodes(this.value);

  final int value;

  static ErrorCodes? decode(int json) =>
      $enumDecodeNullable(_$ErrorCodesEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum LSPErrorCodes {
  /// A request failed but it was syntactically correct, e.g the
  /// method name was known and the parameters were valid. The error
  /// message should contain human readable information about why
  /// the request failed.
  ///
  /// @since 3.17.0
  RequestFailed(-32803),

  /// The server cancelled the request. This error code should
  /// only be used for requests that explicitly support being
  /// server cancellable.
  ///
  /// @since 3.17.0
  ServerCancelled(-32802),

  /// The server detected that the content of a document got
  /// modified outside normal conditions. A server should
  /// NOT send this error code if it detects a content change
  /// in it unprocessed messages. The result even computed
  /// on an older state might still be useful for the client.
  ///
  /// If a client decides that a result is not of any use anymore
  /// the client should cancel the request.
  ContentModified(-32801),

  /// The client has canceled a request and a server has detected
  /// the cancel.
  RequestCancelled(-32800);

  const LSPErrorCodes(this.value);

  final int value;

  static LSPErrorCodes? decode(int json) =>
      $enumDecodeNullable(_$LSPErrorCodesEnumMap, json);
}

/// A set of predefined range kinds.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum FoldingRangeKind {
  /// Folding range for a comment
  Comment('comment'),

  /// Folding range for an import or include
  Imports('imports'),

  /// Folding range for a region (e.g. `#region`)
  Region('region');

  const FoldingRangeKind(this.value);

  final String value;

  static FoldingRangeKind? decode(String json) =>
      $enumDecodeNullable(_$FoldingRangeKindEnumMap, json);
}

/// A symbol kind.
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static SymbolKind? decode(int json) =>
      $enumDecodeNullable(_$SymbolKindEnumMap, json);
}

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
///
/// @since 3.16
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum SymbolTag {
  /// Render a symbol as obsolete, usually using a strike-out.
  Deprecated(1);

  const SymbolTag(this.value);

  final int value;

  static SymbolTag? decode(int json) =>
      $enumDecodeNullable(_$SymbolTagEnumMap, json);
}

/// Moniker uniqueness level to define scope of the moniker.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static UniquenessLevel? decode(String json) =>
      $enumDecodeNullable(_$UniquenessLevelEnumMap, json);
}

/// The moniker kind.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static MonikerKind? decode(String json) =>
      $enumDecodeNullable(_$MonikerKindEnumMap, json);
}

/// Inlay hint kinds.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum InlayHintKind {
  /// An inlay hint that for a type annotation.
  Type(1),

  /// An inlay hint that is for a parameter.
  Parameter(2);

  const InlayHintKind(this.value);

  final int value;

  static InlayHintKind? decode(int json) =>
      $enumDecodeNullable(_$InlayHintKindEnumMap, json);
}

/// The message type
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static MessageType? decode(int json) =>
      $enumDecodeNullable(_$MessageTypeEnumMap, json);
}

/// Defines how the host (editor) should sync
/// document changes to the language server.
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static TextDocumentSyncKind? decode(int json) =>
      $enumDecodeNullable(_$TextDocumentSyncKindEnumMap, json);
}

/// Represents reasons why a text document is saved.
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static TextDocumentSaveReason? decode(int json) =>
      $enumDecodeNullable(_$TextDocumentSaveReasonEnumMap, json);
}

/// The kind of a completion entry.
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static CompletionItemKind? decode(int json) =>
      $enumDecodeNullable(_$CompletionItemKindEnumMap, json);
}

/// Completion item tags are extra annotations that tweak the rendering of a completion
/// item.
///
/// @since 3.15.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum CompletionItemTag {
  /// Render a completion as obsolete, usually using a strike-out.
  Deprecated(1);

  const CompletionItemTag(this.value);

  final int value;

  static CompletionItemTag? decode(int json) =>
      $enumDecodeNullable(_$CompletionItemTagEnumMap, json);
}

/// Defines whether the insert text in a completion item should be interpreted as
/// plain text or a snippet.
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static InsertTextFormat? decode(int json) =>
      $enumDecodeNullable(_$InsertTextFormatEnumMap, json);
}

/// How whitespace and indentation is handled during completion
/// item insertion.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static InsertTextMode? decode(int json) =>
      $enumDecodeNullable(_$InsertTextModeEnumMap, json);
}

/// A document highlight kind.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum DocumentHighlightKind {
  /// A textual occurrence.
  Text(1),

  /// Read-access of a symbol, like reading a variable.
  Read(2),

  /// Write-access of a symbol, like writing to a variable.
  Write(3);

  const DocumentHighlightKind(this.value);

  final int value;

  static DocumentHighlightKind? decode(int json) =>
      $enumDecodeNullable(_$DocumentHighlightKindEnumMap, json);
}

/// A set of predefined code action kinds
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum CodeActionKind {
  /// Empty kind.
  Empty(''),

  /// Base kind for quickfix actions: 'quickfix'
  QuickFix('quickfix'),

  /// Base kind for refactoring actions: 'refactor'
  Refactor('refactor'),

  /// Base kind for refactoring extraction actions: 'refactor.extract'
  ///
  /// Example extract actions:
  ///
  /// - Extract method
  /// - Extract function
  /// - Extract variable
  /// - Extract interface from class
  /// - ...
  RefactorExtract('refactor.extract'),

  /// Base kind for refactoring inline actions: 'refactor.inline'
  ///
  /// Example inline actions:
  ///
  /// - Inline function
  /// - Inline variable
  /// - Inline constant
  /// - ...
  RefactorInline('refactor.inline'),

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
  RefactorRewrite('refactor.rewrite'),

  /// Base kind for source actions: `source`
  ///
  /// Source code actions apply to the entire file.
  Source('source'),

  /// Base kind for an organize imports source action: `source.organizeImports`
  SourceOrganizeImports('source.organizeImports'),

  /// Base kind for auto-fix source actions: `source.fixAll`.
  ///
  /// Fix all actions automatically fix errors that have a clear fix that do not require user input.
  /// They should not suppress errors or perform unsafe fixes such as generating new types or classes.
  ///
  /// @since 3.15.0
  SourceFixAll('source.fixAll');

  const CodeActionKind(this.value);

  final String value;

  static CodeActionKind? decode(String json) =>
      $enumDecodeNullable(_$CodeActionKindEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum TraceValues {
  /// Turn tracing off.
  Off('off'),

  /// Trace messages only.
  Messages('messages'),

  /// Verbose message tracing.
  Verbose('verbose');

  const TraceValues(this.value);

  final String value;

  static TraceValues? decode(String json) =>
      $enumDecodeNullable(_$TraceValuesEnumMap, json);
}

/// Describes the content type that a client supports in various
/// result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
///
/// Please note that `MarkupKinds` must not start with a `$`. This kinds
/// are reserved for internal usage.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum MarkupKind {
  /// Plain text is supported as a content format
  PlainText('plaintext'),

  /// Markdown is supported as a content format
  Markdown('markdown');

  const MarkupKind(this.value);

  final String value;

  static MarkupKind? decode(String json) =>
      $enumDecodeNullable(_$MarkupKindEnumMap, json);
}

/// Describes how an {@link InlineCompletionItemProvider inline completion provider} was triggered.
///
/// @since 3.18.0
/// @proposed
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum InlineCompletionTriggerKind {
  /// Completion was triggered explicitly by a user gesture.
  Invoked(0),

  /// Completion was triggered automatically while editing.
  Automatic(1);

  const InlineCompletionTriggerKind(this.value);

  final int value;

  static InlineCompletionTriggerKind? decode(int json) =>
      $enumDecodeNullable(_$InlineCompletionTriggerKindEnumMap, json);
}

/// A set of predefined position encoding kinds.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum PositionEncodingKind {
  /// Character offsets count UTF-8 code units (e.g. bytes).
  UTF8('utf-8'),

  /// Character offsets count UTF-16 code units.
  ///
  /// This is the default and must always be supported
  /// by servers
  UTF16('utf-16'),

  /// Character offsets count UTF-32 code units.
  ///
  /// Implementation note: these are the same as Unicode codepoints,
  /// so this `PositionEncodingKind` may also be used for an
  /// encoding-agnostic representation of character offsets.
  UTF32('utf-32');

  const PositionEncodingKind(this.value);

  final String value;

  static PositionEncodingKind? decode(String json) =>
      $enumDecodeNullable(_$PositionEncodingKindEnumMap, json);
}

/// The file event type
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum FileChangeType {
  /// The file got created.
  Created(1),

  /// The file got changed.
  Changed(2),

  /// The file got deleted.
  Deleted(3);

  const FileChangeType(this.value);

  final int value;

  static FileChangeType? decode(int json) =>
      $enumDecodeNullable(_$FileChangeTypeEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum WatchKind {
  /// Interested in create events.
  Create(1),

  /// Interested in change events
  Change(2),

  /// Interested in delete events
  Delete(4);

  const WatchKind(this.value);

  final int value;

  static WatchKind? decode(int json) =>
      $enumDecodeNullable(_$WatchKindEnumMap, json);
}

/// The diagnostic's severity.
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static DiagnosticSeverity? decode(int json) =>
      $enumDecodeNullable(_$DiagnosticSeverityEnumMap, json);
}

/// The diagnostic tags.
///
/// @since 3.15.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static DiagnosticTag? decode(int json) =>
      $enumDecodeNullable(_$DiagnosticTagEnumMap, json);
}

/// How a completion was triggered
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static CompletionTriggerKind? decode(int json) =>
      $enumDecodeNullable(_$CompletionTriggerKindEnumMap, json);
}

/// How a signature help was triggered.
///
/// @since 3.15.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum SignatureHelpTriggerKind {
  /// Signature help was invoked manually by the user or by a command.
  Invoked(1),

  /// Signature help was triggered by a trigger character.
  TriggerCharacter(2),

  /// Signature help was triggered by the cursor moving or by the document content changing.
  ContentChange(3);

  const SignatureHelpTriggerKind(this.value);

  final int value;

  static SignatureHelpTriggerKind? decode(int json) =>
      $enumDecodeNullable(_$SignatureHelpTriggerKindEnumMap, json);
}

/// The reason why code actions were requested.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static CodeActionTriggerKind? decode(int json) =>
      $enumDecodeNullable(_$CodeActionTriggerKindEnumMap, json);
}

/// A pattern kind describing if a glob pattern matches a file a folder or
/// both.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum FileOperationPatternKind {
  /// The pattern matches a file only.
  file('file'),

  /// The pattern matches a folder only.
  folder('folder');

  const FileOperationPatternKind(this.value);

  final String value;

  static FileOperationPatternKind? decode(String json) =>
      $enumDecodeNullable(_$FileOperationPatternKindEnumMap, json);
}

/// A notebook cell kind.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum NotebookCellKind {
  /// A markup-cell is formatted source that is used for display.
  Markup(1),

  /// A code-cell is source code.
  Code(2);

  const NotebookCellKind(this.value);

  final int value;

  static NotebookCellKind? decode(int json) =>
      $enumDecodeNullable(_$NotebookCellKindEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum ResourceOperationKind {
  /// Supports creating new files and folders.
  Create('create'),

  /// Supports renaming existing files and folders.
  Rename('rename'),

  /// Supports deleting existing files and folders.
  Delete('delete');

  const ResourceOperationKind(this.value);

  final String value;

  static ResourceOperationKind? decode(String json) =>
      $enumDecodeNullable(_$ResourceOperationKindEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
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

  static FailureHandlingKind? decode(String json) =>
      $enumDecodeNullable(_$FailureHandlingKindEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum PrepareSupportDefaultBehavior {
  /// The client's default behavior is to select the identifier
  /// according the to language's syntax rule.
  Identifier(1);

  const PrepareSupportDefaultBehavior(this.value);

  final int value;

  static PrepareSupportDefaultBehavior? decode(int json) =>
      $enumDecodeNullable(_$PrepareSupportDefaultBehaviorEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum TokenFormat {
  Relative('relative');

  const TokenFormat(this.value);

  final String value;

  static TokenFormat? decode(String json) =>
      $enumDecodeNullable(_$TokenFormatEnumMap, json);
}
