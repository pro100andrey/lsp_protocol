// GENERATED — do not edit.

import 'package:freezed_annotation/freezed_annotation.dart';

import 'structures.dart';

part 'unions.freezed.dart';

/// The definition of a symbol represented as one or many [locations]. For most
/// programming languages there is only one location at which a symbol is
/// defined.
///
/// Servers should prefer returning `DefinitionLink` over `Definition` if
/// supported by the client.
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
            .map((e) => Location.fromJson((e as Map<String, Object>)))
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

/// The declaration of a symbol representation as one or many [locations].
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
            .map((e) => Location.fromJson((e as Map<String, Object>)))
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

/// Inline value information can be provided by different means: - directly as a
/// text value (class InlineValueText). - as a name to use for a variable lookup
/// (class InlineValueVariableLookup) - as an evaluatable expression (class
/// InlineValueEvaluatableExpression) The InlineValue types combines all inline
/// value types into one type.
///
/// @since 3.17.0
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

/// The result of a document diagnostic pull request. A report can either be a
/// full report containing all diagnostics for the requested document or an
/// unchanged report indicating that nothing has changed in terms of diagnostics
/// in comparison to the last pull request.
///
/// @since 3.17.0
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

/// A workspace diagnostic document report.
///
/// @since 3.17.0
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

/// An event describing a change to a text document. If only a text is provided
/// it is considered to be the full content of the document.
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
@freezed
@Deprecated('use MarkupContent instead.')
sealed class MarkedString with _$MarkedString {
  const MarkedString._();

  const factory MarkedString.languageValue({
    required ({String language, String value}) value,
  }) = MarkedString$LanguageValue;

  const factory MarkedString.string({required String value}) =
      MarkedString$String;

  static MarkedString fromJson(Object? json) {
    if (json is Map<String, Object>) {
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

/// Inline union: SemanticTokensRegistrationOptionsRange.
@freezed
sealed class SemanticTokensRegistrationOptionsRange
    with _$SemanticTokensRegistrationOptionsRange {
  const SemanticTokensRegistrationOptionsRange._();

  const factory SemanticTokensRegistrationOptionsRange.empty({
    required Object value,
  }) = SemanticTokensRegistrationOptionsRange$Empty;

  const factory SemanticTokensRegistrationOptionsRange.bool({
    required bool value,
  }) = SemanticTokensRegistrationOptionsRange$Bool;

  static SemanticTokensRegistrationOptionsRange fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return SemanticTokensRegistrationOptionsRange.empty(value: ());
    }
    return SemanticTokensRegistrationOptionsRange.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    SemanticTokensRegistrationOptionsRange$Empty() => <String, Object?>{},
    SemanticTokensRegistrationOptionsRange$Bool(:final value) => value,
  };
}

/// Inline union: SemanticTokensRegistrationOptionsFull.
@freezed
sealed class SemanticTokensRegistrationOptionsFull
    with _$SemanticTokensRegistrationOptionsFull {
  const SemanticTokensRegistrationOptionsFull._();

  const factory SemanticTokensRegistrationOptionsFull.delta({
    required ({bool? delta}) value,
  }) = SemanticTokensRegistrationOptionsFull$Delta;

  const factory SemanticTokensRegistrationOptionsFull.bool({
    required bool value,
  }) = SemanticTokensRegistrationOptionsFull$Bool;

  static SemanticTokensRegistrationOptionsFull fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return SemanticTokensRegistrationOptionsFull.delta(
        value: (delta: json['delta'] as bool?),
      );
    }
    return SemanticTokensRegistrationOptionsFull.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    SemanticTokensRegistrationOptionsFull$Delta(:final value) => {
      if (value.delta != null) 'delta': value.delta,
    },
    SemanticTokensRegistrationOptionsFull$Bool(:final value) => value,
  };
}

/// Inline union: InlayHintTooltip.
@freezed
sealed class InlayHintTooltip with _$InlayHintTooltip {
  const InlayHintTooltip._();

  const factory InlayHintTooltip.markupContent({required MarkupContent value}) =
      InlayHintTooltip$MarkupContent;

  const factory InlayHintTooltip.string({required String value}) =
      InlayHintTooltip$String;

  static InlayHintTooltip fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return InlayHintTooltip.markupContent(
        value: MarkupContent.fromJson(json),
      );
    }
    return InlayHintTooltip.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    InlayHintTooltip$MarkupContent(:final value) => value.toJson(),
    InlayHintTooltip$String(:final value) => value,
  };
}

/// Inline union: InlineCompletionItemInsertText.
@freezed
sealed class InlineCompletionItemInsertText
    with _$InlineCompletionItemInsertText {
  const InlineCompletionItemInsertText._();

  const factory InlineCompletionItemInsertText.stringValue({
    required StringValue value,
  }) = InlineCompletionItemInsertText$StringValue;

  const factory InlineCompletionItemInsertText.string({required String value}) =
      InlineCompletionItemInsertText$String;

  static InlineCompletionItemInsertText fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return InlineCompletionItemInsertText.stringValue(
        value: StringValue.fromJson(json),
      );
    }
    return InlineCompletionItemInsertText.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    InlineCompletionItemInsertText$StringValue(:final value) => value.toJson(),
    InlineCompletionItemInsertText$String(:final value) => value,
  };
}

/// Inline union: CompletionItemDocumentation.
@freezed
sealed class CompletionItemDocumentation with _$CompletionItemDocumentation {
  const CompletionItemDocumentation._();

  const factory CompletionItemDocumentation.markupContent({
    required MarkupContent value,
  }) = CompletionItemDocumentation$MarkupContent;

  const factory CompletionItemDocumentation.string({required String value}) =
      CompletionItemDocumentation$String;

  static CompletionItemDocumentation fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return CompletionItemDocumentation.markupContent(
        value: MarkupContent.fromJson(json),
      );
    }
    return CompletionItemDocumentation.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    CompletionItemDocumentation$MarkupContent(:final value) => value.toJson(),
    CompletionItemDocumentation$String(:final value) => value,
  };
}

/// Inline union: CompletionItemTextEdit.
@freezed
sealed class CompletionItemTextEdit with _$CompletionItemTextEdit {
  const CompletionItemTextEdit._();

  const factory CompletionItemTextEdit.textEdit({required TextEdit value}) =
      CompletionItemTextEdit$TextEdit;

  const factory CompletionItemTextEdit.insertReplaceEdit({
    required InsertReplaceEdit value,
  }) = CompletionItemTextEdit$InsertReplaceEdit;

  static CompletionItemTextEdit fromJson(Map<String, Object?> json) {
    if (json.containsKey('range')) {
      return CompletionItemTextEdit.textEdit(value: TextEdit.fromJson(json));
    }
    if (json.containsKey('insert')) {
      return CompletionItemTextEdit.insertReplaceEdit(
        value: InsertReplaceEdit.fromJson(json),
      );
    }
    return CompletionItemTextEdit.insertReplaceEdit(
      value: InsertReplaceEdit.fromJson(json),
    );
  }

  Object toJson() => switch (this) {
    CompletionItemTextEdit$TextEdit(:final value) => value.toJson(),
    CompletionItemTextEdit$InsertReplaceEdit(:final value) => value.toJson(),
  };
}

/// Inline union: WorkspaceSymbolLocation.
@freezed
sealed class WorkspaceSymbolLocation with _$WorkspaceSymbolLocation {
  const WorkspaceSymbolLocation._();

  const factory WorkspaceSymbolLocation.location({required Location value}) =
      WorkspaceSymbolLocation$Location;

  const factory WorkspaceSymbolLocation.uri({required ({String uri}) value}) =
      WorkspaceSymbolLocation$Uri;

  static WorkspaceSymbolLocation fromJson(Map<String, Object?> json) {
    if (json.containsKey('range')) {
      return WorkspaceSymbolLocation.location(value: Location.fromJson(json));
    }
    return WorkspaceSymbolLocation.uri(value: (uri: json['uri'] as String));
  }

  Object toJson() => switch (this) {
    WorkspaceSymbolLocation$Location(:final value) => value.toJson(),
    WorkspaceSymbolLocation$Uri(:final value) => {'uri': value.uri},
  };
}

/// Inline union: SemanticTokensOptionsRange.
@freezed
sealed class SemanticTokensOptionsRange with _$SemanticTokensOptionsRange {
  const SemanticTokensOptionsRange._();

  const factory SemanticTokensOptionsRange.empty({required Object value}) =
      SemanticTokensOptionsRange$Empty;

  const factory SemanticTokensOptionsRange.bool({required bool value}) =
      SemanticTokensOptionsRange$Bool;

  static SemanticTokensOptionsRange fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return SemanticTokensOptionsRange.empty(value: ());
    }
    return SemanticTokensOptionsRange.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    SemanticTokensOptionsRange$Empty() => <String, Object?>{},
    SemanticTokensOptionsRange$Bool(:final value) => value,
  };
}

/// Inline union: SemanticTokensOptionsFull.
@freezed
sealed class SemanticTokensOptionsFull with _$SemanticTokensOptionsFull {
  const SemanticTokensOptionsFull._();

  const factory SemanticTokensOptionsFull.delta({
    required ({bool? delta}) value,
  }) = SemanticTokensOptionsFull$Delta;

  const factory SemanticTokensOptionsFull.bool({required bool value}) =
      SemanticTokensOptionsFull$Bool;

  static SemanticTokensOptionsFull fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return SemanticTokensOptionsFull.delta(
        value: (delta: json['delta'] as bool?),
      );
    }
    return SemanticTokensOptionsFull.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    SemanticTokensOptionsFull$Delta(:final value) => {
      if (value.delta != null) 'delta': value.delta,
    },
    SemanticTokensOptionsFull$Bool(:final value) => value,
  };
}

/// Inline union: TextDocumentEditEditsItem.
@freezed
sealed class TextDocumentEditEditsItem with _$TextDocumentEditEditsItem {
  const TextDocumentEditEditsItem._();

  const factory TextDocumentEditEditsItem.annotatedTextEdit({
    required AnnotatedTextEdit value,
  }) = TextDocumentEditEditsItem$AnnotatedTextEdit;

  const factory TextDocumentEditEditsItem.textEdit({required TextEdit value}) =
      TextDocumentEditEditsItem$TextEdit;

  static TextDocumentEditEditsItem fromJson(Map<String, Object?> json) {
    if (json.containsKey('annotationId')) {
      return TextDocumentEditEditsItem.annotatedTextEdit(
        value: AnnotatedTextEdit.fromJson(json),
      );
    }
    return TextDocumentEditEditsItem.textEdit(value: TextEdit.fromJson(json));
  }

  Object toJson() => switch (this) {
    TextDocumentEditEditsItem$AnnotatedTextEdit(:final value) => value.toJson(),
    TextDocumentEditEditsItem$TextEdit(:final value) => value.toJson(),
  };
}

/// Inline union: InlayHintLabelPartTooltip.
@freezed
sealed class InlayHintLabelPartTooltip with _$InlayHintLabelPartTooltip {
  const InlayHintLabelPartTooltip._();

  const factory InlayHintLabelPartTooltip.markupContent({
    required MarkupContent value,
  }) = InlayHintLabelPartTooltip$MarkupContent;

  const factory InlayHintLabelPartTooltip.string({required String value}) =
      InlayHintLabelPartTooltip$String;

  static InlayHintLabelPartTooltip fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return InlayHintLabelPartTooltip.markupContent(
        value: MarkupContent.fromJson(json),
      );
    }
    return InlayHintLabelPartTooltip.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    InlayHintLabelPartTooltip$MarkupContent(:final value) => value.toJson(),
    InlayHintLabelPartTooltip$String(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesHoverProvider.
@freezed
sealed class ServerCapabilitiesHoverProvider
    with _$ServerCapabilitiesHoverProvider {
  const ServerCapabilitiesHoverProvider._();

  const factory ServerCapabilitiesHoverProvider.hoverOptions({
    required HoverOptions value,
  }) = ServerCapabilitiesHoverProvider$HoverOptions;

  const factory ServerCapabilitiesHoverProvider.bool({required bool value}) =
      ServerCapabilitiesHoverProvider$Bool;

  static ServerCapabilitiesHoverProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesHoverProvider.hoverOptions(
        value: HoverOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesHoverProvider.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesHoverProvider$HoverOptions(:final value) =>
      value.toJson(),
    ServerCapabilitiesHoverProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesDefinitionProvider.
@freezed
sealed class ServerCapabilitiesDefinitionProvider
    with _$ServerCapabilitiesDefinitionProvider {
  const ServerCapabilitiesDefinitionProvider._();

  const factory ServerCapabilitiesDefinitionProvider.definitionOptions({
    required DefinitionOptions value,
  }) = ServerCapabilitiesDefinitionProvider$DefinitionOptions;

  const factory ServerCapabilitiesDefinitionProvider.bool({
    required bool value,
  }) = ServerCapabilitiesDefinitionProvider$Bool;

  static ServerCapabilitiesDefinitionProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesDefinitionProvider.definitionOptions(
        value: DefinitionOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesDefinitionProvider.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesDefinitionProvider$DefinitionOptions(:final value) =>
      value.toJson(),
    ServerCapabilitiesDefinitionProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesReferencesProvider.
@freezed
sealed class ServerCapabilitiesReferencesProvider
    with _$ServerCapabilitiesReferencesProvider {
  const ServerCapabilitiesReferencesProvider._();

  const factory ServerCapabilitiesReferencesProvider.referenceOptions({
    required ReferenceOptions value,
  }) = ServerCapabilitiesReferencesProvider$ReferenceOptions;

  const factory ServerCapabilitiesReferencesProvider.bool({
    required bool value,
  }) = ServerCapabilitiesReferencesProvider$Bool;

  static ServerCapabilitiesReferencesProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesReferencesProvider.referenceOptions(
        value: ReferenceOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesReferencesProvider.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesReferencesProvider$ReferenceOptions(:final value) =>
      value.toJson(),
    ServerCapabilitiesReferencesProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesDocumentHighlightProvider.
@freezed
sealed class ServerCapabilitiesDocumentHighlightProvider
    with _$ServerCapabilitiesDocumentHighlightProvider {
  const ServerCapabilitiesDocumentHighlightProvider._();

  const factory ServerCapabilitiesDocumentHighlightProvider.documentHighlightOptions({
    required DocumentHighlightOptions value,
  }) = ServerCapabilitiesDocumentHighlightProvider$DocumentHighlightOptions;

  const factory ServerCapabilitiesDocumentHighlightProvider.bool({
    required bool value,
  }) = ServerCapabilitiesDocumentHighlightProvider$Bool;

  static ServerCapabilitiesDocumentHighlightProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesDocumentHighlightProvider.documentHighlightOptions(
        value: DocumentHighlightOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesDocumentHighlightProvider.bool(
      value: (json as bool),
    );
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesDocumentHighlightProvider$DocumentHighlightOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesDocumentHighlightProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesDocumentSymbolProvider.
@freezed
sealed class ServerCapabilitiesDocumentSymbolProvider
    with _$ServerCapabilitiesDocumentSymbolProvider {
  const ServerCapabilitiesDocumentSymbolProvider._();

  const factory ServerCapabilitiesDocumentSymbolProvider.documentSymbolOptions({
    required DocumentSymbolOptions value,
  }) = ServerCapabilitiesDocumentSymbolProvider$DocumentSymbolOptions;

  const factory ServerCapabilitiesDocumentSymbolProvider.bool({
    required bool value,
  }) = ServerCapabilitiesDocumentSymbolProvider$Bool;

  static ServerCapabilitiesDocumentSymbolProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesDocumentSymbolProvider.documentSymbolOptions(
        value: DocumentSymbolOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesDocumentSymbolProvider.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesDocumentSymbolProvider$DocumentSymbolOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesDocumentSymbolProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesCodeActionProvider.
@freezed
sealed class ServerCapabilitiesCodeActionProvider
    with _$ServerCapabilitiesCodeActionProvider {
  const ServerCapabilitiesCodeActionProvider._();

  const factory ServerCapabilitiesCodeActionProvider.codeActionOptions({
    required CodeActionOptions value,
  }) = ServerCapabilitiesCodeActionProvider$CodeActionOptions;

  const factory ServerCapabilitiesCodeActionProvider.bool({
    required bool value,
  }) = ServerCapabilitiesCodeActionProvider$Bool;

  static ServerCapabilitiesCodeActionProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesCodeActionProvider.codeActionOptions(
        value: CodeActionOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesCodeActionProvider.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesCodeActionProvider$CodeActionOptions(:final value) =>
      value.toJson(),
    ServerCapabilitiesCodeActionProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesWorkspaceSymbolProvider.
@freezed
sealed class ServerCapabilitiesWorkspaceSymbolProvider
    with _$ServerCapabilitiesWorkspaceSymbolProvider {
  const ServerCapabilitiesWorkspaceSymbolProvider._();

  const factory ServerCapabilitiesWorkspaceSymbolProvider.workspaceSymbolOptions({
    required WorkspaceSymbolOptions value,
  }) = ServerCapabilitiesWorkspaceSymbolProvider$WorkspaceSymbolOptions;

  const factory ServerCapabilitiesWorkspaceSymbolProvider.bool({
    required bool value,
  }) = ServerCapabilitiesWorkspaceSymbolProvider$Bool;

  static ServerCapabilitiesWorkspaceSymbolProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesWorkspaceSymbolProvider.workspaceSymbolOptions(
        value: WorkspaceSymbolOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesWorkspaceSymbolProvider.bool(
      value: (json as bool),
    );
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesWorkspaceSymbolProvider$WorkspaceSymbolOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesWorkspaceSymbolProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesDocumentFormattingProvider.
@freezed
sealed class ServerCapabilitiesDocumentFormattingProvider
    with _$ServerCapabilitiesDocumentFormattingProvider {
  const ServerCapabilitiesDocumentFormattingProvider._();

  const factory ServerCapabilitiesDocumentFormattingProvider.documentFormattingOptions({
    required DocumentFormattingOptions value,
  }) = ServerCapabilitiesDocumentFormattingProvider$DocumentFormattingOptions;

  const factory ServerCapabilitiesDocumentFormattingProvider.bool({
    required bool value,
  }) = ServerCapabilitiesDocumentFormattingProvider$Bool;

  static ServerCapabilitiesDocumentFormattingProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesDocumentFormattingProvider.documentFormattingOptions(
        value: DocumentFormattingOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesDocumentFormattingProvider.bool(
      value: (json as bool),
    );
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesDocumentFormattingProvider$DocumentFormattingOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesDocumentFormattingProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesDocumentRangeFormattingProvider.
@freezed
sealed class ServerCapabilitiesDocumentRangeFormattingProvider
    with _$ServerCapabilitiesDocumentRangeFormattingProvider {
  const ServerCapabilitiesDocumentRangeFormattingProvider._();

  const factory ServerCapabilitiesDocumentRangeFormattingProvider.documentRangeFormattingOptions({
    required DocumentRangeFormattingOptions value,
  }) =
      ServerCapabilitiesDocumentRangeFormattingProvider$DocumentRangeFormattingOptions;

  const factory ServerCapabilitiesDocumentRangeFormattingProvider.bool({
    required bool value,
  }) = ServerCapabilitiesDocumentRangeFormattingProvider$Bool;

  static ServerCapabilitiesDocumentRangeFormattingProvider fromJson(
    Object? json,
  ) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesDocumentRangeFormattingProvider.documentRangeFormattingOptions(
        value: DocumentRangeFormattingOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesDocumentRangeFormattingProvider.bool(
      value: (json as bool),
    );
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesDocumentRangeFormattingProvider$DocumentRangeFormattingOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesDocumentRangeFormattingProvider$Bool(:final value) =>
      value,
  };
}

/// Inline union: ServerCapabilitiesRenameProvider.
@freezed
sealed class ServerCapabilitiesRenameProvider
    with _$ServerCapabilitiesRenameProvider {
  const ServerCapabilitiesRenameProvider._();

  const factory ServerCapabilitiesRenameProvider.renameOptions({
    required RenameOptions value,
  }) = ServerCapabilitiesRenameProvider$RenameOptions;

  const factory ServerCapabilitiesRenameProvider.bool({required bool value}) =
      ServerCapabilitiesRenameProvider$Bool;

  static ServerCapabilitiesRenameProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesRenameProvider.renameOptions(
        value: RenameOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesRenameProvider.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesRenameProvider$RenameOptions(:final value) =>
      value.toJson(),
    ServerCapabilitiesRenameProvider$Bool(:final value) => value,
  };
}

/// Inline union: ServerCapabilitiesSemanticTokensProvider.
@freezed
sealed class ServerCapabilitiesSemanticTokensProvider
    with _$ServerCapabilitiesSemanticTokensProvider {
  const ServerCapabilitiesSemanticTokensProvider._();

  const factory ServerCapabilitiesSemanticTokensProvider.semanticTokensRegistrationOptions({
    required SemanticTokensRegistrationOptions value,
  }) =
      ServerCapabilitiesSemanticTokensProvider$SemanticTokensRegistrationOptions;

  const factory ServerCapabilitiesSemanticTokensProvider.semanticTokensOptions({
    required SemanticTokensOptions value,
  }) = ServerCapabilitiesSemanticTokensProvider$SemanticTokensOptions;

  static ServerCapabilitiesSemanticTokensProvider fromJson(
    Map<String, Object?> json,
  ) {
    if (json.containsKey('documentSelector')) {
      return ServerCapabilitiesSemanticTokensProvider.semanticTokensRegistrationOptions(
        value: SemanticTokensRegistrationOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesSemanticTokensProvider.semanticTokensOptions(
      value: SemanticTokensOptions.fromJson(json),
    );
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesSemanticTokensProvider$SemanticTokensRegistrationOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesSemanticTokensProvider$SemanticTokensOptions(
      :final value,
    ) =>
      value.toJson(),
  };
}

/// Inline union: ServerCapabilitiesDiagnosticProvider.
@freezed
sealed class ServerCapabilitiesDiagnosticProvider
    with _$ServerCapabilitiesDiagnosticProvider {
  const ServerCapabilitiesDiagnosticProvider._();

  const factory ServerCapabilitiesDiagnosticProvider.diagnosticRegistrationOptions({
    required DiagnosticRegistrationOptions value,
  }) = ServerCapabilitiesDiagnosticProvider$DiagnosticRegistrationOptions;

  const factory ServerCapabilitiesDiagnosticProvider.diagnosticOptions({
    required DiagnosticOptions value,
  }) = ServerCapabilitiesDiagnosticProvider$DiagnosticOptions;

  static ServerCapabilitiesDiagnosticProvider fromJson(
    Map<String, Object?> json,
  ) {
    if (json.containsKey('documentSelector')) {
      return ServerCapabilitiesDiagnosticProvider.diagnosticRegistrationOptions(
        value: DiagnosticRegistrationOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesDiagnosticProvider.diagnosticOptions(
      value: DiagnosticOptions.fromJson(json),
    );
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesDiagnosticProvider$DiagnosticRegistrationOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesDiagnosticProvider$DiagnosticOptions(:final value) =>
      value.toJson(),
  };
}

/// Inline union: ServerCapabilitiesInlineCompletionProvider.
@freezed
sealed class ServerCapabilitiesInlineCompletionProvider
    with _$ServerCapabilitiesInlineCompletionProvider {
  const ServerCapabilitiesInlineCompletionProvider._();

  const factory ServerCapabilitiesInlineCompletionProvider.inlineCompletionOptions({
    required InlineCompletionOptions value,
  }) = ServerCapabilitiesInlineCompletionProvider$InlineCompletionOptions;

  const factory ServerCapabilitiesInlineCompletionProvider.bool({
    required bool value,
  }) = ServerCapabilitiesInlineCompletionProvider$Bool;

  static ServerCapabilitiesInlineCompletionProvider fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ServerCapabilitiesInlineCompletionProvider.inlineCompletionOptions(
        value: InlineCompletionOptions.fromJson(json),
      );
    }
    return ServerCapabilitiesInlineCompletionProvider.bool(
      value: (json as bool),
    );
  }

  Object toJson() => switch (this) {
    ServerCapabilitiesInlineCompletionProvider$InlineCompletionOptions(
      :final value,
    ) =>
      value.toJson(),
    ServerCapabilitiesInlineCompletionProvider$Bool(:final value) => value,
  };
}

/// Inline union: SignatureInformationDocumentation.
@freezed
sealed class SignatureInformationDocumentation
    with _$SignatureInformationDocumentation {
  const SignatureInformationDocumentation._();

  const factory SignatureInformationDocumentation.markupContent({
    required MarkupContent value,
  }) = SignatureInformationDocumentation$MarkupContent;

  const factory SignatureInformationDocumentation.string({
    required String value,
  }) = SignatureInformationDocumentation$String;

  static SignatureInformationDocumentation fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return SignatureInformationDocumentation.markupContent(
        value: MarkupContent.fromJson(json),
      );
    }
    return SignatureInformationDocumentation.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    SignatureInformationDocumentation$MarkupContent(:final value) =>
      value.toJson(),
    SignatureInformationDocumentation$String(:final value) => value,
  };
}

/// Inline union: TextDocumentSyncOptionsSave.
@freezed
sealed class TextDocumentSyncOptionsSave with _$TextDocumentSyncOptionsSave {
  const TextDocumentSyncOptionsSave._();

  const factory TextDocumentSyncOptionsSave.saveOptions({
    required SaveOptions value,
  }) = TextDocumentSyncOptionsSave$SaveOptions;

  const factory TextDocumentSyncOptionsSave.bool({required bool value}) =
      TextDocumentSyncOptionsSave$Bool;

  static TextDocumentSyncOptionsSave fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return TextDocumentSyncOptionsSave.saveOptions(
        value: SaveOptions.fromJson(json),
      );
    }
    return TextDocumentSyncOptionsSave.bool(value: (json as bool));
  }

  Object toJson() => switch (this) {
    TextDocumentSyncOptionsSave$SaveOptions(:final value) => value.toJson(),
    TextDocumentSyncOptionsSave$Bool(:final value) => value,
  };
}

/// Inline union: ParameterInformationDocumentation.
@freezed
sealed class ParameterInformationDocumentation
    with _$ParameterInformationDocumentation {
  const ParameterInformationDocumentation._();

  const factory ParameterInformationDocumentation.markupContent({
    required MarkupContent value,
  }) = ParameterInformationDocumentation$MarkupContent;

  const factory ParameterInformationDocumentation.string({
    required String value,
  }) = ParameterInformationDocumentation$String;

  static ParameterInformationDocumentation fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return ParameterInformationDocumentation.markupContent(
        value: MarkupContent.fromJson(json),
      );
    }
    return ParameterInformationDocumentation.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    ParameterInformationDocumentation$MarkupContent(:final value) =>
      value.toJson(),
    ParameterInformationDocumentation$String(:final value) => value,
  };
}

/// Inline union: RelativePatternBaseUri.
@freezed
sealed class RelativePatternBaseUri with _$RelativePatternBaseUri {
  const RelativePatternBaseUri._();

  const factory RelativePatternBaseUri.workspaceFolder({
    required WorkspaceFolder value,
  }) = RelativePatternBaseUri$WorkspaceFolder;

  const factory RelativePatternBaseUri.string({required String value}) =
      RelativePatternBaseUri$String;

  static RelativePatternBaseUri fromJson(Object? json) {
    if (json is Map<String, Object>) {
      return RelativePatternBaseUri.workspaceFolder(
        value: WorkspaceFolder.fromJson(json),
      );
    }
    return RelativePatternBaseUri.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    RelativePatternBaseUri$WorkspaceFolder(:final value) => value.toJson(),
    RelativePatternBaseUri$String(:final value) => value,
  };
}
