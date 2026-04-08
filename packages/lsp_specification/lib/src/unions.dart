// GENERATED — do not edit.

import 'package:freezed_annotation/freezed_annotation.dart';

import 'structures.dart';

part 'unions.freezed.dart';

@freezed
sealed class Definition with _$Definition {
  const Definition._();

  const factory Definition.location({required Location value}) =
      Definition$Location;

  const factory Definition.list({required List<Location> value}) =
      Definition$List;

  static Definition fromJson(Object? json) {
    if (json is List) {
      return Definition.list(
        value: (json as List<Object>)
            .map((e) => Location.fromJson(e as Map<String, Object?>))
            .toList(),
      );
    }
    return Definition.location(
      value: Location.fromJson((json as Map<String, Object?>)),
    );
  }

  Object toJson() => switch (this) {
    Definition$Location(:final value) => value.toJson(),
    Definition$List(:final value) => value.map((e) => e.toJson()).toList(),
  };
}

@freezed
sealed class Declaration with _$Declaration {
  const Declaration._();

  const factory Declaration.location({required Location value}) =
      Declaration$Location;

  const factory Declaration.list({required List<Location> value}) =
      Declaration$List;

  static Declaration fromJson(Object? json) {
    if (json is List) {
      return Declaration.list(
        value: (json as List<Object>)
            .map((e) => Location.fromJson(e as Map<String, Object?>))
            .toList(),
      );
    }
    return Declaration.location(
      value: Location.fromJson((json as Map<String, Object?>)),
    );
  }

  Object toJson() => switch (this) {
    Declaration$Location(:final value) => value.toJson(),
    Declaration$List(:final value) => value.map((e) => e.toJson()).toList(),
  };
}

@freezed
sealed class InlineValue with _$InlineValue {
  const InlineValue._();

  const factory InlineValue.text({required InlineValueText value}) =
      InlineValue$Text;

  const factory InlineValue.variableLookup({
    required InlineValueVariableLookup value,
  }) = InlineValue$VariableLookup;

  const factory InlineValue.evaluatableExpression({
    required InlineValueEvaluatableExpression value,
  }) = InlineValue$EvaluatableExpression;

  static InlineValue fromJson(Map<String, Object?> json) {
    if (json.containsKey('text')) {
      return InlineValue.text(value: InlineValueText.fromJson(json));
    }
    if (json.containsKey('caseSensitiveLookup')) {
      return InlineValue.variableLookup(
        value: InlineValueVariableLookup.fromJson(json),
      );
    }
    return InlineValue.evaluatableExpression(
      value: InlineValueEvaluatableExpression.fromJson(json),
    );
  }

  Object toJson() => switch (this) {
    InlineValue$Text(:final value) => value.toJson(),
    InlineValue$VariableLookup(:final value) => value.toJson(),
    InlineValue$EvaluatableExpression(:final value) => value.toJson(),
  };
}

@freezed
sealed class DocumentDiagnosticReport with _$DocumentDiagnosticReport {
  const DocumentDiagnosticReport._();

  const factory DocumentDiagnosticReport.relatedFullDocumentDiagnosticReport({
    required RelatedFullDocumentDiagnosticReport value,
  }) = DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport;

  const factory DocumentDiagnosticReport.relatedUnchangedDocumentDiagnosticReport({
    required RelatedUnchangedDocumentDiagnosticReport value,
  }) = DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport;

  static DocumentDiagnosticReport fromJson(Map<String, Object?> json) {
    if (json['kind'] == 'full') {
      return DocumentDiagnosticReport.relatedFullDocumentDiagnosticReport(
        value: RelatedFullDocumentDiagnosticReport.fromJson(json),
      );
    }
    return DocumentDiagnosticReport.relatedUnchangedDocumentDiagnosticReport(
      value: RelatedUnchangedDocumentDiagnosticReport.fromJson(json),
    );
  }

  Object toJson() => switch (this) {
    DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport(
      :final value,
    ) =>
      value.toJson(),
    DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport(
      :final value,
    ) =>
      value.toJson(),
  };
}

@freezed
sealed class PrepareRenameResult with _$PrepareRenameResult {
  const PrepareRenameResult._();

  const factory PrepareRenameResult.range({required Range value}) =
      PrepareRenameResult$Range;

  const factory PrepareRenameResult.rangePlaceholder({
    required ({Range range, String placeholder}) value,
  }) = PrepareRenameResult$RangePlaceholder;

  const factory PrepareRenameResult.defaultBehavior({
    required ({bool defaultBehavior}) value,
  }) = PrepareRenameResult$DefaultBehavior;

  static PrepareRenameResult fromJson(Map<String, Object?> json) {
    if (json.containsKey('start')) {
      return PrepareRenameResult.range(value: Range.fromJson(json));
    }
    if (json.containsKey('range')) {
      return PrepareRenameResult.rangePlaceholder(
        value: (
          range: Range.fromJson(json['range'] as Map<String, Object?>),
          placeholder: json['placeholder'] as String,
        ),
      );
    }
    if (json.containsKey('defaultBehavior')) {
      return PrepareRenameResult.defaultBehavior(
        value: (defaultBehavior: json['defaultBehavior'] as bool),
      );
    }
    return PrepareRenameResult.defaultBehavior(
      value: (defaultBehavior: json['defaultBehavior'] as bool),
    );
  }

  Object toJson() => switch (this) {
    PrepareRenameResult$Range(:final value) => value.toJson(),
    PrepareRenameResult$RangePlaceholder(:final value) => {
      'range': value.range.toJson(),
      'placeholder': value.placeholder,
    },
    PrepareRenameResult$DefaultBehavior(:final value) => {
      'defaultBehavior': value.defaultBehavior,
    },
  };
}

@freezed
sealed class WorkspaceDocumentDiagnosticReport
    with _$WorkspaceDocumentDiagnosticReport {
  const WorkspaceDocumentDiagnosticReport._();

  const factory WorkspaceDocumentDiagnosticReport.workspaceFullDocumentDiagnosticReport({
    required WorkspaceFullDocumentDiagnosticReport value,
  }) = WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport;

  const factory WorkspaceDocumentDiagnosticReport.workspaceUnchangedDocumentDiagnosticReport({
    required WorkspaceUnchangedDocumentDiagnosticReport value,
  }) =
      WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport;

  static WorkspaceDocumentDiagnosticReport fromJson(Map<String, Object?> json) {
    if (json['kind'] == 'full') {
      return WorkspaceDocumentDiagnosticReport.workspaceFullDocumentDiagnosticReport(
        value: WorkspaceFullDocumentDiagnosticReport.fromJson(json),
      );
    }
    return WorkspaceDocumentDiagnosticReport.workspaceUnchangedDocumentDiagnosticReport(
      value: WorkspaceUnchangedDocumentDiagnosticReport.fromJson(json),
    );
  }

  Object toJson() => switch (this) {
    WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport(
      :final value,
    ) =>
      value.toJson(),
    WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport(
      :final value,
    ) =>
      value.toJson(),
  };
}

@freezed
sealed class TextDocumentContentChangeEvent
    with _$TextDocumentContentChangeEvent {
  const TextDocumentContentChangeEvent._();

  const factory TextDocumentContentChangeEvent.rangeRangeLengthText({
    required ({Range range, int? rangeLength, String text}) value,
  }) = TextDocumentContentChangeEvent$RangeRangeLengthText;

  const factory TextDocumentContentChangeEvent.text({
    required ({String text}) value,
  }) = TextDocumentContentChangeEvent$Text;

  static TextDocumentContentChangeEvent fromJson(Map<String, Object?> json) {
    if (json.containsKey('range')) {
      return TextDocumentContentChangeEvent.rangeRangeLengthText(
        value: (
          range: Range.fromJson(json['range'] as Map<String, Object?>),
          rangeLength: json['rangeLength'] as int?,
          text: json['text'] as String,
        ),
      );
    }
    return TextDocumentContentChangeEvent.text(
      value: (text: json['text'] as String),
    );
  }

  Object toJson() => switch (this) {
    TextDocumentContentChangeEvent$RangeRangeLengthText(:final value) => {
      'range': value.range.toJson(),
      if (value.rangeLength != null) 'rangeLength': value.rangeLength,
      'text': value.text,
    },
    TextDocumentContentChangeEvent$Text(:final value) => {'text': value.text},
  };
}

@freezed
sealed class MarkedString with _$MarkedString {
  const MarkedString._();

  const factory MarkedString.languageValue({
    required ({String language, String value}) value,
  }) = MarkedString$LanguageValue;

  const factory MarkedString.string({required String value}) =
      MarkedString$String;

  static MarkedString fromJson(Object? json) {
    if (json is Map<String, Object?>) {
      return MarkedString.languageValue(
        value: (
          language: json['language'] as String,
          value: json['value'] as String,
        ),
      );
    }
    return MarkedString.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    MarkedString$LanguageValue(:final value) => {
      'language': value.language,
      'value': value.value,
    },
    MarkedString$String(:final value) => value,
  };
}
