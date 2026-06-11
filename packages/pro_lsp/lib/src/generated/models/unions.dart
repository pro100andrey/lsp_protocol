// ignore_for_file: type=lint

// GENERATED — do not edit.

import 'enumerations.dart';
import 'structures.dart';
import 'type_aliases.dart';

/// The definition of a symbol represented as one or many `locations`. For most
/// programming languages there is only one location at which a symbol is
/// defined.
///
/// Servers should prefer returning `DefinitionLink` over `Definition` if
/// supported by the client.
extension type const Definition(Object value) {
  factory Definition.fromJson(Object json) => Definition(json);

  Object toJson() => value;

  bool get isLocation =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range');

  Location? get asLocation {
    if (value is Location) {
      return value as Location;
    }
    if (isLocation) {
      return Location.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isList => value is List;

  List<Location>? get asList {
    if (value is List<Location>) {
      return value as List<Location>;
    }
    if (isList) {
      return (value as List)
          .map(
            (e) => e is Location
                ? e
                : Location.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
    return null;
  }
}

/// The LSP any type. Please note that strictly speaking a property with the
/// value `undefined` can't be converted into JSON preserving the property name.
/// However for convenience it is allowed and assumed that all these properties
/// are optional as well.
///
/// @since 3.17.0
extension type const LSPAny(Object value) {
  factory LSPAny.fromJson(Object json) => LSPAny(json);

  Object toJson() => value;

  bool get isLSPObject => value is Map<String, dynamic>;

  LSPObject? get asLSPObject {
    return value is LSPObject ? value as LSPObject : null;
  }

  bool get isLSPArray => value is List;

  LSPArray? get asLSPArray {
    return value is LSPArray ? value as LSPArray : null;
  }

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isInt => value is int;

  int? get asInt {
    return value is int ? value as int : null;
  }

  bool get isDouble => value is double;

  double? get asDouble {
    return value is double ? value as double : null;
  }

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isNull => (value as Object?) == null;

  Null get asNull {
    return null;
  }
}

/// The declaration of a symbol representation as one or many `locations`.
extension type const Declaration(Object value) {
  factory Declaration.fromJson(Object json) => Declaration(json);

  Object toJson() => value;

  bool get isLocation =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range');

  Location? get asLocation {
    if (value is Location) {
      return value as Location;
    }
    if (isLocation) {
      return Location.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isList => value is List;

  List<Location>? get asList {
    if (value is List<Location>) {
      return value as List<Location>;
    }
    if (isList) {
      return (value as List)
          .map(
            (e) => e is Location
                ? e
                : Location.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
    return null;
  }
}

/// Inline value information can be provided by different means: - directly as a
/// text value (class InlineValueText). - as a name to use for a variable lookup
/// (class InlineValueVariableLookup) - as an evaluatable expression (class
/// InlineValueEvaluatableExpression) The InlineValue types combines all inline
/// value types into one type.
///
/// @since 3.17.0
extension type const InlineValue(Object value) {
  factory InlineValue.fromJson(Object json) => InlineValue(json);

  Object toJson() => value;

  bool get isText =>
      value is InlineValueText ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('text');

  InlineValueText? get asText {
    if (value is InlineValueText) {
      return value as InlineValueText;
    }
    if (isText) {
      return InlineValueText.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isVariableLookup =>
      value is InlineValueVariableLookup ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('caseSensitiveLookup');

  InlineValueVariableLookup? get asVariableLookup {
    if (value is InlineValueVariableLookup) {
      return value as InlineValueVariableLookup;
    }
    if (isVariableLookup) {
      return InlineValueVariableLookup.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isEvaluatableExpression =>
      value is InlineValueEvaluatableExpression ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('text') &&
          !(value as Map<String, dynamic>).containsKey('caseSensitiveLookup');

  InlineValueEvaluatableExpression? get asEvaluatableExpression {
    if (value is InlineValueEvaluatableExpression) {
      return value as InlineValueEvaluatableExpression;
    }
    if (isEvaluatableExpression) {
      return InlineValueEvaluatableExpression.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// The result of a document diagnostic pull request. A report can either be a
/// full report containing all diagnostics for the requested document or an
/// unchanged report indicating that nothing has changed in terms of diagnostics
/// in comparison to the last pull request.
///
/// @since 3.17.0
extension type const DocumentDiagnosticReport(Object value) {
  factory DocumentDiagnosticReport.fromJson(Object json) =>
      DocumentDiagnosticReport(json);

  Object toJson() => value;

  bool get isRelatedFullDocumentDiagnosticReport =>
      value is RelatedFullDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'full';

  RelatedFullDocumentDiagnosticReport?
  get asRelatedFullDocumentDiagnosticReport {
    if (value is RelatedFullDocumentDiagnosticReport) {
      return value as RelatedFullDocumentDiagnosticReport;
    }
    if (isRelatedFullDocumentDiagnosticReport) {
      return RelatedFullDocumentDiagnosticReport.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }

  bool get isRelatedUnchangedDocumentDiagnosticReport =>
      value is RelatedUnchangedDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'unchanged';

  RelatedUnchangedDocumentDiagnosticReport?
  get asRelatedUnchangedDocumentDiagnosticReport {
    if (value is RelatedUnchangedDocumentDiagnosticReport) {
      return value as RelatedUnchangedDocumentDiagnosticReport;
    }
    if (isRelatedUnchangedDocumentDiagnosticReport) {
      return RelatedUnchangedDocumentDiagnosticReport.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}
extension type const PrepareRenameResult(Object value) {
  factory PrepareRenameResult.fromJson(Object json) =>
      PrepareRenameResult(json);

  Object toJson() => value;

  bool get isRange =>
      value is Range ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('start');

  Range? get asRange {
    if (value is Range) {
      return value as Range;
    }
    if (isRange) {
      return Range.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isRangePlaceholder =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('range');

  ({Range range, String placeholder})? get asRangePlaceholder {
    if (isRangePlaceholder) {
      final map = value as Map<String, dynamic>;
      return (
        range: map['range'] is Range
            ? map['range'] as Range
            : Range.fromJson(map['range'] as Map<String, dynamic>),
        placeholder: map['placeholder'] as String,
      );
    }
    return null;
  }

  bool get isDefaultBehavior =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('defaultBehavior');

  ({bool defaultBehavior})? get asDefaultBehavior {
    if (isDefaultBehavior) {
      final map = value as Map<String, dynamic>;
      return (defaultBehavior: map['defaultBehavior'] as bool);
    }
    return null;
  }
}

/// A workspace diagnostic document report.
///
/// @since 3.17.0
extension type const WorkspaceDocumentDiagnosticReport(Object value) {
  factory WorkspaceDocumentDiagnosticReport.fromJson(Object json) =>
      WorkspaceDocumentDiagnosticReport(json);

  Object toJson() => value;

  bool get isWorkspaceFullDocumentDiagnosticReport =>
      value is WorkspaceFullDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'full';

  WorkspaceFullDocumentDiagnosticReport?
  get asWorkspaceFullDocumentDiagnosticReport {
    if (value is WorkspaceFullDocumentDiagnosticReport) {
      return value as WorkspaceFullDocumentDiagnosticReport;
    }
    if (isWorkspaceFullDocumentDiagnosticReport) {
      return WorkspaceFullDocumentDiagnosticReport.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }

  bool get isWorkspaceUnchangedDocumentDiagnosticReport =>
      value is WorkspaceUnchangedDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'unchanged';

  WorkspaceUnchangedDocumentDiagnosticReport?
  get asWorkspaceUnchangedDocumentDiagnosticReport {
    if (value is WorkspaceUnchangedDocumentDiagnosticReport) {
      return value as WorkspaceUnchangedDocumentDiagnosticReport;
    }
    if (isWorkspaceUnchangedDocumentDiagnosticReport) {
      return WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// An event describing a change to a text document. If only a text is provided
/// it is considered to be the full content of the document.
extension type const TextDocumentContentChangeEvent(Object value) {
  factory TextDocumentContentChangeEvent.fromJson(Object json) =>
      TextDocumentContentChangeEvent(json);

  Object toJson() => value;

  bool get isRangeRangeLengthText =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('range');

  ({Range range, int? rangeLength, String text})? get asRangeRangeLengthText {
    if (isRangeRangeLengthText) {
      final map = value as Map<String, dynamic>;
      return (
        range: map['range'] is Range
            ? map['range'] as Range
            : Range.fromJson(map['range'] as Map<String, dynamic>),
        rangeLength: map['rangeLength'] as int?,
        text: map['text'] as String,
      );
    }
    return null;
  }

  bool get isText =>
      value is Map<String, dynamic> &&
      !(value as Map<String, dynamic>).containsKey('range');

  ({String text})? get asText {
    if (isText) {
      final map = value as Map<String, dynamic>;
      return (text: map['text'] as String);
    }
    return null;
  }
}

/// MarkedString can be used to render human readable text. It is either a
/// markdown string or a code-block that provides a language and a code snippet.
/// The language identifier is semantically equal to the optional language
/// identifier in fenced code blocks in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
///
/// The pair of a language and a value is an equivalent to markdown:
/// ```${language} ${value} ```
///
/// Note that markdown strings will be sanitized - that means html will be
/// escaped. @deprecated use MarkupContent instead.
@Deprecated('use MarkupContent instead.')
extension type const MarkedString(Object value) {
  factory MarkedString.fromJson(Object json) => MarkedString(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isLanguageValue =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('language') &&
      (value as Map<String, dynamic>).containsKey('value');

  ({String language, String value})? get asLanguageValue {
    if (isLanguageValue) {
      final map = value as Map<String, dynamic>;
      return (
        language: map['language'] as String,
        value: map['value'] as String,
      );
    }
    return null;
  }
}

/// A document filter describes a top level text document or a notebook cell
/// document.
///
/// - proposed support for NotebookCellTextDocumentFilter.
///
/// @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
extension type const DocumentFilter(Object value) {
  factory DocumentFilter.fromJson(Object json) => DocumentFilter(json);

  Object toJson() => value;

  bool get isTextDocumentFilter =>
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('language') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('scheme') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('pattern');

  TextDocumentFilter? get asTextDocumentFilter {
    if (value is TextDocumentFilter) {
      return value as TextDocumentFilter;
    }
    if (isTextDocumentFilter) {
      return TextDocumentFilter.fromJson(value);
    }
    return null;
  }

  bool get isNotebookCellTextDocumentFilter =>
      value is NotebookCellTextDocumentFilter ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('notebook');

  NotebookCellTextDocumentFilter? get asNotebookCellTextDocumentFilter {
    if (value is NotebookCellTextDocumentFilter) {
      return value as NotebookCellTextDocumentFilter;
    }
    if (isNotebookCellTextDocumentFilter) {
      return NotebookCellTextDocumentFilter.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// The glob pattern. Either a string pattern or a relative pattern.
///
/// @since 3.17.0
extension type const GlobPattern(Object value) {
  factory GlobPattern.fromJson(Object json) => GlobPattern(json);

  Object toJson() => value;

  bool get isPattern => value is String;

  Pattern? get asPattern {
    return value is Pattern ? value as Pattern : null;
  }

  bool get isRelativePattern =>
      value is RelativePattern ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('baseUri') &&
          (value as Map<String, dynamic>).containsKey('pattern');

  RelativePattern? get asRelativePattern {
    if (value is RelativePattern) {
      return value as RelativePattern;
    }
    if (isRelativePattern) {
      return RelativePattern.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// A document filter denotes a document by different properties like the
/// `language`, the `scheme` of its resource, or a glob-pattern that is applied
/// to the `path`.
///
/// Glob patterns can have the following syntax: - `*` to match zero or more
/// characters in a path segment - `?` to match on one character in a path
/// segment - `**` to match any number of path segments, including none - `{}`
/// to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches
/// all TypeScript and JavaScript files) - `[]` to declare a range of characters
/// to match in a path segment (e.g., `example.[0-9]` to match on `example.0`,
/// `example.1`, …) - `[!...]` to negate a range of characters to match in a
/// path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`,
/// but not `example.0`)
///
/// @sample A language filter that applies to typescript files on disk: `{
/// language: 'typescript', scheme: 'file' }` @sample A language filter that
/// applies to all package.json paths: `{ language: 'json', pattern:
/// '**package.json' }`
///
/// @since 3.17.0
extension type const TextDocumentFilter(Object value) {
  factory TextDocumentFilter.fromJson(Object json) => TextDocumentFilter(json);

  Object toJson() => value;

  bool get isLanguageSchemePattern =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('language');

  ({String language, String? scheme, String? pattern})?
  get asLanguageSchemePattern {
    if (isLanguageSchemePattern) {
      final map = value as Map<String, dynamic>;
      return (
        language: map['language'] as String,
        scheme: map['scheme'] as String?,
        pattern: map['pattern'] as String?,
      );
    }
    return null;
  }
}

/// A notebook document filter denotes a notebook document by different
/// properties. The properties will be match against the notebook's URI (same as
/// with documents)
///
/// @since 3.17.0
extension type const NotebookDocumentFilter(Object value) {
  factory NotebookDocumentFilter.fromJson(Object json) =>
      NotebookDocumentFilter(json);

  Object toJson() => value;

  bool get isNotebookTypeSchemePattern =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('notebookType');

  ({String notebookType, String? scheme, String? pattern})?
  get asNotebookTypeSchemePattern {
    if (isNotebookTypeSchemePattern) {
      final map = value as Map<String, dynamic>;
      return (
        notebookType: map['notebookType'] as String,
        scheme: map['scheme'] as String?,
        pattern: map['pattern'] as String?,
      );
    }
    return null;
  }
}

/// Inline union: SemanticTokensRegistrationOptionsRange.
extension type const SemanticTokensRegistrationOptionsRange(Object value) {
  factory SemanticTokensRegistrationOptionsRange.fromJson(Object json) =>
      SemanticTokensRegistrationOptionsRange(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isEmpty => value is Map<String, dynamic>;

  Object? get asEmpty {
    if (isEmpty) {
      return ();
    }
    return null;
  }
}

/// Inline union: SemanticTokensRegistrationOptionsFull.
extension type const SemanticTokensRegistrationOptionsFull(Object value) {
  factory SemanticTokensRegistrationOptionsFull.fromJson(Object json) =>
      SemanticTokensRegistrationOptionsFull(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDelta => value is Map<String, dynamic>;

  ({bool? delta})? get asDelta {
    if (isDelta) {
      final map = value as Map<String, dynamic>;
      return (delta: map['delta'] as bool?);
    }
    return null;
  }
}

/// Inline union: WorkspaceEditDocumentChangesItem.
extension type const WorkspaceEditDocumentChangesItem(Object value) {
  factory WorkspaceEditDocumentChangesItem.fromJson(Object json) =>
      WorkspaceEditDocumentChangesItem(json);

  Object toJson() => value;

  bool get isTextDocumentEdit =>
      value is TextDocumentEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('textDocument') &&
          (value as Map<String, dynamic>).containsKey('edits');

  TextDocumentEdit? get asTextDocumentEdit {
    if (value is TextDocumentEdit) {
      return value as TextDocumentEdit;
    }
    if (isTextDocumentEdit) {
      return TextDocumentEdit.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isCreateFile =>
      value is CreateFile ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('uri');

  CreateFile? get asCreateFile {
    if (value is CreateFile) {
      return value as CreateFile;
    }
    if (isCreateFile) {
      return CreateFile.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isRenameFile =>
      value is RenameFile ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('oldUri') &&
          (value as Map<String, dynamic>).containsKey('newUri');

  RenameFile? get asRenameFile {
    if (value is RenameFile) {
      return value as RenameFile;
    }
    if (isRenameFile) {
      return RenameFile.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isDeleteFile =>
      value is DeleteFile ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('uri');

  DeleteFile? get asDeleteFile {
    if (value is DeleteFile) {
      return value as DeleteFile;
    }
    if (isDeleteFile) {
      return DeleteFile.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: InlayHintLabel.
extension type const InlayHintLabel(Object value) {
  factory InlayHintLabel.fromJson(Object json) => InlayHintLabel(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isList => value is List;

  List<InlayHintLabelPart>? get asList {
    if (value is List<InlayHintLabelPart>) {
      return value as List<InlayHintLabelPart>;
    }
    if (isList) {
      return (value as List)
          .map(
            (e) => e is InlayHintLabelPart
                ? e
                : InlayHintLabelPart.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
    return null;
  }
}

/// Inline union: InlayHintTooltip.
extension type const InlayHintTooltip(Object value) {
  factory InlayHintTooltip.fromJson(Object json) => InlayHintTooltip(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent {
    if (value is MarkupContent) {
      return value as MarkupContent;
    }
    if (isMarkupContent) {
      return MarkupContent.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: InlineCompletionItemInsertText.
extension type const InlineCompletionItemInsertText(Object value) {
  factory InlineCompletionItemInsertText.fromJson(Object json) =>
      InlineCompletionItemInsertText(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isStringValue =>
      value is StringValue ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  StringValue? get asStringValue {
    if (value is StringValue) {
      return value as StringValue;
    }
    if (isStringValue) {
      return StringValue.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: DidChangeConfigurationRegistrationOptionsSection.
extension type const DidChangeConfigurationRegistrationOptionsSection(
  Object value
) {
  factory DidChangeConfigurationRegistrationOptionsSection.fromJson(
    Object json,
  ) => DidChangeConfigurationRegistrationOptionsSection(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isList => value is List;

  List<String>? get asList {
    return isList ? (value as List).cast<String>() : null;
  }
}

/// Inline union: CompletionItemDocumentation.
extension type const CompletionItemDocumentation(Object value) {
  factory CompletionItemDocumentation.fromJson(Object json) =>
      CompletionItemDocumentation(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent {
    if (value is MarkupContent) {
      return value as MarkupContent;
    }
    if (isMarkupContent) {
      return MarkupContent.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: CompletionItemTextEdit.
extension type const CompletionItemTextEdit(Object value) {
  factory CompletionItemTextEdit.fromJson(Object json) =>
      CompletionItemTextEdit(json);

  Object toJson() => value;

  bool get isTextEdit =>
      value is TextEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('range');

  TextEdit? get asTextEdit {
    if (value is TextEdit) {
      return value as TextEdit;
    }
    if (isTextEdit) {
      return TextEdit.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isInsertReplaceEdit =>
      value is InsertReplaceEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('insert');

  InsertReplaceEdit? get asInsertReplaceEdit {
    if (value is InsertReplaceEdit) {
      return value as InsertReplaceEdit;
    }
    if (isInsertReplaceEdit) {
      return InsertReplaceEdit.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: HoverContents.
extension type const HoverContents(Object value) {
  factory HoverContents.fromJson(Object json) => HoverContents(json);

  Object toJson() => value;

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent {
    if (value is MarkupContent) {
      return value as MarkupContent;
    }
    if (isMarkupContent) {
      return MarkupContent.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isMarkedString =>
      value is String ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('language') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkedString? get asMarkedString {
    if (value is MarkedString) {
      return value as MarkedString;
    }
    if (isMarkedString) {
      return MarkedString.fromJson(value);
    }
    return null;
  }

  bool get isList => value is List;

  List<MarkedString>? get asList {
    if (value is List<MarkedString>) {
      return value as List<MarkedString>;
    }
    if (isList) {
      return (value as List)
          .map(
            (e) => e is MarkedString ? e : MarkedString.fromJson(e as Object),
          )
          .toList();
    }
    return null;
  }
}

/// Inline union: WorkspaceSymbolLocation.
extension type const WorkspaceSymbolLocation(Object value) {
  factory WorkspaceSymbolLocation.fromJson(Object json) =>
      WorkspaceSymbolLocation(json);

  Object toJson() => value;

  bool get isLocation =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('range');

  Location? get asLocation {
    if (value is Location) {
      return value as Location;
    }
    if (isLocation) {
      return Location.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isUri =>
      value is Map<String, dynamic> &&
      !(value as Map<String, dynamic>).containsKey('range');

  ({String uri})? get asUri {
    if (isUri) {
      final map = value as Map<String, dynamic>;
      return (uri: map['uri'] as String);
    }
    return null;
  }
}

/// Inline union: SemanticTokensOptionsRange.
extension type const SemanticTokensOptionsRange(Object value) {
  factory SemanticTokensOptionsRange.fromJson(Object json) =>
      SemanticTokensOptionsRange(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isEmpty => value is Map<String, dynamic>;

  Object? get asEmpty {
    if (isEmpty) {
      return ();
    }
    return null;
  }
}

/// Inline union: SemanticTokensOptionsFull.
extension type const SemanticTokensOptionsFull(Object value) {
  factory SemanticTokensOptionsFull.fromJson(Object json) =>
      SemanticTokensOptionsFull(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDelta => value is Map<String, dynamic>;

  ({bool? delta})? get asDelta {
    if (isDelta) {
      final map = value as Map<String, dynamic>;
      return (delta: map['delta'] as bool?);
    }
    return null;
  }
}

/// Inline union: TextDocumentEditEditsItem.
extension type const TextDocumentEditEditsItem(Object value) {
  factory TextDocumentEditEditsItem.fromJson(Object json) =>
      TextDocumentEditEditsItem(json);

  Object toJson() => value;

  bool get isTextEdit =>
      value is TextEdit ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('annotationId');

  TextEdit? get asTextEdit {
    if (value is TextEdit) {
      return value as TextEdit;
    }
    if (isTextEdit) {
      return TextEdit.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isAnnotatedTextEdit =>
      value is AnnotatedTextEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('annotationId');

  AnnotatedTextEdit? get asAnnotatedTextEdit {
    if (value is AnnotatedTextEdit) {
      return value as AnnotatedTextEdit;
    }
    if (isAnnotatedTextEdit) {
      return AnnotatedTextEdit.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: InlayHintLabelPartTooltip.
extension type const InlayHintLabelPartTooltip(Object value) {
  factory InlayHintLabelPartTooltip.fromJson(Object json) =>
      InlayHintLabelPartTooltip(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent {
    if (value is MarkupContent) {
      return value as MarkupContent;
    }
    if (isMarkupContent) {
      return MarkupContent.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesTextDocumentSync.
extension type const ServerCapabilitiesTextDocumentSync(Object value) {
  factory ServerCapabilitiesTextDocumentSync.fromJson(Object json) =>
      ServerCapabilitiesTextDocumentSync(json);

  Object toJson() => value;

  bool get isTextDocumentSyncOptions =>
      value is TextDocumentSyncOptions || value is Map<String, dynamic>;

  TextDocumentSyncOptions? get asTextDocumentSyncOptions {
    if (value is TextDocumentSyncOptions) {
      return value as TextDocumentSyncOptions;
    }
    if (isTextDocumentSyncOptions) {
      return TextDocumentSyncOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isTextDocumentSyncKind =>
      value is TextDocumentSyncKind || value is int;

  TextDocumentSyncKind? get asTextDocumentSyncKind {
    if (value is TextDocumentSyncKind) {
      return value as TextDocumentSyncKind;
    }
    if (isTextDocumentSyncKind) {
      return TextDocumentSyncKind.decode(value as int);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesNotebookDocumentSync.
extension type const ServerCapabilitiesNotebookDocumentSync(Object value) {
  factory ServerCapabilitiesNotebookDocumentSync.fromJson(Object json) =>
      ServerCapabilitiesNotebookDocumentSync(json);

  Object toJson() => value;

  bool get isNotebookDocumentSyncOptions =>
      value is NotebookDocumentSyncOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('notebookSelector');

  NotebookDocumentSyncOptions? get asNotebookDocumentSyncOptions {
    if (value is NotebookDocumentSyncOptions) {
      return value as NotebookDocumentSyncOptions;
    }
    if (isNotebookDocumentSyncOptions) {
      return NotebookDocumentSyncOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }

  bool get isNotebookDocumentSyncRegistrationOptions =>
      value is NotebookDocumentSyncRegistrationOptions ||
      value is Map<String, dynamic>;

  NotebookDocumentSyncRegistrationOptions?
  get asNotebookDocumentSyncRegistrationOptions {
    if (value is NotebookDocumentSyncRegistrationOptions) {
      return value as NotebookDocumentSyncRegistrationOptions;
    }
    if (isNotebookDocumentSyncRegistrationOptions) {
      return NotebookDocumentSyncRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesHoverProvider.
extension type const ServerCapabilitiesHoverProvider(Object value) {
  factory ServerCapabilitiesHoverProvider.fromJson(Object json) =>
      ServerCapabilitiesHoverProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isHoverOptions =>
      value is HoverOptions || value is Map<String, dynamic>;

  HoverOptions? get asHoverOptions {
    if (value is HoverOptions) {
      return value as HoverOptions;
    }
    if (isHoverOptions) {
      return HoverOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesDeclarationProvider.
extension type const ServerCapabilitiesDeclarationProvider(Object value) {
  factory ServerCapabilitiesDeclarationProvider.fromJson(Object json) =>
      ServerCapabilitiesDeclarationProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDeclarationOptions =>
      value is DeclarationOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  DeclarationOptions? get asDeclarationOptions {
    if (value is DeclarationOptions) {
      return value as DeclarationOptions;
    }
    if (isDeclarationOptions) {
      return DeclarationOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isDeclarationRegistrationOptions =>
      value is DeclarationRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  DeclarationRegistrationOptions? get asDeclarationRegistrationOptions {
    if (value is DeclarationRegistrationOptions) {
      return value as DeclarationRegistrationOptions;
    }
    if (isDeclarationRegistrationOptions) {
      return DeclarationRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesDefinitionProvider.
extension type const ServerCapabilitiesDefinitionProvider(Object value) {
  factory ServerCapabilitiesDefinitionProvider.fromJson(Object json) =>
      ServerCapabilitiesDefinitionProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDefinitionOptions =>
      value is DefinitionOptions || value is Map<String, dynamic>;

  DefinitionOptions? get asDefinitionOptions {
    if (value is DefinitionOptions) {
      return value as DefinitionOptions;
    }
    if (isDefinitionOptions) {
      return DefinitionOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesTypeDefinitionProvider.
extension type const ServerCapabilitiesTypeDefinitionProvider(Object value) {
  factory ServerCapabilitiesTypeDefinitionProvider.fromJson(Object json) =>
      ServerCapabilitiesTypeDefinitionProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isTypeDefinitionOptions =>
      value is TypeDefinitionOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  TypeDefinitionOptions? get asTypeDefinitionOptions {
    if (value is TypeDefinitionOptions) {
      return value as TypeDefinitionOptions;
    }
    if (isTypeDefinitionOptions) {
      return TypeDefinitionOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isTypeDefinitionRegistrationOptions =>
      value is TypeDefinitionRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  TypeDefinitionRegistrationOptions? get asTypeDefinitionRegistrationOptions {
    if (value is TypeDefinitionRegistrationOptions) {
      return value as TypeDefinitionRegistrationOptions;
    }
    if (isTypeDefinitionRegistrationOptions) {
      return TypeDefinitionRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesImplementationProvider.
extension type const ServerCapabilitiesImplementationProvider(Object value) {
  factory ServerCapabilitiesImplementationProvider.fromJson(Object json) =>
      ServerCapabilitiesImplementationProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isImplementationOptions =>
      value is ImplementationOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  ImplementationOptions? get asImplementationOptions {
    if (value is ImplementationOptions) {
      return value as ImplementationOptions;
    }
    if (isImplementationOptions) {
      return ImplementationOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isImplementationRegistrationOptions =>
      value is ImplementationRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  ImplementationRegistrationOptions? get asImplementationRegistrationOptions {
    if (value is ImplementationRegistrationOptions) {
      return value as ImplementationRegistrationOptions;
    }
    if (isImplementationRegistrationOptions) {
      return ImplementationRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesReferencesProvider.
extension type const ServerCapabilitiesReferencesProvider(Object value) {
  factory ServerCapabilitiesReferencesProvider.fromJson(Object json) =>
      ServerCapabilitiesReferencesProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isReferenceOptions =>
      value is ReferenceOptions || value is Map<String, dynamic>;

  ReferenceOptions? get asReferenceOptions {
    if (value is ReferenceOptions) {
      return value as ReferenceOptions;
    }
    if (isReferenceOptions) {
      return ReferenceOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesDocumentHighlightProvider.
extension type const ServerCapabilitiesDocumentHighlightProvider(Object value) {
  factory ServerCapabilitiesDocumentHighlightProvider.fromJson(Object json) =>
      ServerCapabilitiesDocumentHighlightProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDocumentHighlightOptions =>
      value is DocumentHighlightOptions || value is Map<String, dynamic>;

  DocumentHighlightOptions? get asDocumentHighlightOptions {
    if (value is DocumentHighlightOptions) {
      return value as DocumentHighlightOptions;
    }
    if (isDocumentHighlightOptions) {
      return DocumentHighlightOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesDocumentSymbolProvider.
extension type const ServerCapabilitiesDocumentSymbolProvider(Object value) {
  factory ServerCapabilitiesDocumentSymbolProvider.fromJson(Object json) =>
      ServerCapabilitiesDocumentSymbolProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDocumentSymbolOptions =>
      value is DocumentSymbolOptions || value is Map<String, dynamic>;

  DocumentSymbolOptions? get asDocumentSymbolOptions {
    if (value is DocumentSymbolOptions) {
      return value as DocumentSymbolOptions;
    }
    if (isDocumentSymbolOptions) {
      return DocumentSymbolOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesCodeActionProvider.
extension type const ServerCapabilitiesCodeActionProvider(Object value) {
  factory ServerCapabilitiesCodeActionProvider.fromJson(Object json) =>
      ServerCapabilitiesCodeActionProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isCodeActionOptions =>
      value is CodeActionOptions || value is Map<String, dynamic>;

  CodeActionOptions? get asCodeActionOptions {
    if (value is CodeActionOptions) {
      return value as CodeActionOptions;
    }
    if (isCodeActionOptions) {
      return CodeActionOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesColorProvider.
extension type const ServerCapabilitiesColorProvider(Object value) {
  factory ServerCapabilitiesColorProvider.fromJson(Object json) =>
      ServerCapabilitiesColorProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDocumentColorOptions =>
      value is DocumentColorOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  DocumentColorOptions? get asDocumentColorOptions {
    if (value is DocumentColorOptions) {
      return value as DocumentColorOptions;
    }
    if (isDocumentColorOptions) {
      return DocumentColorOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isDocumentColorRegistrationOptions =>
      value is DocumentColorRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  DocumentColorRegistrationOptions? get asDocumentColorRegistrationOptions {
    if (value is DocumentColorRegistrationOptions) {
      return value as DocumentColorRegistrationOptions;
    }
    if (isDocumentColorRegistrationOptions) {
      return DocumentColorRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesWorkspaceSymbolProvider.
extension type const ServerCapabilitiesWorkspaceSymbolProvider(Object value) {
  factory ServerCapabilitiesWorkspaceSymbolProvider.fromJson(Object json) =>
      ServerCapabilitiesWorkspaceSymbolProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isWorkspaceSymbolOptions =>
      value is WorkspaceSymbolOptions || value is Map<String, dynamic>;

  WorkspaceSymbolOptions? get asWorkspaceSymbolOptions {
    if (value is WorkspaceSymbolOptions) {
      return value as WorkspaceSymbolOptions;
    }
    if (isWorkspaceSymbolOptions) {
      return WorkspaceSymbolOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesDocumentFormattingProvider.
extension type const ServerCapabilitiesDocumentFormattingProvider(
  Object value
) {
  factory ServerCapabilitiesDocumentFormattingProvider.fromJson(Object json) =>
      ServerCapabilitiesDocumentFormattingProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDocumentFormattingOptions =>
      value is DocumentFormattingOptions || value is Map<String, dynamic>;

  DocumentFormattingOptions? get asDocumentFormattingOptions {
    if (value is DocumentFormattingOptions) {
      return value as DocumentFormattingOptions;
    }
    if (isDocumentFormattingOptions) {
      return DocumentFormattingOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesDocumentRangeFormattingProvider.
extension type const ServerCapabilitiesDocumentRangeFormattingProvider(
  Object value
) {
  factory ServerCapabilitiesDocumentRangeFormattingProvider.fromJson(
    Object json,
  ) => ServerCapabilitiesDocumentRangeFormattingProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isDocumentRangeFormattingOptions =>
      value is DocumentRangeFormattingOptions || value is Map<String, dynamic>;

  DocumentRangeFormattingOptions? get asDocumentRangeFormattingOptions {
    if (value is DocumentRangeFormattingOptions) {
      return value as DocumentRangeFormattingOptions;
    }
    if (isDocumentRangeFormattingOptions) {
      return DocumentRangeFormattingOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesRenameProvider.
extension type const ServerCapabilitiesRenameProvider(Object value) {
  factory ServerCapabilitiesRenameProvider.fromJson(Object json) =>
      ServerCapabilitiesRenameProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isRenameOptions =>
      value is RenameOptions || value is Map<String, dynamic>;

  RenameOptions? get asRenameOptions {
    if (value is RenameOptions) {
      return value as RenameOptions;
    }
    if (isRenameOptions) {
      return RenameOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesFoldingRangeProvider.
extension type const ServerCapabilitiesFoldingRangeProvider(Object value) {
  factory ServerCapabilitiesFoldingRangeProvider.fromJson(Object json) =>
      ServerCapabilitiesFoldingRangeProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isFoldingRangeOptions =>
      value is FoldingRangeOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  FoldingRangeOptions? get asFoldingRangeOptions {
    if (value is FoldingRangeOptions) {
      return value as FoldingRangeOptions;
    }
    if (isFoldingRangeOptions) {
      return FoldingRangeOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isFoldingRangeRegistrationOptions =>
      value is FoldingRangeRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  FoldingRangeRegistrationOptions? get asFoldingRangeRegistrationOptions {
    if (value is FoldingRangeRegistrationOptions) {
      return value as FoldingRangeRegistrationOptions;
    }
    if (isFoldingRangeRegistrationOptions) {
      return FoldingRangeRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesSelectionRangeProvider.
extension type const ServerCapabilitiesSelectionRangeProvider(Object value) {
  factory ServerCapabilitiesSelectionRangeProvider.fromJson(Object json) =>
      ServerCapabilitiesSelectionRangeProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isSelectionRangeOptions =>
      value is SelectionRangeOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  SelectionRangeOptions? get asSelectionRangeOptions {
    if (value is SelectionRangeOptions) {
      return value as SelectionRangeOptions;
    }
    if (isSelectionRangeOptions) {
      return SelectionRangeOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isSelectionRangeRegistrationOptions =>
      value is SelectionRangeRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  SelectionRangeRegistrationOptions? get asSelectionRangeRegistrationOptions {
    if (value is SelectionRangeRegistrationOptions) {
      return value as SelectionRangeRegistrationOptions;
    }
    if (isSelectionRangeRegistrationOptions) {
      return SelectionRangeRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesCallHierarchyProvider.
extension type const ServerCapabilitiesCallHierarchyProvider(Object value) {
  factory ServerCapabilitiesCallHierarchyProvider.fromJson(Object json) =>
      ServerCapabilitiesCallHierarchyProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isCallHierarchyOptions =>
      value is CallHierarchyOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  CallHierarchyOptions? get asCallHierarchyOptions {
    if (value is CallHierarchyOptions) {
      return value as CallHierarchyOptions;
    }
    if (isCallHierarchyOptions) {
      return CallHierarchyOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isCallHierarchyRegistrationOptions =>
      value is CallHierarchyRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  CallHierarchyRegistrationOptions? get asCallHierarchyRegistrationOptions {
    if (value is CallHierarchyRegistrationOptions) {
      return value as CallHierarchyRegistrationOptions;
    }
    if (isCallHierarchyRegistrationOptions) {
      return CallHierarchyRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesLinkedEditingRangeProvider.
extension type const ServerCapabilitiesLinkedEditingRangeProvider(
  Object value
) {
  factory ServerCapabilitiesLinkedEditingRangeProvider.fromJson(Object json) =>
      ServerCapabilitiesLinkedEditingRangeProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isLinkedEditingRangeOptions =>
      value is LinkedEditingRangeOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  LinkedEditingRangeOptions? get asLinkedEditingRangeOptions {
    if (value is LinkedEditingRangeOptions) {
      return value as LinkedEditingRangeOptions;
    }
    if (isLinkedEditingRangeOptions) {
      return LinkedEditingRangeOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isLinkedEditingRangeRegistrationOptions =>
      value is LinkedEditingRangeRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  LinkedEditingRangeRegistrationOptions?
  get asLinkedEditingRangeRegistrationOptions {
    if (value is LinkedEditingRangeRegistrationOptions) {
      return value as LinkedEditingRangeRegistrationOptions;
    }
    if (isLinkedEditingRangeRegistrationOptions) {
      return LinkedEditingRangeRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesSemanticTokensProvider.
extension type const ServerCapabilitiesSemanticTokensProvider(Object value) {
  factory ServerCapabilitiesSemanticTokensProvider.fromJson(Object json) =>
      ServerCapabilitiesSemanticTokensProvider(json);

  Object toJson() => value;

  bool get isSemanticTokensOptions =>
      value is SemanticTokensOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  SemanticTokensOptions? get asSemanticTokensOptions {
    if (value is SemanticTokensOptions) {
      return value as SemanticTokensOptions;
    }
    if (isSemanticTokensOptions) {
      return SemanticTokensOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isSemanticTokensRegistrationOptions =>
      value is SemanticTokensRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  SemanticTokensRegistrationOptions? get asSemanticTokensRegistrationOptions {
    if (value is SemanticTokensRegistrationOptions) {
      return value as SemanticTokensRegistrationOptions;
    }
    if (isSemanticTokensRegistrationOptions) {
      return SemanticTokensRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesMonikerProvider.
extension type const ServerCapabilitiesMonikerProvider(Object value) {
  factory ServerCapabilitiesMonikerProvider.fromJson(Object json) =>
      ServerCapabilitiesMonikerProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isMonikerOptions =>
      value is MonikerOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  MonikerOptions? get asMonikerOptions {
    if (value is MonikerOptions) {
      return value as MonikerOptions;
    }
    if (isMonikerOptions) {
      return MonikerOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isMonikerRegistrationOptions =>
      value is MonikerRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  MonikerRegistrationOptions? get asMonikerRegistrationOptions {
    if (value is MonikerRegistrationOptions) {
      return value as MonikerRegistrationOptions;
    }
    if (isMonikerRegistrationOptions) {
      return MonikerRegistrationOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesTypeHierarchyProvider.
extension type const ServerCapabilitiesTypeHierarchyProvider(Object value) {
  factory ServerCapabilitiesTypeHierarchyProvider.fromJson(Object json) =>
      ServerCapabilitiesTypeHierarchyProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isTypeHierarchyOptions =>
      value is TypeHierarchyOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  TypeHierarchyOptions? get asTypeHierarchyOptions {
    if (value is TypeHierarchyOptions) {
      return value as TypeHierarchyOptions;
    }
    if (isTypeHierarchyOptions) {
      return TypeHierarchyOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isTypeHierarchyRegistrationOptions =>
      value is TypeHierarchyRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  TypeHierarchyRegistrationOptions? get asTypeHierarchyRegistrationOptions {
    if (value is TypeHierarchyRegistrationOptions) {
      return value as TypeHierarchyRegistrationOptions;
    }
    if (isTypeHierarchyRegistrationOptions) {
      return TypeHierarchyRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesInlineValueProvider.
extension type const ServerCapabilitiesInlineValueProvider(Object value) {
  factory ServerCapabilitiesInlineValueProvider.fromJson(Object json) =>
      ServerCapabilitiesInlineValueProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isInlineValueOptions =>
      value is InlineValueOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  InlineValueOptions? get asInlineValueOptions {
    if (value is InlineValueOptions) {
      return value as InlineValueOptions;
    }
    if (isInlineValueOptions) {
      return InlineValueOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isInlineValueRegistrationOptions =>
      value is InlineValueRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  InlineValueRegistrationOptions? get asInlineValueRegistrationOptions {
    if (value is InlineValueRegistrationOptions) {
      return value as InlineValueRegistrationOptions;
    }
    if (isInlineValueRegistrationOptions) {
      return InlineValueRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesInlayHintProvider.
extension type const ServerCapabilitiesInlayHintProvider(Object value) {
  factory ServerCapabilitiesInlayHintProvider.fromJson(Object json) =>
      ServerCapabilitiesInlayHintProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isInlayHintOptions =>
      value is InlayHintOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  InlayHintOptions? get asInlayHintOptions {
    if (value is InlayHintOptions) {
      return value as InlayHintOptions;
    }
    if (isInlayHintOptions) {
      return InlayHintOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isInlayHintRegistrationOptions =>
      value is InlayHintRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  InlayHintRegistrationOptions? get asInlayHintRegistrationOptions {
    if (value is InlayHintRegistrationOptions) {
      return value as InlayHintRegistrationOptions;
    }
    if (isInlayHintRegistrationOptions) {
      return InlayHintRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesDiagnosticProvider.
extension type const ServerCapabilitiesDiagnosticProvider(Object value) {
  factory ServerCapabilitiesDiagnosticProvider.fromJson(Object json) =>
      ServerCapabilitiesDiagnosticProvider(json);

  Object toJson() => value;

  bool get isDiagnosticOptions =>
      value is DiagnosticOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  DiagnosticOptions? get asDiagnosticOptions {
    if (value is DiagnosticOptions) {
      return value as DiagnosticOptions;
    }
    if (isDiagnosticOptions) {
      return DiagnosticOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isDiagnosticRegistrationOptions =>
      value is DiagnosticRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  DiagnosticRegistrationOptions? get asDiagnosticRegistrationOptions {
    if (value is DiagnosticRegistrationOptions) {
      return value as DiagnosticRegistrationOptions;
    }
    if (isDiagnosticRegistrationOptions) {
      return DiagnosticRegistrationOptions.fromJson(
        value as Map<String, dynamic>,
      );
    }
    return null;
  }
}

/// Inline union: ServerCapabilitiesInlineCompletionProvider.
extension type const ServerCapabilitiesInlineCompletionProvider(Object value) {
  factory ServerCapabilitiesInlineCompletionProvider.fromJson(Object json) =>
      ServerCapabilitiesInlineCompletionProvider(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isInlineCompletionOptions =>
      value is InlineCompletionOptions || value is Map<String, dynamic>;

  InlineCompletionOptions? get asInlineCompletionOptions {
    if (value is InlineCompletionOptions) {
      return value as InlineCompletionOptions;
    }
    if (isInlineCompletionOptions) {
      return InlineCompletionOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: SignatureInformationDocumentation.
extension type const SignatureInformationDocumentation(Object value) {
  factory SignatureInformationDocumentation.fromJson(Object json) =>
      SignatureInformationDocumentation(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent {
    if (value is MarkupContent) {
      return value as MarkupContent;
    }
    if (isMarkupContent) {
      return MarkupContent.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: TextDocumentSyncOptionsSave.
extension type const TextDocumentSyncOptionsSave(Object value) {
  factory TextDocumentSyncOptionsSave.fromJson(Object json) =>
      TextDocumentSyncOptionsSave(json);

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }

  bool get isSaveOptions =>
      value is SaveOptions || value is Map<String, dynamic>;

  SaveOptions? get asSaveOptions {
    if (value is SaveOptions) {
      return value as SaveOptions;
    }
    if (isSaveOptions) {
      return SaveOptions.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: NotebookDocumentSyncOptionsNotebookSelectorItem.
extension type const NotebookDocumentSyncOptionsNotebookSelectorItem(
  Object value
) {
  factory NotebookDocumentSyncOptionsNotebookSelectorItem.fromJson(
    Object json,
  ) => NotebookDocumentSyncOptionsNotebookSelectorItem(json);

  Object toJson() => value;

  bool get isNotebookCells =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('notebook');

  ({Object notebook, List<Object>? cells})? get asNotebookCells {
    if (isNotebookCells) {
      final map = value as Map<String, dynamic>;
      return (
        notebook: map['notebook'] as Object,
        cells: map['cells'] as List<Object>?,
      );
    }
    return null;
  }
}

/// Inline union: NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem.
extension type const NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem(
  Object value
) {
  factory NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem.fromJson(
    Object json,
  ) => NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem(json);

  Object toJson() => value;

  bool get isNotebookCells =>
      value is Map<String, dynamic> &&
      (value as Map<String, dynamic>).containsKey('notebook');

  ({Object notebook, List<Object>? cells})? get asNotebookCells {
    if (isNotebookCells) {
      final map = value as Map<String, dynamic>;
      return (
        notebook: map['notebook'] as Object,
        cells: map['cells'] as List<Object>?,
      );
    }
    return null;
  }
}

/// Inline union: ParameterInformationDocumentation.
extension type const ParameterInformationDocumentation(Object value) {
  factory ParameterInformationDocumentation.fromJson(Object json) =>
      ParameterInformationDocumentation(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent {
    if (value is MarkupContent) {
      return value as MarkupContent;
    }
    if (isMarkupContent) {
      return MarkupContent.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: NotebookCellTextDocumentFilterNotebook.
extension type const NotebookCellTextDocumentFilterNotebook(Object value) {
  factory NotebookCellTextDocumentFilterNotebook.fromJson(Object json) =>
      NotebookCellTextDocumentFilterNotebook(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isNotebookDocumentFilter =>
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('notebookType') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('scheme') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('pattern');

  NotebookDocumentFilter? get asNotebookDocumentFilter {
    if (value is NotebookDocumentFilter) {
      return value as NotebookDocumentFilter;
    }
    if (isNotebookDocumentFilter) {
      return NotebookDocumentFilter.fromJson(value);
    }
    return null;
  }
}

/// Inline union: RelativePatternBaseUri.
extension type const RelativePatternBaseUri(Object value) {
  factory RelativePatternBaseUri.fromJson(Object json) =>
      RelativePatternBaseUri(json);

  Object toJson() => value;

  bool get isWorkspaceFolder =>
      value is WorkspaceFolder ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('name');

  WorkspaceFolder? get asWorkspaceFolder {
    if (value is WorkspaceFolder) {
      return value as WorkspaceFolder;
    }
    if (isWorkspaceFolder) {
      return WorkspaceFolder.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }
}
