// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Definition0 _$Definition0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return Definition0(
    value: Location.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$Definition0ToJson(Definition0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

Definition1 _$Definition1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return Definition1(
    value: (json['value'] as List<dynamic>)
        .map((e) => Location.fromJson(e as Map<String, dynamic>))
        .toList(),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$Definition1ToJson(Definition1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

LSPAny0 _$LSPAny0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return LSPAny0(
    value: json['value'] as Map<String, dynamic>,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$LSPAny0ToJson(LSPAny0 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny1 _$LSPAny1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return LSPAny1(
    value: json['value'] as List<dynamic>,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$LSPAny1ToJson(LSPAny1 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny2 _$LSPAny2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return LSPAny2(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$LSPAny2ToJson(LSPAny2 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny3 _$LSPAny3FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return LSPAny3(
    value: (json['value'] as num).toInt(),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$LSPAny3ToJson(LSPAny3 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny4 _$LSPAny4FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return LSPAny4(
    value: (json['value'] as num).toInt(),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$LSPAny4ToJson(LSPAny4 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny5 _$LSPAny5FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return LSPAny5(
    value: (json['value'] as num).toDouble(),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$LSPAny5ToJson(LSPAny5 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny6 _$LSPAny6FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return LSPAny6(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$LSPAny6ToJson(LSPAny6 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

InlineValue0 _$InlineValue0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return InlineValue0(
    value: InlineValueText.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$InlineValue0ToJson(InlineValue0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineValue1 _$InlineValue1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return InlineValue1(
    value: InlineValueVariableLookup.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$InlineValue1ToJson(InlineValue1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineValue2 _$InlineValue2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return InlineValue2(
    value: InlineValueEvaluatableExpression.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$InlineValue2ToJson(InlineValue2 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DocumentDiagnosticReport0 _$DocumentDiagnosticReport0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return DocumentDiagnosticReport0(
    value: RelatedFullDocumentDiagnosticReport.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$DocumentDiagnosticReport0ToJson(
  DocumentDiagnosticReport0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DocumentDiagnosticReport1 _$DocumentDiagnosticReport1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return DocumentDiagnosticReport1(
    value: RelatedUnchangedDocumentDiagnosticReport.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$DocumentDiagnosticReport1ToJson(
  DocumentDiagnosticReport1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

PrepareRenameResult0 _$PrepareRenameResult0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return PrepareRenameResult0(
    value: Range.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$PrepareRenameResult0ToJson(
  PrepareRenameResult0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

PrepareRenameResult1 _$PrepareRenameResult1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return PrepareRenameResult1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        placeholder: $jsonValue['placeholder'] as String,
        range: Range.fromJson($jsonValue['range'] as Map<String, dynamic>),
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$PrepareRenameResult1ToJson(
  PrepareRenameResult1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'placeholder': instance.value.placeholder,
    'range': instance.value.range,
  },
  'runtimeType': instance.$type,
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

PrepareRenameResult2 _$PrepareRenameResult2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return PrepareRenameResult2(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (defaultBehavior: $jsonValue['defaultBehavior'] as bool),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$PrepareRenameResult2ToJson(
  PrepareRenameResult2 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'defaultBehavior': instance.value.defaultBehavior},
  'runtimeType': instance.$type,
};

ProgressToken0 _$ProgressToken0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ProgressToken0(
    value: (json['value'] as num).toInt(),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ProgressToken0ToJson(ProgressToken0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ProgressToken1 _$ProgressToken1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ProgressToken1(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ProgressToken1ToJson(ProgressToken1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceDocumentDiagnosticReport0 _$WorkspaceDocumentDiagnosticReport0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceDocumentDiagnosticReport0(
    value: WorkspaceFullDocumentDiagnosticReport.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceDocumentDiagnosticReport0ToJson(
  WorkspaceDocumentDiagnosticReport0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceDocumentDiagnosticReport1 _$WorkspaceDocumentDiagnosticReport1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceDocumentDiagnosticReport1(
    value: WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceDocumentDiagnosticReport1ToJson(
  WorkspaceDocumentDiagnosticReport1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentContentChangeEvent0 _$TextDocumentContentChangeEvent0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentContentChangeEvent0(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        range: Range.fromJson($jsonValue['range'] as Map<String, dynamic>),
        rangeLength: ($jsonValue['rangeLength'] as num?)?.toInt(),
        text: $jsonValue['text'] as String,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentContentChangeEvent0ToJson(
  TextDocumentContentChangeEvent0 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'range': instance.value.range,
    'rangeLength': instance.value.rangeLength,
    'text': instance.value.text,
  },
  'runtimeType': instance.$type,
};

TextDocumentContentChangeEvent1 _$TextDocumentContentChangeEvent1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentContentChangeEvent1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (text: $jsonValue['text'] as String),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentContentChangeEvent1ToJson(
  TextDocumentContentChangeEvent1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'text': instance.value.text},
  'runtimeType': instance.$type,
};

MarkedString0 _$MarkedString0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return MarkedString0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$MarkedString0ToJson(MarkedString0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

MarkedString1 _$MarkedString1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return MarkedString1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        language: $jsonValue['language'] as String,
        value: $jsonValue['value'] as String,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$MarkedString1ToJson(MarkedString1 instance) =>
    <String, dynamic>{
      'value': <String, dynamic>{
        'language': instance.value.language,
        'value': instance.value.value,
      },
      'runtimeType': instance.$type,
    };

DocumentFilter0 _$DocumentFilter0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return DocumentFilter0(
    value: json['value'],
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$DocumentFilter0ToJson(DocumentFilter0 instance) =>
    <String, dynamic>{'value': ?instance.value, 'runtimeType': instance.$type};

DocumentFilter1 _$DocumentFilter1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return DocumentFilter1(
    value: NotebookCellTextDocumentFilter.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$DocumentFilter1ToJson(DocumentFilter1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

GlobPattern0 _$GlobPattern0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return GlobPattern0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$GlobPattern0ToJson(GlobPattern0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

GlobPattern1 _$GlobPattern1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return GlobPattern1(
    value: RelativePattern.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$GlobPattern1ToJson(GlobPattern1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentFilter0 _$TextDocumentFilter0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentFilter0(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        language: $jsonValue['language'] as String,
        pattern: $jsonValue['pattern'] as String?,
        scheme: $jsonValue['scheme'] as String?,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentFilter0ToJson(
  TextDocumentFilter0 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'language': instance.value.language,
    'pattern': instance.value.pattern,
    'scheme': instance.value.scheme,
  },
  'runtimeType': instance.$type,
};

TextDocumentFilter1 _$TextDocumentFilter1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentFilter1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        language: $jsonValue['language'] as String?,
        pattern: $jsonValue['pattern'] as String?,
        scheme: $jsonValue['scheme'] as String,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentFilter1ToJson(
  TextDocumentFilter1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'language': instance.value.language,
    'pattern': instance.value.pattern,
    'scheme': instance.value.scheme,
  },
  'runtimeType': instance.$type,
};

TextDocumentFilter2 _$TextDocumentFilter2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentFilter2(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        language: $jsonValue['language'] as String?,
        pattern: $jsonValue['pattern'] as String,
        scheme: $jsonValue['scheme'] as String?,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentFilter2ToJson(
  TextDocumentFilter2 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'language': instance.value.language,
    'pattern': instance.value.pattern,
    'scheme': instance.value.scheme,
  },
  'runtimeType': instance.$type,
};

NotebookDocumentFilter0 _$NotebookDocumentFilter0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return NotebookDocumentFilter0(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        notebookType: $jsonValue['notebookType'] as String,
        pattern: $jsonValue['pattern'] as String?,
        scheme: $jsonValue['scheme'] as String?,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$NotebookDocumentFilter0ToJson(
  NotebookDocumentFilter0 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'notebookType': instance.value.notebookType,
    'pattern': instance.value.pattern,
    'scheme': instance.value.scheme,
  },
  'runtimeType': instance.$type,
};

NotebookDocumentFilter1 _$NotebookDocumentFilter1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return NotebookDocumentFilter1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        notebookType: $jsonValue['notebookType'] as String?,
        pattern: $jsonValue['pattern'] as String?,
        scheme: $jsonValue['scheme'] as String,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$NotebookDocumentFilter1ToJson(
  NotebookDocumentFilter1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'notebookType': instance.value.notebookType,
    'pattern': instance.value.pattern,
    'scheme': instance.value.scheme,
  },
  'runtimeType': instance.$type,
};

NotebookDocumentFilter2 _$NotebookDocumentFilter2FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return NotebookDocumentFilter2(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        notebookType: $jsonValue['notebookType'] as String?,
        pattern: $jsonValue['pattern'] as String,
        scheme: $jsonValue['scheme'] as String?,
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$NotebookDocumentFilter2ToJson(
  NotebookDocumentFilter2 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'notebookType': instance.value.notebookType,
    'pattern': instance.value.pattern,
    'scheme': instance.value.scheme,
  },
  'runtimeType': instance.$type,
};

TextDocumentRegistrationOptionsDocumentSelector0
_$TextDocumentRegistrationOptionsDocumentSelector0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value']);
  return TextDocumentRegistrationOptionsDocumentSelector0(
    value: json['value'] as List<dynamic>,
  );
}

Map<String, dynamic> _$TextDocumentRegistrationOptionsDocumentSelector0ToJson(
  TextDocumentRegistrationOptionsDocumentSelector0 instance,
) => <String, dynamic>{'value': instance.value};

WorkspaceEditDocumentChanges0 _$WorkspaceEditDocumentChanges0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceEditDocumentChanges0(
    value: TextDocumentEdit.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceEditDocumentChanges0ToJson(
  WorkspaceEditDocumentChanges0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceEditDocumentChanges1 _$WorkspaceEditDocumentChanges1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceEditDocumentChanges1(
    value: CreateFile.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceEditDocumentChanges1ToJson(
  WorkspaceEditDocumentChanges1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceEditDocumentChanges2 _$WorkspaceEditDocumentChanges2FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceEditDocumentChanges2(
    value: RenameFile.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceEditDocumentChanges2ToJson(
  WorkspaceEditDocumentChanges2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceEditDocumentChanges3 _$WorkspaceEditDocumentChanges3FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceEditDocumentChanges3(
    value: DeleteFile.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceEditDocumentChanges3ToJson(
  WorkspaceEditDocumentChanges3 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlayHintLabel0 _$InlayHintLabel0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return InlayHintLabel0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$InlayHintLabel0ToJson(InlayHintLabel0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlayHintLabel1 _$InlayHintLabel1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return InlayHintLabel1(
    value: (json['value'] as List<dynamic>)
        .map((e) => InlayHintLabelPart.fromJson(e as Map<String, dynamic>))
        .toList(),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$InlayHintLabel1ToJson(InlayHintLabel1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TooltipOrDocumentation0 _$TooltipOrDocumentation0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TooltipOrDocumentation0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TooltipOrDocumentation0ToJson(
  TooltipOrDocumentation0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TooltipOrDocumentation1 _$TooltipOrDocumentation1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TooltipOrDocumentation1(
    value: MarkupContent.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TooltipOrDocumentation1ToJson(
  TooltipOrDocumentation1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

RelatedDocuments0 _$RelatedDocuments0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return RelatedDocuments0(
    value: FullDocumentDiagnosticReport.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$RelatedDocuments0ToJson(RelatedDocuments0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

RelatedDocuments1 _$RelatedDocuments1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return RelatedDocuments1(
    value: UnchangedDocumentDiagnosticReport.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$RelatedDocuments1ToJson(RelatedDocuments1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineCompletionItemInsertText0 _$InlineCompletionItemInsertText0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return InlineCompletionItemInsertText0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$InlineCompletionItemInsertText0ToJson(
  InlineCompletionItemInsertText0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineCompletionItemInsertText1 _$InlineCompletionItemInsertText1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return InlineCompletionItemInsertText1(
    value: StringValue.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$InlineCompletionItemInsertText1ToJson(
  InlineCompletionItemInsertText1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DidChangeConfigurationRegistrationOptionsSection0
_$DidChangeConfigurationRegistrationOptionsSection0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return DidChangeConfigurationRegistrationOptionsSection0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$DidChangeConfigurationRegistrationOptionsSection0ToJson(
  DidChangeConfigurationRegistrationOptionsSection0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DidChangeConfigurationRegistrationOptionsSection1
_$DidChangeConfigurationRegistrationOptionsSection1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return DidChangeConfigurationRegistrationOptionsSection1(
    value: (json['value'] as List<dynamic>).map((e) => e as String).toList(),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$DidChangeConfigurationRegistrationOptionsSection1ToJson(
  DidChangeConfigurationRegistrationOptionsSection1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionItemTextEdit0 _$CompletionItemTextEdit0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return CompletionItemTextEdit0(
    value: TextEdit.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$CompletionItemTextEdit0ToJson(
  CompletionItemTextEdit0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionItemTextEdit1 _$CompletionItemTextEdit1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return CompletionItemTextEdit1(
    value: InsertReplaceEdit.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$CompletionItemTextEdit1ToJson(
  CompletionItemTextEdit1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionListEditRange0 _$CompletionListEditRange0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return CompletionListEditRange0(
    value: Range.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$CompletionListEditRange0ToJson(
  CompletionListEditRange0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionListEditRange1 _$CompletionListEditRange1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return CompletionListEditRange1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        insert: Range.fromJson($jsonValue['insert'] as Map<String, dynamic>),
        replace: Range.fromJson($jsonValue['replace'] as Map<String, dynamic>),
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$CompletionListEditRange1ToJson(
  CompletionListEditRange1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'insert': instance.value.insert,
    'replace': instance.value.replace,
  },
  'runtimeType': instance.$type,
};

HoverContents0 _$HoverContents0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return HoverContents0(
    value: MarkupContent.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$HoverContents0ToJson(HoverContents0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

HoverContents1 _$HoverContents1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return HoverContents1(
    value: json['value'],
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$HoverContents1ToJson(HoverContents1 instance) =>
    <String, dynamic>{'value': ?instance.value, 'runtimeType': instance.$type};

HoverContents2 _$HoverContents2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return HoverContents2(
    value: json['value'] as List<dynamic>,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$HoverContents2ToJson(HoverContents2 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceSymbolLocation0 _$WorkspaceSymbolLocation0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceSymbolLocation0(
    value: Location.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceSymbolLocation0ToJson(
  WorkspaceSymbolLocation0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceSymbolLocation1 _$WorkspaceSymbolLocation1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceSymbolLocation1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (uri: $jsonValue['uri'] as String),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceSymbolLocation1ToJson(
  WorkspaceSymbolLocation1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'uri': instance.value.uri},
  'runtimeType': instance.$type,
};

Range0 _$Range0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return Range0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$Range0ToJson(Range0 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

Range1 _$Range1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return Range1(value: (), $type: json['runtimeType'] as String?);
}

Map<String, dynamic> _$Range1ToJson(Range1 instance) => <String, dynamic>{
  'value': <String, dynamic>{},
  'runtimeType': instance.$type,
};

SemanticTokensOptionsFull0 _$SemanticTokensOptionsFull0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return SemanticTokensOptionsFull0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$SemanticTokensOptionsFull0ToJson(
  SemanticTokensOptionsFull0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

SemanticTokensOptionsFull1 _$SemanticTokensOptionsFull1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return SemanticTokensOptionsFull1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (delta: $jsonValue['delta'] as bool?),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$SemanticTokensOptionsFull1ToJson(
  SemanticTokensOptionsFull1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'delta': instance.value.delta},
  'runtimeType': instance.$type,
};

TextDocumentEditEdits0 _$TextDocumentEditEdits0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentEditEdits0(
    value: TextEdit.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentEditEdits0ToJson(
  TextDocumentEditEdits0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentEditEdits1 _$TextDocumentEditEdits1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentEditEdits1(
    value: AnnotatedTextEdit.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentEditEdits1ToJson(
  TextDocumentEditEdits1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ProcessIdOrVersion0 _$ProcessIdOrVersion0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value']);
  return ProcessIdOrVersion0(value: (json['value'] as num).toInt());
}

Map<String, dynamic> _$ProcessIdOrVersion0ToJson(
  ProcessIdOrVersion0 instance,
) => <String, dynamic>{'value': instance.value};

InitializeParamsRootPath0 _$InitializeParamsRootPath0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value']);
  return InitializeParamsRootPath0(value: json['value'] as String);
}

Map<String, dynamic> _$InitializeParamsRootPath0ToJson(
  InitializeParamsRootPath0 instance,
) => <String, dynamic>{'value': instance.value};

InitializeParamsRootUri0 _$InitializeParamsRootUri0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value']);
  return InitializeParamsRootUri0(value: json['value'] as String);
}

Map<String, dynamic> _$InitializeParamsRootUri0ToJson(
  InitializeParamsRootUri0 instance,
) => <String, dynamic>{'value': instance.value};

WorkspaceFoldersInitializeParamsWorkspaceFolders0
_$WorkspaceFoldersInitializeParamsWorkspaceFolders0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value']);
  return WorkspaceFoldersInitializeParamsWorkspaceFolders0(
    value: (json['value'] as List<dynamic>)
        .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WorkspaceFoldersInitializeParamsWorkspaceFolders0ToJson(
  WorkspaceFoldersInitializeParamsWorkspaceFolders0 instance,
) => <String, dynamic>{'value': instance.value};

ServerCapabilitiesTextDocumentSync0
_$ServerCapabilitiesTextDocumentSync0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTextDocumentSync0(
    value: TextDocumentSyncOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTextDocumentSync0ToJson(
  ServerCapabilitiesTextDocumentSync0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTextDocumentSync1
_$ServerCapabilitiesTextDocumentSync1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTextDocumentSync1(
    value: $enumDecode(_$TextDocumentSyncKindEnumMap, json['value']),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTextDocumentSync1ToJson(
  ServerCapabilitiesTextDocumentSync1 instance,
) => <String, dynamic>{
  'value': _$TextDocumentSyncKindEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

const _$TextDocumentSyncKindEnumMap = {
  TextDocumentSyncKind.none: 0,
  TextDocumentSyncKind.full: 1,
  TextDocumentSyncKind.incremental: 2,
};

ServerCapabilitiesNotebookDocumentSync0
_$ServerCapabilitiesNotebookDocumentSync0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesNotebookDocumentSync0(
    value: NotebookDocumentSyncOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesNotebookDocumentSync0ToJson(
  ServerCapabilitiesNotebookDocumentSync0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesNotebookDocumentSync1
_$ServerCapabilitiesNotebookDocumentSync1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesNotebookDocumentSync1(
    value: NotebookDocumentSyncRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesNotebookDocumentSync1ToJson(
  ServerCapabilitiesNotebookDocumentSync1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesHoverProvider0 _$ServerCapabilitiesHoverProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesHoverProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesHoverProvider0ToJson(
  ServerCapabilitiesHoverProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesHoverProvider1 _$ServerCapabilitiesHoverProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesHoverProvider1(
    value: HoverOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesHoverProvider1ToJson(
  ServerCapabilitiesHoverProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDeclarationProvider0
_$ServerCapabilitiesDeclarationProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDeclarationProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDeclarationProvider0ToJson(
  ServerCapabilitiesDeclarationProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDeclarationProvider1
_$ServerCapabilitiesDeclarationProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDeclarationProvider1(
    value: DeclarationOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDeclarationProvider1ToJson(
  ServerCapabilitiesDeclarationProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDeclarationProvider2
_$ServerCapabilitiesDeclarationProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDeclarationProvider2(
    value: DeclarationRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDeclarationProvider2ToJson(
  ServerCapabilitiesDeclarationProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDefinitionProvider0
_$ServerCapabilitiesDefinitionProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDefinitionProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDefinitionProvider0ToJson(
  ServerCapabilitiesDefinitionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDefinitionProvider1
_$ServerCapabilitiesDefinitionProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDefinitionProvider1(
    value: DefinitionOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDefinitionProvider1ToJson(
  ServerCapabilitiesDefinitionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeDefinitionProvider0
_$ServerCapabilitiesTypeDefinitionProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTypeDefinitionProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTypeDefinitionProvider0ToJson(
  ServerCapabilitiesTypeDefinitionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeDefinitionProvider1
_$ServerCapabilitiesTypeDefinitionProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTypeDefinitionProvider1(
    value: TypeDefinitionOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTypeDefinitionProvider1ToJson(
  ServerCapabilitiesTypeDefinitionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeDefinitionProvider2
_$ServerCapabilitiesTypeDefinitionProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTypeDefinitionProvider2(
    value: TypeDefinitionRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTypeDefinitionProvider2ToJson(
  ServerCapabilitiesTypeDefinitionProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesImplementationProvider0
_$ServerCapabilitiesImplementationProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesImplementationProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesImplementationProvider0ToJson(
  ServerCapabilitiesImplementationProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesImplementationProvider1
_$ServerCapabilitiesImplementationProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesImplementationProvider1(
    value: ImplementationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesImplementationProvider1ToJson(
  ServerCapabilitiesImplementationProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesImplementationProvider2
_$ServerCapabilitiesImplementationProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesImplementationProvider2(
    value: ImplementationRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesImplementationProvider2ToJson(
  ServerCapabilitiesImplementationProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesReferencesProvider0
_$ServerCapabilitiesReferencesProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesReferencesProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesReferencesProvider0ToJson(
  ServerCapabilitiesReferencesProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesReferencesProvider1
_$ServerCapabilitiesReferencesProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesReferencesProvider1(
    value: ReferenceOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesReferencesProvider1ToJson(
  ServerCapabilitiesReferencesProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentHighlightProvider0
_$ServerCapabilitiesDocumentHighlightProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentHighlightProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentHighlightProvider0ToJson(
  ServerCapabilitiesDocumentHighlightProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentHighlightProvider1
_$ServerCapabilitiesDocumentHighlightProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentHighlightProvider1(
    value: DocumentHighlightOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentHighlightProvider1ToJson(
  ServerCapabilitiesDocumentHighlightProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentSymbolProvider0
_$ServerCapabilitiesDocumentSymbolProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentSymbolProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentSymbolProvider0ToJson(
  ServerCapabilitiesDocumentSymbolProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentSymbolProvider1
_$ServerCapabilitiesDocumentSymbolProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentSymbolProvider1(
    value: DocumentSymbolOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentSymbolProvider1ToJson(
  ServerCapabilitiesDocumentSymbolProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCodeActionProvider0
_$ServerCapabilitiesCodeActionProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesCodeActionProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesCodeActionProvider0ToJson(
  ServerCapabilitiesCodeActionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCodeActionProvider1
_$ServerCapabilitiesCodeActionProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesCodeActionProvider1(
    value: CodeActionOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesCodeActionProvider1ToJson(
  ServerCapabilitiesCodeActionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesColorProvider0 _$ServerCapabilitiesColorProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesColorProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesColorProvider0ToJson(
  ServerCapabilitiesColorProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesColorProvider1 _$ServerCapabilitiesColorProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesColorProvider1(
    value: DocumentColorOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesColorProvider1ToJson(
  ServerCapabilitiesColorProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesColorProvider2 _$ServerCapabilitiesColorProvider2FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesColorProvider2(
    value: DocumentColorRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesColorProvider2ToJson(
  ServerCapabilitiesColorProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesWorkspaceSymbolProvider0
_$ServerCapabilitiesWorkspaceSymbolProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesWorkspaceSymbolProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesWorkspaceSymbolProvider0ToJson(
  ServerCapabilitiesWorkspaceSymbolProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesWorkspaceSymbolProvider1
_$ServerCapabilitiesWorkspaceSymbolProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesWorkspaceSymbolProvider1(
    value: WorkspaceSymbolOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesWorkspaceSymbolProvider1ToJson(
  ServerCapabilitiesWorkspaceSymbolProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentFormattingProvider0
_$ServerCapabilitiesDocumentFormattingProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentFormattingProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentFormattingProvider0ToJson(
  ServerCapabilitiesDocumentFormattingProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentFormattingProvider1
_$ServerCapabilitiesDocumentFormattingProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentFormattingProvider1(
    value: DocumentFormattingOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentFormattingProvider1ToJson(
  ServerCapabilitiesDocumentFormattingProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentRangeFormattingProvider0
_$ServerCapabilitiesDocumentRangeFormattingProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentRangeFormattingProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentRangeFormattingProvider0ToJson(
  ServerCapabilitiesDocumentRangeFormattingProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentRangeFormattingProvider1
_$ServerCapabilitiesDocumentRangeFormattingProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDocumentRangeFormattingProvider1(
    value: DocumentRangeFormattingOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDocumentRangeFormattingProvider1ToJson(
  ServerCapabilitiesDocumentRangeFormattingProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesRenameProvider0 _$ServerCapabilitiesRenameProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesRenameProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesRenameProvider0ToJson(
  ServerCapabilitiesRenameProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesRenameProvider1 _$ServerCapabilitiesRenameProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesRenameProvider1(
    value: RenameOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesRenameProvider1ToJson(
  ServerCapabilitiesRenameProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesFoldingRangeProvider0
_$ServerCapabilitiesFoldingRangeProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesFoldingRangeProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesFoldingRangeProvider0ToJson(
  ServerCapabilitiesFoldingRangeProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesFoldingRangeProvider1
_$ServerCapabilitiesFoldingRangeProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesFoldingRangeProvider1(
    value: FoldingRangeOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesFoldingRangeProvider1ToJson(
  ServerCapabilitiesFoldingRangeProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesFoldingRangeProvider2
_$ServerCapabilitiesFoldingRangeProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesFoldingRangeProvider2(
    value: FoldingRangeRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesFoldingRangeProvider2ToJson(
  ServerCapabilitiesFoldingRangeProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSelectionRangeProvider0
_$ServerCapabilitiesSelectionRangeProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesSelectionRangeProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesSelectionRangeProvider0ToJson(
  ServerCapabilitiesSelectionRangeProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSelectionRangeProvider1
_$ServerCapabilitiesSelectionRangeProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesSelectionRangeProvider1(
    value: SelectionRangeOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesSelectionRangeProvider1ToJson(
  ServerCapabilitiesSelectionRangeProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSelectionRangeProvider2
_$ServerCapabilitiesSelectionRangeProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesSelectionRangeProvider2(
    value: SelectionRangeRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesSelectionRangeProvider2ToJson(
  ServerCapabilitiesSelectionRangeProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCallHierarchyProvider0
_$ServerCapabilitiesCallHierarchyProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesCallHierarchyProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesCallHierarchyProvider0ToJson(
  ServerCapabilitiesCallHierarchyProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCallHierarchyProvider1
_$ServerCapabilitiesCallHierarchyProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesCallHierarchyProvider1(
    value: CallHierarchyOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesCallHierarchyProvider1ToJson(
  ServerCapabilitiesCallHierarchyProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCallHierarchyProvider2
_$ServerCapabilitiesCallHierarchyProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesCallHierarchyProvider2(
    value: CallHierarchyRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesCallHierarchyProvider2ToJson(
  ServerCapabilitiesCallHierarchyProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesLinkedEditingRangeProvider0
_$ServerCapabilitiesLinkedEditingRangeProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesLinkedEditingRangeProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesLinkedEditingRangeProvider0ToJson(
  ServerCapabilitiesLinkedEditingRangeProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesLinkedEditingRangeProvider1
_$ServerCapabilitiesLinkedEditingRangeProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesLinkedEditingRangeProvider1(
    value: LinkedEditingRangeOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesLinkedEditingRangeProvider1ToJson(
  ServerCapabilitiesLinkedEditingRangeProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesLinkedEditingRangeProvider2
_$ServerCapabilitiesLinkedEditingRangeProvider2FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesLinkedEditingRangeProvider2(
    value: LinkedEditingRangeRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesLinkedEditingRangeProvider2ToJson(
  ServerCapabilitiesLinkedEditingRangeProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSemanticTokensProvider0
_$ServerCapabilitiesSemanticTokensProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesSemanticTokensProvider0(
    value: SemanticTokensOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesSemanticTokensProvider0ToJson(
  ServerCapabilitiesSemanticTokensProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSemanticTokensProvider1
_$ServerCapabilitiesSemanticTokensProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesSemanticTokensProvider1(
    value: SemanticTokensRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesSemanticTokensProvider1ToJson(
  ServerCapabilitiesSemanticTokensProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesMonikerProvider0 _$ServerCapabilitiesMonikerProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesMonikerProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesMonikerProvider0ToJson(
  ServerCapabilitiesMonikerProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesMonikerProvider1 _$ServerCapabilitiesMonikerProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesMonikerProvider1(
    value: MonikerOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesMonikerProvider1ToJson(
  ServerCapabilitiesMonikerProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesMonikerProvider2 _$ServerCapabilitiesMonikerProvider2FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesMonikerProvider2(
    value: MonikerRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesMonikerProvider2ToJson(
  ServerCapabilitiesMonikerProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeHierarchyProvider0
_$ServerCapabilitiesTypeHierarchyProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTypeHierarchyProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTypeHierarchyProvider0ToJson(
  ServerCapabilitiesTypeHierarchyProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeHierarchyProvider1
_$ServerCapabilitiesTypeHierarchyProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTypeHierarchyProvider1(
    value: TypeHierarchyOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTypeHierarchyProvider1ToJson(
  ServerCapabilitiesTypeHierarchyProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeHierarchyProvider2
_$ServerCapabilitiesTypeHierarchyProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesTypeHierarchyProvider2(
    value: TypeHierarchyRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesTypeHierarchyProvider2ToJson(
  ServerCapabilitiesTypeHierarchyProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineValueProvider0
_$ServerCapabilitiesInlineValueProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlineValueProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlineValueProvider0ToJson(
  ServerCapabilitiesInlineValueProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineValueProvider1
_$ServerCapabilitiesInlineValueProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlineValueProvider1(
    value: InlineValueOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlineValueProvider1ToJson(
  ServerCapabilitiesInlineValueProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineValueProvider2
_$ServerCapabilitiesInlineValueProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlineValueProvider2(
    value: InlineValueRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlineValueProvider2ToJson(
  ServerCapabilitiesInlineValueProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlayHintProvider0
_$ServerCapabilitiesInlayHintProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlayHintProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlayHintProvider0ToJson(
  ServerCapabilitiesInlayHintProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlayHintProvider1
_$ServerCapabilitiesInlayHintProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlayHintProvider1(
    value: InlayHintOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlayHintProvider1ToJson(
  ServerCapabilitiesInlayHintProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlayHintProvider2
_$ServerCapabilitiesInlayHintProvider2FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlayHintProvider2(
    value: InlayHintRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlayHintProvider2ToJson(
  ServerCapabilitiesInlayHintProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDiagnosticProvider0
_$ServerCapabilitiesDiagnosticProvider0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDiagnosticProvider0(
    value: DiagnosticOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDiagnosticProvider0ToJson(
  ServerCapabilitiesDiagnosticProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDiagnosticProvider1
_$ServerCapabilitiesDiagnosticProvider1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesDiagnosticProvider1(
    value: DiagnosticRegistrationOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesDiagnosticProvider1ToJson(
  ServerCapabilitiesDiagnosticProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineCompletionProvider0
_$ServerCapabilitiesInlineCompletionProvider0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlineCompletionProvider0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlineCompletionProvider0ToJson(
  ServerCapabilitiesInlineCompletionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineCompletionProvider1
_$ServerCapabilitiesInlineCompletionProvider1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ServerCapabilitiesInlineCompletionProvider1(
    value: InlineCompletionOptions.fromJson(
      json['value'] as Map<String, dynamic>,
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ServerCapabilitiesInlineCompletionProvider1ToJson(
  ServerCapabilitiesInlineCompletionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentSyncOptionsSave0 _$TextDocumentSyncOptionsSave0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentSyncOptionsSave0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentSyncOptionsSave0ToJson(
  TextDocumentSyncOptionsSave0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentSyncOptionsSave1 _$TextDocumentSyncOptionsSave1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return TextDocumentSyncOptionsSave1(
    value: SaveOptions.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$TextDocumentSyncOptionsSave1ToJson(
  TextDocumentSyncOptionsSave1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

NotebookDocumentSyncOptionsNotebookSelector0
_$NotebookDocumentSyncOptionsNotebookSelector0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return NotebookDocumentSyncOptionsNotebookSelector0(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        cells: ($jsonValue['cells'] as List<dynamic>?)
            ?.map(
              (e) => _$recordConvert(
                e,
                ($jsonValue) => (language: $jsonValue['language'] as String),
              ),
            )
            .toList(),
        notebook: $jsonValue['notebook'],
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$NotebookDocumentSyncOptionsNotebookSelector0ToJson(
  NotebookDocumentSyncOptionsNotebookSelector0 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'cells': instance.value.cells
        ?.map((e) => <String, dynamic>{'language': e.language})
        .toList(),
    'notebook': instance.value.notebook,
  },
  'runtimeType': instance.$type,
};

NotebookDocumentSyncOptionsNotebookSelector1
_$NotebookDocumentSyncOptionsNotebookSelector1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return NotebookDocumentSyncOptionsNotebookSelector1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        cells: ($jsonValue['cells'] as List<dynamic>)
            .map(
              (e) => _$recordConvert(
                e,
                ($jsonValue) => (language: $jsonValue['language'] as String),
              ),
            )
            .toList(),
        notebook: $jsonValue['notebook'],
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$NotebookDocumentSyncOptionsNotebookSelector1ToJson(
  NotebookDocumentSyncOptionsNotebookSelector1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'cells': instance.value.cells
        .map((e) => <String, dynamic>{'language': e.language})
        .toList(),
    'notebook': instance.value.notebook,
  },
  'runtimeType': instance.$type,
};

WorkspaceFoldersServerCapabilitiesChangeNotifications0
_$WorkspaceFoldersServerCapabilitiesChangeNotifications0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceFoldersServerCapabilitiesChangeNotifications0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic>
_$WorkspaceFoldersServerCapabilitiesChangeNotifications0ToJson(
  WorkspaceFoldersServerCapabilitiesChangeNotifications0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceFoldersServerCapabilitiesChangeNotifications1
_$WorkspaceFoldersServerCapabilitiesChangeNotifications1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return WorkspaceFoldersServerCapabilitiesChangeNotifications1(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic>
_$WorkspaceFoldersServerCapabilitiesChangeNotifications1ToJson(
  WorkspaceFoldersServerCapabilitiesChangeNotifications1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ParameterInformationLabel0 _$ParameterInformationLabel0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ParameterInformationLabel0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ParameterInformationLabel0ToJson(
  ParameterInformationLabel0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ParameterInformationLabel1 _$ParameterInformationLabel1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return ParameterInformationLabel1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (
        ($jsonValue[r'$1'] as num).toInt(),
        ($jsonValue[r'$2'] as num).toInt(),
      ),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$ParameterInformationLabel1ToJson(
  ParameterInformationLabel1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    r'$1': instance.value.$1,
    r'$2': instance.value.$2,
  },
  'runtimeType': instance.$type,
};

NotebookCellTextDocumentFilterNotebook0
_$NotebookCellTextDocumentFilterNotebook0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return NotebookCellTextDocumentFilterNotebook0(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$NotebookCellTextDocumentFilterNotebook0ToJson(
  NotebookCellTextDocumentFilterNotebook0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

NotebookCellTextDocumentFilterNotebook1
_$NotebookCellTextDocumentFilterNotebook1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return NotebookCellTextDocumentFilterNotebook1(
    value: json['value'],
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$NotebookCellTextDocumentFilterNotebook1ToJson(
  NotebookCellTextDocumentFilterNotebook1 instance,
) => <String, dynamic>{'value': ?instance.value, 'runtimeType': instance.$type};

RelativePatternBaseUri0 _$RelativePatternBaseUri0FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return RelativePatternBaseUri0(
    value: WorkspaceFolder.fromJson(json['value'] as Map<String, dynamic>),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$RelativePatternBaseUri0ToJson(
  RelativePatternBaseUri0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

RelativePatternBaseUri1 _$RelativePatternBaseUri1FromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return RelativePatternBaseUri1(
    value: json['value'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$RelativePatternBaseUri1ToJson(
  RelativePatternBaseUri1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

SemanticTokensClientCapabilitiesFull0
_$SemanticTokensClientCapabilitiesFull0FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return SemanticTokensClientCapabilitiesFull0(
    value: json['value'] as bool,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$SemanticTokensClientCapabilitiesFull0ToJson(
  SemanticTokensClientCapabilitiesFull0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

SemanticTokensClientCapabilitiesFull1
_$SemanticTokensClientCapabilitiesFull1FromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  return SemanticTokensClientCapabilitiesFull1(
    value: _$recordConvert(
      json['value'],
      ($jsonValue) => (delta: $jsonValue['delta'] as bool?),
    ),
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$SemanticTokensClientCapabilitiesFull1ToJson(
  SemanticTokensClientCapabilitiesFull1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'delta': instance.value.delta},
  'runtimeType': instance.$type,
};

_ImplementationParams _$ImplementationParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _ImplementationParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$ImplementationParamsToJson(
  _ImplementationParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_Location _$LocationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri', 'range']);
  return _Location(
    uri: json['uri'] as String,
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'uri': instance.uri,
  'range': instance.range,
};

_ImplementationRegistrationOptions _$ImplementationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _ImplementationRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$ImplementationRegistrationOptionsToJson(
  _ImplementationRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_TypeDefinitionParams _$TypeDefinitionParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _TypeDefinitionParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$TypeDefinitionParamsToJson(
  _TypeDefinitionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_TypeDefinitionRegistrationOptions _$TypeDefinitionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _TypeDefinitionRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$TypeDefinitionRegistrationOptionsToJson(
  _TypeDefinitionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_WorkspaceFolder _$WorkspaceFolderFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri', 'name']);
  return _WorkspaceFolder(
    uri: json['uri'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$WorkspaceFolderToJson(_WorkspaceFolder instance) =>
    <String, dynamic>{'uri': instance.uri, 'name': instance.name};

_DidChangeWorkspaceFoldersParams _$DidChangeWorkspaceFoldersParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['event']);
  return _DidChangeWorkspaceFoldersParams(
    event: WorkspaceFoldersChangeEvent.fromJson(
      json['event'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$DidChangeWorkspaceFoldersParamsToJson(
  _DidChangeWorkspaceFoldersParams instance,
) => <String, dynamic>{'event': instance.event};

_ConfigurationParams _$ConfigurationParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['items']);
  return _ConfigurationParams(
    items: (json['items'] as List<dynamic>)
        .map((e) => ConfigurationItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ConfigurationParamsToJson(
  _ConfigurationParams instance,
) => <String, dynamic>{'items': instance.items};

_DocumentColorParams _$DocumentColorParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  return _DocumentColorParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentColorParamsToJson(
  _DocumentColorParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_ColorInformation _$ColorInformationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'color']);
  return _ColorInformation(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    color: Color.fromJson(json['color'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ColorInformationToJson(_ColorInformation instance) =>
    <String, dynamic>{'range': instance.range, 'color': instance.color};

_DocumentColorRegistrationOptions _$DocumentColorRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _DocumentColorRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentColorRegistrationOptionsToJson(
  _DocumentColorRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_ColorPresentationParams _$ColorPresentationParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'color',
      'range',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _ColorPresentationParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    color: Color.fromJson(json['color'] as Map<String, dynamic>),
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$ColorPresentationParamsToJson(
  _ColorPresentationParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'color': instance.color,
  'range': instance.range,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_ColorPresentation _$ColorPresentationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['label', 'additionalTextEdits', 'textEdit'],
  );
  return _ColorPresentation(
    label: json['label'] as String,
    additionalTextEdits: (json['additionalTextEdits'] as List<dynamic>?)
        ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
        .toList(),
    textEdit: json['textEdit'] == null
        ? null
        : TextEdit.fromJson(json['textEdit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ColorPresentationToJson(_ColorPresentation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'additionalTextEdits': ?instance.additionalTextEdits,
      'textEdit': ?instance.textEdit,
    };

_WorkDoneProgressOptions _$WorkDoneProgressOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _WorkDoneProgressOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$WorkDoneProgressOptionsToJson(
  _WorkDoneProgressOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_TextDocumentRegistrationOptions _$TextDocumentRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['documentSelector']);
  return _TextDocumentRegistrationOptions(
    documentSelector: json['documentSelector'],
  );
}

Map<String, dynamic> _$TextDocumentRegistrationOptionsToJson(
  _TextDocumentRegistrationOptions instance,
) => <String, dynamic>{'documentSelector': ?instance.documentSelector};

_FoldingRangeParams _$FoldingRangeParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  return _FoldingRangeParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$FoldingRangeParamsToJson(_FoldingRangeParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_FoldingRange _$FoldingRangeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'startLine',
      'endLine',
      'collapsedText',
      'kind',
      'endCharacter',
      'startCharacter',
    ],
  );
  return _FoldingRange(
    startLine: (json['startLine'] as num).toInt(),
    endLine: (json['endLine'] as num).toInt(),
    collapsedText: json['collapsedText'] as String?,
    kind: $enumDecodeNullable(_$FoldingRangeKindEnumMap, json['kind']),
    endCharacter: (json['endCharacter'] as num?)?.toInt(),
    startCharacter: (json['startCharacter'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$FoldingRangeToJson(_FoldingRange instance) =>
    <String, dynamic>{
      'startLine': instance.startLine,
      'endLine': instance.endLine,
      'collapsedText': ?instance.collapsedText,
      'kind': ?_$FoldingRangeKindEnumMap[instance.kind],
      'endCharacter': ?instance.endCharacter,
      'startCharacter': ?instance.startCharacter,
    };

const _$FoldingRangeKindEnumMap = {
  FoldingRangeKind.comment: 'comment',
  FoldingRangeKind.imports: 'imports',
  FoldingRangeKind.region: 'region',
};

_FoldingRangeRegistrationOptions _$FoldingRangeRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _FoldingRangeRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$FoldingRangeRegistrationOptionsToJson(
  _FoldingRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DeclarationParams _$DeclarationParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _DeclarationParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DeclarationParamsToJson(_DeclarationParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_DeclarationRegistrationOptions _$DeclarationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _DeclarationRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DeclarationRegistrationOptionsToJson(
  _DeclarationRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_SelectionRangeParams _$SelectionRangeParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'positions',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _SelectionRangeParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    positions: (json['positions'] as List<dynamic>)
        .map((e) => Position.fromJson(e as Map<String, dynamic>))
        .toList(),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$SelectionRangeParamsToJson(
  _SelectionRangeParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'positions': instance.positions,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_SelectionRange _$SelectionRangeFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'parent']);
  return _SelectionRange(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    parent: json['parent'] == null
        ? null
        : SelectionRange.fromJson(json['parent'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SelectionRangeToJson(_SelectionRange instance) =>
    <String, dynamic>{'range': instance.range, 'parent': ?instance.parent};

_SelectionRangeRegistrationOptions _$SelectionRangeRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _SelectionRangeRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$SelectionRangeRegistrationOptionsToJson(
  _SelectionRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_WorkDoneProgressCreateParams _$WorkDoneProgressCreateParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['token']);
  return _WorkDoneProgressCreateParams(token: json['token']);
}

Map<String, dynamic> _$WorkDoneProgressCreateParamsToJson(
  _WorkDoneProgressCreateParams instance,
) => <String, dynamic>{'token': ?instance.token};

_WorkDoneProgressCancelParams _$WorkDoneProgressCancelParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['token']);
  return _WorkDoneProgressCancelParams(token: json['token']);
}

Map<String, dynamic> _$WorkDoneProgressCancelParamsToJson(
  _WorkDoneProgressCancelParams instance,
) => <String, dynamic>{'token': ?instance.token};

_CallHierarchyPrepareParams _$CallHierarchyPrepareParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  return _CallHierarchyPrepareParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$CallHierarchyPrepareParamsToJson(
  _CallHierarchyPrepareParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': ?instance.workDoneToken,
};

_CallHierarchyItem _$CallHierarchyItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'kind',
      'uri',
      'range',
      'selectionRange',
      'data',
      'detail',
      'tags',
    ],
  );
  return _CallHierarchyItem(
    name: json['name'] as String,
    kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
    uri: json['uri'] as String,
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    selectionRange: Range.fromJson(
      json['selectionRange'] as Map<String, dynamic>,
    ),
    data: json['data'],
    detail: json['detail'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$CallHierarchyItemToJson(_CallHierarchyItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'uri': instance.uri,
      'range': instance.range,
      'selectionRange': instance.selectionRange,
      'data': ?instance.data,
      'detail': ?instance.detail,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

const _$SymbolKindEnumMap = {
  SymbolKind.file: 1,
  SymbolKind.module: 2,
  SymbolKind.namespace: 3,
  SymbolKind.package: 4,
  SymbolKind.class_: 5,
  SymbolKind.method: 6,
  SymbolKind.property: 7,
  SymbolKind.field: 8,
  SymbolKind.constructor: 9,
  SymbolKind.enum_: 10,
  SymbolKind.interface_: 11,
  SymbolKind.function: 12,
  SymbolKind.variable: 13,
  SymbolKind.constant: 14,
  SymbolKind.string: 15,
  SymbolKind.number: 16,
  SymbolKind.boolean: 17,
  SymbolKind.array: 18,
  SymbolKind.object: 19,
  SymbolKind.key: 20,
  SymbolKind.null_: 21,
  SymbolKind.enumMember: 22,
  SymbolKind.struct: 23,
  SymbolKind.event: 24,
  SymbolKind.operator_: 25,
  SymbolKind.typeParameter: 26,
};

const _$SymbolTagEnumMap = {SymbolTag.deprecated_: 1};

_CallHierarchyRegistrationOptions _$CallHierarchyRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _CallHierarchyRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CallHierarchyRegistrationOptionsToJson(
  _CallHierarchyRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_CallHierarchyIncomingCallsParams _$CallHierarchyIncomingCallsParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  return _CallHierarchyIncomingCallsParams(
    item: CallHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$CallHierarchyIncomingCallsParamsToJson(
  _CallHierarchyIncomingCallsParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_CallHierarchyIncomingCall _$CallHierarchyIncomingCallFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['from', 'fromRanges']);
  return _CallHierarchyIncomingCall(
    from: CallHierarchyItem.fromJson(json['from'] as Map<String, dynamic>),
    fromRanges: (json['fromRanges'] as List<dynamic>)
        .map((e) => Range.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CallHierarchyIncomingCallToJson(
  _CallHierarchyIncomingCall instance,
) => <String, dynamic>{
  'from': instance.from,
  'fromRanges': instance.fromRanges,
};

_CallHierarchyOutgoingCallsParams _$CallHierarchyOutgoingCallsParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  return _CallHierarchyOutgoingCallsParams(
    item: CallHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$CallHierarchyOutgoingCallsParamsToJson(
  _CallHierarchyOutgoingCallsParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_CallHierarchyOutgoingCall _$CallHierarchyOutgoingCallFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['to', 'fromRanges']);
  return _CallHierarchyOutgoingCall(
    to: CallHierarchyItem.fromJson(json['to'] as Map<String, dynamic>),
    fromRanges: (json['fromRanges'] as List<dynamic>)
        .map((e) => Range.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CallHierarchyOutgoingCallToJson(
  _CallHierarchyOutgoingCall instance,
) => <String, dynamic>{'to': instance.to, 'fromRanges': instance.fromRanges};

_SemanticTokensParams _$SemanticTokensParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  return _SemanticTokensParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$SemanticTokensParamsToJson(
  _SemanticTokensParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_SemanticTokens _$SemanticTokensFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['data', 'resultId']);
  return _SemanticTokens(
    data: (json['data'] as List<dynamic>)
        .map((e) => (e as num).toInt())
        .toList(),
    resultId: json['resultId'] as String?,
  );
}

Map<String, dynamic> _$SemanticTokensToJson(_SemanticTokens instance) =>
    <String, dynamic>{'data': instance.data, 'resultId': ?instance.resultId};

_SemanticTokensPartialResult _$SemanticTokensPartialResultFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['data']);
  return _SemanticTokensPartialResult(
    data: (json['data'] as List<dynamic>)
        .map((e) => (e as num).toInt())
        .toList(),
  );
}

Map<String, dynamic> _$SemanticTokensPartialResultToJson(
  _SemanticTokensPartialResult instance,
) => <String, dynamic>{'data': instance.data};

_SemanticTokensRegistrationOptions _$SemanticTokensRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'legend',
      'id',
      'full',
      'range',
      'workDoneProgress',
    ],
  );
  return _SemanticTokensRegistrationOptions(
    documentSelector: json['documentSelector'],
    legend: SemanticTokensLegend.fromJson(
      json['legend'] as Map<String, dynamic>,
    ),
    id: json['id'] as String?,
    full: json['full'],
    range: json['range'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$SemanticTokensRegistrationOptionsToJson(
  _SemanticTokensRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'legend': instance.legend,
  'id': ?instance.id,
  'full': ?instance.full,
  'range': ?instance.range,
  'workDoneProgress': ?instance.workDoneProgress,
};

_SemanticTokensDeltaParams _$SemanticTokensDeltaParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'previousResultId',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _SemanticTokensDeltaParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    previousResultId: json['previousResultId'] as String,
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$SemanticTokensDeltaParamsToJson(
  _SemanticTokensDeltaParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'previousResultId': instance.previousResultId,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_SemanticTokensDelta _$SemanticTokensDeltaFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['edits', 'resultId']);
  return _SemanticTokensDelta(
    edits: (json['edits'] as List<dynamic>)
        .map((e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>))
        .toList(),
    resultId: json['resultId'] as String?,
  );
}

Map<String, dynamic> _$SemanticTokensDeltaToJson(
  _SemanticTokensDelta instance,
) => <String, dynamic>{'edits': instance.edits, 'resultId': ?instance.resultId};

_SemanticTokensDeltaPartialResult _$SemanticTokensDeltaPartialResultFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['edits']);
  return _SemanticTokensDeltaPartialResult(
    edits: (json['edits'] as List<dynamic>)
        .map((e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SemanticTokensDeltaPartialResultToJson(
  _SemanticTokensDeltaPartialResult instance,
) => <String, dynamic>{'edits': instance.edits};

_SemanticTokensRangeParams _$SemanticTokensRangeParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'range',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _SemanticTokensRangeParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$SemanticTokensRangeParamsToJson(
  _SemanticTokensRangeParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'range': instance.range,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_ShowDocumentParams _$ShowDocumentParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['uri', 'selection', 'takeFocus', 'external'],
  );
  return _ShowDocumentParams(
    uri: json['uri'] as String,
    selection: json['selection'] == null
        ? null
        : Range.fromJson(json['selection'] as Map<String, dynamic>),
    takeFocus: json['takeFocus'] as bool?,
    external: json['external'] as bool?,
  );
}

Map<String, dynamic> _$ShowDocumentParamsToJson(_ShowDocumentParams instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'selection': ?instance.selection,
      'takeFocus': ?instance.takeFocus,
      'external': ?instance.external,
    };

_ShowDocumentResult _$ShowDocumentResultFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['success']);
  return _ShowDocumentResult(success: json['success'] as bool);
}

Map<String, dynamic> _$ShowDocumentResultToJson(_ShowDocumentResult instance) =>
    <String, dynamic>{'success': instance.success};

_LinkedEditingRangeParams _$LinkedEditingRangeParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  return _LinkedEditingRangeParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$LinkedEditingRangeParamsToJson(
  _LinkedEditingRangeParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': ?instance.workDoneToken,
};

_LinkedEditingRanges _$LinkedEditingRangesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['ranges', 'wordPattern']);
  return _LinkedEditingRanges(
    ranges: (json['ranges'] as List<dynamic>)
        .map((e) => Range.fromJson(e as Map<String, dynamic>))
        .toList(),
    wordPattern: json['wordPattern'] as String?,
  );
}

Map<String, dynamic> _$LinkedEditingRangesToJson(
  _LinkedEditingRanges instance,
) => <String, dynamic>{
  'ranges': instance.ranges,
  'wordPattern': ?instance.wordPattern,
};

_LinkedEditingRangeRegistrationOptions
_$LinkedEditingRangeRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _LinkedEditingRangeRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$LinkedEditingRangeRegistrationOptionsToJson(
  _LinkedEditingRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_CreateFilesParams _$CreateFilesParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['files']);
  return _CreateFilesParams(
    files: (json['files'] as List<dynamic>)
        .map((e) => FileCreate.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CreateFilesParamsToJson(_CreateFilesParams instance) =>
    <String, dynamic>{'files': instance.files};

_WorkspaceEdit _$WorkspaceEditFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['changeAnnotations', 'documentChanges', 'changes'],
  );
  return _WorkspaceEdit(
    changeAnnotations: (json['changeAnnotations'] as Map<String, dynamic>?)
        ?.map(
          (k, e) =>
              MapEntry(k, ChangeAnnotation.fromJson(e as Map<String, dynamic>)),
        ),
    documentChanges: json['documentChanges'] as List<dynamic>?,
    changes: (json['changes'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
        k,
        (e as List<dynamic>)
            .map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    ),
  );
}

Map<String, dynamic> _$WorkspaceEditToJson(_WorkspaceEdit instance) =>
    <String, dynamic>{
      'changeAnnotations': ?instance.changeAnnotations,
      'documentChanges': ?instance.documentChanges,
      'changes': ?instance.changes,
    };

_FileOperationRegistrationOptions _$FileOperationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['filters']);
  return _FileOperationRegistrationOptions(
    filters: (json['filters'] as List<dynamic>)
        .map((e) => FileOperationFilter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FileOperationRegistrationOptionsToJson(
  _FileOperationRegistrationOptions instance,
) => <String, dynamic>{'filters': instance.filters};

_RenameFilesParams _$RenameFilesParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['files']);
  return _RenameFilesParams(
    files: (json['files'] as List<dynamic>)
        .map((e) => FileRename.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RenameFilesParamsToJson(_RenameFilesParams instance) =>
    <String, dynamic>{'files': instance.files};

_DeleteFilesParams _$DeleteFilesParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['files']);
  return _DeleteFilesParams(
    files: (json['files'] as List<dynamic>)
        .map((e) => FileDelete.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DeleteFilesParamsToJson(_DeleteFilesParams instance) =>
    <String, dynamic>{'files': instance.files};

_MonikerParams _$MonikerParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _MonikerParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$MonikerParamsToJson(_MonikerParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_Moniker _$MonikerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['scheme', 'identifier', 'unique', 'kind'],
  );
  return _Moniker(
    scheme: json['scheme'] as String,
    identifier: json['identifier'] as String,
    unique: $enumDecode(_$UniquenessLevelEnumMap, json['unique']),
    kind: $enumDecodeNullable(_$MonikerKindEnumMap, json['kind']),
  );
}

Map<String, dynamic> _$MonikerToJson(_Moniker instance) => <String, dynamic>{
  'scheme': instance.scheme,
  'identifier': instance.identifier,
  'unique': _$UniquenessLevelEnumMap[instance.unique]!,
  'kind': ?_$MonikerKindEnumMap[instance.kind],
};

const _$UniquenessLevelEnumMap = {
  UniquenessLevel.document: 'document',
  UniquenessLevel.project: 'project',
  UniquenessLevel.group: 'group',
  UniquenessLevel.scheme: 'scheme',
  UniquenessLevel.global: 'global',
};

const _$MonikerKindEnumMap = {
  MonikerKind.import: 'import',
  MonikerKind.export: 'export',
  MonikerKind.local: 'local',
};

_MonikerRegistrationOptions _$MonikerRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  return _MonikerRegistrationOptions(
    documentSelector: json['documentSelector'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$MonikerRegistrationOptionsToJson(
  _MonikerRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_TypeHierarchyPrepareParams _$TypeHierarchyPrepareParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  return _TypeHierarchyPrepareParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$TypeHierarchyPrepareParamsToJson(
  _TypeHierarchyPrepareParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': ?instance.workDoneToken,
};

_TypeHierarchyItem _$TypeHierarchyItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'kind',
      'uri',
      'range',
      'selectionRange',
      'data',
      'detail',
      'tags',
    ],
  );
  return _TypeHierarchyItem(
    name: json['name'] as String,
    kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
    uri: json['uri'] as String,
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    selectionRange: Range.fromJson(
      json['selectionRange'] as Map<String, dynamic>,
    ),
    data: json['data'],
    detail: json['detail'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$TypeHierarchyItemToJson(_TypeHierarchyItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'uri': instance.uri,
      'range': instance.range,
      'selectionRange': instance.selectionRange,
      'data': ?instance.data,
      'detail': ?instance.detail,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

_TypeHierarchyRegistrationOptions _$TypeHierarchyRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _TypeHierarchyRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$TypeHierarchyRegistrationOptionsToJson(
  _TypeHierarchyRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_TypeHierarchySupertypesParams _$TypeHierarchySupertypesParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  return _TypeHierarchySupertypesParams(
    item: TypeHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$TypeHierarchySupertypesParamsToJson(
  _TypeHierarchySupertypesParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_TypeHierarchySubtypesParams _$TypeHierarchySubtypesParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  return _TypeHierarchySubtypesParams(
    item: TypeHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$TypeHierarchySubtypesParamsToJson(
  _TypeHierarchySubtypesParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_InlineValueParams _$InlineValueParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'range', 'context', 'workDoneToken'],
  );
  return _InlineValueParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    context: InlineValueContext.fromJson(
      json['context'] as Map<String, dynamic>,
    ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$InlineValueParamsToJson(_InlineValueParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'range': instance.range,
      'context': instance.context,
      'workDoneToken': ?instance.workDoneToken,
    };

_InlineValueRegistrationOptions _$InlineValueRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _InlineValueRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$InlineValueRegistrationOptionsToJson(
  _InlineValueRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_InlayHintParams _$InlayHintParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'range', 'workDoneToken'],
  );
  return _InlayHintParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$InlayHintParamsToJson(_InlayHintParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'range': instance.range,
      'workDoneToken': ?instance.workDoneToken,
    };

_InlayHint _$InlayHintFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'position',
      'label',
      'data',
      'paddingRight',
      'paddingLeft',
      'tooltip',
      'textEdits',
      'kind',
    ],
  );
  return _InlayHint(
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    label: json['label'],
    data: json['data'],
    paddingRight: json['paddingRight'] as bool?,
    paddingLeft: json['paddingLeft'] as bool?,
    tooltip: json['tooltip'],
    textEdits: (json['textEdits'] as List<dynamic>?)
        ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
        .toList(),
    kind: $enumDecodeNullable(_$InlayHintKindEnumMap, json['kind']),
  );
}

Map<String, dynamic> _$InlayHintToJson(_InlayHint instance) =>
    <String, dynamic>{
      'position': instance.position,
      'label': ?instance.label,
      'data': ?instance.data,
      'paddingRight': ?instance.paddingRight,
      'paddingLeft': ?instance.paddingLeft,
      'tooltip': ?instance.tooltip,
      'textEdits': ?instance.textEdits,
      'kind': ?_$InlayHintKindEnumMap[instance.kind],
    };

const _$InlayHintKindEnumMap = {
  InlayHintKind.type: 1,
  InlayHintKind.parameter: 2,
};

_InlayHintRegistrationOptions _$InlayHintRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'id',
      'resolveProvider',
      'workDoneProgress',
    ],
  );
  return _InlayHintRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$InlayHintRegistrationOptionsToJson(
  _InlayHintRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'resolveProvider': ?instance.resolveProvider,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentDiagnosticParams _$DocumentDiagnosticParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'previousResultId',
      'identifier',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _DocumentDiagnosticParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    previousResultId: json['previousResultId'] as String?,
    identifier: json['identifier'] as String?,
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentDiagnosticParamsToJson(
  _DocumentDiagnosticParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'previousResultId': ?instance.previousResultId,
  'identifier': ?instance.identifier,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_DocumentDiagnosticReportPartialResult
_$DocumentDiagnosticReportPartialResultFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['relatedDocuments']);
  return _DocumentDiagnosticReportPartialResult(
    relatedDocuments: json['relatedDocuments'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$DocumentDiagnosticReportPartialResultToJson(
  _DocumentDiagnosticReportPartialResult instance,
) => <String, dynamic>{'relatedDocuments': instance.relatedDocuments};

_DiagnosticServerCancellationData _$DiagnosticServerCancellationDataFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['retriggerRequest']);
  return _DiagnosticServerCancellationData(
    retriggerRequest: json['retriggerRequest'] as bool,
  );
}

Map<String, dynamic> _$DiagnosticServerCancellationDataToJson(
  _DiagnosticServerCancellationData instance,
) => <String, dynamic>{'retriggerRequest': instance.retriggerRequest};

_DiagnosticRegistrationOptions _$DiagnosticRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'interFileDependencies',
      'workspaceDiagnostics',
      'id',
      'identifier',
      'workDoneProgress',
    ],
  );
  return _DiagnosticRegistrationOptions(
    documentSelector: json['documentSelector'],
    interFileDependencies: json['interFileDependencies'] as bool,
    workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
    id: json['id'] as String?,
    identifier: json['identifier'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DiagnosticRegistrationOptionsToJson(
  _DiagnosticRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'interFileDependencies': instance.interFileDependencies,
  'workspaceDiagnostics': instance.workspaceDiagnostics,
  'id': ?instance.id,
  'identifier': ?instance.identifier,
  'workDoneProgress': ?instance.workDoneProgress,
};

_WorkspaceDiagnosticParams _$WorkspaceDiagnosticParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'previousResultIds',
      'identifier',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _WorkspaceDiagnosticParams(
    previousResultIds: (json['previousResultIds'] as List<dynamic>)
        .map((e) => PreviousResultId.fromJson(e as Map<String, dynamic>))
        .toList(),
    identifier: json['identifier'] as String?,
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$WorkspaceDiagnosticParamsToJson(
  _WorkspaceDiagnosticParams instance,
) => <String, dynamic>{
  'previousResultIds': instance.previousResultIds,
  'identifier': ?instance.identifier,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_WorkspaceDiagnosticReport _$WorkspaceDiagnosticReportFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['items']);
  return _WorkspaceDiagnosticReport(items: json['items'] as List<dynamic>);
}

Map<String, dynamic> _$WorkspaceDiagnosticReportToJson(
  _WorkspaceDiagnosticReport instance,
) => <String, dynamic>{'items': instance.items};

_WorkspaceDiagnosticReportPartialResult
_$WorkspaceDiagnosticReportPartialResultFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['items']);
  return _WorkspaceDiagnosticReportPartialResult(
    items: json['items'] as List<dynamic>,
  );
}

Map<String, dynamic> _$WorkspaceDiagnosticReportPartialResultToJson(
  _WorkspaceDiagnosticReportPartialResult instance,
) => <String, dynamic>{'items': instance.items};

_DidOpenNotebookDocumentParams _$DidOpenNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['notebookDocument', 'cellTextDocuments'],
  );
  return _DidOpenNotebookDocumentParams(
    notebookDocument: NotebookDocument.fromJson(
      json['notebookDocument'] as Map<String, dynamic>,
    ),
    cellTextDocuments: (json['cellTextDocuments'] as List<dynamic>)
        .map((e) => TextDocumentItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DidOpenNotebookDocumentParamsToJson(
  _DidOpenNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument,
  'cellTextDocuments': instance.cellTextDocuments,
};

_DidChangeNotebookDocumentParams _$DidChangeNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['notebookDocument', 'change']);
  return _DidChangeNotebookDocumentParams(
    notebookDocument: VersionedNotebookDocumentIdentifier.fromJson(
      json['notebookDocument'] as Map<String, dynamic>,
    ),
    change: NotebookDocumentChangeEvent.fromJson(
      json['change'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$DidChangeNotebookDocumentParamsToJson(
  _DidChangeNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument,
  'change': instance.change,
};

_DidSaveNotebookDocumentParams _$DidSaveNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['notebookDocument']);
  return _DidSaveNotebookDocumentParams(
    notebookDocument: NotebookDocumentIdentifier.fromJson(
      json['notebookDocument'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$DidSaveNotebookDocumentParamsToJson(
  _DidSaveNotebookDocumentParams instance,
) => <String, dynamic>{'notebookDocument': instance.notebookDocument};

_DidCloseNotebookDocumentParams _$DidCloseNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['notebookDocument', 'cellTextDocuments'],
  );
  return _DidCloseNotebookDocumentParams(
    notebookDocument: NotebookDocumentIdentifier.fromJson(
      json['notebookDocument'] as Map<String, dynamic>,
    ),
    cellTextDocuments: (json['cellTextDocuments'] as List<dynamic>)
        .map((e) => TextDocumentIdentifier.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DidCloseNotebookDocumentParamsToJson(
  _DidCloseNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument,
  'cellTextDocuments': instance.cellTextDocuments,
};

_InlineCompletionParams _$InlineCompletionParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'context', 'workDoneToken'],
  );
  return _InlineCompletionParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    context: InlineCompletionContext.fromJson(
      json['context'] as Map<String, dynamic>,
    ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$InlineCompletionParamsToJson(
  _InlineCompletionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'context': instance.context,
  'workDoneToken': ?instance.workDoneToken,
};

_InlineCompletionList _$InlineCompletionListFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['items']);
  return _InlineCompletionList(
    items: (json['items'] as List<dynamic>)
        .map((e) => InlineCompletionItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InlineCompletionListToJson(
  _InlineCompletionList instance,
) => <String, dynamic>{'items': instance.items};

_InlineCompletionItem _$InlineCompletionItemFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['insertText', 'command', 'range', 'filterText'],
  );
  return _InlineCompletionItem(
    insertText: json['insertText'],
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, dynamic>),
    range: json['range'] == null
        ? null
        : Range.fromJson(json['range'] as Map<String, dynamic>),
    filterText: json['filterText'] as String?,
  );
}

Map<String, dynamic> _$InlineCompletionItemToJson(
  _InlineCompletionItem instance,
) => <String, dynamic>{
  'insertText': ?instance.insertText,
  'command': ?instance.command,
  'range': ?instance.range,
  'filterText': ?instance.filterText,
};

_InlineCompletionRegistrationOptions
_$InlineCompletionRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  return _InlineCompletionRegistrationOptions(
    documentSelector: json['documentSelector'],
    id: json['id'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$InlineCompletionRegistrationOptionsToJson(
  _InlineCompletionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
  'workDoneProgress': ?instance.workDoneProgress,
};

_RegistrationParams _$RegistrationParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['registrations']);
  return _RegistrationParams(
    registrations: (json['registrations'] as List<dynamic>)
        .map((e) => Registration.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RegistrationParamsToJson(_RegistrationParams instance) =>
    <String, dynamic>{'registrations': instance.registrations};

_UnregistrationParams _$UnregistrationParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['unregisterations']);
  return _UnregistrationParams(
    unregisterations: (json['unregisterations'] as List<dynamic>)
        .map((e) => Unregistration.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UnregistrationParamsToJson(
  _UnregistrationParams instance,
) => <String, dynamic>{'unregisterations': instance.unregisterations};

_InitializeParams _$InitializeParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'processId',
      'rootUri',
      'capabilities',
      'workspaceFolders',
      'trace',
      'initializationOptions',
      'rootPath',
      'locale',
      'clientInfo',
      'workDoneToken',
    ],
  );
  return _InitializeParams(
    processId: json['processId'],
    rootUri: json['rootUri'],
    capabilities: ClientCapabilities.fromJson(
      json['capabilities'] as Map<String, dynamic>,
    ),
    workspaceFolders: json['workspaceFolders'],
    trace: $enumDecodeNullable(_$TraceValuesEnumMap, json['trace']),
    initializationOptions: json['initializationOptions'],
    rootPath: json['rootPath'],
    locale: json['locale'] as String?,
    clientInfo: _$recordConvertNullable(
      json['clientInfo'],
      ($jsonValue) => (
        name: $jsonValue['name'] as String,
        version: $jsonValue['version'] as String?,
      ),
    ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$InitializeParamsToJson(_InitializeParams instance) =>
    <String, dynamic>{
      'processId': ?instance.processId,
      'rootUri': ?instance.rootUri,
      'capabilities': instance.capabilities,
      'workspaceFolders': ?instance.workspaceFolders,
      'trace': ?_$TraceValuesEnumMap[instance.trace],
      'initializationOptions': ?instance.initializationOptions,
      'rootPath': ?instance.rootPath,
      'locale': ?instance.locale,
      'clientInfo': ?instance.clientInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.clientInfo!.name,
              'version': instance.clientInfo!.version,
            },
      'workDoneToken': ?instance.workDoneToken,
    };

const _$TraceValuesEnumMap = {
  TraceValues.off: 'off',
  TraceValues.messages: 'messages',
  TraceValues.verbose: 'verbose',
};

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) => value == null ? null : convert(value as Map<String, dynamic>);

_InitializeResult _$InitializeResultFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['capabilities', 'serverInfo']);
  return _InitializeResult(
    capabilities: ServerCapabilities.fromJson(
      json['capabilities'] as Map<String, dynamic>,
    ),
    serverInfo: _$recordConvertNullable(
      json['serverInfo'],
      ($jsonValue) => (
        name: $jsonValue['name'] as String,
        version: $jsonValue['version'] as String?,
      ),
    ),
  );
}

Map<String, dynamic> _$InitializeResultToJson(_InitializeResult instance) =>
    <String, dynamic>{
      'capabilities': instance.capabilities,
      'serverInfo': ?instance.serverInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.serverInfo!.name,
              'version': instance.serverInfo!.version,
            },
    };

_InitializeError _$InitializeErrorFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['retry']);
  return _InitializeError(retry: json['retry'] as bool);
}

Map<String, dynamic> _$InitializeErrorToJson(_InitializeError instance) =>
    <String, dynamic>{'retry': instance.retry};

_InitializedParams _$InitializedParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const []);
  return _InitializedParams();
}

Map<String, dynamic> _$InitializedParamsToJson(_InitializedParams instance) =>
    <String, dynamic>{};

_DidChangeConfigurationParams _$DidChangeConfigurationParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['settings']);
  return _DidChangeConfigurationParams(settings: json['settings']);
}

Map<String, dynamic> _$DidChangeConfigurationParamsToJson(
  _DidChangeConfigurationParams instance,
) => <String, dynamic>{'settings': ?instance.settings};

_DidChangeConfigurationRegistrationOptions
_$DidChangeConfigurationRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['section']);
  return _DidChangeConfigurationRegistrationOptions(section: json['section']);
}

Map<String, dynamic> _$DidChangeConfigurationRegistrationOptionsToJson(
  _DidChangeConfigurationRegistrationOptions instance,
) => <String, dynamic>{'section': ?instance.section};

_ShowMessageParams _$ShowMessageParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['type', 'message']);
  return _ShowMessageParams(
    type: $enumDecode(_$MessageTypeEnumMap, json['type']),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ShowMessageParamsToJson(_ShowMessageParams instance) =>
    <String, dynamic>{
      'type': _$MessageTypeEnumMap[instance.type]!,
      'message': instance.message,
    };

const _$MessageTypeEnumMap = {
  MessageType.error: 1,
  MessageType.warning: 2,
  MessageType.info: 3,
  MessageType.log: 4,
  MessageType.debug: 5,
};

_ShowMessageRequestParams _$ShowMessageRequestParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['type', 'message', 'actions']);
  return _ShowMessageRequestParams(
    type: $enumDecode(_$MessageTypeEnumMap, json['type']),
    message: json['message'] as String,
    actions: (json['actions'] as List<dynamic>?)
        ?.map((e) => MessageActionItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShowMessageRequestParamsToJson(
  _ShowMessageRequestParams instance,
) => <String, dynamic>{
  'type': _$MessageTypeEnumMap[instance.type]!,
  'message': instance.message,
  'actions': ?instance.actions,
};

_MessageActionItem _$MessageActionItemFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['title']);
  return _MessageActionItem(title: json['title'] as String);
}

Map<String, dynamic> _$MessageActionItemToJson(_MessageActionItem instance) =>
    <String, dynamic>{'title': instance.title};

_LogMessageParams _$LogMessageParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['type', 'message']);
  return _LogMessageParams(
    type: $enumDecode(_$MessageTypeEnumMap, json['type']),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$LogMessageParamsToJson(_LogMessageParams instance) =>
    <String, dynamic>{
      'type': _$MessageTypeEnumMap[instance.type]!,
      'message': instance.message,
    };

_DidOpenTextDocumentParams _$DidOpenTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['textDocument']);
  return _DidOpenTextDocumentParams(
    textDocument: TextDocumentItem.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$DidOpenTextDocumentParamsToJson(
  _DidOpenTextDocumentParams instance,
) => <String, dynamic>{'textDocument': instance.textDocument};

_DidChangeTextDocumentParams _$DidChangeTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'contentChanges']);
  return _DidChangeTextDocumentParams(
    textDocument: VersionedTextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    contentChanges: json['contentChanges'] as List<dynamic>,
  );
}

Map<String, dynamic> _$DidChangeTextDocumentParamsToJson(
  _DidChangeTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'contentChanges': instance.contentChanges,
};

_TextDocumentChangeRegistrationOptions
_$TextDocumentChangeRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'syncKind']);
  return _TextDocumentChangeRegistrationOptions(
    documentSelector: json['documentSelector'],
    syncKind: $enumDecode(_$TextDocumentSyncKindEnumMap, json['syncKind']),
  );
}

Map<String, dynamic> _$TextDocumentChangeRegistrationOptionsToJson(
  _TextDocumentChangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'syncKind': _$TextDocumentSyncKindEnumMap[instance.syncKind]!,
};

_DidCloseTextDocumentParams _$DidCloseTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['textDocument']);
  return _DidCloseTextDocumentParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$DidCloseTextDocumentParamsToJson(
  _DidCloseTextDocumentParams instance,
) => <String, dynamic>{'textDocument': instance.textDocument};

_DidSaveTextDocumentParams _$DidSaveTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'text']);
  return _DidSaveTextDocumentParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    text: json['text'] as String?,
  );
}

Map<String, dynamic> _$DidSaveTextDocumentParamsToJson(
  _DidSaveTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'text': ?instance.text,
};

_TextDocumentSaveRegistrationOptions
_$TextDocumentSaveRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'includeText']);
  return _TextDocumentSaveRegistrationOptions(
    documentSelector: json['documentSelector'],
    includeText: json['includeText'] as bool?,
  );
}

Map<String, dynamic> _$TextDocumentSaveRegistrationOptionsToJson(
  _TextDocumentSaveRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'includeText': ?instance.includeText,
};

_WillSaveTextDocumentParams _$WillSaveTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'reason']);
  return _WillSaveTextDocumentParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    reason: $enumDecode(_$TextDocumentSaveReasonEnumMap, json['reason']),
  );
}

Map<String, dynamic> _$WillSaveTextDocumentParamsToJson(
  _WillSaveTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'reason': _$TextDocumentSaveReasonEnumMap[instance.reason]!,
};

const _$TextDocumentSaveReasonEnumMap = {
  TextDocumentSaveReason.manual: 1,
  TextDocumentSaveReason.afterDelay: 2,
  TextDocumentSaveReason.focusOut: 3,
};

_TextEdit _$TextEditFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'newText']);
  return _TextEdit(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    newText: json['newText'] as String,
  );
}

Map<String, dynamic> _$TextEditToJson(_TextEdit instance) => <String, dynamic>{
  'range': instance.range,
  'newText': instance.newText,
};

_DidChangeWatchedFilesParams _$DidChangeWatchedFilesParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['changes']);
  return _DidChangeWatchedFilesParams(
    changes: (json['changes'] as List<dynamic>)
        .map((e) => FileEvent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DidChangeWatchedFilesParamsToJson(
  _DidChangeWatchedFilesParams instance,
) => <String, dynamic>{'changes': instance.changes};

_DidChangeWatchedFilesRegistrationOptions
_$DidChangeWatchedFilesRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['watchers']);
  return _DidChangeWatchedFilesRegistrationOptions(
    watchers: (json['watchers'] as List<dynamic>)
        .map((e) => FileSystemWatcher.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DidChangeWatchedFilesRegistrationOptionsToJson(
  _DidChangeWatchedFilesRegistrationOptions instance,
) => <String, dynamic>{'watchers': instance.watchers};

_PublishDiagnosticsParams _$PublishDiagnosticsParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['uri', 'diagnostics', 'version']);
  return _PublishDiagnosticsParams(
    uri: json['uri'] as String,
    diagnostics: (json['diagnostics'] as List<dynamic>)
        .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
        .toList(),
    version: (json['version'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$PublishDiagnosticsParamsToJson(
  _PublishDiagnosticsParams instance,
) => <String, dynamic>{
  'uri': instance.uri,
  'diagnostics': instance.diagnostics,
  'version': ?instance.version,
};

_CompletionParams _$CompletionParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'context',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _CompletionParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    context: json['context'] == null
        ? null
        : CompletionContext.fromJson(json['context'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$CompletionParamsToJson(_CompletionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'context': ?instance.context,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_CompletionItem _$CompletionItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'label',
      'data',
      'command',
      'commitCharacters',
      'additionalTextEdits',
      'textEditText',
      'textEdit',
      'insertTextMode',
      'insertTextFormat',
      'insertText',
      'filterText',
      'sortText',
      'preselect',
      'deprecated',
      'documentation',
      'detail',
      'tags',
      'kind',
      'labelDetails',
    ],
  );
  return _CompletionItem(
    label: json['label'] as String,
    data: json['data'],
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, dynamic>),
    commitCharacters: (json['commitCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    additionalTextEdits: (json['additionalTextEdits'] as List<dynamic>?)
        ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
        .toList(),
    textEditText: json['textEditText'] as String?,
    textEdit: json['textEdit'],
    insertTextMode: $enumDecodeNullable(
      _$InsertTextModeEnumMap,
      json['insertTextMode'],
    ),
    insertTextFormat: $enumDecodeNullable(
      _$InsertTextFormatEnumMap,
      json['insertTextFormat'],
    ),
    insertText: json['insertText'] as String?,
    filterText: json['filterText'] as String?,
    sortText: json['sortText'] as String?,
    preselect: json['preselect'] as bool?,
    deprecated: json['deprecated'] as bool?,
    documentation: json['documentation'],
    detail: json['detail'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$CompletionItemTagEnumMap, e))
        .toList(),
    kind: $enumDecodeNullable(_$CompletionItemKindEnumMap, json['kind']),
    labelDetails: json['labelDetails'] == null
        ? null
        : CompletionItemLabelDetails.fromJson(
            json['labelDetails'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$CompletionItemToJson(
  _CompletionItem instance,
) => <String, dynamic>{
  'label': instance.label,
  'data': ?instance.data,
  'command': ?instance.command,
  'commitCharacters': ?instance.commitCharacters,
  'additionalTextEdits': ?instance.additionalTextEdits,
  'textEditText': ?instance.textEditText,
  'textEdit': ?instance.textEdit,
  'insertTextMode': ?_$InsertTextModeEnumMap[instance.insertTextMode],
  'insertTextFormat': ?_$InsertTextFormatEnumMap[instance.insertTextFormat],
  'insertText': ?instance.insertText,
  'filterText': ?instance.filterText,
  'sortText': ?instance.sortText,
  'preselect': ?instance.preselect,
  'deprecated': ?instance.deprecated,
  'documentation': ?instance.documentation,
  'detail': ?instance.detail,
  'tags': ?instance.tags?.map((e) => _$CompletionItemTagEnumMap[e]!).toList(),
  'kind': ?_$CompletionItemKindEnumMap[instance.kind],
  'labelDetails': ?instance.labelDetails,
};

const _$InsertTextModeEnumMap = {
  InsertTextMode.asIs: 1,
  InsertTextMode.adjustIndentation: 2,
};

const _$InsertTextFormatEnumMap = {
  InsertTextFormat.plainText: 1,
  InsertTextFormat.snippet: 2,
};

const _$CompletionItemTagEnumMap = {CompletionItemTag.deprecated_: 1};

const _$CompletionItemKindEnumMap = {
  CompletionItemKind.text: 1,
  CompletionItemKind.method: 2,
  CompletionItemKind.function: 3,
  CompletionItemKind.constructor: 4,
  CompletionItemKind.field: 5,
  CompletionItemKind.variable: 6,
  CompletionItemKind.class_: 7,
  CompletionItemKind.interface_: 8,
  CompletionItemKind.module: 9,
  CompletionItemKind.property: 10,
  CompletionItemKind.unit: 11,
  CompletionItemKind.value_: 12,
  CompletionItemKind.enum_: 13,
  CompletionItemKind.keyword: 14,
  CompletionItemKind.snippet: 15,
  CompletionItemKind.color: 16,
  CompletionItemKind.file: 17,
  CompletionItemKind.reference: 18,
  CompletionItemKind.folder: 19,
  CompletionItemKind.enumMember: 20,
  CompletionItemKind.constant: 21,
  CompletionItemKind.struct: 22,
  CompletionItemKind.event: 23,
  CompletionItemKind.operator_: 24,
  CompletionItemKind.typeParameter: 25,
};

_CompletionList _$CompletionListFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['isIncomplete', 'items', 'itemDefaults'],
  );
  return _CompletionList(
    isIncomplete: json['isIncomplete'] as bool,
    items: (json['items'] as List<dynamic>)
        .map((e) => CompletionItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    itemDefaults: _$recordConvertNullable(
      json['itemDefaults'],
      ($jsonValue) => (
        commitCharacters: ($jsonValue['commitCharacters'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        data: $jsonValue['data'],
        editRange: $jsonValue['editRange'],
        insertTextFormat: $enumDecodeNullable(
          _$InsertTextFormatEnumMap,
          $jsonValue['insertTextFormat'],
        ),
        insertTextMode: $enumDecodeNullable(
          _$InsertTextModeEnumMap,
          $jsonValue['insertTextMode'],
        ),
      ),
    ),
  );
}

Map<String, dynamic> _$CompletionListToJson(
  _CompletionList instance,
) => <String, dynamic>{
  'isIncomplete': instance.isIncomplete,
  'items': instance.items,
  'itemDefaults': ?instance.itemDefaults == null
      ? null
      : <String, dynamic>{
          'commitCharacters': instance.itemDefaults!.commitCharacters,
          'data': instance.itemDefaults!.data,
          'editRange': instance.itemDefaults!.editRange,
          'insertTextFormat':
              _$InsertTextFormatEnumMap[instance
                  .itemDefaults!
                  .insertTextFormat],
          'insertTextMode':
              _$InsertTextModeEnumMap[instance.itemDefaults!.insertTextMode],
        },
};

_CompletionRegistrationOptions _$CompletionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'completionItem',
      'resolveProvider',
      'allCommitCharacters',
      'triggerCharacters',
      'workDoneProgress',
    ],
  );
  return _CompletionRegistrationOptions(
    documentSelector: json['documentSelector'],
    completionItem: _$recordConvertNullable(
      json['completionItem'],
      ($jsonValue) =>
          (labelDetailsSupport: $jsonValue['labelDetailsSupport'] as bool?),
    ),
    resolveProvider: json['resolveProvider'] as bool?,
    allCommitCharacters: (json['allCommitCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CompletionRegistrationOptionsToJson(
  _CompletionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'completionItem': ?instance.completionItem == null
      ? null
      : <String, dynamic>{
          'labelDetailsSupport': instance.completionItem!.labelDetailsSupport,
        },
  'resolveProvider': ?instance.resolveProvider,
  'allCommitCharacters': ?instance.allCommitCharacters,
  'triggerCharacters': ?instance.triggerCharacters,
  'workDoneProgress': ?instance.workDoneProgress,
};

_HoverParams _$HoverParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  return _HoverParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$HoverParamsToJson(_HoverParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'workDoneToken': ?instance.workDoneToken,
    };

_Hover _$HoverFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['contents', 'range']);
  return _Hover(
    contents: json['contents'],
    range: json['range'] == null
        ? null
        : Range.fromJson(json['range'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HoverToJson(_Hover instance) => <String, dynamic>{
  'contents': ?instance.contents,
  'range': ?instance.range,
};

_HoverRegistrationOptions _$HoverRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  return _HoverRegistrationOptions(
    documentSelector: json['documentSelector'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$HoverRegistrationOptionsToJson(
  _HoverRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_SignatureHelpParams _$SignatureHelpParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'context', 'workDoneToken'],
  );
  return _SignatureHelpParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    context: json['context'] == null
        ? null
        : SignatureHelpContext.fromJson(
            json['context'] as Map<String, dynamic>,
          ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$SignatureHelpParamsToJson(
  _SignatureHelpParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'context': ?instance.context,
  'workDoneToken': ?instance.workDoneToken,
};

_SignatureHelp _$SignatureHelpFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['signatures', 'activeParameter', 'activeSignature'],
  );
  return _SignatureHelp(
    signatures: (json['signatures'] as List<dynamic>)
        .map((e) => SignatureInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
    activeParameter: (json['activeParameter'] as num?)?.toInt(),
    activeSignature: (json['activeSignature'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$SignatureHelpToJson(_SignatureHelp instance) =>
    <String, dynamic>{
      'signatures': instance.signatures,
      'activeParameter': ?instance.activeParameter,
      'activeSignature': ?instance.activeSignature,
    };

_SignatureHelpRegistrationOptions _$SignatureHelpRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'retriggerCharacters',
      'triggerCharacters',
      'workDoneProgress',
    ],
  );
  return _SignatureHelpRegistrationOptions(
    documentSelector: json['documentSelector'],
    retriggerCharacters: (json['retriggerCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$SignatureHelpRegistrationOptionsToJson(
  _SignatureHelpRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'retriggerCharacters': ?instance.retriggerCharacters,
  'triggerCharacters': ?instance.triggerCharacters,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DefinitionParams _$DefinitionParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _DefinitionParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DefinitionParamsToJson(_DefinitionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_DefinitionRegistrationOptions _$DefinitionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  return _DefinitionRegistrationOptions(
    documentSelector: json['documentSelector'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DefinitionRegistrationOptionsToJson(
  _DefinitionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_ReferenceParams _$ReferenceParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'context',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _ReferenceParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    context: ReferenceContext.fromJson(json['context'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$ReferenceParamsToJson(_ReferenceParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'context': instance.context,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_ReferenceRegistrationOptions _$ReferenceRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  return _ReferenceRegistrationOptions(
    documentSelector: json['documentSelector'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$ReferenceRegistrationOptionsToJson(
  _ReferenceRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentHighlightParams _$DocumentHighlightParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _DocumentHighlightParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentHighlightParamsToJson(
  _DocumentHighlightParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_DocumentHighlight _$DocumentHighlightFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'kind']);
  return _DocumentHighlight(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    kind: $enumDecodeNullable(_$DocumentHighlightKindEnumMap, json['kind']),
  );
}

Map<String, dynamic> _$DocumentHighlightToJson(_DocumentHighlight instance) =>
    <String, dynamic>{
      'range': instance.range,
      'kind': ?_$DocumentHighlightKindEnumMap[instance.kind],
    };

const _$DocumentHighlightKindEnumMap = {
  DocumentHighlightKind.text: 1,
  DocumentHighlightKind.read: 2,
  DocumentHighlightKind.write: 3,
};

_DocumentHighlightRegistrationOptions
_$DocumentHighlightRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  return _DocumentHighlightRegistrationOptions(
    documentSelector: json['documentSelector'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentHighlightRegistrationOptionsToJson(
  _DocumentHighlightRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentSymbolParams _$DocumentSymbolParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  return _DocumentSymbolParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentSymbolParamsToJson(
  _DocumentSymbolParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_SymbolInformation _$SymbolInformationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'kind',
      'location',
      'deprecated',
      'containerName',
      'tags',
    ],
  );
  return _SymbolInformation(
    name: json['name'] as String,
    kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    deprecated: json['deprecated'] as bool?,
    containerName: json['containerName'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$SymbolInformationToJson(_SymbolInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'location': instance.location,
      'deprecated': ?instance.deprecated,
      'containerName': ?instance.containerName,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

_DocumentSymbol _$DocumentSymbolFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'kind',
      'range',
      'selectionRange',
      'children',
      'deprecated',
      'tags',
      'detail',
    ],
  );
  return _DocumentSymbol(
    name: json['name'] as String,
    kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    selectionRange: Range.fromJson(
      json['selectionRange'] as Map<String, dynamic>,
    ),
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DocumentSymbol.fromJson(e as Map<String, dynamic>))
        .toList(),
    deprecated: json['deprecated'] as bool?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
        .toList(),
    detail: json['detail'] as String?,
  );
}

Map<String, dynamic> _$DocumentSymbolToJson(_DocumentSymbol instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'range': instance.range,
      'selectionRange': instance.selectionRange,
      'children': ?instance.children,
      'deprecated': ?instance.deprecated,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
      'detail': ?instance.detail,
    };

_DocumentSymbolRegistrationOptions _$DocumentSymbolRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'label', 'workDoneProgress'],
  );
  return _DocumentSymbolRegistrationOptions(
    documentSelector: json['documentSelector'],
    label: json['label'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentSymbolRegistrationOptionsToJson(
  _DocumentSymbolRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'label': ?instance.label,
  'workDoneProgress': ?instance.workDoneProgress,
};

_CodeActionParams _$CodeActionParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'range',
      'context',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  return _CodeActionParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    context: CodeActionContext.fromJson(
      json['context'] as Map<String, dynamic>,
    ),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$CodeActionParamsToJson(_CodeActionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'range': instance.range,
      'context': instance.context,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_Command _$CommandFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['title', 'command', 'arguments']);
  return _Command(
    title: json['title'] as String,
    command: json['command'] as String,
    arguments: json['arguments'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$CommandToJson(_Command instance) => <String, dynamic>{
  'title': instance.title,
  'command': instance.command,
  'arguments': ?instance.arguments,
};

_CodeAction _$CodeActionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'title',
      'data',
      'command',
      'edit',
      'disabled',
      'isPreferred',
      'diagnostics',
      'kind',
    ],
  );
  return _CodeAction(
    title: json['title'] as String,
    data: json['data'],
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, dynamic>),
    edit: json['edit'] == null
        ? null
        : WorkspaceEdit.fromJson(json['edit'] as Map<String, dynamic>),
    disabled: _$recordConvertNullable(
      json['disabled'],
      ($jsonValue) => (reason: $jsonValue['reason'] as String),
    ),
    isPreferred: json['isPreferred'] as bool?,
    diagnostics: (json['diagnostics'] as List<dynamic>?)
        ?.map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
        .toList(),
    kind: $enumDecodeNullable(_$CodeActionKindEnumMap, json['kind']),
  );
}

Map<String, dynamic> _$CodeActionToJson(_CodeAction instance) =>
    <String, dynamic>{
      'title': instance.title,
      'data': ?instance.data,
      'command': ?instance.command,
      'edit': ?instance.edit,
      'disabled': ?instance.disabled == null
          ? null
          : <String, dynamic>{'reason': instance.disabled!.reason},
      'isPreferred': ?instance.isPreferred,
      'diagnostics': ?instance.diagnostics,
      'kind': ?_$CodeActionKindEnumMap[instance.kind],
    };

const _$CodeActionKindEnumMap = {
  CodeActionKind.empty: '',
  CodeActionKind.quickFix: 'quickfix',
  CodeActionKind.refactor: 'refactor',
  CodeActionKind.refactorExtract: 'refactor.extract',
  CodeActionKind.refactorInline: 'refactor.inline',
  CodeActionKind.refactorRewrite: 'refactor.rewrite',
  CodeActionKind.source: 'source',
  CodeActionKind.sourceOrganizeImports: 'source.organizeImports',
  CodeActionKind.sourceFixAll: 'source.fixAll',
};

_CodeActionRegistrationOptions _$CodeActionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'resolveProvider',
      'codeActionKinds',
      'workDoneProgress',
    ],
  );
  return _CodeActionRegistrationOptions(
    documentSelector: json['documentSelector'],
    resolveProvider: json['resolveProvider'] as bool?,
    codeActionKinds: (json['codeActionKinds'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$CodeActionKindEnumMap, e))
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CodeActionRegistrationOptionsToJson(
  _CodeActionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'resolveProvider': ?instance.resolveProvider,
  'codeActionKinds': ?instance.codeActionKinds
      ?.map((e) => _$CodeActionKindEnumMap[e]!)
      .toList(),
  'workDoneProgress': ?instance.workDoneProgress,
};

_WorkspaceSymbolParams _$WorkspaceSymbolParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['query', 'partialResultToken', 'workDoneToken'],
  );
  return _WorkspaceSymbolParams(
    query: json['query'] as String,
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$WorkspaceSymbolParamsToJson(
  _WorkspaceSymbolParams instance,
) => <String, dynamic>{
  'query': instance.query,
  'partialResultToken': ?instance.partialResultToken,
  'workDoneToken': ?instance.workDoneToken,
};

_WorkspaceSymbol _$WorkspaceSymbolFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'kind',
      'location',
      'data',
      'containerName',
      'tags',
    ],
  );
  return _WorkspaceSymbol(
    name: json['name'] as String,
    kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
    location: json['location'],
    data: json['data'],
    containerName: json['containerName'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$WorkspaceSymbolToJson(_WorkspaceSymbol instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'location': ?instance.location,
      'data': ?instance.data,
      'containerName': ?instance.containerName,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

_WorkspaceSymbolRegistrationOptions
_$WorkspaceSymbolRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  return _WorkspaceSymbolRegistrationOptions(
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$WorkspaceSymbolRegistrationOptionsToJson(
  _WorkspaceSymbolRegistrationOptions instance,
) => <String, dynamic>{
  'resolveProvider': ?instance.resolveProvider,
  'workDoneProgress': ?instance.workDoneProgress,
};

_CodeLensParams _$CodeLensParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  return _CodeLensParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$CodeLensParamsToJson(_CodeLensParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_CodeLens _$CodeLensFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'data', 'command']);
  return _CodeLens(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    data: json['data'],
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CodeLensToJson(_CodeLens instance) => <String, dynamic>{
  'range': instance.range,
  'data': ?instance.data,
  'command': ?instance.command,
};

_CodeLensRegistrationOptions _$CodeLensRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'resolveProvider',
      'workDoneProgress',
    ],
  );
  return _CodeLensRegistrationOptions(
    documentSelector: json['documentSelector'],
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CodeLensRegistrationOptionsToJson(
  _CodeLensRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'resolveProvider': ?instance.resolveProvider,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentLinkParams _$DocumentLinkParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  return _DocumentLinkParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    partialResultToken: json['partialResultToken'],
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentLinkParamsToJson(_DocumentLinkParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'partialResultToken': ?instance.partialResultToken,
      'workDoneToken': ?instance.workDoneToken,
    };

_DocumentLink _$DocumentLinkFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'data', 'tooltip', 'target']);
  return _DocumentLink(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    data: json['data'],
    tooltip: json['tooltip'] as String?,
    target: json['target'] as String?,
  );
}

Map<String, dynamic> _$DocumentLinkToJson(_DocumentLink instance) =>
    <String, dynamic>{
      'range': instance.range,
      'data': ?instance.data,
      'tooltip': ?instance.tooltip,
      'target': ?instance.target,
    };

_DocumentLinkRegistrationOptions _$DocumentLinkRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'resolveProvider',
      'workDoneProgress',
    ],
  );
  return _DocumentLinkRegistrationOptions(
    documentSelector: json['documentSelector'],
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentLinkRegistrationOptionsToJson(
  _DocumentLinkRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'resolveProvider': ?instance.resolveProvider,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentFormattingParams _$DocumentFormattingParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'options', 'workDoneToken'],
  );
  return _DocumentFormattingParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    options: FormattingOptions.fromJson(
      json['options'] as Map<String, dynamic>,
    ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentFormattingParamsToJson(
  _DocumentFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'options': instance.options,
  'workDoneToken': ?instance.workDoneToken,
};

_DocumentFormattingRegistrationOptions
_$DocumentFormattingRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  return _DocumentFormattingRegistrationOptions(
    documentSelector: json['documentSelector'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentFormattingRegistrationOptionsToJson(
  _DocumentFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentRangeFormattingParams _$DocumentRangeFormattingParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'range', 'options', 'workDoneToken'],
  );
  return _DocumentRangeFormattingParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    options: FormattingOptions.fromJson(
      json['options'] as Map<String, dynamic>,
    ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentRangeFormattingParamsToJson(
  _DocumentRangeFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'range': instance.range,
  'options': instance.options,
  'workDoneToken': ?instance.workDoneToken,
};

_DocumentRangeFormattingRegistrationOptions
_$DocumentRangeFormattingRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'rangesSupport',
      'workDoneProgress',
    ],
  );
  return _DocumentRangeFormattingRegistrationOptions(
    documentSelector: json['documentSelector'],
    rangesSupport: json['rangesSupport'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentRangeFormattingRegistrationOptionsToJson(
  _DocumentRangeFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'rangesSupport': ?instance.rangesSupport,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentRangesFormattingParams _$DocumentRangesFormattingParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'ranges', 'options', 'workDoneToken'],
  );
  return _DocumentRangesFormattingParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    ranges: (json['ranges'] as List<dynamic>)
        .map((e) => Range.fromJson(e as Map<String, dynamic>))
        .toList(),
    options: FormattingOptions.fromJson(
      json['options'] as Map<String, dynamic>,
    ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$DocumentRangesFormattingParamsToJson(
  _DocumentRangesFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'ranges': instance.ranges,
  'options': instance.options,
  'workDoneToken': ?instance.workDoneToken,
};

_DocumentOnTypeFormattingParams _$DocumentOnTypeFormattingParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'ch', 'options'],
  );
  return _DocumentOnTypeFormattingParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    ch: json['ch'] as String,
    options: FormattingOptions.fromJson(
      json['options'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$DocumentOnTypeFormattingParamsToJson(
  _DocumentOnTypeFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'ch': instance.ch,
  'options': instance.options,
};

_DocumentOnTypeFormattingRegistrationOptions
_$DocumentOnTypeFormattingRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'firstTriggerCharacter',
      'moreTriggerCharacter',
    ],
  );
  return _DocumentOnTypeFormattingRegistrationOptions(
    documentSelector: json['documentSelector'],
    firstTriggerCharacter: json['firstTriggerCharacter'] as String,
    moreTriggerCharacter: (json['moreTriggerCharacter'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$DocumentOnTypeFormattingRegistrationOptionsToJson(
  _DocumentOnTypeFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'firstTriggerCharacter': instance.firstTriggerCharacter,
  'moreTriggerCharacter': ?instance.moreTriggerCharacter,
};

_RenameParams _$RenameParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'newName', 'workDoneToken'],
  );
  return _RenameParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    newName: json['newName'] as String,
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$RenameParamsToJson(_RenameParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'newName': instance.newName,
      'workDoneToken': ?instance.workDoneToken,
    };

_RenameRegistrationOptions _$RenameRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'prepareProvider',
      'workDoneProgress',
    ],
  );
  return _RenameRegistrationOptions(
    documentSelector: json['documentSelector'],
    prepareProvider: json['prepareProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$RenameRegistrationOptionsToJson(
  _RenameRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'prepareProvider': ?instance.prepareProvider,
  'workDoneProgress': ?instance.workDoneProgress,
};

_PrepareRenameParams _$PrepareRenameParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  return _PrepareRenameParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$PrepareRenameParamsToJson(
  _PrepareRenameParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': ?instance.workDoneToken,
};

_ExecuteCommandParams _$ExecuteCommandParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['command', 'arguments', 'workDoneToken'],
  );
  return _ExecuteCommandParams(
    command: json['command'] as String,
    arguments: json['arguments'] as List<dynamic>?,
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$ExecuteCommandParamsToJson(
  _ExecuteCommandParams instance,
) => <String, dynamic>{
  'command': instance.command,
  'arguments': ?instance.arguments,
  'workDoneToken': ?instance.workDoneToken,
};

_ExecuteCommandRegistrationOptions _$ExecuteCommandRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['commands', 'workDoneProgress']);
  return _ExecuteCommandRegistrationOptions(
    commands: (json['commands'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$ExecuteCommandRegistrationOptionsToJson(
  _ExecuteCommandRegistrationOptions instance,
) => <String, dynamic>{
  'commands': instance.commands,
  'workDoneProgress': ?instance.workDoneProgress,
};

_ApplyWorkspaceEditParams _$ApplyWorkspaceEditParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['edit', 'label']);
  return _ApplyWorkspaceEditParams(
    edit: WorkspaceEdit.fromJson(json['edit'] as Map<String, dynamic>),
    label: json['label'] as String?,
  );
}

Map<String, dynamic> _$ApplyWorkspaceEditParamsToJson(
  _ApplyWorkspaceEditParams instance,
) => <String, dynamic>{'edit': instance.edit, 'label': ?instance.label};

_ApplyWorkspaceEditResult _$ApplyWorkspaceEditResultFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['applied', 'failedChange', 'failureReason'],
  );
  return _ApplyWorkspaceEditResult(
    applied: json['applied'] as bool,
    failedChange: (json['failedChange'] as num?)?.toInt(),
    failureReason: json['failureReason'] as String?,
  );
}

Map<String, dynamic> _$ApplyWorkspaceEditResultToJson(
  _ApplyWorkspaceEditResult instance,
) => <String, dynamic>{
  'applied': instance.applied,
  'failedChange': ?instance.failedChange,
  'failureReason': ?instance.failureReason,
};

_WorkDoneProgressBegin _$WorkDoneProgressBeginFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'kind',
      'title',
      'percentage',
      'message',
      'cancellable',
    ],
  );
  return _WorkDoneProgressBegin(
    kind: json['kind'] as String,
    title: json['title'] as String,
    percentage: (json['percentage'] as num?)?.toInt(),
    message: json['message'] as String?,
    cancellable: json['cancellable'] as bool?,
  );
}

Map<String, dynamic> _$WorkDoneProgressBeginToJson(
  _WorkDoneProgressBegin instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'title': instance.title,
  'percentage': ?instance.percentage,
  'message': ?instance.message,
  'cancellable': ?instance.cancellable,
};

_WorkDoneProgressReport _$WorkDoneProgressReportFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'percentage', 'message', 'cancellable'],
  );
  return _WorkDoneProgressReport(
    kind: json['kind'] as String,
    percentage: (json['percentage'] as num?)?.toInt(),
    message: json['message'] as String?,
    cancellable: json['cancellable'] as bool?,
  );
}

Map<String, dynamic> _$WorkDoneProgressReportToJson(
  _WorkDoneProgressReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'percentage': ?instance.percentage,
  'message': ?instance.message,
  'cancellable': ?instance.cancellable,
};

_WorkDoneProgressEnd _$WorkDoneProgressEndFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'message']);
  return _WorkDoneProgressEnd(
    kind: json['kind'] as String,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$WorkDoneProgressEndToJson(
  _WorkDoneProgressEnd instance,
) => <String, dynamic>{'kind': instance.kind, 'message': ?instance.message};

_SetTraceParams _$SetTraceParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['value']);
  return _SetTraceParams(
    value: $enumDecode(_$TraceValuesEnumMap, json['value']),
  );
}

Map<String, dynamic> _$SetTraceParamsToJson(_SetTraceParams instance) =>
    <String, dynamic>{'value': _$TraceValuesEnumMap[instance.value]!};

_LogTraceParams _$LogTraceParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['message', 'verbose']);
  return _LogTraceParams(
    message: json['message'] as String,
    verbose: json['verbose'] as String?,
  );
}

Map<String, dynamic> _$LogTraceParamsToJson(_LogTraceParams instance) =>
    <String, dynamic>{
      'message': instance.message,
      'verbose': ?instance.verbose,
    };

_CancelParams _$CancelParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['id']);
  return _CancelParams(id: json['id']);
}

Map<String, dynamic> _$CancelParamsToJson(_CancelParams instance) =>
    <String, dynamic>{'id': ?instance.id};

_ProgressParams _$ProgressParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['token', 'value']);
  return _ProgressParams(token: json['token'], value: json['value']);
}

Map<String, dynamic> _$ProgressParamsToJson(_ProgressParams instance) =>
    <String, dynamic>{'token': ?instance.token, 'value': ?instance.value};

_TextDocumentPositionParams _$TextDocumentPositionParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'position']);
  return _TextDocumentPositionParams(
    textDocument: TextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TextDocumentPositionParamsToJson(
  _TextDocumentPositionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
};

_WorkDoneProgressParams _$WorkDoneProgressParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneToken']);
  return _WorkDoneProgressParams(workDoneToken: json['workDoneToken']);
}

Map<String, dynamic> _$WorkDoneProgressParamsToJson(
  _WorkDoneProgressParams instance,
) => <String, dynamic>{'workDoneToken': ?instance.workDoneToken};

_PartialResultParams _$PartialResultParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['partialResultToken']);
  return _PartialResultParams(partialResultToken: json['partialResultToken']);
}

Map<String, dynamic> _$PartialResultParamsToJson(
  _PartialResultParams instance,
) => <String, dynamic>{'partialResultToken': ?instance.partialResultToken};

_LocationLink _$LocationLinkFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'targetUri',
      'targetRange',
      'targetSelectionRange',
      'originSelectionRange',
    ],
  );
  return _LocationLink(
    targetUri: json['targetUri'] as String,
    targetRange: Range.fromJson(json['targetRange'] as Map<String, dynamic>),
    targetSelectionRange: Range.fromJson(
      json['targetSelectionRange'] as Map<String, dynamic>,
    ),
    originSelectionRange: json['originSelectionRange'] == null
        ? null
        : Range.fromJson(json['originSelectionRange'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationLinkToJson(_LocationLink instance) =>
    <String, dynamic>{
      'targetUri': instance.targetUri,
      'targetRange': instance.targetRange,
      'targetSelectionRange': instance.targetSelectionRange,
      'originSelectionRange': ?instance.originSelectionRange,
    };

_Range _$RangeFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['start', 'end']);
  return _Range(
    start: Position.fromJson(json['start'] as Map<String, dynamic>),
    end: Position.fromJson(json['end'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RangeToJson(_Range instance) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
};

_ImplementationOptions _$ImplementationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _ImplementationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$ImplementationOptionsToJson(
  _ImplementationOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_StaticRegistrationOptions _$StaticRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['id']);
  return _StaticRegistrationOptions(id: json['id'] as String?);
}

Map<String, dynamic> _$StaticRegistrationOptionsToJson(
  _StaticRegistrationOptions instance,
) => <String, dynamic>{'id': ?instance.id};

_TypeDefinitionOptions _$TypeDefinitionOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _TypeDefinitionOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$TypeDefinitionOptionsToJson(
  _TypeDefinitionOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_WorkspaceFoldersChangeEvent _$WorkspaceFoldersChangeEventFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['added', 'removed']);
  return _WorkspaceFoldersChangeEvent(
    added: (json['added'] as List<dynamic>)
        .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
        .toList(),
    removed: (json['removed'] as List<dynamic>)
        .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WorkspaceFoldersChangeEventToJson(
  _WorkspaceFoldersChangeEvent instance,
) => <String, dynamic>{'added': instance.added, 'removed': instance.removed};

_ConfigurationItem _$ConfigurationItemFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['section', 'scopeUri']);
  return _ConfigurationItem(
    section: json['section'] as String?,
    scopeUri: json['scopeUri'] as String?,
  );
}

Map<String, dynamic> _$ConfigurationItemToJson(_ConfigurationItem instance) =>
    <String, dynamic>{
      'section': ?instance.section,
      'scopeUri': ?instance.scopeUri,
    };

_TextDocumentIdentifier _$TextDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['uri']);
  return _TextDocumentIdentifier(uri: json['uri'] as String);
}

Map<String, dynamic> _$TextDocumentIdentifierToJson(
  _TextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri};

_Color _$ColorFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['red', 'green', 'blue', 'alpha']);
  return _Color(
    red: (json['red'] as num).toDouble(),
    green: (json['green'] as num).toDouble(),
    blue: (json['blue'] as num).toDouble(),
    alpha: (json['alpha'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ColorToJson(_Color instance) => <String, dynamic>{
  'red': instance.red,
  'green': instance.green,
  'blue': instance.blue,
  'alpha': instance.alpha,
};

_DocumentColorOptions _$DocumentColorOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _DocumentColorOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentColorOptionsToJson(
  _DocumentColorOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_FoldingRangeOptions _$FoldingRangeOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _FoldingRangeOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$FoldingRangeOptionsToJson(
  _FoldingRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_DeclarationOptions _$DeclarationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _DeclarationOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DeclarationOptionsToJson(_DeclarationOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_Position _$PositionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['line', 'character']);
  return _Position(
    line: (json['line'] as num).toInt(),
    character: (json['character'] as num).toInt(),
  );
}

Map<String, dynamic> _$PositionToJson(_Position instance) => <String, dynamic>{
  'line': instance.line,
  'character': instance.character,
};

_SelectionRangeOptions _$SelectionRangeOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _SelectionRangeOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$SelectionRangeOptionsToJson(
  _SelectionRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_CallHierarchyOptions _$CallHierarchyOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _CallHierarchyOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CallHierarchyOptionsToJson(
  _CallHierarchyOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_SemanticTokensOptions _$SemanticTokensOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['legend', 'full', 'range', 'workDoneProgress'],
  );
  return _SemanticTokensOptions(
    legend: SemanticTokensLegend.fromJson(
      json['legend'] as Map<String, dynamic>,
    ),
    full: json['full'],
    range: json['range'],
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$SemanticTokensOptionsToJson(
  _SemanticTokensOptions instance,
) => <String, dynamic>{
  'legend': instance.legend,
  'full': ?instance.full,
  'range': ?instance.range,
  'workDoneProgress': ?instance.workDoneProgress,
};

_SemanticTokensEdit _$SemanticTokensEditFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['start', 'deleteCount', 'data']);
  return _SemanticTokensEdit(
    start: (json['start'] as num).toInt(),
    deleteCount: (json['deleteCount'] as num).toInt(),
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => (e as num).toInt())
        .toList(),
  );
}

Map<String, dynamic> _$SemanticTokensEditToJson(_SemanticTokensEdit instance) =>
    <String, dynamic>{
      'start': instance.start,
      'deleteCount': instance.deleteCount,
      'data': ?instance.data,
    };

_LinkedEditingRangeOptions _$LinkedEditingRangeOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _LinkedEditingRangeOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$LinkedEditingRangeOptionsToJson(
  _LinkedEditingRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_FileCreate _$FileCreateFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri']);
  return _FileCreate(uri: json['uri'] as String);
}

Map<String, dynamic> _$FileCreateToJson(_FileCreate instance) =>
    <String, dynamic>{'uri': instance.uri};

_TextDocumentEdit _$TextDocumentEditFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'edits']);
  return _TextDocumentEdit(
    textDocument: OptionalVersionedTextDocumentIdentifier.fromJson(
      json['textDocument'] as Map<String, dynamic>,
    ),
    edits: json['edits'] as List<dynamic>,
  );
}

Map<String, dynamic> _$TextDocumentEditToJson(_TextDocumentEdit instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'edits': instance.edits,
    };

_CreateFile _$CreateFileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'uri', 'options', 'annotationId'],
  );
  return _CreateFile(
    kind: json['kind'] as String,
    uri: json['uri'] as String,
    options: json['options'] == null
        ? null
        : CreateFileOptions.fromJson(json['options'] as Map<String, dynamic>),
    annotationId: json['annotationId'] as String?,
  );
}

Map<String, dynamic> _$CreateFileToJson(_CreateFile instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'uri': instance.uri,
      'options': ?instance.options,
      'annotationId': ?instance.annotationId,
    };

_RenameFile _$RenameFileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'oldUri', 'newUri', 'options', 'annotationId'],
  );
  return _RenameFile(
    kind: json['kind'] as String,
    oldUri: json['oldUri'] as String,
    newUri: json['newUri'] as String,
    options: json['options'] == null
        ? null
        : RenameFileOptions.fromJson(json['options'] as Map<String, dynamic>),
    annotationId: json['annotationId'] as String?,
  );
}

Map<String, dynamic> _$RenameFileToJson(_RenameFile instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'oldUri': instance.oldUri,
      'newUri': instance.newUri,
      'options': ?instance.options,
      'annotationId': ?instance.annotationId,
    };

_DeleteFile _$DeleteFileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'uri', 'options', 'annotationId'],
  );
  return _DeleteFile(
    kind: json['kind'] as String,
    uri: json['uri'] as String,
    options: json['options'] == null
        ? null
        : DeleteFileOptions.fromJson(json['options'] as Map<String, dynamic>),
    annotationId: json['annotationId'] as String?,
  );
}

Map<String, dynamic> _$DeleteFileToJson(_DeleteFile instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'uri': instance.uri,
      'options': ?instance.options,
      'annotationId': ?instance.annotationId,
    };

_ChangeAnnotation _$ChangeAnnotationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['label', 'description', 'needsConfirmation'],
  );
  return _ChangeAnnotation(
    label: json['label'] as String,
    description: json['description'] as String?,
    needsConfirmation: json['needsConfirmation'] as bool?,
  );
}

Map<String, dynamic> _$ChangeAnnotationToJson(_ChangeAnnotation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': ?instance.description,
      'needsConfirmation': ?instance.needsConfirmation,
    };

_FileOperationFilter _$FileOperationFilterFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['pattern', 'scheme']);
  return _FileOperationFilter(
    pattern: FileOperationPattern.fromJson(
      json['pattern'] as Map<String, dynamic>,
    ),
    scheme: json['scheme'] as String?,
  );
}

Map<String, dynamic> _$FileOperationFilterToJson(
  _FileOperationFilter instance,
) => <String, dynamic>{'pattern': instance.pattern, 'scheme': ?instance.scheme};

_FileRename _$FileRenameFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['oldUri', 'newUri']);
  return _FileRename(
    oldUri: json['oldUri'] as String,
    newUri: json['newUri'] as String,
  );
}

Map<String, dynamic> _$FileRenameToJson(_FileRename instance) =>
    <String, dynamic>{'oldUri': instance.oldUri, 'newUri': instance.newUri};

_FileDelete _$FileDeleteFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri']);
  return _FileDelete(uri: json['uri'] as String);
}

Map<String, dynamic> _$FileDeleteToJson(_FileDelete instance) =>
    <String, dynamic>{'uri': instance.uri};

_MonikerOptions _$MonikerOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _MonikerOptions(workDoneProgress: json['workDoneProgress'] as bool?);
}

Map<String, dynamic> _$MonikerOptionsToJson(_MonikerOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_TypeHierarchyOptions _$TypeHierarchyOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _TypeHierarchyOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$TypeHierarchyOptionsToJson(
  _TypeHierarchyOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_InlineValueContext _$InlineValueContextFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['frameId', 'stoppedLocation']);
  return _InlineValueContext(
    frameId: (json['frameId'] as num).toInt(),
    stoppedLocation: Range.fromJson(
      json['stoppedLocation'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$InlineValueContextToJson(_InlineValueContext instance) =>
    <String, dynamic>{
      'frameId': instance.frameId,
      'stoppedLocation': instance.stoppedLocation,
    };

_InlineValueText _$InlineValueTextFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'text']);
  return _InlineValueText(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$InlineValueTextToJson(_InlineValueText instance) =>
    <String, dynamic>{'range': instance.range, 'text': instance.text};

_InlineValueVariableLookup _$InlineValueVariableLookupFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['range', 'caseSensitiveLookup', 'variableName'],
  );
  return _InlineValueVariableLookup(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    caseSensitiveLookup: json['caseSensitiveLookup'] as bool,
    variableName: json['variableName'] as String?,
  );
}

Map<String, dynamic> _$InlineValueVariableLookupToJson(
  _InlineValueVariableLookup instance,
) => <String, dynamic>{
  'range': instance.range,
  'caseSensitiveLookup': instance.caseSensitiveLookup,
  'variableName': ?instance.variableName,
};

_InlineValueEvaluatableExpression _$InlineValueEvaluatableExpressionFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['range', 'expression']);
  return _InlineValueEvaluatableExpression(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    expression: json['expression'] as String?,
  );
}

Map<String, dynamic> _$InlineValueEvaluatableExpressionToJson(
  _InlineValueEvaluatableExpression instance,
) => <String, dynamic>{
  'range': instance.range,
  'expression': ?instance.expression,
};

_InlineValueOptions _$InlineValueOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _InlineValueOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$InlineValueOptionsToJson(_InlineValueOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_InlayHintLabelPart _$InlayHintLabelPartFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['value', 'command', 'location', 'tooltip'],
  );
  return _InlayHintLabelPart(
    value: json['value'] as String,
    command: json['command'] == null
        ? null
        : Command.fromJson(json['command'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    tooltip: json['tooltip'],
  );
}

Map<String, dynamic> _$InlayHintLabelPartToJson(_InlayHintLabelPart instance) =>
    <String, dynamic>{
      'value': instance.value,
      'command': ?instance.command,
      'location': ?instance.location,
      'tooltip': ?instance.tooltip,
    };

_MarkupContent _$MarkupContentFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'value']);
  return _MarkupContent(
    kind: $enumDecode(_$MarkupKindEnumMap, json['kind']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$MarkupContentToJson(_MarkupContent instance) =>
    <String, dynamic>{
      'kind': _$MarkupKindEnumMap[instance.kind]!,
      'value': instance.value,
    };

const _$MarkupKindEnumMap = {
  MarkupKind.plainText: 'plaintext',
  MarkupKind.markdown: 'markdown',
};

_InlayHintOptions _$InlayHintOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  return _InlayHintOptions(
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$InlayHintOptionsToJson(_InlayHintOptions instance) =>
    <String, dynamic>{
      'resolveProvider': ?instance.resolveProvider,
      'workDoneProgress': ?instance.workDoneProgress,
    };

_RelatedFullDocumentDiagnosticReport
_$RelatedFullDocumentDiagnosticReportFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'items', 'relatedDocuments', 'resultId'],
  );
  return _RelatedFullDocumentDiagnosticReport(
    kind: json['kind'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
        .toList(),
    relatedDocuments: json['relatedDocuments'] as Map<String, dynamic>?,
    resultId: json['resultId'] as String?,
  );
}

Map<String, dynamic> _$RelatedFullDocumentDiagnosticReportToJson(
  _RelatedFullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'items': instance.items,
  'relatedDocuments': ?instance.relatedDocuments,
  'resultId': ?instance.resultId,
};

_RelatedUnchangedDocumentDiagnosticReport
_$RelatedUnchangedDocumentDiagnosticReportFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'resultId', 'relatedDocuments']);
  return _RelatedUnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
    relatedDocuments: json['relatedDocuments'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$RelatedUnchangedDocumentDiagnosticReportToJson(
  _RelatedUnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': instance.resultId,
  'relatedDocuments': ?instance.relatedDocuments,
};

_FullDocumentDiagnosticReport _$FullDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['kind', 'items', 'resultId']);
  return _FullDocumentDiagnosticReport(
    kind: json['kind'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
        .toList(),
    resultId: json['resultId'] as String?,
  );
}

Map<String, dynamic> _$FullDocumentDiagnosticReportToJson(
  _FullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'items': instance.items,
  'resultId': ?instance.resultId,
};

_UnchangedDocumentDiagnosticReport _$UnchangedDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['kind', 'resultId']);
  return _UnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
  );
}

Map<String, dynamic> _$UnchangedDocumentDiagnosticReportToJson(
  _UnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{'kind': instance.kind, 'resultId': instance.resultId};

_DiagnosticOptions _$DiagnosticOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'interFileDependencies',
      'workspaceDiagnostics',
      'identifier',
      'workDoneProgress',
    ],
  );
  return _DiagnosticOptions(
    interFileDependencies: json['interFileDependencies'] as bool,
    workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
    identifier: json['identifier'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DiagnosticOptionsToJson(_DiagnosticOptions instance) =>
    <String, dynamic>{
      'interFileDependencies': instance.interFileDependencies,
      'workspaceDiagnostics': instance.workspaceDiagnostics,
      'identifier': ?instance.identifier,
      'workDoneProgress': ?instance.workDoneProgress,
    };

_PreviousResultId _$PreviousResultIdFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri', 'value']);
  return _PreviousResultId(
    uri: json['uri'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$PreviousResultIdToJson(_PreviousResultId instance) =>
    <String, dynamic>{'uri': instance.uri, 'value': instance.value};

_NotebookDocument _$NotebookDocumentFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['uri', 'notebookType', 'version', 'cells', 'metadata'],
  );
  return _NotebookDocument(
    uri: json['uri'] as String,
    notebookType: json['notebookType'] as String,
    version: (json['version'] as num).toInt(),
    cells: (json['cells'] as List<dynamic>)
        .map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
        .toList(),
    metadata: json['metadata'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$NotebookDocumentToJson(_NotebookDocument instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'notebookType': instance.notebookType,
      'version': instance.version,
      'cells': instance.cells,
      'metadata': ?instance.metadata,
    };

_TextDocumentItem _$TextDocumentItemFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri', 'languageId', 'version', 'text']);
  return _TextDocumentItem(
    uri: json['uri'] as String,
    languageId: json['languageId'] as String,
    version: (json['version'] as num).toInt(),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$TextDocumentItemToJson(_TextDocumentItem instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'languageId': instance.languageId,
      'version': instance.version,
      'text': instance.text,
    };

_VersionedNotebookDocumentIdentifier
_$VersionedNotebookDocumentIdentifierFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['version', 'uri']);
  return _VersionedNotebookDocumentIdentifier(
    version: (json['version'] as num).toInt(),
    uri: json['uri'] as String,
  );
}

Map<String, dynamic> _$VersionedNotebookDocumentIdentifierToJson(
  _VersionedNotebookDocumentIdentifier instance,
) => <String, dynamic>{'version': instance.version, 'uri': instance.uri};

_NotebookDocumentChangeEvent _$NotebookDocumentChangeEventFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['cells', 'metadata']);
  return _NotebookDocumentChangeEvent(
    cells: _$recordConvertNullable(
      json['cells'],
      ($jsonValue) => (
        data: ($jsonValue['data'] as List<dynamic>?)
            ?.map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
            .toList(),
        structure: _$recordConvertNullable(
          $jsonValue['structure'],
          ($jsonValue) => (
            array: NotebookCellArrayChange.fromJson(
              $jsonValue['array'] as Map<String, dynamic>,
            ),
            didClose: ($jsonValue['didClose'] as List<dynamic>?)
                ?.map(
                  (e) => TextDocumentIdentifier.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
            didOpen: ($jsonValue['didOpen'] as List<dynamic>?)
                ?.map(
                  (e) => TextDocumentItem.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
        ),
        textContent: ($jsonValue['textContent'] as List<dynamic>?)
            ?.map(
              (e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  changes: $jsonValue['changes'] as List<dynamic>,
                  document: VersionedTextDocumentIdentifier.fromJson(
                    $jsonValue['document'] as Map<String, dynamic>,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ),
    metadata: json['metadata'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$NotebookDocumentChangeEventToJson(
  _NotebookDocumentChangeEvent instance,
) => <String, dynamic>{
  'cells': ?instance.cells == null
      ? null
      : <String, dynamic>{
          'data': instance.cells!.data,
          'structure': instance.cells!.structure == null
              ? null
              : <String, dynamic>{
                  'array': instance.cells!.structure!.array,
                  'didClose': instance.cells!.structure!.didClose,
                  'didOpen': instance.cells!.structure!.didOpen,
                },
          'textContent': instance.cells!.textContent
              ?.map(
                (e) => <String, dynamic>{
                  'changes': e.changes,
                  'document': e.document,
                },
              )
              .toList(),
        },
  'metadata': ?instance.metadata,
};

_NotebookDocumentIdentifier _$NotebookDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['uri']);
  return _NotebookDocumentIdentifier(uri: json['uri'] as String);
}

Map<String, dynamic> _$NotebookDocumentIdentifierToJson(
  _NotebookDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri};

_InlineCompletionContext _$InlineCompletionContextFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['triggerKind', 'selectedCompletionInfo'],
  );
  return _InlineCompletionContext(
    triggerKind: $enumDecode(
      _$InlineCompletionTriggerKindEnumMap,
      json['triggerKind'],
    ),
    selectedCompletionInfo: json['selectedCompletionInfo'] == null
        ? null
        : SelectedCompletionInfo.fromJson(
            json['selectedCompletionInfo'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineCompletionContextToJson(
  _InlineCompletionContext instance,
) => <String, dynamic>{
  'triggerKind': _$InlineCompletionTriggerKindEnumMap[instance.triggerKind]!,
  'selectedCompletionInfo': ?instance.selectedCompletionInfo,
};

const _$InlineCompletionTriggerKindEnumMap = {
  InlineCompletionTriggerKind.invoked: 0,
  InlineCompletionTriggerKind.automatic: 1,
};

_StringValue _$StringValueFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'value']);
  return _StringValue(
    kind: json['kind'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$StringValueToJson(_StringValue instance) =>
    <String, dynamic>{'kind': instance.kind, 'value': instance.value};

_InlineCompletionOptions _$InlineCompletionOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _InlineCompletionOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$InlineCompletionOptionsToJson(
  _InlineCompletionOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_Registration _$RegistrationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['id', 'method', 'registerOptions']);
  return _Registration(
    id: json['id'] as String,
    method: json['method'] as String,
    registerOptions: json['registerOptions'],
  );
}

Map<String, dynamic> _$RegistrationToJson(_Registration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'registerOptions': ?instance.registerOptions,
    };

_Unregistration _$UnregistrationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['id', 'method']);
  return _Unregistration(
    id: json['id'] as String,
    method: json['method'] as String,
  );
}

Map<String, dynamic> _$UnregistrationToJson(_Unregistration instance) =>
    <String, dynamic>{'id': instance.id, 'method': instance.method};

_TInitializeParams _$TInitializeParamsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'processId',
      'rootUri',
      'capabilities',
      'trace',
      'initializationOptions',
      'rootPath',
      'locale',
      'clientInfo',
      'workDoneToken',
    ],
  );
  return _TInitializeParams(
    processId: json['processId'],
    rootUri: json['rootUri'],
    capabilities: ClientCapabilities.fromJson(
      json['capabilities'] as Map<String, dynamic>,
    ),
    trace: $enumDecodeNullable(_$TraceValuesEnumMap, json['trace']),
    initializationOptions: json['initializationOptions'],
    rootPath: json['rootPath'],
    locale: json['locale'] as String?,
    clientInfo: _$recordConvertNullable(
      json['clientInfo'],
      ($jsonValue) => (
        name: $jsonValue['name'] as String,
        version: $jsonValue['version'] as String?,
      ),
    ),
    workDoneToken: json['workDoneToken'],
  );
}

Map<String, dynamic> _$TInitializeParamsToJson(_TInitializeParams instance) =>
    <String, dynamic>{
      'processId': ?instance.processId,
      'rootUri': ?instance.rootUri,
      'capabilities': instance.capabilities,
      'trace': ?_$TraceValuesEnumMap[instance.trace],
      'initializationOptions': ?instance.initializationOptions,
      'rootPath': ?instance.rootPath,
      'locale': ?instance.locale,
      'clientInfo': ?instance.clientInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.clientInfo!.name,
              'version': instance.clientInfo!.version,
            },
      'workDoneToken': ?instance.workDoneToken,
    };

_WorkspaceFoldersInitializeParams _$WorkspaceFoldersInitializeParamsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workspaceFolders']);
  return _WorkspaceFoldersInitializeParams(
    workspaceFolders: json['workspaceFolders'],
  );
}

Map<String, dynamic> _$WorkspaceFoldersInitializeParamsToJson(
  _WorkspaceFoldersInitializeParams instance,
) => <String, dynamic>{'workspaceFolders': ?instance.workspaceFolders};

_ServerCapabilities _$ServerCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'workspaceSymbolProvider',
      'documentHighlightProvider',
      'documentFormattingProvider',
      'codeActionProvider',
      'completionProvider',
      'workspace',
      'inlineCompletionProvider',
      'diagnosticProvider',
      'inlayHintProvider',
      'definitionProvider',
      'declarationProvider',
      'monikerProvider',
      'semanticTokensProvider',
      'linkedEditingRangeProvider',
      'callHierarchyProvider',
      'executeCommandProvider',
      'textDocumentSync',
      'foldingRangeProvider',
      'renameProvider',
      'documentOnTypeFormattingProvider',
      'documentRangeFormattingProvider',
      'experimental',
      'selectionRangeProvider',
      'colorProvider',
      'documentLinkProvider',
      'codeLensProvider',
      'notebookDocumentSync',
      'documentSymbolProvider',
      'positionEncoding',
      'referencesProvider',
      'implementationProvider',
      'typeDefinitionProvider',
      'inlineValueProvider',
      'typeHierarchyProvider',
      'signatureHelpProvider',
      'hoverProvider',
    ],
  );
  return _ServerCapabilities(
    workspaceSymbolProvider: json['workspaceSymbolProvider'],
    documentHighlightProvider: json['documentHighlightProvider'],
    documentFormattingProvider: json['documentFormattingProvider'],
    codeActionProvider: json['codeActionProvider'],
    completionProvider: json['completionProvider'] == null
        ? null
        : CompletionOptions.fromJson(
            json['completionProvider'] as Map<String, dynamic>,
          ),
    workspace: _$recordConvertNullable(
      json['workspace'],
      ($jsonValue) => (
        fileOperations: $jsonValue['fileOperations'] == null
            ? null
            : FileOperationOptions.fromJson(
                $jsonValue['fileOperations'] as Map<String, dynamic>,
              ),
        workspaceFolders: $jsonValue['workspaceFolders'] == null
            ? null
            : WorkspaceFoldersServerCapabilities.fromJson(
                $jsonValue['workspaceFolders'] as Map<String, dynamic>,
              ),
      ),
    ),
    inlineCompletionProvider: json['inlineCompletionProvider'],
    diagnosticProvider: json['diagnosticProvider'],
    inlayHintProvider: json['inlayHintProvider'],
    definitionProvider: json['definitionProvider'],
    declarationProvider: json['declarationProvider'],
    monikerProvider: json['monikerProvider'],
    semanticTokensProvider: json['semanticTokensProvider'],
    linkedEditingRangeProvider: json['linkedEditingRangeProvider'],
    callHierarchyProvider: json['callHierarchyProvider'],
    executeCommandProvider: json['executeCommandProvider'] == null
        ? null
        : ExecuteCommandOptions.fromJson(
            json['executeCommandProvider'] as Map<String, dynamic>,
          ),
    textDocumentSync: json['textDocumentSync'],
    foldingRangeProvider: json['foldingRangeProvider'],
    renameProvider: json['renameProvider'],
    documentOnTypeFormattingProvider:
        json['documentOnTypeFormattingProvider'] == null
        ? null
        : DocumentOnTypeFormattingOptions.fromJson(
            json['documentOnTypeFormattingProvider'] as Map<String, dynamic>,
          ),
    documentRangeFormattingProvider: json['documentRangeFormattingProvider'],
    experimental: json['experimental'],
    selectionRangeProvider: json['selectionRangeProvider'],
    colorProvider: json['colorProvider'],
    documentLinkProvider: json['documentLinkProvider'] == null
        ? null
        : DocumentLinkOptions.fromJson(
            json['documentLinkProvider'] as Map<String, dynamic>,
          ),
    codeLensProvider: json['codeLensProvider'] == null
        ? null
        : CodeLensOptions.fromJson(
            json['codeLensProvider'] as Map<String, dynamic>,
          ),
    notebookDocumentSync: json['notebookDocumentSync'],
    documentSymbolProvider: json['documentSymbolProvider'],
    positionEncoding: $enumDecodeNullable(
      _$PositionEncodingKindEnumMap,
      json['positionEncoding'],
    ),
    referencesProvider: json['referencesProvider'],
    implementationProvider: json['implementationProvider'],
    typeDefinitionProvider: json['typeDefinitionProvider'],
    inlineValueProvider: json['inlineValueProvider'],
    typeHierarchyProvider: json['typeHierarchyProvider'],
    signatureHelpProvider: json['signatureHelpProvider'] == null
        ? null
        : SignatureHelpOptions.fromJson(
            json['signatureHelpProvider'] as Map<String, dynamic>,
          ),
    hoverProvider: json['hoverProvider'],
  );
}

Map<String, dynamic> _$ServerCapabilitiesToJson(
  _ServerCapabilities instance,
) => <String, dynamic>{
  'workspaceSymbolProvider': ?instance.workspaceSymbolProvider,
  'documentHighlightProvider': ?instance.documentHighlightProvider,
  'documentFormattingProvider': ?instance.documentFormattingProvider,
  'codeActionProvider': ?instance.codeActionProvider,
  'completionProvider': ?instance.completionProvider,
  'workspace': ?instance.workspace == null
      ? null
      : <String, dynamic>{
          'fileOperations': instance.workspace!.fileOperations,
          'workspaceFolders': instance.workspace!.workspaceFolders,
        },
  'inlineCompletionProvider': ?instance.inlineCompletionProvider,
  'diagnosticProvider': ?instance.diagnosticProvider,
  'inlayHintProvider': ?instance.inlayHintProvider,
  'definitionProvider': ?instance.definitionProvider,
  'declarationProvider': ?instance.declarationProvider,
  'monikerProvider': ?instance.monikerProvider,
  'semanticTokensProvider': ?instance.semanticTokensProvider,
  'linkedEditingRangeProvider': ?instance.linkedEditingRangeProvider,
  'callHierarchyProvider': ?instance.callHierarchyProvider,
  'executeCommandProvider': ?instance.executeCommandProvider,
  'textDocumentSync': ?instance.textDocumentSync,
  'foldingRangeProvider': ?instance.foldingRangeProvider,
  'renameProvider': ?instance.renameProvider,
  'documentOnTypeFormattingProvider':
      ?instance.documentOnTypeFormattingProvider,
  'documentRangeFormattingProvider': ?instance.documentRangeFormattingProvider,
  'experimental': ?instance.experimental,
  'selectionRangeProvider': ?instance.selectionRangeProvider,
  'colorProvider': ?instance.colorProvider,
  'documentLinkProvider': ?instance.documentLinkProvider,
  'codeLensProvider': ?instance.codeLensProvider,
  'notebookDocumentSync': ?instance.notebookDocumentSync,
  'documentSymbolProvider': ?instance.documentSymbolProvider,
  'positionEncoding': ?_$PositionEncodingKindEnumMap[instance.positionEncoding],
  'referencesProvider': ?instance.referencesProvider,
  'implementationProvider': ?instance.implementationProvider,
  'typeDefinitionProvider': ?instance.typeDefinitionProvider,
  'inlineValueProvider': ?instance.inlineValueProvider,
  'typeHierarchyProvider': ?instance.typeHierarchyProvider,
  'signatureHelpProvider': ?instance.signatureHelpProvider,
  'hoverProvider': ?instance.hoverProvider,
};

const _$PositionEncodingKindEnumMap = {
  PositionEncodingKind.uTF8: 'utf-8',
  PositionEncodingKind.uTF16: 'utf-16',
  PositionEncodingKind.uTF32: 'utf-32',
};

_VersionedTextDocumentIdentifier _$VersionedTextDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['uri', 'version']);
  return _VersionedTextDocumentIdentifier(
    uri: json['uri'] as String,
    version: (json['version'] as num).toInt(),
  );
}

Map<String, dynamic> _$VersionedTextDocumentIdentifierToJson(
  _VersionedTextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri, 'version': instance.version};

_SaveOptions _$SaveOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['includeText']);
  return _SaveOptions(includeText: json['includeText'] as bool?);
}

Map<String, dynamic> _$SaveOptionsToJson(_SaveOptions instance) =>
    <String, dynamic>{'includeText': ?instance.includeText};

_FileEvent _$FileEventFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri', 'type']);
  return _FileEvent(
    uri: json['uri'] as String,
    type: $enumDecode(_$FileChangeTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$FileEventToJson(_FileEvent instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'type': _$FileChangeTypeEnumMap[instance.type]!,
    };

const _$FileChangeTypeEnumMap = {
  FileChangeType.created: 1,
  FileChangeType.changed: 2,
  FileChangeType.deleted: 3,
};

_FileSystemWatcher _$FileSystemWatcherFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['globPattern', 'kind']);
  return _FileSystemWatcher(
    globPattern: json['globPattern'],
    kind: $enumDecodeNullable(_$WatchKindEnumMap, json['kind']),
  );
}

Map<String, dynamic> _$FileSystemWatcherToJson(_FileSystemWatcher instance) =>
    <String, dynamic>{
      'globPattern': ?instance.globPattern,
      'kind': ?_$WatchKindEnumMap[instance.kind],
    };

const _$WatchKindEnumMap = {
  WatchKind.create: 1,
  WatchKind.change: 2,
  WatchKind.delete: 4,
};

_Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'range',
      'message',
      'data',
      'relatedInformation',
      'tags',
      'source',
      'codeDescription',
      'code',
      'severity',
    ],
  );
  return _Diagnostic(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    message: json['message'] as String,
    data: json['data'],
    relatedInformation: (json['relatedInformation'] as List<dynamic>?)
        ?.map(
          (e) =>
              DiagnosticRelatedInformation.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$DiagnosticTagEnumMap, e))
        .toList(),
    source: json['source'] as String?,
    codeDescription: json['codeDescription'] == null
        ? null
        : CodeDescription.fromJson(
            json['codeDescription'] as Map<String, dynamic>,
          ),
    code: json['code'],
    severity: $enumDecodeNullable(
      _$DiagnosticSeverityEnumMap,
      json['severity'],
    ),
  );
}

Map<String, dynamic> _$DiagnosticToJson(_Diagnostic instance) =>
    <String, dynamic>{
      'range': instance.range,
      'message': instance.message,
      'data': ?instance.data,
      'relatedInformation': ?instance.relatedInformation,
      'tags': ?instance.tags?.map((e) => _$DiagnosticTagEnumMap[e]!).toList(),
      'source': ?instance.source,
      'codeDescription': ?instance.codeDescription,
      'code': ?instance.code,
      'severity': ?_$DiagnosticSeverityEnumMap[instance.severity],
    };

const _$DiagnosticTagEnumMap = {
  DiagnosticTag.unnecessary: 1,
  DiagnosticTag.deprecated_: 2,
};

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.error: 1,
  DiagnosticSeverity.warning: 2,
  DiagnosticSeverity.information: 3,
  DiagnosticSeverity.hint: 4,
};

_CompletionContext _$CompletionContextFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['triggerKind', 'triggerCharacter']);
  return _CompletionContext(
    triggerKind: $enumDecode(
      _$CompletionTriggerKindEnumMap,
      json['triggerKind'],
    ),
    triggerCharacter: json['triggerCharacter'] as String?,
  );
}

Map<String, dynamic> _$CompletionContextToJson(_CompletionContext instance) =>
    <String, dynamic>{
      'triggerKind': _$CompletionTriggerKindEnumMap[instance.triggerKind]!,
      'triggerCharacter': ?instance.triggerCharacter,
    };

const _$CompletionTriggerKindEnumMap = {
  CompletionTriggerKind.invoked: 1,
  CompletionTriggerKind.triggerCharacter: 2,
  CompletionTriggerKind.triggerForIncompleteCompletions: 3,
};

_CompletionItemLabelDetails _$CompletionItemLabelDetailsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['description', 'detail']);
  return _CompletionItemLabelDetails(
    description: json['description'] as String?,
    detail: json['detail'] as String?,
  );
}

Map<String, dynamic> _$CompletionItemLabelDetailsToJson(
  _CompletionItemLabelDetails instance,
) => <String, dynamic>{
  'description': ?instance.description,
  'detail': ?instance.detail,
};

_InsertReplaceEdit _$InsertReplaceEditFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['newText', 'insert', 'replace']);
  return _InsertReplaceEdit(
    newText: json['newText'] as String,
    insert: Range.fromJson(json['insert'] as Map<String, dynamic>),
    replace: Range.fromJson(json['replace'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InsertReplaceEditToJson(_InsertReplaceEdit instance) =>
    <String, dynamic>{
      'newText': instance.newText,
      'insert': instance.insert,
      'replace': instance.replace,
    };

_CompletionOptions _$CompletionOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'completionItem',
      'resolveProvider',
      'allCommitCharacters',
      'triggerCharacters',
      'workDoneProgress',
    ],
  );
  return _CompletionOptions(
    completionItem: _$recordConvertNullable(
      json['completionItem'],
      ($jsonValue) =>
          (labelDetailsSupport: $jsonValue['labelDetailsSupport'] as bool?),
    ),
    resolveProvider: json['resolveProvider'] as bool?,
    allCommitCharacters: (json['allCommitCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CompletionOptionsToJson(
  _CompletionOptions instance,
) => <String, dynamic>{
  'completionItem': ?instance.completionItem == null
      ? null
      : <String, dynamic>{
          'labelDetailsSupport': instance.completionItem!.labelDetailsSupport,
        },
  'resolveProvider': ?instance.resolveProvider,
  'allCommitCharacters': ?instance.allCommitCharacters,
  'triggerCharacters': ?instance.triggerCharacters,
  'workDoneProgress': ?instance.workDoneProgress,
};

_HoverOptions _$HoverOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _HoverOptions(workDoneProgress: json['workDoneProgress'] as bool?);
}

Map<String, dynamic> _$HoverOptionsToJson(_HoverOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_SignatureHelpContext _$SignatureHelpContextFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'triggerKind',
      'isRetrigger',
      'activeSignatureHelp',
      'triggerCharacter',
    ],
  );
  return _SignatureHelpContext(
    triggerKind: $enumDecode(
      _$SignatureHelpTriggerKindEnumMap,
      json['triggerKind'],
    ),
    isRetrigger: json['isRetrigger'] as bool,
    activeSignatureHelp: json['activeSignatureHelp'] == null
        ? null
        : SignatureHelp.fromJson(
            json['activeSignatureHelp'] as Map<String, dynamic>,
          ),
    triggerCharacter: json['triggerCharacter'] as String?,
  );
}

Map<String, dynamic> _$SignatureHelpContextToJson(
  _SignatureHelpContext instance,
) => <String, dynamic>{
  'triggerKind': _$SignatureHelpTriggerKindEnumMap[instance.triggerKind]!,
  'isRetrigger': instance.isRetrigger,
  'activeSignatureHelp': ?instance.activeSignatureHelp,
  'triggerCharacter': ?instance.triggerCharacter,
};

const _$SignatureHelpTriggerKindEnumMap = {
  SignatureHelpTriggerKind.invoked: 1,
  SignatureHelpTriggerKind.triggerCharacter: 2,
  SignatureHelpTriggerKind.contentChange: 3,
};

_SignatureInformation _$SignatureInformationFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'label',
      'activeParameter',
      'parameters',
      'documentation',
    ],
  );
  return _SignatureInformation(
    label: json['label'] as String,
    activeParameter: (json['activeParameter'] as num?)?.toInt(),
    parameters: (json['parameters'] as List<dynamic>?)
        ?.map((e) => ParameterInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
    documentation: json['documentation'],
  );
}

Map<String, dynamic> _$SignatureInformationToJson(
  _SignatureInformation instance,
) => <String, dynamic>{
  'label': instance.label,
  'activeParameter': ?instance.activeParameter,
  'parameters': ?instance.parameters,
  'documentation': ?instance.documentation,
};

_SignatureHelpOptions _$SignatureHelpOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'retriggerCharacters',
      'triggerCharacters',
      'workDoneProgress',
    ],
  );
  return _SignatureHelpOptions(
    retriggerCharacters: (json['retriggerCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$SignatureHelpOptionsToJson(
  _SignatureHelpOptions instance,
) => <String, dynamic>{
  'retriggerCharacters': ?instance.retriggerCharacters,
  'triggerCharacters': ?instance.triggerCharacters,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DefinitionOptions _$DefinitionOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _DefinitionOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DefinitionOptionsToJson(_DefinitionOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_ReferenceContext _$ReferenceContextFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['includeDeclaration']);
  return _ReferenceContext(
    includeDeclaration: json['includeDeclaration'] as bool,
  );
}

Map<String, dynamic> _$ReferenceContextToJson(_ReferenceContext instance) =>
    <String, dynamic>{'includeDeclaration': instance.includeDeclaration};

_ReferenceOptions _$ReferenceOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _ReferenceOptions(workDoneProgress: json['workDoneProgress'] as bool?);
}

Map<String, dynamic> _$ReferenceOptionsToJson(_ReferenceOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_DocumentHighlightOptions _$DocumentHighlightOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _DocumentHighlightOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentHighlightOptionsToJson(
  _DocumentHighlightOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_BaseSymbolInformation _$BaseSymbolInformationFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'kind', 'containerName', 'tags'],
  );
  return _BaseSymbolInformation(
    name: json['name'] as String,
    kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
    containerName: json['containerName'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$BaseSymbolInformationToJson(
  _BaseSymbolInformation instance,
) => <String, dynamic>{
  'name': instance.name,
  'kind': _$SymbolKindEnumMap[instance.kind]!,
  'containerName': ?instance.containerName,
  'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
};

_DocumentSymbolOptions _$DocumentSymbolOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['label', 'workDoneProgress']);
  return _DocumentSymbolOptions(
    label: json['label'] as String?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentSymbolOptionsToJson(
  _DocumentSymbolOptions instance,
) => <String, dynamic>{
  'label': ?instance.label,
  'workDoneProgress': ?instance.workDoneProgress,
};

_CodeActionContext _$CodeActionContextFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['diagnostics', 'triggerKind', 'only']);
  return _CodeActionContext(
    diagnostics: (json['diagnostics'] as List<dynamic>)
        .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
        .toList(),
    triggerKind: $enumDecodeNullable(
      _$CodeActionTriggerKindEnumMap,
      json['triggerKind'],
    ),
    only: (json['only'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$CodeActionKindEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$CodeActionContextToJson(_CodeActionContext instance) =>
    <String, dynamic>{
      'diagnostics': instance.diagnostics,
      'triggerKind': ?_$CodeActionTriggerKindEnumMap[instance.triggerKind],
      'only': ?instance.only?.map((e) => _$CodeActionKindEnumMap[e]!).toList(),
    };

const _$CodeActionTriggerKindEnumMap = {
  CodeActionTriggerKind.invoked: 1,
  CodeActionTriggerKind.automatic: 2,
};

_CodeActionOptions _$CodeActionOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resolveProvider',
      'codeActionKinds',
      'workDoneProgress',
    ],
  );
  return _CodeActionOptions(
    resolveProvider: json['resolveProvider'] as bool?,
    codeActionKinds: (json['codeActionKinds'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$CodeActionKindEnumMap, e))
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CodeActionOptionsToJson(_CodeActionOptions instance) =>
    <String, dynamic>{
      'resolveProvider': ?instance.resolveProvider,
      'codeActionKinds': ?instance.codeActionKinds
          ?.map((e) => _$CodeActionKindEnumMap[e]!)
          .toList(),
      'workDoneProgress': ?instance.workDoneProgress,
    };

_WorkspaceSymbolOptions _$WorkspaceSymbolOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  return _WorkspaceSymbolOptions(
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$WorkspaceSymbolOptionsToJson(
  _WorkspaceSymbolOptions instance,
) => <String, dynamic>{
  'resolveProvider': ?instance.resolveProvider,
  'workDoneProgress': ?instance.workDoneProgress,
};

_CodeLensOptions _$CodeLensOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  return _CodeLensOptions(
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$CodeLensOptionsToJson(_CodeLensOptions instance) =>
    <String, dynamic>{
      'resolveProvider': ?instance.resolveProvider,
      'workDoneProgress': ?instance.workDoneProgress,
    };

_DocumentLinkOptions _$DocumentLinkOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  return _DocumentLinkOptions(
    resolveProvider: json['resolveProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentLinkOptionsToJson(
  _DocumentLinkOptions instance,
) => <String, dynamic>{
  'resolveProvider': ?instance.resolveProvider,
  'workDoneProgress': ?instance.workDoneProgress,
};

_FormattingOptions _$FormattingOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'tabSize',
      'insertSpaces',
      'trimFinalNewlines',
      'insertFinalNewline',
      'trimTrailingWhitespace',
    ],
  );
  return _FormattingOptions(
    tabSize: (json['tabSize'] as num).toInt(),
    insertSpaces: json['insertSpaces'] as bool,
    trimFinalNewlines: json['trimFinalNewlines'] as bool?,
    insertFinalNewline: json['insertFinalNewline'] as bool?,
    trimTrailingWhitespace: json['trimTrailingWhitespace'] as bool?,
  );
}

Map<String, dynamic> _$FormattingOptionsToJson(_FormattingOptions instance) =>
    <String, dynamic>{
      'tabSize': instance.tabSize,
      'insertSpaces': instance.insertSpaces,
      'trimFinalNewlines': ?instance.trimFinalNewlines,
      'insertFinalNewline': ?instance.insertFinalNewline,
      'trimTrailingWhitespace': ?instance.trimTrailingWhitespace,
    };

_DocumentFormattingOptions _$DocumentFormattingOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  return _DocumentFormattingOptions(
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentFormattingOptionsToJson(
  _DocumentFormattingOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_DocumentRangeFormattingOptions _$DocumentRangeFormattingOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['rangesSupport', 'workDoneProgress']);
  return _DocumentRangeFormattingOptions(
    rangesSupport: json['rangesSupport'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$DocumentRangeFormattingOptionsToJson(
  _DocumentRangeFormattingOptions instance,
) => <String, dynamic>{
  'rangesSupport': ?instance.rangesSupport,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentOnTypeFormattingOptions _$DocumentOnTypeFormattingOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['firstTriggerCharacter', 'moreTriggerCharacter'],
  );
  return _DocumentOnTypeFormattingOptions(
    firstTriggerCharacter: json['firstTriggerCharacter'] as String,
    moreTriggerCharacter: (json['moreTriggerCharacter'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$DocumentOnTypeFormattingOptionsToJson(
  _DocumentOnTypeFormattingOptions instance,
) => <String, dynamic>{
  'firstTriggerCharacter': instance.firstTriggerCharacter,
  'moreTriggerCharacter': ?instance.moreTriggerCharacter,
};

_RenameOptions _$RenameOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['prepareProvider', 'workDoneProgress']);
  return _RenameOptions(
    prepareProvider: json['prepareProvider'] as bool?,
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$RenameOptionsToJson(_RenameOptions instance) =>
    <String, dynamic>{
      'prepareProvider': ?instance.prepareProvider,
      'workDoneProgress': ?instance.workDoneProgress,
    };

_ExecuteCommandOptions _$ExecuteCommandOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['commands', 'workDoneProgress']);
  return _ExecuteCommandOptions(
    commands: (json['commands'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    workDoneProgress: json['workDoneProgress'] as bool?,
  );
}

Map<String, dynamic> _$ExecuteCommandOptionsToJson(
  _ExecuteCommandOptions instance,
) => <String, dynamic>{
  'commands': instance.commands,
  'workDoneProgress': ?instance.workDoneProgress,
};

_SemanticTokensLegend _$SemanticTokensLegendFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['tokenTypes', 'tokenModifiers']);
  return _SemanticTokensLegend(
    tokenTypes: (json['tokenTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    tokenModifiers: (json['tokenModifiers'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$SemanticTokensLegendToJson(
  _SemanticTokensLegend instance,
) => <String, dynamic>{
  'tokenTypes': instance.tokenTypes,
  'tokenModifiers': instance.tokenModifiers,
};

_OptionalVersionedTextDocumentIdentifier
_$OptionalVersionedTextDocumentIdentifierFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['uri', 'version']);
  return _OptionalVersionedTextDocumentIdentifier(
    uri: json['uri'] as String,
    version: json['version'],
  );
}

Map<String, dynamic> _$OptionalVersionedTextDocumentIdentifierToJson(
  _OptionalVersionedTextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri, 'version': ?instance.version};

_AnnotatedTextEdit _$AnnotatedTextEditFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['range', 'newText', 'annotationId']);
  return _AnnotatedTextEdit(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    newText: json['newText'] as String,
    annotationId: json['annotationId'] as String,
  );
}

Map<String, dynamic> _$AnnotatedTextEditToJson(_AnnotatedTextEdit instance) =>
    <String, dynamic>{
      'range': instance.range,
      'newText': instance.newText,
      'annotationId': instance.annotationId,
    };

_ResourceOperation _$ResourceOperationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'annotationId']);
  return _ResourceOperation(
    kind: json['kind'] as String,
    annotationId: json['annotationId'] as String?,
  );
}

Map<String, dynamic> _$ResourceOperationToJson(_ResourceOperation instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'annotationId': ?instance.annotationId,
    };

_CreateFileOptions _$CreateFileOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['ignoreIfExists', 'overwrite']);
  return _CreateFileOptions(
    ignoreIfExists: json['ignoreIfExists'] as bool?,
    overwrite: json['overwrite'] as bool?,
  );
}

Map<String, dynamic> _$CreateFileOptionsToJson(_CreateFileOptions instance) =>
    <String, dynamic>{
      'ignoreIfExists': ?instance.ignoreIfExists,
      'overwrite': ?instance.overwrite,
    };

_RenameFileOptions _$RenameFileOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['ignoreIfExists', 'overwrite']);
  return _RenameFileOptions(
    ignoreIfExists: json['ignoreIfExists'] as bool?,
    overwrite: json['overwrite'] as bool?,
  );
}

Map<String, dynamic> _$RenameFileOptionsToJson(_RenameFileOptions instance) =>
    <String, dynamic>{
      'ignoreIfExists': ?instance.ignoreIfExists,
      'overwrite': ?instance.overwrite,
    };

_DeleteFileOptions _$DeleteFileOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['ignoreIfNotExists', 'recursive']);
  return _DeleteFileOptions(
    ignoreIfNotExists: json['ignoreIfNotExists'] as bool?,
    recursive: json['recursive'] as bool?,
  );
}

Map<String, dynamic> _$DeleteFileOptionsToJson(_DeleteFileOptions instance) =>
    <String, dynamic>{
      'ignoreIfNotExists': ?instance.ignoreIfNotExists,
      'recursive': ?instance.recursive,
    };

_FileOperationPattern _$FileOperationPatternFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['glob', 'options', 'matches']);
  return _FileOperationPattern(
    glob: json['glob'] as String,
    options: json['options'] == null
        ? null
        : FileOperationPatternOptions.fromJson(
            json['options'] as Map<String, dynamic>,
          ),
    matches: $enumDecodeNullable(
      _$FileOperationPatternKindEnumMap,
      json['matches'],
    ),
  );
}

Map<String, dynamic> _$FileOperationPatternToJson(
  _FileOperationPattern instance,
) => <String, dynamic>{
  'glob': instance.glob,
  'options': ?instance.options,
  'matches': ?_$FileOperationPatternKindEnumMap[instance.matches],
};

const _$FileOperationPatternKindEnumMap = {
  FileOperationPatternKind.file: 'file',
  FileOperationPatternKind.folder: 'folder',
};

_WorkspaceFullDocumentDiagnosticReport
_$WorkspaceFullDocumentDiagnosticReportFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'items', 'uri', 'version', 'resultId'],
  );
  return _WorkspaceFullDocumentDiagnosticReport(
    kind: json['kind'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
        .toList(),
    uri: json['uri'] as String,
    version: json['version'],
    resultId: json['resultId'] as String?,
  );
}

Map<String, dynamic> _$WorkspaceFullDocumentDiagnosticReportToJson(
  _WorkspaceFullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'items': instance.items,
  'uri': instance.uri,
  'version': ?instance.version,
  'resultId': ?instance.resultId,
};

_WorkspaceUnchangedDocumentDiagnosticReport
_$WorkspaceUnchangedDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['kind', 'resultId', 'uri', 'version']);
  return _WorkspaceUnchangedDocumentDiagnosticReport(
    kind: json['kind'] as String,
    resultId: json['resultId'] as String,
    uri: json['uri'] as String,
    version: json['version'],
  );
}

Map<String, dynamic> _$WorkspaceUnchangedDocumentDiagnosticReportToJson(
  _WorkspaceUnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': instance.resultId,
  'uri': instance.uri,
  'version': ?instance.version,
};

_NotebookCell _$NotebookCellFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'document', 'executionSummary', 'metadata'],
  );
  return _NotebookCell(
    kind: $enumDecode(_$NotebookCellKindEnumMap, json['kind']),
    document: json['document'] as String,
    executionSummary: json['executionSummary'] == null
        ? null
        : ExecutionSummary.fromJson(
            json['executionSummary'] as Map<String, dynamic>,
          ),
    metadata: json['metadata'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$NotebookCellToJson(_NotebookCell instance) =>
    <String, dynamic>{
      'kind': _$NotebookCellKindEnumMap[instance.kind]!,
      'document': instance.document,
      'executionSummary': ?instance.executionSummary,
      'metadata': ?instance.metadata,
    };

const _$NotebookCellKindEnumMap = {
  NotebookCellKind.markup: 1,
  NotebookCellKind.code: 2,
};

_NotebookCellArrayChange _$NotebookCellArrayChangeFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['start', 'deleteCount', 'cells']);
  return _NotebookCellArrayChange(
    start: (json['start'] as num).toInt(),
    deleteCount: (json['deleteCount'] as num).toInt(),
    cells: (json['cells'] as List<dynamic>?)
        ?.map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NotebookCellArrayChangeToJson(
  _NotebookCellArrayChange instance,
) => <String, dynamic>{
  'start': instance.start,
  'deleteCount': instance.deleteCount,
  'cells': ?instance.cells,
};

_SelectedCompletionInfo _$SelectedCompletionInfoFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['range', 'text']);
  return _SelectedCompletionInfo(
    range: Range.fromJson(json['range'] as Map<String, dynamic>),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$SelectedCompletionInfoToJson(
  _SelectedCompletionInfo instance,
) => <String, dynamic>{'range': instance.range, 'text': instance.text};

_ClientCapabilities _$ClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'experimental',
      'general',
      'window',
      'notebookDocument',
      'textDocument',
      'workspace',
    ],
  );
  return _ClientCapabilities(
    experimental: json['experimental'],
    general: json['general'] == null
        ? null
        : GeneralClientCapabilities.fromJson(
            json['general'] as Map<String, dynamic>,
          ),
    window: json['window'] == null
        ? null
        : WindowClientCapabilities.fromJson(
            json['window'] as Map<String, dynamic>,
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
    workspace: json['workspace'] == null
        ? null
        : WorkspaceClientCapabilities.fromJson(
            json['workspace'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$ClientCapabilitiesToJson(_ClientCapabilities instance) =>
    <String, dynamic>{
      'experimental': ?instance.experimental,
      'general': ?instance.general,
      'window': ?instance.window,
      'notebookDocument': ?instance.notebookDocument,
      'textDocument': ?instance.textDocument,
      'workspace': ?instance.workspace,
    };

_TextDocumentSyncOptions _$TextDocumentSyncOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'save',
      'willSaveWaitUntil',
      'willSave',
      'change',
      'openClose',
    ],
  );
  return _TextDocumentSyncOptions(
    save: json['save'],
    willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
    willSave: json['willSave'] as bool?,
    change: $enumDecodeNullable(_$TextDocumentSyncKindEnumMap, json['change']),
    openClose: json['openClose'] as bool?,
  );
}

Map<String, dynamic> _$TextDocumentSyncOptionsToJson(
  _TextDocumentSyncOptions instance,
) => <String, dynamic>{
  'save': ?instance.save,
  'willSaveWaitUntil': ?instance.willSaveWaitUntil,
  'willSave': ?instance.willSave,
  'change': ?_$TextDocumentSyncKindEnumMap[instance.change],
  'openClose': ?instance.openClose,
};

_NotebookDocumentSyncOptions _$NotebookDocumentSyncOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['notebookSelector', 'save']);
  return _NotebookDocumentSyncOptions(
    notebookSelector: json['notebookSelector'] as List<dynamic>,
    save: json['save'] as bool?,
  );
}

Map<String, dynamic> _$NotebookDocumentSyncOptionsToJson(
  _NotebookDocumentSyncOptions instance,
) => <String, dynamic>{
  'notebookSelector': instance.notebookSelector,
  'save': ?instance.save,
};

_NotebookDocumentSyncRegistrationOptions
_$NotebookDocumentSyncRegistrationOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['notebookSelector', 'id', 'save']);
  return _NotebookDocumentSyncRegistrationOptions(
    notebookSelector: json['notebookSelector'] as List<dynamic>,
    id: json['id'] as String?,
    save: json['save'] as bool?,
  );
}

Map<String, dynamic> _$NotebookDocumentSyncRegistrationOptionsToJson(
  _NotebookDocumentSyncRegistrationOptions instance,
) => <String, dynamic>{
  'notebookSelector': instance.notebookSelector,
  'id': ?instance.id,
  'save': ?instance.save,
};

_WorkspaceFoldersServerCapabilities
_$WorkspaceFoldersServerCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['changeNotifications', 'supported']);
  return _WorkspaceFoldersServerCapabilities(
    changeNotifications: json['changeNotifications'],
    supported: json['supported'] as bool?,
  );
}

Map<String, dynamic> _$WorkspaceFoldersServerCapabilitiesToJson(
  _WorkspaceFoldersServerCapabilities instance,
) => <String, dynamic>{
  'changeNotifications': ?instance.changeNotifications,
  'supported': ?instance.supported,
};

_FileOperationOptions _$FileOperationOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'willDelete',
      'didDelete',
      'willRename',
      'didRename',
      'willCreate',
      'didCreate',
    ],
  );
  return _FileOperationOptions(
    willDelete: json['willDelete'] == null
        ? null
        : FileOperationRegistrationOptions.fromJson(
            json['willDelete'] as Map<String, dynamic>,
          ),
    didDelete: json['didDelete'] == null
        ? null
        : FileOperationRegistrationOptions.fromJson(
            json['didDelete'] as Map<String, dynamic>,
          ),
    willRename: json['willRename'] == null
        ? null
        : FileOperationRegistrationOptions.fromJson(
            json['willRename'] as Map<String, dynamic>,
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
    didCreate: json['didCreate'] == null
        ? null
        : FileOperationRegistrationOptions.fromJson(
            json['didCreate'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$FileOperationOptionsToJson(
  _FileOperationOptions instance,
) => <String, dynamic>{
  'willDelete': ?instance.willDelete,
  'didDelete': ?instance.didDelete,
  'willRename': ?instance.willRename,
  'didRename': ?instance.didRename,
  'willCreate': ?instance.willCreate,
  'didCreate': ?instance.didCreate,
};

_CodeDescription _$CodeDescriptionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['href']);
  return _CodeDescription(href: json['href'] as String);
}

Map<String, dynamic> _$CodeDescriptionToJson(_CodeDescription instance) =>
    <String, dynamic>{'href': instance.href};

_DiagnosticRelatedInformation _$DiagnosticRelatedInformationFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['location', 'message']);
  return _DiagnosticRelatedInformation(
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$DiagnosticRelatedInformationToJson(
  _DiagnosticRelatedInformation instance,
) => <String, dynamic>{
  'location': instance.location,
  'message': instance.message,
};

_ParameterInformation _$ParameterInformationFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['label', 'documentation']);
  return _ParameterInformation(
    label: json['label'],
    documentation: json['documentation'],
  );
}

Map<String, dynamic> _$ParameterInformationToJson(
  _ParameterInformation instance,
) => <String, dynamic>{
  'label': ?instance.label,
  'documentation': ?instance.documentation,
};

_NotebookCellTextDocumentFilter _$NotebookCellTextDocumentFilterFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['notebook', 'language']);
  return _NotebookCellTextDocumentFilter(
    notebook: json['notebook'],
    language: json['language'] as String?,
  );
}

Map<String, dynamic> _$NotebookCellTextDocumentFilterToJson(
  _NotebookCellTextDocumentFilter instance,
) => <String, dynamic>{
  'notebook': ?instance.notebook,
  'language': ?instance.language,
};

_FileOperationPatternOptions _$FileOperationPatternOptionsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['ignoreCase']);
  return _FileOperationPatternOptions(ignoreCase: json['ignoreCase'] as bool?);
}

Map<String, dynamic> _$FileOperationPatternOptionsToJson(
  _FileOperationPatternOptions instance,
) => <String, dynamic>{'ignoreCase': ?instance.ignoreCase};

_ExecutionSummary _$ExecutionSummaryFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['executionOrder', 'success']);
  return _ExecutionSummary(
    executionOrder: (json['executionOrder'] as num).toInt(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$ExecutionSummaryToJson(_ExecutionSummary instance) =>
    <String, dynamic>{
      'executionOrder': instance.executionOrder,
      'success': ?instance.success,
    };

_WorkspaceClientCapabilities _$WorkspaceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'foldingRange',
      'diagnostics',
      'inlayHint',
      'inlineValue',
      'fileOperations',
      'codeLens',
      'semanticTokens',
      'configuration',
      'workspaceFolders',
      'executeCommand',
      'symbol',
      'didChangeWatchedFiles',
      'didChangeConfiguration',
      'workspaceEdit',
      'applyEdit',
    ],
  );
  return _WorkspaceClientCapabilities(
    foldingRange: json['foldingRange'] == null
        ? null
        : FoldingRangeWorkspaceClientCapabilities.fromJson(
            json['foldingRange'] as Map<String, dynamic>,
          ),
    diagnostics: json['diagnostics'] == null
        ? null
        : DiagnosticWorkspaceClientCapabilities.fromJson(
            json['diagnostics'] as Map<String, dynamic>,
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
    fileOperations: json['fileOperations'] == null
        ? null
        : FileOperationClientCapabilities.fromJson(
            json['fileOperations'] as Map<String, dynamic>,
          ),
    codeLens: json['codeLens'] == null
        ? null
        : CodeLensWorkspaceClientCapabilities.fromJson(
            json['codeLens'] as Map<String, dynamic>,
          ),
    semanticTokens: json['semanticTokens'] == null
        ? null
        : SemanticTokensWorkspaceClientCapabilities.fromJson(
            json['semanticTokens'] as Map<String, dynamic>,
          ),
    configuration: json['configuration'] as bool?,
    workspaceFolders: json['workspaceFolders'] as bool?,
    executeCommand: json['executeCommand'] == null
        ? null
        : ExecuteCommandClientCapabilities.fromJson(
            json['executeCommand'] as Map<String, dynamic>,
          ),
    symbol: json['symbol'] == null
        ? null
        : WorkspaceSymbolClientCapabilities.fromJson(
            json['symbol'] as Map<String, dynamic>,
          ),
    didChangeWatchedFiles: json['didChangeWatchedFiles'] == null
        ? null
        : DidChangeWatchedFilesClientCapabilities.fromJson(
            json['didChangeWatchedFiles'] as Map<String, dynamic>,
          ),
    didChangeConfiguration: json['didChangeConfiguration'] == null
        ? null
        : DidChangeConfigurationClientCapabilities.fromJson(
            json['didChangeConfiguration'] as Map<String, dynamic>,
          ),
    workspaceEdit: json['workspaceEdit'] == null
        ? null
        : WorkspaceEditClientCapabilities.fromJson(
            json['workspaceEdit'] as Map<String, dynamic>,
          ),
    applyEdit: json['applyEdit'] as bool?,
  );
}

Map<String, dynamic> _$WorkspaceClientCapabilitiesToJson(
  _WorkspaceClientCapabilities instance,
) => <String, dynamic>{
  'foldingRange': ?instance.foldingRange,
  'diagnostics': ?instance.diagnostics,
  'inlayHint': ?instance.inlayHint,
  'inlineValue': ?instance.inlineValue,
  'fileOperations': ?instance.fileOperations,
  'codeLens': ?instance.codeLens,
  'semanticTokens': ?instance.semanticTokens,
  'configuration': ?instance.configuration,
  'workspaceFolders': ?instance.workspaceFolders,
  'executeCommand': ?instance.executeCommand,
  'symbol': ?instance.symbol,
  'didChangeWatchedFiles': ?instance.didChangeWatchedFiles,
  'didChangeConfiguration': ?instance.didChangeConfiguration,
  'workspaceEdit': ?instance.workspaceEdit,
  'applyEdit': ?instance.applyEdit,
};

_TextDocumentClientCapabilities _$TextDocumentClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'inlineCompletion',
      'diagnostic',
      'inlayHint',
      'inlineValue',
      'typeHierarchy',
      'moniker',
      'linkedEditingRange',
      'semanticTokens',
      'callHierarchy',
      'publishDiagnostics',
      'selectionRange',
      'foldingRange',
      'rename',
      'onTypeFormatting',
      'rangeFormatting',
      'formatting',
      'colorProvider',
      'documentLink',
      'codeLens',
      'codeAction',
      'documentSymbol',
      'documentHighlight',
      'references',
      'implementation',
      'typeDefinition',
      'definition',
      'declaration',
      'signatureHelp',
      'hover',
      'completion',
      'synchronization',
    ],
  );
  return _TextDocumentClientCapabilities(
    inlineCompletion: json['inlineCompletion'] == null
        ? null
        : InlineCompletionClientCapabilities.fromJson(
            json['inlineCompletion'] as Map<String, dynamic>,
          ),
    diagnostic: json['diagnostic'] == null
        ? null
        : DiagnosticClientCapabilities.fromJson(
            json['diagnostic'] as Map<String, dynamic>,
          ),
    inlayHint: json['inlayHint'] == null
        ? null
        : InlayHintClientCapabilities.fromJson(
            json['inlayHint'] as Map<String, dynamic>,
          ),
    inlineValue: json['inlineValue'] == null
        ? null
        : InlineValueClientCapabilities.fromJson(
            json['inlineValue'] as Map<String, dynamic>,
          ),
    typeHierarchy: json['typeHierarchy'] == null
        ? null
        : TypeHierarchyClientCapabilities.fromJson(
            json['typeHierarchy'] as Map<String, dynamic>,
          ),
    moniker: json['moniker'] == null
        ? null
        : MonikerClientCapabilities.fromJson(
            json['moniker'] as Map<String, dynamic>,
          ),
    linkedEditingRange: json['linkedEditingRange'] == null
        ? null
        : LinkedEditingRangeClientCapabilities.fromJson(
            json['linkedEditingRange'] as Map<String, dynamic>,
          ),
    semanticTokens: json['semanticTokens'] == null
        ? null
        : SemanticTokensClientCapabilities.fromJson(
            json['semanticTokens'] as Map<String, dynamic>,
          ),
    callHierarchy: json['callHierarchy'] == null
        ? null
        : CallHierarchyClientCapabilities.fromJson(
            json['callHierarchy'] as Map<String, dynamic>,
          ),
    publishDiagnostics: json['publishDiagnostics'] == null
        ? null
        : PublishDiagnosticsClientCapabilities.fromJson(
            json['publishDiagnostics'] as Map<String, dynamic>,
          ),
    selectionRange: json['selectionRange'] == null
        ? null
        : SelectionRangeClientCapabilities.fromJson(
            json['selectionRange'] as Map<String, dynamic>,
          ),
    foldingRange: json['foldingRange'] == null
        ? null
        : FoldingRangeClientCapabilities.fromJson(
            json['foldingRange'] as Map<String, dynamic>,
          ),
    rename: json['rename'] == null
        ? null
        : RenameClientCapabilities.fromJson(
            json['rename'] as Map<String, dynamic>,
          ),
    onTypeFormatting: json['onTypeFormatting'] == null
        ? null
        : DocumentOnTypeFormattingClientCapabilities.fromJson(
            json['onTypeFormatting'] as Map<String, dynamic>,
          ),
    rangeFormatting: json['rangeFormatting'] == null
        ? null
        : DocumentRangeFormattingClientCapabilities.fromJson(
            json['rangeFormatting'] as Map<String, dynamic>,
          ),
    formatting: json['formatting'] == null
        ? null
        : DocumentFormattingClientCapabilities.fromJson(
            json['formatting'] as Map<String, dynamic>,
          ),
    colorProvider: json['colorProvider'] == null
        ? null
        : DocumentColorClientCapabilities.fromJson(
            json['colorProvider'] as Map<String, dynamic>,
          ),
    documentLink: json['documentLink'] == null
        ? null
        : DocumentLinkClientCapabilities.fromJson(
            json['documentLink'] as Map<String, dynamic>,
          ),
    codeLens: json['codeLens'] == null
        ? null
        : CodeLensClientCapabilities.fromJson(
            json['codeLens'] as Map<String, dynamic>,
          ),
    codeAction: json['codeAction'] == null
        ? null
        : CodeActionClientCapabilities.fromJson(
            json['codeAction'] as Map<String, dynamic>,
          ),
    documentSymbol: json['documentSymbol'] == null
        ? null
        : DocumentSymbolClientCapabilities.fromJson(
            json['documentSymbol'] as Map<String, dynamic>,
          ),
    documentHighlight: json['documentHighlight'] == null
        ? null
        : DocumentHighlightClientCapabilities.fromJson(
            json['documentHighlight'] as Map<String, dynamic>,
          ),
    references: json['references'] == null
        ? null
        : ReferenceClientCapabilities.fromJson(
            json['references'] as Map<String, dynamic>,
          ),
    implementation: json['implementation'] == null
        ? null
        : ImplementationClientCapabilities.fromJson(
            json['implementation'] as Map<String, dynamic>,
          ),
    typeDefinition: json['typeDefinition'] == null
        ? null
        : TypeDefinitionClientCapabilities.fromJson(
            json['typeDefinition'] as Map<String, dynamic>,
          ),
    definition: json['definition'] == null
        ? null
        : DefinitionClientCapabilities.fromJson(
            json['definition'] as Map<String, dynamic>,
          ),
    declaration: json['declaration'] == null
        ? null
        : DeclarationClientCapabilities.fromJson(
            json['declaration'] as Map<String, dynamic>,
          ),
    signatureHelp: json['signatureHelp'] == null
        ? null
        : SignatureHelpClientCapabilities.fromJson(
            json['signatureHelp'] as Map<String, dynamic>,
          ),
    hover: json['hover'] == null
        ? null
        : HoverClientCapabilities.fromJson(
            json['hover'] as Map<String, dynamic>,
          ),
    completion: json['completion'] == null
        ? null
        : CompletionClientCapabilities.fromJson(
            json['completion'] as Map<String, dynamic>,
          ),
    synchronization: json['synchronization'] == null
        ? null
        : TextDocumentSyncClientCapabilities.fromJson(
            json['synchronization'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$TextDocumentClientCapabilitiesToJson(
  _TextDocumentClientCapabilities instance,
) => <String, dynamic>{
  'inlineCompletion': ?instance.inlineCompletion,
  'diagnostic': ?instance.diagnostic,
  'inlayHint': ?instance.inlayHint,
  'inlineValue': ?instance.inlineValue,
  'typeHierarchy': ?instance.typeHierarchy,
  'moniker': ?instance.moniker,
  'linkedEditingRange': ?instance.linkedEditingRange,
  'semanticTokens': ?instance.semanticTokens,
  'callHierarchy': ?instance.callHierarchy,
  'publishDiagnostics': ?instance.publishDiagnostics,
  'selectionRange': ?instance.selectionRange,
  'foldingRange': ?instance.foldingRange,
  'rename': ?instance.rename,
  'onTypeFormatting': ?instance.onTypeFormatting,
  'rangeFormatting': ?instance.rangeFormatting,
  'formatting': ?instance.formatting,
  'colorProvider': ?instance.colorProvider,
  'documentLink': ?instance.documentLink,
  'codeLens': ?instance.codeLens,
  'codeAction': ?instance.codeAction,
  'documentSymbol': ?instance.documentSymbol,
  'documentHighlight': ?instance.documentHighlight,
  'references': ?instance.references,
  'implementation': ?instance.implementation,
  'typeDefinition': ?instance.typeDefinition,
  'definition': ?instance.definition,
  'declaration': ?instance.declaration,
  'signatureHelp': ?instance.signatureHelp,
  'hover': ?instance.hover,
  'completion': ?instance.completion,
  'synchronization': ?instance.synchronization,
};

_NotebookDocumentClientCapabilities
_$NotebookDocumentClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['synchronization']);
  return _NotebookDocumentClientCapabilities(
    synchronization: NotebookDocumentSyncClientCapabilities.fromJson(
      json['synchronization'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$NotebookDocumentClientCapabilitiesToJson(
  _NotebookDocumentClientCapabilities instance,
) => <String, dynamic>{'synchronization': instance.synchronization};

_WindowClientCapabilities _$WindowClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['showDocument', 'showMessage', 'workDoneProgress'],
  );
  return _WindowClientCapabilities(
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

Map<String, dynamic> _$WindowClientCapabilitiesToJson(
  _WindowClientCapabilities instance,
) => <String, dynamic>{
  'showDocument': ?instance.showDocument,
  'showMessage': ?instance.showMessage,
  'workDoneProgress': ?instance.workDoneProgress,
};

_GeneralClientCapabilities _$GeneralClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'positionEncodings',
      'markdown',
      'regularExpressions',
      'staleRequestSupport',
    ],
  );
  return _GeneralClientCapabilities(
    positionEncodings: (json['positionEncodings'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$PositionEncodingKindEnumMap, e))
        .toList(),
    markdown: json['markdown'] == null
        ? null
        : MarkdownClientCapabilities.fromJson(
            json['markdown'] as Map<String, dynamic>,
          ),
    regularExpressions: json['regularExpressions'] == null
        ? null
        : RegularExpressionsClientCapabilities.fromJson(
            json['regularExpressions'] as Map<String, dynamic>,
          ),
    staleRequestSupport: _$recordConvertNullable(
      json['staleRequestSupport'],
      ($jsonValue) => (
        cancel: $jsonValue['cancel'] as bool,
        retryOnContentModified:
            ($jsonValue['retryOnContentModified'] as List<dynamic>)
                .map((e) => e as String)
                .toList(),
      ),
    ),
  );
}

Map<String, dynamic> _$GeneralClientCapabilitiesToJson(
  _GeneralClientCapabilities instance,
) => <String, dynamic>{
  'positionEncodings': ?instance.positionEncodings
      ?.map((e) => _$PositionEncodingKindEnumMap[e]!)
      .toList(),
  'markdown': ?instance.markdown,
  'regularExpressions': ?instance.regularExpressions,
  'staleRequestSupport': ?instance.staleRequestSupport == null
      ? null
      : <String, dynamic>{
          'cancel': instance.staleRequestSupport!.cancel,
          'retryOnContentModified':
              instance.staleRequestSupport!.retryOnContentModified,
        },
};

_RelativePattern _$RelativePatternFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['baseUri', 'pattern']);
  return _RelativePattern(
    baseUri: json['baseUri'],
    pattern: json['pattern'] as String,
  );
}

Map<String, dynamic> _$RelativePatternToJson(_RelativePattern instance) =>
    <String, dynamic>{
      'baseUri': ?instance.baseUri,
      'pattern': instance.pattern,
    };

_WorkspaceEditClientCapabilities _$WorkspaceEditClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'changeAnnotationSupport',
      'normalizesLineEndings',
      'failureHandling',
      'resourceOperations',
      'documentChanges',
    ],
  );
  return _WorkspaceEditClientCapabilities(
    changeAnnotationSupport: _$recordConvertNullable(
      json['changeAnnotationSupport'],
      ($jsonValue) => (groupsOnLabel: $jsonValue['groupsOnLabel'] as bool?),
    ),
    normalizesLineEndings: json['normalizesLineEndings'] as bool?,
    failureHandling: $enumDecodeNullable(
      _$FailureHandlingKindEnumMap,
      json['failureHandling'],
    ),
    resourceOperations: (json['resourceOperations'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$ResourceOperationKindEnumMap, e))
        .toList(),
    documentChanges: json['documentChanges'] as bool?,
  );
}

Map<String, dynamic> _$WorkspaceEditClientCapabilitiesToJson(
  _WorkspaceEditClientCapabilities instance,
) => <String, dynamic>{
  'changeAnnotationSupport': ?instance.changeAnnotationSupport == null
      ? null
      : <String, dynamic>{
          'groupsOnLabel': instance.changeAnnotationSupport!.groupsOnLabel,
        },
  'normalizesLineEndings': ?instance.normalizesLineEndings,
  'failureHandling': ?_$FailureHandlingKindEnumMap[instance.failureHandling],
  'resourceOperations': ?instance.resourceOperations
      ?.map((e) => _$ResourceOperationKindEnumMap[e]!)
      .toList(),
  'documentChanges': ?instance.documentChanges,
};

const _$FailureHandlingKindEnumMap = {
  FailureHandlingKind.abort: 'abort',
  FailureHandlingKind.transactional: 'transactional',
  FailureHandlingKind.textOnlyTransactional: 'textOnlyTransactional',
  FailureHandlingKind.undo: 'undo',
};

const _$ResourceOperationKindEnumMap = {
  ResourceOperationKind.create: 'create',
  ResourceOperationKind.rename: 'rename',
  ResourceOperationKind.delete: 'delete',
};

_DidChangeConfigurationClientCapabilities
_$DidChangeConfigurationClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _DidChangeConfigurationClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DidChangeConfigurationClientCapabilitiesToJson(
  _DidChangeConfigurationClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DidChangeWatchedFilesClientCapabilities
_$DidChangeWatchedFilesClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['relativePatternSupport', 'dynamicRegistration'],
  );
  return _DidChangeWatchedFilesClientCapabilities(
    relativePatternSupport: json['relativePatternSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DidChangeWatchedFilesClientCapabilitiesToJson(
  _DidChangeWatchedFilesClientCapabilities instance,
) => <String, dynamic>{
  'relativePatternSupport': ?instance.relativePatternSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_WorkspaceSymbolClientCapabilities _$WorkspaceSymbolClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resolveSupport',
      'tagSupport',
      'symbolKind',
      'dynamicRegistration',
    ],
  );
  return _WorkspaceSymbolClientCapabilities(
    resolveSupport: _$recordConvertNullable(
      json['resolveSupport'],
      ($jsonValue) => (
        properties: ($jsonValue['properties'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      ),
    ),
    tagSupport: _$recordConvertNullable(
      json['tagSupport'],
      ($jsonValue) => (
        valueSet: ($jsonValue['valueSet'] as List<dynamic>)
            .map((e) => $enumDecode(_$SymbolTagEnumMap, e))
            .toList(),
      ),
    ),
    symbolKind: _$recordConvertNullable(
      json['symbolKind'],
      ($jsonValue) => (
        valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
            ?.map((e) => $enumDecode(_$SymbolKindEnumMap, e))
            .toList(),
      ),
    ),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$WorkspaceSymbolClientCapabilitiesToJson(
  _WorkspaceSymbolClientCapabilities instance,
) => <String, dynamic>{
  'resolveSupport': ?instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
  'tagSupport': ?instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$SymbolTagEnumMap[e]!)
              .toList(),
        },
  'symbolKind': ?instance.symbolKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.symbolKind!.valueSet
              ?.map((e) => _$SymbolKindEnumMap[e]!)
              .toList(),
        },
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_ExecuteCommandClientCapabilities _$ExecuteCommandClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _ExecuteCommandClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$ExecuteCommandClientCapabilitiesToJson(
  _ExecuteCommandClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_SemanticTokensWorkspaceClientCapabilities
_$SemanticTokensWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['refreshSupport']);
  return _SemanticTokensWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );
}

Map<String, dynamic> _$SemanticTokensWorkspaceClientCapabilitiesToJson(
  _SemanticTokensWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_CodeLensWorkspaceClientCapabilities
_$CodeLensWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['refreshSupport']);
  return _CodeLensWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );
}

Map<String, dynamic> _$CodeLensWorkspaceClientCapabilitiesToJson(
  _CodeLensWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_FileOperationClientCapabilities _$FileOperationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'willDelete',
      'didDelete',
      'willRename',
      'didRename',
      'willCreate',
      'didCreate',
      'dynamicRegistration',
    ],
  );
  return _FileOperationClientCapabilities(
    willDelete: json['willDelete'] as bool?,
    didDelete: json['didDelete'] as bool?,
    willRename: json['willRename'] as bool?,
    didRename: json['didRename'] as bool?,
    willCreate: json['willCreate'] as bool?,
    didCreate: json['didCreate'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$FileOperationClientCapabilitiesToJson(
  _FileOperationClientCapabilities instance,
) => <String, dynamic>{
  'willDelete': ?instance.willDelete,
  'didDelete': ?instance.didDelete,
  'willRename': ?instance.willRename,
  'didRename': ?instance.didRename,
  'willCreate': ?instance.willCreate,
  'didCreate': ?instance.didCreate,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_InlineValueWorkspaceClientCapabilities
_$InlineValueWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['refreshSupport']);
  return _InlineValueWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );
}

Map<String, dynamic> _$InlineValueWorkspaceClientCapabilitiesToJson(
  _InlineValueWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_InlayHintWorkspaceClientCapabilities
_$InlayHintWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['refreshSupport']);
  return _InlayHintWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );
}

Map<String, dynamic> _$InlayHintWorkspaceClientCapabilitiesToJson(
  _InlayHintWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_DiagnosticWorkspaceClientCapabilities
_$DiagnosticWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['refreshSupport']);
  return _DiagnosticWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );
}

Map<String, dynamic> _$DiagnosticWorkspaceClientCapabilitiesToJson(
  _DiagnosticWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_FoldingRangeWorkspaceClientCapabilities
_$FoldingRangeWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['refreshSupport']);
  return _FoldingRangeWorkspaceClientCapabilities(
    refreshSupport: json['refreshSupport'] as bool?,
  );
}

Map<String, dynamic> _$FoldingRangeWorkspaceClientCapabilitiesToJson(
  _FoldingRangeWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_TextDocumentSyncClientCapabilities
_$TextDocumentSyncClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'didSave',
      'willSaveWaitUntil',
      'willSave',
      'dynamicRegistration',
    ],
  );
  return _TextDocumentSyncClientCapabilities(
    didSave: json['didSave'] as bool?,
    willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
    willSave: json['willSave'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$TextDocumentSyncClientCapabilitiesToJson(
  _TextDocumentSyncClientCapabilities instance,
) => <String, dynamic>{
  'didSave': ?instance.didSave,
  'willSaveWaitUntil': ?instance.willSaveWaitUntil,
  'willSave': ?instance.willSave,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_CompletionClientCapabilities _$CompletionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'completionList',
      'contextSupport',
      'insertTextMode',
      'completionItemKind',
      'completionItem',
      'dynamicRegistration',
    ],
  );
  return _CompletionClientCapabilities(
    completionList: _$recordConvertNullable(
      json['completionList'],
      ($jsonValue) => (
        itemDefaults: ($jsonValue['itemDefaults'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      ),
    ),
    contextSupport: json['contextSupport'] as bool?,
    insertTextMode: $enumDecodeNullable(
      _$InsertTextModeEnumMap,
      json['insertTextMode'],
    ),
    completionItemKind: _$recordConvertNullable(
      json['completionItemKind'],
      ($jsonValue) => (
        valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
            ?.map((e) => $enumDecode(_$CompletionItemKindEnumMap, e))
            .toList(),
      ),
    ),
    completionItem: _$recordConvertNullable(
      json['completionItem'],
      ($jsonValue) => (
        commitCharactersSupport: $jsonValue['commitCharactersSupport'] as bool?,
        deprecatedSupport: $jsonValue['deprecatedSupport'] as bool?,
        documentationFormat:
            ($jsonValue['documentationFormat'] as List<dynamic>?)
                ?.map((e) => $enumDecode(_$MarkupKindEnumMap, e))
                .toList(),
        insertReplaceSupport: $jsonValue['insertReplaceSupport'] as bool?,
        insertTextModeSupport: _$recordConvertNullable(
          $jsonValue['insertTextModeSupport'],
          ($jsonValue) => (
            valueSet: ($jsonValue['valueSet'] as List<dynamic>)
                .map((e) => $enumDecode(_$InsertTextModeEnumMap, e))
                .toList(),
          ),
        ),
        labelDetailsSupport: $jsonValue['labelDetailsSupport'] as bool?,
        preselectSupport: $jsonValue['preselectSupport'] as bool?,
        resolveSupport: _$recordConvertNullable(
          $jsonValue['resolveSupport'],
          ($jsonValue) => (
            properties: ($jsonValue['properties'] as List<dynamic>)
                .map((e) => e as String)
                .toList(),
          ),
        ),
        snippetSupport: $jsonValue['snippetSupport'] as bool?,
        tagSupport: _$recordConvertNullable(
          $jsonValue['tagSupport'],
          ($jsonValue) => (
            valueSet: ($jsonValue['valueSet'] as List<dynamic>)
                .map((e) => $enumDecode(_$CompletionItemTagEnumMap, e))
                .toList(),
          ),
        ),
      ),
    ),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$CompletionClientCapabilitiesToJson(
  _CompletionClientCapabilities instance,
) => <String, dynamic>{
  'completionList': ?instance.completionList == null
      ? null
      : <String, dynamic>{
          'itemDefaults': instance.completionList!.itemDefaults,
        },
  'contextSupport': ?instance.contextSupport,
  'insertTextMode': ?_$InsertTextModeEnumMap[instance.insertTextMode],
  'completionItemKind': ?instance.completionItemKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.completionItemKind!.valueSet
              ?.map((e) => _$CompletionItemKindEnumMap[e]!)
              .toList(),
        },
  'completionItem': ?instance.completionItem == null
      ? null
      : <String, dynamic>{
          'commitCharactersSupport':
              instance.completionItem!.commitCharactersSupport,
          'deprecatedSupport': instance.completionItem!.deprecatedSupport,
          'documentationFormat': instance.completionItem!.documentationFormat
              ?.map((e) => _$MarkupKindEnumMap[e]!)
              .toList(),
          'insertReplaceSupport': instance.completionItem!.insertReplaceSupport,
          'insertTextModeSupport':
              instance.completionItem!.insertTextModeSupport == null
              ? null
              : <String, dynamic>{
                  'valueSet': instance
                      .completionItem!
                      .insertTextModeSupport!
                      .valueSet
                      .map((e) => _$InsertTextModeEnumMap[e]!)
                      .toList(),
                },
          'labelDetailsSupport': instance.completionItem!.labelDetailsSupport,
          'preselectSupport': instance.completionItem!.preselectSupport,
          'resolveSupport': instance.completionItem!.resolveSupport == null
              ? null
              : <String, dynamic>{
                  'properties':
                      instance.completionItem!.resolveSupport!.properties,
                },
          'snippetSupport': instance.completionItem!.snippetSupport,
          'tagSupport': instance.completionItem!.tagSupport == null
              ? null
              : <String, dynamic>{
                  'valueSet': instance.completionItem!.tagSupport!.valueSet
                      .map((e) => _$CompletionItemTagEnumMap[e]!)
                      .toList(),
                },
        },
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_HoverClientCapabilities _$HoverClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['contentFormat', 'dynamicRegistration']);
  return _HoverClientCapabilities(
    contentFormat: (json['contentFormat'] as List<dynamic>?)
        ?.map((e) => $enumDecode(_$MarkupKindEnumMap, e))
        .toList(),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$HoverClientCapabilitiesToJson(
  _HoverClientCapabilities instance,
) => <String, dynamic>{
  'contentFormat': ?instance.contentFormat
      ?.map((e) => _$MarkupKindEnumMap[e]!)
      .toList(),
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_SignatureHelpClientCapabilities _$SignatureHelpClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'contextSupport',
      'signatureInformation',
      'dynamicRegistration',
    ],
  );
  return _SignatureHelpClientCapabilities(
    contextSupport: json['contextSupport'] as bool?,
    signatureInformation: _$recordConvertNullable(
      json['signatureInformation'],
      ($jsonValue) => (
        activeParameterSupport: $jsonValue['activeParameterSupport'] as bool?,
        documentationFormat:
            ($jsonValue['documentationFormat'] as List<dynamic>?)
                ?.map((e) => $enumDecode(_$MarkupKindEnumMap, e))
                .toList(),
        parameterInformation: _$recordConvertNullable(
          $jsonValue['parameterInformation'],
          ($jsonValue) =>
              (labelOffsetSupport: $jsonValue['labelOffsetSupport'] as bool?),
        ),
      ),
    ),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$SignatureHelpClientCapabilitiesToJson(
  _SignatureHelpClientCapabilities instance,
) => <String, dynamic>{
  'contextSupport': ?instance.contextSupport,
  'signatureInformation': ?instance.signatureInformation == null
      ? null
      : <String, dynamic>{
          'activeParameterSupport':
              instance.signatureInformation!.activeParameterSupport,
          'documentationFormat': instance
              .signatureInformation!
              .documentationFormat
              ?.map((e) => _$MarkupKindEnumMap[e]!)
              .toList(),
          'parameterInformation':
              instance.signatureInformation!.parameterInformation == null
              ? null
              : <String, dynamic>{
                  'labelOffsetSupport': instance
                      .signatureInformation!
                      .parameterInformation!
                      .labelOffsetSupport,
                },
        },
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_DeclarationClientCapabilities _$DeclarationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  return _DeclarationClientCapabilities(
    linkSupport: json['linkSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DeclarationClientCapabilitiesToJson(
  _DeclarationClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': ?instance.linkSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_DefinitionClientCapabilities _$DefinitionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  return _DefinitionClientCapabilities(
    linkSupport: json['linkSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DefinitionClientCapabilitiesToJson(
  _DefinitionClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': ?instance.linkSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_TypeDefinitionClientCapabilities _$TypeDefinitionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  return _TypeDefinitionClientCapabilities(
    linkSupport: json['linkSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$TypeDefinitionClientCapabilitiesToJson(
  _TypeDefinitionClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': ?instance.linkSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_ImplementationClientCapabilities _$ImplementationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  return _ImplementationClientCapabilities(
    linkSupport: json['linkSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$ImplementationClientCapabilitiesToJson(
  _ImplementationClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': ?instance.linkSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_ReferenceClientCapabilities _$ReferenceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _ReferenceClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$ReferenceClientCapabilitiesToJson(
  _ReferenceClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentHighlightClientCapabilities
_$DocumentHighlightClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _DocumentHighlightClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DocumentHighlightClientCapabilitiesToJson(
  _DocumentHighlightClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentSymbolClientCapabilities _$DocumentSymbolClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'labelSupport',
      'tagSupport',
      'hierarchicalDocumentSymbolSupport',
      'symbolKind',
      'dynamicRegistration',
    ],
  );
  return _DocumentSymbolClientCapabilities(
    labelSupport: json['labelSupport'] as bool?,
    tagSupport: _$recordConvertNullable(
      json['tagSupport'],
      ($jsonValue) => (
        valueSet: ($jsonValue['valueSet'] as List<dynamic>)
            .map((e) => $enumDecode(_$SymbolTagEnumMap, e))
            .toList(),
      ),
    ),
    hierarchicalDocumentSymbolSupport:
        json['hierarchicalDocumentSymbolSupport'] as bool?,
    symbolKind: _$recordConvertNullable(
      json['symbolKind'],
      ($jsonValue) => (
        valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
            ?.map((e) => $enumDecode(_$SymbolKindEnumMap, e))
            .toList(),
      ),
    ),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DocumentSymbolClientCapabilitiesToJson(
  _DocumentSymbolClientCapabilities instance,
) => <String, dynamic>{
  'labelSupport': ?instance.labelSupport,
  'tagSupport': ?instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$SymbolTagEnumMap[e]!)
              .toList(),
        },
  'hierarchicalDocumentSymbolSupport':
      ?instance.hierarchicalDocumentSymbolSupport,
  'symbolKind': ?instance.symbolKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.symbolKind!.valueSet
              ?.map((e) => _$SymbolKindEnumMap[e]!)
              .toList(),
        },
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_CodeActionClientCapabilities _$CodeActionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'honorsChangeAnnotations',
      'resolveSupport',
      'dataSupport',
      'disabledSupport',
      'isPreferredSupport',
      'codeActionLiteralSupport',
      'dynamicRegistration',
    ],
  );
  return _CodeActionClientCapabilities(
    honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
    resolveSupport: _$recordConvertNullable(
      json['resolveSupport'],
      ($jsonValue) => (
        properties: ($jsonValue['properties'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      ),
    ),
    dataSupport: json['dataSupport'] as bool?,
    disabledSupport: json['disabledSupport'] as bool?,
    isPreferredSupport: json['isPreferredSupport'] as bool?,
    codeActionLiteralSupport: _$recordConvertNullable(
      json['codeActionLiteralSupport'],
      ($jsonValue) => (
        codeActionKind: _$recordConvert(
          $jsonValue['codeActionKind'],
          ($jsonValue) => (
            valueSet: ($jsonValue['valueSet'] as List<dynamic>)
                .map((e) => $enumDecode(_$CodeActionKindEnumMap, e))
                .toList(),
          ),
        ),
      ),
    ),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$CodeActionClientCapabilitiesToJson(
  _CodeActionClientCapabilities instance,
) => <String, dynamic>{
  'honorsChangeAnnotations': ?instance.honorsChangeAnnotations,
  'resolveSupport': ?instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
  'dataSupport': ?instance.dataSupport,
  'disabledSupport': ?instance.disabledSupport,
  'isPreferredSupport': ?instance.isPreferredSupport,
  'codeActionLiteralSupport': ?instance.codeActionLiteralSupport == null
      ? null
      : <String, dynamic>{
          'codeActionKind': <String, dynamic>{
            'valueSet': instance
                .codeActionLiteralSupport!
                .codeActionKind
                .valueSet
                .map((e) => _$CodeActionKindEnumMap[e]!)
                .toList(),
          },
        },
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_CodeLensClientCapabilities _$CodeLensClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _CodeLensClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$CodeLensClientCapabilitiesToJson(
  _CodeLensClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentLinkClientCapabilities _$DocumentLinkClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['tooltipSupport', 'dynamicRegistration'],
  );
  return _DocumentLinkClientCapabilities(
    tooltipSupport: json['tooltipSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DocumentLinkClientCapabilitiesToJson(
  _DocumentLinkClientCapabilities instance,
) => <String, dynamic>{
  'tooltipSupport': ?instance.tooltipSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_DocumentColorClientCapabilities _$DocumentColorClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _DocumentColorClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DocumentColorClientCapabilitiesToJson(
  _DocumentColorClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentFormattingClientCapabilities
_$DocumentFormattingClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _DocumentFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DocumentFormattingClientCapabilitiesToJson(
  _DocumentFormattingClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentRangeFormattingClientCapabilities
_$DocumentRangeFormattingClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['rangesSupport', 'dynamicRegistration']);
  return _DocumentRangeFormattingClientCapabilities(
    rangesSupport: json['rangesSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DocumentRangeFormattingClientCapabilitiesToJson(
  _DocumentRangeFormattingClientCapabilities instance,
) => <String, dynamic>{
  'rangesSupport': ?instance.rangesSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_DocumentOnTypeFormattingClientCapabilities
_$DocumentOnTypeFormattingClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _DocumentOnTypeFormattingClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DocumentOnTypeFormattingClientCapabilitiesToJson(
  _DocumentOnTypeFormattingClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_RenameClientCapabilities _$RenameClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'honorsChangeAnnotations',
      'prepareSupportDefaultBehavior',
      'prepareSupport',
      'dynamicRegistration',
    ],
  );
  return _RenameClientCapabilities(
    honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
    prepareSupportDefaultBehavior: $enumDecodeNullable(
      _$PrepareSupportDefaultBehaviorEnumMap,
      json['prepareSupportDefaultBehavior'],
    ),
    prepareSupport: json['prepareSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$RenameClientCapabilitiesToJson(
  _RenameClientCapabilities instance,
) => <String, dynamic>{
  'honorsChangeAnnotations': ?instance.honorsChangeAnnotations,
  'prepareSupportDefaultBehavior':
      ?_$PrepareSupportDefaultBehaviorEnumMap[instance
          .prepareSupportDefaultBehavior],
  'prepareSupport': ?instance.prepareSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

const _$PrepareSupportDefaultBehaviorEnumMap = {
  PrepareSupportDefaultBehavior.identifier: 1,
};

_FoldingRangeClientCapabilities _$FoldingRangeClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'foldingRange',
      'foldingRangeKind',
      'lineFoldingOnly',
      'rangeLimit',
      'dynamicRegistration',
    ],
  );
  return _FoldingRangeClientCapabilities(
    foldingRange: _$recordConvertNullable(
      json['foldingRange'],
      ($jsonValue) => (collapsedText: $jsonValue['collapsedText'] as bool?),
    ),
    foldingRangeKind: _$recordConvertNullable(
      json['foldingRangeKind'],
      ($jsonValue) => (
        valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
            ?.map((e) => $enumDecode(_$FoldingRangeKindEnumMap, e))
            .toList(),
      ),
    ),
    lineFoldingOnly: json['lineFoldingOnly'] as bool?,
    rangeLimit: (json['rangeLimit'] as num?)?.toInt(),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$FoldingRangeClientCapabilitiesToJson(
  _FoldingRangeClientCapabilities instance,
) => <String, dynamic>{
  'foldingRange': ?instance.foldingRange == null
      ? null
      : <String, dynamic>{
          'collapsedText': instance.foldingRange!.collapsedText,
        },
  'foldingRangeKind': ?instance.foldingRangeKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.foldingRangeKind!.valueSet
              ?.map((e) => _$FoldingRangeKindEnumMap[e]!)
              .toList(),
        },
  'lineFoldingOnly': ?instance.lineFoldingOnly,
  'rangeLimit': ?instance.rangeLimit,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_SelectionRangeClientCapabilities _$SelectionRangeClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _SelectionRangeClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$SelectionRangeClientCapabilitiesToJson(
  _SelectionRangeClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_PublishDiagnosticsClientCapabilities
_$PublishDiagnosticsClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'dataSupport',
      'codeDescriptionSupport',
      'versionSupport',
      'tagSupport',
      'relatedInformation',
    ],
  );
  return _PublishDiagnosticsClientCapabilities(
    dataSupport: json['dataSupport'] as bool?,
    codeDescriptionSupport: json['codeDescriptionSupport'] as bool?,
    versionSupport: json['versionSupport'] as bool?,
    tagSupport: _$recordConvertNullable(
      json['tagSupport'],
      ($jsonValue) => (
        valueSet: ($jsonValue['valueSet'] as List<dynamic>)
            .map((e) => $enumDecode(_$DiagnosticTagEnumMap, e))
            .toList(),
      ),
    ),
    relatedInformation: json['relatedInformation'] as bool?,
  );
}

Map<String, dynamic> _$PublishDiagnosticsClientCapabilitiesToJson(
  _PublishDiagnosticsClientCapabilities instance,
) => <String, dynamic>{
  'dataSupport': ?instance.dataSupport,
  'codeDescriptionSupport': ?instance.codeDescriptionSupport,
  'versionSupport': ?instance.versionSupport,
  'tagSupport': ?instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$DiagnosticTagEnumMap[e]!)
              .toList(),
        },
  'relatedInformation': ?instance.relatedInformation,
};

_CallHierarchyClientCapabilities _$CallHierarchyClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _CallHierarchyClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$CallHierarchyClientCapabilitiesToJson(
  _CallHierarchyClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_SemanticTokensClientCapabilities _$SemanticTokensClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'requests',
      'tokenTypes',
      'tokenModifiers',
      'formats',
      'augmentsSyntaxTokens',
      'serverCancelSupport',
      'multilineTokenSupport',
      'overlappingTokenSupport',
      'dynamicRegistration',
    ],
  );
  return _SemanticTokensClientCapabilities(
    requests: _$recordConvert(
      json['requests'],
      ($jsonValue) => (full: $jsonValue['full'], range: $jsonValue['range']),
    ),
    tokenTypes: (json['tokenTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    tokenModifiers: (json['tokenModifiers'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    formats: (json['formats'] as List<dynamic>)
        .map((e) => $enumDecode(_$TokenFormatEnumMap, e))
        .toList(),
    augmentsSyntaxTokens: json['augmentsSyntaxTokens'] as bool?,
    serverCancelSupport: json['serverCancelSupport'] as bool?,
    multilineTokenSupport: json['multilineTokenSupport'] as bool?,
    overlappingTokenSupport: json['overlappingTokenSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$SemanticTokensClientCapabilitiesToJson(
  _SemanticTokensClientCapabilities instance,
) => <String, dynamic>{
  'requests': <String, dynamic>{
    'full': instance.requests.full,
    'range': instance.requests.range,
  },
  'tokenTypes': instance.tokenTypes,
  'tokenModifiers': instance.tokenModifiers,
  'formats': instance.formats.map((e) => _$TokenFormatEnumMap[e]!).toList(),
  'augmentsSyntaxTokens': ?instance.augmentsSyntaxTokens,
  'serverCancelSupport': ?instance.serverCancelSupport,
  'multilineTokenSupport': ?instance.multilineTokenSupport,
  'overlappingTokenSupport': ?instance.overlappingTokenSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

const _$TokenFormatEnumMap = {TokenFormat.relative: 'relative'};

_LinkedEditingRangeClientCapabilities
_$LinkedEditingRangeClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _LinkedEditingRangeClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$LinkedEditingRangeClientCapabilitiesToJson(
  _LinkedEditingRangeClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_MonikerClientCapabilities _$MonikerClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _MonikerClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$MonikerClientCapabilitiesToJson(
  _MonikerClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_TypeHierarchyClientCapabilities _$TypeHierarchyClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _TypeHierarchyClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$TypeHierarchyClientCapabilitiesToJson(
  _TypeHierarchyClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_InlineValueClientCapabilities _$InlineValueClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _InlineValueClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$InlineValueClientCapabilitiesToJson(
  _InlineValueClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_InlayHintClientCapabilities _$InlayHintClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['resolveSupport', 'dynamicRegistration'],
  );
  return _InlayHintClientCapabilities(
    resolveSupport: _$recordConvertNullable(
      json['resolveSupport'],
      ($jsonValue) => (
        properties: ($jsonValue['properties'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      ),
    ),
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$InlayHintClientCapabilitiesToJson(
  _InlayHintClientCapabilities instance,
) => <String, dynamic>{
  'resolveSupport': ?instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_DiagnosticClientCapabilities _$DiagnosticClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['relatedDocumentSupport', 'dynamicRegistration'],
  );
  return _DiagnosticClientCapabilities(
    relatedDocumentSupport: json['relatedDocumentSupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$DiagnosticClientCapabilitiesToJson(
  _DiagnosticClientCapabilities instance,
) => <String, dynamic>{
  'relatedDocumentSupport': ?instance.relatedDocumentSupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_InlineCompletionClientCapabilities
_$InlineCompletionClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  return _InlineCompletionClientCapabilities(
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$InlineCompletionClientCapabilitiesToJson(
  _InlineCompletionClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_NotebookDocumentSyncClientCapabilities
_$NotebookDocumentSyncClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['executionSummarySupport', 'dynamicRegistration'],
  );
  return _NotebookDocumentSyncClientCapabilities(
    executionSummarySupport: json['executionSummarySupport'] as bool?,
    dynamicRegistration: json['dynamicRegistration'] as bool?,
  );
}

Map<String, dynamic> _$NotebookDocumentSyncClientCapabilitiesToJson(
  _NotebookDocumentSyncClientCapabilities instance,
) => <String, dynamic>{
  'executionSummarySupport': ?instance.executionSummarySupport,
  'dynamicRegistration': ?instance.dynamicRegistration,
};

_ShowMessageRequestClientCapabilities
_$ShowMessageRequestClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['messageActionItem']);
  return _ShowMessageRequestClientCapabilities(
    messageActionItem: _$recordConvertNullable(
      json['messageActionItem'],
      ($jsonValue) => (
        additionalPropertiesSupport:
            $jsonValue['additionalPropertiesSupport'] as bool?,
      ),
    ),
  );
}

Map<String, dynamic> _$ShowMessageRequestClientCapabilitiesToJson(
  _ShowMessageRequestClientCapabilities instance,
) => <String, dynamic>{
  'messageActionItem': ?instance.messageActionItem == null
      ? null
      : <String, dynamic>{
          'additionalPropertiesSupport':
              instance.messageActionItem!.additionalPropertiesSupport,
        },
};

_ShowDocumentClientCapabilities _$ShowDocumentClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['support']);
  return _ShowDocumentClientCapabilities(support: json['support'] as bool);
}

Map<String, dynamic> _$ShowDocumentClientCapabilitiesToJson(
  _ShowDocumentClientCapabilities instance,
) => <String, dynamic>{'support': instance.support};

_RegularExpressionsClientCapabilities
_$RegularExpressionsClientCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['engine', 'version']);
  return _RegularExpressionsClientCapabilities(
    engine: json['engine'] as String,
    version: json['version'] as String?,
  );
}

Map<String, dynamic> _$RegularExpressionsClientCapabilitiesToJson(
  _RegularExpressionsClientCapabilities instance,
) => <String, dynamic>{'engine': instance.engine, 'version': ?instance.version};

_MarkdownClientCapabilities _$MarkdownClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['parser', 'allowedTags', 'version']);
  return _MarkdownClientCapabilities(
    parser: json['parser'] as String,
    allowedTags: (json['allowedTags'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    version: json['version'] as String?,
  );
}

Map<String, dynamic> _$MarkdownClientCapabilitiesToJson(
  _MarkdownClientCapabilities instance,
) => <String, dynamic>{
  'parser': instance.parser,
  'allowedTags': ?instance.allowedTags,
  'version': ?instance.version,
};
