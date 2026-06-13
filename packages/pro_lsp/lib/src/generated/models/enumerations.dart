// ignore_for_file: type=lint

// GENERATED — do not edit.

import 'package:json_annotation/json_annotation.dart';

part 'enumerations.g.dart';

/// A set of predefined token types. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
///
/// @since 3.16.0
extension type const SemanticTokenTypes(String value) {
  factory SemanticTokenTypes.fromJson(dynamic json) =>
      SemanticTokenTypes(json as String);

  static const namespace = SemanticTokenTypes('namespace');

  /// Represents a generic type. Acts as a fallback for types which can't be
  /// mapped to a specific type like class or enum.
  static const type = SemanticTokenTypes('type');

  static const class$ = SemanticTokenTypes('class');

  static const enum$ = SemanticTokenTypes('enum');

  static const interface$ = SemanticTokenTypes('interface');

  static const struct = SemanticTokenTypes('struct');

  static const typeParameter = SemanticTokenTypes('typeParameter');

  static const parameter = SemanticTokenTypes('parameter');

  static const variable = SemanticTokenTypes('variable');

  static const property = SemanticTokenTypes('property');

  static const enumMember = SemanticTokenTypes('enumMember');

  static const event = SemanticTokenTypes('event');

  static const function = SemanticTokenTypes('function');

  static const method = SemanticTokenTypes('method');

  static const macro$ = SemanticTokenTypes('macro');

  static const keyword = SemanticTokenTypes('keyword');

  static const modifier = SemanticTokenTypes('modifier');

  static const comment = SemanticTokenTypes('comment');

  static const string = SemanticTokenTypes('string');

  static const number = SemanticTokenTypes('number');

  static const regexp = SemanticTokenTypes('regexp');

  static const operator$ = SemanticTokenTypes('operator');

  /// @since 3.17.0
  static const decorator = SemanticTokenTypes('decorator');

  String toJson() => value;
}

/// A set of predefined token modifiers. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
///
/// @since 3.16.0
extension type const SemanticTokenModifiers(String value) {
  factory SemanticTokenModifiers.fromJson(dynamic json) =>
      SemanticTokenModifiers(json as String);

  static const declaration = SemanticTokenModifiers('declaration');

  static const definition = SemanticTokenModifiers('definition');

  static const readonly = SemanticTokenModifiers('readonly');

  static const static$ = SemanticTokenModifiers('static');

  static const deprecated = SemanticTokenModifiers('deprecated');

  static const abstract$ = SemanticTokenModifiers('abstract');

  static const async$ = SemanticTokenModifiers('async');

  static const modification = SemanticTokenModifiers('modification');

  static const documentation = SemanticTokenModifiers('documentation');

  static const defaultLibrary = SemanticTokenModifiers('defaultLibrary');

  String toJson() => value;
}

/// The document diagnostic report kinds.
///
/// @since 3.17.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum DocumentDiagnosticReportKind {
  /// A diagnostic report with a full set of problems.
  full('full'),

  /// A report indicating that the last returned report is still accurate.
  unchanged('unchanged');

  const DocumentDiagnosticReportKind(this.value);

  final String value;

  static DocumentDiagnosticReportKind? decode(String json) =>
      $enumDecodeNullable(_$DocumentDiagnosticReportKindEnumMap, json);
}

/// Predefined error codes.
extension type const ErrorCodes(int value) {
  factory ErrorCodes.fromJson(dynamic json) => ErrorCodes(json as int);

  static const parseError = ErrorCodes(-32700);

  static const invalidRequest = ErrorCodes(-32600);

  static const methodNotFound = ErrorCodes(-32601);

  static const invalidParams = ErrorCodes(-32602);

  static const internalError = ErrorCodes(-32603);

  /// Error code indicating that a server received a notification or request
  /// before the server has received the `initialize` request.
  static const serverNotInitialized = ErrorCodes(-32002);

  static const unknownErrorCode = ErrorCodes(-32001);

  int toJson() => value;
}
extension type const LSPErrorCodes(int value) {
  factory LSPErrorCodes.fromJson(dynamic json) => LSPErrorCodes(json as int);

  /// A request failed but it was syntactically correct, e.g the method name was
  /// known and the parameters were valid. The error message should contain
  /// human readable information about why the request failed.
  ///
  /// @since 3.17.0
  static const requestFailed = LSPErrorCodes(-32803);

  /// The server cancelled the request. This error code should only be used for
  /// requests that explicitly support being server cancellable.
  ///
  /// @since 3.17.0
  static const serverCancelled = LSPErrorCodes(-32802);

  /// The server detected that the content of a document got modified outside
  /// normal conditions. A server should NOT send this error code if it detects
  /// a content change in it unprocessed messages. The result even computed on
  /// an older state might still be useful for the client.
  ///
  /// If a client decides that a result is not of any use anymore the client
  /// should cancel the request.
  static const contentModified = LSPErrorCodes(-32801);

  /// The client has canceled a request and a server has detected the cancel.
  static const requestCancelled = LSPErrorCodes(-32800);

  int toJson() => value;
}

/// A set of predefined range kinds.
extension type const FoldingRangeKind(String value) {
  factory FoldingRangeKind.fromJson(dynamic json) =>
      FoldingRangeKind(json as String);

  /// Folding range for a comment
  static const comment = FoldingRangeKind('comment');

  /// Folding range for an import or include
  static const imports = FoldingRangeKind('imports');

  /// Folding range for a region (e.g. `#region`)
  static const region = FoldingRangeKind('region');

  String toJson() => value;
}

/// A symbol kind.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum SymbolKind {
  file(1),
  module(2),
  namespace(3),
  package(4),
  class$(5),
  method(6),
  property(7),
  field(8),
  constructor(9),
  enum$(10),
  interface$(11),
  function(12),
  variable(13),
  constant(14),
  string(15),
  number(16),
  boolean(17),
  array(18),
  object(19),
  key(20),
  null$(21),
  enumMember(22),
  struct(23),
  event(24),
  operator$(25),
  typeParameter(26);

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
  deprecated(1);

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
  import('import'),

  /// The moniker represents a symbol that is exported from a project
  export('export'),

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
  type(1),

  /// An inlay hint that is for a parameter.
  parameter(2);

  const InlayHintKind(this.value);

  final int value;

  static InlayHintKind? decode(int json) =>
      $enumDecodeNullable(_$InlayHintKindEnumMap, json);
}

/// The message type
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum MessageType {
  /// An error message.
  error(1),

  /// A warning message.
  warning(2),

  /// An information message.
  info(3),

  /// A log message.
  log(4),

  /// A debug message.
  ///
  /// @since 3.18.0
  debug(5);

  const MessageType(this.value);

  final int value;

  static MessageType? decode(int json) =>
      $enumDecodeNullable(_$MessageTypeEnumMap, json);
}

/// Defines how the host (editor) should sync document changes to the language
/// server.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum TextDocumentSyncKind {
  /// Documents should not be synced at all.
  none(0),

  /// Documents are synced by always sending the full content of the document.
  full(1),

  /// Documents are synced by sending the full content on open. After that only
  /// incremental updates to the document are send.
  incremental(2);

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
  manual(1),

  /// Automatic after a delay.
  afterDelay(2),

  /// When the editor lost focus.
  focusOut(3);

  const TextDocumentSaveReason(this.value);

  final int value;

  static TextDocumentSaveReason? decode(int json) =>
      $enumDecodeNullable(_$TextDocumentSaveReasonEnumMap, json);
}

/// The kind of a completion entry.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum CompletionItemKind {
  text(1),
  method(2),
  function(3),
  constructor(4),
  field(5),
  variable(6),
  class$(7),
  interface$(8),
  module(9),
  property(10),
  unit(11),
  value$(12),
  enum$(13),
  keyword(14),
  snippet(15),
  color(16),
  file(17),
  reference(18),
  folder(19),
  enumMember(20),
  constant(21),
  struct(22),
  event(23),
  operator$(24),
  typeParameter(25);

  const CompletionItemKind(this.value);

  final int value;

  static CompletionItemKind? decode(int json) =>
      $enumDecodeNullable(_$CompletionItemKindEnumMap, json);
}

/// Completion item tags are extra annotations that tweak the rendering of a
/// completion item.
///
/// @since 3.15.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum CompletionItemTag {
  /// Render a completion as obsolete, usually using a strike-out.
  deprecated(1);

  const CompletionItemTag(this.value);

  final int value;

  static CompletionItemTag? decode(int json) =>
      $enumDecodeNullable(_$CompletionItemTagEnumMap, json);
}

/// Defines whether the insert text in a completion item should be interpreted
/// as plain text or a snippet.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum InsertTextFormat {
  /// The primary text to be inserted is treated as a plain string.
  plainText(1),

  /// The primary text to be inserted is treated as a snippet.
  ///
  /// A snippet can define tab stops and placeholders with `$1`, `$2` and
  /// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
  /// snippet. Placeholders with equal identifiers are linked, that is typing in
  /// one will update others too.
  ///
  /// See also:
  /// https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
  snippet(2);

  const InsertTextFormat(this.value);

  final int value;

  static InsertTextFormat? decode(int json) =>
      $enumDecodeNullable(_$InsertTextFormatEnumMap, json);
}

/// How whitespace and indentation is handled during completion item insertion.
///
/// @since 3.16.0
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum InsertTextMode {
  /// The insertion or replace strings is taken as it is. If the value is multi
  /// line the lines below the cursor will be inserted using the indentation
  /// defined in the string value. The client will not apply any kind of
  /// adjustments to the string.
  asIs(1),

  /// The editor adjusts leading whitespace of new lines so that they match the
  /// indentation up to the cursor of the line for which the item is accepted.
  ///
  /// Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a multi
  /// line completion item is indented using 2 tabs and all following lines
  /// inserted will be indented using 2 tabs as well.
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
  text(1),

  /// Read-access of a symbol, like reading a variable.
  read(2),

  /// Write-access of a symbol, like writing to a variable.
  write(3);

  const DocumentHighlightKind(this.value);

  final int value;

  static DocumentHighlightKind? decode(int json) =>
      $enumDecodeNullable(_$DocumentHighlightKindEnumMap, json);
}

/// A set of predefined code action kinds
extension type const CodeActionKind(String value) {
  factory CodeActionKind.fromJson(dynamic json) =>
      CodeActionKind(json as String);

  /// Empty kind.
  static const empty = CodeActionKind('');

  /// Base kind for quickfix actions: 'quickfix'
  static const quickFix = CodeActionKind('quickfix');

  /// Base kind for refactoring actions: 'refactor'
  static const refactor = CodeActionKind('refactor');

  /// Base kind for refactoring extraction actions: 'refactor.extract'
  ///
  /// Example extract actions:
  ///
  /// - Extract method - Extract function - Extract variable - Extract interface
  /// from class - ...
  static const refactorExtract = CodeActionKind('refactor.extract');

  /// Base kind for refactoring inline actions: 'refactor.inline'
  ///
  /// Example inline actions:
  ///
  /// - Inline function - Inline variable - Inline constant - ...
  static const refactorInline = CodeActionKind('refactor.inline');

  /// Base kind for refactoring rewrite actions: 'refactor.rewrite'
  ///
  /// Example rewrite actions:
  ///
  /// - Convert JavaScript function to class - Add or remove parameter -
  /// Encapsulate field - Make method static - Move method to base class - ...
  static const refactorRewrite = CodeActionKind('refactor.rewrite');

  /// Base kind for source actions: `source`
  ///
  /// Source code actions apply to the entire file.
  static const source = CodeActionKind('source');

  /// Base kind for an organize imports source action: `source.organizeImports`
  static const sourceOrganizeImports = CodeActionKind('source.organizeImports');

  /// Base kind for auto-fix source actions: `source.fixAll`.
  ///
  /// Fix all actions automatically fix errors that have a clear fix that do not
  /// require user input. They should not suppress errors or perform unsafe
  /// fixes such as generating new types or classes.
  ///
  /// @since 3.15.0
  static const sourceFixAll = CodeActionKind('source.fixAll');

  String toJson() => value;
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum TraceValues {
  /// Turn tracing off.
  off('off'),

  /// Trace messages only.
  messages('messages'),

  /// Verbose message tracing.
  verbose('verbose');

  const TraceValues(this.value);

  final String value;

  static TraceValues? decode(String json) =>
      $enumDecodeNullable(_$TraceValuesEnumMap, json);
}

/// Describes the content type that a client supports in various result literals
/// like `Hover`, `ParameterInfo` or `CompletionItem`.
///
/// Please note that `MarkupKinds` must not start with a `$`. This kinds are
/// reserved for internal usage.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum MarkupKind {
  /// Plain text is supported as a content format
  plainText('plaintext'),

  /// Markdown is supported as a content format
  markdown('markdown');

  const MarkupKind(this.value);

  final String value;

  static MarkupKind? decode(String json) =>
      $enumDecodeNullable(_$MarkupKindEnumMap, json);
}

/// Describes how an `InlineCompletionItemProvider` was triggered.
///
/// @since 3.18.0
/// @proposed
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum InlineCompletionTriggerKind {
  /// Completion was triggered explicitly by a user gesture.
  invoked(0),

  /// Completion was triggered automatically while editing.
  automatic(1);

  const InlineCompletionTriggerKind(this.value);

  final int value;

  static InlineCompletionTriggerKind? decode(int json) =>
      $enumDecodeNullable(_$InlineCompletionTriggerKindEnumMap, json);
}

/// A set of predefined position encoding kinds.
///
/// @since 3.17.0
extension type const PositionEncodingKind(String value) {
  factory PositionEncodingKind.fromJson(dynamic json) =>
      PositionEncodingKind(json as String);

  /// Character offsets count UTF-8 code units (e.g. bytes).
  static const uTF8 = PositionEncodingKind('utf-8');

  /// Character offsets count UTF-16 code units.
  ///
  /// This is the default and must always be supported by servers
  static const uTF16 = PositionEncodingKind('utf-16');

  /// Character offsets count UTF-32 code units.
  ///
  /// Implementation note: these are the same as Unicode codepoints, so this
  /// `PositionEncodingKind` may also be used for an encoding-agnostic
  /// representation of character offsets.
  static const uTF32 = PositionEncodingKind('utf-32');

  String toJson() => value;
}

/// The file event type
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum FileChangeType {
  /// The file got created.
  created(1),

  /// The file got changed.
  changed(2),

  /// The file got deleted.
  deleted(3);

  const FileChangeType(this.value);

  final int value;

  static FileChangeType? decode(int json) =>
      $enumDecodeNullable(_$FileChangeTypeEnumMap, json);
}

extension type const WatchKind(int value) {
  factory WatchKind.fromJson(dynamic json) => WatchKind(json as int);

  /// Interested in create events.
  static const create = WatchKind(1);

  /// Interested in change events
  static const change = WatchKind(2);

  /// Interested in delete events
  static const delete = WatchKind(4);

  int toJson() => value;
}

/// The diagnostic's severity.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum DiagnosticSeverity {
  /// Reports an error.
  error(1),

  /// Reports a warning.
  warning(2),

  /// Reports an information.
  information(3),

  /// Reports a hint.
  hint(4);

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
  /// Clients are allowed to render diagnostics with this tag faded out instead
  /// of having an error squiggle.
  unnecessary(1),

  /// Deprecated or obsolete code.
  ///
  /// Clients are allowed to rendered diagnostics with this tag strike through.
  deprecated(2);

  const DiagnosticTag(this.value);

  final int value;

  static DiagnosticTag? decode(int json) =>
      $enumDecodeNullable(_$DiagnosticTagEnumMap, json);
}

/// How a completion was triggered
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum CompletionTriggerKind {
  /// Completion was triggered by typing an identifier (24x7 code complete),
  /// manual invocation (e.g Ctrl+Space) or via API.
  invoked(1),

  /// Completion was triggered by a trigger character specified by the
  /// `triggerCharacters` properties of the `CompletionRegistrationOptions`.
  triggerCharacter(2),

  /// Completion was re-triggered as current completion list is incomplete
  triggerForIncompleteCompletions(3);

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
  invoked(1),

  /// Signature help was triggered by a trigger character.
  triggerCharacter(2),

  /// Signature help was triggered by the cursor moving or by the document
  /// content changing.
  contentChange(3);

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
  invoked(1),

  /// Code actions were requested automatically.
  ///
  /// This typically happens when current selection in a file changes, but can
  /// also be triggered when file content changes.
  automatic(2);

  const CodeActionTriggerKind(this.value);

  final int value;

  static CodeActionTriggerKind? decode(int json) =>
      $enumDecodeNullable(_$CodeActionTriggerKindEnumMap, json);
}

/// A pattern kind describing if a glob pattern matches a file a folder or both.
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
  markup(1),

  /// A code-cell is source code.
  code(2);

  const NotebookCellKind(this.value);

  final int value;

  static NotebookCellKind? decode(int json) =>
      $enumDecodeNullable(_$NotebookCellKindEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum ResourceOperationKind {
  /// Supports creating new files and folders.
  create('create'),

  /// Supports renaming existing files and folders.
  rename('rename'),

  /// Supports deleting existing files and folders.
  delete('delete');

  const ResourceOperationKind(this.value);

  final String value;

  static ResourceOperationKind? decode(String json) =>
      $enumDecodeNullable(_$ResourceOperationKindEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum FailureHandlingKind {
  /// Applying the workspace change is simply aborted if one of the changes
  /// provided fails. All operations executed before the failing operation stay
  /// executed.
  abort('abort'),

  /// All operations are executed transactional. That means they either all
  /// succeed or no changes at all are applied to the workspace.
  transactional('transactional'),

  /// If the workspace edit contains only textual file changes they are executed
  /// transactional. If resource changes (create, rename or delete file) are
  /// part of the change the failure handling strategy is abort.
  textOnlyTransactional('textOnlyTransactional'),

  /// The client tries to undo the operations already executed. But there is no
  /// guarantee that this is succeeding.
  undo('undo');

  const FailureHandlingKind(this.value);

  final String value;

  static FailureHandlingKind? decode(String json) =>
      $enumDecodeNullable(_$FailureHandlingKindEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum PrepareSupportDefaultBehavior {
  /// The client's default behavior is to select the identifier according the to
  /// language's syntax rule.
  identifier(1);

  const PrepareSupportDefaultBehavior(this.value);

  final int value;

  static PrepareSupportDefaultBehavior? decode(int json) =>
      $enumDecodeNullable(_$PrepareSupportDefaultBehaviorEnumMap, json);
}

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum TokenFormat {
  relative('relative');

  const TokenFormat(this.value);

  final String value;

  static TokenFormat? decode(String json) =>
      $enumDecodeNullable(_$TokenFormatEnumMap, json);
}
