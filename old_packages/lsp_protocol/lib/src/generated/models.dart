//  GENERATED CODE – DO NOT MODIFY BY HAND
//  LSP Version: 3.17.0
//  ignore_for_file: lines_longer_than_80_chars, always_put_required_named_parameters_first, prefer_expression_function_bodies, unnecessary_lambdas, cast_nullable_to_non_nullable, prefer_const_constructors, unnecessary_cast, doc_directive_unknown, unintended_html_in_doc_comment, avoid_unused_constructor_parameters

/// The definition of a symbol represented as one or many {@link Location
/// locations}. For most programming languages there is only one location at
/// which a symbol is defined.
/// Servers should prefer returning `DefinitionLink` over `Definition` if
/// supported by the client.
typedef Definition = Object?;

/// Information about where a symbol is defined.
/// Provides additional metadata over normal {@link Location location}
/// definitions, including the range of the defining symbol
typedef DefinitionLink = LocationLink;

/// LSP arrays. @since 3.17.0
typedef LSPArray = List<LSPAny>;

/// The LSP any type. Please note that strictly speaking a property with the
/// value `undefined` can't be converted into JSON preserving the property
/// name. However for convenience it is allowed and assumed that all these
/// properties are optional as well. @since 3.17.0
typedef LSPAny = Object?;

/// The declaration of a symbol representation as one or many {@link Location
/// locations}.
typedef Declaration = Object?;

/// Information about where a symbol is declared.
/// Provides additional metadata over normal {@link Location location}
/// declarations, including the range of the declaring symbol.
/// Servers should prefer returning `DeclarationLink` over `Declaration` if
/// supported by the client.
typedef DeclarationLink = LocationLink;

/// Inline value information can be provided by different means: - directly as
/// a text value (class InlineValueText). - as a name to use for a variable
/// lookup (class InlineValueVariableLookup) - as an evaluatable expression
/// (class InlineValueEvaluatableExpression) The InlineValue types combines all
/// inline value types into one type.
/// @since 3.17.0
typedef InlineValue = Object?;

/// The result of a document diagnostic pull request. A report can either be a
/// full report containing all diagnostics for the requested document or an
/// unchanged report indicating that nothing has changed in terms of
/// diagnostics in comparison to the last pull request.
/// @since 3.17.0
typedef DocumentDiagnosticReport = Object?;
typedef PrepareRenameResult = Object?;

/// A document selector is the combination of one or many document filters.
/// @sample `let sel:DocumentSelector = [{ language: 'typescript' }, {
/// language: 'json', pattern: '**∕tsconfig.json' }]`;
/// The use of a string as a document filter is deprecated @since 3.16.0.
typedef DocumentSelector = List<DocumentFilter>;
typedef ProgressToken = Object?;

/// An identifier to refer to a change annotation stored with a workspace edit.
typedef ChangeAnnotationIdentifier = String;

/// A workspace diagnostic document report.
/// @since 3.17.0
typedef WorkspaceDocumentDiagnosticReport = Object?;

/// An event describing a change to a text document. If only a text is provided
/// it is considered to be the full content of the document.
typedef TextDocumentContentChangeEvent = Object?;

/// MarkedString can be used to render human readable text. It is either a
/// markdown string or a code-block that provides a language and a code
/// snippet. The language identifier is semantically equal to the optional
/// language identifier in fenced code blocks in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
/// The pair of a language and a value is an equivalent to markdown:
/// ```${language} ${value} ```
/// Note that markdown strings will be sanitized - that means html will be
/// escaped. @deprecated use MarkupContent instead.
typedef MarkedString = Object?;

/// A document filter describes a top level text document or a notebook cell
/// document.
/// @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
typedef DocumentFilter = Object?;

/// LSP object definition. @since 3.17.0
typedef LSPObject = Map<String, LSPAny>;

/// The glob pattern. Either a string pattern or a relative pattern.
/// @since 3.17.0
typedef GlobPattern = Object?;

/// A document filter denotes a document by different properties like the
/// {@link TextDocument.languageId language}, the {@link Uri.scheme scheme} of
/// its resource, or a glob-pattern that is applied to the {@link
/// TextDocument.fileName path}.
/// Glob patterns can have the following syntax: - `*` to match zero or more
/// characters in a path segment - `?` to match on one character in a path
/// segment - `**` to match any number of path segments, including none - `{}`
/// to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches
/// all TypeScript and JavaScript files) - `[]` to declare a range of
/// characters to match in a path segment (e.g., `example.[0-9]` to match on
/// `example.0`, `example.1`, …) - `[!...]` to negate a range of characters to
/// match in a path segment (e.g., `example.[!0-9]` to match on `example.a`,
/// `example.b`, but not `example.0`)
/// @sample A language filter that applies to typescript files on disk: `{
/// language: 'typescript', scheme: 'file' }` @sample A language filter that
/// applies to all package.json paths: `{ language: 'json', pattern:
/// '**package.json' }`
/// @since 3.17.0
typedef TextDocumentFilter = Object?;

/// A notebook document filter denotes a notebook document by different
/// properties. The properties will be match against the notebook's URI (same
/// as with documents)
/// @since 3.17.0
typedef NotebookDocumentFilter = Object?;

/// The glob pattern to watch relative to the base path. Glob patterns can have
/// the following syntax: - `*` to match zero or more characters in a path
/// segment - `?` to match on one character in a path segment - `**` to match
/// any number of path segments, including none - `{}` to group conditions
/// (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files) - `[]`
/// to declare a range of characters to match in a path segment (e.g.,
/// `example.[0-9]` to match on `example.0`, `example.1`, …) - `[!...]` to
/// negate a range of characters to match in a path segment (e.g.,
/// `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
/// @since 3.17.0
typedef Pattern = String;

/// A set of predefined token types. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
enum SemanticTokenTypes {
  namespace('namespace'),

  /// Represents a generic type. Acts as a fallback for types which can't be
  /// mapped to a specific type like class or enum.
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
  macro_('macro'),
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

  static SemanticTokenTypes fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// A set of predefined token modifiers. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
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

  static SemanticTokenModifiers fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// The document diagnostic report kinds.
/// @since 3.17.0
enum DocumentDiagnosticReportKind {
  /// A diagnostic report with a full set of problems.
  full('full'),

  /// A report indicating that the last returned report is still accurate.
  unchanged('unchanged');

  const DocumentDiagnosticReportKind(this.value);

  final String value;

  static DocumentDiagnosticReportKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// Predefined error codes.
enum ErrorCodes {
  parseError(-32700),
  invalidRequest(-32600),
  methodNotFound(-32601),
  invalidParams(-32602),
  internalError(-32603),

  /// Error code indicating that a server received a notification or request
  /// before the server has received the `initialize` request.
  serverNotInitialized(-32002),
  unknownErrorCode(-32001);

  const ErrorCodes(this.value);

  final int value;

  static ErrorCodes fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

enum LSPErrorCodes {
  /// A request failed but it was syntactically correct, e.g the method name was
  /// known and the parameters were valid. The error message should contain human
  /// readable information about why the request failed.
  /// @since 3.17.0
  requestFailed(-32803),

  /// The server cancelled the request. This error code should only be used for
  /// requests that explicitly support being server cancellable.
  /// @since 3.17.0
  serverCancelled(-32802),

  /// The server detected that the content of a document got modified outside
  /// normal conditions. A server should NOT send this error code if it detects a
  /// content change in it unprocessed messages. The result even computed on an
  /// older state might still be useful for the client.
  /// If a client decides that a result is not of any use anymore the client
  /// should cancel the request.
  contentModified(-32801),

  /// The client has canceled a request and a server has detected the cancel.
  requestCancelled(-32800);

  const LSPErrorCodes(this.value);

  final int value;

  static LSPErrorCodes fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// A set of predefined range kinds.
enum FoldingRangeKind {
  /// Folding range for a comment
  comment('comment'),

  /// Folding range for an import or include
  imports('imports'),

  /// Folding range for a region (e.g. `#region`)
  region('region');

  const FoldingRangeKind(this.value);

  final String value;

  static FoldingRangeKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// A symbol kind.
enum SymbolKind {
  file(1),
  module(2),
  namespace(3),
  package(4),
  class_(5),
  method(6),
  property(7),
  field(8),
  constructor(9),
  enum_(10),
  interface_(11),
  function(12),
  variable(13),
  constant(14),
  string(15),
  number(16),
  boolean(17),
  array(18),
  object(19),
  key(20),
  null_(21),
  enumMember(22),
  struct(23),
  event(24),
  operator_(25),
  typeParameter(26);

  const SymbolKind(this.value);

  final int value;

  static SymbolKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
/// @since 3.16
enum SymbolTag {
  /// Render a symbol as obsolete, usually using a strike-out.
  deprecated(1);

  const SymbolTag(this.value);

  final int value;

  static SymbolTag fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// Moniker uniqueness level to define scope of the moniker.
/// @since 3.16.0
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

  static UniquenessLevel fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// The moniker kind.
/// @since 3.16.0
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

  static MonikerKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// Inlay hint kinds.
/// @since 3.17.0
enum InlayHintKind {
  /// An inlay hint that for a type annotation.
  type_(1),

  /// An inlay hint that is for a parameter.
  parameter(2);

  const InlayHintKind(this.value);

  final int value;

  static InlayHintKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// The message type
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
  /// @since 3.18.0
  debug(5);

  const MessageType(this.value);

  final int value;

  static MessageType fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// Defines how the host (editor) should sync document changes to the language
/// server.
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

  static TextDocumentSyncKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// Represents reasons why a text document is saved.
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

  static TextDocumentSaveReason fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// The kind of a completion entry.
enum CompletionItemKind {
  text(1),
  method(2),
  function(3),
  constructor(4),
  field(5),
  variable(6),
  class_(7),
  interface_(8),
  module(9),
  property(10),
  unit(11),
  value_(12),
  enum_(13),
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
  operator_(24),
  typeParameter(25);

  const CompletionItemKind(this.value);

  final int value;

  static CompletionItemKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// Completion item tags are extra annotations that tweak the rendering of a
/// completion item.
/// @since 3.15.0
enum CompletionItemTag {
  /// Render a completion as obsolete, usually using a strike-out.
  deprecated(1);

  const CompletionItemTag(this.value);

  final int value;

  static CompletionItemTag fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// Defines whether the insert text in a completion item should be interpreted
/// as plain text or a snippet.
enum InsertTextFormat {
  /// The primary text to be inserted is treated as a plain string.
  plainText(1),

  /// The primary text to be inserted is treated as a snippet.
  /// A snippet can define tab stops and placeholders with `$1`, `$2` and
  /// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
  /// snippet. Placeholders with equal identifiers are linked, that is typing in
  /// one will update others too.
  /// See also:
  /// https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
  snippet(2);

  const InsertTextFormat(this.value);

  final int value;

  static InsertTextFormat fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// How whitespace and indentation is handled during completion item insertion.
/// @since 3.16.0
enum InsertTextMode {
  /// The insertion or replace strings is taken as it is. If the value is multi
  /// line the lines below the cursor will be inserted using the indentation
  /// defined in the string value. The client will not apply any kind of
  /// adjustments to the string.
  asIs(1),

  /// The editor adjusts leading whitespace of new lines so that they match the
  /// indentation up to the cursor of the line for which the item is accepted.
  /// Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a multi
  /// line completion item is indented using 2 tabs and all following lines
  /// inserted will be indented using 2 tabs as well.
  adjustIndentation(2);

  const InsertTextMode(this.value);

  final int value;

  static InsertTextMode fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// A document highlight kind.
enum DocumentHighlightKind {
  /// A textual occurrence.
  text(1),

  /// Read-access of a symbol, like reading a variable.
  read(2),

  /// Write-access of a symbol, like writing to a variable.
  write(3);

  const DocumentHighlightKind(this.value);

  final int value;

  static DocumentHighlightKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// A set of predefined code action kinds
enum CodeActionKind {
  /// Empty kind.
  empty(''),

  /// Base kind for quickfix actions: 'quickfix'
  quickFix('quickfix'),

  /// Base kind for refactoring actions: 'refactor'
  refactor('refactor'),

  /// Base kind for refactoring extraction actions: 'refactor.extract'
  /// Example extract actions:
  /// - Extract method - Extract function - Extract variable - Extract interface
  /// from class - ...
  refactorExtract('refactor.extract'),

  /// Base kind for refactoring inline actions: 'refactor.inline'
  /// Example inline actions:
  /// - Inline function - Inline variable - Inline constant - ...
  refactorInline('refactor.inline'),

  /// Base kind for refactoring rewrite actions: 'refactor.rewrite'
  /// Example rewrite actions:
  /// - Convert JavaScript function to class - Add or remove parameter -
  /// Encapsulate field - Make method static - Move method to base class - ...
  refactorRewrite('refactor.rewrite'),

  /// Base kind for source actions: `source`
  /// Source code actions apply to the entire file.
  source('source'),

  /// Base kind for an organize imports source action: `source.organizeImports`
  sourceOrganizeImports('source.organizeImports'),

  /// Base kind for auto-fix source actions: `source.fixAll`.
  /// Fix all actions automatically fix errors that have a clear fix that do not
  /// require user input. They should not suppress errors or perform unsafe fixes
  /// such as generating new types or classes.
  /// @since 3.15.0
  sourceFixAll('source.fixAll');

  const CodeActionKind(this.value);

  final String value;

  static CodeActionKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

enum TraceValues {
  /// Turn tracing off.
  off('off'),

  /// Trace messages only.
  messages('messages'),

  /// Verbose message tracing.
  verbose('verbose');

  const TraceValues(this.value);

  final String value;

  static TraceValues fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// Describes the content type that a client supports in various result
/// literals like `Hover`, `ParameterInfo` or `CompletionItem`.
/// Please note that `MarkupKinds` must not start with a `$`. This kinds are
/// reserved for internal usage.
enum MarkupKind {
  /// Plain text is supported as a content format
  plainText('plaintext'),

  /// Markdown is supported as a content format
  markdown('markdown');

  const MarkupKind(this.value);

  final String value;

  static MarkupKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// Describes how an {@link InlineCompletionItemProvider inline completion
/// provider} was triggered.
/// @since 3.18.0 @proposed
enum InlineCompletionTriggerKind {
  /// Completion was triggered explicitly by a user gesture.
  invoked(0),

  /// Completion was triggered automatically while editing.
  automatic(1);

  const InlineCompletionTriggerKind(this.value);

  final int value;

  static InlineCompletionTriggerKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// A set of predefined position encoding kinds.
/// @since 3.17.0
enum PositionEncodingKind {
  /// Character offsets count UTF-8 code units (e.g. bytes).
  uTF8('utf-8'),

  /// Character offsets count UTF-16 code units.
  /// This is the default and must always be supported by servers
  uTF16('utf-16'),

  /// Character offsets count UTF-32 code units.
  /// Implementation note: these are the same as Unicode codepoints, so this
  /// `PositionEncodingKind` may also be used for an encoding-agnostic
  /// representation of character offsets.
  uTF32('utf-32');

  const PositionEncodingKind(this.value);

  final String value;

  static PositionEncodingKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// The file event type
enum FileChangeType {
  /// The file got created.
  created(1),

  /// The file got changed.
  changed(2),

  /// The file got deleted.
  deleted(3);

  const FileChangeType(this.value);

  final int value;

  static FileChangeType fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

enum WatchKind {
  /// Interested in create events.
  create(1),

  /// Interested in change events
  change(2),

  /// Interested in delete events
  delete(4);

  const WatchKind(this.value);

  final int value;

  static WatchKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// The diagnostic's severity.
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

  static DiagnosticSeverity fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// The diagnostic tags.
/// @since 3.15.0
enum DiagnosticTag {
  /// Unused or unnecessary code.
  /// Clients are allowed to render diagnostics with this tag faded out instead
  /// of having an error squiggle.
  unnecessary(1),

  /// Deprecated or obsolete code.
  /// Clients are allowed to rendered diagnostics with this tag strike through.
  deprecated(2);

  const DiagnosticTag(this.value);

  final int value;

  static DiagnosticTag fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// How a completion was triggered
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

  static CompletionTriggerKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// How a signature help was triggered.
/// @since 3.15.0
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

  static SignatureHelpTriggerKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// The reason why code actions were requested.
/// @since 3.17.0
enum CodeActionTriggerKind {
  /// Code actions were explicitly requested by the user or by an extension.
  invoked(1),

  /// Code actions were requested automatically.
  /// This typically happens when current selection in a file changes, but can
  /// also be triggered when file content changes.
  automatic(2);

  const CodeActionTriggerKind(this.value);

  final int value;

  static CodeActionTriggerKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

/// A pattern kind describing if a glob pattern matches a file a folder or both.
/// @since 3.16.0
enum FileOperationPatternKind {
  /// The pattern matches a file only.
  file('file'),

  /// The pattern matches a folder only.
  folder('folder');

  const FileOperationPatternKind(this.value);

  final String value;

  static FileOperationPatternKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

/// A notebook cell kind.
/// @since 3.17.0
enum NotebookCellKind {
  /// A markup-cell is formatted source that is used for display.
  markup(1),

  /// A code-cell is source code.
  code(2);

  const NotebookCellKind(this.value);

  final int value;

  static NotebookCellKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

enum ResourceOperationKind {
  /// Supports creating new files and folders.
  create('create'),

  /// Supports renaming existing files and folders.
  rename('rename'),

  /// Supports deleting existing files and folders.
  delete('delete');

  const ResourceOperationKind(this.value);

  final String value;

  static ResourceOperationKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

enum FailureHandlingKind {
  /// Applying the workspace change is simply aborted if one of the changes
  /// provided fails. All operations executed before the failing operation stay
  /// executed.
  abort('abort'),

  /// All operations are executed transactional. That means they either all
  /// succeed or no changes at all are applied to the workspace.
  transactional('transactional'),

  /// If the workspace edit contains only textual file changes they are executed
  /// transactional. If resource changes (create, rename or delete file) are part
  /// of the change the failure handling strategy is abort.
  textOnlyTransactional('textOnlyTransactional'),

  /// The client tries to undo the operations already executed. But there is no
  /// guarantee that this is succeeding.
  undo('undo');

  const FailureHandlingKind(this.value);

  final String value;

  static FailureHandlingKind fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

enum PrepareSupportDefaultBehavior {
  /// The client's default behavior is to select the identifier according the to
  /// language's syntax rule.
  identifier(1);

  const PrepareSupportDefaultBehavior(this.value);

  final int value;

  static PrepareSupportDefaultBehavior fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as int);
  }

  int toJson() => value;
}

enum TokenFormat {
  relative('relative');

  const TokenFormat(this.value);

  final String value;

  static TokenFormat fromJson(Object? json) {
    return values.firstWhere((e) => e.value == json as String);
  }

  String toJson() => value;
}

final class ImplementationParams {
  const ImplementationParams({
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory ImplementationParams.fromJson(Map<String, dynamic> json) {
    return ImplementationParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents a location inside a resource, such as a line inside a text file.
final class Location {
  const Location({required this.range, required this.uri});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      uri: json['uri'] as String,
    );
  }

  final Range range;

  final String uri;

  Map<String, dynamic> toJson() {
    return {'range': range.toJson(), 'uri': uri};
  }
}

final class ImplementationRegistrationOptions {
  const ImplementationRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory ImplementationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return ImplementationRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

final class TypeDefinitionParams {
  const TypeDefinitionParams({
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory TypeDefinitionParams.fromJson(Map<String, dynamic> json) {
    return TypeDefinitionParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

final class TypeDefinitionRegistrationOptions {
  const TypeDefinitionRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return TypeDefinitionRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// A workspace folder inside a client.
final class WorkspaceFolder {
  const WorkspaceFolder({required this.name, required this.uri});

  factory WorkspaceFolder.fromJson(Map<String, dynamic> json) {
    return WorkspaceFolder(
      name: json['name'] as String,
      uri: json['uri'] as String,
    );
  }

  /// The name of the workspace folder. Used to refer to this workspace folder in
  /// the user interface.
  final String name;

  /// The associated URI for this workspace folder.
  final String uri;

  Map<String, dynamic> toJson() {
    return {'name': name, 'uri': uri};
  }
}

/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
final class DidChangeWorkspaceFoldersParams {
  const DidChangeWorkspaceFoldersParams({required this.event});

  factory DidChangeWorkspaceFoldersParams.fromJson(Map<String, dynamic> json) {
    return DidChangeWorkspaceFoldersParams(
      event: WorkspaceFoldersChangeEvent.fromJson(
        json['event'] as Map<String, dynamic>,
      ),
    );
  }

  /// The actual workspace folder change event.
  final WorkspaceFoldersChangeEvent event;

  Map<String, dynamic> toJson() {
    return {'event': event.toJson()};
  }
}

/// The parameters of a configuration request.
final class ConfigurationParams {
  const ConfigurationParams({required this.items});

  factory ConfigurationParams.fromJson(Map<String, dynamic> json) {
    return ConfigurationParams(
      items: (json['items'] as List)
          .map((e) => ConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<ConfigurationItem> items;

  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }
}

/// Parameters for a {@link DocumentColorRequest}.
final class DocumentColorParams {
  const DocumentColorParams({
    this.partialResultToken,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentColorParams.fromJson(Map<String, dynamic> json) {
    return DocumentColorParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents a color range from a document.
final class ColorInformation {
  const ColorInformation({required this.color, required this.range});

  factory ColorInformation.fromJson(Map<String, dynamic> json) {
    return ColorInformation(
      color: Color.fromJson(json['color'] as Map<String, dynamic>),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// The actual color value for this color range.
  final Color color;

  /// The range in the document where this color appears.
  final Range range;

  Map<String, dynamic> toJson() {
    return {'color': color.toJson(), 'range': range.toJson()};
  }
}

final class DocumentColorRegistrationOptions {
  const DocumentColorRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory DocumentColorRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return DocumentColorRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link ColorPresentationRequest}.
final class ColorPresentationParams {
  const ColorPresentationParams({
    required this.color,
    this.partialResultToken,
    required this.range,
    required this.textDocument,
    this.workDoneToken,
  });

  factory ColorPresentationParams.fromJson(Map<String, dynamic> json) {
    return ColorPresentationParams(
      color: Color.fromJson(json['color'] as Map<String, dynamic>),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The color to request presentations for.
  final Color color;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The range where the color would be inserted. Serves as a context.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'color': color.toJson(),
      'partialResultToken': partialResultToken,
      'range': range.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

final class ColorPresentation {
  const ColorPresentation({
    this.additionalTextEdits,
    required this.label,
    this.textEdit,
  });

  factory ColorPresentation.fromJson(Map<String, dynamic> json) {
    return ColorPresentation(
      additionalTextEdits: json['additionalTextEdits'] == null
          ? null
          : (json['additionalTextEdits'] as List)
                .map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
                .toList(),
      label: json['label'] as String,
      textEdit: json['textEdit'] == null
          ? null
          : TextEdit.fromJson(json['textEdit'] as Map<String, dynamic>),
    );
  }

  /// An optional array of additional {@link TextEdit text edits} that are
  /// applied when selecting this color presentation. Edits must not overlap with
  /// the main {@link ColorPresentation.textEdit edit} nor with themselves.
  final List<TextEdit>? additionalTextEdits;

  /// The label of this color presentation. It will be shown on the color picker
  /// header. By default this is also the text that is inserted when selecting
  /// this color presentation.
  final String label;

  /// An {@link TextEdit edit} which is applied to a document when selecting this
  /// presentation for the color. When `falsy` the {@link ColorPresentation.label
  /// label} is used.
  final TextEdit? textEdit;

  Map<String, dynamic> toJson() {
    return {
      'additionalTextEdits': additionalTextEdits
          ?.map((e) => e.toJson())
          .toList(),
      'label': label,
      'textEdit': textEdit?.toJson(),
    };
  }
}

final class WorkDoneProgressOptions {
  const WorkDoneProgressOptions({this.workDoneProgress});

  factory WorkDoneProgressOptions.fromJson(Map<String, dynamic> json) {
    return WorkDoneProgressOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// General text document registration options.
final class TextDocumentRegistrationOptions {
  const TextDocumentRegistrationOptions({required this.documentSelector});

  factory TextDocumentRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return TextDocumentRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  Map<String, dynamic> toJson() {
    return {'documentSelector': documentSelector};
  }
}

/// Parameters for a {@link FoldingRangeRequest}.
final class FoldingRangeParams {
  const FoldingRangeParams({
    this.partialResultToken,
    required this.textDocument,
    this.workDoneToken,
  });

  factory FoldingRangeParams.fromJson(Map<String, dynamic> json) {
    return FoldingRangeParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents a folding range. To be valid, start and end line must be bigger
/// than zero and smaller than the number of lines in the document. Clients are
/// free to ignore invalid ranges.
final class FoldingRange {
  const FoldingRange({
    this.collapsedText,
    this.endCharacter,
    required this.endLine,
    this.kind,
    this.startCharacter,
    required this.startLine,
  });

  factory FoldingRange.fromJson(Map<String, dynamic> json) {
    return FoldingRange(
      collapsedText: json['collapsedText'] as String?,
      endCharacter: json['endCharacter'] as int?,
      endLine: json['endLine'] as int,
      kind: json['kind'] == null
          ? null
          : FoldingRangeKind.fromJson(json['kind']),
      startCharacter: json['startCharacter'] as int?,
      startLine: json['startLine'] as int,
    );
  }

  /// The text that the client should show when the specified range is collapsed.
  /// If not defined or not supported by the client, a default will be chosen by
  /// the client.
  /// @since 3.17.0
  final String? collapsedText;

  /// The zero-based character offset before the folded range ends. If not
  /// defined, defaults to the length of the end line.
  final int? endCharacter;

  /// The zero-based end line of the range to fold. The folded area ends with the
  /// line's last character. To be valid, the end must be zero or larger and
  /// smaller than the number of lines in the document.
  final int endLine;

  /// Describes the kind of the folding range such as `comment' or 'region'. The
  /// kind is used to categorize folding ranges and used by commands like 'Fold
  /// all comments'. See {@link FoldingRangeKind} for an enumeration of
  /// standardized kinds.
  final FoldingRangeKind? kind;

  /// The zero-based character offset from where the folded range starts. If not
  /// defined, defaults to the length of the start line.
  final int? startCharacter;

  /// The zero-based start line of the range to fold. The folded area starts
  /// after the line's last character. To be valid, the end must be zero or
  /// larger and smaller than the number of lines in the document.
  final int startLine;

  Map<String, dynamic> toJson() {
    return {
      'collapsedText': collapsedText,
      'endCharacter': endCharacter,
      'endLine': endLine,
      'kind': kind?.toJson(),
      'startCharacter': startCharacter,
      'startLine': startLine,
    };
  }
}

final class FoldingRangeRegistrationOptions {
  const FoldingRangeRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory FoldingRangeRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return FoldingRangeRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

final class DeclarationParams {
  const DeclarationParams({
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DeclarationParams.fromJson(Map<String, dynamic> json) {
    return DeclarationParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

final class DeclarationRegistrationOptions {
  const DeclarationRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory DeclarationRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return DeclarationRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// A parameter literal used in selection range requests.
final class SelectionRangeParams {
  const SelectionRangeParams({
    this.partialResultToken,
    required this.positions,
    required this.textDocument,
    this.workDoneToken,
  });

  factory SelectionRangeParams.fromJson(Map<String, dynamic> json) {
    return SelectionRangeParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      positions: (json['positions'] as List)
          .map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList(),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The positions inside the text document.
  final List<Position> positions;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'positions': positions.map((e) => e.toJson()).toList(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// A selection range represents a part of a selection hierarchy. A selection
/// range may have a parent selection range that contains it.
final class SelectionRange {
  const SelectionRange({this.parent, required this.range});

  factory SelectionRange.fromJson(Map<String, dynamic> json) {
    return SelectionRange(
      parent: json['parent'] == null
          ? null
          : SelectionRange.fromJson(json['parent'] as Map<String, dynamic>),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// The parent selection range containing this range. Therefore `parent.range`
  /// must contain `this.range`.
  final SelectionRange? parent;

  /// The {@link Range range} of this selection range.
  final Range range;

  Map<String, dynamic> toJson() {
    return {'parent': parent?.toJson(), 'range': range.toJson()};
  }
}

final class SelectionRangeRegistrationOptions {
  const SelectionRangeRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory SelectionRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return SelectionRangeRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

final class WorkDoneProgressCreateParams {
  const WorkDoneProgressCreateParams({required this.token});

  factory WorkDoneProgressCreateParams.fromJson(Map<String, dynamic> json) {
    return WorkDoneProgressCreateParams(token: json['token'] as ProgressToken);
  }

  /// The token to be used to report progress.
  final ProgressToken token;

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}

final class WorkDoneProgressCancelParams {
  const WorkDoneProgressCancelParams({required this.token});

  factory WorkDoneProgressCancelParams.fromJson(Map<String, dynamic> json) {
    return WorkDoneProgressCancelParams(token: json['token'] as ProgressToken);
  }

  /// The token to be used to report progress.
  final ProgressToken token;

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}

/// The parameter of a `textDocument/prepareCallHierarchy` request.
/// @since 3.16.0
final class CallHierarchyPrepareParams {
  const CallHierarchyPrepareParams({
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory CallHierarchyPrepareParams.fromJson(Map<String, dynamic> json) {
    return CallHierarchyPrepareParams(
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents programming constructs like functions or constructors in the
/// context of call hierarchy.
/// @since 3.16.0
final class CallHierarchyItem {
  const CallHierarchyItem({
    this.data,
    this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    this.tags,
    required this.uri,
  });

  factory CallHierarchyItem.fromJson(Map<String, dynamic> json) {
    return CallHierarchyItem(
      data: json['data'] as LSPAny?,
      detail: json['detail'] as String?,
      kind: SymbolKind.fromJson(json['kind']),
      name: json['name'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      selectionRange: Range.fromJson(
        json['selectionRange'] as Map<String, dynamic>,
      ),
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List).map((e) => SymbolTag.fromJson(e)).toList(),
      uri: json['uri'] as String,
    );
  }

  /// A data entry field that is preserved between a call hierarchy prepare and
  /// incoming calls or outgoing calls requests.
  final LSPAny? data;

  /// More detail for this item, e.g. the signature of a function.
  final String? detail;

  /// The kind of this item.
  final SymbolKind kind;

  /// The name of this item.
  final String name;

  /// The range enclosing this symbol not including leading/trailing whitespace
  /// but everything else, e.g. comments and code.
  final Range range;

  /// The range that should be selected and revealed when this symbol is being
  /// picked, e.g. the name of a function. Must be contained by the {@link
  /// CallHierarchyItem.range `range`}.
  final Range selectionRange;

  /// Tags for this item.
  final List<SymbolTag>? tags;

  /// The resource identifier of this item.
  final String uri;

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'detail': detail,
      'kind': kind.toJson(),
      'name': name,
      'range': range.toJson(),
      'selectionRange': selectionRange.toJson(),
      'tags': tags?.map((e) => e.toJson()).toList(),
      'uri': uri,
    };
  }
}

/// Call hierarchy options used during static or dynamic registration.
/// @since 3.16.0
final class CallHierarchyRegistrationOptions {
  const CallHierarchyRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory CallHierarchyRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return CallHierarchyRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameter of a `callHierarchy/incomingCalls` request.
/// @since 3.16.0
final class CallHierarchyIncomingCallsParams {
  const CallHierarchyIncomingCallsParams({
    required this.item,
    this.partialResultToken,
    this.workDoneToken,
  });

  factory CallHierarchyIncomingCallsParams.fromJson(Map<String, dynamic> json) {
    return CallHierarchyIncomingCallsParams(
      item: CallHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  final CallHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'partialResultToken': partialResultToken,
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents an incoming call, e.g. a caller of a method or constructor.
/// @since 3.16.0
final class CallHierarchyIncomingCall {
  const CallHierarchyIncomingCall({
    required this.from,
    required this.fromRanges,
  });

  factory CallHierarchyIncomingCall.fromJson(Map<String, dynamic> json) {
    return CallHierarchyIncomingCall(
      from: CallHierarchyItem.fromJson(json['from'] as Map<String, dynamic>),
      fromRanges: (json['fromRanges'] as List)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The item that makes the call.
  final CallHierarchyItem from;

  /// The ranges at which the calls appear. This is relative to the caller
  /// denoted by {@link CallHierarchyIncomingCall.from `this.from`}.
  final List<Range> fromRanges;

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      'fromRanges': fromRanges.map((e) => e.toJson()).toList(),
    };
  }
}

/// The parameter of a `callHierarchy/outgoingCalls` request.
/// @since 3.16.0
final class CallHierarchyOutgoingCallsParams {
  const CallHierarchyOutgoingCallsParams({
    required this.item,
    this.partialResultToken,
    this.workDoneToken,
  });

  factory CallHierarchyOutgoingCallsParams.fromJson(Map<String, dynamic> json) {
    return CallHierarchyOutgoingCallsParams(
      item: CallHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  final CallHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'partialResultToken': partialResultToken,
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents an outgoing call, e.g. calling a getter from a method or a
/// method from a constructor etc.
/// @since 3.16.0
final class CallHierarchyOutgoingCall {
  const CallHierarchyOutgoingCall({required this.fromRanges, required this.to});

  factory CallHierarchyOutgoingCall.fromJson(Map<String, dynamic> json) {
    return CallHierarchyOutgoingCall(
      fromRanges: (json['fromRanges'] as List)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      to: CallHierarchyItem.fromJson(json['to'] as Map<String, dynamic>),
    );
  }

  /// The range at which this item is called. This is the range relative to the
  /// caller, e.g the item passed to {@link
  /// CallHierarchyItemProvider.provideCallHierarchyOutgoingCalls
  /// `provideCallHierarchyOutgoingCalls`} and not {@link
  /// CallHierarchyOutgoingCall.to `this.to`}.
  final List<Range> fromRanges;

  /// The item that is called.
  final CallHierarchyItem to;

  Map<String, dynamic> toJson() {
    return {
      'fromRanges': fromRanges.map((e) => e.toJson()).toList(),
      'to': to.toJson(),
    };
  }
}

/// @since 3.16.0
final class SemanticTokensParams {
  const SemanticTokensParams({
    this.partialResultToken,
    required this.textDocument,
    this.workDoneToken,
  });

  factory SemanticTokensParams.fromJson(Map<String, dynamic> json) {
    return SemanticTokensParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// @since 3.16.0
final class SemanticTokens {
  const SemanticTokens({required this.data, this.resultId});

  factory SemanticTokens.fromJson(Map<String, dynamic> json) {
    return SemanticTokens(
      data: (json['data'] as List).map((e) => e as int).toList(),
      resultId: json['resultId'] as String?,
    );
  }

  /// The actual tokens.
  final List<int> data;

  /// An optional result id. If provided and clients support delta updating the
  /// client will include the result id in the next semantic token request. A
  /// server can then instead of computing all semantic tokens again simply send
  /// a delta.
  final String? resultId;

  Map<String, dynamic> toJson() {
    return {'data': data, 'resultId': resultId};
  }
}

/// @since 3.16.0
final class SemanticTokensPartialResult {
  const SemanticTokensPartialResult({required this.data});

  factory SemanticTokensPartialResult.fromJson(Map<String, dynamic> json) {
    return SemanticTokensPartialResult(
      data: (json['data'] as List).map((e) => e as int).toList(),
    );
  }

  final List<int> data;

  Map<String, dynamic> toJson() {
    return {'data': data};
  }
}

/// @since 3.16.0
final class SemanticTokensRegistrationOptions {
  const SemanticTokensRegistrationOptions({
    required this.documentSelector,
    this.full,
    this.id,
    required this.legend,
    this.range,
    this.workDoneProgress,
  });

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return SemanticTokensRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      full: json['full'],
      id: json['id'] as String?,
      legend: SemanticTokensLegend.fromJson(
        json['legend'] as Map<String, dynamic>,
      ),
      range: json['range'],
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// Server supports providing semantic tokens for a full document.
  final Object? full;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  /// The legend used by the server
  final SemanticTokensLegend legend;

  /// Server supports providing semantic tokens for a specific range of a
  /// document.
  final Object? range;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'full': full,
      'id': id,
      'legend': legend.toJson(),
      'range': range,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensDeltaParams {
  const SemanticTokensDeltaParams({
    this.partialResultToken,
    required this.previousResultId,
    required this.textDocument,
    this.workDoneToken,
  });

  factory SemanticTokensDeltaParams.fromJson(Map<String, dynamic> json) {
    return SemanticTokensDeltaParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      previousResultId: json['previousResultId'] as String,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The result id of a previous response. The result Id can either point to a
  /// full response or a delta response depending on what was received last.
  final String previousResultId;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'previousResultId': previousResultId,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensDelta {
  const SemanticTokensDelta({required this.edits, this.resultId});

  factory SemanticTokensDelta.fromJson(Map<String, dynamic> json) {
    return SemanticTokensDelta(
      edits: (json['edits'] as List)
          .map((e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultId: json['resultId'] as String?,
    );
  }

  /// The semantic token edits to transform a previous result into a new result.
  final List<SemanticTokensEdit> edits;

  final String? resultId;

  Map<String, dynamic> toJson() {
    return {
      'edits': edits.map((e) => e.toJson()).toList(),
      'resultId': resultId,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensDeltaPartialResult {
  const SemanticTokensDeltaPartialResult({required this.edits});

  factory SemanticTokensDeltaPartialResult.fromJson(Map<String, dynamic> json) {
    return SemanticTokensDeltaPartialResult(
      edits: (json['edits'] as List)
          .map((e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<SemanticTokensEdit> edits;

  Map<String, dynamic> toJson() {
    return {'edits': edits.map((e) => e.toJson()).toList()};
  }
}

/// @since 3.16.0
final class SemanticTokensRangeParams {
  const SemanticTokensRangeParams({
    this.partialResultToken,
    required this.range,
    required this.textDocument,
    this.workDoneToken,
  });

  factory SemanticTokensRangeParams.fromJson(Map<String, dynamic> json) {
    return SemanticTokensRangeParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The range the semantic tokens are requested for.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'range': range.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Params to show a resource in the UI.
/// @since 3.16.0
final class ShowDocumentParams {
  const ShowDocumentParams({
    this.external,
    this.selection,
    this.takeFocus,
    required this.uri,
  });

  factory ShowDocumentParams.fromJson(Map<String, dynamic> json) {
    return ShowDocumentParams(
      external: json['external'] as bool?,
      selection: json['selection'] == null
          ? null
          : Range.fromJson(json['selection'] as Map<String, dynamic>),
      takeFocus: json['takeFocus'] as bool?,
      uri: json['uri'] as String,
    );
  }

  /// Indicates to show the resource in an external program. To show, for
  /// example, `https://code.visualstudio.com/` in the default WEB browser set
  /// `external` to `true`.
  final bool? external;

  /// An optional selection range if the document is a text document. Clients
  /// might ignore the property if an external program is started or the file is
  /// not a text file.
  final Range? selection;

  /// An optional property to indicate whether the editor showing the document
  /// should take focus or not. Clients might ignore this property if an external
  /// program is started.
  final bool? takeFocus;

  /// The uri to show.
  final String uri;

  Map<String, dynamic> toJson() {
    return {
      'external': external,
      'selection': selection?.toJson(),
      'takeFocus': takeFocus,
      'uri': uri,
    };
  }
}

/// The result of a showDocument request.
/// @since 3.16.0
final class ShowDocumentResult {
  const ShowDocumentResult({required this.success});

  factory ShowDocumentResult.fromJson(Map<String, dynamic> json) {
    return ShowDocumentResult(success: json['success'] as bool);
  }

  /// A boolean indicating if the show was successful.
  final bool success;

  Map<String, dynamic> toJson() {
    return {'success': success};
  }
}

final class LinkedEditingRangeParams {
  const LinkedEditingRangeParams({
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory LinkedEditingRangeParams.fromJson(Map<String, dynamic> json) {
    return LinkedEditingRangeParams(
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// The result of a linked editing range request.
/// @since 3.16.0
final class LinkedEditingRanges {
  const LinkedEditingRanges({required this.ranges, this.wordPattern});

  factory LinkedEditingRanges.fromJson(Map<String, dynamic> json) {
    return LinkedEditingRanges(
      ranges: (json['ranges'] as List)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      wordPattern: json['wordPattern'] as String?,
    );
  }

  /// A list of ranges that can be edited together. The ranges must have
  /// identical length and contain identical text content. The ranges cannot
  /// overlap.
  final List<Range> ranges;

  /// An optional word pattern (regular expression) that describes valid contents
  /// for the given ranges. If no pattern is provided, the client configuration's
  /// word pattern will be used.
  final String? wordPattern;

  Map<String, dynamic> toJson() {
    return {
      'ranges': ranges.map((e) => e.toJson()).toList(),
      'wordPattern': wordPattern,
    };
  }
}

final class LinkedEditingRangeRegistrationOptions {
  const LinkedEditingRangeRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory LinkedEditingRangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return LinkedEditingRangeRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters sent in notifications/requests for user-initiated creation
/// of files.
/// @since 3.16.0
final class CreateFilesParams {
  const CreateFilesParams({required this.files});

  factory CreateFilesParams.fromJson(Map<String, dynamic> json) {
    return CreateFilesParams(
      files: (json['files'] as List)
          .map((e) => FileCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// An array of all files/folders created in this operation.
  final List<FileCreate> files;

  Map<String, dynamic> toJson() {
    return {'files': files.map((e) => e.toJson()).toList()};
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
final class WorkspaceEdit {
  const WorkspaceEdit({
    this.changeAnnotations,
    this.changes,
    this.documentChanges,
  });

  factory WorkspaceEdit.fromJson(Map<String, dynamic> json) {
    return WorkspaceEdit(
      changeAnnotations: json['changeAnnotations'] == null
          ? null
          : (json['changeAnnotations'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(
                k as ChangeAnnotationIdentifier,
                ChangeAnnotation.fromJson(v as Map<String, dynamic>),
              ),
            ),
      changes: json['changes'] == null
          ? null
          : (json['changes'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(
                k as String,
                (v as List)
                    .map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
                    .toList(),
              ),
            ),
      documentChanges: json['documentChanges'] == null
          ? null
          : (json['documentChanges'] as List).cast<Object?>(),
    );
  }

  /// A map of change annotations that can be referenced in `AnnotatedTextEdit`s
  /// or create, rename and delete file / folder operations.
  /// Whether clients honor this property depends on the client capability
  /// `workspace.changeAnnotationSupport`.
  /// @since 3.16.0
  final Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations;

  /// Holds changes to existing resources.
  final Map<String, List<TextEdit>>? changes;

  /// Depending on the client capability
  /// `workspace.workspaceEdit.resourceOperations` document changes are either an
  /// array of `TextDocumentEdit`s to express changes to n different text
  /// documents where each text document edit addresses a specific version of a
  /// text document. Or it can contain above `TextDocumentEdit`s mixed with
  /// create, rename and delete file / folder operations.
  /// Whether a client supports versioned document edits is expressed via
  /// `workspace.workspaceEdit.documentChanges` client capability.
  /// If a client neither supports `documentChanges` nor
  /// `workspace.workspaceEdit.resourceOperations` then only plain `TextEdit`s
  /// using the `changes` property are supported.
  final List<Object?>? documentChanges;

  Map<String, dynamic> toJson() {
    return {
      'changeAnnotations': changeAnnotations?.map(
        (k, v) => MapEntry(k, v.toJson()),
      ),
      'changes': changes?.map(
        (k, v) => MapEntry(k, v.map((e) => e.toJson()).toList()),
      ),
      'documentChanges': documentChanges,
    };
  }
}

/// The options to register for file operations.
/// @since 3.16.0
final class FileOperationRegistrationOptions {
  const FileOperationRegistrationOptions({required this.filters});

  factory FileOperationRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return FileOperationRegistrationOptions(
      filters: (json['filters'] as List)
          .map((e) => FileOperationFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The actual filters.
  final List<FileOperationFilter> filters;

  Map<String, dynamic> toJson() {
    return {'filters': filters.map((e) => e.toJson()).toList()};
  }
}

/// The parameters sent in notifications/requests for user-initiated renames of
/// files.
/// @since 3.16.0
final class RenameFilesParams {
  const RenameFilesParams({required this.files});

  factory RenameFilesParams.fromJson(Map<String, dynamic> json) {
    return RenameFilesParams(
      files: (json['files'] as List)
          .map((e) => FileRename.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// An array of all files/folders renamed in this operation. When a folder is
  /// renamed, only the folder will be included, and not its children.
  final List<FileRename> files;

  Map<String, dynamic> toJson() {
    return {'files': files.map((e) => e.toJson()).toList()};
  }
}

/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
/// @since 3.16.0
final class DeleteFilesParams {
  const DeleteFilesParams({required this.files});

  factory DeleteFilesParams.fromJson(Map<String, dynamic> json) {
    return DeleteFilesParams(
      files: (json['files'] as List)
          .map((e) => FileDelete.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// An array of all files/folders deleted in this operation.
  final List<FileDelete> files;

  Map<String, dynamic> toJson() {
    return {'files': files.map((e) => e.toJson()).toList()};
  }
}

final class MonikerParams {
  const MonikerParams({
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory MonikerParams.fromJson(Map<String, dynamic> json) {
    return MonikerParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Moniker definition to match LSIF 0.5 moniker definition.
/// @since 3.16.0
final class Moniker {
  const Moniker({
    required this.identifier,
    this.kind,
    required this.scheme,
    required this.unique,
  });

  factory Moniker.fromJson(Map<String, dynamic> json) {
    return Moniker(
      identifier: json['identifier'] as String,
      kind: json['kind'] == null ? null : MonikerKind.fromJson(json['kind']),
      scheme: json['scheme'] as String,
      unique: UniquenessLevel.fromJson(json['unique']),
    );
  }

  /// The identifier of the moniker. The value is opaque in LSIF however schema
  /// owners are allowed to define the structure if they want.
  final String identifier;

  /// The moniker kind if known.
  final MonikerKind? kind;

  /// The scheme of the moniker. For example tsc or .Net
  final String scheme;

  /// The scope in which the moniker is unique
  final UniquenessLevel unique;

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'kind': kind?.toJson(),
      'scheme': scheme,
      'unique': unique.toJson(),
    };
  }
}

final class MonikerRegistrationOptions {
  const MonikerRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory MonikerRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return MonikerRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameter of a `textDocument/prepareTypeHierarchy` request.
/// @since 3.17.0
final class TypeHierarchyPrepareParams {
  const TypeHierarchyPrepareParams({
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory TypeHierarchyPrepareParams.fromJson(Map<String, dynamic> json) {
    return TypeHierarchyPrepareParams(
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// @since 3.17.0
final class TypeHierarchyItem {
  const TypeHierarchyItem({
    this.data,
    this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    this.tags,
    required this.uri,
  });

  factory TypeHierarchyItem.fromJson(Map<String, dynamic> json) {
    return TypeHierarchyItem(
      data: json['data'] as LSPAny?,
      detail: json['detail'] as String?,
      kind: SymbolKind.fromJson(json['kind']),
      name: json['name'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      selectionRange: Range.fromJson(
        json['selectionRange'] as Map<String, dynamic>,
      ),
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List).map((e) => SymbolTag.fromJson(e)).toList(),
      uri: json['uri'] as String,
    );
  }

  /// A data entry field that is preserved between a type hierarchy prepare and
  /// supertypes or subtypes requests. It could also be used to identify the type
  /// hierarchy in the server, helping improve the performance on resolving
  /// supertypes and subtypes.
  final LSPAny? data;

  /// More detail for this item, e.g. the signature of a function.
  final String? detail;

  /// The kind of this item.
  final SymbolKind kind;

  /// The name of this item.
  final String name;

  /// The range enclosing this symbol not including leading/trailing whitespace
  /// but everything else, e.g. comments and code.
  final Range range;

  /// The range that should be selected and revealed when this symbol is being
  /// picked, e.g. the name of a function. Must be contained by the {@link
  /// TypeHierarchyItem.range `range`}.
  final Range selectionRange;

  /// Tags for this item.
  final List<SymbolTag>? tags;

  /// The resource identifier of this item.
  final String uri;

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'detail': detail,
      'kind': kind.toJson(),
      'name': name,
      'range': range.toJson(),
      'selectionRange': selectionRange.toJson(),
      'tags': tags?.map((e) => e.toJson()).toList(),
      'uri': uri,
    };
  }
}

/// Type hierarchy options used during static or dynamic registration.
/// @since 3.17.0
final class TypeHierarchyRegistrationOptions {
  const TypeHierarchyRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory TypeHierarchyRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return TypeHierarchyRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameter of a `typeHierarchy/supertypes` request.
/// @since 3.17.0
final class TypeHierarchySupertypesParams {
  const TypeHierarchySupertypesParams({
    required this.item,
    this.partialResultToken,
    this.workDoneToken,
  });

  factory TypeHierarchySupertypesParams.fromJson(Map<String, dynamic> json) {
    return TypeHierarchySupertypesParams(
      item: TypeHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  final TypeHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'partialResultToken': partialResultToken,
      'workDoneToken': workDoneToken,
    };
  }
}

/// The parameter of a `typeHierarchy/subtypes` request.
/// @since 3.17.0
final class TypeHierarchySubtypesParams {
  const TypeHierarchySubtypesParams({
    required this.item,
    this.partialResultToken,
    this.workDoneToken,
  });

  factory TypeHierarchySubtypesParams.fromJson(Map<String, dynamic> json) {
    return TypeHierarchySubtypesParams(
      item: TypeHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  final TypeHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'partialResultToken': partialResultToken,
      'workDoneToken': workDoneToken,
    };
  }
}

/// A parameter literal used in inline value requests.
/// @since 3.17.0
final class InlineValueParams {
  const InlineValueParams({
    required this.context,
    required this.range,
    required this.textDocument,
    this.workDoneToken,
  });

  factory InlineValueParams.fromJson(Map<String, dynamic> json) {
    return InlineValueParams(
      context: InlineValueContext.fromJson(
        json['context'] as Map<String, dynamic>,
      ),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// Additional information about the context in which inline values were
  /// requested.
  final InlineValueContext context;

  /// The document range for which inline values should be computed.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'context': context.toJson(),
      'range': range.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Inline value options used during static or dynamic registration.
/// @since 3.17.0
final class InlineValueRegistrationOptions {
  const InlineValueRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory InlineValueRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return InlineValueRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// A parameter literal used in inlay hint requests.
/// @since 3.17.0
final class InlayHintParams {
  const InlayHintParams({
    required this.range,
    required this.textDocument,
    this.workDoneToken,
  });

  factory InlayHintParams.fromJson(Map<String, dynamic> json) {
    return InlayHintParams(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The document range for which inlay hints should be computed.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'range': range.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Inlay hint information.
/// @since 3.17.0
final class InlayHint {
  const InlayHint({
    this.data,
    this.kind,
    required this.label,
    this.paddingLeft,
    this.paddingRight,
    required this.position,
    this.textEdits,
    this.tooltip,
  });

  factory InlayHint.fromJson(Map<String, dynamic> json) {
    return InlayHint(
      data: json['data'] as LSPAny?,
      kind: json['kind'] == null ? null : InlayHintKind.fromJson(json['kind']),
      label: json['label'],
      paddingLeft: json['paddingLeft'] as bool?,
      paddingRight: json['paddingRight'] as bool?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textEdits: json['textEdits'] == null
          ? null
          : (json['textEdits'] as List)
                .map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
                .toList(),
      tooltip: json['tooltip'],
    );
  }

  /// A data entry field that is preserved on an inlay hint between a
  /// `textDocument/inlayHint` and a `inlayHint/resolve` request.
  final LSPAny? data;

  /// The kind of this hint. Can be omitted in which case the client should fall
  /// back to a reasonable default.
  final InlayHintKind? kind;

  /// The label of this hint. A human readable string or an array of
  /// InlayHintLabelPart label parts.
  /// *Note* that neither the string nor the label part can be empty.
  final Object? label;

  /// Render padding before the hint.
  /// Note: Padding should use the editor's background color, not the background
  /// color of the hint itself. That means padding can be used to visually
  /// align/separate an inlay hint.
  final bool? paddingLeft;

  /// Render padding after the hint.
  /// Note: Padding should use the editor's background color, not the background
  /// color of the hint itself. That means padding can be used to visually
  /// align/separate an inlay hint.
  final bool? paddingRight;

  /// The position of this hint.
  /// If multiple hints have the same position, they will be shown in the order
  /// they appear in the response.
  final Position position;

  /// Optional text edits that are performed when accepting this inlay hint.
  /// *Note* that edits are expected to change the document so that the inlay
  /// hint (or its nearest variant) is now part of the document and the inlay
  /// hint itself is now obsolete.
  final List<TextEdit>? textEdits;

  /// The tooltip text when you hover over this item.
  final Object? tooltip;

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'kind': kind?.toJson(),
      'label': label,
      'paddingLeft': paddingLeft,
      'paddingRight': paddingRight,
      'position': position.toJson(),
      'textEdits': textEdits?.map((e) => e.toJson()).toList(),
      'tooltip': tooltip,
    };
  }
}

/// Inlay hint options used during static or dynamic registration.
/// @since 3.17.0
final class InlayHintRegistrationOptions {
  const InlayHintRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.resolveProvider,
    this.workDoneProgress,
  });

  factory InlayHintRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return InlayHintRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  /// The server provides support to resolve additional information for an inlay
  /// hint item.
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters of the document diagnostic request.
/// @since 3.17.0
final class DocumentDiagnosticParams {
  const DocumentDiagnosticParams({
    this.identifier,
    this.partialResultToken,
    this.previousResultId,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentDiagnosticParams.fromJson(Map<String, dynamic> json) {
    return DocumentDiagnosticParams(
      identifier: json['identifier'] as String?,
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      previousResultId: json['previousResultId'] as String?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The additional identifier  provided during registration.
  final String? identifier;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The result id of a previous response if provided.
  final String? previousResultId;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'partialResultToken': partialResultToken,
      'previousResultId': previousResultId,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// A partial result for a document diagnostic report.
/// @since 3.17.0
final class DocumentDiagnosticReportPartialResult {
  const DocumentDiagnosticReportPartialResult({required this.relatedDocuments});

  factory DocumentDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentDiagnosticReportPartialResult(
      relatedDocuments: (json['relatedDocuments'] as Map)
          .cast<String, Object?>(),
    );
  }

  final Map<String, Object?> relatedDocuments;

  Map<String, dynamic> toJson() {
    return {'relatedDocuments': relatedDocuments};
  }
}

/// Cancellation data returned from a diagnostic request.
/// @since 3.17.0
final class DiagnosticServerCancellationData {
  const DiagnosticServerCancellationData({required this.retriggerRequest});

  factory DiagnosticServerCancellationData.fromJson(Map<String, dynamic> json) {
    return DiagnosticServerCancellationData(
      retriggerRequest: json['retriggerRequest'] as bool,
    );
  }

  final bool retriggerRequest;

  Map<String, dynamic> toJson() {
    return {'retriggerRequest': retriggerRequest};
  }
}

/// Diagnostic registration options.
/// @since 3.17.0
final class DiagnosticRegistrationOptions {
  const DiagnosticRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.identifier,
    required this.interFileDependencies,
    this.workDoneProgress,
    required this.workspaceDiagnostics,
  });

  factory DiagnosticRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return DiagnosticRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      identifier: json['identifier'] as String?,
      interFileDependencies: json['interFileDependencies'] as bool,
      workDoneProgress: json['workDoneProgress'] as bool?,
      workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  /// An optional identifier under which the diagnostics are managed by the
  /// client.
  final String? identifier;

  /// Whether the language has inter file dependencies meaning that editing code
  /// in one file can result in a different diagnostic set in another file. Inter
  /// file dependencies are common for most programming languages and typically
  /// uncommon for linters.
  final bool interFileDependencies;

  final bool? workDoneProgress;

  /// The server provides support for workspace diagnostics as well.
  final bool workspaceDiagnostics;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'identifier': identifier,
      'interFileDependencies': interFileDependencies,
      'workDoneProgress': workDoneProgress,
      'workspaceDiagnostics': workspaceDiagnostics,
    };
  }
}

/// Parameters of the workspace diagnostic request.
/// @since 3.17.0
final class WorkspaceDiagnosticParams {
  const WorkspaceDiagnosticParams({
    this.identifier,
    this.partialResultToken,
    required this.previousResultIds,
    this.workDoneToken,
  });

  factory WorkspaceDiagnosticParams.fromJson(Map<String, dynamic> json) {
    return WorkspaceDiagnosticParams(
      identifier: json['identifier'] as String?,
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      previousResultIds: (json['previousResultIds'] as List)
          .map((e) => PreviousResultId.fromJson(e as Map<String, dynamic>))
          .toList(),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The additional identifier provided during registration.
  final String? identifier;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The currently known diagnostic reports with their previous result ids.
  final List<PreviousResultId> previousResultIds;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'partialResultToken': partialResultToken,
      'previousResultIds': previousResultIds.map((e) => e.toJson()).toList(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// A workspace diagnostic report.
/// @since 3.17.0
final class WorkspaceDiagnosticReport {
  const WorkspaceDiagnosticReport({required this.items});

  factory WorkspaceDiagnosticReport.fromJson(Map<String, dynamic> json) {
    return WorkspaceDiagnosticReport(
      items: (json['items'] as List)
          .map((e) => e as WorkspaceDocumentDiagnosticReport)
          .toList(),
    );
  }

  final List<WorkspaceDocumentDiagnosticReport> items;

  Map<String, dynamic> toJson() {
    return {'items': items};
  }
}

/// A partial result for a workspace diagnostic report.
/// @since 3.17.0
final class WorkspaceDiagnosticReportPartialResult {
  const WorkspaceDiagnosticReportPartialResult({required this.items});

  factory WorkspaceDiagnosticReportPartialResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return WorkspaceDiagnosticReportPartialResult(
      items: (json['items'] as List)
          .map((e) => e as WorkspaceDocumentDiagnosticReport)
          .toList(),
    );
  }

  final List<WorkspaceDocumentDiagnosticReport> items;

  Map<String, dynamic> toJson() {
    return {'items': items};
  }
}

/// The params sent in an open notebook document notification.
/// @since 3.17.0
final class DidOpenNotebookDocumentParams {
  const DidOpenNotebookDocumentParams({
    required this.cellTextDocuments,
    required this.notebookDocument,
  });

  factory DidOpenNotebookDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidOpenNotebookDocumentParams(
      cellTextDocuments: (json['cellTextDocuments'] as List)
          .map((e) => TextDocumentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      notebookDocument: NotebookDocument.fromJson(
        json['notebookDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The text documents that represent the content of a notebook cell.
  final List<TextDocumentItem> cellTextDocuments;

  /// The notebook document that got opened.
  final NotebookDocument notebookDocument;

  Map<String, dynamic> toJson() {
    return {
      'cellTextDocuments': cellTextDocuments.map((e) => e.toJson()).toList(),
      'notebookDocument': notebookDocument.toJson(),
    };
  }
}

/// The params sent in a change notebook document notification.
/// @since 3.17.0
final class DidChangeNotebookDocumentParams {
  const DidChangeNotebookDocumentParams({
    required this.change,
    required this.notebookDocument,
  });

  factory DidChangeNotebookDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidChangeNotebookDocumentParams(
      change: NotebookDocumentChangeEvent.fromJson(
        json['change'] as Map<String, dynamic>,
      ),
      notebookDocument: VersionedNotebookDocumentIdentifier.fromJson(
        json['notebookDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The actual changes to the notebook document.
  /// The changes describe single state changes to the notebook document. So if
  /// there are two changes c1 (at array index 0) and c2 (at array index 1) for a
  /// notebook in state S then c1 moves the notebook from S to S' and c2 from S'
  /// to S''. So c1 is computed on the state S and c2 is computed on the state
  /// S'.
  /// To mirror the content of a notebook using change events use the following
  /// approach: - start with the same initial content - apply the
  /// 'notebookDocument/didChange' notifications in the order you receive them. -
  /// apply the `NotebookChangeEvent`s in a single notification in the order you
  /// receive them.
  final NotebookDocumentChangeEvent change;

  /// The notebook document that did change. The version number points to the
  /// version after all provided changes have been applied. If only the text
  /// document content of a cell changes the notebook version doesn't necessarily
  /// have to change.
  final VersionedNotebookDocumentIdentifier notebookDocument;

  Map<String, dynamic> toJson() {
    return {
      'change': change.toJson(),
      'notebookDocument': notebookDocument.toJson(),
    };
  }
}

/// The params sent in a save notebook document notification.
/// @since 3.17.0
final class DidSaveNotebookDocumentParams {
  const DidSaveNotebookDocumentParams({required this.notebookDocument});

  factory DidSaveNotebookDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidSaveNotebookDocumentParams(
      notebookDocument: NotebookDocumentIdentifier.fromJson(
        json['notebookDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The notebook document that got saved.
  final NotebookDocumentIdentifier notebookDocument;

  Map<String, dynamic> toJson() {
    return {'notebookDocument': notebookDocument.toJson()};
  }
}

/// The params sent in a close notebook document notification.
/// @since 3.17.0
final class DidCloseNotebookDocumentParams {
  const DidCloseNotebookDocumentParams({
    required this.cellTextDocuments,
    required this.notebookDocument,
  });

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidCloseNotebookDocumentParams(
      cellTextDocuments: (json['cellTextDocuments'] as List)
          .map(
            (e) => TextDocumentIdentifier.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      notebookDocument: NotebookDocumentIdentifier.fromJson(
        json['notebookDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The text documents that represent the content of a notebook cell that got
  /// closed.
  final List<TextDocumentIdentifier> cellTextDocuments;

  /// The notebook document that got closed.
  final NotebookDocumentIdentifier notebookDocument;

  Map<String, dynamic> toJson() {
    return {
      'cellTextDocuments': cellTextDocuments.map((e) => e.toJson()).toList(),
      'notebookDocument': notebookDocument.toJson(),
    };
  }
}

/// A parameter literal used in inline completion requests.
/// @since 3.18.0 @proposed
final class InlineCompletionParams {
  const InlineCompletionParams({
    required this.context,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory InlineCompletionParams.fromJson(Map<String, dynamic> json) {
    return InlineCompletionParams(
      context: InlineCompletionContext.fromJson(
        json['context'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// Additional information about the context in which inline completions were
  /// requested.
  final InlineCompletionContext context;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'context': context.toJson(),
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents a collection of {@link InlineCompletionItem inline completion
/// items} to be presented in the editor.
/// @since 3.18.0 @proposed
final class InlineCompletionList {
  const InlineCompletionList({required this.items});

  factory InlineCompletionList.fromJson(Map<String, dynamic> json) {
    return InlineCompletionList(
      items: (json['items'] as List)
          .map((e) => InlineCompletionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The inline completion items
  final List<InlineCompletionItem> items;

  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }
}

/// An inline completion item represents a text snippet that is proposed inline
/// to complete text that is being typed.
/// @since 3.18.0 @proposed
final class InlineCompletionItem {
  const InlineCompletionItem({
    this.command,
    this.filterText,
    required this.insertText,
    this.range,
  });

  factory InlineCompletionItem.fromJson(Map<String, dynamic> json) {
    return InlineCompletionItem(
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      filterText: json['filterText'] as String?,
      insertText: json['insertText'],
      range: json['range'] == null
          ? null
          : Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// An optional {@link Command} that is executed *after* inserting this
  /// completion.
  final Command? command;

  /// A text that is used to decide if this inline completion should be shown.
  /// When `falsy` the {@link InlineCompletionItem.insertText} is used.
  final String? filterText;

  /// The text to replace the range with. Must be set.
  final Object? insertText;

  /// The range to replace. Must begin and end on the same line.
  final Range? range;

  Map<String, dynamic> toJson() {
    return {
      'command': command?.toJson(),
      'filterText': filterText,
      'insertText': insertText,
      'range': range?.toJson(),
    };
  }
}

/// Inline completion options used during static or dynamic registration.
/// @since 3.18.0 @proposed
final class InlineCompletionRegistrationOptions {
  const InlineCompletionRegistrationOptions({
    required this.documentSelector,
    this.id,
    this.workDoneProgress,
  });

  factory InlineCompletionRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return InlineCompletionRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      id: json['id'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'id': id,
      'workDoneProgress': workDoneProgress,
    };
  }
}

final class RegistrationParams {
  const RegistrationParams({required this.registrations});

  factory RegistrationParams.fromJson(Map<String, dynamic> json) {
    return RegistrationParams(
      registrations: (json['registrations'] as List)
          .map((e) => Registration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<Registration> registrations;

  Map<String, dynamic> toJson() {
    return {'registrations': registrations.map((e) => e.toJson()).toList()};
  }
}

final class UnregistrationParams {
  const UnregistrationParams({required this.unregisterations});

  factory UnregistrationParams.fromJson(Map<String, dynamic> json) {
    return UnregistrationParams(
      unregisterations: (json['unregisterations'] as List)
          .map((e) => Unregistration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<Unregistration> unregisterations;

  Map<String, dynamic> toJson() {
    return {
      'unregisterations': unregisterations.map((e) => e.toJson()).toList(),
    };
  }
}

final class InitializeParams {
  const InitializeParams({
    required this.capabilities,
    this.clientInfo,
    this.initializationOptions,
    this.locale,
    required this.processId,
    this.rootPath,
    required this.rootUri,
    this.trace,
    this.workDoneToken,
    this.workspaceFolders,
  });

  factory InitializeParams.fromJson(Map<String, dynamic> json) {
    return InitializeParams(
      capabilities: ClientCapabilities.fromJson(
        json['capabilities'] as Map<String, dynamic>,
      ),
      clientInfo: json['clientInfo'] as Map<String, dynamic>?,
      initializationOptions: json['initializationOptions'] as LSPAny?,
      locale: json['locale'] as String?,
      processId: json['processId'] as int?,
      rootPath: json['rootPath'] as String?,
      rootUri: json['rootUri'] as String?,
      trace: json['trace'] == null ? null : TraceValues.fromJson(json['trace']),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
      workspaceFolders: json['workspaceFolders'] == null
          ? null
          : (json['workspaceFolders'] as List)
                .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
                .toList(),
    );
  }

  /// The capabilities provided by the client (editor or tool)
  final ClientCapabilities capabilities;

  /// Information about the client
  /// @since 3.15.0
  final Map<String, dynamic>? clientInfo;

  /// User provided initialization options.
  final LSPAny? initializationOptions;

  /// The locale the client is currently showing the user interface in. This must
  /// not necessarily be the locale of the operating system.
  /// Uses IETF language tags as the value's syntax (See
  /// https://en.wikipedia.org/wiki/IETF_language_tag)
  /// @since 3.16.0
  final String? locale;

  /// The process Id of the parent process that started the server.
  /// Is `null` if the process has not been started by another process. If the
  /// parent process is not alive then the server should exit.
  final int? processId;

  /// The rootPath of the workspace. Is null if no folder is open.
  /// @deprecated in favour of rootUri.
  final String? rootPath;

  /// The rootUri of the workspace. Is null if no folder is open. If both
  /// `rootPath` and `rootUri` are set `rootUri` wins.
  /// @deprecated in favour of workspaceFolders.
  final String? rootUri;

  /// The initial trace setting. If omitted trace is disabled ('off').
  final TraceValues? trace;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  /// The workspace folders configured in the client when the server starts.
  /// This property is only available if the client supports workspace folders.
  /// It can be `null` if the client supports workspace folders but none are
  /// configured.
  /// @since 3.6.0
  final List<WorkspaceFolder>? workspaceFolders;

  Map<String, dynamic> toJson() {
    return {
      'capabilities': capabilities.toJson(),
      'clientInfo': clientInfo,
      'initializationOptions': initializationOptions,
      'locale': locale,
      'processId': processId,
      'rootPath': rootPath,
      'rootUri': rootUri,
      'trace': trace?.toJson(),
      'workDoneToken': workDoneToken,
      'workspaceFolders': workspaceFolders?.map((e) => e.toJson()).toList(),
    };
  }
}

/// The result returned from an initialize request.
final class InitializeResult {
  const InitializeResult({required this.capabilities, this.serverInfo});

  factory InitializeResult.fromJson(Map<String, dynamic> json) {
    return InitializeResult(
      capabilities: ServerCapabilities.fromJson(
        json['capabilities'] as Map<String, dynamic>,
      ),
      serverInfo: json['serverInfo'] as Map<String, dynamic>?,
    );
  }

  /// The capabilities the language server provides.
  final ServerCapabilities capabilities;

  /// Information about the server.
  /// @since 3.15.0
  final Map<String, dynamic>? serverInfo;

  Map<String, dynamic> toJson() {
    return {'capabilities': capabilities.toJson(), 'serverInfo': serverInfo};
  }
}

/// The data type of the ResponseError if the initialize request fails.
final class InitializeError {
  const InitializeError({required this.retry});

  factory InitializeError.fromJson(Map<String, dynamic> json) {
    return InitializeError(retry: json['retry'] as bool);
  }

  /// Indicates whether the client execute the following retry logic: (1) show
  /// the message provided by the ResponseError to the user (2) user selects
  /// retry or cancel (3) if user selected retry the initialize method is sent
  /// again.
  final bool retry;

  Map<String, dynamic> toJson() {
    return {'retry': retry};
  }
}

final class InitializedParams {
  const InitializedParams();

  factory InitializedParams.fromJson(Map<String, dynamic> json) {
    return InitializedParams();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The parameters of a change configuration notification.
final class DidChangeConfigurationParams {
  const DidChangeConfigurationParams({required this.settings});

  factory DidChangeConfigurationParams.fromJson(Map<String, dynamic> json) {
    return DidChangeConfigurationParams(settings: json['settings'] as LSPAny);
  }

  /// The actual changed settings
  final LSPAny settings;

  Map<String, dynamic> toJson() {
    return {'settings': settings};
  }
}

final class DidChangeConfigurationRegistrationOptions {
  const DidChangeConfigurationRegistrationOptions({this.section});

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return DidChangeConfigurationRegistrationOptions(section: json['section']);
  }

  final Object? section;

  Map<String, dynamic> toJson() {
    return {'section': section};
  }
}

/// The parameters of a notification message.
final class ShowMessageParams {
  const ShowMessageParams({required this.message, required this.type});

  factory ShowMessageParams.fromJson(Map<String, dynamic> json) {
    return ShowMessageParams(
      message: json['message'] as String,
      type: MessageType.fromJson(json['type']),
    );
  }

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  Map<String, dynamic> toJson() {
    return {'message': message, 'type': type.toJson()};
  }
}

final class ShowMessageRequestParams {
  const ShowMessageRequestParams({
    this.actions,
    required this.message,
    required this.type,
  });

  factory ShowMessageRequestParams.fromJson(Map<String, dynamic> json) {
    return ShowMessageRequestParams(
      actions: json['actions'] == null
          ? null
          : (json['actions'] as List)
                .map(
                  (e) => MessageActionItem.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      message: json['message'] as String,
      type: MessageType.fromJson(json['type']),
    );
  }

  /// The message action items to present.
  final List<MessageActionItem>? actions;

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  Map<String, dynamic> toJson() {
    return {
      'actions': actions?.map((e) => e.toJson()).toList(),
      'message': message,
      'type': type.toJson(),
    };
  }
}

final class MessageActionItem {
  const MessageActionItem({required this.title});

  factory MessageActionItem.fromJson(Map<String, dynamic> json) {
    return MessageActionItem(title: json['title'] as String);
  }

  /// A short title like 'Retry', 'Open Log' etc.
  final String title;

  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}

/// The log message parameters.
final class LogMessageParams {
  const LogMessageParams({required this.message, required this.type});

  factory LogMessageParams.fromJson(Map<String, dynamic> json) {
    return LogMessageParams(
      message: json['message'] as String,
      type: MessageType.fromJson(json['type']),
    );
  }

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  Map<String, dynamic> toJson() {
    return {'message': message, 'type': type.toJson()};
  }
}

/// The parameters sent in an open text document notification
final class DidOpenTextDocumentParams {
  const DidOpenTextDocumentParams({required this.textDocument});

  factory DidOpenTextDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidOpenTextDocumentParams(
      textDocument: TextDocumentItem.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The document that was opened.
  final TextDocumentItem textDocument;

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument.toJson()};
  }
}

/// The change text document notification's parameters.
final class DidChangeTextDocumentParams {
  const DidChangeTextDocumentParams({
    required this.contentChanges,
    required this.textDocument,
  });

  factory DidChangeTextDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidChangeTextDocumentParams(
      contentChanges: (json['contentChanges'] as List)
          .map((e) => e as TextDocumentContentChangeEvent)
          .toList(),
      textDocument: VersionedTextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The actual content changes. The content changes describe single state
  /// changes to the document. So if there are two content changes c1 (at array
  /// index 0) and c2 (at array index 1) for a document in state S then c1 moves
  /// the document from S to S' and c2 from S' to S''. So c1 is computed on the
  /// state S and c2 is computed on the state S'.
  /// To mirror the content of a document using change events use the following
  /// approach: - start with the same initial content - apply the
  /// 'textDocument/didChange' notifications in the order you receive them. -
  /// apply the `TextDocumentContentChangeEvent`s in a single notification in the
  /// order you receive them.
  final List<TextDocumentContentChangeEvent> contentChanges;

  /// The document that did change. The version number points to the version
  /// after all provided content changes have been applied.
  final VersionedTextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    return {
      'contentChanges': contentChanges,
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Describe options to be used when registered for text document change events.
final class TextDocumentChangeRegistrationOptions {
  const TextDocumentChangeRegistrationOptions({
    required this.documentSelector,
    required this.syncKind,
  });

  factory TextDocumentChangeRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return TextDocumentChangeRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      syncKind: TextDocumentSyncKind.fromJson(json['syncKind']),
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// How documents are synced to the server.
  final TextDocumentSyncKind syncKind;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'syncKind': syncKind.toJson(),
    };
  }
}

/// The parameters sent in a close text document notification
final class DidCloseTextDocumentParams {
  const DidCloseTextDocumentParams({required this.textDocument});

  factory DidCloseTextDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidCloseTextDocumentParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The document that was closed.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument.toJson()};
  }
}

/// The parameters sent in a save text document notification
final class DidSaveTextDocumentParams {
  const DidSaveTextDocumentParams({this.text, required this.textDocument});

  factory DidSaveTextDocumentParams.fromJson(Map<String, dynamic> json) {
    return DidSaveTextDocumentParams(
      text: json['text'] as String?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// Optional the content when saved. Depends on the includeText value when the
  /// save notification was requested.
  final String? text;

  /// The document that was saved.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    return {'text': text, 'textDocument': textDocument.toJson()};
  }
}

/// Save registration options.
final class TextDocumentSaveRegistrationOptions {
  const TextDocumentSaveRegistrationOptions({
    required this.documentSelector,
    this.includeText,
  });

  factory TextDocumentSaveRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return TextDocumentSaveRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      includeText: json['includeText'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The client is supposed to include the content on save.
  final bool? includeText;

  Map<String, dynamic> toJson() {
    return {'documentSelector': documentSelector, 'includeText': includeText};
  }
}

/// The parameters sent in a will save text document notification.
final class WillSaveTextDocumentParams {
  const WillSaveTextDocumentParams({
    required this.reason,
    required this.textDocument,
  });

  factory WillSaveTextDocumentParams.fromJson(Map<String, dynamic> json) {
    return WillSaveTextDocumentParams(
      reason: TextDocumentSaveReason.fromJson(json['reason']),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The 'TextDocumentSaveReason'.
  final TextDocumentSaveReason reason;

  /// The document that will be saved.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    return {'reason': reason.toJson(), 'textDocument': textDocument.toJson()};
  }
}

/// A text edit applicable to a text document.
final class TextEdit {
  const TextEdit({required this.newText, required this.range});

  factory TextEdit.fromJson(Map<String, dynamic> json) {
    return TextEdit(
      newText: json['newText'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// The string to be inserted. For delete operations use an empty string.
  final String newText;

  /// The range of the text document to be manipulated. To insert text into a
  /// document create a range where start === end.
  final Range range;

  Map<String, dynamic> toJson() {
    return {'newText': newText, 'range': range.toJson()};
  }
}

/// The watched files change notification's parameters.
final class DidChangeWatchedFilesParams {
  const DidChangeWatchedFilesParams({required this.changes});

  factory DidChangeWatchedFilesParams.fromJson(Map<String, dynamic> json) {
    return DidChangeWatchedFilesParams(
      changes: (json['changes'] as List)
          .map((e) => FileEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The actual file events.
  final List<FileEvent> changes;

  Map<String, dynamic> toJson() {
    return {'changes': changes.map((e) => e.toJson()).toList()};
  }
}

/// Describe options to be used when registered for text document change events.
final class DidChangeWatchedFilesRegistrationOptions {
  const DidChangeWatchedFilesRegistrationOptions({required this.watchers});

  factory DidChangeWatchedFilesRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return DidChangeWatchedFilesRegistrationOptions(
      watchers: (json['watchers'] as List)
          .map((e) => FileSystemWatcher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The watchers to register.
  final List<FileSystemWatcher> watchers;

  Map<String, dynamic> toJson() {
    return {'watchers': watchers.map((e) => e.toJson()).toList()};
  }
}

/// The publish diagnostic notification's parameters.
final class PublishDiagnosticsParams {
  const PublishDiagnosticsParams({
    required this.diagnostics,
    required this.uri,
    this.version,
  });

  factory PublishDiagnosticsParams.fromJson(Map<String, dynamic> json) {
    return PublishDiagnosticsParams(
      diagnostics: (json['diagnostics'] as List)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      uri: json['uri'] as String,
      version: json['version'] as int?,
    );
  }

  /// An array of diagnostic information items.
  final List<Diagnostic> diagnostics;

  /// The URI for which diagnostic information is reported.
  final String uri;

  /// Optional the version number of the document the diagnostics are published
  /// for.
  /// @since 3.15.0
  final int? version;

  Map<String, dynamic> toJson() {
    return {
      'diagnostics': diagnostics.map((e) => e.toJson()).toList(),
      'uri': uri,
      'version': version,
    };
  }
}

/// Completion parameters
final class CompletionParams {
  const CompletionParams({
    this.context,
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory CompletionParams.fromJson(Map<String, dynamic> json) {
    return CompletionParams(
      context: json['context'] == null
          ? null
          : CompletionContext.fromJson(json['context'] as Map<String, dynamic>),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The completion context. This is only available if the client specifies to
  /// send this using the client capability
  /// `textDocument.completion.contextSupport === true`
  final CompletionContext? context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'context': context?.toJson(),
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// A completion item represents a text snippet that is proposed to complete
/// text that is being typed.
final class CompletionItem {
  const CompletionItem({
    this.additionalTextEdits,
    this.command,
    this.commitCharacters,
    this.data,
    this.deprecated,
    this.detail,
    this.documentation,
    this.filterText,
    this.insertText,
    this.insertTextFormat,
    this.insertTextMode,
    this.kind,
    required this.label,
    this.labelDetails,
    this.preselect,
    this.sortText,
    this.tags,
    this.textEdit,
    this.textEditText,
  });

  factory CompletionItem.fromJson(Map<String, dynamic> json) {
    return CompletionItem(
      additionalTextEdits: json['additionalTextEdits'] == null
          ? null
          : (json['additionalTextEdits'] as List)
                .map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
                .toList(),
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      commitCharacters: json['commitCharacters'] == null
          ? null
          : (json['commitCharacters'] as List).map((e) => e as String).toList(),
      data: json['data'] as LSPAny?,
      deprecated: json['deprecated'] as bool?,
      detail: json['detail'] as String?,
      documentation: json['documentation'],
      filterText: json['filterText'] as String?,
      insertText: json['insertText'] as String?,
      insertTextFormat: json['insertTextFormat'] == null
          ? null
          : InsertTextFormat.fromJson(json['insertTextFormat']),
      insertTextMode: json['insertTextMode'] == null
          ? null
          : InsertTextMode.fromJson(json['insertTextMode']),
      kind: json['kind'] == null
          ? null
          : CompletionItemKind.fromJson(json['kind']),
      label: json['label'] as String,
      labelDetails: json['labelDetails'] == null
          ? null
          : CompletionItemLabelDetails.fromJson(
              json['labelDetails'] as Map<String, dynamic>,
            ),
      preselect: json['preselect'] as bool?,
      sortText: json['sortText'] as String?,
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List)
                .map((e) => CompletionItemTag.fromJson(e))
                .toList(),
      textEdit: json['textEdit'],
      textEditText: json['textEditText'] as String?,
    );
  }

  /// An optional array of additional {@link TextEdit text edits} that are
  /// applied when selecting this completion. Edits must not overlap (including
  /// the same insert position) with the main {@link CompletionItem.textEdit
  /// edit} nor with themselves.
  /// Additional text edits should be used to change text unrelated to the
  /// current cursor position (for example adding an import statement at the top
  /// of the file if the completion item will insert an unqualified type).
  final List<TextEdit>? additionalTextEdits;

  /// An optional {@link Command command} that is executed *after* inserting this
  /// completion. *Note* that additional modifications to the current document
  /// should be described with the {@link CompletionItem.additionalTextEdits
  /// additionalTextEdits}-property.
  final Command? command;

  /// An optional set of characters that when pressed while this completion is
  /// active will accept it first and then type that character. *Note* that all
  /// commit characters should have `length=1` and that superfluous characters
  /// will be ignored.
  final List<String>? commitCharacters;

  /// A data entry field that is preserved on a completion item between a {@link
  /// CompletionRequest} and a {@link CompletionResolveRequest}.
  final LSPAny? data;

  /// Indicates if this item is deprecated. @deprecated Use `tags` instead.
  final bool? deprecated;

  /// A human-readable string with additional information about this item, like
  /// type or symbol information.
  final String? detail;

  /// A human-readable string that represents a doc-comment.
  final Object? documentation;

  /// A string that should be used when filtering a set of completion items. When
  /// `falsy` the {@link CompletionItem.label label} is used.
  final String? filterText;

  /// A string that should be inserted into a document when selecting this
  /// completion. When `falsy` the {@link CompletionItem.label label} is used.
  /// The `insertText` is subject to interpretation by the client side. Some
  /// tools might not take the string literally. For example VS Code when code
  /// complete is requested in this example `con<cursor position>` and a
  /// completion item with an `insertText` of `console` is provided it will only
  /// insert `sole`. Therefore it is recommended to use `textEdit` instead since
  /// it avoids additional client side interpretation.
  final String? insertText;

  /// The format of the insert text. The format applies to both the `insertText`
  /// property and the `newText` property of a provided `textEdit`. If omitted
  /// defaults to `InsertTextFormat.PlainText`.
  /// Please note that the insertTextFormat doesn't apply to
  /// `additionalTextEdits`.
  final InsertTextFormat? insertTextFormat;

  /// How whitespace and indentation is handled during completion item insertion.
  /// If not provided the clients default value depends on the
  /// `textDocument.completion.insertTextMode` client capability.
  /// @since 3.16.0
  final InsertTextMode? insertTextMode;

  /// The kind of this completion item. Based of the kind an icon is chosen by
  /// the editor.
  final CompletionItemKind? kind;

  /// The label of this completion item.
  /// The label property is also by default the text that is inserted when
  /// selecting this completion.
  /// If label details are provided the label itself should be an unqualified
  /// name of the completion item.
  final String label;

  /// Additional details for the label
  /// @since 3.17.0
  final CompletionItemLabelDetails? labelDetails;

  /// Select this item when showing.
  /// *Note* that only one completion item can be selected and that the tool /
  /// client decides which item that is. The rule is that the *first* item of
  /// those that match best is selected.
  final bool? preselect;

  /// A string that should be used when comparing this item with other items.
  /// When `falsy` the {@link CompletionItem.label label} is used.
  final String? sortText;

  /// Tags for this completion item.
  /// @since 3.15.0
  final List<CompletionItemTag>? tags;

  /// An {@link TextEdit edit} which is applied to a document when selecting this
  /// completion. When an edit is provided the value of {@link
  /// CompletionItem.insertText insertText} is ignored.
  /// Most editors support two different operations when accepting a completion
  /// item. One is to insert a completion text and the other is to replace an
  /// existing text with a completion text. Since this can usually not be
  /// predetermined by a server it can report both ranges. Clients need to signal
  /// support for `InsertReplaceEdits` via the
  /// `textDocument.completion.insertReplaceSupport` client capability property.
  /// *Note 1:* The text edit's range as well as both ranges from an insert
  /// replace edit must be a [single line] and they must contain the position at
  /// which completion has been requested. *Note 2:* If an `InsertReplaceEdit` is
  /// returned the edit's insert range must be a prefix of the edit's replace
  /// range, that means it must be contained and starting at the same position.
  /// @since 3.16.0 additional type `InsertReplaceEdit`
  final Object? textEdit;

  /// The edit text used if the completion item is part of a CompletionList and
  /// CompletionList defines an item default for the text edit range.
  /// Clients will only honor this property if they opt into completion list item
  /// defaults using the capability `completionList.itemDefaults`.
  /// If not provided and a list's default range is provided the label property
  /// is used as a text.
  /// @since 3.17.0
  final String? textEditText;

  Map<String, dynamic> toJson() {
    return {
      'additionalTextEdits': additionalTextEdits
          ?.map((e) => e.toJson())
          .toList(),
      'command': command?.toJson(),
      'commitCharacters': commitCharacters,
      'data': data,
      'deprecated': deprecated,
      'detail': detail,
      'documentation': documentation,
      'filterText': filterText,
      'insertText': insertText,
      'insertTextFormat': insertTextFormat?.toJson(),
      'insertTextMode': insertTextMode?.toJson(),
      'kind': kind?.toJson(),
      'label': label,
      'labelDetails': labelDetails?.toJson(),
      'preselect': preselect,
      'sortText': sortText,
      'tags': tags?.map((e) => e.toJson()).toList(),
      'textEdit': textEdit,
      'textEditText': textEditText,
    };
  }
}

/// Represents a collection of {@link CompletionItem completion items} to be
/// presented in the editor.
final class CompletionList {
  const CompletionList({
    required this.isIncomplete,
    this.itemDefaults,
    required this.items,
  });

  factory CompletionList.fromJson(Map<String, dynamic> json) {
    return CompletionList(
      isIncomplete: json['isIncomplete'] as bool,
      itemDefaults: json['itemDefaults'] as Map<String, dynamic>?,
      items: (json['items'] as List)
          .map((e) => CompletionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// This list it not complete. Further typing results in recomputing this list.
  /// Recomputed lists have all their items replaced (not appended) in the
  /// incomplete completion sessions.
  final bool isIncomplete;

  /// In many cases the items of an actual completion result share the same value
  /// for properties like `commitCharacters` or the range of a text edit. A
  /// completion list can therefore define item defaults which will be used if a
  /// completion item itself doesn't specify the value.
  /// If a completion list specifies a default value and a completion item also
  /// specifies a corresponding value the one from the item is used.
  /// Servers are only allowed to return default values if the client signals
  /// support for this via the `completionList.itemDefaults` capability.
  /// @since 3.17.0
  final Map<String, dynamic>? itemDefaults;

  /// The completion items.
  final List<CompletionItem> items;

  Map<String, dynamic> toJson() {
    return {
      'isIncomplete': isIncomplete,
      'itemDefaults': itemDefaults,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

/// Registration options for a {@link CompletionRequest}.
final class CompletionRegistrationOptions {
  const CompletionRegistrationOptions({
    this.allCommitCharacters,
    this.completionItem,
    required this.documentSelector,
    this.resolveProvider,
    this.triggerCharacters,
    this.workDoneProgress,
  });

  factory CompletionRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return CompletionRegistrationOptions(
      allCommitCharacters: json['allCommitCharacters'] == null
          ? null
          : (json['allCommitCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      completionItem: json['completionItem'] as Map<String, dynamic>?,
      documentSelector: json['documentSelector'] as DocumentSelector?,
      resolveProvider: json['resolveProvider'] as bool?,
      triggerCharacters: json['triggerCharacters'] == null
          ? null
          : (json['triggerCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// The list of all possible characters that commit a completion. This field
  /// can be used if clients don't support individual commit characters per
  /// completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
  /// If a server provides both `allCommitCharacters` and commit characters on an
  /// individual completion item the ones on the completion item win.
  /// @since 3.2.0
  final List<String>? allCommitCharacters;

  /// The server supports the following `CompletionItem` specific capabilities.
  /// @since 3.17.0
  final Map<String, dynamic>? completionItem;

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The server provides support to resolve additional information for a
  /// completion item.
  final bool? resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically they
  /// do so when the user starts to type an identifier. For example if the user
  /// types `c` in a JavaScript file code complete will automatically pop up
  /// present `console` besides others as a completion item. Characters that make
  /// up identifiers don't need to be listed here.
  /// If code complete should automatically be trigger on characters not being
  /// valid inside an identifier (for example `.` in JavaScript) list them in
  /// `triggerCharacters`.
  final List<String>? triggerCharacters;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'allCommitCharacters': allCommitCharacters,
      'completionItem': completionItem,
      'documentSelector': documentSelector,
      'resolveProvider': resolveProvider,
      'triggerCharacters': triggerCharacters,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link HoverRequest}.
final class HoverParams {
  const HoverParams({
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory HoverParams.fromJson(Map<String, dynamic> json) {
    return HoverParams(
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// The result of a hover request.
final class Hover {
  const Hover({required this.contents, this.range});

  factory Hover.fromJson(Map<String, dynamic> json) {
    return Hover(
      contents: json['contents'],
      range: json['range'] == null
          ? null
          : Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// The hover's content
  final Object? contents;

  /// An optional range inside the text document that is used to visualize the
  /// hover, e.g. by changing the background color.
  final Range? range;

  Map<String, dynamic> toJson() {
    return {'contents': contents, 'range': range?.toJson()};
  }
}

/// Registration options for a {@link HoverRequest}.
final class HoverRegistrationOptions {
  const HoverRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory HoverRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return HoverRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link SignatureHelpRequest}.
final class SignatureHelpParams {
  const SignatureHelpParams({
    this.context,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory SignatureHelpParams.fromJson(Map<String, dynamic> json) {
    return SignatureHelpParams(
      context: json['context'] == null
          ? null
          : SignatureHelpContext.fromJson(
              json['context'] as Map<String, dynamic>,
            ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The signature help context. This is only available if the client specifies
  /// to send this using the client capability
  /// `textDocument.signatureHelp.contextSupport === true`
  /// @since 3.15.0
  final SignatureHelpContext? context;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'context': context?.toJson(),
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
final class SignatureHelp {
  const SignatureHelp({
    this.activeParameter,
    this.activeSignature,
    required this.signatures,
  });

  factory SignatureHelp.fromJson(Map<String, dynamic> json) {
    return SignatureHelp(
      activeParameter: json['activeParameter'] as int?,
      activeSignature: json['activeSignature'] as int?,
      signatures: (json['signatures'] as List)
          .map((e) => SignatureInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The active parameter of the active signature. If omitted or the value lies
  /// outside the range of `signatures[activeSignature].parameters` defaults to 0
  /// if the active signature has parameters. If the active signature has no
  /// parameters it is ignored. In future version of the protocol this property
  /// might become mandatory to better express the active parameter if the active
  /// signature does have any.
  final int? activeParameter;

  /// The active signature. If omitted or the value lies outside the range of
  /// `signatures` the value defaults to zero or is ignored if the
  /// `SignatureHelp` has no signatures.
  /// Whenever possible implementors should make an active decision about the
  /// active signature and shouldn't rely on a default value.
  /// In future version of the protocol this property might become mandatory to
  /// better express this.
  final int? activeSignature;

  /// One or more signatures.
  final List<SignatureInformation> signatures;

  Map<String, dynamic> toJson() {
    return {
      'activeParameter': activeParameter,
      'activeSignature': activeSignature,
      'signatures': signatures.map((e) => e.toJson()).toList(),
    };
  }
}

/// Registration options for a {@link SignatureHelpRequest}.
final class SignatureHelpRegistrationOptions {
  const SignatureHelpRegistrationOptions({
    required this.documentSelector,
    this.retriggerCharacters,
    this.triggerCharacters,
    this.workDoneProgress,
  });

  factory SignatureHelpRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return SignatureHelpRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      retriggerCharacters: json['retriggerCharacters'] == null
          ? null
          : (json['retriggerCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      triggerCharacters: json['triggerCharacters'] == null
          ? null
          : (json['triggerCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// List of characters that re-trigger signature help.
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger characters.
  /// @since 3.15.0
  final List<String>? retriggerCharacters;

  /// List of characters that trigger signature help automatically.
  final List<String>? triggerCharacters;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'retriggerCharacters': retriggerCharacters,
      'triggerCharacters': triggerCharacters,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link DefinitionRequest}.
final class DefinitionParams {
  const DefinitionParams({
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DefinitionParams.fromJson(Map<String, dynamic> json) {
    return DefinitionParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Registration options for a {@link DefinitionRequest}.
final class DefinitionRegistrationOptions {
  const DefinitionRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory DefinitionRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return DefinitionRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link ReferencesRequest}.
final class ReferenceParams {
  const ReferenceParams({
    required this.context,
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory ReferenceParams.fromJson(Map<String, dynamic> json) {
    return ReferenceParams(
      context: ReferenceContext.fromJson(
        json['context'] as Map<String, dynamic>,
      ),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  final ReferenceContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'context': context.toJson(),
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Registration options for a {@link ReferencesRequest}.
final class ReferenceRegistrationOptions {
  const ReferenceRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory ReferenceRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return ReferenceRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link DocumentHighlightRequest}.
final class DocumentHighlightParams {
  const DocumentHighlightParams({
    this.partialResultToken,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentHighlightParams.fromJson(Map<String, dynamic> json) {
    return DocumentHighlightParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
final class DocumentHighlight {
  const DocumentHighlight({this.kind, required this.range});

  factory DocumentHighlight.fromJson(Map<String, dynamic> json) {
    return DocumentHighlight(
      kind: json['kind'] == null
          ? null
          : DocumentHighlightKind.fromJson(json['kind']),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// The highlight kind, default is {@link DocumentHighlightKind.Text text}.
  final DocumentHighlightKind? kind;

  /// The range this highlight applies to.
  final Range range;

  Map<String, dynamic> toJson() {
    return {'kind': kind?.toJson(), 'range': range.toJson()};
  }
}

/// Registration options for a {@link DocumentHighlightRequest}.
final class DocumentHighlightRegistrationOptions {
  const DocumentHighlightRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentHighlightRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Parameters for a {@link DocumentSymbolRequest}.
final class DocumentSymbolParams {
  const DocumentSymbolParams({
    this.partialResultToken,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentSymbolParams.fromJson(Map<String, dynamic> json) {
    return DocumentSymbolParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents information about programming constructs like variables,
/// classes, interfaces etc.
final class SymbolInformation {
  const SymbolInformation({
    this.containerName,
    this.deprecated,
    required this.kind,
    required this.location,
    required this.name,
    this.tags,
  });

  factory SymbolInformation.fromJson(Map<String, dynamic> json) {
    return SymbolInformation(
      containerName: json['containerName'] as String?,
      deprecated: json['deprecated'] as bool?,
      kind: SymbolKind.fromJson(json['kind']),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String,
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List).map((e) => SymbolTag.fromJson(e)).toList(),
    );
  }

  /// The name of the symbol containing this symbol. This information is for user
  /// interface purposes (e.g. to render a qualifier in the user interface if
  /// necessary). It can't be used to re-infer a hierarchy for the document
  /// symbols.
  final String? containerName;

  /// Indicates if this symbol is deprecated.
  /// @deprecated Use tags instead
  final bool? deprecated;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The location of this symbol. The location's range is used by a tool to
  /// reveal the location in the editor. If the symbol is selected in the tool
  /// the range's start information is used to position the cursor. So the range
  /// usually spans more than the actual symbol's name and does normally include
  /// things like visibility modifiers.
  /// The range doesn't have to denote a node range in the sense of an abstract
  /// syntax tree. It can therefore not be used to re-construct a hierarchy of
  /// the symbols.
  final Location location;

  /// The name of this symbol.
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  final List<SymbolTag>? tags;

  Map<String, dynamic> toJson() {
    return {
      'containerName': containerName,
      'deprecated': deprecated,
      'kind': kind.toJson(),
      'location': location.toJson(),
      'name': name,
      'tags': tags?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Represents programming constructs like variables, classes, interfaces etc.
/// that appear in a document. Document symbols can be hierarchical and they
/// have two ranges: one that encloses its definition and one that points to
/// its most interesting range, e.g. the range of an identifier.
final class DocumentSymbol {
  const DocumentSymbol({
    this.children,
    this.deprecated,
    this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    this.tags,
  });

  factory DocumentSymbol.fromJson(Map<String, dynamic> json) {
    return DocumentSymbol(
      children: json['children'] == null
          ? null
          : (json['children'] as List)
                .map((e) => DocumentSymbol.fromJson(e as Map<String, dynamic>))
                .toList(),
      deprecated: json['deprecated'] as bool?,
      detail: json['detail'] as String?,
      kind: SymbolKind.fromJson(json['kind']),
      name: json['name'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      selectionRange: Range.fromJson(
        json['selectionRange'] as Map<String, dynamic>,
      ),
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List).map((e) => SymbolTag.fromJson(e)).toList(),
    );
  }

  /// Children of this symbol, e.g. properties of a class.
  final List<DocumentSymbol>? children;

  /// Indicates if this symbol is deprecated.
  /// @deprecated Use tags instead
  final bool? deprecated;

  /// More detail for this symbol, e.g the signature of a function.
  final String? detail;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The name of this symbol. Will be displayed in the user interface and
  /// therefore must not be an empty string or a string only consisting of white
  /// spaces.
  final String name;

  /// The range enclosing this symbol not including leading/trailing whitespace
  /// but everything else like comments. This information is typically used to
  /// determine if the clients cursor is inside the symbol to reveal in the
  /// symbol in the UI.
  final Range range;

  /// The range that should be selected and revealed when this symbol is being
  /// picked, e.g the name of a function. Must be contained by the `range`.
  final Range selectionRange;

  /// Tags for this document symbol.
  /// @since 3.16.0
  final List<SymbolTag>? tags;

  Map<String, dynamic> toJson() {
    return {
      'children': children?.map((e) => e.toJson()).toList(),
      'deprecated': deprecated,
      'detail': detail,
      'kind': kind.toJson(),
      'name': name,
      'range': range.toJson(),
      'selectionRange': selectionRange.toJson(),
      'tags': tags?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Registration options for a {@link DocumentSymbolRequest}.
final class DocumentSymbolRegistrationOptions {
  const DocumentSymbolRegistrationOptions({
    required this.documentSelector,
    this.label,
    this.workDoneProgress,
  });

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentSymbolRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      label: json['label'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// A human-readable string that is shown when multiple outlines trees are
  /// shown for the same document.
  /// @since 3.16.0
  final String? label;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'label': label,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link CodeActionRequest}.
final class CodeActionParams {
  const CodeActionParams({
    required this.context,
    this.partialResultToken,
    required this.range,
    required this.textDocument,
    this.workDoneToken,
  });

  factory CodeActionParams.fromJson(Map<String, dynamic> json) {
    return CodeActionParams(
      context: CodeActionContext.fromJson(
        json['context'] as Map<String, dynamic>,
      ),
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// Context carrying additional information.
  final CodeActionContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The range for which the command was invoked.
  final Range range;

  /// The document in which the command was invoked.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'context': context.toJson(),
      'partialResultToken': partialResultToken,
      'range': range.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Represents a reference to a command. Provides a title which will be used to
/// represent a command in the UI and, optionally, an array of arguments which
/// will be passed to the command handler function when invoked.
final class Command {
  const Command({this.arguments, required this.command, required this.title});

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      arguments: json['arguments'] == null
          ? null
          : (json['arguments'] as List).map((e) => e as LSPAny).toList(),
      command: json['command'] as String,
      title: json['title'] as String,
    );
  }

  /// Arguments that the command handler should be invoked with.
  final List<LSPAny>? arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// Title of the command, like `save`.
  final String title;

  Map<String, dynamic> toJson() {
    return {'arguments': arguments, 'command': command, 'title': title};
  }
}

/// A code action represents a change that can be performed in code, e.g. to
/// fix a problem or to refactor code.
/// A CodeAction must set either `edit` and/or a `command`. If both are
/// supplied, the `edit` is applied first, then the `command` is executed.
final class CodeAction {
  const CodeAction({
    this.command,
    this.data,
    this.diagnostics,
    this.disabled,
    this.edit,
    this.isPreferred,
    this.kind,
    required this.title,
  });

  factory CodeAction.fromJson(Map<String, dynamic> json) {
    return CodeAction(
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      data: json['data'] as LSPAny?,
      diagnostics: json['diagnostics'] == null
          ? null
          : (json['diagnostics'] as List)
                .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
                .toList(),
      disabled: json['disabled'] as Map<String, dynamic>?,
      edit: json['edit'] == null
          ? null
          : WorkspaceEdit.fromJson(json['edit'] as Map<String, dynamic>),
      isPreferred: json['isPreferred'] as bool?,
      kind: json['kind'] == null ? null : CodeActionKind.fromJson(json['kind']),
      title: json['title'] as String,
    );
  }

  /// A command this code action executes. If a code action provides an edit and
  /// a command, first the edit is executed and then the command.
  final Command? command;

  /// A data entry field that is preserved on a code action between a
  /// `textDocument/codeAction` and a `codeAction/resolve` request.
  /// @since 3.16.0
  final LSPAny? data;

  /// The diagnostics that this code action resolves.
  final List<Diagnostic>? diagnostics;

  /// Marks that the code action cannot currently be applied.
  /// Clients should follow the following guidelines regarding disabled code
  /// actions:
  /// - Disabled code actions are not shown in automatic
  /// [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
  /// code action menus.
  /// - Disabled actions are shown as faded out in the code action menu when the
  /// user requests a more specific type of code action, such as refactorings.
  /// - If the user has a
  /// [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
  /// that auto applies a code action and only disabled code actions are
  /// returned, the client should show the user an error message with `reason` in
  /// the editor.
  /// @since 3.16.0
  final Map<String, dynamic>? disabled;

  /// The workspace edit this code action performs.
  final WorkspaceEdit? edit;

  /// Marks this as a preferred action. Preferred actions are used by the `auto
  /// fix` command and can be targeted by keybindings.
  /// A quick fix should be marked preferred if it properly addresses the
  /// underlying error. A refactoring should be marked preferred if it is the
  /// most reasonable choice of actions to take.
  /// @since 3.15.0
  final bool? isPreferred;

  /// The kind of the code action.
  /// Used to filter code actions.
  final CodeActionKind? kind;

  /// A short, human-readable, title for this code action.
  final String title;

  Map<String, dynamic> toJson() {
    return {
      'command': command?.toJson(),
      'data': data,
      'diagnostics': diagnostics?.map((e) => e.toJson()).toList(),
      'disabled': disabled,
      'edit': edit?.toJson(),
      'isPreferred': isPreferred,
      'kind': kind?.toJson(),
      'title': title,
    };
  }
}

/// Registration options for a {@link CodeActionRequest}.
final class CodeActionRegistrationOptions {
  const CodeActionRegistrationOptions({
    this.codeActionKinds,
    required this.documentSelector,
    this.resolveProvider,
    this.workDoneProgress,
  });

  factory CodeActionRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return CodeActionRegistrationOptions(
      codeActionKinds: json['codeActionKinds'] == null
          ? null
          : (json['codeActionKinds'] as List)
                .map((e) => CodeActionKind.fromJson(e))
                .toList(),
      documentSelector: json['documentSelector'] as DocumentSelector?,
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// CodeActionKinds that this server may return.
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the
  /// server may list out every specific kind they provide.
  final List<CodeActionKind>? codeActionKinds;

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// The server provides support to resolve additional information for a code
  /// action.
  /// @since 3.16.0
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'codeActionKinds': codeActionKinds?.map((e) => e.toJson()).toList(),
      'documentSelector': documentSelector,
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolParams {
  const WorkspaceSymbolParams({
    this.partialResultToken,
    required this.query,
    this.workDoneToken,
  });

  factory WorkspaceSymbolParams.fromJson(Map<String, dynamic> json) {
    return WorkspaceSymbolParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      query: json['query'] as String,
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// A query string to filter symbols by. Clients may send an empty string here
  /// to request all symbols.
  final String query;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'query': query,
      'workDoneToken': workDoneToken,
    };
  }
}

/// A special workspace symbol that supports locations without a range.
/// See also SymbolInformation.
/// @since 3.17.0
final class WorkspaceSymbol {
  const WorkspaceSymbol({
    this.containerName,
    this.data,
    required this.kind,
    required this.location,
    required this.name,
    this.tags,
  });

  factory WorkspaceSymbol.fromJson(Map<String, dynamic> json) {
    return WorkspaceSymbol(
      containerName: json['containerName'] as String?,
      data: json['data'] as LSPAny?,
      kind: SymbolKind.fromJson(json['kind']),
      location: json['location'],
      name: json['name'] as String,
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List).map((e) => SymbolTag.fromJson(e)).toList(),
    );
  }

  /// The name of the symbol containing this symbol. This information is for user
  /// interface purposes (e.g. to render a qualifier in the user interface if
  /// necessary). It can't be used to re-infer a hierarchy for the document
  /// symbols.
  final String? containerName;

  /// A data entry field that is preserved on a workspace symbol between a
  /// workspace symbol request and a workspace symbol resolve request.
  final LSPAny? data;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The location of the symbol. Whether a server is allowed to return a
  /// location without a range depends on the client capability
  /// `workspace.symbol.resolveSupport`.
  /// See SymbolInformation#location for more details.
  final Object? location;

  /// The name of this symbol.
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  final List<SymbolTag>? tags;

  Map<String, dynamic> toJson() {
    return {
      'containerName': containerName,
      'data': data,
      'kind': kind.toJson(),
      'location': location,
      'name': name,
      'tags': tags?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Registration options for a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolRegistrationOptions {
  const WorkspaceSymbolRegistrationOptions({
    this.resolveProvider,
    this.workDoneProgress,
  });

  factory WorkspaceSymbolRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return WorkspaceSymbolRegistrationOptions(
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// The server provides support to resolve additional information for a
  /// workspace symbol.
  /// @since 3.17.0
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link CodeLensRequest}.
final class CodeLensParams {
  const CodeLensParams({
    this.partialResultToken,
    required this.textDocument,
    this.workDoneToken,
  });

  factory CodeLensParams.fromJson(Map<String, dynamic> json) {
    return CodeLensParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The document to request code lens for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// A code lens represents a {@link Command command} that should be shown along
/// with source text, like the number of references, a way to run tests, etc.
/// A code lens is _unresolved_ when no command is associated to it. For
/// performance reasons the creation of a code lens and resolving should be
/// done in two stages.
final class CodeLens {
  const CodeLens({this.command, this.data, required this.range});

  factory CodeLens.fromJson(Map<String, dynamic> json) {
    return CodeLens(
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      data: json['data'] as LSPAny?,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// The command this code lens represents.
  final Command? command;

  /// A data entry field that is preserved on a code lens item between a {@link
  /// CodeLensRequest} and a {@link CodeLensResolveRequest}
  final LSPAny? data;

  /// The range in which this code lens is valid. Should only span a single line.
  final Range range;

  Map<String, dynamic> toJson() {
    return {
      'command': command?.toJson(),
      'data': data,
      'range': range.toJson(),
    };
  }
}

/// Registration options for a {@link CodeLensRequest}.
final class CodeLensRegistrationOptions {
  const CodeLensRegistrationOptions({
    required this.documentSelector,
    this.resolveProvider,
    this.workDoneProgress,
  });

  factory CodeLensRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return CodeLensRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// Code lens has a resolve provider as well.
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link DocumentLinkRequest}.
final class DocumentLinkParams {
  const DocumentLinkParams({
    this.partialResultToken,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentLinkParams.fromJson(Map<String, dynamic> json) {
    return DocumentLinkParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  /// The document to provide document links for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'partialResultToken': partialResultToken,
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// A document link is a range in a text document that links to an internal or
/// external resource, like another text document or a web site.
final class DocumentLink {
  const DocumentLink({
    this.data,
    required this.range,
    this.target,
    this.tooltip,
  });

  factory DocumentLink.fromJson(Map<String, dynamic> json) {
    return DocumentLink(
      data: json['data'] as LSPAny?,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      target: json['target'] as String?,
      tooltip: json['tooltip'] as String?,
    );
  }

  /// A data entry field that is preserved on a document link between a
  /// DocumentLinkRequest and a DocumentLinkResolveRequest.
  final LSPAny? data;

  /// The range this link applies to.
  final Range range;

  /// The uri this link points to. If missing a resolve request is sent later.
  final String? target;

  /// The tooltip text when you hover over this link.
  /// If a tooltip is provided, is will be displayed in a string that includes
  /// instructions on how to trigger the link, such as `{0} (ctrl + click)`. The
  /// specific instructions vary depending on OS, user settings, and
  /// localization.
  /// @since 3.15.0
  final String? tooltip;

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'range': range.toJson(),
      'target': target,
      'tooltip': tooltip,
    };
  }
}

/// Registration options for a {@link DocumentLinkRequest}.
final class DocumentLinkRegistrationOptions {
  const DocumentLinkRegistrationOptions({
    required this.documentSelector,
    this.resolveProvider,
    this.workDoneProgress,
  });

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return DocumentLinkRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// Document links have a resolve provider as well.
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link DocumentFormattingRequest}.
final class DocumentFormattingParams {
  const DocumentFormattingParams({
    required this.options,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentFormattingParams.fromJson(Map<String, dynamic> json) {
    return DocumentFormattingParams(
      options: FormattingOptions.fromJson(
        json['options'] as Map<String, dynamic>,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The format options.
  final FormattingOptions options;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'options': options.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Registration options for a {@link DocumentFormattingRequest}.
final class DocumentFormattingRegistrationOptions {
  const DocumentFormattingRegistrationOptions({
    required this.documentSelector,
    this.workDoneProgress,
  });

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentFormattingRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingParams {
  const DocumentRangeFormattingParams({
    required this.options,
    required this.range,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentRangeFormattingParams.fromJson(Map<String, dynamic> json) {
    return DocumentRangeFormattingParams(
      options: FormattingOptions.fromJson(
        json['options'] as Map<String, dynamic>,
      ),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The format options
  final FormattingOptions options;

  /// The range to format
  final Range range;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'options': options.toJson(),
      'range': range.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Registration options for a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingRegistrationOptions {
  const DocumentRangeFormattingRegistrationOptions({
    required this.documentSelector,
    this.rangesSupport,
    this.workDoneProgress,
  });

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentRangeFormattingRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      rangesSupport: json['rangesSupport'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// Whether the server supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  final bool? rangesSupport;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'rangesSupport': rangesSupport,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The parameters of a {@link DocumentRangesFormattingRequest}.
/// @since 3.18.0 @proposed
final class DocumentRangesFormattingParams {
  const DocumentRangesFormattingParams({
    required this.options,
    required this.ranges,
    required this.textDocument,
    this.workDoneToken,
  });

  factory DocumentRangesFormattingParams.fromJson(Map<String, dynamic> json) {
    return DocumentRangesFormattingParams(
      options: FormattingOptions.fromJson(
        json['options'] as Map<String, dynamic>,
      ),
      ranges: (json['ranges'] as List)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The format options
  final FormattingOptions options;

  /// The ranges to format
  final List<Range> ranges;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'options': options.toJson(),
      'ranges': ranges.map((e) => e.toJson()).toList(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingParams {
  const DocumentOnTypeFormattingParams({
    required this.ch,
    required this.options,
    required this.position,
    required this.textDocument,
  });

  factory DocumentOnTypeFormattingParams.fromJson(Map<String, dynamic> json) {
    return DocumentOnTypeFormattingParams(
      ch: json['ch'] as String,
      options: FormattingOptions.fromJson(
        json['options'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The character that has been typed that triggered the formatting on type
  /// request. That is not necessarily the last character that got inserted into
  /// the document since the client could auto insert characters as well (e.g.
  /// like automatic brace completion).
  final String ch;

  /// The formatting options.
  final FormattingOptions options;

  /// The position around which the on type formatting should happen. This is not
  /// necessarily the exact position where the character denoted by the property
  /// `ch` got typed.
  final Position position;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    return {
      'ch': ch,
      'options': options.toJson(),
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

/// Registration options for a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingRegistrationOptions {
  const DocumentOnTypeFormattingRegistrationOptions({
    required this.documentSelector,
    required this.firstTriggerCharacter,
    this.moreTriggerCharacter,
  });

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentOnTypeFormattingRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      firstTriggerCharacter: json['firstTriggerCharacter'] as String,
      moreTriggerCharacter: json['moreTriggerCharacter'] == null
          ? null
          : (json['moreTriggerCharacter'] as List)
                .map((e) => e as String)
                .toList(),
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// A character on which formatting should be triggered, like `{`.
  final String firstTriggerCharacter;

  /// More trigger characters.
  final List<String>? moreTriggerCharacter;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'firstTriggerCharacter': firstTriggerCharacter,
      'moreTriggerCharacter': moreTriggerCharacter,
    };
  }
}

/// The parameters of a {@link RenameRequest}.
final class RenameParams {
  const RenameParams({
    required this.newName,
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory RenameParams.fromJson(Map<String, dynamic> json) {
    return RenameParams(
      newName: json['newName'] as String,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The new name of the symbol. If the given name is not valid the request must
  /// return a {@link ResponseError} with an appropriate message set.
  final String newName;

  /// The position at which this request was sent.
  final Position position;

  /// The document to rename.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'newName': newName,
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// Registration options for a {@link RenameRequest}.
final class RenameRegistrationOptions {
  const RenameRegistrationOptions({
    required this.documentSelector,
    this.prepareProvider,
    this.workDoneProgress,
  });

  factory RenameRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return RenameRegistrationOptions(
      documentSelector: json['documentSelector'] as DocumentSelector?,
      prepareProvider: json['prepareProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final DocumentSelector? documentSelector;

  /// Renames should be checked and tested before being executed.
  /// @since version 3.12.0
  final bool? prepareProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'documentSelector': documentSelector,
      'prepareProvider': prepareProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

final class PrepareRenameParams {
  const PrepareRenameParams({
    required this.position,
    required this.textDocument,
    this.workDoneToken,
  });

  factory PrepareRenameParams.fromJson(Map<String, dynamic> json) {
    return PrepareRenameParams(
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

/// The parameters of a {@link ExecuteCommandRequest}.
final class ExecuteCommandParams {
  const ExecuteCommandParams({
    this.arguments,
    required this.command,
    this.workDoneToken,
  });

  factory ExecuteCommandParams.fromJson(Map<String, dynamic> json) {
    return ExecuteCommandParams(
      arguments: json['arguments'] == null
          ? null
          : (json['arguments'] as List).map((e) => e as LSPAny).toList(),
      command: json['command'] as String,
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// Arguments that the command should be invoked with.
  final List<LSPAny>? arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'arguments': arguments,
      'command': command,
      'workDoneToken': workDoneToken,
    };
  }
}

/// Registration options for a {@link ExecuteCommandRequest}.
final class ExecuteCommandRegistrationOptions {
  const ExecuteCommandRegistrationOptions({
    required this.commands,
    this.workDoneProgress,
  });

  factory ExecuteCommandRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return ExecuteCommandRegistrationOptions(
      commands: (json['commands'] as List).map((e) => e as String).toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// The commands to be executed on the server
  final List<String> commands;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'commands': commands, 'workDoneProgress': workDoneProgress};
  }
}

/// The parameters passed via an apply workspace edit request.
final class ApplyWorkspaceEditParams {
  const ApplyWorkspaceEditParams({required this.edit, this.label});

  factory ApplyWorkspaceEditParams.fromJson(Map<String, dynamic> json) {
    return ApplyWorkspaceEditParams(
      edit: WorkspaceEdit.fromJson(json['edit'] as Map<String, dynamic>),
      label: json['label'] as String?,
    );
  }

  /// The edits to apply.
  final WorkspaceEdit edit;

  /// An optional label of the workspace edit. This label is presented in the
  /// user interface for example on an undo stack to undo the workspace edit.
  final String? label;

  Map<String, dynamic> toJson() {
    return {'edit': edit.toJson(), 'label': label};
  }
}

/// The result returned from the apply workspace edit request.
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
final class ApplyWorkspaceEditResult {
  const ApplyWorkspaceEditResult({
    required this.applied,
    this.failedChange,
    this.failureReason,
  });

  factory ApplyWorkspaceEditResult.fromJson(Map<String, dynamic> json) {
    return ApplyWorkspaceEditResult(
      applied: json['applied'] as bool,
      failedChange: json['failedChange'] as int?,
      failureReason: json['failureReason'] as String?,
    );
  }

  /// Indicates whether the edit was applied or not.
  final bool applied;

  /// Depending on the client's failure handling strategy `failedChange` might
  /// contain the index of the change that failed. This property is only
  /// available if the client signals a `failureHandlingStrategy` in its client
  /// capabilities.
  final int? failedChange;

  /// An optional textual description for why the edit was not applied. This may
  /// be used by the server for diagnostic logging or to provide a suitable error
  /// for a request that triggered the edit.
  final String? failureReason;

  Map<String, dynamic> toJson() {
    return {
      'applied': applied,
      'failedChange': failedChange,
      'failureReason': failureReason,
    };
  }
}

final class WorkDoneProgressBegin {
  const WorkDoneProgressBegin({
    this.cancellable,
    required this.kind,
    this.message,
    this.percentage,
    required this.title,
  });

  factory WorkDoneProgressBegin.fromJson(Map<String, dynamic> json) {
    return WorkDoneProgressBegin(
      cancellable: json['cancellable'] as bool?,
      kind: json['kind'] as String,
      message: json['message'] as String?,
      percentage: json['percentage'] as int?,
      title: json['title'] as String,
    );
  }

  /// Controls if a cancel button should show to allow the user to cancel the
  /// long running operation. Clients that don't support cancellation are allowed
  /// to ignore the setting.
  final bool? cancellable;

  final String kind;

  /// Optional, more detailed associated progress message. Contains complementary
  /// information to the `title`.
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep". If
  /// unset, the previous progress message (if any) is still valid.
  final String? message;

  /// Optional progress percentage to display (value 100 is considered 100%). If
  /// not provided infinite progress is assumed and clients are allowed to ignore
  /// the `percentage` value in subsequent report notifications.
  /// The value should be steadily rising. Clients are free to ignore values that
  /// are not following this rule. The value range is [0, 100].
  final int? percentage;

  /// Mandatory title of the progress operation. Used to briefly inform about the
  /// kind of operation being performed.
  /// Examples: "Indexing" or "Linking dependencies".
  final String title;

  Map<String, dynamic> toJson() {
    return {
      'cancellable': cancellable,
      'kind': kind,
      'message': message,
      'percentage': percentage,
      'title': title,
    };
  }
}

final class WorkDoneProgressReport {
  const WorkDoneProgressReport({
    this.cancellable,
    required this.kind,
    this.message,
    this.percentage,
  });

  factory WorkDoneProgressReport.fromJson(Map<String, dynamic> json) {
    return WorkDoneProgressReport(
      cancellable: json['cancellable'] as bool?,
      kind: json['kind'] as String,
      message: json['message'] as String?,
      percentage: json['percentage'] as int?,
    );
  }

  /// Controls enablement state of a cancel button.
  /// Clients that don't support cancellation or don't support controlling the
  /// button's enablement state are allowed to ignore the property.
  final bool? cancellable;

  final String kind;

  /// Optional, more detailed associated progress message. Contains complementary
  /// information to the `title`.
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep". If
  /// unset, the previous progress message (if any) is still valid.
  final String? message;

  /// Optional progress percentage to display (value 100 is considered 100%). If
  /// not provided infinite progress is assumed and clients are allowed to ignore
  /// the `percentage` value in subsequent report notifications.
  /// The value should be steadily rising. Clients are free to ignore values that
  /// are not following this rule. The value range is [0, 100].
  final int? percentage;

  Map<String, dynamic> toJson() {
    return {
      'cancellable': cancellable,
      'kind': kind,
      'message': message,
      'percentage': percentage,
    };
  }
}

final class WorkDoneProgressEnd {
  const WorkDoneProgressEnd({required this.kind, this.message});

  factory WorkDoneProgressEnd.fromJson(Map<String, dynamic> json) {
    return WorkDoneProgressEnd(
      kind: json['kind'] as String,
      message: json['message'] as String?,
    );
  }

  final String kind;

  /// Optional, a final message indicating to for example indicate the outcome of
  /// the operation.
  final String? message;

  Map<String, dynamic> toJson() {
    return {'kind': kind, 'message': message};
  }
}

final class SetTraceParams {
  const SetTraceParams({required this.value});

  factory SetTraceParams.fromJson(Map<String, dynamic> json) {
    return SetTraceParams(value: TraceValues.fromJson(json['value']));
  }

  final TraceValues value;

  Map<String, dynamic> toJson() {
    return {'value': value.toJson()};
  }
}

final class LogTraceParams {
  const LogTraceParams({required this.message, this.verbose});

  factory LogTraceParams.fromJson(Map<String, dynamic> json) {
    return LogTraceParams(
      message: json['message'] as String,
      verbose: json['verbose'] as String?,
    );
  }

  final String message;

  final String? verbose;

  Map<String, dynamic> toJson() {
    return {'message': message, 'verbose': verbose};
  }
}

final class CancelParams {
  const CancelParams({required this.id});

  factory CancelParams.fromJson(Map<String, dynamic> json) {
    return CancelParams(id: json['id']);
  }

  /// The request id to cancel.
  final Object? id;

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}

final class ProgressParams {
  const ProgressParams({required this.token, required this.value});

  factory ProgressParams.fromJson(Map<String, dynamic> json) {
    return ProgressParams(
      token: json['token'] as ProgressToken,
      value: json['value'] as LSPAny,
    );
  }

  /// The progress token provided by the client or server.
  final ProgressToken token;

  /// The progress data.
  final LSPAny value;

  Map<String, dynamic> toJson() {
    return {'token': token, 'value': value};
  }
}

/// A parameter literal used in requests to pass a text document and a position
/// inside that document.
final class TextDocumentPositionParams {
  const TextDocumentPositionParams({
    required this.position,
    required this.textDocument,
  });

  factory TextDocumentPositionParams.fromJson(Map<String, dynamic> json) {
    return TextDocumentPositionParams(
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'textDocument': textDocument.toJson(),
    };
  }
}

final class WorkDoneProgressParams {
  const WorkDoneProgressParams({this.workDoneToken});

  factory WorkDoneProgressParams.fromJson(Map<String, dynamic> json) {
    return WorkDoneProgressParams(
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {'workDoneToken': workDoneToken};
  }
}

final class PartialResultParams {
  const PartialResultParams({this.partialResultToken});

  factory PartialResultParams.fromJson(Map<String, dynamic> json) {
    return PartialResultParams(
      partialResultToken: json['partialResultToken'] as ProgressToken?,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  Map<String, dynamic> toJson() {
    return {'partialResultToken': partialResultToken};
  }
}

/// Represents the connection of two locations. Provides additional metadata
/// over normal {@link Location locations}, including an origin range.
final class LocationLink {
  const LocationLink({
    this.originSelectionRange,
    required this.targetRange,
    required this.targetSelectionRange,
    required this.targetUri,
  });

  factory LocationLink.fromJson(Map<String, dynamic> json) {
    return LocationLink(
      originSelectionRange: json['originSelectionRange'] == null
          ? null
          : Range.fromJson(
              json['originSelectionRange'] as Map<String, dynamic>,
            ),
      targetRange: Range.fromJson(json['targetRange'] as Map<String, dynamic>),
      targetSelectionRange: Range.fromJson(
        json['targetSelectionRange'] as Map<String, dynamic>,
      ),
      targetUri: json['targetUri'] as String,
    );
  }

  /// Span of the origin of this link.
  /// Used as the underlined span for mouse interaction. Defaults to the word
  /// range at the definition position.
  final Range? originSelectionRange;

  /// The full target range of this link. If the target for example is a symbol
  /// then target range is the range enclosing this symbol not including
  /// leading/trailing whitespace but everything else like comments. This
  /// information is typically used to highlight the range in the editor.
  final Range targetRange;

  /// The range that should be selected and revealed when this link is being
  /// followed, e.g the name of a function. Must be contained by the
  /// `targetRange`. See also `DocumentSymbol#range`
  final Range targetSelectionRange;

  /// The target resource identifier of this link.
  final String targetUri;

  Map<String, dynamic> toJson() {
    return {
      'originSelectionRange': originSelectionRange?.toJson(),
      'targetRange': targetRange.toJson(),
      'targetSelectionRange': targetSelectionRange.toJson(),
      'targetUri': targetUri,
    };
  }
}

/// A range in a text document expressed as (zero-based) start and end
/// positions.
/// If you want to specify a range that contains a line including the line
/// ending character(s) then use an end position denoting the start of the next
/// line. For example: ```ts { start: { line: 5, character: 23 } end : { line
/// 6, character : 0 } } ```
final class Range {
  const Range({required this.end, required this.start});

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(
      end: Position.fromJson(json['end'] as Map<String, dynamic>),
      start: Position.fromJson(json['start'] as Map<String, dynamic>),
    );
  }

  /// The range's end position.
  final Position end;

  /// The range's start position.
  final Position start;

  Map<String, dynamic> toJson() {
    return {'end': end.toJson(), 'start': start.toJson()};
  }
}

final class ImplementationOptions {
  const ImplementationOptions({this.workDoneProgress});

  factory ImplementationOptions.fromJson(Map<String, dynamic> json) {
    return ImplementationOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Static registration options to be returned in the initialize request.
final class StaticRegistrationOptions {
  const StaticRegistrationOptions({this.id});

  factory StaticRegistrationOptions.fromJson(Map<String, dynamic> json) {
    return StaticRegistrationOptions(id: json['id'] as String?);
  }

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}

final class TypeDefinitionOptions {
  const TypeDefinitionOptions({this.workDoneProgress});

  factory TypeDefinitionOptions.fromJson(Map<String, dynamic> json) {
    return TypeDefinitionOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// The workspace folder change event.
final class WorkspaceFoldersChangeEvent {
  const WorkspaceFoldersChangeEvent({
    required this.added,
    required this.removed,
  });

  factory WorkspaceFoldersChangeEvent.fromJson(Map<String, dynamic> json) {
    return WorkspaceFoldersChangeEvent(
      added: (json['added'] as List)
          .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
      removed: (json['removed'] as List)
          .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The array of added workspace folders
  final List<WorkspaceFolder> added;

  /// The array of the removed workspace folders
  final List<WorkspaceFolder> removed;

  Map<String, dynamic> toJson() {
    return {
      'added': added.map((e) => e.toJson()).toList(),
      'removed': removed.map((e) => e.toJson()).toList(),
    };
  }
}

final class ConfigurationItem {
  const ConfigurationItem({this.scopeUri, this.section});

  factory ConfigurationItem.fromJson(Map<String, dynamic> json) {
    return ConfigurationItem(
      scopeUri: json['scopeUri'] as String?,
      section: json['section'] as String?,
    );
  }

  /// The scope to get the configuration section for.
  final String? scopeUri;

  /// The configuration section asked for.
  final String? section;

  Map<String, dynamic> toJson() {
    return {'scopeUri': scopeUri, 'section': section};
  }
}

/// A literal to identify a text document in the client.
final class TextDocumentIdentifier {
  const TextDocumentIdentifier({required this.uri});

  factory TextDocumentIdentifier.fromJson(Map<String, dynamic> json) {
    return TextDocumentIdentifier(uri: json['uri'] as String);
  }

  /// The text document's uri.
  final String uri;

  Map<String, dynamic> toJson() {
    return {'uri': uri};
  }
}

/// Represents a color in RGBA space.
final class Color {
  const Color({
    required this.alpha,
    required this.blue,
    required this.green,
    required this.red,
  });

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      alpha: json['alpha'] as double,
      blue: json['blue'] as double,
      green: json['green'] as double,
      red: json['red'] as double,
    );
  }

  /// The alpha component of this color in the range [0-1].
  final double alpha;

  /// The blue component of this color in the range [0-1].
  final double blue;

  /// The green component of this color in the range [0-1].
  final double green;

  /// The red component of this color in the range [0-1].
  final double red;

  Map<String, dynamic> toJson() {
    return {'alpha': alpha, 'blue': blue, 'green': green, 'red': red};
  }
}

final class DocumentColorOptions {
  const DocumentColorOptions({this.workDoneProgress});

  factory DocumentColorOptions.fromJson(Map<String, dynamic> json) {
    return DocumentColorOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

final class FoldingRangeOptions {
  const FoldingRangeOptions({this.workDoneProgress});

  factory FoldingRangeOptions.fromJson(Map<String, dynamic> json) {
    return FoldingRangeOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

final class DeclarationOptions {
  const DeclarationOptions({this.workDoneProgress});

  factory DeclarationOptions.fromJson(Map<String, dynamic> json) {
    return DeclarationOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
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
final class Position {
  const Position({required this.character, required this.line});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      character: json['character'] as int,
      line: json['line'] as int,
    );
  }

  /// Character offset on a line in a document (zero-based).
  /// The meaning of this offset is determined by the negotiated
  /// `PositionEncodingKind`.
  /// If the character value is greater than the line length it defaults back to
  /// the line length.
  final int character;

  /// Line position in a document (zero-based).
  /// If a line number is greater than the number of lines in a document, it
  /// defaults back to the number of lines in the document. If a line number is
  /// negative, it defaults to 0.
  final int line;

  Map<String, dynamic> toJson() {
    return {'character': character, 'line': line};
  }
}

final class SelectionRangeOptions {
  const SelectionRangeOptions({this.workDoneProgress});

  factory SelectionRangeOptions.fromJson(Map<String, dynamic> json) {
    return SelectionRangeOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Call hierarchy options used during static registration.
/// @since 3.16.0
final class CallHierarchyOptions {
  const CallHierarchyOptions({this.workDoneProgress});

  factory CallHierarchyOptions.fromJson(Map<String, dynamic> json) {
    return CallHierarchyOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// @since 3.16.0
final class SemanticTokensOptions {
  const SemanticTokensOptions({
    this.full,
    required this.legend,
    this.range,
    this.workDoneProgress,
  });

  factory SemanticTokensOptions.fromJson(Map<String, dynamic> json) {
    return SemanticTokensOptions(
      full: json['full'],
      legend: SemanticTokensLegend.fromJson(
        json['legend'] as Map<String, dynamic>,
      ),
      range: json['range'],
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// Server supports providing semantic tokens for a full document.
  final Object? full;

  /// The legend used by the server
  final SemanticTokensLegend legend;

  /// Server supports providing semantic tokens for a specific range of a
  /// document.
  final Object? range;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'full': full,
      'legend': legend.toJson(),
      'range': range,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// @since 3.16.0
final class SemanticTokensEdit {
  const SemanticTokensEdit({
    this.data,
    required this.deleteCount,
    required this.start,
  });

  factory SemanticTokensEdit.fromJson(Map<String, dynamic> json) {
    return SemanticTokensEdit(
      data: json['data'] == null
          ? null
          : (json['data'] as List).map((e) => e as int).toList(),
      deleteCount: json['deleteCount'] as int,
      start: json['start'] as int,
    );
  }

  /// The elements to insert.
  final List<int>? data;

  /// The count of elements to remove.
  final int deleteCount;

  /// The start offset of the edit.
  final int start;

  Map<String, dynamic> toJson() {
    return {'data': data, 'deleteCount': deleteCount, 'start': start};
  }
}

final class LinkedEditingRangeOptions {
  const LinkedEditingRangeOptions({this.workDoneProgress});

  factory LinkedEditingRangeOptions.fromJson(Map<String, dynamic> json) {
    return LinkedEditingRangeOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Represents information on a file/folder create.
/// @since 3.16.0
final class FileCreate {
  const FileCreate({required this.uri});

  factory FileCreate.fromJson(Map<String, dynamic> json) {
    return FileCreate(uri: json['uri'] as String);
  }

  /// A file:// URI for the location of the file/folder being created.
  final String uri;

  Map<String, dynamic> toJson() {
    return {'uri': uri};
  }
}

/// Describes textual changes on a text document. A TextDocumentEdit describes
/// all changes on a document version Si and after they are applied move the
/// document to version Si+1. So the creator of a TextDocumentEdit doesn't need
/// to sort the array of edits or do any kind of ordering. However the edits
/// must be non overlapping.
final class TextDocumentEdit {
  const TextDocumentEdit({required this.edits, required this.textDocument});

  factory TextDocumentEdit.fromJson(Map<String, dynamic> json) {
    return TextDocumentEdit(
      edits: (json['edits'] as List).cast<Object?>(),
      textDocument: OptionalVersionedTextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );
  }

  /// The edits to be applied.
  /// @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
  /// client capability.
  final List<Object?> edits;

  /// The text document to change.
  final OptionalVersionedTextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    return {'edits': edits, 'textDocument': textDocument.toJson()};
  }
}

/// Create file operation.
final class CreateFile {
  const CreateFile({
    this.annotationId,
    required this.kind,
    this.options,
    required this.uri,
  });

  factory CreateFile.fromJson(Map<String, dynamic> json) {
    return CreateFile(
      annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
      kind: json['kind'] as String,
      options: json['options'] == null
          ? null
          : CreateFileOptions.fromJson(json['options'] as Map<String, dynamic>),
      uri: json['uri'] as String,
    );
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  final ChangeAnnotationIdentifier? annotationId;

  /// A create
  final String kind;

  /// Additional options
  final CreateFileOptions? options;

  /// The resource to create.
  final String uri;

  Map<String, dynamic> toJson() {
    return {
      'annotationId': annotationId,
      'kind': kind,
      'options': options?.toJson(),
      'uri': uri,
    };
  }
}

/// Rename file operation
final class RenameFile {
  const RenameFile({
    this.annotationId,
    required this.kind,
    required this.newUri,
    required this.oldUri,
    this.options,
  });

  factory RenameFile.fromJson(Map<String, dynamic> json) {
    return RenameFile(
      annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
      kind: json['kind'] as String,
      newUri: json['newUri'] as String,
      oldUri: json['oldUri'] as String,
      options: json['options'] == null
          ? null
          : RenameFileOptions.fromJson(json['options'] as Map<String, dynamic>),
    );
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  final ChangeAnnotationIdentifier? annotationId;

  /// A rename
  final String kind;

  /// The new location.
  final String newUri;

  /// The old (existing) location.
  final String oldUri;

  /// Rename options.
  final RenameFileOptions? options;

  Map<String, dynamic> toJson() {
    return {
      'annotationId': annotationId,
      'kind': kind,
      'newUri': newUri,
      'oldUri': oldUri,
      'options': options?.toJson(),
    };
  }
}

/// Delete file operation
final class DeleteFile {
  const DeleteFile({
    this.annotationId,
    required this.kind,
    this.options,
    required this.uri,
  });

  factory DeleteFile.fromJson(Map<String, dynamic> json) {
    return DeleteFile(
      annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
      kind: json['kind'] as String,
      options: json['options'] == null
          ? null
          : DeleteFileOptions.fromJson(json['options'] as Map<String, dynamic>),
      uri: json['uri'] as String,
    );
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  final ChangeAnnotationIdentifier? annotationId;

  /// A delete
  final String kind;

  /// Delete options.
  final DeleteFileOptions? options;

  /// The file to delete.
  final String uri;

  Map<String, dynamic> toJson() {
    return {
      'annotationId': annotationId,
      'kind': kind,
      'options': options?.toJson(),
      'uri': uri,
    };
  }
}

/// Additional information that describes document changes.
/// @since 3.16.0
final class ChangeAnnotation {
  const ChangeAnnotation({
    this.description,
    required this.label,
    this.needsConfirmation,
  });

  factory ChangeAnnotation.fromJson(Map<String, dynamic> json) {
    return ChangeAnnotation(
      description: json['description'] as String?,
      label: json['label'] as String,
      needsConfirmation: json['needsConfirmation'] as bool?,
    );
  }

  /// A human-readable string which is rendered less prominent in the user
  /// interface.
  final String? description;

  /// A human-readable string describing the actual change. The string is
  /// rendered prominent in the user interface.
  final String label;

  /// A flag which indicates that user confirmation is needed before applying the
  /// change.
  final bool? needsConfirmation;

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'label': label,
      'needsConfirmation': needsConfirmation,
    };
  }
}

/// A filter to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
final class FileOperationFilter {
  const FileOperationFilter({required this.pattern, this.scheme});

  factory FileOperationFilter.fromJson(Map<String, dynamic> json) {
    return FileOperationFilter(
      pattern: FileOperationPattern.fromJson(
        json['pattern'] as Map<String, dynamic>,
      ),
      scheme: json['scheme'] as String?,
    );
  }

  /// The actual file operation pattern.
  final FileOperationPattern pattern;

  /// A Uri scheme like `file` or `untitled`.
  final String? scheme;

  Map<String, dynamic> toJson() {
    return {'pattern': pattern.toJson(), 'scheme': scheme};
  }
}

/// Represents information on a file/folder rename.
/// @since 3.16.0
final class FileRename {
  const FileRename({required this.newUri, required this.oldUri});

  factory FileRename.fromJson(Map<String, dynamic> json) {
    return FileRename(
      newUri: json['newUri'] as String,
      oldUri: json['oldUri'] as String,
    );
  }

  /// A file:// URI for the new location of the file/folder being renamed.
  final String newUri;

  /// A file:// URI for the original location of the file/folder being renamed.
  final String oldUri;

  Map<String, dynamic> toJson() {
    return {'newUri': newUri, 'oldUri': oldUri};
  }
}

/// Represents information on a file/folder delete.
/// @since 3.16.0
final class FileDelete {
  const FileDelete({required this.uri});

  factory FileDelete.fromJson(Map<String, dynamic> json) {
    return FileDelete(uri: json['uri'] as String);
  }

  /// A file:// URI for the location of the file/folder being deleted.
  final String uri;

  Map<String, dynamic> toJson() {
    return {'uri': uri};
  }
}

final class MonikerOptions {
  const MonikerOptions({this.workDoneProgress});

  factory MonikerOptions.fromJson(Map<String, dynamic> json) {
    return MonikerOptions(workDoneProgress: json['workDoneProgress'] as bool?);
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Type hierarchy options used during static registration.
/// @since 3.17.0
final class TypeHierarchyOptions {
  const TypeHierarchyOptions({this.workDoneProgress});

  factory TypeHierarchyOptions.fromJson(Map<String, dynamic> json) {
    return TypeHierarchyOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// @since 3.17.0
final class InlineValueContext {
  const InlineValueContext({
    required this.frameId,
    required this.stoppedLocation,
  });

  factory InlineValueContext.fromJson(Map<String, dynamic> json) {
    return InlineValueContext(
      frameId: json['frameId'] as int,
      stoppedLocation: Range.fromJson(
        json['stoppedLocation'] as Map<String, dynamic>,
      ),
    );
  }

  /// The stack frame (as a DAP Id) where the execution has stopped.
  final int frameId;

  /// The document range where execution has stopped. Typically the end position
  /// of the range denotes the line where the inline values are shown.
  final Range stoppedLocation;

  Map<String, dynamic> toJson() {
    return {'frameId': frameId, 'stoppedLocation': stoppedLocation.toJson()};
  }
}

/// Provide inline value as text.
/// @since 3.17.0
final class InlineValueText {
  const InlineValueText({required this.range, required this.text});

  factory InlineValueText.fromJson(Map<String, dynamic> json) {
    return InlineValueText(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      text: json['text'] as String,
    );
  }

  /// The document range for which the inline value applies.
  final Range range;

  /// The text of the inline value.
  final String text;

  Map<String, dynamic> toJson() {
    return {'range': range.toJson(), 'text': text};
  }
}

/// Provide inline value through a variable lookup. If only a range is
/// specified, the variable name will be extracted from the underlying
/// document. An optional variable name can be used to override the extracted
/// name.
/// @since 3.17.0
final class InlineValueVariableLookup {
  const InlineValueVariableLookup({
    required this.caseSensitiveLookup,
    required this.range,
    this.variableName,
  });

  factory InlineValueVariableLookup.fromJson(Map<String, dynamic> json) {
    return InlineValueVariableLookup(
      caseSensitiveLookup: json['caseSensitiveLookup'] as bool,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      variableName: json['variableName'] as String?,
    );
  }

  /// How to perform the lookup.
  final bool caseSensitiveLookup;

  /// The document range for which the inline value applies. The range is used to
  /// extract the variable name from the underlying document.
  final Range range;

  /// If specified the name of the variable to look up.
  final String? variableName;

  Map<String, dynamic> toJson() {
    return {
      'caseSensitiveLookup': caseSensitiveLookup,
      'range': range.toJson(),
      'variableName': variableName,
    };
  }
}

/// Provide an inline value through an expression evaluation. If only a range
/// is specified, the expression will be extracted from the underlying
/// document. An optional expression can be used to override the extracted
/// expression.
/// @since 3.17.0
final class InlineValueEvaluatableExpression {
  const InlineValueEvaluatableExpression({
    this.expression,
    required this.range,
  });

  factory InlineValueEvaluatableExpression.fromJson(Map<String, dynamic> json) {
    return InlineValueEvaluatableExpression(
      expression: json['expression'] as String?,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// If specified the expression overrides the extracted expression.
  final String? expression;

  /// The document range for which the inline value applies. The range is used to
  /// extract the evaluatable expression from the underlying document.
  final Range range;

  Map<String, dynamic> toJson() {
    return {'expression': expression, 'range': range.toJson()};
  }
}

/// Inline value options used during static registration.
/// @since 3.17.0
final class InlineValueOptions {
  const InlineValueOptions({this.workDoneProgress});

  factory InlineValueOptions.fromJson(Map<String, dynamic> json) {
    return InlineValueOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// An inlay hint label part allows for interactive and composite labels of
/// inlay hints.
/// @since 3.17.0
final class InlayHintLabelPart {
  const InlayHintLabelPart({
    this.command,
    this.location,
    this.tooltip,
    required this.value,
  });

  factory InlayHintLabelPart.fromJson(Map<String, dynamic> json) {
    return InlayHintLabelPart(
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      tooltip: json['tooltip'],
      value: json['value'] as String,
    );
  }

  /// An optional command for this label part.
  /// Depending on the client capability `inlayHint.resolveSupport` clients might
  /// resolve this property late using the resolve request.
  final Command? command;

  /// An optional source code location that represents this label part.
  /// The editor will use this location for the hover and for code navigation
  /// features: This part will become a clickable link that resolves to the
  /// definition of the symbol at the given location (not necessarily the
  /// location itself), it shows the hover that shows at the given location, and
  /// it shows a context menu with further code navigation commands.
  /// Depending on the client capability `inlayHint.resolveSupport` clients might
  /// resolve this property late using the resolve request.
  final Location? location;

  /// The tooltip text when you hover over this label part. Depending on the
  /// client capability `inlayHint.resolveSupport` clients might resolve this
  /// property late using the resolve request.
  final Object? tooltip;

  /// The value of this label part.
  final String value;

  Map<String, dynamic> toJson() {
    return {
      'command': command?.toJson(),
      'location': location?.toJson(),
      'tooltip': tooltip,
      'value': value,
    };
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
final class MarkupContent {
  const MarkupContent({required this.kind, required this.value});

  factory MarkupContent.fromJson(Map<String, dynamic> json) {
    return MarkupContent(
      kind: MarkupKind.fromJson(json['kind']),
      value: json['value'] as String,
    );
  }

  /// The type of the Markup
  final MarkupKind kind;

  /// The content itself
  final String value;

  Map<String, dynamic> toJson() {
    return {'kind': kind.toJson(), 'value': value};
  }
}

/// Inlay hint options used during static registration.
/// @since 3.17.0
final class InlayHintOptions {
  const InlayHintOptions({this.resolveProvider, this.workDoneProgress});

  factory InlayHintOptions.fromJson(Map<String, dynamic> json) {
    return InlayHintOptions(
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// The server provides support to resolve additional information for an inlay
  /// hint item.
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// A full diagnostic report with a set of related documents.
/// @since 3.17.0
final class RelatedFullDocumentDiagnosticReport {
  const RelatedFullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    this.relatedDocuments,
    this.resultId,
  });

  factory RelatedFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) {
    return RelatedFullDocumentDiagnosticReport(
      items: (json['items'] as List)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      kind: json['kind'] as String,
      relatedDocuments: json['relatedDocuments'] == null
          ? null
          : (json['relatedDocuments'] as Map).cast<String, Object?>(),
      resultId: json['resultId'] as String?,
    );
  }

  /// The actual items.
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  final String kind;

  /// Diagnostics of related documents. This information is useful in programming
  /// languages where code in a file A can generate diagnostics in a file B which
  /// A depends on. An example of such a language is C/C++ where marco
  /// definitions in a file a.cpp and result in errors in a header file b.hpp.
  /// @since 3.17.0
  final Map<String, Object?>? relatedDocuments;

  /// An optional result id. If provided it will be sent on the next diagnostic
  /// request for the same document.
  final String? resultId;

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'kind': kind,
      'relatedDocuments': relatedDocuments,
      'resultId': resultId,
    };
  }
}

/// An unchanged diagnostic report with a set of related documents.
/// @since 3.17.0
final class RelatedUnchangedDocumentDiagnosticReport {
  const RelatedUnchangedDocumentDiagnosticReport({
    required this.kind,
    this.relatedDocuments,
    required this.resultId,
  });

  factory RelatedUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) {
    return RelatedUnchangedDocumentDiagnosticReport(
      kind: json['kind'] as String,
      relatedDocuments: json['relatedDocuments'] == null
          ? null
          : (json['relatedDocuments'] as Map).cast<String, Object?>(),
      resultId: json['resultId'] as String,
    );
  }

  /// A document diagnostic report indicating no changes to the last result. A
  /// server can only return `unchanged` if result ids are provided.
  final String kind;

  /// Diagnostics of related documents. This information is useful in programming
  /// languages where code in a file A can generate diagnostics in a file B which
  /// A depends on. An example of such a language is C/C++ where marco
  /// definitions in a file a.cpp and result in errors in a header file b.hpp.
  /// @since 3.17.0
  final Map<String, Object?>? relatedDocuments;

  /// A result id which will be sent on the next diagnostic request for the same
  /// document.
  final String resultId;

  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'relatedDocuments': relatedDocuments,
      'resultId': resultId,
    };
  }
}

/// A diagnostic report with a full set of problems.
/// @since 3.17.0
final class FullDocumentDiagnosticReport {
  const FullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    this.resultId,
  });

  factory FullDocumentDiagnosticReport.fromJson(Map<String, dynamic> json) {
    return FullDocumentDiagnosticReport(
      items: (json['items'] as List)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      kind: json['kind'] as String,
      resultId: json['resultId'] as String?,
    );
  }

  /// The actual items.
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  final String kind;

  /// An optional result id. If provided it will be sent on the next diagnostic
  /// request for the same document.
  final String? resultId;

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'kind': kind,
      'resultId': resultId,
    };
  }
}

/// A diagnostic report indicating that the last returned report is still
/// accurate.
/// @since 3.17.0
final class UnchangedDocumentDiagnosticReport {
  const UnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
  });

  factory UnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) {
    return UnchangedDocumentDiagnosticReport(
      kind: json['kind'] as String,
      resultId: json['resultId'] as String,
    );
  }

  /// A document diagnostic report indicating no changes to the last result. A
  /// server can only return `unchanged` if result ids are provided.
  final String kind;

  /// A result id which will be sent on the next diagnostic request for the same
  /// document.
  final String resultId;

  Map<String, dynamic> toJson() {
    return {'kind': kind, 'resultId': resultId};
  }
}

/// Diagnostic options.
/// @since 3.17.0
final class DiagnosticOptions {
  const DiagnosticOptions({
    this.identifier,
    required this.interFileDependencies,
    this.workDoneProgress,
    required this.workspaceDiagnostics,
  });

  factory DiagnosticOptions.fromJson(Map<String, dynamic> json) {
    return DiagnosticOptions(
      identifier: json['identifier'] as String?,
      interFileDependencies: json['interFileDependencies'] as bool,
      workDoneProgress: json['workDoneProgress'] as bool?,
      workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
    );
  }

  /// An optional identifier under which the diagnostics are managed by the
  /// client.
  final String? identifier;

  /// Whether the language has inter file dependencies meaning that editing code
  /// in one file can result in a different diagnostic set in another file. Inter
  /// file dependencies are common for most programming languages and typically
  /// uncommon for linters.
  final bool interFileDependencies;

  final bool? workDoneProgress;

  /// The server provides support for workspace diagnostics as well.
  final bool workspaceDiagnostics;

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'interFileDependencies': interFileDependencies,
      'workDoneProgress': workDoneProgress,
      'workspaceDiagnostics': workspaceDiagnostics,
    };
  }
}

/// A previous result id in a workspace pull request.
/// @since 3.17.0
final class PreviousResultId {
  const PreviousResultId({required this.uri, required this.value});

  factory PreviousResultId.fromJson(Map<String, dynamic> json) {
    return PreviousResultId(
      uri: json['uri'] as String,
      value: json['value'] as String,
    );
  }

  /// The URI for which the client knowns a result id.
  final String uri;

  /// The value of the previous result id.
  final String value;

  Map<String, dynamic> toJson() {
    return {'uri': uri, 'value': value};
  }
}

/// A notebook document.
/// @since 3.17.0
final class NotebookDocument {
  const NotebookDocument({
    required this.cells,
    this.metadata,
    required this.notebookType,
    required this.uri,
    required this.version,
  });

  factory NotebookDocument.fromJson(Map<String, dynamic> json) {
    return NotebookDocument(
      cells: (json['cells'] as List)
          .map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as LSPObject?,
      notebookType: json['notebookType'] as String,
      uri: json['uri'] as String,
      version: json['version'] as int,
    );
  }

  /// The cells of a notebook.
  final List<NotebookCell> cells;

  /// Additional metadata stored with the notebook document.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject? metadata;

  /// The type of the notebook.
  final String notebookType;

  /// The notebook document's uri.
  final String uri;

  /// The version number of this document (it will increase after each change,
  /// including undo/redo).
  final int version;

  Map<String, dynamic> toJson() {
    return {
      'cells': cells.map((e) => e.toJson()).toList(),
      'metadata': metadata,
      'notebookType': notebookType,
      'uri': uri,
      'version': version,
    };
  }
}

/// An item to transfer a text document from the client to the server.
final class TextDocumentItem {
  const TextDocumentItem({
    required this.languageId,
    required this.text,
    required this.uri,
    required this.version,
  });

  factory TextDocumentItem.fromJson(Map<String, dynamic> json) {
    return TextDocumentItem(
      languageId: json['languageId'] as String,
      text: json['text'] as String,
      uri: json['uri'] as String,
      version: json['version'] as int,
    );
  }

  /// The text document's language identifier.
  final String languageId;

  /// The content of the opened text document.
  final String text;

  /// The text document's uri.
  final String uri;

  /// The version number of this document (it will increase after each change,
  /// including undo/redo).
  final int version;

  Map<String, dynamic> toJson() {
    return {
      'languageId': languageId,
      'text': text,
      'uri': uri,
      'version': version,
    };
  }
}

/// A versioned notebook document identifier.
/// @since 3.17.0
final class VersionedNotebookDocumentIdentifier {
  const VersionedNotebookDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  factory VersionedNotebookDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) {
    return VersionedNotebookDocumentIdentifier(
      uri: json['uri'] as String,
      version: json['version'] as int,
    );
  }

  /// The notebook document's uri.
  final String uri;

  /// The version number of this notebook document.
  final int version;

  Map<String, dynamic> toJson() {
    return {'uri': uri, 'version': version};
  }
}

/// A change event for a notebook document.
/// @since 3.17.0
final class NotebookDocumentChangeEvent {
  const NotebookDocumentChangeEvent({this.cells, this.metadata});

  factory NotebookDocumentChangeEvent.fromJson(Map<String, dynamic> json) {
    return NotebookDocumentChangeEvent(
      cells: json['cells'] as Map<String, dynamic>?,
      metadata: json['metadata'] as LSPObject?,
    );
  }

  /// Changes to cells
  final Map<String, dynamic>? cells;

  /// The changed meta data if any.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject? metadata;

  Map<String, dynamic> toJson() {
    return {'cells': cells, 'metadata': metadata};
  }
}

/// A literal to identify a notebook document in the client.
/// @since 3.17.0
final class NotebookDocumentIdentifier {
  const NotebookDocumentIdentifier({required this.uri});

  factory NotebookDocumentIdentifier.fromJson(Map<String, dynamic> json) {
    return NotebookDocumentIdentifier(uri: json['uri'] as String);
  }

  /// The notebook document's uri.
  final String uri;

  Map<String, dynamic> toJson() {
    return {'uri': uri};
  }
}

/// Provides information about the context in which an inline completion was
/// requested.
/// @since 3.18.0 @proposed
final class InlineCompletionContext {
  const InlineCompletionContext({
    this.selectedCompletionInfo,
    required this.triggerKind,
  });

  factory InlineCompletionContext.fromJson(Map<String, dynamic> json) {
    return InlineCompletionContext(
      selectedCompletionInfo: json['selectedCompletionInfo'] == null
          ? null
          : SelectedCompletionInfo.fromJson(
              json['selectedCompletionInfo'] as Map<String, dynamic>,
            ),
      triggerKind: InlineCompletionTriggerKind.fromJson(json['triggerKind']),
    );
  }

  /// Provides information about the currently selected item in the autocomplete
  /// widget if it is visible.
  final SelectedCompletionInfo? selectedCompletionInfo;

  /// Describes how the inline completion was triggered.
  final InlineCompletionTriggerKind triggerKind;

  Map<String, dynamic> toJson() {
    return {
      'selectedCompletionInfo': selectedCompletionInfo?.toJson(),
      'triggerKind': triggerKind.toJson(),
    };
  }
}

/// A string value used as a snippet is a template which allows to insert text
/// and to control the editor cursor when insertion happens.
/// A snippet can define tab stops and placeholders with `$1`, `$2` and
/// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
/// snippet. Variables are defined with `$name` and `${name:default value}`.
/// @since 3.18.0 @proposed
final class StringValue {
  const StringValue({required this.kind, required this.value});

  factory StringValue.fromJson(Map<String, dynamic> json) {
    return StringValue(
      kind: json['kind'] as String,
      value: json['value'] as String,
    );
  }

  /// The kind of string value.
  final String kind;

  /// The snippet string.
  final String value;

  Map<String, dynamic> toJson() {
    return {'kind': kind, 'value': value};
  }
}

/// Inline completion options used during static registration.
/// @since 3.18.0 @proposed
final class InlineCompletionOptions {
  const InlineCompletionOptions({this.workDoneProgress});

  factory InlineCompletionOptions.fromJson(Map<String, dynamic> json) {
    return InlineCompletionOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// General parameters to register for a notification or to register a provider.
final class Registration {
  const Registration({
    required this.id,
    required this.method,
    this.registerOptions,
  });

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
      id: json['id'] as String,
      method: json['method'] as String,
      registerOptions: json['registerOptions'] as LSPAny?,
    );
  }

  /// The id used to register the request. The id can be used to deregister the
  /// request again.
  final String id;

  /// The method / capability to register for.
  final String method;

  /// Options necessary for the registration.
  final LSPAny? registerOptions;

  Map<String, dynamic> toJson() {
    return {'id': id, 'method': method, 'registerOptions': registerOptions};
  }
}

/// General parameters to unregister a request or notification.
final class Unregistration {
  const Unregistration({required this.id, required this.method});

  factory Unregistration.fromJson(Map<String, dynamic> json) {
    return Unregistration(
      id: json['id'] as String,
      method: json['method'] as String,
    );
  }

  /// The id used to unregister the request or notification. Usually an id
  /// provided during the register request.
  final String id;

  /// The method to unregister for.
  final String method;

  Map<String, dynamic> toJson() {
    return {'id': id, 'method': method};
  }
}

/// The initialize parameters
final class $InitializeParams {
  const $InitializeParams({
    required this.capabilities,
    this.clientInfo,
    this.initializationOptions,
    this.locale,
    required this.processId,
    this.rootPath,
    required this.rootUri,
    this.trace,
    this.workDoneToken,
  });

  factory $InitializeParams.fromJson(Map<String, dynamic> json) {
    return $InitializeParams(
      capabilities: ClientCapabilities.fromJson(
        json['capabilities'] as Map<String, dynamic>,
      ),
      clientInfo: json['clientInfo'] as Map<String, dynamic>?,
      initializationOptions: json['initializationOptions'] as LSPAny?,
      locale: json['locale'] as String?,
      processId: json['processId'] as int?,
      rootPath: json['rootPath'] as String?,
      rootUri: json['rootUri'] as String?,
      trace: json['trace'] == null ? null : TraceValues.fromJson(json['trace']),
      workDoneToken: json['workDoneToken'] as ProgressToken?,
    );
  }

  /// The capabilities provided by the client (editor or tool)
  final ClientCapabilities capabilities;

  /// Information about the client
  /// @since 3.15.0
  final Map<String, dynamic>? clientInfo;

  /// User provided initialization options.
  final LSPAny? initializationOptions;

  /// The locale the client is currently showing the user interface in. This must
  /// not necessarily be the locale of the operating system.
  /// Uses IETF language tags as the value's syntax (See
  /// https://en.wikipedia.org/wiki/IETF_language_tag)
  /// @since 3.16.0
  final String? locale;

  /// The process Id of the parent process that started the server.
  /// Is `null` if the process has not been started by another process. If the
  /// parent process is not alive then the server should exit.
  final int? processId;

  /// The rootPath of the workspace. Is null if no folder is open.
  /// @deprecated in favour of rootUri.
  final String? rootPath;

  /// The rootUri of the workspace. Is null if no folder is open. If both
  /// `rootPath` and `rootUri` are set `rootUri` wins.
  /// @deprecated in favour of workspaceFolders.
  final String? rootUri;

  /// The initial trace setting. If omitted trace is disabled ('off').
  final TraceValues? trace;

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  Map<String, dynamic> toJson() {
    return {
      'capabilities': capabilities.toJson(),
      'clientInfo': clientInfo,
      'initializationOptions': initializationOptions,
      'locale': locale,
      'processId': processId,
      'rootPath': rootPath,
      'rootUri': rootUri,
      'trace': trace?.toJson(),
      'workDoneToken': workDoneToken,
    };
  }
}

final class WorkspaceFoldersInitializeParams {
  const WorkspaceFoldersInitializeParams({this.workspaceFolders});

  factory WorkspaceFoldersInitializeParams.fromJson(Map<String, dynamic> json) {
    return WorkspaceFoldersInitializeParams(
      workspaceFolders: json['workspaceFolders'] == null
          ? null
          : (json['workspaceFolders'] as List)
                .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
                .toList(),
    );
  }

  /// The workspace folders configured in the client when the server starts.
  /// This property is only available if the client supports workspace folders.
  /// It can be `null` if the client supports workspace folders but none are
  /// configured.
  /// @since 3.6.0
  final List<WorkspaceFolder>? workspaceFolders;

  Map<String, dynamic> toJson() {
    return {
      'workspaceFolders': workspaceFolders?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Defines the capabilities provided by a language server.
final class ServerCapabilities {
  const ServerCapabilities({
    this.callHierarchyProvider,
    this.codeActionProvider,
    this.codeLensProvider,
    this.colorProvider,
    this.completionProvider,
    this.declarationProvider,
    this.definitionProvider,
    this.diagnosticProvider,
    this.documentFormattingProvider,
    this.documentHighlightProvider,
    this.documentLinkProvider,
    this.documentOnTypeFormattingProvider,
    this.documentRangeFormattingProvider,
    this.documentSymbolProvider,
    this.executeCommandProvider,
    this.experimental,
    this.foldingRangeProvider,
    this.hoverProvider,
    this.implementationProvider,
    this.inlayHintProvider,
    this.inlineCompletionProvider,
    this.inlineValueProvider,
    this.linkedEditingRangeProvider,
    this.monikerProvider,
    this.notebookDocumentSync,
    this.positionEncoding,
    this.referencesProvider,
    this.renameProvider,
    this.selectionRangeProvider,
    this.semanticTokensProvider,
    this.signatureHelpProvider,
    this.textDocumentSync,
    this.typeDefinitionProvider,
    this.typeHierarchyProvider,
    this.workspace,
    this.workspaceSymbolProvider,
  });

  factory ServerCapabilities.fromJson(Map<String, dynamic> json) {
    return ServerCapabilities(
      callHierarchyProvider: json['callHierarchyProvider'],
      codeActionProvider: json['codeActionProvider'],
      codeLensProvider: json['codeLensProvider'] == null
          ? null
          : CodeLensOptions.fromJson(
              json['codeLensProvider'] as Map<String, dynamic>,
            ),
      colorProvider: json['colorProvider'],
      completionProvider: json['completionProvider'] == null
          ? null
          : CompletionOptions.fromJson(
              json['completionProvider'] as Map<String, dynamic>,
            ),
      declarationProvider: json['declarationProvider'],
      definitionProvider: json['definitionProvider'],
      diagnosticProvider: json['diagnosticProvider'],
      documentFormattingProvider: json['documentFormattingProvider'],
      documentHighlightProvider: json['documentHighlightProvider'],
      documentLinkProvider: json['documentLinkProvider'] == null
          ? null
          : DocumentLinkOptions.fromJson(
              json['documentLinkProvider'] as Map<String, dynamic>,
            ),
      documentOnTypeFormattingProvider:
          json['documentOnTypeFormattingProvider'] == null
          ? null
          : DocumentOnTypeFormattingOptions.fromJson(
              json['documentOnTypeFormattingProvider'] as Map<String, dynamic>,
            ),
      documentRangeFormattingProvider: json['documentRangeFormattingProvider'],
      documentSymbolProvider: json['documentSymbolProvider'],
      executeCommandProvider: json['executeCommandProvider'] == null
          ? null
          : ExecuteCommandOptions.fromJson(
              json['executeCommandProvider'] as Map<String, dynamic>,
            ),
      experimental: json['experimental'] as LSPAny?,
      foldingRangeProvider: json['foldingRangeProvider'],
      hoverProvider: json['hoverProvider'],
      implementationProvider: json['implementationProvider'],
      inlayHintProvider: json['inlayHintProvider'],
      inlineCompletionProvider: json['inlineCompletionProvider'],
      inlineValueProvider: json['inlineValueProvider'],
      linkedEditingRangeProvider: json['linkedEditingRangeProvider'],
      monikerProvider: json['monikerProvider'],
      notebookDocumentSync: json['notebookDocumentSync'],
      positionEncoding: json['positionEncoding'] == null
          ? null
          : PositionEncodingKind.fromJson(json['positionEncoding']),
      referencesProvider: json['referencesProvider'],
      renameProvider: json['renameProvider'],
      selectionRangeProvider: json['selectionRangeProvider'],
      semanticTokensProvider: json['semanticTokensProvider'],
      signatureHelpProvider: json['signatureHelpProvider'] == null
          ? null
          : SignatureHelpOptions.fromJson(
              json['signatureHelpProvider'] as Map<String, dynamic>,
            ),
      textDocumentSync: json['textDocumentSync'],
      typeDefinitionProvider: json['typeDefinitionProvider'],
      typeHierarchyProvider: json['typeHierarchyProvider'],
      workspace: json['workspace'] as Map<String, dynamic>?,
      workspaceSymbolProvider: json['workspaceSymbolProvider'],
    );
  }

  /// The server provides call hierarchy support.
  /// @since 3.16.0
  final Object? callHierarchyProvider;

  /// The server provides code actions. CodeActionOptions may only be specified
  /// if the client states that it supports `codeActionLiteralSupport` in its
  /// initial `initialize` request.
  final Object? codeActionProvider;

  /// The server provides code lens.
  final CodeLensOptions? codeLensProvider;

  /// The server provides color provider support.
  final Object? colorProvider;

  /// The server provides completion support.
  final CompletionOptions? completionProvider;

  /// The server provides Goto Declaration support.
  final Object? declarationProvider;

  /// The server provides goto definition support.
  final Object? definitionProvider;

  /// The server has support for pull model diagnostics.
  /// @since 3.17.0
  final Object? diagnosticProvider;

  /// The server provides document formatting.
  final Object? documentFormattingProvider;

  /// The server provides document highlight support.
  final Object? documentHighlightProvider;

  /// The server provides document link support.
  final DocumentLinkOptions? documentLinkProvider;

  /// The server provides document formatting on typing.
  final DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider;

  /// The server provides document range formatting.
  final Object? documentRangeFormattingProvider;

  /// The server provides document symbol support.
  final Object? documentSymbolProvider;

  /// The server provides execute command support.
  final ExecuteCommandOptions? executeCommandProvider;

  /// Experimental server capabilities.
  final LSPAny? experimental;

  /// The server provides folding provider support.
  final Object? foldingRangeProvider;

  /// The server provides hover support.
  final Object? hoverProvider;

  /// The server provides Goto Implementation support.
  final Object? implementationProvider;

  /// The server provides inlay hints.
  /// @since 3.17.0
  final Object? inlayHintProvider;

  /// Inline completion options used during static registration.
  /// @since 3.18.0 @proposed
  final Object? inlineCompletionProvider;

  /// The server provides inline values.
  /// @since 3.17.0
  final Object? inlineValueProvider;

  /// The server provides linked editing range support.
  /// @since 3.16.0
  final Object? linkedEditingRangeProvider;

  /// The server provides moniker support.
  /// @since 3.16.0
  final Object? monikerProvider;

  /// Defines how notebook documents are synced.
  /// @since 3.17.0
  final Object? notebookDocumentSync;

  /// The position encoding the server picked from the encodings offered by the
  /// client via the client capability `general.positionEncodings`.
  /// If the client didn't provide any position encodings the only valid value
  /// that a server can return is 'utf-16'.
  /// If omitted it defaults to 'utf-16'.
  /// @since 3.17.0
  final PositionEncodingKind? positionEncoding;

  /// The server provides find references support.
  final Object? referencesProvider;

  /// The server provides rename support. RenameOptions may only be specified if
  /// the client states that it supports `prepareSupport` in its initial
  /// `initialize` request.
  final Object? renameProvider;

  /// The server provides selection range support.
  final Object? selectionRangeProvider;

  /// The server provides semantic tokens support.
  /// @since 3.16.0
  final Object? semanticTokensProvider;

  /// The server provides signature help support.
  final SignatureHelpOptions? signatureHelpProvider;

  /// Defines how text documents are synced. Is either a detailed structure
  /// defining each notification or for backwards compatibility the
  /// TextDocumentSyncKind number.
  final Object? textDocumentSync;

  /// The server provides Goto Type Definition support.
  final Object? typeDefinitionProvider;

  /// The server provides type hierarchy support.
  /// @since 3.17.0
  final Object? typeHierarchyProvider;

  /// Workspace specific server capabilities.
  final Map<String, dynamic>? workspace;

  /// The server provides workspace symbol support.
  final Object? workspaceSymbolProvider;

  Map<String, dynamic> toJson() {
    return {
      'callHierarchyProvider': callHierarchyProvider,
      'codeActionProvider': codeActionProvider,
      'codeLensProvider': codeLensProvider?.toJson(),
      'colorProvider': colorProvider,
      'completionProvider': completionProvider?.toJson(),
      'declarationProvider': declarationProvider,
      'definitionProvider': definitionProvider,
      'diagnosticProvider': diagnosticProvider,
      'documentFormattingProvider': documentFormattingProvider,
      'documentHighlightProvider': documentHighlightProvider,
      'documentLinkProvider': documentLinkProvider?.toJson(),
      'documentOnTypeFormattingProvider': documentOnTypeFormattingProvider
          ?.toJson(),
      'documentRangeFormattingProvider': documentRangeFormattingProvider,
      'documentSymbolProvider': documentSymbolProvider,
      'executeCommandProvider': executeCommandProvider?.toJson(),
      'experimental': experimental,
      'foldingRangeProvider': foldingRangeProvider,
      'hoverProvider': hoverProvider,
      'implementationProvider': implementationProvider,
      'inlayHintProvider': inlayHintProvider,
      'inlineCompletionProvider': inlineCompletionProvider,
      'inlineValueProvider': inlineValueProvider,
      'linkedEditingRangeProvider': linkedEditingRangeProvider,
      'monikerProvider': monikerProvider,
      'notebookDocumentSync': notebookDocumentSync,
      'positionEncoding': positionEncoding?.toJson(),
      'referencesProvider': referencesProvider,
      'renameProvider': renameProvider,
      'selectionRangeProvider': selectionRangeProvider,
      'semanticTokensProvider': semanticTokensProvider,
      'signatureHelpProvider': signatureHelpProvider?.toJson(),
      'textDocumentSync': textDocumentSync,
      'typeDefinitionProvider': typeDefinitionProvider,
      'typeHierarchyProvider': typeHierarchyProvider,
      'workspace': workspace,
      'workspaceSymbolProvider': workspaceSymbolProvider,
    };
  }
}

/// A text document identifier to denote a specific version of a text document.
final class VersionedTextDocumentIdentifier {
  const VersionedTextDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  factory VersionedTextDocumentIdentifier.fromJson(Map<String, dynamic> json) {
    return VersionedTextDocumentIdentifier(
      uri: json['uri'] as String,
      version: json['version'] as int,
    );
  }

  /// The text document's uri.
  final String uri;

  /// The version number of this document.
  final int version;

  Map<String, dynamic> toJson() {
    return {'uri': uri, 'version': version};
  }
}

/// Save options.
final class SaveOptions {
  const SaveOptions({this.includeText});

  factory SaveOptions.fromJson(Map<String, dynamic> json) {
    return SaveOptions(includeText: json['includeText'] as bool?);
  }

  /// The client is supposed to include the content on save.
  final bool? includeText;

  Map<String, dynamic> toJson() {
    return {'includeText': includeText};
  }
}

/// An event describing a file change.
final class FileEvent {
  const FileEvent({required this.type, required this.uri});

  factory FileEvent.fromJson(Map<String, dynamic> json) {
    return FileEvent(
      type: FileChangeType.fromJson(json['type']),
      uri: json['uri'] as String,
    );
  }

  /// The change type.
  final FileChangeType type;

  /// The file's uri.
  final String uri;

  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'uri': uri};
  }
}

final class FileSystemWatcher {
  const FileSystemWatcher({required this.globPattern, this.kind});

  factory FileSystemWatcher.fromJson(Map<String, dynamic> json) {
    return FileSystemWatcher(
      globPattern: json['globPattern'] as GlobPattern,
      kind: json['kind'] == null ? null : WatchKind.fromJson(json['kind']),
    );
  }

  /// The glob pattern to watch. See {@link GlobPattern glob pattern} for more
  /// detail.
  /// @since 3.17.0 support for relative patterns.
  final GlobPattern globPattern;

  /// The kind of events of interest. If omitted it defaults to WatchKind.Create
  /// | WatchKind.Change | WatchKind.Delete which is 7.
  final WatchKind? kind;

  Map<String, dynamic> toJson() {
    return {'globPattern': globPattern, 'kind': kind?.toJson()};
  }
}

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic
/// objects are only valid in the scope of a resource.
final class Diagnostic {
  const Diagnostic({
    this.code,
    this.codeDescription,
    this.data,
    required this.message,
    required this.range,
    this.relatedInformation,
    this.severity,
    this.source,
    this.tags,
  });

  factory Diagnostic.fromJson(Map<String, dynamic> json) {
    return Diagnostic(
      code: json['code'],
      codeDescription: json['codeDescription'] == null
          ? null
          : CodeDescription.fromJson(
              json['codeDescription'] as Map<String, dynamic>,
            ),
      data: json['data'] as LSPAny?,
      message: json['message'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      relatedInformation: json['relatedInformation'] == null
          ? null
          : (json['relatedInformation'] as List)
                .map(
                  (e) => DiagnosticRelatedInformation.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
      severity: json['severity'] == null
          ? null
          : DiagnosticSeverity.fromJson(json['severity']),
      source: json['source'] as String?,
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List)
                .map((e) => DiagnosticTag.fromJson(e))
                .toList(),
    );
  }

  /// The diagnostic's code, which usually appear in the user interface.
  final Object? code;

  /// An optional property to describe the error code. Requires the code field
  /// (above) to be present/not null.
  /// @since 3.16.0
  final CodeDescription? codeDescription;

  /// A data entry field that is preserved between a
  /// `textDocument/publishDiagnostics` notification and
  /// `textDocument/codeAction` request.
  /// @since 3.16.0
  final LSPAny? data;

  /// The diagnostic's message. It usually appears in the user interface
  final String message;

  /// The range at which the message applies
  final Range range;

  /// An array of related diagnostic information, e.g. when symbol-names within a
  /// scope collide all definitions can be marked via this property.
  final List<DiagnosticRelatedInformation>? relatedInformation;

  /// The diagnostic's severity. Can be omitted. If omitted it is up to the
  /// client to interpret diagnostics as error, warning, info or hint.
  final DiagnosticSeverity? severity;

  /// A human-readable string describing the source of this diagnostic, e.g.
  /// 'typescript' or 'super lint'. It usually appears in the user interface.
  final String? source;

  /// Additional metadata about the diagnostic.
  /// @since 3.15.0
  final List<DiagnosticTag>? tags;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'codeDescription': codeDescription?.toJson(),
      'data': data,
      'message': message,
      'range': range.toJson(),
      'relatedInformation': relatedInformation?.map((e) => e.toJson()).toList(),
      'severity': severity?.toJson(),
      'source': source,
      'tags': tags?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Contains additional information about the context in which a completion
/// request is triggered.
final class CompletionContext {
  const CompletionContext({this.triggerCharacter, required this.triggerKind});

  factory CompletionContext.fromJson(Map<String, dynamic> json) {
    return CompletionContext(
      triggerCharacter: json['triggerCharacter'] as String?,
      triggerKind: CompletionTriggerKind.fromJson(json['triggerKind']),
    );
  }

  /// The trigger character (a single character) that has trigger code complete.
  /// Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`
  final String? triggerCharacter;

  /// How the completion was triggered.
  final CompletionTriggerKind triggerKind;

  Map<String, dynamic> toJson() {
    return {
      'triggerCharacter': triggerCharacter,
      'triggerKind': triggerKind.toJson(),
    };
  }
}

/// Additional details for a completion item label.
/// @since 3.17.0
final class CompletionItemLabelDetails {
  const CompletionItemLabelDetails({this.description, this.detail});

  factory CompletionItemLabelDetails.fromJson(Map<String, dynamic> json) {
    return CompletionItemLabelDetails(
      description: json['description'] as String?,
      detail: json['detail'] as String?,
    );
  }

  /// An optional string which is rendered less prominently after {@link
  /// CompletionItem.detail}. Should be used for fully qualified names and file
  /// paths.
  final String? description;

  /// An optional string which is rendered less prominently directly after {@link
  /// CompletionItem.label label}, without any spacing. Should be used for
  /// function signatures and type annotations.
  final String? detail;

  Map<String, dynamic> toJson() {
    return {'description': description, 'detail': detail};
  }
}

/// A special text edit to provide an insert and a replace operation.
/// @since 3.16.0
final class InsertReplaceEdit {
  const InsertReplaceEdit({
    required this.insert,
    required this.newText,
    required this.replace,
  });

  factory InsertReplaceEdit.fromJson(Map<String, dynamic> json) {
    return InsertReplaceEdit(
      insert: Range.fromJson(json['insert'] as Map<String, dynamic>),
      newText: json['newText'] as String,
      replace: Range.fromJson(json['replace'] as Map<String, dynamic>),
    );
  }

  /// The range if the insert is requested
  final Range insert;

  /// The string to be inserted.
  final String newText;

  /// The range if the replace is requested.
  final Range replace;

  Map<String, dynamic> toJson() {
    return {
      'insert': insert.toJson(),
      'newText': newText,
      'replace': replace.toJson(),
    };
  }
}

/// Completion options.
final class CompletionOptions {
  const CompletionOptions({
    this.allCommitCharacters,
    this.completionItem,
    this.resolveProvider,
    this.triggerCharacters,
    this.workDoneProgress,
  });

  factory CompletionOptions.fromJson(Map<String, dynamic> json) {
    return CompletionOptions(
      allCommitCharacters: json['allCommitCharacters'] == null
          ? null
          : (json['allCommitCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      completionItem: json['completionItem'] as Map<String, dynamic>?,
      resolveProvider: json['resolveProvider'] as bool?,
      triggerCharacters: json['triggerCharacters'] == null
          ? null
          : (json['triggerCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// The list of all possible characters that commit a completion. This field
  /// can be used if clients don't support individual commit characters per
  /// completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
  /// If a server provides both `allCommitCharacters` and commit characters on an
  /// individual completion item the ones on the completion item win.
  /// @since 3.2.0
  final List<String>? allCommitCharacters;

  /// The server supports the following `CompletionItem` specific capabilities.
  /// @since 3.17.0
  final Map<String, dynamic>? completionItem;

  /// The server provides support to resolve additional information for a
  /// completion item.
  final bool? resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically they
  /// do so when the user starts to type an identifier. For example if the user
  /// types `c` in a JavaScript file code complete will automatically pop up
  /// present `console` besides others as a completion item. Characters that make
  /// up identifiers don't need to be listed here.
  /// If code complete should automatically be trigger on characters not being
  /// valid inside an identifier (for example `.` in JavaScript) list them in
  /// `triggerCharacters`.
  final List<String>? triggerCharacters;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'allCommitCharacters': allCommitCharacters,
      'completionItem': completionItem,
      'resolveProvider': resolveProvider,
      'triggerCharacters': triggerCharacters,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Hover options.
final class HoverOptions {
  const HoverOptions({this.workDoneProgress});

  factory HoverOptions.fromJson(Map<String, dynamic> json) {
    return HoverOptions(workDoneProgress: json['workDoneProgress'] as bool?);
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Additional information about the context in which a signature help request
/// was triggered.
/// @since 3.15.0
final class SignatureHelpContext {
  const SignatureHelpContext({
    this.activeSignatureHelp,
    required this.isRetrigger,
    this.triggerCharacter,
    required this.triggerKind,
  });

  factory SignatureHelpContext.fromJson(Map<String, dynamic> json) {
    return SignatureHelpContext(
      activeSignatureHelp: json['activeSignatureHelp'] == null
          ? null
          : SignatureHelp.fromJson(
              json['activeSignatureHelp'] as Map<String, dynamic>,
            ),
      isRetrigger: json['isRetrigger'] as bool,
      triggerCharacter: json['triggerCharacter'] as String?,
      triggerKind: SignatureHelpTriggerKind.fromJson(json['triggerKind']),
    );
  }

  /// The currently active `SignatureHelp`.
  /// The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field
  /// updated based on the user navigating through available signatures.
  final SignatureHelp? activeSignatureHelp;

  /// `true` if signature help was already showing when it was triggered.
  /// Retriggers occurs when the signature help is already active and can be
  /// caused by actions such as typing a trigger character, a cursor move, or
  /// document content changes.
  final bool isRetrigger;

  /// Character that caused signature help to be triggered.
  /// This is undefined when `triggerKind !==
  /// SignatureHelpTriggerKind.TriggerCharacter`
  final String? triggerCharacter;

  /// Action that caused signature help to be triggered.
  final SignatureHelpTriggerKind triggerKind;

  Map<String, dynamic> toJson() {
    return {
      'activeSignatureHelp': activeSignatureHelp?.toJson(),
      'isRetrigger': isRetrigger,
      'triggerCharacter': triggerCharacter,
      'triggerKind': triggerKind.toJson(),
    };
  }
}

/// Represents the signature of something callable. A signature can have a
/// label, like a function-name, a doc-comment, and a set of parameters.
final class SignatureInformation {
  const SignatureInformation({
    this.activeParameter,
    this.documentation,
    required this.label,
    this.parameters,
  });

  factory SignatureInformation.fromJson(Map<String, dynamic> json) {
    return SignatureInformation(
      activeParameter: json['activeParameter'] as int?,
      documentation: json['documentation'],
      label: json['label'] as String,
      parameters: json['parameters'] == null
          ? null
          : (json['parameters'] as List)
                .map(
                  (e) =>
                      ParameterInformation.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
    );
  }

  /// The index of the active parameter.
  /// If provided, this is used in place of `SignatureHelp.activeParameter`.
  /// @since 3.16.0
  final int? activeParameter;

  /// The human-readable doc-comment of this signature. Will be shown in the UI
  /// but can be omitted.
  final Object? documentation;

  /// The label of this signature. Will be shown in the UI.
  final String label;

  /// The parameters of this signature.
  final List<ParameterInformation>? parameters;

  Map<String, dynamic> toJson() {
    return {
      'activeParameter': activeParameter,
      'documentation': documentation,
      'label': label,
      'parameters': parameters?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Server Capabilities for a {@link SignatureHelpRequest}.
final class SignatureHelpOptions {
  const SignatureHelpOptions({
    this.retriggerCharacters,
    this.triggerCharacters,
    this.workDoneProgress,
  });

  factory SignatureHelpOptions.fromJson(Map<String, dynamic> json) {
    return SignatureHelpOptions(
      retriggerCharacters: json['retriggerCharacters'] == null
          ? null
          : (json['retriggerCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      triggerCharacters: json['triggerCharacters'] == null
          ? null
          : (json['triggerCharacters'] as List)
                .map((e) => e as String)
                .toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// List of characters that re-trigger signature help.
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger characters.
  /// @since 3.15.0
  final List<String>? retriggerCharacters;

  /// List of characters that trigger signature help automatically.
  final List<String>? triggerCharacters;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'retriggerCharacters': retriggerCharacters,
      'triggerCharacters': triggerCharacters,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Server Capabilities for a {@link DefinitionRequest}.
final class DefinitionOptions {
  const DefinitionOptions({this.workDoneProgress});

  factory DefinitionOptions.fromJson(Map<String, dynamic> json) {
    return DefinitionOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Value-object that contains additional information when requesting
/// references.
final class ReferenceContext {
  const ReferenceContext({required this.includeDeclaration});

  factory ReferenceContext.fromJson(Map<String, dynamic> json) {
    return ReferenceContext(
      includeDeclaration: json['includeDeclaration'] as bool,
    );
  }

  /// Include the declaration of the current symbol.
  final bool includeDeclaration;

  Map<String, dynamic> toJson() {
    return {'includeDeclaration': includeDeclaration};
  }
}

/// Reference options.
final class ReferenceOptions {
  const ReferenceOptions({this.workDoneProgress});

  factory ReferenceOptions.fromJson(Map<String, dynamic> json) {
    return ReferenceOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Provider options for a {@link DocumentHighlightRequest}.
final class DocumentHighlightOptions {
  const DocumentHighlightOptions({this.workDoneProgress});

  factory DocumentHighlightOptions.fromJson(Map<String, dynamic> json) {
    return DocumentHighlightOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// A base for all symbol information.
final class BaseSymbolInformation {
  const BaseSymbolInformation({
    this.containerName,
    required this.kind,
    required this.name,
    this.tags,
  });

  factory BaseSymbolInformation.fromJson(Map<String, dynamic> json) {
    return BaseSymbolInformation(
      containerName: json['containerName'] as String?,
      kind: SymbolKind.fromJson(json['kind']),
      name: json['name'] as String,
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List).map((e) => SymbolTag.fromJson(e)).toList(),
    );
  }

  /// The name of the symbol containing this symbol. This information is for user
  /// interface purposes (e.g. to render a qualifier in the user interface if
  /// necessary). It can't be used to re-infer a hierarchy for the document
  /// symbols.
  final String? containerName;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The name of this symbol.
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  final List<SymbolTag>? tags;

  Map<String, dynamic> toJson() {
    return {
      'containerName': containerName,
      'kind': kind.toJson(),
      'name': name,
      'tags': tags?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Provider options for a {@link DocumentSymbolRequest}.
final class DocumentSymbolOptions {
  const DocumentSymbolOptions({this.label, this.workDoneProgress});

  factory DocumentSymbolOptions.fromJson(Map<String, dynamic> json) {
    return DocumentSymbolOptions(
      label: json['label'] as String?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// A human-readable string that is shown when multiple outlines trees are
  /// shown for the same document.
  /// @since 3.16.0
  final String? label;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'label': label, 'workDoneProgress': workDoneProgress};
  }
}

/// Contains additional diagnostic information about the context in which a
/// {@link CodeActionProvider.provideCodeActions code action} is run.
final class CodeActionContext {
  const CodeActionContext({
    required this.diagnostics,
    this.only,
    this.triggerKind,
  });

  factory CodeActionContext.fromJson(Map<String, dynamic> json) {
    return CodeActionContext(
      diagnostics: (json['diagnostics'] as List)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      only: json['only'] == null
          ? null
          : (json['only'] as List)
                .map((e) => CodeActionKind.fromJson(e))
                .toList(),
      triggerKind: json['triggerKind'] == null
          ? null
          : CodeActionTriggerKind.fromJson(json['triggerKind']),
    );
  }

  /// An array of diagnostics known on the client side overlapping the range
  /// provided to the `textDocument/codeAction` request. They are provided so
  /// that the server knows which errors are currently presented to the user for
  /// the given range. There is no guarantee that these accurately reflect the
  /// error state of the resource. The primary parameter to compute code actions
  /// is the provided range.
  final List<Diagnostic> diagnostics;

  /// Requested kind of actions to return.
  /// Actions not of this kind are filtered out by the client before being shown.
  /// So servers can omit computing them.
  final List<CodeActionKind>? only;

  /// The reason why code actions were requested.
  /// @since 3.17.0
  final CodeActionTriggerKind? triggerKind;

  Map<String, dynamic> toJson() {
    return {
      'diagnostics': diagnostics.map((e) => e.toJson()).toList(),
      'only': only?.map((e) => e.toJson()).toList(),
      'triggerKind': triggerKind?.toJson(),
    };
  }
}

/// Provider options for a {@link CodeActionRequest}.
final class CodeActionOptions {
  const CodeActionOptions({
    this.codeActionKinds,
    this.resolveProvider,
    this.workDoneProgress,
  });

  factory CodeActionOptions.fromJson(Map<String, dynamic> json) {
    return CodeActionOptions(
      codeActionKinds: json['codeActionKinds'] == null
          ? null
          : (json['codeActionKinds'] as List)
                .map((e) => CodeActionKind.fromJson(e))
                .toList(),
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// CodeActionKinds that this server may return.
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the
  /// server may list out every specific kind they provide.
  final List<CodeActionKind>? codeActionKinds;

  /// The server provides support to resolve additional information for a code
  /// action.
  /// @since 3.16.0
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'codeActionKinds': codeActionKinds?.map((e) => e.toJson()).toList(),
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Server capabilities for a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolOptions {
  const WorkspaceSymbolOptions({this.resolveProvider, this.workDoneProgress});

  factory WorkspaceSymbolOptions.fromJson(Map<String, dynamic> json) {
    return WorkspaceSymbolOptions(
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// The server provides support to resolve additional information for a
  /// workspace symbol.
  /// @since 3.17.0
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Code Lens provider options of a {@link CodeLensRequest}.
final class CodeLensOptions {
  const CodeLensOptions({this.resolveProvider, this.workDoneProgress});

  factory CodeLensOptions.fromJson(Map<String, dynamic> json) {
    return CodeLensOptions(
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// Code lens has a resolve provider as well.
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Provider options for a {@link DocumentLinkRequest}.
final class DocumentLinkOptions {
  const DocumentLinkOptions({this.resolveProvider, this.workDoneProgress});

  factory DocumentLinkOptions.fromJson(Map<String, dynamic> json) {
    return DocumentLinkOptions(
      resolveProvider: json['resolveProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// Document links have a resolve provider as well.
  final bool? resolveProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Value-object describing what options formatting should use.
final class FormattingOptions {
  const FormattingOptions({
    this.insertFinalNewline,
    required this.insertSpaces,
    required this.tabSize,
    this.trimFinalNewlines,
    this.trimTrailingWhitespace,
  });

  factory FormattingOptions.fromJson(Map<String, dynamic> json) {
    return FormattingOptions(
      insertFinalNewline: json['insertFinalNewline'] as bool?,
      insertSpaces: json['insertSpaces'] as bool,
      tabSize: json['tabSize'] as int,
      trimFinalNewlines: json['trimFinalNewlines'] as bool?,
      trimTrailingWhitespace: json['trimTrailingWhitespace'] as bool?,
    );
  }

  /// Insert a newline character at the end of the file if one does not exist.
  /// @since 3.15.0
  final bool? insertFinalNewline;

  /// Prefer spaces over tabs.
  final bool insertSpaces;

  /// Size of a tab in spaces.
  final int tabSize;

  /// Trim all newlines after the final newline at the end of the file.
  /// @since 3.15.0
  final bool? trimFinalNewlines;

  /// Trim trailing whitespace on a line.
  /// @since 3.15.0
  final bool? trimTrailingWhitespace;

  Map<String, dynamic> toJson() {
    return {
      'insertFinalNewline': insertFinalNewline,
      'insertSpaces': insertSpaces,
      'tabSize': tabSize,
      'trimFinalNewlines': trimFinalNewlines,
      'trimTrailingWhitespace': trimTrailingWhitespace,
    };
  }
}

/// Provider options for a {@link DocumentFormattingRequest}.
final class DocumentFormattingOptions {
  const DocumentFormattingOptions({this.workDoneProgress});

  factory DocumentFormattingOptions.fromJson(Map<String, dynamic> json) {
    return DocumentFormattingOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'workDoneProgress': workDoneProgress};
  }
}

/// Provider options for a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingOptions {
  const DocumentRangeFormattingOptions({
    this.rangesSupport,
    this.workDoneProgress,
  });

  factory DocumentRangeFormattingOptions.fromJson(Map<String, dynamic> json) {
    return DocumentRangeFormattingOptions(
      rangesSupport: json['rangesSupport'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// Whether the server supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  final bool? rangesSupport;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'rangesSupport': rangesSupport,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingOptions {
  const DocumentOnTypeFormattingOptions({
    required this.firstTriggerCharacter,
    this.moreTriggerCharacter,
  });

  factory DocumentOnTypeFormattingOptions.fromJson(Map<String, dynamic> json) {
    return DocumentOnTypeFormattingOptions(
      firstTriggerCharacter: json['firstTriggerCharacter'] as String,
      moreTriggerCharacter: json['moreTriggerCharacter'] == null
          ? null
          : (json['moreTriggerCharacter'] as List)
                .map((e) => e as String)
                .toList(),
    );
  }

  /// A character on which formatting should be triggered, like `{`.
  final String firstTriggerCharacter;

  /// More trigger characters.
  final List<String>? moreTriggerCharacter;

  Map<String, dynamic> toJson() {
    return {
      'firstTriggerCharacter': firstTriggerCharacter,
      'moreTriggerCharacter': moreTriggerCharacter,
    };
  }
}

/// Provider options for a {@link RenameRequest}.
final class RenameOptions {
  const RenameOptions({this.prepareProvider, this.workDoneProgress});

  factory RenameOptions.fromJson(Map<String, dynamic> json) {
    return RenameOptions(
      prepareProvider: json['prepareProvider'] as bool?,
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// Renames should be checked and tested before being executed.
  /// @since version 3.12.0
  final bool? prepareProvider;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'prepareProvider': prepareProvider,
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// The server capabilities of a {@link ExecuteCommandRequest}.
final class ExecuteCommandOptions {
  const ExecuteCommandOptions({required this.commands, this.workDoneProgress});

  factory ExecuteCommandOptions.fromJson(Map<String, dynamic> json) {
    return ExecuteCommandOptions(
      commands: (json['commands'] as List).map((e) => e as String).toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// The commands to be executed on the server
  final List<String> commands;

  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {'commands': commands, 'workDoneProgress': workDoneProgress};
  }
}

/// @since 3.16.0
final class SemanticTokensLegend {
  const SemanticTokensLegend({
    required this.tokenModifiers,
    required this.tokenTypes,
  });

  factory SemanticTokensLegend.fromJson(Map<String, dynamic> json) {
    return SemanticTokensLegend(
      tokenModifiers: (json['tokenModifiers'] as List)
          .map((e) => e as String)
          .toList(),
      tokenTypes: (json['tokenTypes'] as List).map((e) => e as String).toList(),
    );
  }

  /// The token modifiers a server uses.
  final List<String> tokenModifiers;

  /// The token types a server uses.
  final List<String> tokenTypes;

  Map<String, dynamic> toJson() {
    return {'tokenModifiers': tokenModifiers, 'tokenTypes': tokenTypes};
  }
}

/// A text document identifier to optionally denote a specific version of a
/// text document.
final class OptionalVersionedTextDocumentIdentifier {
  const OptionalVersionedTextDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  factory OptionalVersionedTextDocumentIdentifier.fromJson(
    Map<String, dynamic> json,
  ) {
    return OptionalVersionedTextDocumentIdentifier(
      uri: json['uri'] as String,
      version: json['version'] as int?,
    );
  }

  /// The text document's uri.
  final String uri;

  /// The version number of this document. If a versioned text document
  /// identifier is sent from the server to the client and the file is not open
  /// in the editor (the server has not received an open notification before) the
  /// server can send `null` to indicate that the version is unknown and the
  /// content on disk is the truth (as specified with document content
  /// ownership).
  final int? version;

  Map<String, dynamic> toJson() {
    return {'uri': uri, 'version': version};
  }
}

/// A special text edit with an additional change annotation.
/// @since 3.16.0.
final class AnnotatedTextEdit {
  const AnnotatedTextEdit({
    required this.annotationId,
    required this.newText,
    required this.range,
  });

  factory AnnotatedTextEdit.fromJson(Map<String, dynamic> json) {
    return AnnotatedTextEdit(
      annotationId: json['annotationId'] as ChangeAnnotationIdentifier,
      newText: json['newText'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );
  }

  /// The actual identifier of the change annotation
  final ChangeAnnotationIdentifier annotationId;

  /// The string to be inserted. For delete operations use an empty string.
  final String newText;

  /// The range of the text document to be manipulated. To insert text into a
  /// document create a range where start === end.
  final Range range;

  Map<String, dynamic> toJson() {
    return {
      'annotationId': annotationId,
      'newText': newText,
      'range': range.toJson(),
    };
  }
}

/// A generic resource operation.
final class ResourceOperation {
  const ResourceOperation({this.annotationId, required this.kind});

  factory ResourceOperation.fromJson(Map<String, dynamic> json) {
    return ResourceOperation(
      annotationId: json['annotationId'] as ChangeAnnotationIdentifier?,
      kind: json['kind'] as String,
    );
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  final ChangeAnnotationIdentifier? annotationId;

  /// The resource operation kind.
  final String kind;

  Map<String, dynamic> toJson() {
    return {'annotationId': annotationId, 'kind': kind};
  }
}

/// Options to create a file.
final class CreateFileOptions {
  const CreateFileOptions({this.ignoreIfExists, this.overwrite});

  factory CreateFileOptions.fromJson(Map<String, dynamic> json) {
    return CreateFileOptions(
      ignoreIfExists: json['ignoreIfExists'] as bool?,
      overwrite: json['overwrite'] as bool?,
    );
  }

  /// Ignore if exists.
  final bool? ignoreIfExists;

  /// Overwrite existing file. Overwrite wins over `ignoreIfExists`
  final bool? overwrite;

  Map<String, dynamic> toJson() {
    return {'ignoreIfExists': ignoreIfExists, 'overwrite': overwrite};
  }
}

/// Rename file options
final class RenameFileOptions {
  const RenameFileOptions({this.ignoreIfExists, this.overwrite});

  factory RenameFileOptions.fromJson(Map<String, dynamic> json) {
    return RenameFileOptions(
      ignoreIfExists: json['ignoreIfExists'] as bool?,
      overwrite: json['overwrite'] as bool?,
    );
  }

  /// Ignores if target exists.
  final bool? ignoreIfExists;

  /// Overwrite target if existing. Overwrite wins over `ignoreIfExists`
  final bool? overwrite;

  Map<String, dynamic> toJson() {
    return {'ignoreIfExists': ignoreIfExists, 'overwrite': overwrite};
  }
}

/// Delete file options
final class DeleteFileOptions {
  const DeleteFileOptions({this.ignoreIfNotExists, this.recursive});

  factory DeleteFileOptions.fromJson(Map<String, dynamic> json) {
    return DeleteFileOptions(
      ignoreIfNotExists: json['ignoreIfNotExists'] as bool?,
      recursive: json['recursive'] as bool?,
    );
  }

  /// Ignore the operation if the file doesn't exist.
  final bool? ignoreIfNotExists;

  /// Delete the content recursively if a folder is denoted.
  final bool? recursive;

  Map<String, dynamic> toJson() {
    return {'ignoreIfNotExists': ignoreIfNotExists, 'recursive': recursive};
  }
}

/// A pattern to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
final class FileOperationPattern {
  const FileOperationPattern({required this.glob, this.matches, this.options});

  factory FileOperationPattern.fromJson(Map<String, dynamic> json) {
    return FileOperationPattern(
      glob: json['glob'] as String,
      matches: json['matches'] == null
          ? null
          : FileOperationPatternKind.fromJson(json['matches']),
      options: json['options'] == null
          ? null
          : FileOperationPatternOptions.fromJson(
              json['options'] as Map<String, dynamic>,
            ),
    );
  }

  /// The glob pattern to match. Glob patterns can have the following syntax: -
  /// `*` to match zero or more characters in a path segment - `?` to match on
  /// one character in a path segment - `**` to match any number of path
  /// segments, including none - `{}` to group sub patterns into an OR
  /// expression. (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript
  /// files) - `[]` to declare a range of characters to match in a path segment
  /// (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …) - `[!...]`
  /// to negate a range of characters to match in a path segment (e.g.,
  /// `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
  final String glob;

  /// Whether to match files or folders with this pattern.
  /// Matches both if undefined.
  final FileOperationPatternKind? matches;

  /// Additional options used during matching.
  final FileOperationPatternOptions? options;

  Map<String, dynamic> toJson() {
    return {
      'glob': glob,
      'matches': matches?.toJson(),
      'options': options?.toJson(),
    };
  }
}

/// A full document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
final class WorkspaceFullDocumentDiagnosticReport {
  const WorkspaceFullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    this.resultId,
    required this.uri,
    required this.version,
  });

  factory WorkspaceFullDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) {
    return WorkspaceFullDocumentDiagnosticReport(
      items: (json['items'] as List)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      kind: json['kind'] as String,
      resultId: json['resultId'] as String?,
      uri: json['uri'] as String,
      version: json['version'] as int?,
    );
  }

  /// The actual items.
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  final String kind;

  /// An optional result id. If provided it will be sent on the next diagnostic
  /// request for the same document.
  final String? resultId;

  /// The URI for which diagnostic information is reported.
  final String uri;

  /// The version number for which the diagnostics are reported. If the document
  /// is not marked as open `null` can be provided.
  final int? version;

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'kind': kind,
      'resultId': resultId,
      'uri': uri,
      'version': version,
    };
  }
}

/// An unchanged document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
final class WorkspaceUnchangedDocumentDiagnosticReport {
  const WorkspaceUnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
    required this.uri,
    required this.version,
  });

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, dynamic> json,
  ) {
    return WorkspaceUnchangedDocumentDiagnosticReport(
      kind: json['kind'] as String,
      resultId: json['resultId'] as String,
      uri: json['uri'] as String,
      version: json['version'] as int?,
    );
  }

  /// A document diagnostic report indicating no changes to the last result. A
  /// server can only return `unchanged` if result ids are provided.
  final String kind;

  /// A result id which will be sent on the next diagnostic request for the same
  /// document.
  final String resultId;

  /// The URI for which diagnostic information is reported.
  final String uri;

  /// The version number for which the diagnostics are reported. If the document
  /// is not marked as open `null` can be provided.
  final int? version;

  Map<String, dynamic> toJson() {
    return {'kind': kind, 'resultId': resultId, 'uri': uri, 'version': version};
  }
}

/// A notebook cell.
/// A cell's document URI must be unique across ALL notebook cells and can
/// therefore be used to uniquely identify a notebook cell or the cell's text
/// document.
/// @since 3.17.0
final class NotebookCell {
  const NotebookCell({
    required this.document,
    this.executionSummary,
    required this.kind,
    this.metadata,
  });

  factory NotebookCell.fromJson(Map<String, dynamic> json) {
    return NotebookCell(
      document: json['document'] as String,
      executionSummary: json['executionSummary'] == null
          ? null
          : ExecutionSummary.fromJson(
              json['executionSummary'] as Map<String, dynamic>,
            ),
      kind: NotebookCellKind.fromJson(json['kind']),
      metadata: json['metadata'] as LSPObject?,
    );
  }

  /// The URI of the cell's text document content.
  final String document;

  /// Additional execution summary information if supported by the client.
  final ExecutionSummary? executionSummary;

  /// The cell's kind
  final NotebookCellKind kind;

  /// Additional metadata stored with the cell.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject? metadata;

  Map<String, dynamic> toJson() {
    return {
      'document': document,
      'executionSummary': executionSummary?.toJson(),
      'kind': kind.toJson(),
      'metadata': metadata,
    };
  }
}

/// A change describing how to move a `NotebookCell` array from state S to S'.
/// @since 3.17.0
final class NotebookCellArrayChange {
  const NotebookCellArrayChange({
    this.cells,
    required this.deleteCount,
    required this.start,
  });

  factory NotebookCellArrayChange.fromJson(Map<String, dynamic> json) {
    return NotebookCellArrayChange(
      cells: json['cells'] == null
          ? null
          : (json['cells'] as List)
                .map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
                .toList(),
      deleteCount: json['deleteCount'] as int,
      start: json['start'] as int,
    );
  }

  /// The new cells, if any
  final List<NotebookCell>? cells;

  /// The deleted cells
  final int deleteCount;

  /// The start oftest of the cell that changed.
  final int start;

  Map<String, dynamic> toJson() {
    return {
      'cells': cells?.map((e) => e.toJson()).toList(),
      'deleteCount': deleteCount,
      'start': start,
    };
  }
}

/// Describes the currently selected completion item.
/// @since 3.18.0 @proposed
final class SelectedCompletionInfo {
  const SelectedCompletionInfo({required this.range, required this.text});

  factory SelectedCompletionInfo.fromJson(Map<String, dynamic> json) {
    return SelectedCompletionInfo(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      text: json['text'] as String,
    );
  }

  /// The range that will be replaced if this completion item is accepted.
  final Range range;

  /// The text the range will be replaced with if this completion is accepted.
  final String text;

  Map<String, dynamic> toJson() {
    return {'range': range.toJson(), 'text': text};
  }
}

/// Defines the capabilities provided by the client.
final class ClientCapabilities {
  const ClientCapabilities({
    this.experimental,
    this.general,
    this.notebookDocument,
    this.textDocument,
    this.window,
    this.workspace,
  });

  factory ClientCapabilities.fromJson(Map<String, dynamic> json) {
    return ClientCapabilities(
      experimental: json['experimental'] as LSPAny?,
      general: json['general'] == null
          ? null
          : GeneralClientCapabilities.fromJson(
              json['general'] as Map<String, dynamic>,
            ),
      notebookDocument: json['notebookDocument'] == null
          ? null
          : NotebookDocumentClientCapabilities.fromJson(
              json['notebookDocument'] as Map<String, dynamic>,
            ),
      textDocument: json['textDocument'] == null
          ? null
          : TextDocumentClientCapabilities.fromJson(
              json['textDocument'] as Map<String, dynamic>,
            ),
      window: json['window'] == null
          ? null
          : WindowClientCapabilities.fromJson(
              json['window'] as Map<String, dynamic>,
            ),
      workspace: json['workspace'] == null
          ? null
          : WorkspaceClientCapabilities.fromJson(
              json['workspace'] as Map<String, dynamic>,
            ),
    );
  }

  /// Experimental client capabilities.
  final LSPAny? experimental;

  /// General client capabilities.
  /// @since 3.16.0
  final GeneralClientCapabilities? general;

  /// Capabilities specific to the notebook document support.
  /// @since 3.17.0
  final NotebookDocumentClientCapabilities? notebookDocument;

  /// Text document specific client capabilities.
  final TextDocumentClientCapabilities? textDocument;

  /// Window specific client capabilities.
  final WindowClientCapabilities? window;

  /// Workspace specific client capabilities.
  final WorkspaceClientCapabilities? workspace;

  Map<String, dynamic> toJson() {
    return {
      'experimental': experimental,
      'general': general?.toJson(),
      'notebookDocument': notebookDocument?.toJson(),
      'textDocument': textDocument?.toJson(),
      'window': window?.toJson(),
      'workspace': workspace?.toJson(),
    };
  }
}

final class TextDocumentSyncOptions {
  const TextDocumentSyncOptions({
    this.change,
    this.openClose,
    this.save,
    this.willSave,
    this.willSaveWaitUntil,
  });

  factory TextDocumentSyncOptions.fromJson(Map<String, dynamic> json) {
    return TextDocumentSyncOptions(
      change: json['change'] == null
          ? null
          : TextDocumentSyncKind.fromJson(json['change']),
      openClose: json['openClose'] as bool?,
      save: json['save'],
      willSave: json['willSave'] as bool?,
      willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
    );
  }

  /// Change notifications are sent to the server. See TextDocumentSyncKind.None,
  /// TextDocumentSyncKind.Full and TextDocumentSyncKind.Incremental. If omitted
  /// it defaults to TextDocumentSyncKind.None.
  final TextDocumentSyncKind? change;

  /// Open and close notifications are sent to the server. If omitted open close
  /// notification should not be sent.
  final bool? openClose;

  /// If present save notifications are sent to the server. If omitted the
  /// notification should not be sent.
  final Object? save;

  /// If present will save notifications are sent to the server. If omitted the
  /// notification should not be sent.
  final bool? willSave;

  /// If present will save wait until requests are sent to the server. If omitted
  /// the request should not be sent.
  final bool? willSaveWaitUntil;

  Map<String, dynamic> toJson() {
    return {
      'change': change?.toJson(),
      'openClose': openClose,
      'save': save,
      'willSave': willSave,
      'willSaveWaitUntil': willSaveWaitUntil,
    };
  }
}

/// Options specific to a notebook plus its cells to be synced to the server.
/// If a selector provides a notebook document filter but no cell selector all
/// cells of a matching notebook document will be synced.
/// If a selector provides no notebook document filter but only a cell selector
/// all notebook document that contain at least one matching cell will be
/// synced.
/// @since 3.17.0
final class NotebookDocumentSyncOptions {
  const NotebookDocumentSyncOptions({
    required this.notebookSelector,
    this.save,
  });

  factory NotebookDocumentSyncOptions.fromJson(Map<String, dynamic> json) {
    return NotebookDocumentSyncOptions(
      notebookSelector: (json['notebookSelector'] as List).cast<Object?>(),
      save: json['save'] as bool?,
    );
  }

  /// The notebooks to be synced
  final List<Object?> notebookSelector;

  /// Whether save notification should be forwarded to the server. Will only be
  /// honored if mode === `notebook`.
  final bool? save;

  Map<String, dynamic> toJson() {
    return {'notebookSelector': notebookSelector, 'save': save};
  }
}

/// Registration options specific to a notebook.
/// @since 3.17.0
final class NotebookDocumentSyncRegistrationOptions {
  const NotebookDocumentSyncRegistrationOptions({
    this.id,
    required this.notebookSelector,
    this.save,
  });

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotebookDocumentSyncRegistrationOptions(
      id: json['id'] as String?,
      notebookSelector: (json['notebookSelector'] as List).cast<Object?>(),
      save: json['save'] as bool?,
    );
  }

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String? id;

  /// The notebooks to be synced
  final List<Object?> notebookSelector;

  /// Whether save notification should be forwarded to the server. Will only be
  /// honored if mode === `notebook`.
  final bool? save;

  Map<String, dynamic> toJson() {
    return {'id': id, 'notebookSelector': notebookSelector, 'save': save};
  }
}

final class WorkspaceFoldersServerCapabilities {
  const WorkspaceFoldersServerCapabilities({
    this.changeNotifications,
    this.supported,
  });

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return WorkspaceFoldersServerCapabilities(
      changeNotifications: json['changeNotifications'],
      supported: json['supported'] as bool?,
    );
  }

  /// Whether the server wants to receive workspace folder change notifications.
  /// If a string is provided the string is treated as an ID under which the
  /// notification is registered on the client side. The ID can be used to
  /// unregister for these events using the `client/unregisterCapability`
  /// request.
  final Object? changeNotifications;

  /// The server has support for workspace folders
  final bool? supported;

  Map<String, dynamic> toJson() {
    return {'changeNotifications': changeNotifications, 'supported': supported};
  }
}

/// Options for notifications/requests for user operations on files.
/// @since 3.16.0
final class FileOperationOptions {
  const FileOperationOptions({
    this.didCreate,
    this.didDelete,
    this.didRename,
    this.willCreate,
    this.willDelete,
    this.willRename,
  });

  factory FileOperationOptions.fromJson(Map<String, dynamic> json) {
    return FileOperationOptions(
      didCreate: json['didCreate'] == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              json['didCreate'] as Map<String, dynamic>,
            ),
      didDelete: json['didDelete'] == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              json['didDelete'] as Map<String, dynamic>,
            ),
      didRename: json['didRename'] == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              json['didRename'] as Map<String, dynamic>,
            ),
      willCreate: json['willCreate'] == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              json['willCreate'] as Map<String, dynamic>,
            ),
      willDelete: json['willDelete'] == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              json['willDelete'] as Map<String, dynamic>,
            ),
      willRename: json['willRename'] == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              json['willRename'] as Map<String, dynamic>,
            ),
    );
  }

  /// The server is interested in receiving didCreateFiles notifications.
  final FileOperationRegistrationOptions? didCreate;

  /// The server is interested in receiving didDeleteFiles file notifications.
  final FileOperationRegistrationOptions? didDelete;

  /// The server is interested in receiving didRenameFiles notifications.
  final FileOperationRegistrationOptions? didRename;

  /// The server is interested in receiving willCreateFiles requests.
  final FileOperationRegistrationOptions? willCreate;

  /// The server is interested in receiving willDeleteFiles file requests.
  final FileOperationRegistrationOptions? willDelete;

  /// The server is interested in receiving willRenameFiles requests.
  final FileOperationRegistrationOptions? willRename;

  Map<String, dynamic> toJson() {
    return {
      'didCreate': didCreate?.toJson(),
      'didDelete': didDelete?.toJson(),
      'didRename': didRename?.toJson(),
      'willCreate': willCreate?.toJson(),
      'willDelete': willDelete?.toJson(),
      'willRename': willRename?.toJson(),
    };
  }
}

/// Structure to capture a description for an error code.
/// @since 3.16.0
final class CodeDescription {
  const CodeDescription({required this.href});

  factory CodeDescription.fromJson(Map<String, dynamic> json) {
    return CodeDescription(href: json['href'] as String);
  }

  /// An URI to open with more information about the diagnostic error.
  final String href;

  Map<String, dynamic> toJson() {
    return {'href': href};
  }
}

/// Represents a related message and source code location for a diagnostic.
/// This should be used to point to code locations that cause or related to a
/// diagnostics, e.g when duplicating a symbol in a scope.
final class DiagnosticRelatedInformation {
  const DiagnosticRelatedInformation({
    required this.location,
    required this.message,
  });

  factory DiagnosticRelatedInformation.fromJson(Map<String, dynamic> json) {
    return DiagnosticRelatedInformation(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      message: json['message'] as String,
    );
  }

  /// The location of this related diagnostic information.
  final Location location;

  /// The message of this related diagnostic information.
  final String message;

  Map<String, dynamic> toJson() {
    return {'location': location.toJson(), 'message': message};
  }
}

/// Represents a parameter of a callable-signature. A parameter can have a
/// label and a doc-comment.
final class ParameterInformation {
  const ParameterInformation({this.documentation, required this.label});

  factory ParameterInformation.fromJson(Map<String, dynamic> json) {
    return ParameterInformation(
      documentation: json['documentation'],
      label: json['label'],
    );
  }

  /// The human-readable doc-comment of this parameter. Will be shown in the UI
  /// but can be omitted.
  final Object? documentation;

  /// The label of this parameter information.
  /// Either a string or an inclusive start and exclusive end offsets within its
  /// containing signature label. (see SignatureInformation.label). The offsets
  /// are based on a UTF-16 string representation as `Position` and `Range` does.
  /// *Note*: a label of type string should be a substring of its containing
  /// signature label. Its intended use case is to highlight the parameter label
  /// part in the `SignatureInformation.label`.
  final Object? label;

  Map<String, dynamic> toJson() {
    return {'documentation': documentation, 'label': label};
  }
}

/// A notebook cell text document filter denotes a cell text document by
/// different properties.
/// @since 3.17.0
final class NotebookCellTextDocumentFilter {
  const NotebookCellTextDocumentFilter({this.language, required this.notebook});

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, dynamic> json) {
    return NotebookCellTextDocumentFilter(
      language: json['language'] as String?,
      notebook: json['notebook'],
    );
  }

  /// A language id like `python`.
  /// Will be matched against the language id of the notebook cell document. '*'
  /// matches every language.
  final String? language;

  /// A filter that matches against the notebook containing the notebook cell. If
  /// a string value is provided it matches against the notebook type. '*'
  /// matches every notebook.
  final Object? notebook;

  Map<String, dynamic> toJson() {
    return {'language': language, 'notebook': notebook};
  }
}

/// Matching options for the file operation pattern.
/// @since 3.16.0
final class FileOperationPatternOptions {
  const FileOperationPatternOptions({this.ignoreCase});

  factory FileOperationPatternOptions.fromJson(Map<String, dynamic> json) {
    return FileOperationPatternOptions(ignoreCase: json['ignoreCase'] as bool?);
  }

  /// The pattern should be matched ignoring casing.
  final bool? ignoreCase;

  Map<String, dynamic> toJson() {
    return {'ignoreCase': ignoreCase};
  }
}

final class ExecutionSummary {
  const ExecutionSummary({required this.executionOrder, this.success});

  factory ExecutionSummary.fromJson(Map<String, dynamic> json) {
    return ExecutionSummary(
      executionOrder: json['executionOrder'] as int,
      success: json['success'] as bool?,
    );
  }

  /// A strict monotonically increasing value indicating the execution order of a
  /// cell inside a notebook.
  final int executionOrder;

  /// Whether the execution was successful or not if known by the client.
  final bool? success;

  Map<String, dynamic> toJson() {
    return {'executionOrder': executionOrder, 'success': success};
  }
}

/// Workspace specific client capabilities.
final class WorkspaceClientCapabilities {
  const WorkspaceClientCapabilities({
    this.applyEdit,
    this.codeLens,
    this.configuration,
    this.diagnostics,
    this.didChangeConfiguration,
    this.didChangeWatchedFiles,
    this.executeCommand,
    this.fileOperations,
    this.foldingRange,
    this.inlayHint,
    this.inlineValue,
    this.semanticTokens,
    this.symbol,
    this.workspaceEdit,
    this.workspaceFolders,
  });

  factory WorkspaceClientCapabilities.fromJson(Map<String, dynamic> json) {
    return WorkspaceClientCapabilities(
      applyEdit: json['applyEdit'] as bool?,
      codeLens: json['codeLens'] == null
          ? null
          : CodeLensWorkspaceClientCapabilities.fromJson(
              json['codeLens'] as Map<String, dynamic>,
            ),
      configuration: json['configuration'] as bool?,
      diagnostics: json['diagnostics'] == null
          ? null
          : DiagnosticWorkspaceClientCapabilities.fromJson(
              json['diagnostics'] as Map<String, dynamic>,
            ),
      didChangeConfiguration: json['didChangeConfiguration'] == null
          ? null
          : DidChangeConfigurationClientCapabilities.fromJson(
              json['didChangeConfiguration'] as Map<String, dynamic>,
            ),
      didChangeWatchedFiles: json['didChangeWatchedFiles'] == null
          ? null
          : DidChangeWatchedFilesClientCapabilities.fromJson(
              json['didChangeWatchedFiles'] as Map<String, dynamic>,
            ),
      executeCommand: json['executeCommand'] == null
          ? null
          : ExecuteCommandClientCapabilities.fromJson(
              json['executeCommand'] as Map<String, dynamic>,
            ),
      fileOperations: json['fileOperations'] == null
          ? null
          : FileOperationClientCapabilities.fromJson(
              json['fileOperations'] as Map<String, dynamic>,
            ),
      foldingRange: json['foldingRange'] == null
          ? null
          : FoldingRangeWorkspaceClientCapabilities.fromJson(
              json['foldingRange'] as Map<String, dynamic>,
            ),
      inlayHint: json['inlayHint'] == null
          ? null
          : InlayHintWorkspaceClientCapabilities.fromJson(
              json['inlayHint'] as Map<String, dynamic>,
            ),
      inlineValue: json['inlineValue'] == null
          ? null
          : InlineValueWorkspaceClientCapabilities.fromJson(
              json['inlineValue'] as Map<String, dynamic>,
            ),
      semanticTokens: json['semanticTokens'] == null
          ? null
          : SemanticTokensWorkspaceClientCapabilities.fromJson(
              json['semanticTokens'] as Map<String, dynamic>,
            ),
      symbol: json['symbol'] == null
          ? null
          : WorkspaceSymbolClientCapabilities.fromJson(
              json['symbol'] as Map<String, dynamic>,
            ),
      workspaceEdit: json['workspaceEdit'] == null
          ? null
          : WorkspaceEditClientCapabilities.fromJson(
              json['workspaceEdit'] as Map<String, dynamic>,
            ),
      workspaceFolders: json['workspaceFolders'] as bool?,
    );
  }

  /// The client supports applying batch edits to the workspace by supporting the
  /// request 'workspace/applyEdit'
  final bool? applyEdit;

  /// Capabilities specific to the code lens requests scoped to the workspace.
  /// @since 3.16.0.
  final CodeLensWorkspaceClientCapabilities? codeLens;

  /// The client supports `workspace/configuration` requests.
  /// @since 3.6.0
  final bool? configuration;

  /// Capabilities specific to the diagnostic requests scoped to the workspace.
  /// @since 3.17.0.
  final DiagnosticWorkspaceClientCapabilities? diagnostics;

  /// Capabilities specific to the `workspace/didChangeConfiguration`
  /// notification.
  final DidChangeConfigurationClientCapabilities? didChangeConfiguration;

  /// Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
  final DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles;

  /// Capabilities specific to the `workspace/executeCommand` request.
  final ExecuteCommandClientCapabilities? executeCommand;

  /// The client has support for file notifications/requests for user operations
  /// on files.
  /// Since 3.16.0
  final FileOperationClientCapabilities? fileOperations;

  /// Capabilities specific to the folding range requests scoped to the workspace.
  /// @since 3.18.0 @proposed
  final FoldingRangeWorkspaceClientCapabilities? foldingRange;

  /// Capabilities specific to the inlay hint requests scoped to the workspace.
  /// @since 3.17.0.
  final InlayHintWorkspaceClientCapabilities? inlayHint;

  /// Capabilities specific to the inline values requests scoped to the workspace.
  /// @since 3.17.0.
  final InlineValueWorkspaceClientCapabilities? inlineValue;

  /// Capabilities specific to the semantic token requests scoped to the
  /// workspace.
  /// @since 3.16.0.
  final SemanticTokensWorkspaceClientCapabilities? semanticTokens;

  /// Capabilities specific to the `workspace/symbol` request.
  final WorkspaceSymbolClientCapabilities? symbol;

  /// Capabilities specific to `WorkspaceEdit`s.
  final WorkspaceEditClientCapabilities? workspaceEdit;

  /// The client has support for workspace folders.
  /// @since 3.6.0
  final bool? workspaceFolders;

  Map<String, dynamic> toJson() {
    return {
      'applyEdit': applyEdit,
      'codeLens': codeLens?.toJson(),
      'configuration': configuration,
      'diagnostics': diagnostics?.toJson(),
      'didChangeConfiguration': didChangeConfiguration?.toJson(),
      'didChangeWatchedFiles': didChangeWatchedFiles?.toJson(),
      'executeCommand': executeCommand?.toJson(),
      'fileOperations': fileOperations?.toJson(),
      'foldingRange': foldingRange?.toJson(),
      'inlayHint': inlayHint?.toJson(),
      'inlineValue': inlineValue?.toJson(),
      'semanticTokens': semanticTokens?.toJson(),
      'symbol': symbol?.toJson(),
      'workspaceEdit': workspaceEdit?.toJson(),
      'workspaceFolders': workspaceFolders,
    };
  }
}

/// Text document specific client capabilities.
final class TextDocumentClientCapabilities {
  const TextDocumentClientCapabilities({
    this.callHierarchy,
    this.codeAction,
    this.codeLens,
    this.colorProvider,
    this.completion,
    this.declaration,
    this.definition,
    this.diagnostic,
    this.documentHighlight,
    this.documentLink,
    this.documentSymbol,
    this.foldingRange,
    this.formatting,
    this.hover,
    this.implementation,
    this.inlayHint,
    this.inlineCompletion,
    this.inlineValue,
    this.linkedEditingRange,
    this.moniker,
    this.onTypeFormatting,
    this.publishDiagnostics,
    this.rangeFormatting,
    this.references,
    this.rename,
    this.selectionRange,
    this.semanticTokens,
    this.signatureHelp,
    this.synchronization,
    this.typeDefinition,
    this.typeHierarchy,
  });

  factory TextDocumentClientCapabilities.fromJson(Map<String, dynamic> json) {
    return TextDocumentClientCapabilities(
      callHierarchy: json['callHierarchy'] == null
          ? null
          : CallHierarchyClientCapabilities.fromJson(
              json['callHierarchy'] as Map<String, dynamic>,
            ),
      codeAction: json['codeAction'] == null
          ? null
          : CodeActionClientCapabilities.fromJson(
              json['codeAction'] as Map<String, dynamic>,
            ),
      codeLens: json['codeLens'] == null
          ? null
          : CodeLensClientCapabilities.fromJson(
              json['codeLens'] as Map<String, dynamic>,
            ),
      colorProvider: json['colorProvider'] == null
          ? null
          : DocumentColorClientCapabilities.fromJson(
              json['colorProvider'] as Map<String, dynamic>,
            ),
      completion: json['completion'] == null
          ? null
          : CompletionClientCapabilities.fromJson(
              json['completion'] as Map<String, dynamic>,
            ),
      declaration: json['declaration'] == null
          ? null
          : DeclarationClientCapabilities.fromJson(
              json['declaration'] as Map<String, dynamic>,
            ),
      definition: json['definition'] == null
          ? null
          : DefinitionClientCapabilities.fromJson(
              json['definition'] as Map<String, dynamic>,
            ),
      diagnostic: json['diagnostic'] == null
          ? null
          : DiagnosticClientCapabilities.fromJson(
              json['diagnostic'] as Map<String, dynamic>,
            ),
      documentHighlight: json['documentHighlight'] == null
          ? null
          : DocumentHighlightClientCapabilities.fromJson(
              json['documentHighlight'] as Map<String, dynamic>,
            ),
      documentLink: json['documentLink'] == null
          ? null
          : DocumentLinkClientCapabilities.fromJson(
              json['documentLink'] as Map<String, dynamic>,
            ),
      documentSymbol: json['documentSymbol'] == null
          ? null
          : DocumentSymbolClientCapabilities.fromJson(
              json['documentSymbol'] as Map<String, dynamic>,
            ),
      foldingRange: json['foldingRange'] == null
          ? null
          : FoldingRangeClientCapabilities.fromJson(
              json['foldingRange'] as Map<String, dynamic>,
            ),
      formatting: json['formatting'] == null
          ? null
          : DocumentFormattingClientCapabilities.fromJson(
              json['formatting'] as Map<String, dynamic>,
            ),
      hover: json['hover'] == null
          ? null
          : HoverClientCapabilities.fromJson(
              json['hover'] as Map<String, dynamic>,
            ),
      implementation: json['implementation'] == null
          ? null
          : ImplementationClientCapabilities.fromJson(
              json['implementation'] as Map<String, dynamic>,
            ),
      inlayHint: json['inlayHint'] == null
          ? null
          : InlayHintClientCapabilities.fromJson(
              json['inlayHint'] as Map<String, dynamic>,
            ),
      inlineCompletion: json['inlineCompletion'] == null
          ? null
          : InlineCompletionClientCapabilities.fromJson(
              json['inlineCompletion'] as Map<String, dynamic>,
            ),
      inlineValue: json['inlineValue'] == null
          ? null
          : InlineValueClientCapabilities.fromJson(
              json['inlineValue'] as Map<String, dynamic>,
            ),
      linkedEditingRange: json['linkedEditingRange'] == null
          ? null
          : LinkedEditingRangeClientCapabilities.fromJson(
              json['linkedEditingRange'] as Map<String, dynamic>,
            ),
      moniker: json['moniker'] == null
          ? null
          : MonikerClientCapabilities.fromJson(
              json['moniker'] as Map<String, dynamic>,
            ),
      onTypeFormatting: json['onTypeFormatting'] == null
          ? null
          : DocumentOnTypeFormattingClientCapabilities.fromJson(
              json['onTypeFormatting'] as Map<String, dynamic>,
            ),
      publishDiagnostics: json['publishDiagnostics'] == null
          ? null
          : PublishDiagnosticsClientCapabilities.fromJson(
              json['publishDiagnostics'] as Map<String, dynamic>,
            ),
      rangeFormatting: json['rangeFormatting'] == null
          ? null
          : DocumentRangeFormattingClientCapabilities.fromJson(
              json['rangeFormatting'] as Map<String, dynamic>,
            ),
      references: json['references'] == null
          ? null
          : ReferenceClientCapabilities.fromJson(
              json['references'] as Map<String, dynamic>,
            ),
      rename: json['rename'] == null
          ? null
          : RenameClientCapabilities.fromJson(
              json['rename'] as Map<String, dynamic>,
            ),
      selectionRange: json['selectionRange'] == null
          ? null
          : SelectionRangeClientCapabilities.fromJson(
              json['selectionRange'] as Map<String, dynamic>,
            ),
      semanticTokens: json['semanticTokens'] == null
          ? null
          : SemanticTokensClientCapabilities.fromJson(
              json['semanticTokens'] as Map<String, dynamic>,
            ),
      signatureHelp: json['signatureHelp'] == null
          ? null
          : SignatureHelpClientCapabilities.fromJson(
              json['signatureHelp'] as Map<String, dynamic>,
            ),
      synchronization: json['synchronization'] == null
          ? null
          : TextDocumentSyncClientCapabilities.fromJson(
              json['synchronization'] as Map<String, dynamic>,
            ),
      typeDefinition: json['typeDefinition'] == null
          ? null
          : TypeDefinitionClientCapabilities.fromJson(
              json['typeDefinition'] as Map<String, dynamic>,
            ),
      typeHierarchy: json['typeHierarchy'] == null
          ? null
          : TypeHierarchyClientCapabilities.fromJson(
              json['typeHierarchy'] as Map<String, dynamic>,
            ),
    );
  }

  /// Capabilities specific to the various call hierarchy requests.
  /// @since 3.16.0
  final CallHierarchyClientCapabilities? callHierarchy;

  /// Capabilities specific to the `textDocument/codeAction` request.
  final CodeActionClientCapabilities? codeAction;

  /// Capabilities specific to the `textDocument/codeLens` request.
  final CodeLensClientCapabilities? codeLens;

  /// Capabilities specific to the `textDocument/documentColor` and the
  /// `textDocument/colorPresentation` request.
  /// @since 3.6.0
  final DocumentColorClientCapabilities? colorProvider;

  /// Capabilities specific to the `textDocument/completion` request.
  final CompletionClientCapabilities? completion;

  /// Capabilities specific to the `textDocument/declaration` request.
  /// @since 3.14.0
  final DeclarationClientCapabilities? declaration;

  /// Capabilities specific to the `textDocument/definition` request.
  final DefinitionClientCapabilities? definition;

  /// Capabilities specific to the diagnostic pull model.
  /// @since 3.17.0
  final DiagnosticClientCapabilities? diagnostic;

  /// Capabilities specific to the `textDocument/documentHighlight` request.
  final DocumentHighlightClientCapabilities? documentHighlight;

  /// Capabilities specific to the `textDocument/documentLink` request.
  final DocumentLinkClientCapabilities? documentLink;

  /// Capabilities specific to the `textDocument/documentSymbol` request.
  final DocumentSymbolClientCapabilities? documentSymbol;

  /// Capabilities specific to the `textDocument/foldingRange` request.
  /// @since 3.10.0
  final FoldingRangeClientCapabilities? foldingRange;

  /// Capabilities specific to the `textDocument/formatting` request.
  final DocumentFormattingClientCapabilities? formatting;

  /// Capabilities specific to the `textDocument/hover` request.
  final HoverClientCapabilities? hover;

  /// Capabilities specific to the `textDocument/implementation` request.
  /// @since 3.6.0
  final ImplementationClientCapabilities? implementation;

  /// Capabilities specific to the `textDocument/inlayHint` request.
  /// @since 3.17.0
  final InlayHintClientCapabilities? inlayHint;

  /// Client capabilities specific to inline completions.
  /// @since 3.18.0 @proposed
  final InlineCompletionClientCapabilities? inlineCompletion;

  /// Capabilities specific to the `textDocument/inlineValue` request.
  /// @since 3.17.0
  final InlineValueClientCapabilities? inlineValue;

  /// Capabilities specific to the `textDocument/linkedEditingRange` request.
  /// @since 3.16.0
  final LinkedEditingRangeClientCapabilities? linkedEditingRange;

  /// Client capabilities specific to the `textDocument/moniker` request.
  /// @since 3.16.0
  final MonikerClientCapabilities? moniker;

  /// Capabilities specific to the `textDocument/onTypeFormatting` request.
  final DocumentOnTypeFormattingClientCapabilities? onTypeFormatting;

  /// Capabilities specific to the `textDocument/publishDiagnostics` notification.
  final PublishDiagnosticsClientCapabilities? publishDiagnostics;

  /// Capabilities specific to the `textDocument/rangeFormatting` request.
  final DocumentRangeFormattingClientCapabilities? rangeFormatting;

  /// Capabilities specific to the `textDocument/references` request.
  final ReferenceClientCapabilities? references;

  /// Capabilities specific to the `textDocument/rename` request.
  final RenameClientCapabilities? rename;

  /// Capabilities specific to the `textDocument/selectionRange` request.
  /// @since 3.15.0
  final SelectionRangeClientCapabilities? selectionRange;

  /// Capabilities specific to the various semantic token request.
  /// @since 3.16.0
  final SemanticTokensClientCapabilities? semanticTokens;

  /// Capabilities specific to the `textDocument/signatureHelp` request.
  final SignatureHelpClientCapabilities? signatureHelp;

  /// Defines which synchronization capabilities the client supports.
  final TextDocumentSyncClientCapabilities? synchronization;

  /// Capabilities specific to the `textDocument/typeDefinition` request.
  /// @since 3.6.0
  final TypeDefinitionClientCapabilities? typeDefinition;

  /// Capabilities specific to the various type hierarchy requests.
  /// @since 3.17.0
  final TypeHierarchyClientCapabilities? typeHierarchy;

  Map<String, dynamic> toJson() {
    return {
      'callHierarchy': callHierarchy?.toJson(),
      'codeAction': codeAction?.toJson(),
      'codeLens': codeLens?.toJson(),
      'colorProvider': colorProvider?.toJson(),
      'completion': completion?.toJson(),
      'declaration': declaration?.toJson(),
      'definition': definition?.toJson(),
      'diagnostic': diagnostic?.toJson(),
      'documentHighlight': documentHighlight?.toJson(),
      'documentLink': documentLink?.toJson(),
      'documentSymbol': documentSymbol?.toJson(),
      'foldingRange': foldingRange?.toJson(),
      'formatting': formatting?.toJson(),
      'hover': hover?.toJson(),
      'implementation': implementation?.toJson(),
      'inlayHint': inlayHint?.toJson(),
      'inlineCompletion': inlineCompletion?.toJson(),
      'inlineValue': inlineValue?.toJson(),
      'linkedEditingRange': linkedEditingRange?.toJson(),
      'moniker': moniker?.toJson(),
      'onTypeFormatting': onTypeFormatting?.toJson(),
      'publishDiagnostics': publishDiagnostics?.toJson(),
      'rangeFormatting': rangeFormatting?.toJson(),
      'references': references?.toJson(),
      'rename': rename?.toJson(),
      'selectionRange': selectionRange?.toJson(),
      'semanticTokens': semanticTokens?.toJson(),
      'signatureHelp': signatureHelp?.toJson(),
      'synchronization': synchronization?.toJson(),
      'typeDefinition': typeDefinition?.toJson(),
      'typeHierarchy': typeHierarchy?.toJson(),
    };
  }
}

/// Capabilities specific to the notebook document support.
/// @since 3.17.0
final class NotebookDocumentClientCapabilities {
  const NotebookDocumentClientCapabilities({required this.synchronization});

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotebookDocumentClientCapabilities(
      synchronization: NotebookDocumentSyncClientCapabilities.fromJson(
        json['synchronization'] as Map<String, dynamic>,
      ),
    );
  }

  /// Capabilities specific to notebook document synchronization
  /// @since 3.17.0
  final NotebookDocumentSyncClientCapabilities synchronization;

  Map<String, dynamic> toJson() {
    return {'synchronization': synchronization.toJson()};
  }
}

final class WindowClientCapabilities {
  const WindowClientCapabilities({
    this.showDocument,
    this.showMessage,
    this.workDoneProgress,
  });

  factory WindowClientCapabilities.fromJson(Map<String, dynamic> json) {
    return WindowClientCapabilities(
      showDocument: json['showDocument'] == null
          ? null
          : ShowDocumentClientCapabilities.fromJson(
              json['showDocument'] as Map<String, dynamic>,
            ),
      showMessage: json['showMessage'] == null
          ? null
          : ShowMessageRequestClientCapabilities.fromJson(
              json['showMessage'] as Map<String, dynamic>,
            ),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );
  }

  /// Capabilities specific to the showDocument request.
  /// @since 3.16.0
  final ShowDocumentClientCapabilities? showDocument;

  /// Capabilities specific to the showMessage request.
  /// @since 3.16.0
  final ShowMessageRequestClientCapabilities? showMessage;

  /// It indicates whether the client supports server initiated progress using
  /// the `window/workDoneProgress/create` request.
  /// The capability also controls Whether client supports handling of progress
  /// notifications. If set servers are allowed to report a `workDoneProgress`
  /// property in the request specific server capabilities.
  /// @since 3.15.0
  final bool? workDoneProgress;

  Map<String, dynamic> toJson() {
    return {
      'showDocument': showDocument?.toJson(),
      'showMessage': showMessage?.toJson(),
      'workDoneProgress': workDoneProgress,
    };
  }
}

/// General client capabilities.
/// @since 3.16.0
final class GeneralClientCapabilities {
  const GeneralClientCapabilities({
    this.markdown,
    this.positionEncodings,
    this.regularExpressions,
    this.staleRequestSupport,
  });

  factory GeneralClientCapabilities.fromJson(Map<String, dynamic> json) {
    return GeneralClientCapabilities(
      markdown: json['markdown'] == null
          ? null
          : MarkdownClientCapabilities.fromJson(
              json['markdown'] as Map<String, dynamic>,
            ),
      positionEncodings: json['positionEncodings'] == null
          ? null
          : (json['positionEncodings'] as List)
                .map((e) => PositionEncodingKind.fromJson(e))
                .toList(),
      regularExpressions: json['regularExpressions'] == null
          ? null
          : RegularExpressionsClientCapabilities.fromJson(
              json['regularExpressions'] as Map<String, dynamic>,
            ),
      staleRequestSupport: json['staleRequestSupport'] as Map<String, dynamic>?,
    );
  }

  /// Client capabilities specific to the client's markdown parser.
  /// @since 3.16.0
  final MarkdownClientCapabilities? markdown;

  /// The position encodings supported by the client. Client and server have to
  /// agree on the same position encoding to ensure that offsets (e.g. character
  /// position in a line) are interpreted the same on both sides.
  /// To keep the protocol backwards compatible the following applies: if the
  /// value 'utf-16' is missing from the array of position encodings servers can
  /// assume that the client supports UTF-16. UTF-16 is therefore a mandatory
  /// encoding.
  /// If omitted it defaults to ['utf-16'].
  /// Implementation considerations: since the conversion from one encoding into
  /// another requires the content of the file / line the conversion is best done
  /// where the file is read which is usually on the server side.
  /// @since 3.17.0
  final List<PositionEncodingKind>? positionEncodings;

  /// Client capabilities specific to regular expressions.
  /// @since 3.16.0
  final RegularExpressionsClientCapabilities? regularExpressions;

  /// Client capability that signals how the client handles stale requests (e.g.
  /// a request for which the client will not process the response anymore since
  /// the information is outdated).
  /// @since 3.17.0
  final Map<String, dynamic>? staleRequestSupport;

  Map<String, dynamic> toJson() {
    return {
      'markdown': markdown?.toJson(),
      'positionEncodings': positionEncodings?.map((e) => e.toJson()).toList(),
      'regularExpressions': regularExpressions?.toJson(),
      'staleRequestSupport': staleRequestSupport,
    };
  }
}

/// A relative pattern is a helper to construct glob patterns that are matched
/// relatively to a base URI. The common value for a `baseUri` is a workspace
/// folder root, but it can be another absolute URI as well.
/// @since 3.17.0
final class RelativePattern {
  const RelativePattern({required this.baseUri, required this.pattern});

  factory RelativePattern.fromJson(Map<String, dynamic> json) {
    return RelativePattern(
      baseUri: json['baseUri'],
      pattern: json['pattern'] as Pattern,
    );
  }

  /// A workspace folder or a base URI to which this pattern will be matched
  /// against relatively.
  final Object? baseUri;

  /// The actual glob pattern;
  final Pattern pattern;

  Map<String, dynamic> toJson() {
    return {'baseUri': baseUri, 'pattern': pattern};
  }
}

final class WorkspaceEditClientCapabilities {
  const WorkspaceEditClientCapabilities({
    this.changeAnnotationSupport,
    this.documentChanges,
    this.failureHandling,
    this.normalizesLineEndings,
    this.resourceOperations,
  });

  factory WorkspaceEditClientCapabilities.fromJson(Map<String, dynamic> json) {
    return WorkspaceEditClientCapabilities(
      changeAnnotationSupport:
          json['changeAnnotationSupport'] as Map<String, dynamic>?,
      documentChanges: json['documentChanges'] as bool?,
      failureHandling: json['failureHandling'] == null
          ? null
          : FailureHandlingKind.fromJson(json['failureHandling']),
      normalizesLineEndings: json['normalizesLineEndings'] as bool?,
      resourceOperations: json['resourceOperations'] == null
          ? null
          : (json['resourceOperations'] as List)
                .map((e) => ResourceOperationKind.fromJson(e))
                .toList(),
    );
  }

  /// Whether the client in general supports change annotations on text edits,
  /// create file, rename file and delete file changes.
  /// @since 3.16.0
  final Map<String, dynamic>? changeAnnotationSupport;

  /// The client supports versioned document changes in `WorkspaceEdit`s
  final bool? documentChanges;

  /// The failure handling strategy of a client if applying the workspace edit
  /// fails.
  /// @since 3.13.0
  final FailureHandlingKind? failureHandling;

  /// Whether the client normalizes line endings to the client specific setting.
  /// If set to `true` the client will normalize line ending characters in a
  /// workspace edit to the client-specified new line character.
  /// @since 3.16.0
  final bool? normalizesLineEndings;

  /// The resource operations the client supports. Clients should at least
  /// support 'create', 'rename' and 'delete' files and folders.
  /// @since 3.13.0
  final List<ResourceOperationKind>? resourceOperations;

  Map<String, dynamic> toJson() {
    return {
      'changeAnnotationSupport': changeAnnotationSupport,
      'documentChanges': documentChanges,
      'failureHandling': failureHandling?.toJson(),
      'normalizesLineEndings': normalizesLineEndings,
      'resourceOperations': resourceOperations?.map((e) => e.toJson()).toList(),
    };
  }
}

final class DidChangeConfigurationClientCapabilities {
  const DidChangeConfigurationClientCapabilities({this.dynamicRegistration});

  factory DidChangeConfigurationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return DidChangeConfigurationClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Did change configuration notification supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

final class DidChangeWatchedFilesClientCapabilities {
  const DidChangeWatchedFilesClientCapabilities({
    this.dynamicRegistration,
    this.relativePatternSupport,
  });

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return DidChangeWatchedFilesClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      relativePatternSupport: json['relativePatternSupport'] as bool?,
    );
  }

  /// Did change watched files notification supports dynamic registration. Please
  /// note that the current protocol doesn't support static configuration for
  /// file changes from the server side.
  final bool? dynamicRegistration;

  /// Whether the client has support for {@link RelativePattern relative pattern}
  /// or not.
  /// @since 3.17.0
  final bool? relativePatternSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'relativePatternSupport': relativePatternSupport,
    };
  }
}

/// Client capabilities for a {@link WorkspaceSymbolRequest}.
final class WorkspaceSymbolClientCapabilities {
  const WorkspaceSymbolClientCapabilities({
    this.dynamicRegistration,
    this.resolveSupport,
    this.symbolKind,
    this.tagSupport,
  });

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return WorkspaceSymbolClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      resolveSupport: json['resolveSupport'] as Map<String, dynamic>?,
      symbolKind: json['symbolKind'] as Map<String, dynamic>?,
      tagSupport: json['tagSupport'] as Map<String, dynamic>?,
    );
  }

  /// Symbol request supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client support partial workspace symbols. The client will send the
  /// request `workspaceSymbol/resolve` to the server to resolve additional
  /// properties.
  /// @since 3.17.0
  final Map<String, dynamic>? resolveSupport;

  /// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
  /// request.
  final Map<String, dynamic>? symbolKind;

  /// The client supports tags on `SymbolInformation`. Clients supporting tags
  /// have to handle unknown tags gracefully.
  /// @since 3.16.0
  final Map<String, dynamic>? tagSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'resolveSupport': resolveSupport,
      'symbolKind': symbolKind,
      'tagSupport': tagSupport,
    };
  }
}

/// The client capabilities of a {@link ExecuteCommandRequest}.
final class ExecuteCommandClientCapabilities {
  const ExecuteCommandClientCapabilities({this.dynamicRegistration});

  factory ExecuteCommandClientCapabilities.fromJson(Map<String, dynamic> json) {
    return ExecuteCommandClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Execute command supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.16.0
final class SemanticTokensWorkspaceClientCapabilities {
  const SemanticTokensWorkspaceClientCapabilities({this.refreshSupport});

  factory SemanticTokensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return SemanticTokensWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );
  }

  /// Whether the client implementation supports a refresh request sent from the
  /// server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// semantic tokens currently shown. It should be used with absolute care and
  /// is useful for situation where a server for example detects a project wide
  /// change that requires such a calculation.
  final bool? refreshSupport;

  Map<String, dynamic> toJson() {
    return {'refreshSupport': refreshSupport};
  }
}

/// @since 3.16.0
final class CodeLensWorkspaceClientCapabilities {
  const CodeLensWorkspaceClientCapabilities({this.refreshSupport});

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return CodeLensWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );
  }

  /// Whether the client implementation supports a refresh request sent from the
  /// server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// code lenses currently shown. It should be used with absolute care and is
  /// useful for situation where a server for example detect a project wide
  /// change that requires such a calculation.
  final bool? refreshSupport;

  Map<String, dynamic> toJson() {
    return {'refreshSupport': refreshSupport};
  }
}

/// Capabilities relating to events from file operations by the user in the
/// client.
/// These events do not come from the file system, they come from user
/// operations like renaming a file in the UI.
/// @since 3.16.0
final class FileOperationClientCapabilities {
  const FileOperationClientCapabilities({
    this.didCreate,
    this.didDelete,
    this.didRename,
    this.dynamicRegistration,
    this.willCreate,
    this.willDelete,
    this.willRename,
  });

  factory FileOperationClientCapabilities.fromJson(Map<String, dynamic> json) {
    return FileOperationClientCapabilities(
      didCreate: json['didCreate'] as bool?,
      didDelete: json['didDelete'] as bool?,
      didRename: json['didRename'] as bool?,
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      willCreate: json['willCreate'] as bool?,
      willDelete: json['willDelete'] as bool?,
      willRename: json['willRename'] as bool?,
    );
  }

  /// The client has support for sending didCreateFiles notifications.
  final bool? didCreate;

  /// The client has support for sending didDeleteFiles notifications.
  final bool? didDelete;

  /// The client has support for sending didRenameFiles notifications.
  final bool? didRename;

  /// Whether the client supports dynamic registration for file
  /// requests/notifications.
  final bool? dynamicRegistration;

  /// The client has support for sending willCreateFiles requests.
  final bool? willCreate;

  /// The client has support for sending willDeleteFiles requests.
  final bool? willDelete;

  /// The client has support for sending willRenameFiles requests.
  final bool? willRename;

  Map<String, dynamic> toJson() {
    return {
      'didCreate': didCreate,
      'didDelete': didDelete,
      'didRename': didRename,
      'dynamicRegistration': dynamicRegistration,
      'willCreate': willCreate,
      'willDelete': willDelete,
      'willRename': willRename,
    };
  }
}

/// Client workspace capabilities specific to inline values.
/// @since 3.17.0
final class InlineValueWorkspaceClientCapabilities {
  const InlineValueWorkspaceClientCapabilities({this.refreshSupport});

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return InlineValueWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );
  }

  /// Whether the client implementation supports a refresh request sent from the
  /// server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// inline values currently shown. It should be used with absolute care and is
  /// useful for situation where a server for example detects a project wide
  /// change that requires such a calculation.
  final bool? refreshSupport;

  Map<String, dynamic> toJson() {
    return {'refreshSupport': refreshSupport};
  }
}

/// Client workspace capabilities specific to inlay hints.
/// @since 3.17.0
final class InlayHintWorkspaceClientCapabilities {
  const InlayHintWorkspaceClientCapabilities({this.refreshSupport});

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return InlayHintWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );
  }

  /// Whether the client implementation supports a refresh request sent from the
  /// server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// inlay hints currently shown. It should be used with absolute care and is
  /// useful for situation where a server for example detects a project wide
  /// change that requires such a calculation.
  final bool? refreshSupport;

  Map<String, dynamic> toJson() {
    return {'refreshSupport': refreshSupport};
  }
}

/// Workspace client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
final class DiagnosticWorkspaceClientCapabilities {
  const DiagnosticWorkspaceClientCapabilities({this.refreshSupport});

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return DiagnosticWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );
  }

  /// Whether the client implementation supports a refresh request sent from the
  /// server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// pulled diagnostics currently shown. It should be used with absolute care
  /// and is useful for situation where a server for example detects a project
  /// wide change that requires such a calculation.
  final bool? refreshSupport;

  Map<String, dynamic> toJson() {
    return {'refreshSupport': refreshSupport};
  }
}

/// Client workspace capabilities specific to folding ranges
/// @since 3.18.0 @proposed
final class FoldingRangeWorkspaceClientCapabilities {
  const FoldingRangeWorkspaceClientCapabilities({this.refreshSupport});

  factory FoldingRangeWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoldingRangeWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );
  }

  /// Whether the client implementation supports a refresh request sent from the
  /// server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// folding ranges currently shown. It should be used with absolute care and is
  /// useful for situation where a server for example detects a project wide
  /// change that requires such a calculation.
  /// @since 3.18.0 @proposed
  final bool? refreshSupport;

  Map<String, dynamic> toJson() {
    return {'refreshSupport': refreshSupport};
  }
}

final class TextDocumentSyncClientCapabilities {
  const TextDocumentSyncClientCapabilities({
    this.didSave,
    this.dynamicRegistration,
    this.willSave,
    this.willSaveWaitUntil,
  });

  factory TextDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return TextDocumentSyncClientCapabilities(
      didSave: json['didSave'] as bool?,
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      willSave: json['willSave'] as bool?,
      willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
    );
  }

  /// The client supports did save notifications.
  final bool? didSave;

  /// Whether text document synchronization supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports sending will save notifications.
  final bool? willSave;

  /// The client supports sending a will save request and waits for a response
  /// providing text edits which will be applied to the document before it is
  /// saved.
  final bool? willSaveWaitUntil;

  Map<String, dynamic> toJson() {
    return {
      'didSave': didSave,
      'dynamicRegistration': dynamicRegistration,
      'willSave': willSave,
      'willSaveWaitUntil': willSaveWaitUntil,
    };
  }
}

/// Completion client capabilities
final class CompletionClientCapabilities {
  const CompletionClientCapabilities({
    this.completionItem,
    this.completionItemKind,
    this.completionList,
    this.contextSupport,
    this.dynamicRegistration,
    this.insertTextMode,
  });

  factory CompletionClientCapabilities.fromJson(Map<String, dynamic> json) {
    return CompletionClientCapabilities(
      completionItem: json['completionItem'] as Map<String, dynamic>?,
      completionItemKind: json['completionItemKind'] as Map<String, dynamic>?,
      completionList: json['completionList'] as Map<String, dynamic>?,
      contextSupport: json['contextSupport'] as bool?,
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      insertTextMode: json['insertTextMode'] == null
          ? null
          : InsertTextMode.fromJson(json['insertTextMode']),
    );
  }

  /// The client supports the following `CompletionItem` specific capabilities.
  final Map<String, dynamic>? completionItem;

  final Map<String, dynamic>? completionItemKind;

  /// The client supports the following `CompletionList` specific capabilities.
  /// @since 3.17.0
  final Map<String, dynamic>? completionList;

  /// The client supports to send additional context information for a
  /// `textDocument/completion` request.
  final bool? contextSupport;

  /// Whether completion supports dynamic registration.
  final bool? dynamicRegistration;

  /// Defines how the client handles whitespace and indentation when accepting a
  /// completion item that uses multi line text in either `insertText` or
  /// `textEdit`.
  /// @since 3.17.0
  final InsertTextMode? insertTextMode;

  Map<String, dynamic> toJson() {
    return {
      'completionItem': completionItem,
      'completionItemKind': completionItemKind,
      'completionList': completionList,
      'contextSupport': contextSupport,
      'dynamicRegistration': dynamicRegistration,
      'insertTextMode': insertTextMode?.toJson(),
    };
  }
}

final class HoverClientCapabilities {
  const HoverClientCapabilities({this.contentFormat, this.dynamicRegistration});

  factory HoverClientCapabilities.fromJson(Map<String, dynamic> json) {
    return HoverClientCapabilities(
      contentFormat: json['contentFormat'] == null
          ? null
          : (json['contentFormat'] as List)
                .map((e) => MarkupKind.fromJson(e))
                .toList(),
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Client supports the following content formats for the content property. The
  /// order describes the preferred format of the client.
  final List<MarkupKind>? contentFormat;

  /// Whether hover supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {
      'contentFormat': contentFormat?.map((e) => e.toJson()).toList(),
      'dynamicRegistration': dynamicRegistration,
    };
  }
}

/// Client Capabilities for a {@link SignatureHelpRequest}.
final class SignatureHelpClientCapabilities {
  const SignatureHelpClientCapabilities({
    this.contextSupport,
    this.dynamicRegistration,
    this.signatureInformation,
  });

  factory SignatureHelpClientCapabilities.fromJson(Map<String, dynamic> json) {
    return SignatureHelpClientCapabilities(
      contextSupport: json['contextSupport'] as bool?,
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      signatureInformation:
          json['signatureInformation'] as Map<String, dynamic>?,
    );
  }

  /// The client supports to send additional context information for a
  /// `textDocument/signatureHelp` request. A client that opts into
  /// contextSupport will also support the `retriggerCharacters` on
  /// `SignatureHelpOptions`.
  /// @since 3.15.0
  final bool? contextSupport;

  /// Whether signature help supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports the following `SignatureInformation` specific
  /// properties.
  final Map<String, dynamic>? signatureInformation;

  Map<String, dynamic> toJson() {
    return {
      'contextSupport': contextSupport,
      'dynamicRegistration': dynamicRegistration,
      'signatureInformation': signatureInformation,
    };
  }
}

/// @since 3.14.0
final class DeclarationClientCapabilities {
  const DeclarationClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory DeclarationClientCapabilities.fromJson(Map<String, dynamic> json) {
    return DeclarationClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      linkSupport: json['linkSupport'] as bool?,
    );
  }

  /// Whether declaration supports dynamic registration. If this is set to `true`
  /// the client supports the new `DeclarationRegistrationOptions` return value
  /// for the corresponding server capability as well.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of declaration links.
  final bool? linkSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Client Capabilities for a {@link DefinitionRequest}.
final class DefinitionClientCapabilities {
  const DefinitionClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory DefinitionClientCapabilities.fromJson(Map<String, dynamic> json) {
    return DefinitionClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      linkSupport: json['linkSupport'] as bool?,
    );
  }

  /// Whether definition supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// @since 3.14.0
  final bool? linkSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Since 3.6.0
final class TypeDefinitionClientCapabilities {
  const TypeDefinitionClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory TypeDefinitionClientCapabilities.fromJson(Map<String, dynamic> json) {
    return TypeDefinitionClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      linkSupport: json['linkSupport'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `TypeDefinitionRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// Since 3.14.0
  final bool? linkSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// @since 3.6.0
final class ImplementationClientCapabilities {
  const ImplementationClientCapabilities({
    this.dynamicRegistration,
    this.linkSupport,
  });

  factory ImplementationClientCapabilities.fromJson(Map<String, dynamic> json) {
    return ImplementationClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      linkSupport: json['linkSupport'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `ImplementationRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// @since 3.14.0
  final bool? linkSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'linkSupport': linkSupport,
    };
  }
}

/// Client Capabilities for a {@link ReferencesRequest}.
final class ReferenceClientCapabilities {
  const ReferenceClientCapabilities({this.dynamicRegistration});

  factory ReferenceClientCapabilities.fromJson(Map<String, dynamic> json) {
    return ReferenceClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether references supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Client Capabilities for a {@link DocumentHighlightRequest}.
final class DocumentHighlightClientCapabilities {
  const DocumentHighlightClientCapabilities({this.dynamicRegistration});

  factory DocumentHighlightClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentHighlightClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether document highlight supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Client Capabilities for a {@link DocumentSymbolRequest}.
final class DocumentSymbolClientCapabilities {
  const DocumentSymbolClientCapabilities({
    this.dynamicRegistration,
    this.hierarchicalDocumentSymbolSupport,
    this.labelSupport,
    this.symbolKind,
    this.tagSupport,
  });

  factory DocumentSymbolClientCapabilities.fromJson(Map<String, dynamic> json) {
    return DocumentSymbolClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      hierarchicalDocumentSymbolSupport:
          json['hierarchicalDocumentSymbolSupport'] as bool?,
      labelSupport: json['labelSupport'] as bool?,
      symbolKind: json['symbolKind'] as Map<String, dynamic>?,
      tagSupport: json['tagSupport'] as Map<String, dynamic>?,
    );
  }

  /// Whether document symbol supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports hierarchical document symbols.
  final bool? hierarchicalDocumentSymbolSupport;

  /// The client supports an additional label presented in the UI when
  /// registering a document symbol provider.
  /// @since 3.16.0
  final bool? labelSupport;

  /// Specific capabilities for the `SymbolKind` in the
  /// `textDocument/documentSymbol` request.
  final Map<String, dynamic>? symbolKind;

  /// The client supports tags on `SymbolInformation`. Tags are supported on
  /// `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
  /// Clients supporting tags have to handle unknown tags gracefully.
  /// @since 3.16.0
  final Map<String, dynamic>? tagSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'hierarchicalDocumentSymbolSupport': hierarchicalDocumentSymbolSupport,
      'labelSupport': labelSupport,
      'symbolKind': symbolKind,
      'tagSupport': tagSupport,
    };
  }
}

/// The Client Capabilities of a {@link CodeActionRequest}.
final class CodeActionClientCapabilities {
  const CodeActionClientCapabilities({
    this.codeActionLiteralSupport,
    this.dataSupport,
    this.disabledSupport,
    this.dynamicRegistration,
    this.honorsChangeAnnotations,
    this.isPreferredSupport,
    this.resolveSupport,
  });

  factory CodeActionClientCapabilities.fromJson(Map<String, dynamic> json) {
    return CodeActionClientCapabilities(
      codeActionLiteralSupport:
          json['codeActionLiteralSupport'] as Map<String, dynamic>?,
      dataSupport: json['dataSupport'] as bool?,
      disabledSupport: json['disabledSupport'] as bool?,
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
      isPreferredSupport: json['isPreferredSupport'] as bool?,
      resolveSupport: json['resolveSupport'] as Map<String, dynamic>?,
    );
  }

  /// The client support code action literals of type `CodeAction` as a valid
  /// response of the `textDocument/codeAction` request. If the property is not
  /// set the request can only return `Command` literals.
  /// @since 3.8.0
  final Map<String, dynamic>? codeActionLiteralSupport;

  /// Whether code action supports the `data` property which is preserved between
  /// a `textDocument/codeAction` and a `codeAction/resolve` request.
  /// @since 3.16.0
  final bool? dataSupport;

  /// Whether code action supports the `disabled` property.
  /// @since 3.16.0
  final bool? disabledSupport;

  /// Whether code action supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client honors the change annotations in text edits and resource
  /// operations returned via the `CodeAction#edit` property by for example
  /// presenting the workspace edit in the user interface and asking for
  /// confirmation.
  /// @since 3.16.0
  final bool? honorsChangeAnnotations;

  /// Whether code action supports the `isPreferred` property.
  /// @since 3.15.0
  final bool? isPreferredSupport;

  /// Whether the client supports resolving additional code action properties via
  /// a separate `codeAction/resolve` request.
  /// @since 3.16.0
  final Map<String, dynamic>? resolveSupport;

  Map<String, dynamic> toJson() {
    return {
      'codeActionLiteralSupport': codeActionLiteralSupport,
      'dataSupport': dataSupport,
      'disabledSupport': disabledSupport,
      'dynamicRegistration': dynamicRegistration,
      'honorsChangeAnnotations': honorsChangeAnnotations,
      'isPreferredSupport': isPreferredSupport,
      'resolveSupport': resolveSupport,
    };
  }
}

/// The client capabilities  of a {@link CodeLensRequest}.
final class CodeLensClientCapabilities {
  const CodeLensClientCapabilities({this.dynamicRegistration});

  factory CodeLensClientCapabilities.fromJson(Map<String, dynamic> json) {
    return CodeLensClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether code lens supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// The client capabilities of a {@link DocumentLinkRequest}.
final class DocumentLinkClientCapabilities {
  const DocumentLinkClientCapabilities({
    this.dynamicRegistration,
    this.tooltipSupport,
  });

  factory DocumentLinkClientCapabilities.fromJson(Map<String, dynamic> json) {
    return DocumentLinkClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      tooltipSupport: json['tooltipSupport'] as bool?,
    );
  }

  /// Whether document link supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client supports the `tooltip` property on `DocumentLink`.
  /// @since 3.15.0
  final bool? tooltipSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'tooltipSupport': tooltipSupport,
    };
  }
}

final class DocumentColorClientCapabilities {
  const DocumentColorClientCapabilities({this.dynamicRegistration});

  factory DocumentColorClientCapabilities.fromJson(Map<String, dynamic> json) {
    return DocumentColorClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `DocumentColorRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities of a {@link DocumentFormattingRequest}.
final class DocumentFormattingClientCapabilities {
  const DocumentFormattingClientCapabilities({this.dynamicRegistration});

  factory DocumentFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentFormattingClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether formatting supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
final class DocumentRangeFormattingClientCapabilities {
  const DocumentRangeFormattingClientCapabilities({
    this.dynamicRegistration,
    this.rangesSupport,
  });

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentRangeFormattingClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      rangesSupport: json['rangesSupport'] as bool?,
    );
  }

  /// Whether range formatting supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  final bool? rangesSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'rangesSupport': rangesSupport,
    };
  }
}

/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
final class DocumentOnTypeFormattingClientCapabilities {
  const DocumentOnTypeFormattingClientCapabilities({this.dynamicRegistration});

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentOnTypeFormattingClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether on type formatting supports dynamic registration.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

final class RenameClientCapabilities {
  const RenameClientCapabilities({
    this.dynamicRegistration,
    this.honorsChangeAnnotations,
    this.prepareSupport,
    this.prepareSupportDefaultBehavior,
  });

  factory RenameClientCapabilities.fromJson(Map<String, dynamic> json) {
    return RenameClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
      prepareSupport: json['prepareSupport'] as bool?,
      prepareSupportDefaultBehavior:
          json['prepareSupportDefaultBehavior'] == null
          ? null
          : PrepareSupportDefaultBehavior.fromJson(
              json['prepareSupportDefaultBehavior'],
            ),
    );
  }

  /// Whether rename supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client honors the change annotations in text edits and resource
  /// operations returned via the rename request's workspace edit by for example
  /// presenting the workspace edit in the user interface and asking for
  /// confirmation.
  /// @since 3.16.0
  final bool? honorsChangeAnnotations;

  /// Client supports testing for validity of rename operations before execution.
  /// @since 3.12.0
  final bool? prepareSupport;

  /// Client supports the default behavior result.
  /// The value indicates the default behavior used by the client.
  /// @since 3.16.0
  final PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'honorsChangeAnnotations': honorsChangeAnnotations,
      'prepareSupport': prepareSupport,
      'prepareSupportDefaultBehavior': prepareSupportDefaultBehavior?.toJson(),
    };
  }
}

final class FoldingRangeClientCapabilities {
  const FoldingRangeClientCapabilities({
    this.dynamicRegistration,
    this.foldingRange,
    this.foldingRangeKind,
    this.lineFoldingOnly,
    this.rangeLimit,
  });

  factory FoldingRangeClientCapabilities.fromJson(Map<String, dynamic> json) {
    return FoldingRangeClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      foldingRange: json['foldingRange'] as Map<String, dynamic>?,
      foldingRangeKind: json['foldingRangeKind'] as Map<String, dynamic>?,
      lineFoldingOnly: json['lineFoldingOnly'] as bool?,
      rangeLimit: json['rangeLimit'] as int?,
    );
  }

  /// Whether implementation supports dynamic registration for folding range
  /// providers. If this is set to `true` the client supports the new
  /// `FoldingRangeRegistrationOptions` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  /// Specific options for the folding range.
  /// @since 3.17.0
  final Map<String, dynamic>? foldingRange;

  /// Specific options for the folding range kind.
  /// @since 3.17.0
  final Map<String, dynamic>? foldingRangeKind;

  /// If set, the client signals that it only supports folding complete lines. If
  /// set, client will ignore specified `startCharacter` and `endCharacter`
  /// properties in a FoldingRange.
  final bool? lineFoldingOnly;

  /// The maximum number of folding ranges that the client prefers to receive per
  /// document. The value serves as a hint, servers are free to follow the limit.
  final int? rangeLimit;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'foldingRange': foldingRange,
      'foldingRangeKind': foldingRangeKind,
      'lineFoldingOnly': lineFoldingOnly,
      'rangeLimit': rangeLimit,
    };
  }
}

final class SelectionRangeClientCapabilities {
  const SelectionRangeClientCapabilities({this.dynamicRegistration});

  factory SelectionRangeClientCapabilities.fromJson(Map<String, dynamic> json) {
    return SelectionRangeClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration for selection range
  /// providers. If this is set to `true` the client supports the new
  /// `SelectionRangeRegistrationOptions` return value for the corresponding
  /// server capability as well.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// The publish diagnostic client capabilities.
final class PublishDiagnosticsClientCapabilities {
  const PublishDiagnosticsClientCapabilities({
    this.codeDescriptionSupport,
    this.dataSupport,
    this.relatedInformation,
    this.tagSupport,
    this.versionSupport,
  });

  factory PublishDiagnosticsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return PublishDiagnosticsClientCapabilities(
      codeDescriptionSupport: json['codeDescriptionSupport'] as bool?,
      dataSupport: json['dataSupport'] as bool?,
      relatedInformation: json['relatedInformation'] as bool?,
      tagSupport: json['tagSupport'] as Map<String, dynamic>?,
      versionSupport: json['versionSupport'] as bool?,
    );
  }

  /// Client supports a codeDescription property
  /// @since 3.16.0
  final bool? codeDescriptionSupport;

  /// Whether code action supports the `data` property which is preserved between
  /// a `textDocument/publishDiagnostics` and `textDocument/codeAction` request.
  /// @since 3.16.0
  final bool? dataSupport;

  /// Whether the clients accepts diagnostics with related information.
  final bool? relatedInformation;

  /// Client supports the tag property to provide meta data about a diagnostic.
  /// Clients supporting tags have to handle unknown tags gracefully.
  /// @since 3.15.0
  final Map<String, dynamic>? tagSupport;

  /// Whether the client interprets the version property of the
  /// `textDocument/publishDiagnostics` notification's parameter.
  /// @since 3.15.0
  final bool? versionSupport;

  Map<String, dynamic> toJson() {
    return {
      'codeDescriptionSupport': codeDescriptionSupport,
      'dataSupport': dataSupport,
      'relatedInformation': relatedInformation,
      'tagSupport': tagSupport,
      'versionSupport': versionSupport,
    };
  }
}

/// @since 3.16.0
final class CallHierarchyClientCapabilities {
  const CallHierarchyClientCapabilities({this.dynamicRegistration});

  factory CallHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) {
    return CallHierarchyClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.16.0
final class SemanticTokensClientCapabilities {
  const SemanticTokensClientCapabilities({
    this.augmentsSyntaxTokens,
    this.dynamicRegistration,
    required this.formats,
    this.multilineTokenSupport,
    this.overlappingTokenSupport,
    required this.requests,
    this.serverCancelSupport,
    required this.tokenModifiers,
    required this.tokenTypes,
  });

  factory SemanticTokensClientCapabilities.fromJson(Map<String, dynamic> json) {
    return SemanticTokensClientCapabilities(
      augmentsSyntaxTokens: json['augmentsSyntaxTokens'] as bool?,
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      formats: (json['formats'] as List)
          .map((e) => TokenFormat.fromJson(e))
          .toList(),
      multilineTokenSupport: json['multilineTokenSupport'] as bool?,
      overlappingTokenSupport: json['overlappingTokenSupport'] as bool?,
      requests: json['requests'] as Map<String, dynamic>,
      serverCancelSupport: json['serverCancelSupport'] as bool?,
      tokenModifiers: (json['tokenModifiers'] as List)
          .map((e) => e as String)
          .toList(),
      tokenTypes: (json['tokenTypes'] as List).map((e) => e as String).toList(),
    );
  }

  /// Whether the client uses semantic tokens to augment existing syntax tokens.
  /// If set to `true` client side created syntax tokens and semantic tokens are
  /// both used for colorization. If set to `false` the client only uses the
  /// returned semantic tokens for colorization.
  /// If the value is `undefined` then the client behavior is not specified.
  /// @since 3.17.0
  final bool? augmentsSyntaxTokens;

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  /// The token formats the clients supports.
  final List<TokenFormat> formats;

  /// Whether the client supports tokens that can span multiple lines.
  final bool? multilineTokenSupport;

  /// Whether the client supports tokens that can overlap each other.
  final bool? overlappingTokenSupport;

  /// Which requests the client supports and might send to the server depending
  /// on the server's capability. Please note that clients might not show
  /// semantic tokens or degrade some of the user experience if a range or full
  /// request is advertised by the client but not provided by the server. If for
  /// example the client capability `requests.full` and `request.range` are both
  /// set to true but the server only provides a range provider the client might
  /// not render a minimap correctly or might even decide to not show any
  /// semantic tokens at all.
  final Map<String, dynamic> requests;

  /// Whether the client allows the server to actively cancel a semantic token
  /// request, e.g. supports returning LSPErrorCodes.ServerCancelled. If a server
  /// does the client needs to retrigger the request.
  /// @since 3.17.0
  final bool? serverCancelSupport;

  /// The token modifiers that the client supports.
  final List<String> tokenModifiers;

  /// The token types that the client supports.
  final List<String> tokenTypes;

  Map<String, dynamic> toJson() {
    return {
      'augmentsSyntaxTokens': augmentsSyntaxTokens,
      'dynamicRegistration': dynamicRegistration,
      'formats': formats.map((e) => e.toJson()).toList(),
      'multilineTokenSupport': multilineTokenSupport,
      'overlappingTokenSupport': overlappingTokenSupport,
      'requests': requests,
      'serverCancelSupport': serverCancelSupport,
      'tokenModifiers': tokenModifiers,
      'tokenTypes': tokenTypes,
    };
  }
}

/// Client capabilities for the linked editing range request.
/// @since 3.16.0
final class LinkedEditingRangeClientCapabilities {
  const LinkedEditingRangeClientCapabilities({this.dynamicRegistration});

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return LinkedEditingRangeClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities specific to the moniker request.
/// @since 3.16.0
final class MonikerClientCapabilities {
  const MonikerClientCapabilities({this.dynamicRegistration});

  factory MonikerClientCapabilities.fromJson(Map<String, dynamic> json) {
    return MonikerClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether moniker supports dynamic registration. If this is set to `true` the
  /// client supports the new `MonikerRegistrationOptions` return value for the
  /// corresponding server capability as well.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// @since 3.17.0
final class TypeHierarchyClientCapabilities {
  const TypeHierarchyClientCapabilities({this.dynamicRegistration});

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) {
    return TypeHierarchyClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Client capabilities specific to inline values.
/// @since 3.17.0
final class InlineValueClientCapabilities {
  const InlineValueClientCapabilities({this.dynamicRegistration});

  factory InlineValueClientCapabilities.fromJson(Map<String, dynamic> json) {
    return InlineValueClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration for inline value
  /// providers.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Inlay hint client capabilities.
/// @since 3.17.0
final class InlayHintClientCapabilities {
  const InlayHintClientCapabilities({
    this.dynamicRegistration,
    this.resolveSupport,
  });

  factory InlayHintClientCapabilities.fromJson(Map<String, dynamic> json) {
    return InlayHintClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      resolveSupport: json['resolveSupport'] as Map<String, dynamic>?,
    );
  }

  /// Whether inlay hints support dynamic registration.
  final bool? dynamicRegistration;

  /// Indicates which properties a client can resolve lazily on an inlay hint.
  final Map<String, dynamic>? resolveSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'resolveSupport': resolveSupport,
    };
  }
}

/// Client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
final class DiagnosticClientCapabilities {
  const DiagnosticClientCapabilities({
    this.dynamicRegistration,
    this.relatedDocumentSupport,
  });

  factory DiagnosticClientCapabilities.fromJson(Map<String, dynamic> json) {
    return DiagnosticClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      relatedDocumentSupport: json['relatedDocumentSupport'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  /// Whether the clients supports related documents for document diagnostic
  /// pulls.
  final bool? relatedDocumentSupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'relatedDocumentSupport': relatedDocumentSupport,
    };
  }
}

/// Client capabilities specific to inline completions.
/// @since 3.18.0 @proposed
final class InlineCompletionClientCapabilities {
  const InlineCompletionClientCapabilities({this.dynamicRegistration});

  factory InlineCompletionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return InlineCompletionClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration for inline completion
  /// providers.
  final bool? dynamicRegistration;

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

/// Notebook specific client capabilities.
/// @since 3.17.0
final class NotebookDocumentSyncClientCapabilities {
  const NotebookDocumentSyncClientCapabilities({
    this.dynamicRegistration,
    this.executionSummarySupport,
  });

  factory NotebookDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotebookDocumentSyncClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      executionSummarySupport: json['executionSummarySupport'] as bool?,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  /// The client supports sending execution summary data per cell.
  final bool? executionSummarySupport;

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'executionSummarySupport': executionSummarySupport,
    };
  }
}

/// Show message request client capabilities
final class ShowMessageRequestClientCapabilities {
  const ShowMessageRequestClientCapabilities({this.messageActionItem});

  factory ShowMessageRequestClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShowMessageRequestClientCapabilities(
      messageActionItem: json['messageActionItem'] as Map<String, dynamic>?,
    );
  }

  /// Capabilities specific to the `MessageActionItem` type.
  final Map<String, dynamic>? messageActionItem;

  Map<String, dynamic> toJson() {
    return {'messageActionItem': messageActionItem};
  }
}

/// Client capabilities for the showDocument request.
/// @since 3.16.0
final class ShowDocumentClientCapabilities {
  const ShowDocumentClientCapabilities({required this.support});

  factory ShowDocumentClientCapabilities.fromJson(Map<String, dynamic> json) {
    return ShowDocumentClientCapabilities(support: json['support'] as bool);
  }

  /// The client has support for the showDocument request.
  final bool support;

  Map<String, dynamic> toJson() {
    return {'support': support};
  }
}

/// Client capabilities specific to regular expressions.
/// @since 3.16.0
final class RegularExpressionsClientCapabilities {
  const RegularExpressionsClientCapabilities({
    required this.engine,
    this.version,
  });

  factory RegularExpressionsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegularExpressionsClientCapabilities(
      engine: json['engine'] as String,
      version: json['version'] as String?,
    );
  }

  /// The engine's name.
  final String engine;

  /// The engine's version.
  final String? version;

  Map<String, dynamic> toJson() {
    return {'engine': engine, 'version': version};
  }
}

/// Client capabilities specific to the used markdown parser.
/// @since 3.16.0
final class MarkdownClientCapabilities {
  const MarkdownClientCapabilities({
    this.allowedTags,
    required this.parser,
    this.version,
  });

  factory MarkdownClientCapabilities.fromJson(Map<String, dynamic> json) {
    return MarkdownClientCapabilities(
      allowedTags: json['allowedTags'] == null
          ? null
          : (json['allowedTags'] as List).map((e) => e as String).toList(),
      parser: json['parser'] as String,
      version: json['version'] as String?,
    );
  }

  /// A list of HTML tags that the client allows / supports in Markdown.
  /// @since 3.17.0
  final List<String>? allowedTags;

  /// The name of the parser.
  final String parser;

  /// The version of the parser.
  final String? version;

  Map<String, dynamic> toJson() {
    return {'allowedTags': allowedTags, 'parser': parser, 'version': version};
  }
}
