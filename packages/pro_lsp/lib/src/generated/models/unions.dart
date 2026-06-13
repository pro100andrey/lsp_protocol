// GENERATED — do not edit.
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: deprecated_consistency
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: remove_deprecations_in_breaking_versions

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

  factory Definition.location(Location value) => Definition._(value.toJson());

  factory Definition.locationList(List<Location> value) =>
      Definition._(value.map((e) => e.toJson()).toList());

  Object toJson() => value;

  bool get isLocation =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range');

  Location? get asLocation => value is Location
      ? value as Location
      : isLocation
      ? Location.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isLocationList => value is List;

  List<Location>? get asLocationList => value is List<Location>
      ? value as List<Location>
      : isLocationList
      ? (value as List)
            .map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;
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

  factory LSPAny.nullValue() => const LSPAny._(null);

  Object? toJson() => value;

  bool get isLSPObject => value is Map<String, dynamic>;

  LSPObject? get asLSPObject => isLSPObject ? value! as LSPObject : null;

  bool get isLSPArray => value is List;

  LSPArray? get asLSPArray => isLSPArray ? value! as LSPArray : null;

  bool get isString => value is String;

  String? get asString => isString ? value! as String : null;

  bool get isInt => value is int;

  int? get asInt => isInt ? value! as int : null;

  bool get isDouble => value is double;

  double? get asDouble => isDouble ? value! as double : null;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value! as bool : null;

  bool get isNull => value == null;

  Object? get asNull => null;
}

/// The declaration of a symbol representation as one or many `locations`.
extension type const Declaration._(Object value) {
  const factory Declaration.fromJson(Object json) = Declaration._;

  factory Declaration.location(Location value) => Declaration._(value.toJson());

  factory Declaration.locationList(List<Location> value) =>
      Declaration._(value.map((e) => e.toJson()).toList());

  Object toJson() => value;

  bool get isLocation =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('range');

  Location? get asLocation => value is Location
      ? value as Location
      : isLocation
      ? Location.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isLocationList => value is List;

  List<Location>? get asLocationList => value is List<Location>
      ? value as List<Location>
      : isLocationList
      ? (value as List)
            .map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;
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

  factory InlineValue.text(InlineValueText value) =>
      InlineValue._(value.toJson());

  factory InlineValue.variableLookup(InlineValueVariableLookup value) =>
      InlineValue._(value.toJson());

  factory InlineValue.evaluatableExpression(
    InlineValueEvaluatableExpression value,
  ) => InlineValue._(value.toJson());

  Object toJson() => value;

  bool get isText =>
      value is InlineValueText ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('text');

  InlineValueText? get asText => value is InlineValueText
      ? value as InlineValueText
      : isText
      ? InlineValueText.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isVariableLookup =>
      value is InlineValueVariableLookup ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('caseSensitiveLookup');

  InlineValueVariableLookup? get asVariableLookup =>
      value is InlineValueVariableLookup
      ? value as InlineValueVariableLookup
      : isVariableLookup
      ? InlineValueVariableLookup.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isEvaluatableExpression =>
      value is InlineValueEvaluatableExpression ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('text') &&
          !(value as Map<String, dynamic>).containsKey('caseSensitiveLookup');

  InlineValueEvaluatableExpression? get asEvaluatableExpression =>
      value is InlineValueEvaluatableExpression
      ? value as InlineValueEvaluatableExpression
      : isEvaluatableExpression
      ? InlineValueEvaluatableExpression.fromJson(value as Map<String, dynamic>)
      : null;
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
  ) => DocumentDiagnosticReport._(value.toJson());

  factory DocumentDiagnosticReport.relatedUnchangedDocumentDiagnosticReport(
    RelatedUnchangedDocumentDiagnosticReport value,
  ) => DocumentDiagnosticReport._(value.toJson());

  Object toJson() => value;

  bool get isRelatedFullDocumentDiagnosticReport =>
      value is RelatedFullDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'full';

  RelatedFullDocumentDiagnosticReport?
  get asRelatedFullDocumentDiagnosticReport =>
      value is RelatedFullDocumentDiagnosticReport
      ? value as RelatedFullDocumentDiagnosticReport
      : isRelatedFullDocumentDiagnosticReport
      ? RelatedFullDocumentDiagnosticReport.fromJson(
          value as Map<String, dynamic>,
        )
      : null;

  bool get isRelatedUnchangedDocumentDiagnosticReport =>
      value is RelatedUnchangedDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'unchanged';

  RelatedUnchangedDocumentDiagnosticReport?
  get asRelatedUnchangedDocumentDiagnosticReport =>
      value is RelatedUnchangedDocumentDiagnosticReport
      ? value as RelatedUnchangedDocumentDiagnosticReport
      : isRelatedUnchangedDocumentDiagnosticReport
      ? RelatedUnchangedDocumentDiagnosticReport.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}
extension type const PrepareRenameResult._(Object value) {
  const factory PrepareRenameResult.fromJson(Object json) =
      PrepareRenameResult._;

  factory PrepareRenameResult.range(Range value) =>
      PrepareRenameResult._(value.toJson());

  factory PrepareRenameResult.rangePlaceholder({
    required Range range,
    required String placeholder,
  }) => PrepareRenameResult._({
    'range': range.toJson(),
    'placeholder': placeholder,
  });

  factory PrepareRenameResult.defaultBehavior({
    required bool defaultBehavior,
  }) => PrepareRenameResult._({'defaultBehavior': defaultBehavior});

  Object toJson() => value;

  bool get isRange =>
      value is Range ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('start');

  Range? get asRange => value is Range
      ? value as Range
      : isRange
      ? Range.fromJson(value as Map<String, dynamic>)
      : null;

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
  ) => WorkspaceDocumentDiagnosticReport._(value.toJson());

  factory WorkspaceDocumentDiagnosticReport.workspaceUnchangedDocumentDiagnosticReport(
    WorkspaceUnchangedDocumentDiagnosticReport value,
  ) => WorkspaceDocumentDiagnosticReport._(value.toJson());

  Object toJson() => value;

  bool get isWorkspaceFullDocumentDiagnosticReport =>
      value is WorkspaceFullDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'full';

  WorkspaceFullDocumentDiagnosticReport?
  get asWorkspaceFullDocumentDiagnosticReport =>
      value is WorkspaceFullDocumentDiagnosticReport
      ? value as WorkspaceFullDocumentDiagnosticReport
      : isWorkspaceFullDocumentDiagnosticReport
      ? WorkspaceFullDocumentDiagnosticReport.fromJson(
          value as Map<String, dynamic>,
        )
      : null;

  bool get isWorkspaceUnchangedDocumentDiagnosticReport =>
      value is WorkspaceUnchangedDocumentDiagnosticReport ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>)['kind'] == 'unchanged';

  WorkspaceUnchangedDocumentDiagnosticReport?
  get asWorkspaceUnchangedDocumentDiagnosticReport =>
      value is WorkspaceUnchangedDocumentDiagnosticReport
      ? value as WorkspaceUnchangedDocumentDiagnosticReport
      : isWorkspaceUnchangedDocumentDiagnosticReport
      ? WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}

/// An event describing a change to a text document. If only a text is provided
/// it is considered to be the full content of the document.
extension type const TextDocumentContentChangeEvent._(Object value) {
  const factory TextDocumentContentChangeEvent.fromJson(Object json) =
      TextDocumentContentChangeEvent._;

  factory TextDocumentContentChangeEvent.rangeRangeLengthText({
    required Range range,
    required String text,
    int? rangeLength,
  }) => TextDocumentContentChangeEvent._({
    'range': range.toJson(),
    'rangeLength': ?rangeLength,
    'text': text,
  });

  factory TextDocumentContentChangeEvent.text({required String text}) =>
      TextDocumentContentChangeEvent._({'text': text});

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
extension type const MarkedString._(
  @Deprecated('use MarkupContent instead.') Object value
) {
  @Deprecated('use MarkupContent instead.')
  const factory MarkedString.fromJson(Object json) = MarkedString._;

  @Deprecated('use MarkupContent instead.')
  const factory MarkedString.string(String value) = MarkedString._;

  @Deprecated('use MarkupContent instead.')
  factory MarkedString.languageValue({
    required String language,
    required String value,
  }) => MarkedString._({'language': language, 'value': value});

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

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

  factory DocumentFilter.textDocumentFilter(TextDocumentFilter value) =>
      DocumentFilter._(value.toJson());

  factory DocumentFilter.notebookCellTextDocumentFilter(
    NotebookCellTextDocumentFilter value,
  ) => DocumentFilter._(value.toJson());

  Object toJson() => value;

  bool get isTextDocumentFilter =>
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('language') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('scheme') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('pattern');

  TextDocumentFilter? get asTextDocumentFilter => value is TextDocumentFilter
      ? value as TextDocumentFilter
      : isTextDocumentFilter
      ? TextDocumentFilter.fromJson(value)
      : null;

  bool get isNotebookCellTextDocumentFilter =>
      value is NotebookCellTextDocumentFilter ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('notebook');

  NotebookCellTextDocumentFilter? get asNotebookCellTextDocumentFilter =>
      value is NotebookCellTextDocumentFilter
      ? value as NotebookCellTextDocumentFilter
      : isNotebookCellTextDocumentFilter
      ? NotebookCellTextDocumentFilter.fromJson(value as Map<String, dynamic>)
      : null;
}

/// The glob pattern. Either a string pattern or a relative pattern.
///
/// @since 3.17.0
extension type const GlobPattern._(Object value) {
  const factory GlobPattern.fromJson(Object json) = GlobPattern._;

  const factory GlobPattern.pattern(Pattern value) = GlobPattern._;

  factory GlobPattern.relativePattern(RelativePattern value) =>
      GlobPattern._(value.toJson());

  Object toJson() => value;

  bool get isPattern => value is String;

  Pattern? get asPattern => isPattern ? value as Pattern : null;

  bool get isRelativePattern =>
      value is RelativePattern ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('baseUri') &&
          (value as Map<String, dynamic>).containsKey('pattern');

  RelativePattern? get asRelativePattern => value is RelativePattern
      ? value as RelativePattern
      : isRelativePattern
      ? RelativePattern.fromJson(value as Map<String, dynamic>)
      : null;
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
  }) => TextDocumentFilter._({
    'language': language,
    'scheme': ?scheme,
    'pattern': ?pattern,
  });

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
  }) => NotebookDocumentFilter._({
    'notebookType': notebookType,
    'scheme': ?scheme,
    'pattern': ?pattern,
  });

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

  factory SemanticTokensRegistrationOptionsRange.empty() =>
      const SemanticTokensRegistrationOptionsRange._({});

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

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

  factory SemanticTokensRegistrationOptionsFull.delta({bool? delta}) =>
      SemanticTokensRegistrationOptionsFull._({'delta': ?delta});

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

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
  ) => WorkspaceEditDocumentChangesItem._(value.toJson());

  factory WorkspaceEditDocumentChangesItem.createFile(CreateFile value) =>
      WorkspaceEditDocumentChangesItem._(value.toJson());

  factory WorkspaceEditDocumentChangesItem.renameFile(RenameFile value) =>
      WorkspaceEditDocumentChangesItem._(value.toJson());

  factory WorkspaceEditDocumentChangesItem.deleteFile(DeleteFile value) =>
      WorkspaceEditDocumentChangesItem._(value.toJson());

  Object toJson() => value;

  bool get isTextDocumentEdit =>
      value is TextDocumentEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('textDocument') &&
          (value as Map<String, dynamic>).containsKey('edits');

  TextDocumentEdit? get asTextDocumentEdit => value is TextDocumentEdit
      ? value as TextDocumentEdit
      : isTextDocumentEdit
      ? TextDocumentEdit.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isCreateFile =>
      value is CreateFile ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('uri');

  CreateFile? get asCreateFile => value is CreateFile
      ? value as CreateFile
      : isCreateFile
      ? CreateFile.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isRenameFile =>
      value is RenameFile ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('oldUri') &&
          (value as Map<String, dynamic>).containsKey('newUri');

  RenameFile? get asRenameFile => value is RenameFile
      ? value as RenameFile
      : isRenameFile
      ? RenameFile.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isDeleteFile =>
      value is DeleteFile ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('uri');

  DeleteFile? get asDeleteFile => value is DeleteFile
      ? value as DeleteFile
      : isDeleteFile
      ? DeleteFile.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: InlayHintLabel.
extension type const InlayHintLabel._(Object value) {
  const factory InlayHintLabel.fromJson(Object json) = InlayHintLabel._;

  const factory InlayHintLabel.string(String value) = InlayHintLabel._;

  factory InlayHintLabel.partList(List<InlayHintLabelPart> value) =>
      InlayHintLabel._(value.map((e) => e.toJson()).toList());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isPartList => value is List;

  List<InlayHintLabelPart>? get asPartList => value is List<InlayHintLabelPart>
      ? value as List<InlayHintLabelPart>
      : isPartList
      ? (value as List)
            .map((e) => InlayHintLabelPart.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;
}

/// Inline union: InlayHintTooltip.
extension type const InlayHintTooltip._(Object value) {
  const factory InlayHintTooltip.fromJson(Object json) = InlayHintTooltip._;

  const factory InlayHintTooltip.string(String value) = InlayHintTooltip._;

  factory InlayHintTooltip.markupContent(MarkupContent value) =>
      InlayHintTooltip._(value.toJson());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent => value is MarkupContent
      ? value as MarkupContent
      : isMarkupContent
      ? MarkupContent.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: InlineCompletionItemInsertText.
extension type const InlineCompletionItemInsertText._(Object value) {
  const factory InlineCompletionItemInsertText.fromJson(Object json) =
      InlineCompletionItemInsertText._;

  const factory InlineCompletionItemInsertText.string(String value) =
      InlineCompletionItemInsertText._;

  factory InlineCompletionItemInsertText.stringValue(StringValue value) =>
      InlineCompletionItemInsertText._(value.toJson());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isStringValue =>
      value is StringValue ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  StringValue? get asStringValue => value is StringValue
      ? value as StringValue
      : isStringValue
      ? StringValue.fromJson(value as Map<String, dynamic>)
      : null;
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

  String? get asString => isString ? value as String : null;

  bool get isStringList => value is List;

  List<String>? get asStringList => isStringList ? value as List<String> : null;
}

/// Inline union: CompletionItemDocumentation.
extension type const CompletionItemDocumentation._(Object value) {
  const factory CompletionItemDocumentation.fromJson(Object json) =
      CompletionItemDocumentation._;

  const factory CompletionItemDocumentation.string(String value) =
      CompletionItemDocumentation._;

  factory CompletionItemDocumentation.markupContent(MarkupContent value) =>
      CompletionItemDocumentation._(value.toJson());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent => value is MarkupContent
      ? value as MarkupContent
      : isMarkupContent
      ? MarkupContent.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: CompletionItemTextEdit.
extension type const CompletionItemTextEdit._(Object value) {
  const factory CompletionItemTextEdit.fromJson(Object json) =
      CompletionItemTextEdit._;

  factory CompletionItemTextEdit.textEdit(TextEdit value) =>
      CompletionItemTextEdit._(value.toJson());

  factory CompletionItemTextEdit.insertReplaceEdit(InsertReplaceEdit value) =>
      CompletionItemTextEdit._(value.toJson());

  Object toJson() => value;

  bool get isTextEdit =>
      value is TextEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('range');

  TextEdit? get asTextEdit => value is TextEdit
      ? value as TextEdit
      : isTextEdit
      ? TextEdit.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isInsertReplaceEdit =>
      value is InsertReplaceEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('insert');

  InsertReplaceEdit? get asInsertReplaceEdit => value is InsertReplaceEdit
      ? value as InsertReplaceEdit
      : isInsertReplaceEdit
      ? InsertReplaceEdit.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: HoverContents.
extension type const HoverContents._(Object value) {
  const factory HoverContents.fromJson(Object json) = HoverContents._;

  factory HoverContents.markupContent(MarkupContent value) =>
      HoverContents._(value.toJson());

  factory HoverContents.markedString(MarkedString value) =>
      HoverContents._(value.toJson());

  factory HoverContents.markedStringList(List<MarkedString> value) =>
      HoverContents._(value.map((e) => e.toJson()).toList());

  Object toJson() => value;

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent => value is MarkupContent
      ? value as MarkupContent
      : isMarkupContent
      ? MarkupContent.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isMarkedString =>
      value is String ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('language') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkedString? get asMarkedString => value is MarkedString
      ? value as MarkedString
      : isMarkedString
      ? MarkedString.fromJson(value)
      : null;

  bool get isMarkedStringList => value is List;

  List<MarkedString>? get asMarkedStringList => value is List<MarkedString>
      ? value as List<MarkedString>
      : isMarkedStringList
      ? (value as List).map((e) => MarkedString.fromJson(e as Object)).toList()
      : null;
}

/// Inline union: WorkspaceSymbolLocation.
extension type const WorkspaceSymbolLocation._(Object value) {
  const factory WorkspaceSymbolLocation.fromJson(Object json) =
      WorkspaceSymbolLocation._;

  factory WorkspaceSymbolLocation.location(Location value) =>
      WorkspaceSymbolLocation._(value.toJson());

  factory WorkspaceSymbolLocation.uri({required String uri}) =>
      WorkspaceSymbolLocation._({'uri': uri});

  Object toJson() => value;

  bool get isLocation =>
      value is Location ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('range');

  Location? get asLocation => value is Location
      ? value as Location
      : isLocation
      ? Location.fromJson(value as Map<String, dynamic>)
      : null;

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

  factory SemanticTokensOptionsRange.empty() =>
      const SemanticTokensOptionsRange._({});

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

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

  factory SemanticTokensOptionsFull.delta({bool? delta}) =>
      SemanticTokensOptionsFull._({'delta': ?delta});

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

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

  factory TextDocumentEditEditsItem.textEdit(TextEdit value) =>
      TextDocumentEditEditsItem._(value.toJson());

  factory TextDocumentEditEditsItem.annotatedTextEdit(
    AnnotatedTextEdit value,
  ) => TextDocumentEditEditsItem._(value.toJson());

  Object toJson() => value;

  bool get isTextEdit =>
      value is TextEdit ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('annotationId');

  TextEdit? get asTextEdit => value is TextEdit
      ? value as TextEdit
      : isTextEdit
      ? TextEdit.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isAnnotatedTextEdit =>
      value is AnnotatedTextEdit ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('annotationId');

  AnnotatedTextEdit? get asAnnotatedTextEdit => value is AnnotatedTextEdit
      ? value as AnnotatedTextEdit
      : isAnnotatedTextEdit
      ? AnnotatedTextEdit.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: InlayHintLabelPartTooltip.
extension type const InlayHintLabelPartTooltip._(Object value) {
  const factory InlayHintLabelPartTooltip.fromJson(Object json) =
      InlayHintLabelPartTooltip._;

  const factory InlayHintLabelPartTooltip.string(String value) =
      InlayHintLabelPartTooltip._;

  factory InlayHintLabelPartTooltip.markupContent(MarkupContent value) =>
      InlayHintLabelPartTooltip._(value.toJson());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent => value is MarkupContent
      ? value as MarkupContent
      : isMarkupContent
      ? MarkupContent.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesTextDocumentSync.
extension type const ServerCapabilitiesTextDocumentSync._(Object value) {
  const factory ServerCapabilitiesTextDocumentSync.fromJson(Object json) =
      ServerCapabilitiesTextDocumentSync._;

  factory ServerCapabilitiesTextDocumentSync.textDocumentSyncOptions(
    TextDocumentSyncOptions value,
  ) => ServerCapabilitiesTextDocumentSync._(value.toJson());

  factory ServerCapabilitiesTextDocumentSync.textDocumentSyncKind(
    TextDocumentSyncKind value,
  ) => ServerCapabilitiesTextDocumentSync._(value.value);

  Object toJson() => value;

  bool get isTextDocumentSyncOptions =>
      value is TextDocumentSyncOptions || value is Map<String, dynamic>;

  TextDocumentSyncOptions? get asTextDocumentSyncOptions =>
      value is TextDocumentSyncOptions
      ? value as TextDocumentSyncOptions
      : isTextDocumentSyncOptions
      ? TextDocumentSyncOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isTextDocumentSyncKind =>
      value is TextDocumentSyncKind || value is int;

  TextDocumentSyncKind? get asTextDocumentSyncKind =>
      value is TextDocumentSyncKind
      ? value as TextDocumentSyncKind
      : isTextDocumentSyncKind
      ? TextDocumentSyncKind.decode(value as int)
      : null;
}

/// Inline union: ServerCapabilitiesNotebookDocumentSync.
extension type const ServerCapabilitiesNotebookDocumentSync._(Object value) {
  const factory ServerCapabilitiesNotebookDocumentSync.fromJson(Object json) =
      ServerCapabilitiesNotebookDocumentSync._;

  factory ServerCapabilitiesNotebookDocumentSync.notebookDocumentSyncOptions(
    NotebookDocumentSyncOptions value,
  ) => ServerCapabilitiesNotebookDocumentSync._(value.toJson());

  factory ServerCapabilitiesNotebookDocumentSync.notebookDocumentSyncRegistrationOptions(
    NotebookDocumentSyncRegistrationOptions value,
  ) => ServerCapabilitiesNotebookDocumentSync._(value.toJson());

  Object toJson() => value;

  bool get isNotebookDocumentSyncOptions =>
      value is NotebookDocumentSyncOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('notebookSelector');

  NotebookDocumentSyncOptions? get asNotebookDocumentSyncOptions =>
      value is NotebookDocumentSyncOptions
      ? value as NotebookDocumentSyncOptions
      : isNotebookDocumentSyncOptions
      ? NotebookDocumentSyncOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isNotebookDocumentSyncRegistrationOptions =>
      value is NotebookDocumentSyncRegistrationOptions ||
      value is Map<String, dynamic>;

  NotebookDocumentSyncRegistrationOptions?
  get asNotebookDocumentSyncRegistrationOptions =>
      value is NotebookDocumentSyncRegistrationOptions
      ? value as NotebookDocumentSyncRegistrationOptions
      : isNotebookDocumentSyncRegistrationOptions
      ? NotebookDocumentSyncRegistrationOptions.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}

/// Inline union: ServerCapabilitiesHoverProvider.
extension type const ServerCapabilitiesHoverProvider._(Object value) {
  const factory ServerCapabilitiesHoverProvider.fromJson(Object json) =
      ServerCapabilitiesHoverProvider._;

  const factory ServerCapabilitiesHoverProvider.bool(bool value) =
      ServerCapabilitiesHoverProvider._;

  factory ServerCapabilitiesHoverProvider.hoverOptions(HoverOptions value) =>
      ServerCapabilitiesHoverProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isHoverOptions =>
      value is HoverOptions || value is Map<String, dynamic>;

  HoverOptions? get asHoverOptions => value is HoverOptions
      ? value as HoverOptions
      : isHoverOptions
      ? HoverOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesDeclarationProvider.
extension type const ServerCapabilitiesDeclarationProvider._(Object value) {
  const factory ServerCapabilitiesDeclarationProvider.fromJson(Object json) =
      ServerCapabilitiesDeclarationProvider._;

  const factory ServerCapabilitiesDeclarationProvider.bool(bool value) =
      ServerCapabilitiesDeclarationProvider._;

  factory ServerCapabilitiesDeclarationProvider.declarationOptions(
    DeclarationOptions value,
  ) => ServerCapabilitiesDeclarationProvider._(value.toJson());

  factory ServerCapabilitiesDeclarationProvider.declarationRegistrationOptions(
    DeclarationRegistrationOptions value,
  ) => ServerCapabilitiesDeclarationProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isDeclarationOptions =>
      value is DeclarationOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  DeclarationOptions? get asDeclarationOptions => value is DeclarationOptions
      ? value as DeclarationOptions
      : isDeclarationOptions
      ? DeclarationOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isDeclarationRegistrationOptions =>
      value is DeclarationRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  DeclarationRegistrationOptions? get asDeclarationRegistrationOptions =>
      value is DeclarationRegistrationOptions
      ? value as DeclarationRegistrationOptions
      : isDeclarationRegistrationOptions
      ? DeclarationRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesDefinitionProvider.
extension type const ServerCapabilitiesDefinitionProvider._(Object value) {
  const factory ServerCapabilitiesDefinitionProvider.fromJson(Object json) =
      ServerCapabilitiesDefinitionProvider._;

  const factory ServerCapabilitiesDefinitionProvider.bool(bool value) =
      ServerCapabilitiesDefinitionProvider._;

  factory ServerCapabilitiesDefinitionProvider.definitionOptions(
    DefinitionOptions value,
  ) => ServerCapabilitiesDefinitionProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isDefinitionOptions =>
      value is DefinitionOptions || value is Map<String, dynamic>;

  DefinitionOptions? get asDefinitionOptions => value is DefinitionOptions
      ? value as DefinitionOptions
      : isDefinitionOptions
      ? DefinitionOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesTypeDefinitionProvider.
extension type const ServerCapabilitiesTypeDefinitionProvider._(Object value) {
  const factory ServerCapabilitiesTypeDefinitionProvider.fromJson(Object json) =
      ServerCapabilitiesTypeDefinitionProvider._;

  const factory ServerCapabilitiesTypeDefinitionProvider.bool(bool value) =
      ServerCapabilitiesTypeDefinitionProvider._;

  factory ServerCapabilitiesTypeDefinitionProvider.typeDefinitionOptions(
    TypeDefinitionOptions value,
  ) => ServerCapabilitiesTypeDefinitionProvider._(value.toJson());

  factory ServerCapabilitiesTypeDefinitionProvider.typeDefinitionRegistrationOptions(
    TypeDefinitionRegistrationOptions value,
  ) => ServerCapabilitiesTypeDefinitionProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isTypeDefinitionOptions =>
      value is TypeDefinitionOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  TypeDefinitionOptions? get asTypeDefinitionOptions =>
      value is TypeDefinitionOptions
      ? value as TypeDefinitionOptions
      : isTypeDefinitionOptions
      ? TypeDefinitionOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isTypeDefinitionRegistrationOptions =>
      value is TypeDefinitionRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  TypeDefinitionRegistrationOptions? get asTypeDefinitionRegistrationOptions =>
      value is TypeDefinitionRegistrationOptions
      ? value as TypeDefinitionRegistrationOptions
      : isTypeDefinitionRegistrationOptions
      ? TypeDefinitionRegistrationOptions.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}

/// Inline union: ServerCapabilitiesImplementationProvider.
extension type const ServerCapabilitiesImplementationProvider._(Object value) {
  const factory ServerCapabilitiesImplementationProvider.fromJson(Object json) =
      ServerCapabilitiesImplementationProvider._;

  const factory ServerCapabilitiesImplementationProvider.bool(bool value) =
      ServerCapabilitiesImplementationProvider._;

  factory ServerCapabilitiesImplementationProvider.implementationOptions(
    ImplementationOptions value,
  ) => ServerCapabilitiesImplementationProvider._(value.toJson());

  factory ServerCapabilitiesImplementationProvider.implementationRegistrationOptions(
    ImplementationRegistrationOptions value,
  ) => ServerCapabilitiesImplementationProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isImplementationOptions =>
      value is ImplementationOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  ImplementationOptions? get asImplementationOptions =>
      value is ImplementationOptions
      ? value as ImplementationOptions
      : isImplementationOptions
      ? ImplementationOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isImplementationRegistrationOptions =>
      value is ImplementationRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  ImplementationRegistrationOptions? get asImplementationRegistrationOptions =>
      value is ImplementationRegistrationOptions
      ? value as ImplementationRegistrationOptions
      : isImplementationRegistrationOptions
      ? ImplementationRegistrationOptions.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}

/// Inline union: ServerCapabilitiesReferencesProvider.
extension type const ServerCapabilitiesReferencesProvider._(Object value) {
  const factory ServerCapabilitiesReferencesProvider.fromJson(Object json) =
      ServerCapabilitiesReferencesProvider._;

  const factory ServerCapabilitiesReferencesProvider.bool(bool value) =
      ServerCapabilitiesReferencesProvider._;

  factory ServerCapabilitiesReferencesProvider.referenceOptions(
    ReferenceOptions value,
  ) => ServerCapabilitiesReferencesProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isReferenceOptions =>
      value is ReferenceOptions || value is Map<String, dynamic>;

  ReferenceOptions? get asReferenceOptions => value is ReferenceOptions
      ? value as ReferenceOptions
      : isReferenceOptions
      ? ReferenceOptions.fromJson(value as Map<String, dynamic>)
      : null;
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
  ) => ServerCapabilitiesDocumentHighlightProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isDocumentHighlightOptions =>
      value is DocumentHighlightOptions || value is Map<String, dynamic>;

  DocumentHighlightOptions? get asDocumentHighlightOptions =>
      value is DocumentHighlightOptions
      ? value as DocumentHighlightOptions
      : isDocumentHighlightOptions
      ? DocumentHighlightOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesDocumentSymbolProvider.
extension type const ServerCapabilitiesDocumentSymbolProvider._(Object value) {
  const factory ServerCapabilitiesDocumentSymbolProvider.fromJson(Object json) =
      ServerCapabilitiesDocumentSymbolProvider._;

  const factory ServerCapabilitiesDocumentSymbolProvider.bool(bool value) =
      ServerCapabilitiesDocumentSymbolProvider._;

  factory ServerCapabilitiesDocumentSymbolProvider.documentSymbolOptions(
    DocumentSymbolOptions value,
  ) => ServerCapabilitiesDocumentSymbolProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isDocumentSymbolOptions =>
      value is DocumentSymbolOptions || value is Map<String, dynamic>;

  DocumentSymbolOptions? get asDocumentSymbolOptions =>
      value is DocumentSymbolOptions
      ? value as DocumentSymbolOptions
      : isDocumentSymbolOptions
      ? DocumentSymbolOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesCodeActionProvider.
extension type const ServerCapabilitiesCodeActionProvider._(Object value) {
  const factory ServerCapabilitiesCodeActionProvider.fromJson(Object json) =
      ServerCapabilitiesCodeActionProvider._;

  const factory ServerCapabilitiesCodeActionProvider.bool(bool value) =
      ServerCapabilitiesCodeActionProvider._;

  factory ServerCapabilitiesCodeActionProvider.codeActionOptions(
    CodeActionOptions value,
  ) => ServerCapabilitiesCodeActionProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isCodeActionOptions =>
      value is CodeActionOptions || value is Map<String, dynamic>;

  CodeActionOptions? get asCodeActionOptions => value is CodeActionOptions
      ? value as CodeActionOptions
      : isCodeActionOptions
      ? CodeActionOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesColorProvider.
extension type const ServerCapabilitiesColorProvider._(Object value) {
  const factory ServerCapabilitiesColorProvider.fromJson(Object json) =
      ServerCapabilitiesColorProvider._;

  const factory ServerCapabilitiesColorProvider.bool(bool value) =
      ServerCapabilitiesColorProvider._;

  factory ServerCapabilitiesColorProvider.documentColorOptions(
    DocumentColorOptions value,
  ) => ServerCapabilitiesColorProvider._(value.toJson());

  factory ServerCapabilitiesColorProvider.documentColorRegistrationOptions(
    DocumentColorRegistrationOptions value,
  ) => ServerCapabilitiesColorProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isDocumentColorOptions =>
      value is DocumentColorOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  DocumentColorOptions? get asDocumentColorOptions =>
      value is DocumentColorOptions
      ? value as DocumentColorOptions
      : isDocumentColorOptions
      ? DocumentColorOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isDocumentColorRegistrationOptions =>
      value is DocumentColorRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  DocumentColorRegistrationOptions? get asDocumentColorRegistrationOptions =>
      value is DocumentColorRegistrationOptions
      ? value as DocumentColorRegistrationOptions
      : isDocumentColorRegistrationOptions
      ? DocumentColorRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
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
  ) => ServerCapabilitiesWorkspaceSymbolProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isWorkspaceSymbolOptions =>
      value is WorkspaceSymbolOptions || value is Map<String, dynamic>;

  WorkspaceSymbolOptions? get asWorkspaceSymbolOptions =>
      value is WorkspaceSymbolOptions
      ? value as WorkspaceSymbolOptions
      : isWorkspaceSymbolOptions
      ? WorkspaceSymbolOptions.fromJson(value as Map<String, dynamic>)
      : null;
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
  ) => ServerCapabilitiesDocumentFormattingProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isDocumentFormattingOptions =>
      value is DocumentFormattingOptions || value is Map<String, dynamic>;

  DocumentFormattingOptions? get asDocumentFormattingOptions =>
      value is DocumentFormattingOptions
      ? value as DocumentFormattingOptions
      : isDocumentFormattingOptions
      ? DocumentFormattingOptions.fromJson(value as Map<String, dynamic>)
      : null;
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
  ) => ServerCapabilitiesDocumentRangeFormattingProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isDocumentRangeFormattingOptions =>
      value is DocumentRangeFormattingOptions || value is Map<String, dynamic>;

  DocumentRangeFormattingOptions? get asDocumentRangeFormattingOptions =>
      value is DocumentRangeFormattingOptions
      ? value as DocumentRangeFormattingOptions
      : isDocumentRangeFormattingOptions
      ? DocumentRangeFormattingOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesRenameProvider.
extension type const ServerCapabilitiesRenameProvider._(Object value) {
  const factory ServerCapabilitiesRenameProvider.fromJson(Object json) =
      ServerCapabilitiesRenameProvider._;

  const factory ServerCapabilitiesRenameProvider.bool(bool value) =
      ServerCapabilitiesRenameProvider._;

  factory ServerCapabilitiesRenameProvider.renameOptions(RenameOptions value) =>
      ServerCapabilitiesRenameProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isRenameOptions =>
      value is RenameOptions || value is Map<String, dynamic>;

  RenameOptions? get asRenameOptions => value is RenameOptions
      ? value as RenameOptions
      : isRenameOptions
      ? RenameOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesFoldingRangeProvider.
extension type const ServerCapabilitiesFoldingRangeProvider._(Object value) {
  const factory ServerCapabilitiesFoldingRangeProvider.fromJson(Object json) =
      ServerCapabilitiesFoldingRangeProvider._;

  const factory ServerCapabilitiesFoldingRangeProvider.bool(bool value) =
      ServerCapabilitiesFoldingRangeProvider._;

  factory ServerCapabilitiesFoldingRangeProvider.foldingRangeOptions(
    FoldingRangeOptions value,
  ) => ServerCapabilitiesFoldingRangeProvider._(value.toJson());

  factory ServerCapabilitiesFoldingRangeProvider.foldingRangeRegistrationOptions(
    FoldingRangeRegistrationOptions value,
  ) => ServerCapabilitiesFoldingRangeProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isFoldingRangeOptions =>
      value is FoldingRangeOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  FoldingRangeOptions? get asFoldingRangeOptions => value is FoldingRangeOptions
      ? value as FoldingRangeOptions
      : isFoldingRangeOptions
      ? FoldingRangeOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isFoldingRangeRegistrationOptions =>
      value is FoldingRangeRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  FoldingRangeRegistrationOptions? get asFoldingRangeRegistrationOptions =>
      value is FoldingRangeRegistrationOptions
      ? value as FoldingRangeRegistrationOptions
      : isFoldingRangeRegistrationOptions
      ? FoldingRangeRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesSelectionRangeProvider.
extension type const ServerCapabilitiesSelectionRangeProvider._(Object value) {
  const factory ServerCapabilitiesSelectionRangeProvider.fromJson(Object json) =
      ServerCapabilitiesSelectionRangeProvider._;

  const factory ServerCapabilitiesSelectionRangeProvider.bool(bool value) =
      ServerCapabilitiesSelectionRangeProvider._;

  factory ServerCapabilitiesSelectionRangeProvider.selectionRangeOptions(
    SelectionRangeOptions value,
  ) => ServerCapabilitiesSelectionRangeProvider._(value.toJson());

  factory ServerCapabilitiesSelectionRangeProvider.selectionRangeRegistrationOptions(
    SelectionRangeRegistrationOptions value,
  ) => ServerCapabilitiesSelectionRangeProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isSelectionRangeOptions =>
      value is SelectionRangeOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  SelectionRangeOptions? get asSelectionRangeOptions =>
      value is SelectionRangeOptions
      ? value as SelectionRangeOptions
      : isSelectionRangeOptions
      ? SelectionRangeOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isSelectionRangeRegistrationOptions =>
      value is SelectionRangeRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  SelectionRangeRegistrationOptions? get asSelectionRangeRegistrationOptions =>
      value is SelectionRangeRegistrationOptions
      ? value as SelectionRangeRegistrationOptions
      : isSelectionRangeRegistrationOptions
      ? SelectionRangeRegistrationOptions.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}

/// Inline union: ServerCapabilitiesCallHierarchyProvider.
extension type const ServerCapabilitiesCallHierarchyProvider._(Object value) {
  const factory ServerCapabilitiesCallHierarchyProvider.fromJson(Object json) =
      ServerCapabilitiesCallHierarchyProvider._;

  const factory ServerCapabilitiesCallHierarchyProvider.bool(bool value) =
      ServerCapabilitiesCallHierarchyProvider._;

  factory ServerCapabilitiesCallHierarchyProvider.callHierarchyOptions(
    CallHierarchyOptions value,
  ) => ServerCapabilitiesCallHierarchyProvider._(value.toJson());

  factory ServerCapabilitiesCallHierarchyProvider.callHierarchyRegistrationOptions(
    CallHierarchyRegistrationOptions value,
  ) => ServerCapabilitiesCallHierarchyProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isCallHierarchyOptions =>
      value is CallHierarchyOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  CallHierarchyOptions? get asCallHierarchyOptions =>
      value is CallHierarchyOptions
      ? value as CallHierarchyOptions
      : isCallHierarchyOptions
      ? CallHierarchyOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isCallHierarchyRegistrationOptions =>
      value is CallHierarchyRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  CallHierarchyRegistrationOptions? get asCallHierarchyRegistrationOptions =>
      value is CallHierarchyRegistrationOptions
      ? value as CallHierarchyRegistrationOptions
      : isCallHierarchyRegistrationOptions
      ? CallHierarchyRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
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
  ) => ServerCapabilitiesLinkedEditingRangeProvider._(value.toJson());

  factory ServerCapabilitiesLinkedEditingRangeProvider.linkedEditingRangeRegistrationOptions(
    LinkedEditingRangeRegistrationOptions value,
  ) => ServerCapabilitiesLinkedEditingRangeProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isLinkedEditingRangeOptions =>
      value is LinkedEditingRangeOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  LinkedEditingRangeOptions? get asLinkedEditingRangeOptions =>
      value is LinkedEditingRangeOptions
      ? value as LinkedEditingRangeOptions
      : isLinkedEditingRangeOptions
      ? LinkedEditingRangeOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isLinkedEditingRangeRegistrationOptions =>
      value is LinkedEditingRangeRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  LinkedEditingRangeRegistrationOptions?
  get asLinkedEditingRangeRegistrationOptions =>
      value is LinkedEditingRangeRegistrationOptions
      ? value as LinkedEditingRangeRegistrationOptions
      : isLinkedEditingRangeRegistrationOptions
      ? LinkedEditingRangeRegistrationOptions.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}

/// Inline union: ServerCapabilitiesSemanticTokensProvider.
extension type const ServerCapabilitiesSemanticTokensProvider._(Object value) {
  const factory ServerCapabilitiesSemanticTokensProvider.fromJson(Object json) =
      ServerCapabilitiesSemanticTokensProvider._;

  factory ServerCapabilitiesSemanticTokensProvider.semanticTokensOptions(
    SemanticTokensOptions value,
  ) => ServerCapabilitiesSemanticTokensProvider._(value.toJson());

  factory ServerCapabilitiesSemanticTokensProvider.semanticTokensRegistrationOptions(
    SemanticTokensRegistrationOptions value,
  ) => ServerCapabilitiesSemanticTokensProvider._(value.toJson());

  Object toJson() => value;

  bool get isSemanticTokensOptions =>
      value is SemanticTokensOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  SemanticTokensOptions? get asSemanticTokensOptions =>
      value is SemanticTokensOptions
      ? value as SemanticTokensOptions
      : isSemanticTokensOptions
      ? SemanticTokensOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isSemanticTokensRegistrationOptions =>
      value is SemanticTokensRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  SemanticTokensRegistrationOptions? get asSemanticTokensRegistrationOptions =>
      value is SemanticTokensRegistrationOptions
      ? value as SemanticTokensRegistrationOptions
      : isSemanticTokensRegistrationOptions
      ? SemanticTokensRegistrationOptions.fromJson(
          value as Map<String, dynamic>,
        )
      : null;
}

/// Inline union: ServerCapabilitiesMonikerProvider.
extension type const ServerCapabilitiesMonikerProvider._(Object value) {
  const factory ServerCapabilitiesMonikerProvider.fromJson(Object json) =
      ServerCapabilitiesMonikerProvider._;

  const factory ServerCapabilitiesMonikerProvider.bool(bool value) =
      ServerCapabilitiesMonikerProvider._;

  factory ServerCapabilitiesMonikerProvider.monikerOptions(
    MonikerOptions value,
  ) => ServerCapabilitiesMonikerProvider._(value.toJson());

  factory ServerCapabilitiesMonikerProvider.monikerRegistrationOptions(
    MonikerRegistrationOptions value,
  ) => ServerCapabilitiesMonikerProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isMonikerOptions =>
      value is MonikerOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  MonikerOptions? get asMonikerOptions => value is MonikerOptions
      ? value as MonikerOptions
      : isMonikerOptions
      ? MonikerOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isMonikerRegistrationOptions =>
      value is MonikerRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  MonikerRegistrationOptions? get asMonikerRegistrationOptions =>
      value is MonikerRegistrationOptions
      ? value as MonikerRegistrationOptions
      : isMonikerRegistrationOptions
      ? MonikerRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesTypeHierarchyProvider.
extension type const ServerCapabilitiesTypeHierarchyProvider._(Object value) {
  const factory ServerCapabilitiesTypeHierarchyProvider.fromJson(Object json) =
      ServerCapabilitiesTypeHierarchyProvider._;

  const factory ServerCapabilitiesTypeHierarchyProvider.bool(bool value) =
      ServerCapabilitiesTypeHierarchyProvider._;

  factory ServerCapabilitiesTypeHierarchyProvider.typeHierarchyOptions(
    TypeHierarchyOptions value,
  ) => ServerCapabilitiesTypeHierarchyProvider._(value.toJson());

  factory ServerCapabilitiesTypeHierarchyProvider.typeHierarchyRegistrationOptions(
    TypeHierarchyRegistrationOptions value,
  ) => ServerCapabilitiesTypeHierarchyProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isTypeHierarchyOptions =>
      value is TypeHierarchyOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  TypeHierarchyOptions? get asTypeHierarchyOptions =>
      value is TypeHierarchyOptions
      ? value as TypeHierarchyOptions
      : isTypeHierarchyOptions
      ? TypeHierarchyOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isTypeHierarchyRegistrationOptions =>
      value is TypeHierarchyRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  TypeHierarchyRegistrationOptions? get asTypeHierarchyRegistrationOptions =>
      value is TypeHierarchyRegistrationOptions
      ? value as TypeHierarchyRegistrationOptions
      : isTypeHierarchyRegistrationOptions
      ? TypeHierarchyRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesInlineValueProvider.
extension type const ServerCapabilitiesInlineValueProvider._(Object value) {
  const factory ServerCapabilitiesInlineValueProvider.fromJson(Object json) =
      ServerCapabilitiesInlineValueProvider._;

  const factory ServerCapabilitiesInlineValueProvider.bool(bool value) =
      ServerCapabilitiesInlineValueProvider._;

  factory ServerCapabilitiesInlineValueProvider.inlineValueOptions(
    InlineValueOptions value,
  ) => ServerCapabilitiesInlineValueProvider._(value.toJson());

  factory ServerCapabilitiesInlineValueProvider.inlineValueRegistrationOptions(
    InlineValueRegistrationOptions value,
  ) => ServerCapabilitiesInlineValueProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isInlineValueOptions =>
      value is InlineValueOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  InlineValueOptions? get asInlineValueOptions => value is InlineValueOptions
      ? value as InlineValueOptions
      : isInlineValueOptions
      ? InlineValueOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isInlineValueRegistrationOptions =>
      value is InlineValueRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  InlineValueRegistrationOptions? get asInlineValueRegistrationOptions =>
      value is InlineValueRegistrationOptions
      ? value as InlineValueRegistrationOptions
      : isInlineValueRegistrationOptions
      ? InlineValueRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesInlayHintProvider.
extension type const ServerCapabilitiesInlayHintProvider._(Object value) {
  const factory ServerCapabilitiesInlayHintProvider.fromJson(Object json) =
      ServerCapabilitiesInlayHintProvider._;

  const factory ServerCapabilitiesInlayHintProvider.bool(bool value) =
      ServerCapabilitiesInlayHintProvider._;

  factory ServerCapabilitiesInlayHintProvider.inlayHintOptions(
    InlayHintOptions value,
  ) => ServerCapabilitiesInlayHintProvider._(value.toJson());

  factory ServerCapabilitiesInlayHintProvider.inlayHintRegistrationOptions(
    InlayHintRegistrationOptions value,
  ) => ServerCapabilitiesInlayHintProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isInlayHintOptions =>
      value is InlayHintOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  InlayHintOptions? get asInlayHintOptions => value is InlayHintOptions
      ? value as InlayHintOptions
      : isInlayHintOptions
      ? InlayHintOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isInlayHintRegistrationOptions =>
      value is InlayHintRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  InlayHintRegistrationOptions? get asInlayHintRegistrationOptions =>
      value is InlayHintRegistrationOptions
      ? value as InlayHintRegistrationOptions
      : isInlayHintRegistrationOptions
      ? InlayHintRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: ServerCapabilitiesDiagnosticProvider.
extension type const ServerCapabilitiesDiagnosticProvider._(Object value) {
  const factory ServerCapabilitiesDiagnosticProvider.fromJson(Object json) =
      ServerCapabilitiesDiagnosticProvider._;

  factory ServerCapabilitiesDiagnosticProvider.diagnosticOptions(
    DiagnosticOptions value,
  ) => ServerCapabilitiesDiagnosticProvider._(value.toJson());

  factory ServerCapabilitiesDiagnosticProvider.diagnosticRegistrationOptions(
    DiagnosticRegistrationOptions value,
  ) => ServerCapabilitiesDiagnosticProvider._(value.toJson());

  Object toJson() => value;

  bool get isDiagnosticOptions =>
      value is DiagnosticOptions ||
      value is Map<String, dynamic> &&
          !(value as Map<String, dynamic>).containsKey('documentSelector');

  DiagnosticOptions? get asDiagnosticOptions => value is DiagnosticOptions
      ? value as DiagnosticOptions
      : isDiagnosticOptions
      ? DiagnosticOptions.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isDiagnosticRegistrationOptions =>
      value is DiagnosticRegistrationOptions ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('documentSelector');

  DiagnosticRegistrationOptions? get asDiagnosticRegistrationOptions =>
      value is DiagnosticRegistrationOptions
      ? value as DiagnosticRegistrationOptions
      : isDiagnosticRegistrationOptions
      ? DiagnosticRegistrationOptions.fromJson(value as Map<String, dynamic>)
      : null;
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
  ) => ServerCapabilitiesInlineCompletionProvider._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isInlineCompletionOptions =>
      value is InlineCompletionOptions || value is Map<String, dynamic>;

  InlineCompletionOptions? get asInlineCompletionOptions =>
      value is InlineCompletionOptions
      ? value as InlineCompletionOptions
      : isInlineCompletionOptions
      ? InlineCompletionOptions.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: SignatureInformationDocumentation.
extension type const SignatureInformationDocumentation._(Object value) {
  const factory SignatureInformationDocumentation.fromJson(Object json) =
      SignatureInformationDocumentation._;

  const factory SignatureInformationDocumentation.string(String value) =
      SignatureInformationDocumentation._;

  factory SignatureInformationDocumentation.markupContent(
    MarkupContent value,
  ) => SignatureInformationDocumentation._(value.toJson());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent => value is MarkupContent
      ? value as MarkupContent
      : isMarkupContent
      ? MarkupContent.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: TextDocumentSyncOptionsSave.
extension type const TextDocumentSyncOptionsSave._(Object value) {
  const factory TextDocumentSyncOptionsSave.fromJson(Object json) =
      TextDocumentSyncOptionsSave._;

  const factory TextDocumentSyncOptionsSave.bool(bool value) =
      TextDocumentSyncOptionsSave._;

  factory TextDocumentSyncOptionsSave.saveOptions(SaveOptions value) =>
      TextDocumentSyncOptionsSave._(value.toJson());

  Object toJson() => value;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;

  bool get isSaveOptions =>
      value is SaveOptions || value is Map<String, dynamic>;

  SaveOptions? get asSaveOptions => value is SaveOptions
      ? value as SaveOptions
      : isSaveOptions
      ? SaveOptions.fromJson(value as Map<String, dynamic>)
      : null;
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
  }) => NotebookDocumentSyncOptionsNotebookSelectorItem._({
    'notebook': notebook,
    'cells': ?cells,
  });

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
  }) => NotebookDocumentSyncRegistrationOptionsNotebookSelectorItem._({
    'notebook': notebook,
    'cells': ?cells,
  });

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

  factory ParameterInformationDocumentation.markupContent(
    MarkupContent value,
  ) => ParameterInformationDocumentation._(value.toJson());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isMarkupContent =>
      value is MarkupContent ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('kind') &&
          (value as Map<String, dynamic>).containsKey('value');

  MarkupContent? get asMarkupContent => value is MarkupContent
      ? value as MarkupContent
      : isMarkupContent
      ? MarkupContent.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: NotebookCellTextDocumentFilterNotebook.
extension type const NotebookCellTextDocumentFilterNotebook._(Object value) {
  const factory NotebookCellTextDocumentFilterNotebook.fromJson(Object json) =
      NotebookCellTextDocumentFilterNotebook._;

  const factory NotebookCellTextDocumentFilterNotebook.string(String value) =
      NotebookCellTextDocumentFilterNotebook._;

  factory NotebookCellTextDocumentFilterNotebook.notebookDocumentFilter(
    NotebookDocumentFilter value,
  ) => NotebookCellTextDocumentFilterNotebook._(value.toJson());

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isNotebookDocumentFilter =>
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('notebookType') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('scheme') ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('pattern');

  NotebookDocumentFilter? get asNotebookDocumentFilter =>
      value is NotebookDocumentFilter
      ? value as NotebookDocumentFilter
      : isNotebookDocumentFilter
      ? NotebookDocumentFilter.fromJson(value)
      : null;
}

/// Inline union: RelativePatternBaseUri.
extension type const RelativePatternBaseUri._(Object value) {
  const factory RelativePatternBaseUri.fromJson(Object json) =
      RelativePatternBaseUri._;

  factory RelativePatternBaseUri.workspaceFolder(WorkspaceFolder value) =>
      RelativePatternBaseUri._(value.toJson());

  const factory RelativePatternBaseUri.string(String value) =
      RelativePatternBaseUri._;

  Object toJson() => value;

  bool get isWorkspaceFolder =>
      value is WorkspaceFolder ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('uri') &&
          (value as Map<String, dynamic>).containsKey('name');

  WorkspaceFolder? get asWorkspaceFolder => value is WorkspaceFolder
      ? value as WorkspaceFolder
      : isWorkspaceFolder
      ? WorkspaceFolder.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;
}

/// Inline union: ImplementationResult.
extension type const ImplementationResult._(Object value) {
  const factory ImplementationResult.fromJson(Object json) =
      ImplementationResult._;

  factory ImplementationResult.definition(Definition value) =>
      ImplementationResult._(value.toJson());

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

  Definition? get asDefinition => value is Definition
      ? value as Definition
      : isDefinition
      ? Definition.fromJson(value)
      : null;

  bool get isDefinitionLinkList => value is List;

  List<DefinitionLink>? get asDefinitionLinkList =>
      isDefinitionLinkList ? value as List<DefinitionLink> : null;
}

/// Inline union: TypeDefinitionResult.
extension type const TypeDefinitionResult._(Object value) {
  const factory TypeDefinitionResult.fromJson(Object json) =
      TypeDefinitionResult._;

  factory TypeDefinitionResult.definition(Definition value) =>
      TypeDefinitionResult._(value.toJson());

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

  Definition? get asDefinition => value is Definition
      ? value as Definition
      : isDefinition
      ? Definition.fromJson(value)
      : null;

  bool get isDefinitionLinkList => value is List;

  List<DefinitionLink>? get asDefinitionLinkList =>
      isDefinitionLinkList ? value as List<DefinitionLink> : null;
}

/// Inline union: DeclarationResult.
extension type const DeclarationResult._(Object value) {
  const factory DeclarationResult.fromJson(Object json) = DeclarationResult._;

  factory DeclarationResult.declaration(Declaration value) =>
      DeclarationResult._(value.toJson());

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

  Declaration? get asDeclaration => value is Declaration
      ? value as Declaration
      : isDeclaration
      ? Declaration.fromJson(value)
      : null;

  bool get isDeclarationLinkList => value is List;

  List<DeclarationLink>? get asDeclarationLinkList =>
      isDeclarationLinkList ? value as List<DeclarationLink> : null;
}

/// Inline union: SemanticTokensFullDeltaResult.
extension type const SemanticTokensFullDeltaResult._(Object value) {
  const factory SemanticTokensFullDeltaResult.fromJson(Object json) =
      SemanticTokensFullDeltaResult._;

  factory SemanticTokensFullDeltaResult.semanticTokens(SemanticTokens value) =>
      SemanticTokensFullDeltaResult._(value.toJson());

  factory SemanticTokensFullDeltaResult.semanticTokensDelta(
    SemanticTokensDelta value,
  ) => SemanticTokensFullDeltaResult._(value.toJson());

  Object toJson() => value;

  bool get isSemanticTokens =>
      value is SemanticTokens ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('data');

  SemanticTokens? get asSemanticTokens => value is SemanticTokens
      ? value as SemanticTokens
      : isSemanticTokens
      ? SemanticTokens.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isSemanticTokensDelta =>
      value is SemanticTokensDelta ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('edits');

  SemanticTokensDelta? get asSemanticTokensDelta => value is SemanticTokensDelta
      ? value as SemanticTokensDelta
      : isSemanticTokensDelta
      ? SemanticTokensDelta.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: InlineCompletionResult.
extension type const InlineCompletionResult._(Object value) {
  const factory InlineCompletionResult.fromJson(Object json) =
      InlineCompletionResult._;

  factory InlineCompletionResult.inlineCompletionList(
    InlineCompletionList value,
  ) => InlineCompletionResult._(value.toJson());

  factory InlineCompletionResult.inlineCompletionItemList(
    List<InlineCompletionItem> value,
  ) => InlineCompletionResult._(value.map((e) => e.toJson()).toList());

  Object toJson() => value;

  bool get isInlineCompletionList =>
      value is InlineCompletionList ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('items');

  InlineCompletionList? get asInlineCompletionList =>
      value is InlineCompletionList
      ? value as InlineCompletionList
      : isInlineCompletionList
      ? InlineCompletionList.fromJson(value as Map<String, dynamic>)
      : null;

  bool get isInlineCompletionItemList => value is List;

  List<InlineCompletionItem>? get asInlineCompletionItemList =>
      value is List<InlineCompletionItem>
      ? value as List<InlineCompletionItem>
      : isInlineCompletionItemList
      ? (value as List)
            .map(
              (e) => InlineCompletionItem.fromJson(e as Map<String, dynamic>),
            )
            .toList()
      : null;
}

/// Inline union: CompletionResult.
extension type const CompletionResult._(Object value) {
  const factory CompletionResult.fromJson(Object json) = CompletionResult._;

  factory CompletionResult.completionItemList(List<CompletionItem> value) =>
      CompletionResult._(value.map((e) => e.toJson()).toList());

  factory CompletionResult.completionList(CompletionList value) =>
      CompletionResult._(value.toJson());

  Object toJson() => value;

  bool get isCompletionItemList => value is List;

  List<CompletionItem>? get asCompletionItemList =>
      value is List<CompletionItem>
      ? value as List<CompletionItem>
      : isCompletionItemList
      ? (value as List)
            .map((e) => CompletionItem.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;

  bool get isCompletionList =>
      value is CompletionList ||
      value is Map<String, dynamic> &&
          (value as Map<String, dynamic>).containsKey('isIncomplete') &&
          (value as Map<String, dynamic>).containsKey('items');

  CompletionList? get asCompletionList => value is CompletionList
      ? value as CompletionList
      : isCompletionList
      ? CompletionList.fromJson(value as Map<String, dynamic>)
      : null;
}

/// Inline union: DefinitionResult.
extension type const DefinitionResult._(Object value) {
  const factory DefinitionResult.fromJson(Object json) = DefinitionResult._;

  factory DefinitionResult.definition(Definition value) =>
      DefinitionResult._(value.toJson());

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

  Definition? get asDefinition => value is Definition
      ? value as Definition
      : isDefinition
      ? Definition.fromJson(value)
      : null;

  bool get isDefinitionLinkList => value is List;

  List<DefinitionLink>? get asDefinitionLinkList =>
      isDefinitionLinkList ? value as List<DefinitionLink> : null;
}

/// Inline union: DocumentSymbolResult.
extension type const DocumentSymbolResult._(Object value) {
  const factory DocumentSymbolResult.fromJson(Object json) =
      DocumentSymbolResult._;

  factory DocumentSymbolResult.symbolInformationList(
    List<SymbolInformation> value,
  ) => DocumentSymbolResult._(value.map((e) => e.toJson()).toList());

  factory DocumentSymbolResult.documentSymbolList(List<DocumentSymbol> value) =>
      DocumentSymbolResult._(value.map((e) => e.toJson()).toList());

  Object toJson() => value;

  bool get isSymbolInformationList =>
      value is List && (value as List).isEmpty ||
      (value as List).first is SymbolInformation ||
      (value as List).first is Map<String, dynamic> &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'location',
          );

  List<SymbolInformation>? get asSymbolInformationList =>
      value is List<SymbolInformation>
      ? value as List<SymbolInformation>
      : isSymbolInformationList
      ? (value as List)
            .map((e) => SymbolInformation.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;

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

  List<DocumentSymbol>? get asDocumentSymbolList =>
      value is List<DocumentSymbol>
      ? value as List<DocumentSymbol>
      : isDocumentSymbolList
      ? (value as List)
            .map((e) => DocumentSymbol.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;
}

/// Inline union: SymbolResult.
extension type const SymbolResult._(Object value) {
  const factory SymbolResult.fromJson(Object json) = SymbolResult._;

  factory SymbolResult.symbolInformationList(List<SymbolInformation> value) =>
      SymbolResult._(value.map((e) => e.toJson()).toList());

  factory SymbolResult.workspaceSymbolList(List<WorkspaceSymbol> value) =>
      SymbolResult._(value.map((e) => e.toJson()).toList());

  Object toJson() => value;

  bool get isSymbolInformationList =>
      value is List && (value as List).isEmpty ||
      (value as List).first is SymbolInformation ||
      (value as List).first is Map<String, dynamic> &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'location',
          );

  List<SymbolInformation>? get asSymbolInformationList =>
      value is List<SymbolInformation>
      ? value as List<SymbolInformation>
      : isSymbolInformationList
      ? (value as List)
            .map((e) => SymbolInformation.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;

  bool get isWorkspaceSymbolList =>
      value is List && (value as List).isEmpty ||
      (value as List).first is WorkspaceSymbol ||
      (value as List).first is Map<String, dynamic> &&
          ((value as List).first as Map<String, dynamic>).containsKey(
            'location',
          );

  List<WorkspaceSymbol>? get asWorkspaceSymbolList =>
      value is List<WorkspaceSymbol>
      ? value as List<WorkspaceSymbol>
      : isWorkspaceSymbolList
      ? (value as List)
            .map((e) => WorkspaceSymbol.fromJson(e as Map<String, dynamic>))
            .toList()
      : null;
}
