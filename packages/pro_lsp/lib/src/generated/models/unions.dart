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
extension type const Definition._(Object value) {
  const factory Definition.fromJson(Object json) = Definition._;

  factory Definition.location(Location value) {
    return Definition._(value.toJson());
  }

  factory Definition.locationList(List<Location> value) {
    return Definition._(value.map((e) => e.toJson()).toList());
  }

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

  bool get isLocationList => value is List;

  List<Location>? get asLocationList {
    if (value is List<Location>) {
      return value as List<Location>;
    }
    if (isLocationList) {
      return (value as List)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
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
extension type const LSPAny._(Object? value) {
  const factory LSPAny.fromJson(Object? json) = LSPAny._;

  const factory LSPAny.lSPObject(LSPObject value) = LSPAny._;

  const factory LSPAny.lSPArray(LSPArray value) = LSPAny._;

  const factory LSPAny.string(String value) = LSPAny._;

  const factory LSPAny.int(int value) = LSPAny._;

  const factory LSPAny.double(double value) = LSPAny._;

  const factory LSPAny.bool(bool value) = LSPAny._;

  factory LSPAny.nullValue() {
    return LSPAny._(null);
  }

  Object? toJson() => value;

  bool get isLSPObject => value is Map<String, dynamic>;

  LSPObject? get asLSPObject {
    return isLSPObject ? value as LSPObject : null;
  }

  bool get isLSPArray => value is List;

  LSPArray? get asLSPArray {
    return isLSPArray ? value as LSPArray : null;
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

  bool get isNull => value == null;

  Null get asNull {
    return null;
  }
}

/// The declaration of a symbol representation as one or many `locations`.
extension type const Declaration._(Object value) {
  const factory Declaration.fromJson(Object json) = Declaration._;

  factory Declaration.location(Location value) {
    return Declaration._(value.toJson());
  }

  factory Declaration.locationList(List<Location> value) {
    return Declaration._(value.map((e) => e.toJson()).toList());
  }

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

  bool get isLocationList => value is List;

  List<Location>? get asLocationList {
    if (value is List<Location>) {
      return value as List<Location>;
    }
    if (isLocationList) {
      return (value as List)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
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
extension type const InlineValue._(Object value) {
  const factory InlineValue.fromJson(Object json) = InlineValue._;

  factory InlineValue.text(InlineValueText value) {
    return InlineValue._(value.toJson());
  }

  factory InlineValue.variableLookup(InlineValueVariableLookup value) {
    return InlineValue._(value.toJson());
  }

  factory InlineValue.evaluatableExpression(
    InlineValueEvaluatableExpression value,
  ) {
    return InlineValue._(value.toJson());
  }

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
extension type const DocumentDiagnosticReport._(Object value) {
  const factory DocumentDiagnosticReport.fromJson(Object json) =
      DocumentDiagnosticReport._;

  factory DocumentDiagnosticReport.relatedFullDocumentDiagnosticReport(
    RelatedFullDocumentDiagnosticReport value,
  ) {
    return DocumentDiagnosticReport._(value.toJson());
  }

  factory DocumentDiagnosticReport.relatedUnchangedDocumentDiagnosticReport(
    RelatedUnchangedDocumentDiagnosticReport value,
  ) {
    return DocumentDiagnosticReport._(value.toJson());
  }

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
extension type const PrepareRenameResult._(Object value) {
  const factory PrepareRenameResult.fromJson(Object json) =
      PrepareRenameResult._;

  factory PrepareRenameResult.range(Range value) {
    return PrepareRenameResult._(value.toJson());
  }

  factory PrepareRenameResult.rangePlaceholder({
    required Range range,
    required String placeholder,
  }) {
    return PrepareRenameResult._({
      'range': range.toJson(),
      'placeholder': placeholder,
    });
  }

  factory PrepareRenameResult.defaultBehavior({required bool defaultBehavior}) {
    return PrepareRenameResult._({'defaultBehavior': defaultBehavior});
  }

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
extension type const WorkspaceDocumentDiagnosticReport._(Object value) {
  const factory WorkspaceDocumentDiagnosticReport.fromJson(Object json) =
      WorkspaceDocumentDiagnosticReport._;

  factory WorkspaceDocumentDiagnosticReport.workspaceFullDocumentDiagnosticReport(
    WorkspaceFullDocumentDiagnosticReport value,
  ) {
    return WorkspaceDocumentDiagnosticReport._(value.toJson());
  }

  factory WorkspaceDocumentDiagnosticReport.workspaceUnchangedDocumentDiagnosticReport(
    WorkspaceUnchangedDocumentDiagnosticReport value,
  ) {
    return WorkspaceDocumentDiagnosticReport._(value.toJson());
  }

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
extension type const TextDocumentContentChangeEvent._(Object value) {
  const factory TextDocumentContentChangeEvent.fromJson(Object json) =
      TextDocumentContentChangeEvent._;

  factory TextDocumentContentChangeEvent.rangeRangeLengthText({
    required Range range,
    int? rangeLength,
    required String text,
  }) {
    return TextDocumentContentChangeEvent._({
      'range': range.toJson(),
      if (rangeLength != null) 'rangeLength': rangeLength,
      'text': text,
    });
  }

  factory TextDocumentContentChangeEvent.text({required String text}) {
    return TextDocumentContentChangeEvent._({'text': text});
  }

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
extension type const MarkedString._(Object value) {
  const factory MarkedString.fromJson(Object json) = MarkedString._;

  const factory MarkedString.string(String value) = MarkedString._;

  factory MarkedString.languageValue({
    required String language,
    required String value,
  }) {
    return MarkedString._({'language': language, 'value': value});
  }

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
extension type const DocumentFilter._(Object value) {
  const factory DocumentFilter.fromJson(Object json) = DocumentFilter._;

  factory DocumentFilter.textDocumentFilter(TextDocumentFilter value) {
    return DocumentFilter._(value.toJson());
  }

  factory DocumentFilter.notebookCellTextDocumentFilter(
    NotebookCellTextDocumentFilter value,
  ) {
    return DocumentFilter._(value.toJson());
  }

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
extension type const GlobPattern._(Object value) {
  const factory GlobPattern.fromJson(Object json) = GlobPattern._;

  const factory GlobPattern.pattern(Pattern value) = GlobPattern._;

  factory GlobPattern.relativePattern(RelativePattern value) {
    return GlobPattern._(value.toJson());
  }

  Object toJson() => value;

  bool get isPattern => value is String;

  Pattern? get asPattern {
    return isPattern ? value as Pattern : null;
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
extension type const TextDocumentFilter._(Object value) {
  const factory TextDocumentFilter.fromJson(Object json) = TextDocumentFilter._;

  factory TextDocumentFilter.languageSchemePattern({
    required String language,
    String? scheme,
    String? pattern,
  }) {
    return TextDocumentFilter._({
      'language': language,
      if (scheme != null) 'scheme': scheme,
      if (pattern != null) 'pattern': pattern,
    });
  }

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
extension type const NotebookDocumentFilter._(Object value) {
  const factory NotebookDocumentFilter.fromJson(Object json) =
      NotebookDocumentFilter._;

  factory NotebookDocumentFilter.notebookTypeSchemePattern({
    required String notebookType,
    String? scheme,
    String? pattern,
  }) {
    return NotebookDocumentFilter._({
      'notebookType': notebookType,
      if (scheme != null) 'scheme': scheme,
      if (pattern != null) 'pattern': pattern,
    });
  }

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
extension type const SemanticTokensRegistrationOptionsRange._(Object value) {
  const factory SemanticTokensRegistrationOptionsRange.fromJson(Object json) =
      SemanticTokensRegistrationOptionsRange._;

  const factory SemanticTokensRegistrationOptionsRange.bool(bool value) =
      SemanticTokensRegistrationOptionsRange._;

  factory SemanticTokensRegistrationOptionsRange.empty() {
    return SemanticTokensRegistrationOptionsRange._({});
  }

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
extension type const SemanticTokensRegistrationOptionsFull._(Object value) {
  const factory SemanticTokensRegistrationOptionsFull.fromJson(Object json) =
      SemanticTokensRegistrationOptionsFull._;

  const factory SemanticTokensRegistrationOptionsFull.bool(bool value) =
      SemanticTokensRegistrationOptionsFull._;

  factory SemanticTokensRegistrationOptionsFull.delta({bool? delta}) {
    return SemanticTokensRegistrationOptionsFull._({
      if (delta != null) 'delta': delta,
    });
  }

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
extension type const WorkspaceEditDocumentChangesItem._(Object value) {
  const factory WorkspaceEditDocumentChangesItem.fromJson(Object json) =
      WorkspaceEditDocumentChangesItem._;

  factory WorkspaceEditDocumentChangesItem.textDocumentEdit(
    TextDocumentEdit value,
  ) {
    return WorkspaceEditDocumentChangesItem._(value.toJson());
  }

  factory WorkspaceEditDocumentChangesItem.createFile(CreateFile value) {
    return WorkspaceEditDocumentChangesItem._(value.toJson());
  }

  factory WorkspaceEditDocumentChangesItem.renameFile(RenameFile value) {
    return WorkspaceEditDocumentChangesItem._(value.toJson());
  }

  factory WorkspaceEditDocumentChangesItem.deleteFile(DeleteFile value) {
    return WorkspaceEditDocumentChangesItem._(value.toJson());
  }

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
extension type const InlayHintLabel._(Object value) {
  const factory InlayHintLabel.fromJson(Object json) = InlayHintLabel._;

  const factory InlayHintLabel.string(String value) = InlayHintLabel._;

  factory InlayHintLabel.partList(List<InlayHintLabelPart> value) {
    return InlayHintLabel._(value.map((e) => e.toJson()).toList());
  }

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isPartList => value is List;

  List<InlayHintLabelPart>? get asPartList {
    if (value is List<InlayHintLabelPart>) {
      return value as List<InlayHintLabelPart>;
    }
    if (isPartList) {
      return (value as List)
          .map((e) => InlayHintLabelPart.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }
}

/// Inline union: InlayHintTooltip.
extension type const InlayHintTooltip._(Object value) {
  const factory InlayHintTooltip.fromJson(Object json) = InlayHintTooltip._;

  const factory InlayHintTooltip.string(String value) = InlayHintTooltip._;

  factory InlayHintTooltip.markupContent(MarkupContent value) {
    return InlayHintTooltip._(value.toJson());
  }

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
extension type const InlineCompletionItemInsertText._(Object value) {
  const factory InlineCompletionItemInsertText.fromJson(Object json) =
      InlineCompletionItemInsertText._;

  const factory InlineCompletionItemInsertText.string(String value) =
      InlineCompletionItemInsertText._;

  factory InlineCompletionItemInsertText.stringValue(StringValue value) {
    return InlineCompletionItemInsertText._(value.toJson());
  }

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
extension type const DidChangeConfigurationRegistrationOptionsSection._(
  Object value
) {
  const factory DidChangeConfigurationRegistrationOptionsSection.fromJson(
    Object json,
  ) = DidChangeConfigurationRegistrationOptionsSection._;

  const factory DidChangeConfigurationRegistrationOptionsSection.string(
    String value,
  ) = DidChangeConfigurationRegistrationOptionsSection._;

  const factory DidChangeConfigurationRegistrationOptionsSection.stringList(
    List<String> value,
  ) = DidChangeConfigurationRegistrationOptionsSection._;

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isStringList => value is List;

  List<String>? get asStringList {
    return isStringList ? value as List<String> : null;
  }
}

/// Inline union: CompletionItemDocumentation.
extension type const CompletionItemDocumentation._(Object value) {
  const factory CompletionItemDocumentation.fromJson(Object json) =
      CompletionItemDocumentation._;

  const factory CompletionItemDocumentation.string(String value) =
      CompletionItemDocumentation._;

  factory CompletionItemDocumentation.markupContent(MarkupContent value) {
    return CompletionItemDocumentation._(value.toJson());
  }

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
extension type const CompletionItemTextEdit._(Object value) {
  const factory CompletionItemTextEdit.fromJson(Object json) =
      CompletionItemTextEdit._;

  factory CompletionItemTextEdit.textEdit(TextEdit value) {
    return CompletionItemTextEdit._(value.toJson());
  }

  factory CompletionItemTextEdit.insertReplaceEdit(InsertReplaceEdit value) {
    return CompletionItemTextEdit._(value.toJson());
  }

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
extension type const HoverContents._(Object value) {
  const factory HoverContents.fromJson(Object json) = HoverContents._;

  factory HoverContents.markupContent(MarkupContent value) {
    return HoverContents._(value.toJson());
  }

  factory HoverContents.markedString(MarkedString value) {
    return HoverContents._(value.toJson());
  }

  factory HoverContents.markedStringList(List<MarkedString> value) {
    return HoverContents._(value.map((e) => e.toJson()).toList());
  }

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

  bool get isMarkedStringList => value is List;

  List<MarkedString>? get asMarkedStringList {
    if (value is List<MarkedString>) {
      return value as List<MarkedString>;
    }
    if (isMarkedStringList) {
      return (value as List)
          .map((e) => MarkedString.fromJson(e as Object))
          .toList();
    }
    return null;
  }
}

/// Inline union: WorkspaceSymbolLocation.
extension type const WorkspaceSymbolLocation._(Object value) {
  const factory WorkspaceSymbolLocation.fromJson(Object json) =
      WorkspaceSymbolLocation._;

  factory WorkspaceSymbolLocation.location(Location value) {
    return WorkspaceSymbolLocation._(value.toJson());
  }

  factory WorkspaceSymbolLocation.uri({required String uri}) {
    return WorkspaceSymbolLocation._({'uri': uri});
  }

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
extension type const SemanticTokensOptionsRange._(Object value) {
  const factory SemanticTokensOptionsRange.fromJson(Object json) =
      SemanticTokensOptionsRange._;

  const factory SemanticTokensOptionsRange.bool(bool value) =
      SemanticTokensOptionsRange._;

  factory SemanticTokensOptionsRange.empty() {
    return SemanticTokensOptionsRange._({});
  }

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
extension type const SemanticTokensOptionsFull._(Object value) {
  const factory SemanticTokensOptionsFull.fromJson(Object json) =
      SemanticTokensOptionsFull._;

  const factory SemanticTokensOptionsFull.bool(bool value) =
      SemanticTokensOptionsFull._;

  factory SemanticTokensOptionsFull.delta({bool? delta}) {
    return SemanticTokensOptionsFull._({if (delta != null) 'delta': delta});
  }

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
extension type const TextDocumentEditEditsItem._(Object value) {
  const factory TextDocumentEditEditsItem.fromJson(Object json) =
      TextDocumentEditEditsItem._;

  factory TextDocumentEditEditsItem.textEdit(TextEdit value) {
    return TextDocumentEditEditsItem._(value.toJson());
  }

  factory TextDocumentEditEditsItem.annotatedTextEdit(AnnotatedTextEdit value) {
    return TextDocumentEditEditsItem._(value.toJson());
  }

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
extension type const InlayHintLabelPartTooltip._(Object value) {
  const factory InlayHintLabelPartTooltip.fromJson(Object json) =
      InlayHintLabelPartTooltip._;

  const factory InlayHintLabelPartTooltip.string(String value) =
      InlayHintLabelPartTooltip._;

  factory InlayHintLabelPartTooltip.markupContent(MarkupContent value) {
    return InlayHintLabelPartTooltip._(value.toJson());
  }

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
extension type const ServerCapabilitiesTextDocumentSync._(Object value) {
  const factory ServerCapabilitiesTextDocumentSync.fromJson(Object json) =
      ServerCapabilitiesTextDocumentSync._;

  factory ServerCapabilitiesTextDocumentSync.textDocumentSyncOptions(
    TextDocumentSyncOptions value,
  ) {
    return ServerCapabilitiesTextDocumentSync._(value.toJson());
  }

  factory ServerCapabilitiesTextDocumentSync.textDocumentSyncKind(
    TextDocumentSyncKind value,
  ) {
    return ServerCapabilitiesTextDocumentSync._(value.value);
  }

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
extension type const ServerCapabilitiesNotebookDocumentSync._(Object value) {
  const factory ServerCapabilitiesNotebookDocumentSync.fromJson(Object json) =
      ServerCapabilitiesNotebookDocumentSync._;

  factory ServerCapabilitiesNotebookDocumentSync.notebookDocumentSyncOptions(
    NotebookDocumentSyncOptions value,
  ) {
    return ServerCapabilitiesNotebookDocumentSync._(value.toJson());
  }

  factory ServerCapabilitiesNotebookDocumentSync.notebookDocumentSyncRegistrationOptions(
    NotebookDocumentSyncRegistrationOptions value,
  ) {
    return ServerCapabilitiesNotebookDocumentSync._(value.toJson());
  }

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
extension type const ServerCapabilitiesHoverProvider._(Object value) {
  const factory ServerCapabilitiesHoverProvider.fromJson(Object json) =
      ServerCapabilitiesHoverProvider._;

  const factory ServerCapabilitiesHoverProvider.bool(bool value) =
      ServerCapabilitiesHoverProvider._;

  factory ServerCapabilitiesHoverProvider.hoverOptions(HoverOptions value) {
    return ServerCapabilitiesHoverProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesDeclarationProvider._(Object value) {
  const factory ServerCapabilitiesDeclarationProvider.fromJson(Object json) =
      ServerCapabilitiesDeclarationProvider._;

  const factory ServerCapabilitiesDeclarationProvider.bool(bool value) =
      ServerCapabilitiesDeclarationProvider._;

  factory ServerCapabilitiesDeclarationProvider.declarationOptions(
    DeclarationOptions value,
  ) {
    return ServerCapabilitiesDeclarationProvider._(value.toJson());
  }

  factory ServerCapabilitiesDeclarationProvider.declarationRegistrationOptions(
    DeclarationRegistrationOptions value,
  ) {
    return ServerCapabilitiesDeclarationProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesDefinitionProvider._(Object value) {
  const factory ServerCapabilitiesDefinitionProvider.fromJson(Object json) =
      ServerCapabilitiesDefinitionProvider._;

  const factory ServerCapabilitiesDefinitionProvider.bool(bool value) =
      ServerCapabilitiesDefinitionProvider._;

  factory ServerCapabilitiesDefinitionProvider.definitionOptions(
    DefinitionOptions value,
  ) {
    return ServerCapabilitiesDefinitionProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesTypeDefinitionProvider._(Object value) {
  const factory ServerCapabilitiesTypeDefinitionProvider.fromJson(Object json) =
      ServerCapabilitiesTypeDefinitionProvider._;

  const factory ServerCapabilitiesTypeDefinitionProvider.bool(bool value) =
      ServerCapabilitiesTypeDefinitionProvider._;

  factory ServerCapabilitiesTypeDefinitionProvider.typeDefinitionOptions(
    TypeDefinitionOptions value,
  ) {
    return ServerCapabilitiesTypeDefinitionProvider._(value.toJson());
  }

  factory ServerCapabilitiesTypeDefinitionProvider.typeDefinitionRegistrationOptions(
    TypeDefinitionRegistrationOptions value,
  ) {
    return ServerCapabilitiesTypeDefinitionProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesImplementationProvider._(Object value) {
  const factory ServerCapabilitiesImplementationProvider.fromJson(Object json) =
      ServerCapabilitiesImplementationProvider._;

  const factory ServerCapabilitiesImplementationProvider.bool(bool value) =
      ServerCapabilitiesImplementationProvider._;

  factory ServerCapabilitiesImplementationProvider.implementationOptions(
    ImplementationOptions value,
  ) {
    return ServerCapabilitiesImplementationProvider._(value.toJson());
  }

  factory ServerCapabilitiesImplementationProvider.implementationRegistrationOptions(
    ImplementationRegistrationOptions value,
  ) {
    return ServerCapabilitiesImplementationProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesReferencesProvider._(Object value) {
  const factory ServerCapabilitiesReferencesProvider.fromJson(Object json) =
      ServerCapabilitiesReferencesProvider._;

  const factory ServerCapabilitiesReferencesProvider.bool(bool value) =
      ServerCapabilitiesReferencesProvider._;

  factory ServerCapabilitiesReferencesProvider.referenceOptions(
    ReferenceOptions value,
  ) {
    return ServerCapabilitiesReferencesProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesDocumentHighlightProvider._(
  Object value
) {
  const factory ServerCapabilitiesDocumentHighlightProvider.fromJson(
    Object json,
  ) = ServerCapabilitiesDocumentHighlightProvider._;

  const factory ServerCapabilitiesDocumentHighlightProvider.bool(bool value) =
      ServerCapabilitiesDocumentHighlightProvider._;

  factory ServerCapabilitiesDocumentHighlightProvider.documentHighlightOptions(
    DocumentHighlightOptions value,
  ) {
    return ServerCapabilitiesDocumentHighlightProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesDocumentSymbolProvider._(Object value) {
  const factory ServerCapabilitiesDocumentSymbolProvider.fromJson(Object json) =
      ServerCapabilitiesDocumentSymbolProvider._;

  const factory ServerCapabilitiesDocumentSymbolProvider.bool(bool value) =
      ServerCapabilitiesDocumentSymbolProvider._;

  factory ServerCapabilitiesDocumentSymbolProvider.documentSymbolOptions(
    DocumentSymbolOptions value,
  ) {
    return ServerCapabilitiesDocumentSymbolProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesCodeActionProvider._(Object value) {
  const factory ServerCapabilitiesCodeActionProvider.fromJson(Object json) =
      ServerCapabilitiesCodeActionProvider._;

  const factory ServerCapabilitiesCodeActionProvider.bool(bool value) =
      ServerCapabilitiesCodeActionProvider._;

  factory ServerCapabilitiesCodeActionProvider.codeActionOptions(
    CodeActionOptions value,
  ) {
    return ServerCapabilitiesCodeActionProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesColorProvider._(Object value) {
  const factory ServerCapabilitiesColorProvider.fromJson(Object json) =
      ServerCapabilitiesColorProvider._;

  const factory ServerCapabilitiesColorProvider.bool(bool value) =
      ServerCapabilitiesColorProvider._;

  factory ServerCapabilitiesColorProvider.documentColorOptions(
    DocumentColorOptions value,
  ) {
    return ServerCapabilitiesColorProvider._(value.toJson());
  }

  factory ServerCapabilitiesColorProvider.documentColorRegistrationOptions(
    DocumentColorRegistrationOptions value,
  ) {
    return ServerCapabilitiesColorProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesWorkspaceSymbolProvider._(Object value) {
  const factory ServerCapabilitiesWorkspaceSymbolProvider.fromJson(
    Object json,
  ) = ServerCapabilitiesWorkspaceSymbolProvider._;

  const factory ServerCapabilitiesWorkspaceSymbolProvider.bool(bool value) =
      ServerCapabilitiesWorkspaceSymbolProvider._;

  factory ServerCapabilitiesWorkspaceSymbolProvider.workspaceSymbolOptions(
    WorkspaceSymbolOptions value,
  ) {
    return ServerCapabilitiesWorkspaceSymbolProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesDocumentFormattingProvider._(
  Object value
) {
  const factory ServerCapabilitiesDocumentFormattingProvider.fromJson(
    Object json,
  ) = ServerCapabilitiesDocumentFormattingProvider._;

  const factory ServerCapabilitiesDocumentFormattingProvider.bool(bool value) =
      ServerCapabilitiesDocumentFormattingProvider._;

  factory ServerCapabilitiesDocumentFormattingProvider.documentFormattingOptions(
    DocumentFormattingOptions value,
  ) {
    return ServerCapabilitiesDocumentFormattingProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesDocumentRangeFormattingProvider._(
  Object value
) {
  const factory ServerCapabilitiesDocumentRangeFormattingProvider.fromJson(
    Object json,
  ) = ServerCapabilitiesDocumentRangeFormattingProvider._;

  const factory ServerCapabilitiesDocumentRangeFormattingProvider.bool(
    bool value,
  ) = ServerCapabilitiesDocumentRangeFormattingProvider._;

  factory ServerCapabilitiesDocumentRangeFormattingProvider.documentRangeFormattingOptions(
    DocumentRangeFormattingOptions value,
  ) {
    return ServerCapabilitiesDocumentRangeFormattingProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesRenameProvider._(Object value) {
  const factory ServerCapabilitiesRenameProvider.fromJson(Object json) =
      ServerCapabilitiesRenameProvider._;

  const factory ServerCapabilitiesRenameProvider.bool(bool value) =
      ServerCapabilitiesRenameProvider._;

  factory ServerCapabilitiesRenameProvider.renameOptions(RenameOptions value) {
    return ServerCapabilitiesRenameProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesFoldingRangeProvider._(Object value) {
  const factory ServerCapabilitiesFoldingRangeProvider.fromJson(Object json) =
      ServerCapabilitiesFoldingRangeProvider._;

  const factory ServerCapabilitiesFoldingRangeProvider.bool(bool value) =
      ServerCapabilitiesFoldingRangeProvider._;

  factory ServerCapabilitiesFoldingRangeProvider.foldingRangeOptions(
    FoldingRangeOptions value,
  ) {
    return ServerCapabilitiesFoldingRangeProvider._(value.toJson());
  }

  factory ServerCapabilitiesFoldingRangeProvider.foldingRangeRegistrationOptions(
    FoldingRangeRegistrationOptions value,
  ) {
    return ServerCapabilitiesFoldingRangeProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesSelectionRangeProvider._(Object value) {
  const factory ServerCapabilitiesSelectionRangeProvider.fromJson(Object json) =
      ServerCapabilitiesSelectionRangeProvider._;

  const factory ServerCapabilitiesSelectionRangeProvider.bool(bool value) =
      ServerCapabilitiesSelectionRangeProvider._;

  factory ServerCapabilitiesSelectionRangeProvider.selectionRangeOptions(
    SelectionRangeOptions value,
  ) {
    return ServerCapabilitiesSelectionRangeProvider._(value.toJson());
  }

  factory ServerCapabilitiesSelectionRangeProvider.selectionRangeRegistrationOptions(
    SelectionRangeRegistrationOptions value,
  ) {
    return ServerCapabilitiesSelectionRangeProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesCallHierarchyProvider._(Object value) {
  const factory ServerCapabilitiesCallHierarchyProvider.fromJson(Object json) =
      ServerCapabilitiesCallHierarchyProvider._;

  const factory ServerCapabilitiesCallHierarchyProvider.bool(bool value) =
      ServerCapabilitiesCallHierarchyProvider._;

  factory ServerCapabilitiesCallHierarchyProvider.callHierarchyOptions(
    CallHierarchyOptions value,
  ) {
    return ServerCapabilitiesCallHierarchyProvider._(value.toJson());
  }

  factory ServerCapabilitiesCallHierarchyProvider.callHierarchyRegistrationOptions(
    CallHierarchyRegistrationOptions value,
  ) {
    return ServerCapabilitiesCallHierarchyProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesLinkedEditingRangeProvider._(
  Object value
) {
  const factory ServerCapabilitiesLinkedEditingRangeProvider.fromJson(
    Object json,
  ) = ServerCapabilitiesLinkedEditingRangeProvider._;

  const factory ServerCapabilitiesLinkedEditingRangeProvider.bool(bool value) =
      ServerCapabilitiesLinkedEditingRangeProvider._;

  factory ServerCapabilitiesLinkedEditingRangeProvider.linkedEditingRangeOptions(
    LinkedEditingRangeOptions value,
  ) {
    return ServerCapabilitiesLinkedEditingRangeProvider._(value.toJson());
  }

  factory ServerCapabilitiesLinkedEditingRangeProvider.linkedEditingRangeRegistrationOptions(
    LinkedEditingRangeRegistrationOptions value,
  ) {
    return ServerCapabilitiesLinkedEditingRangeProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesSemanticTokensProvider._(Object value) {
  const factory ServerCapabilitiesSemanticTokensProvider.fromJson(Object json) =
      ServerCapabilitiesSemanticTokensProvider._;

  factory ServerCapabilitiesSemanticTokensProvider.semanticTokensOptions(
    SemanticTokensOptions value,
  ) {
    return ServerCapabilitiesSemanticTokensProvider._(value.toJson());
  }

  factory ServerCapabilitiesSemanticTokensProvider.semanticTokensRegistrationOptions(
    SemanticTokensRegistrationOptions value,
  ) {
    return ServerCapabilitiesSemanticTokensProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesMonikerProvider._(Object value) {
  const factory ServerCapabilitiesMonikerProvider.fromJson(Object json) =
      ServerCapabilitiesMonikerProvider._;

  const factory ServerCapabilitiesMonikerProvider.bool(bool value) =
      ServerCapabilitiesMonikerProvider._;

  factory ServerCapabilitiesMonikerProvider.monikerOptions(
    MonikerOptions value,
  ) {
    return ServerCapabilitiesMonikerProvider._(value.toJson());
  }

  factory ServerCapabilitiesMonikerProvider.monikerRegistrationOptions(
    MonikerRegistrationOptions value,
  ) {
    return ServerCapabilitiesMonikerProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesTypeHierarchyProvider._(Object value) {
  const factory ServerCapabilitiesTypeHierarchyProvider.fromJson(Object json) =
      ServerCapabilitiesTypeHierarchyProvider._;

  const factory ServerCapabilitiesTypeHierarchyProvider.bool(bool value) =
      ServerCapabilitiesTypeHierarchyProvider._;

  factory ServerCapabilitiesTypeHierarchyProvider.typeHierarchyOptions(
    TypeHierarchyOptions value,
  ) {
    return ServerCapabilitiesTypeHierarchyProvider._(value.toJson());
  }

  factory ServerCapabilitiesTypeHierarchyProvider.typeHierarchyRegistrationOptions(
    TypeHierarchyRegistrationOptions value,
  ) {
    return ServerCapabilitiesTypeHierarchyProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesInlineValueProvider._(Object value) {
  const factory ServerCapabilitiesInlineValueProvider.fromJson(Object json) =
      ServerCapabilitiesInlineValueProvider._;

  const factory ServerCapabilitiesInlineValueProvider.bool(bool value) =
      ServerCapabilitiesInlineValueProvider._;

  factory ServerCapabilitiesInlineValueProvider.inlineValueOptions(
    InlineValueOptions value,
  ) {
    return ServerCapabilitiesInlineValueProvider._(value.toJson());
  }

  factory ServerCapabilitiesInlineValueProvider.inlineValueRegistrationOptions(
    InlineValueRegistrationOptions value,
  ) {
    return ServerCapabilitiesInlineValueProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesInlayHintProvider._(Object value) {
  const factory ServerCapabilitiesInlayHintProvider.fromJson(Object json) =
      ServerCapabilitiesInlayHintProvider._;

  const factory ServerCapabilitiesInlayHintProvider.bool(bool value) =
      ServerCapabilitiesInlayHintProvider._;

  factory ServerCapabilitiesInlayHintProvider.inlayHintOptions(
    InlayHintOptions value,
  ) {
    return ServerCapabilitiesInlayHintProvider._(value.toJson());
  }

  factory ServerCapabilitiesInlayHintProvider.inlayHintRegistrationOptions(
    InlayHintRegistrationOptions value,
  ) {
    return ServerCapabilitiesInlayHintProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesDiagnosticProvider._(Object value) {
  const factory ServerCapabilitiesDiagnosticProvider.fromJson(Object json) =
      ServerCapabilitiesDiagnosticProvider._;

  factory ServerCapabilitiesDiagnosticProvider.diagnosticOptions(
    DiagnosticOptions value,
  ) {
    return ServerCapabilitiesDiagnosticProvider._(value.toJson());
  }

  factory ServerCapabilitiesDiagnosticProvider.diagnosticRegistrationOptions(
    DiagnosticRegistrationOptions value,
  ) {
    return ServerCapabilitiesDiagnosticProvider._(value.toJson());
  }

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
extension type const ServerCapabilitiesInlineCompletionProvider._(
  Object value
) {
  const factory ServerCapabilitiesInlineCompletionProvider.fromJson(
    Object json,
  ) = ServerCapabilitiesInlineCompletionProvider._;

  const factory ServerCapabilitiesInlineCompletionProvider.bool(bool value) =
      ServerCapabilitiesInlineCompletionProvider._;

  factory ServerCapabilitiesInlineCompletionProvider.inlineCompletionOptions(
    InlineCompletionOptions value,
  ) {
    return ServerCapabilitiesInlineCompletionProvider._(value.toJson());
  }

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
extension type const SignatureInformationDocumentation._(Object value) {
  const factory SignatureInformationDocumentation.fromJson(Object json) =
      SignatureInformationDocumentation._;

  const factory SignatureInformationDocumentation.string(String value) =
      SignatureInformationDocumentation._;

  factory SignatureInformationDocumentation.markupContent(MarkupContent value) {
    return SignatureInformationDocumentation._(value.toJson());
  }

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
extension type const TextDocumentSyncOptionsSave._(Object value) {
  const factory TextDocumentSyncOptionsSave.fromJson(Object json) =
      TextDocumentSyncOptionsSave._;

  const factory TextDocumentSyncOptionsSave.bool(bool value) =
      TextDocumentSyncOptionsSave._;

  factory TextDocumentSyncOptionsSave.saveOptions(SaveOptions value) {
    return TextDocumentSyncOptionsSave._(value.toJson());
  }

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
extension type const NotebookDocumentSyncOptionsNotebookSelectorItem._(
  Object value
) {
  const factory NotebookDocumentSyncOptionsNotebookSelectorItem.fromJson(
    Object json,
  ) = NotebookDocumentSyncOptionsNotebookSelectorItem._;

  factory NotebookDocumentSyncOptionsNotebookSelectorItem.notebookCells({
    required Object notebook,
    List<Object>? cells,
  }) {
    return NotebookDocumentSyncOptionsNotebookSelectorItem._({
      'notebook': notebook,
      if (cells != null) 'cells': cells,
    });
  }

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
extension type const NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem._(
  Object value
) {
  const factory NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem.fromJson(
    Object json,
  ) = NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem._;

  factory NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem.notebookCells({
    required Object notebook,
    List<Object>? cells,
  }) {
    return NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem._({
      'notebook': notebook,
      if (cells != null) 'cells': cells,
    });
  }

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
extension type const ParameterInformationDocumentation._(Object value) {
  const factory ParameterInformationDocumentation.fromJson(Object json) =
      ParameterInformationDocumentation._;

  const factory ParameterInformationDocumentation.string(String value) =
      ParameterInformationDocumentation._;

  factory ParameterInformationDocumentation.markupContent(MarkupContent value) {
    return ParameterInformationDocumentation._(value.toJson());
  }

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
extension type const NotebookCellTextDocumentFilterNotebook._(Object value) {
  const factory NotebookCellTextDocumentFilterNotebook.fromJson(Object json) =
      NotebookCellTextDocumentFilterNotebook._;

  const factory NotebookCellTextDocumentFilterNotebook.string(String value) =
      NotebookCellTextDocumentFilterNotebook._;

  factory NotebookCellTextDocumentFilterNotebook.notebookDocumentFilter(
    NotebookDocumentFilter value,
  ) {
    return NotebookCellTextDocumentFilterNotebook._(value.toJson());
  }

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
extension type const RelativePatternBaseUri._(Object value) {
  const factory RelativePatternBaseUri.fromJson(Object json) =
      RelativePatternBaseUri._;

  factory RelativePatternBaseUri.workspaceFolder(WorkspaceFolder value) {
    return RelativePatternBaseUri._(value.toJson());
  }

  const factory RelativePatternBaseUri.string(String value) =
      RelativePatternBaseUri._;

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

/// Inline union: ImplementationResult.
extension type const ImplementationResult._(Object value) {
  const factory ImplementationResult.fromJson(Object json) =
      ImplementationResult._;

  factory ImplementationResult.definition(Definition value) {
    return ImplementationResult._(value.toJson());
  }

  const factory ImplementationResult.definitionLinkList(
    List<DefinitionLink> value,
  ) = ImplementationResult._;

  Object toJson() => value;

  bool get isDefinition =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range') ||
      value is List;

  Definition? get asDefinition {
    if (value is Definition) {
      return value as Definition;
    }
    if (isDefinition) {
      return Definition.fromJson(value);
    }
    return null;
  }

  bool get isDefinitionLinkList => value is List;

  List<DefinitionLink>? get asDefinitionLinkList {
    return isDefinitionLinkList ? value as List<DefinitionLink> : null;
  }
}

/// Inline union: TypeDefinitionResult.
extension type const TypeDefinitionResult._(Object value) {
  const factory TypeDefinitionResult.fromJson(Object json) =
      TypeDefinitionResult._;

  factory TypeDefinitionResult.definition(Definition value) {
    return TypeDefinitionResult._(value.toJson());
  }

  const factory TypeDefinitionResult.definitionLinkList(
    List<DefinitionLink> value,
  ) = TypeDefinitionResult._;

  Object toJson() => value;

  bool get isDefinition =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range') ||
      value is List;

  Definition? get asDefinition {
    if (value is Definition) {
      return value as Definition;
    }
    if (isDefinition) {
      return Definition.fromJson(value);
    }
    return null;
  }

  bool get isDefinitionLinkList => value is List;

  List<DefinitionLink>? get asDefinitionLinkList {
    return isDefinitionLinkList ? value as List<DefinitionLink> : null;
  }
}

/// Inline union: DeclarationResult.
extension type const DeclarationResult._(Object value) {
  const factory DeclarationResult.fromJson(Object json) = DeclarationResult._;

  factory DeclarationResult.declaration(Declaration value) {
    return DeclarationResult._(value.toJson());
  }

  const factory DeclarationResult.declarationLinkList(
    List<DeclarationLink> value,
  ) = DeclarationResult._;

  Object toJson() => value;

  bool get isDeclaration =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range') ||
      value is List;

  Declaration? get asDeclaration {
    if (value is Declaration) {
      return value as Declaration;
    }
    if (isDeclaration) {
      return Declaration.fromJson(value);
    }
    return null;
  }

  bool get isDeclarationLinkList => value is List;

  List<DeclarationLink>? get asDeclarationLinkList {
    return isDeclarationLinkList ? value as List<DeclarationLink> : null;
  }
}

/// Inline union: SemanticTokensFullDeltaResult.
extension type const SemanticTokensFullDeltaResult._(Object value) {
  const factory SemanticTokensFullDeltaResult.fromJson(Object json) =
      SemanticTokensFullDeltaResult._;

  factory SemanticTokensFullDeltaResult.semanticTokens(SemanticTokens value) {
    return SemanticTokensFullDeltaResult._(value.toJson());
  }

  factory SemanticTokensFullDeltaResult.semanticTokensDelta(
    SemanticTokensDelta value,
  ) {
    return SemanticTokensFullDeltaResult._(value.toJson());
  }

  Object toJson() => value;

  bool get isSemanticTokens =>
      value is SemanticTokens ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('data');

  SemanticTokens? get asSemanticTokens {
    if (value is SemanticTokens) {
      return value as SemanticTokens;
    }
    if (isSemanticTokens) {
      return SemanticTokens.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isSemanticTokensDelta =>
      value is SemanticTokensDelta ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('edits');

  SemanticTokensDelta? get asSemanticTokensDelta {
    if (value is SemanticTokensDelta) {
      return value as SemanticTokensDelta;
    }
    if (isSemanticTokensDelta) {
      return SemanticTokensDelta.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: InlineCompletionResult.
extension type const InlineCompletionResult._(Object value) {
  const factory InlineCompletionResult.fromJson(Object json) =
      InlineCompletionResult._;

  factory InlineCompletionResult.inlineCompletionList(
    InlineCompletionList value,
  ) {
    return InlineCompletionResult._(value.toJson());
  }

  factory InlineCompletionResult.inlineCompletionItemList(
    List<InlineCompletionItem> value,
  ) {
    return InlineCompletionResult._(value.map((e) => e.toJson()).toList());
  }

  Object toJson() => value;

  bool get isInlineCompletionList =>
      value is InlineCompletionList ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('items');

  InlineCompletionList? get asInlineCompletionList {
    if (value is InlineCompletionList) {
      return value as InlineCompletionList;
    }
    if (isInlineCompletionList) {
      return InlineCompletionList.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }

  bool get isInlineCompletionItemList => value is List;

  List<InlineCompletionItem>? get asInlineCompletionItemList {
    if (value is List<InlineCompletionItem>) {
      return value as List<InlineCompletionItem>;
    }
    if (isInlineCompletionItemList) {
      return (value as List)
          .map((e) => InlineCompletionItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }
}

/// Inline union: CompletionResult.
extension type const CompletionResult._(Object value) {
  const factory CompletionResult.fromJson(Object json) = CompletionResult._;

  factory CompletionResult.completionItemList(List<CompletionItem> value) {
    return CompletionResult._(value.map((e) => e.toJson()).toList());
  }

  factory CompletionResult.completionList(CompletionList value) {
    return CompletionResult._(value.toJson());
  }

  Object toJson() => value;

  bool get isCompletionItemList => value is List;

  List<CompletionItem>? get asCompletionItemList {
    if (value is List<CompletionItem>) {
      return value as List<CompletionItem>;
    }
    if (isCompletionItemList) {
      return (value as List)
          .map((e) => CompletionItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  bool get isCompletionList =>
      value is CompletionList ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('isIncomplete') &&
          (value as Map<String, dynamic>).containsKey('items');

  CompletionList? get asCompletionList {
    if (value is CompletionList) {
      return value as CompletionList;
    }
    if (isCompletionList) {
      return CompletionList.fromJson(value as Map<String, dynamic>);
    }
    return null;
  }
}

/// Inline union: DefinitionResult.
extension type const DefinitionResult._(Object value) {
  const factory DefinitionResult.fromJson(Object json) = DefinitionResult._;

  factory DefinitionResult.definition(Definition value) {
    return DefinitionResult._(value.toJson());
  }

  const factory DefinitionResult.definitionLinkList(
    List<DefinitionLink> value,
  ) = DefinitionResult._;

  Object toJson() => value;

  bool get isDefinition =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range') ||
      value is List;

  Definition? get asDefinition {
    if (value is Definition) {
      return value as Definition;
    }
    if (isDefinition) {
      return Definition.fromJson(value);
    }
    return null;
  }

  bool get isDefinitionLinkList => value is List;

  List<DefinitionLink>? get asDefinitionLinkList {
    return isDefinitionLinkList ? value as List<DefinitionLink> : null;
  }
}

/// Inline union: DocumentSymbolResult.
extension type const DocumentSymbolResult._(Object value) {
  const factory DocumentSymbolResult.fromJson(Object json) =
      DocumentSymbolResult._;

  factory DocumentSymbolResult.symbolInformationList(
    List<SymbolInformation> value,
  ) {
    return DocumentSymbolResult._(value.map((e) => e.toJson()).toList());
  }

  factory DocumentSymbolResult.documentSymbolList(List<DocumentSymbol> value) {
    return DocumentSymbolResult._(value.map((e) => e.toJson()).toList());
  }

  Object toJson() => value;

  bool get isSymbolInformationList =>
      value is List && (value as List).isEmpty ||
      (value as List).first is SymbolInformation ||
      (value as List).first is Map<String, dynamic> &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'location',
          );

  List<SymbolInformation>? get asSymbolInformationList {
    if (value is List<SymbolInformation>) {
      return value as List<SymbolInformation>;
    }
    if (isSymbolInformationList) {
      return (value as List)
          .map((e) => SymbolInformation.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  bool get isDocumentSymbolList =>
      value is List && (value as List).isEmpty ||
      (value as List).first is DocumentSymbol ||
      (value as List).first is Map<String, dynamic> &&
          ((value as List).first as Map<String, dynamic>).containsKey('name') &&
          ((value as List).first as Map<String, dynamic>).containsKey('kind') &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'range',
          ) &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'selectionRange',
          );

  List<DocumentSymbol>? get asDocumentSymbolList {
    if (value is List<DocumentSymbol>) {
      return value as List<DocumentSymbol>;
    }
    if (isDocumentSymbolList) {
      return (value as List)
          .map((e) => DocumentSymbol.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }
}

/// Inline union: SymbolResult.
extension type const SymbolResult._(Object value) {
  const factory SymbolResult.fromJson(Object json) = SymbolResult._;

  factory SymbolResult.symbolInformationList(List<SymbolInformation> value) {
    return SymbolResult._(value.map((e) => e.toJson()).toList());
  }

  factory SymbolResult.workspaceSymbolList(List<WorkspaceSymbol> value) {
    return SymbolResult._(value.map((e) => e.toJson()).toList());
  }

  Object toJson() => value;

  bool get isSymbolInformationList =>
      value is List && (value as List).isEmpty ||
      (value as List).first is SymbolInformation ||
      (value as List).first is Map<String, dynamic> &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'location',
          );

  List<SymbolInformation>? get asSymbolInformationList {
    if (value is List<SymbolInformation>) {
      return value as List<SymbolInformation>;
    }
    if (isSymbolInformationList) {
      return (value as List)
          .map((e) => SymbolInformation.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  bool get isWorkspaceSymbolList =>
      value is List && (value as List).isEmpty ||
      (value as List).first is WorkspaceSymbol ||
      (value as List).first is Map<String, dynamic> &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'location',
          );

  List<WorkspaceSymbol>? get asWorkspaceSymbolList {
    if (value is List<WorkspaceSymbol>) {
      return value as List<WorkspaceSymbol>;
    }
    if (isWorkspaceSymbolList) {
      return (value as List)
          .map((e) => WorkspaceSymbol.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }
}
