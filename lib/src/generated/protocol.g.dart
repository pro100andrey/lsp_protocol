// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Definition0 _$Definition0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('Definition0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = Definition0(
        value: $checkedConvert(
          'value',
          (v) => Location.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$Definition0ToJson(Definition0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

Definition1 _$Definition1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('Definition1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = Definition1(
        value: $checkedConvert(
          'value',
          (v) => (v as List<dynamic>)
              .map((e) => Location.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$Definition1ToJson(Definition1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

LSPAny0 _$LSPAny0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('LSPAny0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = LSPAny0(
        value: $checkedConvert(
          'value',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) =>
                MapEntry(k, LSPAnyBase.fromJson(e as Map<String, dynamic>)),
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$LSPAny0ToJson(LSPAny0 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny1 _$LSPAny1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('LSPAny1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = LSPAny1(
        value: $checkedConvert(
          'value',
          (v) => (v as List<dynamic>)
              .map((e) => LSPAnyBase.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$LSPAny1ToJson(LSPAny1 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny2 _$LSPAny2FromJson(Map<String, dynamic> json) =>
    $checkedCreate('LSPAny2', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = LSPAny2(
        value: $checkedConvert('value', (v) => v as String),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$LSPAny2ToJson(LSPAny2 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny3 _$LSPAny3FromJson(Map<String, dynamic> json) =>
    $checkedCreate('LSPAny3', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = LSPAny3(
        value: $checkedConvert('value', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$LSPAny3ToJson(LSPAny3 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny4 _$LSPAny4FromJson(Map<String, dynamic> json) =>
    $checkedCreate('LSPAny4', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = LSPAny4(
        value: $checkedConvert('value', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$LSPAny4ToJson(LSPAny4 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny5 _$LSPAny5FromJson(Map<String, dynamic> json) =>
    $checkedCreate('LSPAny5', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = LSPAny5(
        value: $checkedConvert('value', (v) => (v as num).toDouble()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$LSPAny5ToJson(LSPAny5 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

LSPAny6 _$LSPAny6FromJson(Map<String, dynamic> json) =>
    $checkedCreate('LSPAny6', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = LSPAny6(
        value: $checkedConvert('value', (v) => v as bool),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$LSPAny6ToJson(LSPAny6 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

InlineValue0 _$InlineValue0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('InlineValue0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = InlineValue0(
        value: $checkedConvert(
          'value',
          (v) => InlineValueText.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$InlineValue0ToJson(InlineValue0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineValue1 _$InlineValue1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('InlineValue1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = InlineValue1(
        value: $checkedConvert(
          'value',
          (v) => InlineValueVariableLookup.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$InlineValue1ToJson(InlineValue1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineValue2 _$InlineValue2FromJson(Map<String, dynamic> json) =>
    $checkedCreate('InlineValue2', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = InlineValue2(
        value: $checkedConvert(
          'value',
          (v) => InlineValueEvaluatableExpression.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$InlineValue2ToJson(InlineValue2 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DocumentDiagnosticReport0 _$DocumentDiagnosticReport0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DocumentDiagnosticReport0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = DocumentDiagnosticReport0(
    value: $checkedConvert(
      'value',
      (v) => RelatedFullDocumentDiagnosticReport.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$DocumentDiagnosticReport0ToJson(
  DocumentDiagnosticReport0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DocumentDiagnosticReport1 _$DocumentDiagnosticReport1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DocumentDiagnosticReport1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = DocumentDiagnosticReport1(
    value: $checkedConvert(
      'value',
      (v) => RelatedUnchangedDocumentDiagnosticReport.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$DocumentDiagnosticReport1ToJson(
  DocumentDiagnosticReport1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

PrepareRenameResult0 _$PrepareRenameResult0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PrepareRenameResult0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = PrepareRenameResult0(
    value: $checkedConvert(
      'value',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$PrepareRenameResult0ToJson(
  PrepareRenameResult0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

PrepareRenameResult1 _$PrepareRenameResult1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PrepareRenameResult1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = PrepareRenameResult1(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (
          placeholder: $jsonValue['placeholder'] as String,
          range: Range.fromJson($jsonValue['range'] as Map<String, dynamic>),
        ),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

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

PrepareRenameResult2 _$PrepareRenameResult2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PrepareRenameResult2', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = PrepareRenameResult2(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) =>
            (defaultBehavior: $jsonValue['defaultBehavior'] as bool),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$PrepareRenameResult2ToJson(
  PrepareRenameResult2 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'defaultBehavior': instance.value.defaultBehavior},
  'runtimeType': instance.$type,
};

ProgressToken0 _$ProgressToken0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('ProgressToken0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = ProgressToken0(
        value: $checkedConvert('value', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$ProgressToken0ToJson(ProgressToken0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ProgressToken1 _$ProgressToken1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('ProgressToken1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = ProgressToken1(
        value: $checkedConvert('value', (v) => v as String),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$ProgressToken1ToJson(ProgressToken1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceDocumentDiagnosticReport0 _$WorkspaceDocumentDiagnosticReport0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WorkspaceDocumentDiagnosticReport0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = WorkspaceDocumentDiagnosticReport0(
      value: $checkedConvert(
        'value',
        (v) => WorkspaceFullDocumentDiagnosticReport.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$WorkspaceDocumentDiagnosticReport0ToJson(
  WorkspaceDocumentDiagnosticReport0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceDocumentDiagnosticReport1 _$WorkspaceDocumentDiagnosticReport1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WorkspaceDocumentDiagnosticReport1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = WorkspaceDocumentDiagnosticReport1(
      value: $checkedConvert(
        'value',
        (v) => WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$WorkspaceDocumentDiagnosticReport1ToJson(
  WorkspaceDocumentDiagnosticReport1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentContentChangeEvent0 _$TextDocumentContentChangeEvent0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TextDocumentContentChangeEvent0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = TextDocumentContentChangeEvent0(
      value: $checkedConvert(
        'value',
        (v) => _$recordConvert(
          v,
          ($jsonValue) => (
            range: Range.fromJson($jsonValue['range'] as Map<String, dynamic>),
            rangeLength: ($jsonValue['rangeLength'] as num?)?.toInt(),
            text: $jsonValue['text'] as String,
          ),
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

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
) => $checkedCreate(
  'TextDocumentContentChangeEvent1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = TextDocumentContentChangeEvent1(
      value: $checkedConvert(
        'value',
        (v) => _$recordConvert(
          v,
          ($jsonValue) => (text: $jsonValue['text'] as String),
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$TextDocumentContentChangeEvent1ToJson(
  TextDocumentContentChangeEvent1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'text': instance.value.text},
  'runtimeType': instance.$type,
};

MarkedString0 _$MarkedString0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('MarkedString0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = MarkedString0(
        value: $checkedConvert('value', (v) => v as String),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$MarkedString0ToJson(MarkedString0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

MarkedString1 _$MarkedString1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('MarkedString1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = MarkedString1(
        value: $checkedConvert(
          'value',
          (v) => _$recordConvert(
            v,
            ($jsonValue) => (
              language: $jsonValue['language'] as String,
              value: $jsonValue['value'] as String,
            ),
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$MarkedString1ToJson(MarkedString1 instance) =>
    <String, dynamic>{
      'value': <String, dynamic>{
        'language': instance.value.language,
        'value': instance.value.value,
      },
      'runtimeType': instance.$type,
    };

DocumentFilter0 _$DocumentFilter0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('DocumentFilter0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = DocumentFilter0(
        value: $checkedConvert(
          'value',
          (v) => TextDocumentFilterBase.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$DocumentFilter0ToJson(DocumentFilter0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DocumentFilter1 _$DocumentFilter1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('DocumentFilter1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = DocumentFilter1(
        value: $checkedConvert(
          'value',
          (v) => NotebookCellTextDocumentFilter.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$DocumentFilter1ToJson(DocumentFilter1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

GlobPattern0 _$GlobPattern0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('GlobPattern0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = GlobPattern0(
        value: $checkedConvert('value', (v) => v as String),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$GlobPattern0ToJson(GlobPattern0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

GlobPattern1 _$GlobPattern1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('GlobPattern1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = GlobPattern1(
        value: $checkedConvert(
          'value',
          (v) => RelativePattern.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$GlobPattern1ToJson(GlobPattern1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentFilter0 _$TextDocumentFilter0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('TextDocumentFilter0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = TextDocumentFilter0(
        value: $checkedConvert(
          'value',
          (v) => _$recordConvert(
            v,
            ($jsonValue) => (
              language: $jsonValue['language'] as String,
              pattern: $jsonValue['pattern'] as String?,
              scheme: $jsonValue['scheme'] as String?,
            ),
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

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

TextDocumentFilter1 _$TextDocumentFilter1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('TextDocumentFilter1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = TextDocumentFilter1(
        value: $checkedConvert(
          'value',
          (v) => _$recordConvert(
            v,
            ($jsonValue) => (
              language: $jsonValue['language'] as String?,
              pattern: $jsonValue['pattern'] as String?,
              scheme: $jsonValue['scheme'] as String,
            ),
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

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

TextDocumentFilter2 _$TextDocumentFilter2FromJson(Map<String, dynamic> json) =>
    $checkedCreate('TextDocumentFilter2', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = TextDocumentFilter2(
        value: $checkedConvert(
          'value',
          (v) => _$recordConvert(
            v,
            ($jsonValue) => (
              language: $jsonValue['language'] as String?,
              pattern: $jsonValue['pattern'] as String,
              scheme: $jsonValue['scheme'] as String?,
            ),
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

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
) => $checkedCreate('NotebookDocumentFilter0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = NotebookDocumentFilter0(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (
          notebookType: $jsonValue['notebookType'] as String,
          pattern: $jsonValue['pattern'] as String?,
          scheme: $jsonValue['scheme'] as String?,
        ),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

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
) => $checkedCreate('NotebookDocumentFilter1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = NotebookDocumentFilter1(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (
          notebookType: $jsonValue['notebookType'] as String?,
          pattern: $jsonValue['pattern'] as String?,
          scheme: $jsonValue['scheme'] as String,
        ),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

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
) => $checkedCreate('NotebookDocumentFilter2', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = NotebookDocumentFilter2(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (
          notebookType: $jsonValue['notebookType'] as String?,
          pattern: $jsonValue['pattern'] as String,
          scheme: $jsonValue['scheme'] as String?,
        ),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

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
) => $checkedCreate('TextDocumentRegistrationOptionsDocumentSelector0', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['value']);
  final val = TextDocumentRegistrationOptionsDocumentSelector0(
    value: $checkedConvert(
      'value',
      (v) => (v as List<dynamic>)
          .map((e) => DocumentFilterBase.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$TextDocumentRegistrationOptionsDocumentSelector0ToJson(
  TextDocumentRegistrationOptionsDocumentSelector0 instance,
) => <String, dynamic>{'value': instance.value};

WorkspaceEditDocumentChanges0 _$WorkspaceEditDocumentChanges0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WorkspaceEditDocumentChanges0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = WorkspaceEditDocumentChanges0(
    value: $checkedConvert(
      'value',
      (v) => TextDocumentEdit.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WorkspaceEditDocumentChanges0ToJson(
  WorkspaceEditDocumentChanges0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceEditDocumentChanges1 _$WorkspaceEditDocumentChanges1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WorkspaceEditDocumentChanges1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = WorkspaceEditDocumentChanges1(
    value: $checkedConvert(
      'value',
      (v) => CreateFile.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WorkspaceEditDocumentChanges1ToJson(
  WorkspaceEditDocumentChanges1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceEditDocumentChanges2 _$WorkspaceEditDocumentChanges2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WorkspaceEditDocumentChanges2', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = WorkspaceEditDocumentChanges2(
    value: $checkedConvert(
      'value',
      (v) => RenameFile.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WorkspaceEditDocumentChanges2ToJson(
  WorkspaceEditDocumentChanges2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceEditDocumentChanges3 _$WorkspaceEditDocumentChanges3FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WorkspaceEditDocumentChanges3', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = WorkspaceEditDocumentChanges3(
    value: $checkedConvert(
      'value',
      (v) => DeleteFile.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WorkspaceEditDocumentChanges3ToJson(
  WorkspaceEditDocumentChanges3 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlayHintLabel0 _$InlayHintLabel0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('InlayHintLabel0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = InlayHintLabel0(
        value: $checkedConvert('value', (v) => v as String),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$InlayHintLabel0ToJson(InlayHintLabel0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlayHintLabel1 _$InlayHintLabel1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('InlayHintLabel1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = InlayHintLabel1(
        value: $checkedConvert(
          'value',
          (v) => (v as List<dynamic>)
              .map(
                (e) => InlayHintLabelPart.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$InlayHintLabel1ToJson(InlayHintLabel1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TooltipOrDocumentation0 _$TooltipOrDocumentation0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TooltipOrDocumentation0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = TooltipOrDocumentation0(
    value: $checkedConvert('value', (v) => v as String),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$TooltipOrDocumentation0ToJson(
  TooltipOrDocumentation0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TooltipOrDocumentation1 _$TooltipOrDocumentation1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TooltipOrDocumentation1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = TooltipOrDocumentation1(
    value: $checkedConvert(
      'value',
      (v) => MarkupContent.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$TooltipOrDocumentation1ToJson(
  TooltipOrDocumentation1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

RelatedDocuments0 _$RelatedDocuments0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('RelatedDocuments0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = RelatedDocuments0(
        value: $checkedConvert(
          'value',
          (v) =>
              FullDocumentDiagnosticReport.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$RelatedDocuments0ToJson(RelatedDocuments0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

RelatedDocuments1 _$RelatedDocuments1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('RelatedDocuments1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = RelatedDocuments1(
        value: $checkedConvert(
          'value',
          (v) => UnchangedDocumentDiagnosticReport.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$RelatedDocuments1ToJson(RelatedDocuments1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineCompletionItemInsertText0 _$InlineCompletionItemInsertText0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'InlineCompletionItemInsertText0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = InlineCompletionItemInsertText0(
      value: $checkedConvert('value', (v) => v as String),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$InlineCompletionItemInsertText0ToJson(
  InlineCompletionItemInsertText0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

InlineCompletionItemInsertText1 _$InlineCompletionItemInsertText1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'InlineCompletionItemInsertText1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = InlineCompletionItemInsertText1(
      value: $checkedConvert(
        'value',
        (v) => StringValue.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$InlineCompletionItemInsertText1ToJson(
  InlineCompletionItemInsertText1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DidChangeConfigurationRegistrationOptionsSection0
_$DidChangeConfigurationRegistrationOptionsSection0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'DidChangeConfigurationRegistrationOptionsSection0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = DidChangeConfigurationRegistrationOptionsSection0(
      value: $checkedConvert('value', (v) => v as String),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$DidChangeConfigurationRegistrationOptionsSection0ToJson(
  DidChangeConfigurationRegistrationOptionsSection0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

DidChangeConfigurationRegistrationOptionsSection1
_$DidChangeConfigurationRegistrationOptionsSection1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'DidChangeConfigurationRegistrationOptionsSection1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = DidChangeConfigurationRegistrationOptionsSection1(
      value: $checkedConvert(
        'value',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$DidChangeConfigurationRegistrationOptionsSection1ToJson(
  DidChangeConfigurationRegistrationOptionsSection1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionItemTextEdit0 _$CompletionItemTextEdit0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompletionItemTextEdit0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = CompletionItemTextEdit0(
    value: $checkedConvert(
      'value',
      (v) => TextEdit.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$CompletionItemTextEdit0ToJson(
  CompletionItemTextEdit0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionItemTextEdit1 _$CompletionItemTextEdit1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompletionItemTextEdit1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = CompletionItemTextEdit1(
    value: $checkedConvert(
      'value',
      (v) => InsertReplaceEdit.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$CompletionItemTextEdit1ToJson(
  CompletionItemTextEdit1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionListEditRange0 _$CompletionListEditRange0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompletionListEditRange0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = CompletionListEditRange0(
    value: $checkedConvert(
      'value',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$CompletionListEditRange0ToJson(
  CompletionListEditRange0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CompletionListEditRange1 _$CompletionListEditRange1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CompletionListEditRange1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = CompletionListEditRange1(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (
          insert: Range.fromJson($jsonValue['insert'] as Map<String, dynamic>),
          replace: Range.fromJson(
            $jsonValue['replace'] as Map<String, dynamic>,
          ),
        ),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$CompletionListEditRange1ToJson(
  CompletionListEditRange1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{
    'insert': instance.value.insert,
    'replace': instance.value.replace,
  },
  'runtimeType': instance.$type,
};

HoverContents0 _$HoverContents0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('HoverContents0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = HoverContents0(
        value: $checkedConvert(
          'value',
          (v) => MarkupContent.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$HoverContents0ToJson(HoverContents0 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

HoverContents1 _$HoverContents1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('HoverContents1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = HoverContents1(
        value: $checkedConvert(
          'value',
          (v) => MarkedStringBase.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$HoverContents1ToJson(HoverContents1 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

HoverContents2 _$HoverContents2FromJson(Map<String, dynamic> json) =>
    $checkedCreate('HoverContents2', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = HoverContents2(
        value: $checkedConvert(
          'value',
          (v) => (v as List<dynamic>)
              .map((e) => MarkedStringBase.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$HoverContents2ToJson(HoverContents2 instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceSymbolLocation0 _$WorkspaceSymbolLocation0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WorkspaceSymbolLocation0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = WorkspaceSymbolLocation0(
    value: $checkedConvert(
      'value',
      (v) => Location.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WorkspaceSymbolLocation0ToJson(
  WorkspaceSymbolLocation0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceSymbolLocation1 _$WorkspaceSymbolLocation1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WorkspaceSymbolLocation1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = WorkspaceSymbolLocation1(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (uri: $jsonValue['uri'] as String),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WorkspaceSymbolLocation1ToJson(
  WorkspaceSymbolLocation1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'uri': instance.value.uri},
  'runtimeType': instance.$type,
};

Range0 _$Range0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('Range0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = Range0(
        value: $checkedConvert('value', (v) => v as bool),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$Range0ToJson(Range0 instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

Range1 _$Range1FromJson(Map<String, dynamic> json) =>
    $checkedCreate('Range1', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
      final val = Range1(
        value: $checkedConvert('value', (v) => ()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$Range1ToJson(Range1 instance) => <String, dynamic>{
  'value': <String, dynamic>{},
  'runtimeType': instance.$type,
};

SemanticTokensOptionsFull0 _$SemanticTokensOptionsFull0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SemanticTokensOptionsFull0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = SemanticTokensOptionsFull0(
    value: $checkedConvert('value', (v) => v as bool),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$SemanticTokensOptionsFull0ToJson(
  SemanticTokensOptionsFull0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

SemanticTokensOptionsFull1 _$SemanticTokensOptionsFull1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SemanticTokensOptionsFull1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = SemanticTokensOptionsFull1(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (delta: $jsonValue['delta'] as bool?),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$SemanticTokensOptionsFull1ToJson(
  SemanticTokensOptionsFull1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'delta': instance.value.delta},
  'runtimeType': instance.$type,
};

TextDocumentEditEdits0 _$TextDocumentEditEdits0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TextDocumentEditEdits0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = TextDocumentEditEdits0(
    value: $checkedConvert(
      'value',
      (v) => TextEdit.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$TextDocumentEditEdits0ToJson(
  TextDocumentEditEdits0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentEditEdits1 _$TextDocumentEditEdits1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TextDocumentEditEdits1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = TextDocumentEditEdits1(
    value: $checkedConvert(
      'value',
      (v) => AnnotatedTextEdit.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$TextDocumentEditEdits1ToJson(
  TextDocumentEditEdits1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ProcessIdOrVersion0 _$ProcessIdOrVersion0FromJson(Map<String, dynamic> json) =>
    $checkedCreate('ProcessIdOrVersion0', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value']);
      final val = ProcessIdOrVersion0(
        value: $checkedConvert('value', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ProcessIdOrVersion0ToJson(
  ProcessIdOrVersion0 instance,
) => <String, dynamic>{'value': instance.value};

InitializeParamsRootPath0 _$InitializeParamsRootPath0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('InitializeParamsRootPath0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value']);
  final val = InitializeParamsRootPath0(
    value: $checkedConvert('value', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$InitializeParamsRootPath0ToJson(
  InitializeParamsRootPath0 instance,
) => <String, dynamic>{'value': instance.value};

InitializeParamsRootUri0 _$InitializeParamsRootUri0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('InitializeParamsRootUri0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value']);
  final val = InitializeParamsRootUri0(
    value: $checkedConvert('value', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$InitializeParamsRootUri0ToJson(
  InitializeParamsRootUri0 instance,
) => <String, dynamic>{'value': instance.value};

WorkspaceFoldersInitializeParamsWorkspaceFolders0
_$WorkspaceFoldersInitializeParamsWorkspaceFolders0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WorkspaceFoldersInitializeParamsWorkspaceFolders0', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['value']);
  final val = WorkspaceFoldersInitializeParamsWorkspaceFolders0(
    value: $checkedConvert(
      'value',
      (v) => (v as List<dynamic>)
          .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceFoldersInitializeParamsWorkspaceFolders0ToJson(
  WorkspaceFoldersInitializeParamsWorkspaceFolders0 instance,
) => <String, dynamic>{'value': instance.value};

ServerCapabilitiesTextDocumentSync0
_$ServerCapabilitiesTextDocumentSync0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesTextDocumentSync0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesTextDocumentSync0(
          value: $checkedConvert(
            'value',
            (v) => TextDocumentSyncOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesTextDocumentSync0ToJson(
  ServerCapabilitiesTextDocumentSync0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTextDocumentSync1
_$ServerCapabilitiesTextDocumentSync1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesTextDocumentSync1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesTextDocumentSync1(
          value: $checkedConvert(
            'value',
            (v) => $enumDecode(_$TextDocumentSyncKindEnumMap, v),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesTextDocumentSync1ToJson(
  ServerCapabilitiesTextDocumentSync1 instance,
) => <String, dynamic>{
  'value': _$TextDocumentSyncKindEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

const _$TextDocumentSyncKindEnumMap = {
  TextDocumentSyncKind.noneValue: 'noneValue',
  TextDocumentSyncKind.fullValue: 'fullValue',
  TextDocumentSyncKind.incrementalValue: 'incrementalValue',
};

ServerCapabilitiesNotebookDocumentSync0
_$ServerCapabilitiesNotebookDocumentSync0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesNotebookDocumentSync0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesNotebookDocumentSync0(
          value: $checkedConvert(
            'value',
            (v) =>
                NotebookDocumentSyncOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesNotebookDocumentSync0ToJson(
  ServerCapabilitiesNotebookDocumentSync0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesNotebookDocumentSync1
_$ServerCapabilitiesNotebookDocumentSync1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesNotebookDocumentSync1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesNotebookDocumentSync1(
          value: $checkedConvert(
            'value',
            (v) => NotebookDocumentSyncRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesNotebookDocumentSync1ToJson(
  ServerCapabilitiesNotebookDocumentSync1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesHoverProvider0 _$ServerCapabilitiesHoverProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesHoverProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesHoverProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesHoverProvider0ToJson(
  ServerCapabilitiesHoverProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesHoverProvider1 _$ServerCapabilitiesHoverProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesHoverProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesHoverProvider1(
      value: $checkedConvert(
        'value',
        (v) => HoverOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesHoverProvider1ToJson(
  ServerCapabilitiesHoverProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDeclarationProvider0
_$ServerCapabilitiesDeclarationProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesDeclarationProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesDeclarationProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesDeclarationProvider0ToJson(
  ServerCapabilitiesDeclarationProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDeclarationProvider1
_$ServerCapabilitiesDeclarationProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesDeclarationProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesDeclarationProvider1(
          value: $checkedConvert(
            'value',
            (v) => DeclarationOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesDeclarationProvider1ToJson(
  ServerCapabilitiesDeclarationProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDeclarationProvider2
_$ServerCapabilitiesDeclarationProvider2FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesDeclarationProvider2',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesDeclarationProvider2(
          value: $checkedConvert(
            'value',
            (v) => DeclarationRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesDeclarationProvider2ToJson(
  ServerCapabilitiesDeclarationProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDefinitionProvider0
_$ServerCapabilitiesDefinitionProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesDefinitionProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesDefinitionProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesDefinitionProvider0ToJson(
  ServerCapabilitiesDefinitionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDefinitionProvider1
_$ServerCapabilitiesDefinitionProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesDefinitionProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesDefinitionProvider1(
          value: $checkedConvert(
            'value',
            (v) => DefinitionOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesDefinitionProvider1ToJson(
  ServerCapabilitiesDefinitionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeDefinitionProvider0
_$ServerCapabilitiesTypeDefinitionProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesTypeDefinitionProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesTypeDefinitionProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesTypeDefinitionProvider0ToJson(
  ServerCapabilitiesTypeDefinitionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeDefinitionProvider1
_$ServerCapabilitiesTypeDefinitionProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesTypeDefinitionProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesTypeDefinitionProvider1(
      value: $checkedConvert(
        'value',
        (v) => TypeDefinitionOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesTypeDefinitionProvider1ToJson(
  ServerCapabilitiesTypeDefinitionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeDefinitionProvider2
_$ServerCapabilitiesTypeDefinitionProvider2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesTypeDefinitionProvider2',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesTypeDefinitionProvider2(
      value: $checkedConvert(
        'value',
        (v) => TypeDefinitionRegistrationOptions.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesTypeDefinitionProvider2ToJson(
  ServerCapabilitiesTypeDefinitionProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesImplementationProvider0
_$ServerCapabilitiesImplementationProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesImplementationProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesImplementationProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesImplementationProvider0ToJson(
  ServerCapabilitiesImplementationProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesImplementationProvider1
_$ServerCapabilitiesImplementationProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesImplementationProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesImplementationProvider1(
      value: $checkedConvert(
        'value',
        (v) => ImplementationOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesImplementationProvider1ToJson(
  ServerCapabilitiesImplementationProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesImplementationProvider2
_$ServerCapabilitiesImplementationProvider2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesImplementationProvider2',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesImplementationProvider2(
      value: $checkedConvert(
        'value',
        (v) => ImplementationRegistrationOptions.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesImplementationProvider2ToJson(
  ServerCapabilitiesImplementationProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesReferencesProvider0
_$ServerCapabilitiesReferencesProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesReferencesProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesReferencesProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesReferencesProvider0ToJson(
  ServerCapabilitiesReferencesProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesReferencesProvider1
_$ServerCapabilitiesReferencesProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesReferencesProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesReferencesProvider1(
          value: $checkedConvert(
            'value',
            (v) => ReferenceOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesReferencesProvider1ToJson(
  ServerCapabilitiesReferencesProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentHighlightProvider0
_$ServerCapabilitiesDocumentHighlightProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentHighlightProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentHighlightProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentHighlightProvider0ToJson(
  ServerCapabilitiesDocumentHighlightProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentHighlightProvider1
_$ServerCapabilitiesDocumentHighlightProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentHighlightProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentHighlightProvider1(
      value: $checkedConvert(
        'value',
        (v) => DocumentHighlightOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentHighlightProvider1ToJson(
  ServerCapabilitiesDocumentHighlightProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentSymbolProvider0
_$ServerCapabilitiesDocumentSymbolProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentSymbolProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentSymbolProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentSymbolProvider0ToJson(
  ServerCapabilitiesDocumentSymbolProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentSymbolProvider1
_$ServerCapabilitiesDocumentSymbolProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentSymbolProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentSymbolProvider1(
      value: $checkedConvert(
        'value',
        (v) => DocumentSymbolOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentSymbolProvider1ToJson(
  ServerCapabilitiesDocumentSymbolProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCodeActionProvider0
_$ServerCapabilitiesCodeActionProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesCodeActionProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesCodeActionProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesCodeActionProvider0ToJson(
  ServerCapabilitiesCodeActionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCodeActionProvider1
_$ServerCapabilitiesCodeActionProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesCodeActionProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesCodeActionProvider1(
          value: $checkedConvert(
            'value',
            (v) => CodeActionOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesCodeActionProvider1ToJson(
  ServerCapabilitiesCodeActionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesColorProvider0 _$ServerCapabilitiesColorProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesColorProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesColorProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesColorProvider0ToJson(
  ServerCapabilitiesColorProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesColorProvider1 _$ServerCapabilitiesColorProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesColorProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesColorProvider1(
      value: $checkedConvert(
        'value',
        (v) => DocumentColorOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesColorProvider1ToJson(
  ServerCapabilitiesColorProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesColorProvider2 _$ServerCapabilitiesColorProvider2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesColorProvider2',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesColorProvider2(
      value: $checkedConvert(
        'value',
        (v) => DocumentColorRegistrationOptions.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesColorProvider2ToJson(
  ServerCapabilitiesColorProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesWorkspaceSymbolProvider0
_$ServerCapabilitiesWorkspaceSymbolProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesWorkspaceSymbolProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesWorkspaceSymbolProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesWorkspaceSymbolProvider0ToJson(
  ServerCapabilitiesWorkspaceSymbolProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesWorkspaceSymbolProvider1
_$ServerCapabilitiesWorkspaceSymbolProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesWorkspaceSymbolProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesWorkspaceSymbolProvider1(
      value: $checkedConvert(
        'value',
        (v) => WorkspaceSymbolOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesWorkspaceSymbolProvider1ToJson(
  ServerCapabilitiesWorkspaceSymbolProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentFormattingProvider0
_$ServerCapabilitiesDocumentFormattingProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentFormattingProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentFormattingProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentFormattingProvider0ToJson(
  ServerCapabilitiesDocumentFormattingProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentFormattingProvider1
_$ServerCapabilitiesDocumentFormattingProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentFormattingProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentFormattingProvider1(
      value: $checkedConvert(
        'value',
        (v) => DocumentFormattingOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentFormattingProvider1ToJson(
  ServerCapabilitiesDocumentFormattingProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentRangeFormattingProvider0
_$ServerCapabilitiesDocumentRangeFormattingProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentRangeFormattingProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentRangeFormattingProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentRangeFormattingProvider0ToJson(
  ServerCapabilitiesDocumentRangeFormattingProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDocumentRangeFormattingProvider1
_$ServerCapabilitiesDocumentRangeFormattingProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesDocumentRangeFormattingProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesDocumentRangeFormattingProvider1(
      value: $checkedConvert(
        'value',
        (v) =>
            DocumentRangeFormattingOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesDocumentRangeFormattingProvider1ToJson(
  ServerCapabilitiesDocumentRangeFormattingProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesRenameProvider0 _$ServerCapabilitiesRenameProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesRenameProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesRenameProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesRenameProvider0ToJson(
  ServerCapabilitiesRenameProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesRenameProvider1 _$ServerCapabilitiesRenameProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesRenameProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesRenameProvider1(
      value: $checkedConvert(
        'value',
        (v) => RenameOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesRenameProvider1ToJson(
  ServerCapabilitiesRenameProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesFoldingRangeProvider0
_$ServerCapabilitiesFoldingRangeProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesFoldingRangeProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesFoldingRangeProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesFoldingRangeProvider0ToJson(
  ServerCapabilitiesFoldingRangeProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesFoldingRangeProvider1
_$ServerCapabilitiesFoldingRangeProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesFoldingRangeProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesFoldingRangeProvider1(
          value: $checkedConvert(
            'value',
            (v) => FoldingRangeOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesFoldingRangeProvider1ToJson(
  ServerCapabilitiesFoldingRangeProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesFoldingRangeProvider2
_$ServerCapabilitiesFoldingRangeProvider2FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesFoldingRangeProvider2',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesFoldingRangeProvider2(
          value: $checkedConvert(
            'value',
            (v) => FoldingRangeRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesFoldingRangeProvider2ToJson(
  ServerCapabilitiesFoldingRangeProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSelectionRangeProvider0
_$ServerCapabilitiesSelectionRangeProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesSelectionRangeProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesSelectionRangeProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesSelectionRangeProvider0ToJson(
  ServerCapabilitiesSelectionRangeProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSelectionRangeProvider1
_$ServerCapabilitiesSelectionRangeProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesSelectionRangeProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesSelectionRangeProvider1(
      value: $checkedConvert(
        'value',
        (v) => SelectionRangeOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesSelectionRangeProvider1ToJson(
  ServerCapabilitiesSelectionRangeProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSelectionRangeProvider2
_$ServerCapabilitiesSelectionRangeProvider2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesSelectionRangeProvider2',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesSelectionRangeProvider2(
      value: $checkedConvert(
        'value',
        (v) => SelectionRangeRegistrationOptions.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesSelectionRangeProvider2ToJson(
  ServerCapabilitiesSelectionRangeProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCallHierarchyProvider0
_$ServerCapabilitiesCallHierarchyProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesCallHierarchyProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesCallHierarchyProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesCallHierarchyProvider0ToJson(
  ServerCapabilitiesCallHierarchyProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCallHierarchyProvider1
_$ServerCapabilitiesCallHierarchyProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesCallHierarchyProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesCallHierarchyProvider1(
          value: $checkedConvert(
            'value',
            (v) => CallHierarchyOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesCallHierarchyProvider1ToJson(
  ServerCapabilitiesCallHierarchyProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesCallHierarchyProvider2
_$ServerCapabilitiesCallHierarchyProvider2FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesCallHierarchyProvider2',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesCallHierarchyProvider2(
          value: $checkedConvert(
            'value',
            (v) => CallHierarchyRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesCallHierarchyProvider2ToJson(
  ServerCapabilitiesCallHierarchyProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesLinkedEditingRangeProvider0
_$ServerCapabilitiesLinkedEditingRangeProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesLinkedEditingRangeProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesLinkedEditingRangeProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesLinkedEditingRangeProvider0ToJson(
  ServerCapabilitiesLinkedEditingRangeProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesLinkedEditingRangeProvider1
_$ServerCapabilitiesLinkedEditingRangeProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesLinkedEditingRangeProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesLinkedEditingRangeProvider1(
      value: $checkedConvert(
        'value',
        (v) => LinkedEditingRangeOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesLinkedEditingRangeProvider1ToJson(
  ServerCapabilitiesLinkedEditingRangeProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesLinkedEditingRangeProvider2
_$ServerCapabilitiesLinkedEditingRangeProvider2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesLinkedEditingRangeProvider2',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesLinkedEditingRangeProvider2(
      value: $checkedConvert(
        'value',
        (v) => LinkedEditingRangeRegistrationOptions.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesLinkedEditingRangeProvider2ToJson(
  ServerCapabilitiesLinkedEditingRangeProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSemanticTokensProvider0
_$ServerCapabilitiesSemanticTokensProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesSemanticTokensProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesSemanticTokensProvider0(
      value: $checkedConvert(
        'value',
        (v) => SemanticTokensOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesSemanticTokensProvider0ToJson(
  ServerCapabilitiesSemanticTokensProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesSemanticTokensProvider1
_$ServerCapabilitiesSemanticTokensProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesSemanticTokensProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesSemanticTokensProvider1(
      value: $checkedConvert(
        'value',
        (v) => SemanticTokensRegistrationOptions.fromJson(
          v as Map<String, dynamic>,
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesSemanticTokensProvider1ToJson(
  ServerCapabilitiesSemanticTokensProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesMonikerProvider0 _$ServerCapabilitiesMonikerProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesMonikerProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesMonikerProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesMonikerProvider0ToJson(
  ServerCapabilitiesMonikerProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesMonikerProvider1 _$ServerCapabilitiesMonikerProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesMonikerProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesMonikerProvider1(
      value: $checkedConvert(
        'value',
        (v) => MonikerOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesMonikerProvider1ToJson(
  ServerCapabilitiesMonikerProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesMonikerProvider2 _$ServerCapabilitiesMonikerProvider2FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesMonikerProvider2',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesMonikerProvider2(
      value: $checkedConvert(
        'value',
        (v) => MonikerRegistrationOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesMonikerProvider2ToJson(
  ServerCapabilitiesMonikerProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeHierarchyProvider0
_$ServerCapabilitiesTypeHierarchyProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesTypeHierarchyProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesTypeHierarchyProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesTypeHierarchyProvider0ToJson(
  ServerCapabilitiesTypeHierarchyProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeHierarchyProvider1
_$ServerCapabilitiesTypeHierarchyProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesTypeHierarchyProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesTypeHierarchyProvider1(
          value: $checkedConvert(
            'value',
            (v) => TypeHierarchyOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesTypeHierarchyProvider1ToJson(
  ServerCapabilitiesTypeHierarchyProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesTypeHierarchyProvider2
_$ServerCapabilitiesTypeHierarchyProvider2FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesTypeHierarchyProvider2',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesTypeHierarchyProvider2(
          value: $checkedConvert(
            'value',
            (v) => TypeHierarchyRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesTypeHierarchyProvider2ToJson(
  ServerCapabilitiesTypeHierarchyProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineValueProvider0
_$ServerCapabilitiesInlineValueProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesInlineValueProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesInlineValueProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesInlineValueProvider0ToJson(
  ServerCapabilitiesInlineValueProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineValueProvider1
_$ServerCapabilitiesInlineValueProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesInlineValueProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesInlineValueProvider1(
          value: $checkedConvert(
            'value',
            (v) => InlineValueOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesInlineValueProvider1ToJson(
  ServerCapabilitiesInlineValueProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineValueProvider2
_$ServerCapabilitiesInlineValueProvider2FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesInlineValueProvider2',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesInlineValueProvider2(
          value: $checkedConvert(
            'value',
            (v) => InlineValueRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesInlineValueProvider2ToJson(
  ServerCapabilitiesInlineValueProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlayHintProvider0
_$ServerCapabilitiesInlayHintProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesInlayHintProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesInlayHintProvider0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesInlayHintProvider0ToJson(
  ServerCapabilitiesInlayHintProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlayHintProvider1
_$ServerCapabilitiesInlayHintProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesInlayHintProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesInlayHintProvider1(
          value: $checkedConvert(
            'value',
            (v) => InlayHintOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesInlayHintProvider1ToJson(
  ServerCapabilitiesInlayHintProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlayHintProvider2
_$ServerCapabilitiesInlayHintProvider2FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesInlayHintProvider2',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesInlayHintProvider2(
          value: $checkedConvert(
            'value',
            (v) => InlayHintRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesInlayHintProvider2ToJson(
  ServerCapabilitiesInlayHintProvider2 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDiagnosticProvider0
_$ServerCapabilitiesDiagnosticProvider0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesDiagnosticProvider0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesDiagnosticProvider0(
          value: $checkedConvert(
            'value',
            (v) => DiagnosticOptions.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesDiagnosticProvider0ToJson(
  ServerCapabilitiesDiagnosticProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesDiagnosticProvider1
_$ServerCapabilitiesDiagnosticProvider1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerCapabilitiesDiagnosticProvider1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = ServerCapabilitiesDiagnosticProvider1(
          value: $checkedConvert(
            'value',
            (v) => DiagnosticRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$ServerCapabilitiesDiagnosticProvider1ToJson(
  ServerCapabilitiesDiagnosticProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineCompletionProvider0
_$ServerCapabilitiesInlineCompletionProvider0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesInlineCompletionProvider0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesInlineCompletionProvider0(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesInlineCompletionProvider0ToJson(
  ServerCapabilitiesInlineCompletionProvider0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ServerCapabilitiesInlineCompletionProvider1
_$ServerCapabilitiesInlineCompletionProvider1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServerCapabilitiesInlineCompletionProvider1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = ServerCapabilitiesInlineCompletionProvider1(
      value: $checkedConvert(
        'value',
        (v) => InlineCompletionOptions.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ServerCapabilitiesInlineCompletionProvider1ToJson(
  ServerCapabilitiesInlineCompletionProvider1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentSyncOptionsSave0 _$TextDocumentSyncOptionsSave0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TextDocumentSyncOptionsSave0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = TextDocumentSyncOptionsSave0(
    value: $checkedConvert('value', (v) => v as bool),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$TextDocumentSyncOptionsSave0ToJson(
  TextDocumentSyncOptionsSave0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

TextDocumentSyncOptionsSave1 _$TextDocumentSyncOptionsSave1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TextDocumentSyncOptionsSave1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = TextDocumentSyncOptionsSave1(
    value: $checkedConvert(
      'value',
      (v) => SaveOptions.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$TextDocumentSyncOptionsSave1ToJson(
  TextDocumentSyncOptionsSave1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

NotebookDocumentSyncOptionsNotebookSelector0
_$NotebookDocumentSyncOptionsNotebookSelector0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'NotebookDocumentSyncOptionsNotebookSelector0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = NotebookDocumentSyncOptionsNotebookSelector0(
      value: $checkedConvert(
        'value',
        (v) => _$recordConvert(
          v,
          ($jsonValue) => (
            cells: ($jsonValue['cells'] as List<dynamic>?)
                ?.map(
                  (e) => _$recordConvert(
                    e,
                    ($jsonValue) =>
                        (language: $jsonValue['language'] as String),
                  ),
                )
                .toList(),
            notebook: NotebookCellTextDocumentFilterNotebookBase.fromJson(
              $jsonValue['notebook'] as Map<String, dynamic>,
            ),
          ),
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

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
) => $checkedCreate(
  'NotebookDocumentSyncOptionsNotebookSelector1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = NotebookDocumentSyncOptionsNotebookSelector1(
      value: $checkedConvert(
        'value',
        (v) => _$recordConvert(
          v,
          ($jsonValue) => (
            cells: ($jsonValue['cells'] as List<dynamic>)
                .map(
                  (e) => _$recordConvert(
                    e,
                    ($jsonValue) =>
                        (language: $jsonValue['language'] as String),
                  ),
                )
                .toList(),
            notebook: $jsonValue['notebook'] == null
                ? null
                : NotebookCellTextDocumentFilterNotebookBase.fromJson(
                    $jsonValue['notebook'] as Map<String, dynamic>,
                  ),
          ),
        ),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

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
) => $checkedCreate(
  'WorkspaceFoldersServerCapabilitiesChangeNotifications0',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = WorkspaceFoldersServerCapabilitiesChangeNotifications0(
      value: $checkedConvert('value', (v) => v as String),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic>
_$WorkspaceFoldersServerCapabilitiesChangeNotifications0ToJson(
  WorkspaceFoldersServerCapabilitiesChangeNotifications0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WorkspaceFoldersServerCapabilitiesChangeNotifications1
_$WorkspaceFoldersServerCapabilitiesChangeNotifications1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WorkspaceFoldersServerCapabilitiesChangeNotifications1',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
    final val = WorkspaceFoldersServerCapabilitiesChangeNotifications1(
      value: $checkedConvert('value', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'runtimeType'},
);

Map<String, dynamic>
_$WorkspaceFoldersServerCapabilitiesChangeNotifications1ToJson(
  WorkspaceFoldersServerCapabilitiesChangeNotifications1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ParameterInformationLabel0 _$ParameterInformationLabel0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ParameterInformationLabel0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = ParameterInformationLabel0(
    value: $checkedConvert('value', (v) => v as String),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$ParameterInformationLabel0ToJson(
  ParameterInformationLabel0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ParameterInformationLabel1 _$ParameterInformationLabel1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ParameterInformationLabel1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = ParameterInformationLabel1(
    value: $checkedConvert(
      'value',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (
          ($jsonValue[r'$1'] as num).toInt(),
          ($jsonValue[r'$2'] as num).toInt(),
        ),
      ),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

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
_$NotebookCellTextDocumentFilterNotebook0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NotebookCellTextDocumentFilterNotebook0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = NotebookCellTextDocumentFilterNotebook0(
          value: $checkedConvert('value', (v) => v as String),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$NotebookCellTextDocumentFilterNotebook0ToJson(
  NotebookCellTextDocumentFilterNotebook0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

NotebookCellTextDocumentFilterNotebook1
_$NotebookCellTextDocumentFilterNotebook1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NotebookCellTextDocumentFilterNotebook1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = NotebookCellTextDocumentFilterNotebook1(
          value: $checkedConvert(
            'value',
            (v) =>
                NotebookDocumentFilterBase.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$NotebookCellTextDocumentFilterNotebook1ToJson(
  NotebookCellTextDocumentFilterNotebook1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

RelativePatternBaseUri0 _$RelativePatternBaseUri0FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RelativePatternBaseUri0', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = RelativePatternBaseUri0(
    value: $checkedConvert(
      'value',
      (v) => WorkspaceFolder.fromJson(v as Map<String, dynamic>),
    ),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$RelativePatternBaseUri0ToJson(
  RelativePatternBaseUri0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

RelativePatternBaseUri1 _$RelativePatternBaseUri1FromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RelativePatternBaseUri1', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
  final val = RelativePatternBaseUri1(
    value: $checkedConvert('value', (v) => v as String),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$RelativePatternBaseUri1ToJson(
  RelativePatternBaseUri1 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

SemanticTokensClientCapabilitiesFull0
_$SemanticTokensClientCapabilitiesFull0FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SemanticTokensClientCapabilitiesFull0',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = SemanticTokensClientCapabilitiesFull0(
          value: $checkedConvert('value', (v) => v as bool),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$SemanticTokensClientCapabilitiesFull0ToJson(
  SemanticTokensClientCapabilitiesFull0 instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

SemanticTokensClientCapabilitiesFull1
_$SemanticTokensClientCapabilitiesFull1FromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SemanticTokensClientCapabilitiesFull1',
      json,
      ($checkedConvert) {
        $checkKeys(json, allowedKeys: const ['value', 'runtimeType']);
        final val = SemanticTokensClientCapabilitiesFull1(
          value: $checkedConvert(
            'value',
            (v) => _$recordConvert(
              v,
              ($jsonValue) => (delta: $jsonValue['delta'] as bool?),
            ),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$SemanticTokensClientCapabilitiesFull1ToJson(
  SemanticTokensClientCapabilitiesFull1 instance,
) => <String, dynamic>{
  'value': <String, dynamic>{'delta': instance.value.delta},
  'runtimeType': instance.$type,
};

_ImplementationParams _$ImplementationParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ImplementationParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  final val = _ImplementationParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ImplementationParamsToJson(
  _ImplementationParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_Location _$LocationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Location', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri', 'range']);
      final val = _Location(
        uri: $checkedConvert('uri', (v) => v as String),
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'uri': instance.uri,
  'range': instance.range,
};

_ImplementationRegistrationOptions _$ImplementationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ImplementationRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _ImplementationRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$ImplementationRegistrationOptionsToJson(
  _ImplementationRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_TypeDefinitionParams _$TypeDefinitionParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeDefinitionParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  final val = _TypeDefinitionParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TypeDefinitionParamsToJson(
  _TypeDefinitionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_TypeDefinitionRegistrationOptions _$TypeDefinitionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeDefinitionRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _TypeDefinitionRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$TypeDefinitionRegistrationOptionsToJson(
  _TypeDefinitionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_WorkspaceFolder _$WorkspaceFolderFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WorkspaceFolder', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri', 'name']);
      final val = _WorkspaceFolder(
        uri: $checkedConvert('uri', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$WorkspaceFolderToJson(_WorkspaceFolder instance) =>
    <String, dynamic>{'uri': instance.uri, 'name': instance.name};

_DidChangeWorkspaceFoldersParams _$DidChangeWorkspaceFoldersParamsFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_DidChangeWorkspaceFoldersParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['event']);
      final val = _DidChangeWorkspaceFoldersParams(
        event: $checkedConvert(
          'event',
          (v) =>
              WorkspaceFoldersChangeEvent.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DidChangeWorkspaceFoldersParamsToJson(
  _DidChangeWorkspaceFoldersParams instance,
) => <String, dynamic>{'event': instance.event};

_ConfigurationParams _$ConfigurationParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ConfigurationParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['items']);
      final val = _ConfigurationParams(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => ConfigurationItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConfigurationParamsToJson(
  _ConfigurationParams instance,
) => <String, dynamic>{'items': instance.items};

_DocumentColorParams _$DocumentColorParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentColorParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'partialResultToken',
          'workDoneToken',
        ],
      );
      final val = _DocumentColorParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentColorParamsToJson(
  _DocumentColorParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_ColorInformation _$ColorInformationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ColorInformation', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['range', 'color']);
      final val = _ColorInformation(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        color: $checkedConvert(
          'color',
          (v) => Color.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ColorInformationToJson(_ColorInformation instance) =>
    <String, dynamic>{'range': instance.range, 'color': instance.color};

_DocumentColorRegistrationOptions _$DocumentColorRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentColorRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _DocumentColorRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentColorRegistrationOptionsToJson(
  _DocumentColorRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_ColorPresentationParams _$ColorPresentationParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ColorPresentationParams', json, ($checkedConvert) {
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
  final val = _ColorPresentationParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    color: $checkedConvert(
      'color',
      (v) => Color.fromJson(v as Map<String, dynamic>),
    ),
    range: $checkedConvert(
      'range',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ColorPresentationParamsToJson(
  _ColorPresentationParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'color': instance.color,
  'range': instance.range,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_ColorPresentation _$ColorPresentationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ColorPresentation', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['label', 'additionalTextEdits', 'textEdit'],
      );
      final val = _ColorPresentation(
        label: $checkedConvert('label', (v) => v as String),
        additionalTextEdits: $checkedConvert(
          'additionalTextEdits',
          (v) => (v as List<dynamic>?)
              ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        textEdit: $checkedConvert(
          'textEdit',
          (v) =>
              v == null ? null : TextEdit.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ColorPresentationToJson(_ColorPresentation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'additionalTextEdits': instance.additionalTextEdits,
      'textEdit': instance.textEdit,
    };

_WorkDoneProgressOptions _$WorkDoneProgressOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkDoneProgressOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _WorkDoneProgressOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WorkDoneProgressOptionsToJson(
  _WorkDoneProgressOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_TextDocumentRegistrationOptions _$TextDocumentRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_TextDocumentRegistrationOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['documentSelector']);
      final val = _TextDocumentRegistrationOptions(
        documentSelector: $checkedConvert(
          'documentSelector',
          (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TextDocumentRegistrationOptionsToJson(
  _TextDocumentRegistrationOptions instance,
) => <String, dynamic>{'documentSelector': instance.documentSelector};

_FoldingRangeParams _$FoldingRangeParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FoldingRangeParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'partialResultToken',
          'workDoneToken',
        ],
      );
      final val = _FoldingRangeParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FoldingRangeParamsToJson(_FoldingRangeParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_FoldingRange _$FoldingRangeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FoldingRange', json, ($checkedConvert) {
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
      final val = _FoldingRange(
        startLine: $checkedConvert('startLine', (v) => (v as num).toInt()),
        endLine: $checkedConvert('endLine', (v) => (v as num).toInt()),
        collapsedText: $checkedConvert('collapsedText', (v) => v as String?),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$FoldingRangeKindEnumMap, v),
        ),
        endCharacter: $checkedConvert(
          'endCharacter',
          (v) => (v as num?)?.toInt(),
        ),
        startCharacter: $checkedConvert(
          'startCharacter',
          (v) => (v as num?)?.toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FoldingRangeToJson(_FoldingRange instance) =>
    <String, dynamic>{
      'startLine': instance.startLine,
      'endLine': instance.endLine,
      'collapsedText': instance.collapsedText,
      'kind': _$FoldingRangeKindEnumMap[instance.kind],
      'endCharacter': instance.endCharacter,
      'startCharacter': instance.startCharacter,
    };

const _$FoldingRangeKindEnumMap = {
  FoldingRangeKind.commentValue: 'commentValue',
  FoldingRangeKind.importsValue: 'importsValue',
  FoldingRangeKind.regionValue: 'regionValue',
};

_FoldingRangeRegistrationOptions _$FoldingRangeRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FoldingRangeRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _FoldingRangeRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$FoldingRangeRegistrationOptionsToJson(
  _FoldingRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_DeclarationParams _$DeclarationParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DeclarationParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'position',
          'partialResultToken',
          'workDoneToken',
        ],
      );
      final val = _DeclarationParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DeclarationParamsToJson(_DeclarationParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_DeclarationRegistrationOptions _$DeclarationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DeclarationRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _DeclarationRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DeclarationRegistrationOptionsToJson(
  _DeclarationRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_SelectionRangeParams _$SelectionRangeParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SelectionRangeParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'positions',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  final val = _SelectionRangeParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    positions: $checkedConvert(
      'positions',
      (v) => (v as List<dynamic>)
          .map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SelectionRangeParamsToJson(
  _SelectionRangeParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'positions': instance.positions,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_SelectionRange _$SelectionRangeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SelectionRange', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['range', 'parent']);
      final val = _SelectionRange(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        parent: $checkedConvert(
          'parent',
          (v) => v == null
              ? null
              : SelectionRange.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SelectionRangeToJson(_SelectionRange instance) =>
    <String, dynamic>{'range': instance.range, 'parent': instance.parent};

_SelectionRangeRegistrationOptions _$SelectionRangeRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SelectionRangeRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _SelectionRangeRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SelectionRangeRegistrationOptionsToJson(
  _SelectionRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_WorkDoneProgressCreateParams _$WorkDoneProgressCreateParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkDoneProgressCreateParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['token']);
  final val = _WorkDoneProgressCreateParams(
    token: $checkedConvert(
      'token',
      (v) => ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkDoneProgressCreateParamsToJson(
  _WorkDoneProgressCreateParams instance,
) => <String, dynamic>{'token': instance.token};

_WorkDoneProgressCancelParams _$WorkDoneProgressCancelParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkDoneProgressCancelParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['token']);
  final val = _WorkDoneProgressCancelParams(
    token: $checkedConvert(
      'token',
      (v) => ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkDoneProgressCancelParamsToJson(
  _WorkDoneProgressCancelParams instance,
) => <String, dynamic>{'token': instance.token};

_CallHierarchyPrepareParams _$CallHierarchyPrepareParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CallHierarchyPrepareParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  final val = _CallHierarchyPrepareParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$CallHierarchyPrepareParamsToJson(
  _CallHierarchyPrepareParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': instance.workDoneToken,
};

_CallHierarchyItem _$CallHierarchyItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CallHierarchyItem', json, ($checkedConvert) {
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
      final val = _CallHierarchyItem(
        name: $checkedConvert('name', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$SymbolKindEnumMap, v),
        ),
        uri: $checkedConvert('uri', (v) => v as String),
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        selectionRange: $checkedConvert(
          'selectionRange',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        detail: $checkedConvert('detail', (v) => v as String?),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CallHierarchyItemToJson(_CallHierarchyItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'uri': instance.uri,
      'range': instance.range,
      'selectionRange': instance.selectionRange,
      'data': instance.data,
      'detail': instance.detail,
      'tags': instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

const _$SymbolKindEnumMap = {
  SymbolKind.fileValue: 'fileValue',
  SymbolKind.moduleValue: 'moduleValue',
  SymbolKind.namespaceValue: 'namespaceValue',
  SymbolKind.packageValue: 'packageValue',
  SymbolKind.classValue: 'classValue',
  SymbolKind.methodValue: 'methodValue',
  SymbolKind.propertyValue: 'propertyValue',
  SymbolKind.fieldValue: 'fieldValue',
  SymbolKind.constructorValue: 'constructorValue',
  SymbolKind.enumValue: 'enumValue',
  SymbolKind.interfaceValue: 'interfaceValue',
  SymbolKind.functionValue: 'functionValue',
  SymbolKind.variableValue: 'variableValue',
  SymbolKind.constantValue: 'constantValue',
  SymbolKind.stringValue: 'stringValue',
  SymbolKind.numberValue: 'numberValue',
  SymbolKind.booleanValue: 'booleanValue',
  SymbolKind.arrayValue: 'arrayValue',
  SymbolKind.objectValue: 'objectValue',
  SymbolKind.keyValue: 'keyValue',
  SymbolKind.nullValue: 'nullValue',
  SymbolKind.enumMemberValue: 'enumMemberValue',
  SymbolKind.structValue: 'structValue',
  SymbolKind.eventValue: 'eventValue',
  SymbolKind.operatorValue: 'operatorValue',
  SymbolKind.typeParameterValue: 'typeParameterValue',
};

const _$SymbolTagEnumMap = {SymbolTag.deprecatedValue: 'deprecatedValue'};

_CallHierarchyRegistrationOptions _$CallHierarchyRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CallHierarchyRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _CallHierarchyRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$CallHierarchyRegistrationOptionsToJson(
  _CallHierarchyRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_CallHierarchyIncomingCallsParams _$CallHierarchyIncomingCallsParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CallHierarchyIncomingCallsParams', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  final val = _CallHierarchyIncomingCallsParams(
    item: $checkedConvert(
      'item',
      (v) => CallHierarchyItem.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$CallHierarchyIncomingCallsParamsToJson(
  _CallHierarchyIncomingCallsParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_CallHierarchyIncomingCall _$CallHierarchyIncomingCallFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CallHierarchyIncomingCall', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['from', 'fromRanges']);
  final val = _CallHierarchyIncomingCall(
    from: $checkedConvert(
      'from',
      (v) => CallHierarchyItem.fromJson(v as Map<String, dynamic>),
    ),
    fromRanges: $checkedConvert(
      'fromRanges',
      (v) => (v as List<dynamic>)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CallHierarchyIncomingCallToJson(
  _CallHierarchyIncomingCall instance,
) => <String, dynamic>{
  'from': instance.from,
  'fromRanges': instance.fromRanges,
};

_CallHierarchyOutgoingCallsParams _$CallHierarchyOutgoingCallsParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CallHierarchyOutgoingCallsParams', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  final val = _CallHierarchyOutgoingCallsParams(
    item: $checkedConvert(
      'item',
      (v) => CallHierarchyItem.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$CallHierarchyOutgoingCallsParamsToJson(
  _CallHierarchyOutgoingCallsParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_CallHierarchyOutgoingCall _$CallHierarchyOutgoingCallFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CallHierarchyOutgoingCall', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['to', 'fromRanges']);
  final val = _CallHierarchyOutgoingCall(
    to: $checkedConvert(
      'to',
      (v) => CallHierarchyItem.fromJson(v as Map<String, dynamic>),
    ),
    fromRanges: $checkedConvert(
      'fromRanges',
      (v) => (v as List<dynamic>)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CallHierarchyOutgoingCallToJson(
  _CallHierarchyOutgoingCall instance,
) => <String, dynamic>{'to': instance.to, 'fromRanges': instance.fromRanges};

_SemanticTokensParams _$SemanticTokensParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  final val = _SemanticTokensParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensParamsToJson(
  _SemanticTokensParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_SemanticTokens _$SemanticTokensFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SemanticTokens', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['data', 'resultId']);
      final val = _SemanticTokens(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        resultId: $checkedConvert('resultId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SemanticTokensToJson(_SemanticTokens instance) =>
    <String, dynamic>{'data': instance.data, 'resultId': instance.resultId};

_SemanticTokensPartialResult _$SemanticTokensPartialResultFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensPartialResult', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['data']);
  final val = _SemanticTokensPartialResult(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensPartialResultToJson(
  _SemanticTokensPartialResult instance,
) => <String, dynamic>{'data': instance.data};

_SemanticTokensRegistrationOptions _$SemanticTokensRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensRegistrationOptions', json, (
  $checkedConvert,
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
  final val = _SemanticTokensRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    legend: $checkedConvert(
      'legend',
      (v) => SemanticTokensLegend.fromJson(v as Map<String, dynamic>),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    full: $checkedConvert(
      'full',
      (v) => v == null
          ? null
          : SemanticTokensOptionsFullBase.fromJson(v as Map<String, dynamic>),
    ),
    range: $checkedConvert(
      'range',
      (v) => v == null ? null : RangeBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensRegistrationOptionsToJson(
  _SemanticTokensRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'legend': instance.legend,
  'id': instance.id,
  'full': instance.full,
  'range': instance.range,
  'workDoneProgress': instance.workDoneProgress,
};

_SemanticTokensDeltaParams _$SemanticTokensDeltaParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensDeltaParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'previousResultId',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  final val = _SemanticTokensDeltaParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    previousResultId: $checkedConvert('previousResultId', (v) => v as String),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensDeltaParamsToJson(
  _SemanticTokensDeltaParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'previousResultId': instance.previousResultId,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_SemanticTokensDelta _$SemanticTokensDeltaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SemanticTokensDelta', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['edits', 'resultId']);
      final val = _SemanticTokensDelta(
        edits: $checkedConvert(
          'edits',
          (v) => (v as List<dynamic>)
              .map(
                (e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        resultId: $checkedConvert('resultId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SemanticTokensDeltaToJson(
  _SemanticTokensDelta instance,
) => <String, dynamic>{'edits': instance.edits, 'resultId': instance.resultId};

_SemanticTokensDeltaPartialResult _$SemanticTokensDeltaPartialResultFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensDeltaPartialResult', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['edits']);
  final val = _SemanticTokensDeltaPartialResult(
    edits: $checkedConvert(
      'edits',
      (v) => (v as List<dynamic>)
          .map((e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensDeltaPartialResultToJson(
  _SemanticTokensDeltaPartialResult instance,
) => <String, dynamic>{'edits': instance.edits};

_SemanticTokensRangeParams _$SemanticTokensRangeParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensRangeParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'range',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  final val = _SemanticTokensRangeParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    range: $checkedConvert(
      'range',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensRangeParamsToJson(
  _SemanticTokensRangeParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'range': instance.range,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_ShowDocumentParams _$ShowDocumentParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ShowDocumentParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['uri', 'selection', 'takeFocus', 'external'],
      );
      final val = _ShowDocumentParams(
        uri: $checkedConvert('uri', (v) => v as String),
        selection: $checkedConvert(
          'selection',
          (v) => v == null ? null : Range.fromJson(v as Map<String, dynamic>),
        ),
        takeFocus: $checkedConvert('takeFocus', (v) => v as bool?),
        external: $checkedConvert('external', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$ShowDocumentParamsToJson(_ShowDocumentParams instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'selection': instance.selection,
      'takeFocus': instance.takeFocus,
      'external': instance.external,
    };

_ShowDocumentResult _$ShowDocumentResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ShowDocumentResult', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['success']);
      final val = _ShowDocumentResult(
        success: $checkedConvert('success', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$ShowDocumentResultToJson(_ShowDocumentResult instance) =>
    <String, dynamic>{'success': instance.success};

_LinkedEditingRangeParams _$LinkedEditingRangeParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_LinkedEditingRangeParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  final val = _LinkedEditingRangeParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$LinkedEditingRangeParamsToJson(
  _LinkedEditingRangeParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': instance.workDoneToken,
};

_LinkedEditingRanges _$LinkedEditingRangesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LinkedEditingRanges', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['ranges', 'wordPattern']);
      final val = _LinkedEditingRanges(
        ranges: $checkedConvert(
          'ranges',
          (v) => (v as List<dynamic>)
              .map((e) => Range.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        wordPattern: $checkedConvert('wordPattern', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LinkedEditingRangesToJson(
  _LinkedEditingRanges instance,
) => <String, dynamic>{
  'ranges': instance.ranges,
  'wordPattern': instance.wordPattern,
};

_LinkedEditingRangeRegistrationOptions
_$LinkedEditingRangeRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LinkedEditingRangeRegistrationOptions', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
      );
      final val = _LinkedEditingRangeRegistrationOptions(
        documentSelector: $checkedConvert(
          'documentSelector',
          (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        id: $checkedConvert('id', (v) => v as String?),
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$LinkedEditingRangeRegistrationOptionsToJson(
  _LinkedEditingRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_CreateFilesParams _$CreateFilesParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CreateFilesParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['files']);
      final val = _CreateFilesParams(
        files: $checkedConvert(
          'files',
          (v) => (v as List<dynamic>)
              .map((e) => FileCreate.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CreateFilesParamsToJson(_CreateFilesParams instance) =>
    <String, dynamic>{'files': instance.files};

_WorkspaceEdit _$WorkspaceEditFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceEdit', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['changeAnnotations', 'documentChanges', 'changes'],
  );
  final val = _WorkspaceEdit(
    changeAnnotations: $checkedConvert(
      'changeAnnotations',
      (v) => (v as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ChangeAnnotation.fromJson(e as Map<String, dynamic>)),
      ),
    ),
    documentChanges: $checkedConvert(
      'documentChanges',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => WorkspaceEditDocumentChangesBase.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    changes: $checkedConvert(
      'changes',
      (v) => (v as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceEditToJson(_WorkspaceEdit instance) =>
    <String, dynamic>{
      'changeAnnotations': instance.changeAnnotations,
      'documentChanges': instance.documentChanges,
      'changes': instance.changes,
    };

_FileOperationRegistrationOptions _$FileOperationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FileOperationRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['filters']);
  final val = _FileOperationRegistrationOptions(
    filters: $checkedConvert(
      'filters',
      (v) => (v as List<dynamic>)
          .map((e) => FileOperationFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$FileOperationRegistrationOptionsToJson(
  _FileOperationRegistrationOptions instance,
) => <String, dynamic>{'filters': instance.filters};

_RenameFilesParams _$RenameFilesParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RenameFilesParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['files']);
      final val = _RenameFilesParams(
        files: $checkedConvert(
          'files',
          (v) => (v as List<dynamic>)
              .map((e) => FileRename.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RenameFilesParamsToJson(_RenameFilesParams instance) =>
    <String, dynamic>{'files': instance.files};

_DeleteFilesParams _$DeleteFilesParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DeleteFilesParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['files']);
      final val = _DeleteFilesParams(
        files: $checkedConvert(
          'files',
          (v) => (v as List<dynamic>)
              .map((e) => FileDelete.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DeleteFilesParamsToJson(_DeleteFilesParams instance) =>
    <String, dynamic>{'files': instance.files};

_MonikerParams _$MonikerParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MonikerParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'position',
          'partialResultToken',
          'workDoneToken',
        ],
      );
      final val = _MonikerParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MonikerParamsToJson(_MonikerParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_Moniker _$MonikerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Moniker', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['scheme', 'identifier', 'unique', 'kind'],
      );
      final val = _Moniker(
        scheme: $checkedConvert('scheme', (v) => v as String),
        identifier: $checkedConvert('identifier', (v) => v as String),
        unique: $checkedConvert(
          'unique',
          (v) => $enumDecode(_$UniquenessLevelEnumMap, v),
        ),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$MonikerKindEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MonikerToJson(_Moniker instance) => <String, dynamic>{
  'scheme': instance.scheme,
  'identifier': instance.identifier,
  'unique': _$UniquenessLevelEnumMap[instance.unique]!,
  'kind': _$MonikerKindEnumMap[instance.kind],
};

const _$UniquenessLevelEnumMap = {
  UniquenessLevel.documentValue: 'documentValue',
  UniquenessLevel.projectValue: 'projectValue',
  UniquenessLevel.groupValue: 'groupValue',
  UniquenessLevel.schemeValue: 'schemeValue',
  UniquenessLevel.globalValue: 'globalValue',
};

const _$MonikerKindEnumMap = {
  MonikerKind.importValue: 'importValue',
  MonikerKind.exportValue: 'exportValue',
  MonikerKind.localValue: 'localValue',
};

_MonikerRegistrationOptions _$MonikerRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_MonikerRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  final val = _MonikerRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$MonikerRegistrationOptionsToJson(
  _MonikerRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'workDoneProgress': instance.workDoneProgress,
};

_TypeHierarchyPrepareParams _$TypeHierarchyPrepareParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeHierarchyPrepareParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
  );
  final val = _TypeHierarchyPrepareParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TypeHierarchyPrepareParamsToJson(
  _TypeHierarchyPrepareParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': instance.workDoneToken,
};

_TypeHierarchyItem _$TypeHierarchyItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TypeHierarchyItem', json, ($checkedConvert) {
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
      final val = _TypeHierarchyItem(
        name: $checkedConvert('name', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$SymbolKindEnumMap, v),
        ),
        uri: $checkedConvert('uri', (v) => v as String),
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        selectionRange: $checkedConvert(
          'selectionRange',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        detail: $checkedConvert('detail', (v) => v as String?),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TypeHierarchyItemToJson(_TypeHierarchyItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'uri': instance.uri,
      'range': instance.range,
      'selectionRange': instance.selectionRange,
      'data': instance.data,
      'detail': instance.detail,
      'tags': instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

_TypeHierarchyRegistrationOptions _$TypeHierarchyRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeHierarchyRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _TypeHierarchyRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$TypeHierarchyRegistrationOptionsToJson(
  _TypeHierarchyRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_TypeHierarchySupertypesParams _$TypeHierarchySupertypesParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeHierarchySupertypesParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  final val = _TypeHierarchySupertypesParams(
    item: $checkedConvert(
      'item',
      (v) => TypeHierarchyItem.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TypeHierarchySupertypesParamsToJson(
  _TypeHierarchySupertypesParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_TypeHierarchySubtypesParams _$TypeHierarchySubtypesParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeHierarchySubtypesParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['item', 'partialResultToken', 'workDoneToken'],
  );
  final val = _TypeHierarchySubtypesParams(
    item: $checkedConvert(
      'item',
      (v) => TypeHierarchyItem.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TypeHierarchySubtypesParamsToJson(
  _TypeHierarchySubtypesParams instance,
) => <String, dynamic>{
  'item': instance.item,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_InlineValueParams _$InlineValueParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlineValueParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'range',
          'context',
          'workDoneToken',
        ],
      );
      final val = _InlineValueParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        context: $checkedConvert(
          'context',
          (v) => InlineValueContext.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlineValueParamsToJson(_InlineValueParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'range': instance.range,
      'context': instance.context,
      'workDoneToken': instance.workDoneToken,
    };

_InlineValueRegistrationOptions _$InlineValueRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineValueRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
  );
  final val = _InlineValueRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$InlineValueRegistrationOptionsToJson(
  _InlineValueRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_InlayHintParams _$InlayHintParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlayHintParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['textDocument', 'range', 'workDoneToken'],
      );
      final val = _InlayHintParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlayHintParamsToJson(_InlayHintParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'range': instance.range,
      'workDoneToken': instance.workDoneToken,
    };

_InlayHint _$InlayHintFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlayHint', json, ($checkedConvert) {
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
      final val = _InlayHint(
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        label: $checkedConvert(
          'label',
          (v) => InlayHintLabelBase.fromJson(v as Map<String, dynamic>),
        ),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        paddingRight: $checkedConvert('paddingRight', (v) => v as bool?),
        paddingLeft: $checkedConvert('paddingLeft', (v) => v as bool?),
        tooltip: $checkedConvert(
          'tooltip',
          (v) => v == null
              ? null
              : TooltipOrDocumentationBase.fromJson(v as Map<String, dynamic>),
        ),
        textEdits: $checkedConvert(
          'textEdits',
          (v) => (v as List<dynamic>?)
              ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$InlayHintKindEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlayHintToJson(_InlayHint instance) =>
    <String, dynamic>{
      'position': instance.position,
      'label': instance.label,
      'data': instance.data,
      'paddingRight': instance.paddingRight,
      'paddingLeft': instance.paddingLeft,
      'tooltip': instance.tooltip,
      'textEdits': instance.textEdits,
      'kind': _$InlayHintKindEnumMap[instance.kind],
    };

const _$InlayHintKindEnumMap = {
  InlayHintKind.typeValue: 'typeValue',
  InlayHintKind.parameterValue: 'parameterValue',
};

_InlayHintRegistrationOptions _$InlayHintRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlayHintRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'id',
      'resolveProvider',
      'workDoneProgress',
    ],
  );
  final val = _InlayHintRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    id: $checkedConvert('id', (v) => v as String?),
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$InlayHintRegistrationOptionsToJson(
  _InlayHintRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'resolveProvider': instance.resolveProvider,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentDiagnosticParams _$DocumentDiagnosticParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentDiagnosticParams', json, ($checkedConvert) {
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
  final val = _DocumentDiagnosticParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    previousResultId: $checkedConvert('previousResultId', (v) => v as String?),
    identifier: $checkedConvert('identifier', (v) => v as String?),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentDiagnosticParamsToJson(
  _DocumentDiagnosticParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'previousResultId': instance.previousResultId,
  'identifier': instance.identifier,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_DocumentDiagnosticReportPartialResult
_$DocumentDiagnosticReportPartialResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentDiagnosticReportPartialResult', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['relatedDocuments']);
      final val = _DocumentDiagnosticReportPartialResult(
        relatedDocuments: $checkedConvert(
          'relatedDocuments',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              RelatedDocumentsBase.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentDiagnosticReportPartialResultToJson(
  _DocumentDiagnosticReportPartialResult instance,
) => <String, dynamic>{'relatedDocuments': instance.relatedDocuments};

_DiagnosticServerCancellationData _$DiagnosticServerCancellationDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DiagnosticServerCancellationData', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['retriggerRequest']);
  final val = _DiagnosticServerCancellationData(
    retriggerRequest: $checkedConvert('retriggerRequest', (v) => v as bool),
  );
  return val;
});

Map<String, dynamic> _$DiagnosticServerCancellationDataToJson(
  _DiagnosticServerCancellationData instance,
) => <String, dynamic>{'retriggerRequest': instance.retriggerRequest};

_DiagnosticRegistrationOptions _$DiagnosticRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DiagnosticRegistrationOptions', json, ($checkedConvert) {
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
  final val = _DiagnosticRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    interFileDependencies: $checkedConvert(
      'interFileDependencies',
      (v) => v as bool,
    ),
    workspaceDiagnostics: $checkedConvert(
      'workspaceDiagnostics',
      (v) => v as bool,
    ),
    id: $checkedConvert('id', (v) => v as String?),
    identifier: $checkedConvert('identifier', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DiagnosticRegistrationOptionsToJson(
  _DiagnosticRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'interFileDependencies': instance.interFileDependencies,
  'workspaceDiagnostics': instance.workspaceDiagnostics,
  'id': instance.id,
  'identifier': instance.identifier,
  'workDoneProgress': instance.workDoneProgress,
};

_WorkspaceDiagnosticParams _$WorkspaceDiagnosticParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceDiagnosticParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'previousResultIds',
      'identifier',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  final val = _WorkspaceDiagnosticParams(
    previousResultIds: $checkedConvert(
      'previousResultIds',
      (v) => (v as List<dynamic>)
          .map((e) => PreviousResultId.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    identifier: $checkedConvert('identifier', (v) => v as String?),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceDiagnosticParamsToJson(
  _WorkspaceDiagnosticParams instance,
) => <String, dynamic>{
  'previousResultIds': instance.previousResultIds,
  'identifier': instance.identifier,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_WorkspaceDiagnosticReport _$WorkspaceDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceDiagnosticReport', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['items']);
  final val = _WorkspaceDiagnosticReport(
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map(
            (e) => WorkspaceDocumentDiagnosticReportBase.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceDiagnosticReportToJson(
  _WorkspaceDiagnosticReport instance,
) => <String, dynamic>{'items': instance.items};

_WorkspaceDiagnosticReportPartialResult
_$WorkspaceDiagnosticReportPartialResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WorkspaceDiagnosticReportPartialResult', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['items']);
      final val = _WorkspaceDiagnosticReportPartialResult(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) => WorkspaceDocumentDiagnosticReportBase.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WorkspaceDiagnosticReportPartialResultToJson(
  _WorkspaceDiagnosticReportPartialResult instance,
) => <String, dynamic>{'items': instance.items};

_DidOpenNotebookDocumentParams _$DidOpenNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidOpenNotebookDocumentParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['notebookDocument', 'cellTextDocuments'],
  );
  final val = _DidOpenNotebookDocumentParams(
    notebookDocument: $checkedConvert(
      'notebookDocument',
      (v) => NotebookDocument.fromJson(v as Map<String, dynamic>),
    ),
    cellTextDocuments: $checkedConvert(
      'cellTextDocuments',
      (v) => (v as List<dynamic>)
          .map((e) => TextDocumentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidOpenNotebookDocumentParamsToJson(
  _DidOpenNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument,
  'cellTextDocuments': instance.cellTextDocuments,
};

_DidChangeNotebookDocumentParams _$DidChangeNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_DidChangeNotebookDocumentParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['notebookDocument', 'change']);
      final val = _DidChangeNotebookDocumentParams(
        notebookDocument: $checkedConvert(
          'notebookDocument',
          (v) => VersionedNotebookDocumentIdentifier.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        change: $checkedConvert(
          'change',
          (v) =>
              NotebookDocumentChangeEvent.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DidChangeNotebookDocumentParamsToJson(
  _DidChangeNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument,
  'change': instance.change,
};

_DidSaveNotebookDocumentParams _$DidSaveNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidSaveNotebookDocumentParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['notebookDocument']);
  final val = _DidSaveNotebookDocumentParams(
    notebookDocument: $checkedConvert(
      'notebookDocument',
      (v) => NotebookDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidSaveNotebookDocumentParamsToJson(
  _DidSaveNotebookDocumentParams instance,
) => <String, dynamic>{'notebookDocument': instance.notebookDocument};

_DidCloseNotebookDocumentParams _$DidCloseNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidCloseNotebookDocumentParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['notebookDocument', 'cellTextDocuments'],
  );
  final val = _DidCloseNotebookDocumentParams(
    notebookDocument: $checkedConvert(
      'notebookDocument',
      (v) => NotebookDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    cellTextDocuments: $checkedConvert(
      'cellTextDocuments',
      (v) => (v as List<dynamic>)
          .map(
            (e) => TextDocumentIdentifier.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidCloseNotebookDocumentParamsToJson(
  _DidCloseNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument,
  'cellTextDocuments': instance.cellTextDocuments,
};

_InlineCompletionParams _$InlineCompletionParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineCompletionParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'context', 'workDoneToken'],
  );
  final val = _InlineCompletionParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    context: $checkedConvert(
      'context',
      (v) => InlineCompletionContext.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$InlineCompletionParamsToJson(
  _InlineCompletionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'context': instance.context,
  'workDoneToken': instance.workDoneToken,
};

_InlineCompletionList _$InlineCompletionListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineCompletionList', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['items']);
  final val = _InlineCompletionList(
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map((e) => InlineCompletionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$InlineCompletionListToJson(
  _InlineCompletionList instance,
) => <String, dynamic>{'items': instance.items};

_InlineCompletionItem _$InlineCompletionItemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineCompletionItem', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['insertText', 'command', 'range', 'filterText'],
  );
  final val = _InlineCompletionItem(
    insertText: $checkedConvert(
      'insertText',
      (v) => InlineCompletionItemInsertTextBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    command: $checkedConvert(
      'command',
      (v) => v == null ? null : Command.fromJson(v as Map<String, dynamic>),
    ),
    range: $checkedConvert(
      'range',
      (v) => v == null ? null : Range.fromJson(v as Map<String, dynamic>),
    ),
    filterText: $checkedConvert('filterText', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$InlineCompletionItemToJson(
  _InlineCompletionItem instance,
) => <String, dynamic>{
  'insertText': instance.insertText,
  'command': instance.command,
  'range': instance.range,
  'filterText': instance.filterText,
};

_InlineCompletionRegistrationOptions
_$InlineCompletionRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlineCompletionRegistrationOptions', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const ['documentSelector', 'id', 'workDoneProgress'],
      );
      final val = _InlineCompletionRegistrationOptions(
        documentSelector: $checkedConvert(
          'documentSelector',
          (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        id: $checkedConvert('id', (v) => v as String?),
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlineCompletionRegistrationOptionsToJson(
  _InlineCompletionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'id': instance.id,
  'workDoneProgress': instance.workDoneProgress,
};

_RegistrationParams _$RegistrationParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RegistrationParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['registrations']);
      final val = _RegistrationParams(
        registrations: $checkedConvert(
          'registrations',
          (v) => (v as List<dynamic>)
              .map((e) => Registration.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegistrationParamsToJson(_RegistrationParams instance) =>
    <String, dynamic>{'registrations': instance.registrations};

_UnregistrationParams _$UnregistrationParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_UnregistrationParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['unregisterations']);
  final val = _UnregistrationParams(
    unregisterations: $checkedConvert(
      'unregisterations',
      (v) => (v as List<dynamic>)
          .map((e) => Unregistration.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$UnregistrationParamsToJson(
  _UnregistrationParams instance,
) => <String, dynamic>{'unregisterations': instance.unregisterations};

_InitializeParams _$InitializeParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InitializeParams', json, ($checkedConvert) {
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
      final val = _InitializeParams(
        processId: $checkedConvert(
          'processId',
          (v) => ProcessIdOrVersionBase.fromJson(v as Map<String, dynamic>),
        ),
        rootUri: $checkedConvert(
          'rootUri',
          (v) =>
              InitializeParamsRootUriBase.fromJson(v as Map<String, dynamic>),
        ),
        capabilities: $checkedConvert(
          'capabilities',
          (v) => ClientCapabilities.fromJson(v as Map<String, dynamic>),
        ),
        workspaceFolders: $checkedConvert(
          'workspaceFolders',
          (v) => v == null
              ? null
              : WorkspaceFoldersInitializeParamsWorkspaceFoldersBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        trace: $checkedConvert(
          'trace',
          (v) => $enumDecodeNullable(_$TraceValuesEnumMap, v),
        ),
        initializationOptions: $checkedConvert(
          'initializationOptions',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        rootPath: $checkedConvert(
          'rootPath',
          (v) => v == null
              ? null
              : InitializeParamsRootPathBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        locale: $checkedConvert('locale', (v) => v as String?),
        clientInfo: $checkedConvert(
          'clientInfo',
          (v) => _$recordConvertNullable(
            v,
            ($jsonValue) => (
              name: $jsonValue['name'] as String,
              version: $jsonValue['version'] as String?,
            ),
          ),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InitializeParamsToJson(_InitializeParams instance) =>
    <String, dynamic>{
      'processId': instance.processId,
      'rootUri': instance.rootUri,
      'capabilities': instance.capabilities,
      'workspaceFolders': instance.workspaceFolders,
      'trace': _$TraceValuesEnumMap[instance.trace],
      'initializationOptions': instance.initializationOptions,
      'rootPath': instance.rootPath,
      'locale': instance.locale,
      'clientInfo': instance.clientInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.clientInfo!.name,
              'version': instance.clientInfo!.version,
            },
      'workDoneToken': instance.workDoneToken,
    };

const _$TraceValuesEnumMap = {
  TraceValues.offValue: 'offValue',
  TraceValues.messagesValue: 'messagesValue',
  TraceValues.verboseValue: 'verboseValue',
};

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) => value == null ? null : convert(value as Map<String, dynamic>);

_InitializeResult _$InitializeResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InitializeResult', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['capabilities', 'serverInfo']);
      final val = _InitializeResult(
        capabilities: $checkedConvert(
          'capabilities',
          (v) => ServerCapabilities.fromJson(v as Map<String, dynamic>),
        ),
        serverInfo: $checkedConvert(
          'serverInfo',
          (v) => _$recordConvertNullable(
            v,
            ($jsonValue) => (
              name: $jsonValue['name'] as String,
              version: $jsonValue['version'] as String?,
            ),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InitializeResultToJson(_InitializeResult instance) =>
    <String, dynamic>{
      'capabilities': instance.capabilities,
      'serverInfo': instance.serverInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.serverInfo!.name,
              'version': instance.serverInfo!.version,
            },
    };

_InitializeError _$InitializeErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InitializeError', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['retry']);
      final val = _InitializeError(
        retry: $checkedConvert('retry', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$InitializeErrorToJson(_InitializeError instance) =>
    <String, dynamic>{'retry': instance.retry};

_InitializedParams _$InitializedParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InitializedParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const []);
      final val = _InitializedParams();
      return val;
    });

Map<String, dynamic> _$InitializedParamsToJson(_InitializedParams instance) =>
    <String, dynamic>{};

_DidChangeConfigurationParams _$DidChangeConfigurationParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidChangeConfigurationParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['settings']);
  final val = _DidChangeConfigurationParams(
    settings: $checkedConvert(
      'settings',
      (v) => LSPAnyBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidChangeConfigurationParamsToJson(
  _DidChangeConfigurationParams instance,
) => <String, dynamic>{'settings': instance.settings};

_DidChangeConfigurationRegistrationOptions
_$DidChangeConfigurationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidChangeConfigurationRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['section']);
  final val = _DidChangeConfigurationRegistrationOptions(
    section: $checkedConvert(
      'section',
      (v) => v == null
          ? null
          : DidChangeConfigurationRegistrationOptionsSectionBase.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidChangeConfigurationRegistrationOptionsToJson(
  _DidChangeConfigurationRegistrationOptions instance,
) => <String, dynamic>{'section': instance.section};

_ShowMessageParams _$ShowMessageParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ShowMessageParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['type', 'message']);
      final val = _ShowMessageParams(
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$MessageTypeEnumMap, v),
        ),
        message: $checkedConvert('message', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ShowMessageParamsToJson(_ShowMessageParams instance) =>
    <String, dynamic>{
      'type': _$MessageTypeEnumMap[instance.type]!,
      'message': instance.message,
    };

const _$MessageTypeEnumMap = {
  MessageType.errorValue: 'errorValue',
  MessageType.warningValue: 'warningValue',
  MessageType.infoValue: 'infoValue',
  MessageType.logValue: 'logValue',
  MessageType.debugValue: 'debugValue',
};

_ShowMessageRequestParams _$ShowMessageRequestParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ShowMessageRequestParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['type', 'message', 'actions']);
  final val = _ShowMessageRequestParams(
    type: $checkedConvert('type', (v) => $enumDecode(_$MessageTypeEnumMap, v)),
    message: $checkedConvert('message', (v) => v as String),
    actions: $checkedConvert(
      'actions',
      (v) => (v as List<dynamic>?)
          ?.map((e) => MessageActionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ShowMessageRequestParamsToJson(
  _ShowMessageRequestParams instance,
) => <String, dynamic>{
  'type': _$MessageTypeEnumMap[instance.type]!,
  'message': instance.message,
  'actions': instance.actions,
};

_MessageActionItem _$MessageActionItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MessageActionItem', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['title']);
      final val = _MessageActionItem(
        title: $checkedConvert('title', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MessageActionItemToJson(_MessageActionItem instance) =>
    <String, dynamic>{'title': instance.title};

_LogMessageParams _$LogMessageParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LogMessageParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['type', 'message']);
      final val = _LogMessageParams(
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$MessageTypeEnumMap, v),
        ),
        message: $checkedConvert('message', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$LogMessageParamsToJson(_LogMessageParams instance) =>
    <String, dynamic>{
      'type': _$MessageTypeEnumMap[instance.type]!,
      'message': instance.message,
    };

_DidOpenTextDocumentParams _$DidOpenTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidOpenTextDocumentParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['textDocument']);
  final val = _DidOpenTextDocumentParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentItem.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidOpenTextDocumentParamsToJson(
  _DidOpenTextDocumentParams instance,
) => <String, dynamic>{'textDocument': instance.textDocument};

_DidChangeTextDocumentParams _$DidChangeTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidChangeTextDocumentParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'contentChanges']);
  final val = _DidChangeTextDocumentParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) =>
          VersionedTextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    contentChanges: $checkedConvert(
      'contentChanges',
      (v) => (v as List<dynamic>)
          .map(
            (e) => TextDocumentContentChangeEventBase.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidChangeTextDocumentParamsToJson(
  _DidChangeTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'contentChanges': instance.contentChanges,
};

_TextDocumentChangeRegistrationOptions
_$TextDocumentChangeRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TextDocumentChangeRegistrationOptions', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['documentSelector', 'syncKind']);
      final val = _TextDocumentChangeRegistrationOptions(
        documentSelector: $checkedConvert(
          'documentSelector',
          (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        syncKind: $checkedConvert(
          'syncKind',
          (v) => $enumDecode(_$TextDocumentSyncKindEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TextDocumentChangeRegistrationOptionsToJson(
  _TextDocumentChangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'syncKind': _$TextDocumentSyncKindEnumMap[instance.syncKind]!,
};

_DidCloseTextDocumentParams _$DidCloseTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidCloseTextDocumentParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['textDocument']);
  final val = _DidCloseTextDocumentParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidCloseTextDocumentParamsToJson(
  _DidCloseTextDocumentParams instance,
) => <String, dynamic>{'textDocument': instance.textDocument};

_DidSaveTextDocumentParams _$DidSaveTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidSaveTextDocumentParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'text']);
  final val = _DidSaveTextDocumentParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    text: $checkedConvert('text', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$DidSaveTextDocumentParamsToJson(
  _DidSaveTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'text': instance.text,
};

_TextDocumentSaveRegistrationOptions
_$TextDocumentSaveRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TextDocumentSaveRegistrationOptions', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['documentSelector', 'includeText']);
      final val = _TextDocumentSaveRegistrationOptions(
        documentSelector: $checkedConvert(
          'documentSelector',
          (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        includeText: $checkedConvert('includeText', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$TextDocumentSaveRegistrationOptionsToJson(
  _TextDocumentSaveRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'includeText': instance.includeText,
};

_WillSaveTextDocumentParams _$WillSaveTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WillSaveTextDocumentParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'reason']);
  final val = _WillSaveTextDocumentParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    reason: $checkedConvert(
      'reason',
      (v) => $enumDecode(_$TextDocumentSaveReasonEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$WillSaveTextDocumentParamsToJson(
  _WillSaveTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'reason': _$TextDocumentSaveReasonEnumMap[instance.reason]!,
};

const _$TextDocumentSaveReasonEnumMap = {
  TextDocumentSaveReason.manualValue: 'manualValue',
  TextDocumentSaveReason.afterDelayValue: 'afterDelayValue',
  TextDocumentSaveReason.focusOutValue: 'focusOutValue',
};

_TextEdit _$TextEditFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TextEdit', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['range', 'newText']);
      final val = _TextEdit(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        newText: $checkedConvert('newText', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TextEditToJson(_TextEdit instance) => <String, dynamic>{
  'range': instance.range,
  'newText': instance.newText,
};

_DidChangeWatchedFilesParams _$DidChangeWatchedFilesParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DidChangeWatchedFilesParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['changes']);
  final val = _DidChangeWatchedFilesParams(
    changes: $checkedConvert(
      'changes',
      (v) => (v as List<dynamic>)
          .map((e) => FileEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$DidChangeWatchedFilesParamsToJson(
  _DidChangeWatchedFilesParams instance,
) => <String, dynamic>{'changes': instance.changes};

_DidChangeWatchedFilesRegistrationOptions
_$DidChangeWatchedFilesRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DidChangeWatchedFilesRegistrationOptions', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['watchers']);
      final val = _DidChangeWatchedFilesRegistrationOptions(
        watchers: $checkedConvert(
          'watchers',
          (v) => (v as List<dynamic>)
              .map((e) => FileSystemWatcher.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DidChangeWatchedFilesRegistrationOptionsToJson(
  _DidChangeWatchedFilesRegistrationOptions instance,
) => <String, dynamic>{'watchers': instance.watchers};

_PublishDiagnosticsParams _$PublishDiagnosticsParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PublishDiagnosticsParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['uri', 'diagnostics', 'version']);
  final val = _PublishDiagnosticsParams(
    uri: $checkedConvert('uri', (v) => v as String),
    diagnostics: $checkedConvert(
      'diagnostics',
      (v) => (v as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    version: $checkedConvert('version', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$PublishDiagnosticsParamsToJson(
  _PublishDiagnosticsParams instance,
) => <String, dynamic>{
  'uri': instance.uri,
  'diagnostics': instance.diagnostics,
  'version': instance.version,
};

_CompletionParams _$CompletionParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CompletionParams', json, ($checkedConvert) {
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
      final val = _CompletionParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        context: $checkedConvert(
          'context',
          (v) => v == null
              ? null
              : CompletionContext.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CompletionParamsToJson(_CompletionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'context': instance.context,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_CompletionItem _$CompletionItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CompletionItem', json, ($checkedConvert) {
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
      final val = _CompletionItem(
        label: $checkedConvert('label', (v) => v as String),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        command: $checkedConvert(
          'command',
          (v) => v == null ? null : Command.fromJson(v as Map<String, dynamic>),
        ),
        commitCharacters: $checkedConvert(
          'commitCharacters',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        additionalTextEdits: $checkedConvert(
          'additionalTextEdits',
          (v) => (v as List<dynamic>?)
              ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        textEditText: $checkedConvert('textEditText', (v) => v as String?),
        textEdit: $checkedConvert(
          'textEdit',
          (v) => v == null
              ? null
              : CompletionItemTextEditBase.fromJson(v as Map<String, dynamic>),
        ),
        insertTextMode: $checkedConvert(
          'insertTextMode',
          (v) => $enumDecodeNullable(_$InsertTextModeEnumMap, v),
        ),
        insertTextFormat: $checkedConvert(
          'insertTextFormat',
          (v) => $enumDecodeNullable(_$InsertTextFormatEnumMap, v),
        ),
        insertText: $checkedConvert('insertText', (v) => v as String?),
        filterText: $checkedConvert('filterText', (v) => v as String?),
        sortText: $checkedConvert('sortText', (v) => v as String?),
        preselect: $checkedConvert('preselect', (v) => v as bool?),
        deprecated: $checkedConvert('deprecated', (v) => v as bool?),
        documentation: $checkedConvert(
          'documentation',
          (v) => v == null
              ? null
              : TooltipOrDocumentationBase.fromJson(v as Map<String, dynamic>),
        ),
        detail: $checkedConvert('detail', (v) => v as String?),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$CompletionItemTagEnumMap, e))
              .toList(),
        ),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$CompletionItemKindEnumMap, v),
        ),
        labelDetails: $checkedConvert(
          'labelDetails',
          (v) => v == null
              ? null
              : CompletionItemLabelDetails.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CompletionItemToJson(
  _CompletionItem instance,
) => <String, dynamic>{
  'label': instance.label,
  'data': instance.data,
  'command': instance.command,
  'commitCharacters': instance.commitCharacters,
  'additionalTextEdits': instance.additionalTextEdits,
  'textEditText': instance.textEditText,
  'textEdit': instance.textEdit,
  'insertTextMode': _$InsertTextModeEnumMap[instance.insertTextMode],
  'insertTextFormat': _$InsertTextFormatEnumMap[instance.insertTextFormat],
  'insertText': instance.insertText,
  'filterText': instance.filterText,
  'sortText': instance.sortText,
  'preselect': instance.preselect,
  'deprecated': instance.deprecated,
  'documentation': instance.documentation,
  'detail': instance.detail,
  'tags': instance.tags?.map((e) => _$CompletionItemTagEnumMap[e]!).toList(),
  'kind': _$CompletionItemKindEnumMap[instance.kind],
  'labelDetails': instance.labelDetails,
};

const _$InsertTextModeEnumMap = {
  InsertTextMode.asIsValue: 'asIsValue',
  InsertTextMode.adjustIndentationValue: 'adjustIndentationValue',
};

const _$InsertTextFormatEnumMap = {
  InsertTextFormat.plainTextValue: 'plainTextValue',
  InsertTextFormat.snippetValue: 'snippetValue',
};

const _$CompletionItemTagEnumMap = {
  CompletionItemTag.deprecatedValue: 'deprecatedValue',
};

const _$CompletionItemKindEnumMap = {
  CompletionItemKind.textValue: 'textValue',
  CompletionItemKind.methodValue: 'methodValue',
  CompletionItemKind.functionValue: 'functionValue',
  CompletionItemKind.constructorValue: 'constructorValue',
  CompletionItemKind.fieldValue: 'fieldValue',
  CompletionItemKind.variableValue: 'variableValue',
  CompletionItemKind.classValue: 'classValue',
  CompletionItemKind.interfaceValue: 'interfaceValue',
  CompletionItemKind.moduleValue: 'moduleValue',
  CompletionItemKind.propertyValue: 'propertyValue',
  CompletionItemKind.unitValue: 'unitValue',
  CompletionItemKind.valueValue: 'valueValue',
  CompletionItemKind.enumValue: 'enumValue',
  CompletionItemKind.keywordValue: 'keywordValue',
  CompletionItemKind.snippetValue: 'snippetValue',
  CompletionItemKind.colorValue: 'colorValue',
  CompletionItemKind.fileValue: 'fileValue',
  CompletionItemKind.referenceValue: 'referenceValue',
  CompletionItemKind.folderValue: 'folderValue',
  CompletionItemKind.enumMemberValue: 'enumMemberValue',
  CompletionItemKind.constantValue: 'constantValue',
  CompletionItemKind.structValue: 'structValue',
  CompletionItemKind.eventValue: 'eventValue',
  CompletionItemKind.operatorValue: 'operatorValue',
  CompletionItemKind.typeParameterValue: 'typeParameterValue',
};

_CompletionList _$CompletionListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CompletionList', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['isIncomplete', 'items', 'itemDefaults'],
  );
  final val = _CompletionList(
    isIncomplete: $checkedConvert('isIncomplete', (v) => v as bool),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map((e) => CompletionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    itemDefaults: $checkedConvert(
      'itemDefaults',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          commitCharacters: ($jsonValue['commitCharacters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          data: $jsonValue['data'] == null
              ? null
              : LSPAnyBase.fromJson($jsonValue['data'] as Map<String, dynamic>),
          editRange: $jsonValue['editRange'] == null
              ? null
              : CompletionListEditRangeBase.fromJson(
                  $jsonValue['editRange'] as Map<String, dynamic>,
                ),
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
    ),
  );
  return val;
});

Map<String, dynamic> _$CompletionListToJson(
  _CompletionList instance,
) => <String, dynamic>{
  'isIncomplete': instance.isIncomplete,
  'items': instance.items,
  'itemDefaults': instance.itemDefaults == null
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
) => $checkedCreate('_CompletionRegistrationOptions', json, ($checkedConvert) {
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
  final val = _CompletionRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    completionItem: $checkedConvert(
      'completionItem',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) =>
            (labelDetailsSupport: $jsonValue['labelDetailsSupport'] as bool?),
      ),
    ),
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    allCommitCharacters: $checkedConvert(
      'allCommitCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    triggerCharacters: $checkedConvert(
      'triggerCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$CompletionRegistrationOptionsToJson(
  _CompletionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'completionItem': instance.completionItem == null
      ? null
      : <String, dynamic>{
          'labelDetailsSupport': instance.completionItem!.labelDetailsSupport,
        },
  'resolveProvider': instance.resolveProvider,
  'allCommitCharacters': instance.allCommitCharacters,
  'triggerCharacters': instance.triggerCharacters,
  'workDoneProgress': instance.workDoneProgress,
};

_HoverParams _$HoverParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HoverParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
      );
      final val = _HoverParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HoverParamsToJson(_HoverParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'workDoneToken': instance.workDoneToken,
    };

_Hover _$HoverFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Hover', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['contents', 'range']);
      final val = _Hover(
        contents: $checkedConvert(
          'contents',
          (v) => HoverContentsBase.fromJson(v as Map<String, dynamic>),
        ),
        range: $checkedConvert(
          'range',
          (v) => v == null ? null : Range.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HoverToJson(_Hover instance) => <String, dynamic>{
  'contents': instance.contents,
  'range': instance.range,
};

_HoverRegistrationOptions _$HoverRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_HoverRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  final val = _HoverRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$HoverRegistrationOptionsToJson(
  _HoverRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'workDoneProgress': instance.workDoneProgress,
};

_SignatureHelpParams _$SignatureHelpParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SignatureHelpParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'position',
          'context',
          'workDoneToken',
        ],
      );
      final val = _SignatureHelpParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        context: $checkedConvert(
          'context',
          (v) => v == null
              ? null
              : SignatureHelpContext.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SignatureHelpParamsToJson(
  _SignatureHelpParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'context': instance.context,
  'workDoneToken': instance.workDoneToken,
};

_SignatureHelp _$SignatureHelpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SignatureHelp', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['signatures', 'activeParameter', 'activeSignature'],
      );
      final val = _SignatureHelp(
        signatures: $checkedConvert(
          'signatures',
          (v) => (v as List<dynamic>)
              .map(
                (e) => SignatureInformation.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        activeParameter: $checkedConvert(
          'activeParameter',
          (v) => (v as num?)?.toInt(),
        ),
        activeSignature: $checkedConvert(
          'activeSignature',
          (v) => (v as num?)?.toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SignatureHelpToJson(_SignatureHelp instance) =>
    <String, dynamic>{
      'signatures': instance.signatures,
      'activeParameter': instance.activeParameter,
      'activeSignature': instance.activeSignature,
    };

_SignatureHelpRegistrationOptions _$SignatureHelpRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SignatureHelpRegistrationOptions', json, (
  $checkedConvert,
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
  final val = _SignatureHelpRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    retriggerCharacters: $checkedConvert(
      'retriggerCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    triggerCharacters: $checkedConvert(
      'triggerCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SignatureHelpRegistrationOptionsToJson(
  _SignatureHelpRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'retriggerCharacters': instance.retriggerCharacters,
  'triggerCharacters': instance.triggerCharacters,
  'workDoneProgress': instance.workDoneProgress,
};

_DefinitionParams _$DefinitionParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DefinitionParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'position',
          'partialResultToken',
          'workDoneToken',
        ],
      );
      final val = _DefinitionParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DefinitionParamsToJson(_DefinitionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_DefinitionRegistrationOptions _$DefinitionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DefinitionRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  final val = _DefinitionRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DefinitionRegistrationOptionsToJson(
  _DefinitionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'workDoneProgress': instance.workDoneProgress,
};

_ReferenceParams _$ReferenceParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ReferenceParams', json, ($checkedConvert) {
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
      final val = _ReferenceParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        context: $checkedConvert(
          'context',
          (v) => ReferenceContext.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ReferenceParamsToJson(_ReferenceParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'context': instance.context,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_ReferenceRegistrationOptions _$ReferenceRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ReferenceRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  final val = _ReferenceRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$ReferenceRegistrationOptionsToJson(
  _ReferenceRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentHighlightParams _$DocumentHighlightParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentHighlightParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'textDocument',
      'position',
      'partialResultToken',
      'workDoneToken',
    ],
  );
  final val = _DocumentHighlightParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentHighlightParamsToJson(
  _DocumentHighlightParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_DocumentHighlight _$DocumentHighlightFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentHighlight', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['range', 'kind']);
      final val = _DocumentHighlight(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$DocumentHighlightKindEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentHighlightToJson(_DocumentHighlight instance) =>
    <String, dynamic>{
      'range': instance.range,
      'kind': _$DocumentHighlightKindEnumMap[instance.kind],
    };

const _$DocumentHighlightKindEnumMap = {
  DocumentHighlightKind.textValue: 'textValue',
  DocumentHighlightKind.readValue: 'readValue',
  DocumentHighlightKind.writeValue: 'writeValue',
};

_DocumentHighlightRegistrationOptions
_$DocumentHighlightRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentHighlightRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  final val = _DocumentHighlightRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentHighlightRegistrationOptionsToJson(
  _DocumentHighlightRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentSymbolParams _$DocumentSymbolParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentSymbolParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'partialResultToken', 'workDoneToken'],
  );
  final val = _DocumentSymbolParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentSymbolParamsToJson(
  _DocumentSymbolParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_SymbolInformation _$SymbolInformationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SymbolInformation', json, ($checkedConvert) {
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
      final val = _SymbolInformation(
        name: $checkedConvert('name', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$SymbolKindEnumMap, v),
        ),
        location: $checkedConvert(
          'location',
          (v) => Location.fromJson(v as Map<String, dynamic>),
        ),
        deprecated: $checkedConvert('deprecated', (v) => v as bool?),
        containerName: $checkedConvert('containerName', (v) => v as String?),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SymbolInformationToJson(_SymbolInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'location': instance.location,
      'deprecated': instance.deprecated,
      'containerName': instance.containerName,
      'tags': instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

_DocumentSymbol _$DocumentSymbolFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentSymbol', json, ($checkedConvert) {
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
      final val = _DocumentSymbol(
        name: $checkedConvert('name', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$SymbolKindEnumMap, v),
        ),
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        selectionRange: $checkedConvert(
          'selectionRange',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        children: $checkedConvert(
          'children',
          (v) => (v as List<dynamic>?)
              ?.map((e) => DocumentSymbol.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        deprecated: $checkedConvert('deprecated', (v) => v as bool?),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
              .toList(),
        ),
        detail: $checkedConvert('detail', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DocumentSymbolToJson(_DocumentSymbol instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'range': instance.range,
      'selectionRange': instance.selectionRange,
      'children': instance.children,
      'deprecated': instance.deprecated,
      'tags': instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
      'detail': instance.detail,
    };

_DocumentSymbolRegistrationOptions _$DocumentSymbolRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentSymbolRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['documentSelector', 'label', 'workDoneProgress'],
  );
  final val = _DocumentSymbolRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    label: $checkedConvert('label', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentSymbolRegistrationOptionsToJson(
  _DocumentSymbolRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'label': instance.label,
  'workDoneProgress': instance.workDoneProgress,
};

_CodeActionParams _$CodeActionParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeActionParams', json, ($checkedConvert) {
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
      final val = _CodeActionParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        context: $checkedConvert(
          'context',
          (v) => CodeActionContext.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CodeActionParamsToJson(_CodeActionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'range': instance.range,
      'context': instance.context,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_Command _$CommandFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Command', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['title', 'command', 'arguments']);
      final val = _Command(
        title: $checkedConvert('title', (v) => v as String),
        command: $checkedConvert('command', (v) => v as String),
        arguments: $checkedConvert(
          'arguments',
          (v) => (v as List<dynamic>?)
              ?.map((e) => LSPAnyBase.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CommandToJson(_Command instance) => <String, dynamic>{
  'title': instance.title,
  'command': instance.command,
  'arguments': instance.arguments,
};

_CodeAction _$CodeActionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeAction', json, ($checkedConvert) {
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
      final val = _CodeAction(
        title: $checkedConvert('title', (v) => v as String),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        command: $checkedConvert(
          'command',
          (v) => v == null ? null : Command.fromJson(v as Map<String, dynamic>),
        ),
        edit: $checkedConvert(
          'edit',
          (v) => v == null
              ? null
              : WorkspaceEdit.fromJson(v as Map<String, dynamic>),
        ),
        disabled: $checkedConvert(
          'disabled',
          (v) => _$recordConvertNullable(
            v,
            ($jsonValue) => (reason: $jsonValue['reason'] as String),
          ),
        ),
        isPreferred: $checkedConvert('isPreferred', (v) => v as bool?),
        diagnostics: $checkedConvert(
          'diagnostics',
          (v) => (v as List<dynamic>?)
              ?.map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$CodeActionKindEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CodeActionToJson(_CodeAction instance) =>
    <String, dynamic>{
      'title': instance.title,
      'data': instance.data,
      'command': instance.command,
      'edit': instance.edit,
      'disabled': instance.disabled == null
          ? null
          : <String, dynamic>{'reason': instance.disabled!.reason},
      'isPreferred': instance.isPreferred,
      'diagnostics': instance.diagnostics,
      'kind': _$CodeActionKindEnumMap[instance.kind],
    };

const _$CodeActionKindEnumMap = {
  CodeActionKind.emptyValue: 'emptyValue',
  CodeActionKind.quickFixValue: 'quickFixValue',
  CodeActionKind.refactorValue: 'refactorValue',
  CodeActionKind.refactorExtractValue: 'refactorExtractValue',
  CodeActionKind.refactorInlineValue: 'refactorInlineValue',
  CodeActionKind.refactorRewriteValue: 'refactorRewriteValue',
  CodeActionKind.sourceValue: 'sourceValue',
  CodeActionKind.sourceOrganizeImportsValue: 'sourceOrganizeImportsValue',
  CodeActionKind.sourceFixAllValue: 'sourceFixAllValue',
};

_CodeActionRegistrationOptions _$CodeActionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CodeActionRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'resolveProvider',
      'codeActionKinds',
      'workDoneProgress',
    ],
  );
  final val = _CodeActionRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    codeActionKinds: $checkedConvert(
      'codeActionKinds',
      (v) => (v as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CodeActionKindEnumMap, e))
          .toList(),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$CodeActionRegistrationOptionsToJson(
  _CodeActionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'resolveProvider': instance.resolveProvider,
  'codeActionKinds': instance.codeActionKinds
      ?.map((e) => _$CodeActionKindEnumMap[e]!)
      .toList(),
  'workDoneProgress': instance.workDoneProgress,
};

_WorkspaceSymbolParams _$WorkspaceSymbolParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceSymbolParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['query', 'partialResultToken', 'workDoneToken'],
  );
  final val = _WorkspaceSymbolParams(
    query: $checkedConvert('query', (v) => v as String),
    partialResultToken: $checkedConvert(
      'partialResultToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceSymbolParamsToJson(
  _WorkspaceSymbolParams instance,
) => <String, dynamic>{
  'query': instance.query,
  'partialResultToken': instance.partialResultToken,
  'workDoneToken': instance.workDoneToken,
};

_WorkspaceSymbol _$WorkspaceSymbolFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WorkspaceSymbol', json, ($checkedConvert) {
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
      final val = _WorkspaceSymbol(
        name: $checkedConvert('name', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$SymbolKindEnumMap, v),
        ),
        location: $checkedConvert(
          'location',
          (v) =>
              WorkspaceSymbolLocationBase.fromJson(v as Map<String, dynamic>),
        ),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        containerName: $checkedConvert('containerName', (v) => v as String?),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WorkspaceSymbolToJson(_WorkspaceSymbol instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'location': instance.location,
      'data': instance.data,
      'containerName': instance.containerName,
      'tags': instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
    };

_WorkspaceSymbolRegistrationOptions
_$WorkspaceSymbolRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceSymbolRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  final val = _WorkspaceSymbolRegistrationOptions(
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceSymbolRegistrationOptionsToJson(
  _WorkspaceSymbolRegistrationOptions instance,
) => <String, dynamic>{
  'resolveProvider': instance.resolveProvider,
  'workDoneProgress': instance.workDoneProgress,
};

_CodeLensParams _$CodeLensParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeLensParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'partialResultToken',
          'workDoneToken',
        ],
      );
      final val = _CodeLensParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CodeLensParamsToJson(_CodeLensParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_CodeLens _$CodeLensFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeLens', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['range', 'data', 'command']);
      final val = _CodeLens(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        command: $checkedConvert(
          'command',
          (v) => v == null ? null : Command.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CodeLensToJson(_CodeLens instance) => <String, dynamic>{
  'range': instance.range,
  'data': instance.data,
  'command': instance.command,
};

_CodeLensRegistrationOptions _$CodeLensRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CodeLensRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'resolveProvider',
      'workDoneProgress',
    ],
  );
  final val = _CodeLensRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$CodeLensRegistrationOptionsToJson(
  _CodeLensRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'resolveProvider': instance.resolveProvider,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentLinkParams _$DocumentLinkParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentLinkParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'partialResultToken',
          'workDoneToken',
        ],
      );
      final val = _DocumentLinkParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentLinkParamsToJson(_DocumentLinkParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'partialResultToken': instance.partialResultToken,
      'workDoneToken': instance.workDoneToken,
    };

_DocumentLink _$DocumentLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentLink', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['range', 'data', 'tooltip', 'target'],
      );
      final val = _DocumentLink(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        tooltip: $checkedConvert('tooltip', (v) => v as String?),
        target: $checkedConvert('target', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DocumentLinkToJson(_DocumentLink instance) =>
    <String, dynamic>{
      'range': instance.range,
      'data': instance.data,
      'tooltip': instance.tooltip,
      'target': instance.target,
    };

_DocumentLinkRegistrationOptions _$DocumentLinkRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentLinkRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'resolveProvider',
      'workDoneProgress',
    ],
  );
  final val = _DocumentLinkRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentLinkRegistrationOptionsToJson(
  _DocumentLinkRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'resolveProvider': instance.resolveProvider,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentFormattingParams _$DocumentFormattingParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentFormattingParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'options', 'workDoneToken'],
  );
  final val = _DocumentFormattingParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    options: $checkedConvert(
      'options',
      (v) => FormattingOptions.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentFormattingParamsToJson(
  _DocumentFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'options': instance.options,
  'workDoneToken': instance.workDoneToken,
};

_DocumentFormattingRegistrationOptions
_$DocumentFormattingRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentFormattingRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['documentSelector', 'workDoneProgress']);
  final val = _DocumentFormattingRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentFormattingRegistrationOptionsToJson(
  _DocumentFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentRangeFormattingParams _$DocumentRangeFormattingParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentRangeFormattingParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'range', 'options', 'workDoneToken'],
  );
  final val = _DocumentRangeFormattingParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    range: $checkedConvert(
      'range',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    options: $checkedConvert(
      'options',
      (v) => FormattingOptions.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentRangeFormattingParamsToJson(
  _DocumentRangeFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'range': instance.range,
  'options': instance.options,
  'workDoneToken': instance.workDoneToken,
};

_DocumentRangeFormattingRegistrationOptions
_$DocumentRangeFormattingRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentRangeFormattingRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'rangesSupport',
      'workDoneProgress',
    ],
  );
  final val = _DocumentRangeFormattingRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    rangesSupport: $checkedConvert('rangesSupport', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentRangeFormattingRegistrationOptionsToJson(
  _DocumentRangeFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'rangesSupport': instance.rangesSupport,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentRangesFormattingParams _$DocumentRangesFormattingParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentRangesFormattingParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'ranges', 'options', 'workDoneToken'],
  );
  final val = _DocumentRangesFormattingParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    ranges: $checkedConvert(
      'ranges',
      (v) => (v as List<dynamic>)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    options: $checkedConvert(
      'options',
      (v) => FormattingOptions.fromJson(v as Map<String, dynamic>),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentRangesFormattingParamsToJson(
  _DocumentRangesFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'ranges': instance.ranges,
  'options': instance.options,
  'workDoneToken': instance.workDoneToken,
};

_DocumentOnTypeFormattingParams _$DocumentOnTypeFormattingParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentOnTypeFormattingParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['textDocument', 'position', 'ch', 'options'],
  );
  final val = _DocumentOnTypeFormattingParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
    ch: $checkedConvert('ch', (v) => v as String),
    options: $checkedConvert(
      'options',
      (v) => FormattingOptions.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

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
) => $checkedCreate('_DocumentOnTypeFormattingRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'firstTriggerCharacter',
      'moreTriggerCharacter',
    ],
  );
  final val = _DocumentOnTypeFormattingRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    firstTriggerCharacter: $checkedConvert(
      'firstTriggerCharacter',
      (v) => v as String,
    ),
    moreTriggerCharacter: $checkedConvert(
      'moreTriggerCharacter',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentOnTypeFormattingRegistrationOptionsToJson(
  _DocumentOnTypeFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'firstTriggerCharacter': instance.firstTriggerCharacter,
  'moreTriggerCharacter': instance.moreTriggerCharacter,
};

_RenameParams _$RenameParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RenameParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'textDocument',
          'position',
          'newName',
          'workDoneToken',
        ],
      );
      final val = _RenameParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        newName: $checkedConvert('newName', (v) => v as String),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RenameParamsToJson(_RenameParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'position': instance.position,
      'newName': instance.newName,
      'workDoneToken': instance.workDoneToken,
    };

_RenameRegistrationOptions _$RenameRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_RenameRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'documentSelector',
      'prepareProvider',
      'workDoneProgress',
    ],
  );
  final val = _RenameRegistrationOptions(
    documentSelector: $checkedConvert(
      'documentSelector',
      (v) => TextDocumentRegistrationOptionsDocumentSelectorBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    prepareProvider: $checkedConvert('prepareProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$RenameRegistrationOptionsToJson(
  _RenameRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': instance.documentSelector,
  'prepareProvider': instance.prepareProvider,
  'workDoneProgress': instance.workDoneProgress,
};

_PrepareRenameParams _$PrepareRenameParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PrepareRenameParams', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['textDocument', 'position', 'workDoneToken'],
      );
      final val = _PrepareRenameParams(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
        ),
        position: $checkedConvert(
          'position',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PrepareRenameParamsToJson(
  _PrepareRenameParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
  'workDoneToken': instance.workDoneToken,
};

_ExecuteCommandParams _$ExecuteCommandParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExecuteCommandParams', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['command', 'arguments', 'workDoneToken'],
  );
  final val = _ExecuteCommandParams(
    command: $checkedConvert('command', (v) => v as String),
    arguments: $checkedConvert(
      'arguments',
      (v) => (v as List<dynamic>?)
          ?.map((e) => LSPAnyBase.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ExecuteCommandParamsToJson(
  _ExecuteCommandParams instance,
) => <String, dynamic>{
  'command': instance.command,
  'arguments': instance.arguments,
  'workDoneToken': instance.workDoneToken,
};

_ExecuteCommandRegistrationOptions _$ExecuteCommandRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExecuteCommandRegistrationOptions', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['commands', 'workDoneProgress']);
  final val = _ExecuteCommandRegistrationOptions(
    commands: $checkedConvert(
      'commands',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$ExecuteCommandRegistrationOptionsToJson(
  _ExecuteCommandRegistrationOptions instance,
) => <String, dynamic>{
  'commands': instance.commands,
  'workDoneProgress': instance.workDoneProgress,
};

_ApplyWorkspaceEditParams _$ApplyWorkspaceEditParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ApplyWorkspaceEditParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['edit', 'label']);
  final val = _ApplyWorkspaceEditParams(
    edit: $checkedConvert(
      'edit',
      (v) => WorkspaceEdit.fromJson(v as Map<String, dynamic>),
    ),
    label: $checkedConvert('label', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ApplyWorkspaceEditParamsToJson(
  _ApplyWorkspaceEditParams instance,
) => <String, dynamic>{'edit': instance.edit, 'label': instance.label};

_ApplyWorkspaceEditResult _$ApplyWorkspaceEditResultFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ApplyWorkspaceEditResult', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['applied', 'failedChange', 'failureReason'],
  );
  final val = _ApplyWorkspaceEditResult(
    applied: $checkedConvert('applied', (v) => v as bool),
    failedChange: $checkedConvert('failedChange', (v) => (v as num?)?.toInt()),
    failureReason: $checkedConvert('failureReason', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ApplyWorkspaceEditResultToJson(
  _ApplyWorkspaceEditResult instance,
) => <String, dynamic>{
  'applied': instance.applied,
  'failedChange': instance.failedChange,
  'failureReason': instance.failureReason,
};

_WorkDoneProgressBegin _$WorkDoneProgressBeginFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkDoneProgressBegin', json, ($checkedConvert) {
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
  final val = _WorkDoneProgressBegin(
    kind: $checkedConvert('kind', (v) => v as String),
    title: $checkedConvert('title', (v) => v as String),
    percentage: $checkedConvert('percentage', (v) => (v as num?)?.toInt()),
    message: $checkedConvert('message', (v) => v as String?),
    cancellable: $checkedConvert('cancellable', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WorkDoneProgressBeginToJson(
  _WorkDoneProgressBegin instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'title': instance.title,
  'percentage': instance.percentage,
  'message': instance.message,
  'cancellable': instance.cancellable,
};

_WorkDoneProgressReport _$WorkDoneProgressReportFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkDoneProgressReport', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'percentage', 'message', 'cancellable'],
  );
  final val = _WorkDoneProgressReport(
    kind: $checkedConvert('kind', (v) => v as String),
    percentage: $checkedConvert('percentage', (v) => (v as num?)?.toInt()),
    message: $checkedConvert('message', (v) => v as String?),
    cancellable: $checkedConvert('cancellable', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WorkDoneProgressReportToJson(
  _WorkDoneProgressReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'percentage': instance.percentage,
  'message': instance.message,
  'cancellable': instance.cancellable,
};

_WorkDoneProgressEnd _$WorkDoneProgressEndFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WorkDoneProgressEnd', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['kind', 'message']);
      final val = _WorkDoneProgressEnd(
        kind: $checkedConvert('kind', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$WorkDoneProgressEndToJson(
  _WorkDoneProgressEnd instance,
) => <String, dynamic>{'kind': instance.kind, 'message': instance.message};

_SetTraceParams _$SetTraceParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SetTraceParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['value']);
      final val = _SetTraceParams(
        value: $checkedConvert(
          'value',
          (v) => $enumDecode(_$TraceValuesEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SetTraceParamsToJson(_SetTraceParams instance) =>
    <String, dynamic>{'value': _$TraceValuesEnumMap[instance.value]!};

_LogTraceParams _$LogTraceParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LogTraceParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['message', 'verbose']);
      final val = _LogTraceParams(
        message: $checkedConvert('message', (v) => v as String),
        verbose: $checkedConvert('verbose', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LogTraceParamsToJson(_LogTraceParams instance) =>
    <String, dynamic>{'message': instance.message, 'verbose': instance.verbose};

_CancelParams _$CancelParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CancelParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id']);
      final val = _CancelParams(
        id: $checkedConvert(
          'id',
          (v) => ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CancelParamsToJson(_CancelParams instance) =>
    <String, dynamic>{'id': instance.id};

_ProgressParams _$ProgressParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProgressParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['token', 'value']);
      final val = _ProgressParams(
        token: $checkedConvert(
          'token',
          (v) => ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        value: $checkedConvert(
          'value',
          (v) => LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ProgressParamsToJson(_ProgressParams instance) =>
    <String, dynamic>{'token': instance.token, 'value': instance.value};

_TextDocumentPositionParams _$TextDocumentPositionParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TextDocumentPositionParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['textDocument', 'position']);
  final val = _TextDocumentPositionParams(
    textDocument: $checkedConvert(
      'textDocument',
      (v) => TextDocumentIdentifier.fromJson(v as Map<String, dynamic>),
    ),
    position: $checkedConvert(
      'position',
      (v) => Position.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TextDocumentPositionParamsToJson(
  _TextDocumentPositionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument,
  'position': instance.position,
};

_WorkDoneProgressParams _$WorkDoneProgressParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkDoneProgressParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneToken']);
  final val = _WorkDoneProgressParams(
    workDoneToken: $checkedConvert(
      'workDoneToken',
      (v) => v == null
          ? null
          : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkDoneProgressParamsToJson(
  _WorkDoneProgressParams instance,
) => <String, dynamic>{'workDoneToken': instance.workDoneToken};

_PartialResultParams _$PartialResultParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PartialResultParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['partialResultToken']);
      final val = _PartialResultParams(
        partialResultToken: $checkedConvert(
          'partialResultToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PartialResultParamsToJson(
  _PartialResultParams instance,
) => <String, dynamic>{'partialResultToken': instance.partialResultToken};

_LocationLink _$LocationLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LocationLink', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'targetUri',
          'targetRange',
          'targetSelectionRange',
          'originSelectionRange',
        ],
      );
      final val = _LocationLink(
        targetUri: $checkedConvert('targetUri', (v) => v as String),
        targetRange: $checkedConvert(
          'targetRange',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        targetSelectionRange: $checkedConvert(
          'targetSelectionRange',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        originSelectionRange: $checkedConvert(
          'originSelectionRange',
          (v) => v == null ? null : Range.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LocationLinkToJson(_LocationLink instance) =>
    <String, dynamic>{
      'targetUri': instance.targetUri,
      'targetRange': instance.targetRange,
      'targetSelectionRange': instance.targetSelectionRange,
      'originSelectionRange': instance.originSelectionRange,
    };

_Range _$RangeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Range', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['start', 'end']);
      final val = _Range(
        start: $checkedConvert(
          'start',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
        end: $checkedConvert(
          'end',
          (v) => Position.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RangeToJson(_Range instance) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
};

_ImplementationOptions _$ImplementationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ImplementationOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _ImplementationOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$ImplementationOptionsToJson(
  _ImplementationOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_StaticRegistrationOptions _$StaticRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_StaticRegistrationOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['id']);
  final val = _StaticRegistrationOptions(
    id: $checkedConvert('id', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$StaticRegistrationOptionsToJson(
  _StaticRegistrationOptions instance,
) => <String, dynamic>{'id': instance.id};

_TypeDefinitionOptions _$TypeDefinitionOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeDefinitionOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _TypeDefinitionOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$TypeDefinitionOptionsToJson(
  _TypeDefinitionOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_WorkspaceFoldersChangeEvent _$WorkspaceFoldersChangeEventFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceFoldersChangeEvent', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['added', 'removed']);
  final val = _WorkspaceFoldersChangeEvent(
    added: $checkedConvert(
      'added',
      (v) => (v as List<dynamic>)
          .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    removed: $checkedConvert(
      'removed',
      (v) => (v as List<dynamic>)
          .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceFoldersChangeEventToJson(
  _WorkspaceFoldersChangeEvent instance,
) => <String, dynamic>{'added': instance.added, 'removed': instance.removed};

_ConfigurationItem _$ConfigurationItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ConfigurationItem', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['section', 'scopeUri']);
      final val = _ConfigurationItem(
        section: $checkedConvert('section', (v) => v as String?),
        scopeUri: $checkedConvert('scopeUri', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ConfigurationItemToJson(_ConfigurationItem instance) =>
    <String, dynamic>{
      'section': instance.section,
      'scopeUri': instance.scopeUri,
    };

_TextDocumentIdentifier _$TextDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TextDocumentIdentifier', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['uri']);
  final val = _TextDocumentIdentifier(
    uri: $checkedConvert('uri', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$TextDocumentIdentifierToJson(
  _TextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri};

_Color _$ColorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Color', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['red', 'green', 'blue', 'alpha']);
      final val = _Color(
        red: $checkedConvert('red', (v) => (v as num).toDouble()),
        green: $checkedConvert('green', (v) => (v as num).toDouble()),
        blue: $checkedConvert('blue', (v) => (v as num).toDouble()),
        alpha: $checkedConvert('alpha', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$ColorToJson(_Color instance) => <String, dynamic>{
  'red': instance.red,
  'green': instance.green,
  'blue': instance.blue,
  'alpha': instance.alpha,
};

_DocumentColorOptions _$DocumentColorOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentColorOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _DocumentColorOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentColorOptionsToJson(
  _DocumentColorOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_FoldingRangeOptions _$FoldingRangeOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FoldingRangeOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['workDoneProgress']);
      final val = _FoldingRangeOptions(
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$FoldingRangeOptionsToJson(
  _FoldingRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_DeclarationOptions _$DeclarationOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DeclarationOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['workDoneProgress']);
      final val = _DeclarationOptions(
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DeclarationOptionsToJson(_DeclarationOptions instance) =>
    <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_Position _$PositionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Position', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['line', 'character']);
      final val = _Position(
        line: $checkedConvert('line', (v) => (v as num).toInt()),
        character: $checkedConvert('character', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PositionToJson(_Position instance) => <String, dynamic>{
  'line': instance.line,
  'character': instance.character,
};

_SelectionRangeOptions _$SelectionRangeOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SelectionRangeOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _SelectionRangeOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SelectionRangeOptionsToJson(
  _SelectionRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_CallHierarchyOptions _$CallHierarchyOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CallHierarchyOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _CallHierarchyOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$CallHierarchyOptionsToJson(
  _CallHierarchyOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_SemanticTokensOptions _$SemanticTokensOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['legend', 'full', 'range', 'workDoneProgress'],
  );
  final val = _SemanticTokensOptions(
    legend: $checkedConvert(
      'legend',
      (v) => SemanticTokensLegend.fromJson(v as Map<String, dynamic>),
    ),
    full: $checkedConvert(
      'full',
      (v) => v == null
          ? null
          : SemanticTokensOptionsFullBase.fromJson(v as Map<String, dynamic>),
    ),
    range: $checkedConvert(
      'range',
      (v) => v == null ? null : RangeBase.fromJson(v as Map<String, dynamic>),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensOptionsToJson(
  _SemanticTokensOptions instance,
) => <String, dynamic>{
  'legend': instance.legend,
  'full': instance.full,
  'range': instance.range,
  'workDoneProgress': instance.workDoneProgress,
};

_SemanticTokensEdit _$SemanticTokensEditFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SemanticTokensEdit', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['start', 'deleteCount', 'data']);
      final val = _SemanticTokensEdit(
        start: $checkedConvert('start', (v) => (v as num).toInt()),
        deleteCount: $checkedConvert('deleteCount', (v) => (v as num).toInt()),
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SemanticTokensEditToJson(_SemanticTokensEdit instance) =>
    <String, dynamic>{
      'start': instance.start,
      'deleteCount': instance.deleteCount,
      'data': instance.data,
    };

_LinkedEditingRangeOptions _$LinkedEditingRangeOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_LinkedEditingRangeOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _LinkedEditingRangeOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$LinkedEditingRangeOptionsToJson(
  _LinkedEditingRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_FileCreate _$FileCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FileCreate', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri']);
      final val = _FileCreate(uri: $checkedConvert('uri', (v) => v as String));
      return val;
    });

Map<String, dynamic> _$FileCreateToJson(_FileCreate instance) =>
    <String, dynamic>{'uri': instance.uri};

_TextDocumentEdit _$TextDocumentEditFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TextDocumentEdit', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['textDocument', 'edits']);
      final val = _TextDocumentEdit(
        textDocument: $checkedConvert(
          'textDocument',
          (v) => OptionalVersionedTextDocumentIdentifier.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
        edits: $checkedConvert(
          'edits',
          (v) => (v as List<dynamic>)
              .map(
                (e) => TextDocumentEditEditsBase.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TextDocumentEditToJson(_TextDocumentEdit instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument,
      'edits': instance.edits,
    };

_CreateFile _$CreateFileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CreateFile', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['kind', 'uri', 'options', 'annotationId'],
      );
      final val = _CreateFile(
        kind: $checkedConvert('kind', (v) => v as String),
        uri: $checkedConvert('uri', (v) => v as String),
        options: $checkedConvert(
          'options',
          (v) => v == null
              ? null
              : CreateFileOptions.fromJson(v as Map<String, dynamic>),
        ),
        annotationId: $checkedConvert('annotationId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CreateFileToJson(_CreateFile instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'uri': instance.uri,
      'options': instance.options,
      'annotationId': instance.annotationId,
    };

_RenameFile _$RenameFileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RenameFile', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'kind',
          'oldUri',
          'newUri',
          'options',
          'annotationId',
        ],
      );
      final val = _RenameFile(
        kind: $checkedConvert('kind', (v) => v as String),
        oldUri: $checkedConvert('oldUri', (v) => v as String),
        newUri: $checkedConvert('newUri', (v) => v as String),
        options: $checkedConvert(
          'options',
          (v) => v == null
              ? null
              : RenameFileOptions.fromJson(v as Map<String, dynamic>),
        ),
        annotationId: $checkedConvert('annotationId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RenameFileToJson(_RenameFile instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'oldUri': instance.oldUri,
      'newUri': instance.newUri,
      'options': instance.options,
      'annotationId': instance.annotationId,
    };

_DeleteFile _$DeleteFileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DeleteFile', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['kind', 'uri', 'options', 'annotationId'],
      );
      final val = _DeleteFile(
        kind: $checkedConvert('kind', (v) => v as String),
        uri: $checkedConvert('uri', (v) => v as String),
        options: $checkedConvert(
          'options',
          (v) => v == null
              ? null
              : DeleteFileOptions.fromJson(v as Map<String, dynamic>),
        ),
        annotationId: $checkedConvert('annotationId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DeleteFileToJson(_DeleteFile instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'uri': instance.uri,
      'options': instance.options,
      'annotationId': instance.annotationId,
    };

_ChangeAnnotation _$ChangeAnnotationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ChangeAnnotation', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['label', 'description', 'needsConfirmation'],
      );
      final val = _ChangeAnnotation(
        label: $checkedConvert('label', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        needsConfirmation: $checkedConvert(
          'needsConfirmation',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChangeAnnotationToJson(_ChangeAnnotation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'needsConfirmation': instance.needsConfirmation,
    };

_FileOperationFilter _$FileOperationFilterFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FileOperationFilter', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['pattern', 'scheme']);
      final val = _FileOperationFilter(
        pattern: $checkedConvert(
          'pattern',
          (v) => FileOperationPattern.fromJson(v as Map<String, dynamic>),
        ),
        scheme: $checkedConvert('scheme', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$FileOperationFilterToJson(
  _FileOperationFilter instance,
) => <String, dynamic>{'pattern': instance.pattern, 'scheme': instance.scheme};

_FileRename _$FileRenameFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FileRename', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['oldUri', 'newUri']);
      final val = _FileRename(
        oldUri: $checkedConvert('oldUri', (v) => v as String),
        newUri: $checkedConvert('newUri', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FileRenameToJson(_FileRename instance) =>
    <String, dynamic>{'oldUri': instance.oldUri, 'newUri': instance.newUri};

_FileDelete _$FileDeleteFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FileDelete', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri']);
      final val = _FileDelete(uri: $checkedConvert('uri', (v) => v as String));
      return val;
    });

Map<String, dynamic> _$FileDeleteToJson(_FileDelete instance) =>
    <String, dynamic>{'uri': instance.uri};

_MonikerOptions _$MonikerOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MonikerOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['workDoneProgress']);
      final val = _MonikerOptions(
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$MonikerOptionsToJson(_MonikerOptions instance) =>
    <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_TypeHierarchyOptions _$TypeHierarchyOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeHierarchyOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _TypeHierarchyOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$TypeHierarchyOptionsToJson(
  _TypeHierarchyOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_InlineValueContext _$InlineValueContextFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlineValueContext', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['frameId', 'stoppedLocation']);
      final val = _InlineValueContext(
        frameId: $checkedConvert('frameId', (v) => (v as num).toInt()),
        stoppedLocation: $checkedConvert(
          'stoppedLocation',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlineValueContextToJson(_InlineValueContext instance) =>
    <String, dynamic>{
      'frameId': instance.frameId,
      'stoppedLocation': instance.stoppedLocation,
    };

_InlineValueText _$InlineValueTextFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlineValueText', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['range', 'text']);
      final val = _InlineValueText(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        text: $checkedConvert('text', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$InlineValueTextToJson(_InlineValueText instance) =>
    <String, dynamic>{'range': instance.range, 'text': instance.text};

_InlineValueVariableLookup _$InlineValueVariableLookupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineValueVariableLookup', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['range', 'caseSensitiveLookup', 'variableName'],
  );
  final val = _InlineValueVariableLookup(
    range: $checkedConvert(
      'range',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    caseSensitiveLookup: $checkedConvert(
      'caseSensitiveLookup',
      (v) => v as bool,
    ),
    variableName: $checkedConvert('variableName', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$InlineValueVariableLookupToJson(
  _InlineValueVariableLookup instance,
) => <String, dynamic>{
  'range': instance.range,
  'caseSensitiveLookup': instance.caseSensitiveLookup,
  'variableName': instance.variableName,
};

_InlineValueEvaluatableExpression _$InlineValueEvaluatableExpressionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineValueEvaluatableExpression', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['range', 'expression']);
  final val = _InlineValueEvaluatableExpression(
    range: $checkedConvert(
      'range',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    expression: $checkedConvert('expression', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$InlineValueEvaluatableExpressionToJson(
  _InlineValueEvaluatableExpression instance,
) => <String, dynamic>{
  'range': instance.range,
  'expression': instance.expression,
};

_InlineValueOptions _$InlineValueOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlineValueOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['workDoneProgress']);
      final val = _InlineValueOptions(
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlineValueOptionsToJson(_InlineValueOptions instance) =>
    <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_InlayHintLabelPart _$InlayHintLabelPartFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlayHintLabelPart', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['value', 'command', 'location', 'tooltip'],
      );
      final val = _InlayHintLabelPart(
        value: $checkedConvert('value', (v) => v as String),
        command: $checkedConvert(
          'command',
          (v) => v == null ? null : Command.fromJson(v as Map<String, dynamic>),
        ),
        location: $checkedConvert(
          'location',
          (v) =>
              v == null ? null : Location.fromJson(v as Map<String, dynamic>),
        ),
        tooltip: $checkedConvert(
          'tooltip',
          (v) => v == null
              ? null
              : TooltipOrDocumentationBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlayHintLabelPartToJson(_InlayHintLabelPart instance) =>
    <String, dynamic>{
      'value': instance.value,
      'command': instance.command,
      'location': instance.location,
      'tooltip': instance.tooltip,
    };

_MarkupContent _$MarkupContentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MarkupContent', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['kind', 'value']);
      final val = _MarkupContent(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$MarkupKindEnumMap, v),
        ),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MarkupContentToJson(_MarkupContent instance) =>
    <String, dynamic>{
      'kind': _$MarkupKindEnumMap[instance.kind]!,
      'value': instance.value,
    };

const _$MarkupKindEnumMap = {
  MarkupKind.plainTextValue: 'plainTextValue',
  MarkupKind.markdownValue: 'markdownValue',
};

_InlayHintOptions _$InlayHintOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlayHintOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  final val = _InlayHintOptions(
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$InlayHintOptionsToJson(_InlayHintOptions instance) =>
    <String, dynamic>{
      'resolveProvider': instance.resolveProvider,
      'workDoneProgress': instance.workDoneProgress,
    };

_RelatedFullDocumentDiagnosticReport
_$RelatedFullDocumentDiagnosticReportFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RelatedFullDocumentDiagnosticReport', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const ['kind', 'items', 'relatedDocuments', 'resultId'],
      );
      final val = _RelatedFullDocumentDiagnosticReport(
        kind: $checkedConvert('kind', (v) => v as String),
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        relatedDocuments: $checkedConvert(
          'relatedDocuments',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              RelatedDocumentsBase.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
        resultId: $checkedConvert('resultId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RelatedFullDocumentDiagnosticReportToJson(
  _RelatedFullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'items': instance.items,
  'relatedDocuments': instance.relatedDocuments,
  'resultId': instance.resultId,
};

_RelatedUnchangedDocumentDiagnosticReport
_$RelatedUnchangedDocumentDiagnosticReportFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RelatedUnchangedDocumentDiagnosticReport', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const ['kind', 'resultId', 'relatedDocuments'],
      );
      final val = _RelatedUnchangedDocumentDiagnosticReport(
        kind: $checkedConvert('kind', (v) => v as String),
        resultId: $checkedConvert('resultId', (v) => v as String),
        relatedDocuments: $checkedConvert(
          'relatedDocuments',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              RelatedDocumentsBase.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RelatedUnchangedDocumentDiagnosticReportToJson(
  _RelatedUnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': instance.resultId,
  'relatedDocuments': instance.relatedDocuments,
};

_FullDocumentDiagnosticReport _$FullDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FullDocumentDiagnosticReport', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['kind', 'items', 'resultId']);
  final val = _FullDocumentDiagnosticReport(
    kind: $checkedConvert('kind', (v) => v as String),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    resultId: $checkedConvert('resultId', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$FullDocumentDiagnosticReportToJson(
  _FullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'items': instance.items,
  'resultId': instance.resultId,
};

_UnchangedDocumentDiagnosticReport _$UnchangedDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_UnchangedDocumentDiagnosticReport', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['kind', 'resultId']);
  final val = _UnchangedDocumentDiagnosticReport(
    kind: $checkedConvert('kind', (v) => v as String),
    resultId: $checkedConvert('resultId', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$UnchangedDocumentDiagnosticReportToJson(
  _UnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{'kind': instance.kind, 'resultId': instance.resultId};

_DiagnosticOptions _$DiagnosticOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DiagnosticOptions', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'interFileDependencies',
          'workspaceDiagnostics',
          'identifier',
          'workDoneProgress',
        ],
      );
      final val = _DiagnosticOptions(
        interFileDependencies: $checkedConvert(
          'interFileDependencies',
          (v) => v as bool,
        ),
        workspaceDiagnostics: $checkedConvert(
          'workspaceDiagnostics',
          (v) => v as bool,
        ),
        identifier: $checkedConvert('identifier', (v) => v as String?),
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DiagnosticOptionsToJson(_DiagnosticOptions instance) =>
    <String, dynamic>{
      'interFileDependencies': instance.interFileDependencies,
      'workspaceDiagnostics': instance.workspaceDiagnostics,
      'identifier': instance.identifier,
      'workDoneProgress': instance.workDoneProgress,
    };

_PreviousResultId _$PreviousResultIdFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PreviousResultId', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri', 'value']);
      final val = _PreviousResultId(
        uri: $checkedConvert('uri', (v) => v as String),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$PreviousResultIdToJson(_PreviousResultId instance) =>
    <String, dynamic>{'uri': instance.uri, 'value': instance.value};

_NotebookDocument _$NotebookDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NotebookDocument', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'uri',
          'notebookType',
          'version',
          'cells',
          'metadata',
        ],
      );
      final val = _NotebookDocument(
        uri: $checkedConvert('uri', (v) => v as String),
        notebookType: $checkedConvert('notebookType', (v) => v as String),
        version: $checkedConvert('version', (v) => (v as num).toInt()),
        cells: $checkedConvert(
          'cells',
          (v) => (v as List<dynamic>)
              .map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        metadata: $checkedConvert(
          'metadata',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, LSPAnyBase.fromJson(e as Map<String, dynamic>)),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NotebookDocumentToJson(_NotebookDocument instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'notebookType': instance.notebookType,
      'version': instance.version,
      'cells': instance.cells,
      'metadata': instance.metadata,
    };

_TextDocumentItem _$TextDocumentItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TextDocumentItem', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['uri', 'languageId', 'version', 'text'],
      );
      final val = _TextDocumentItem(
        uri: $checkedConvert('uri', (v) => v as String),
        languageId: $checkedConvert('languageId', (v) => v as String),
        version: $checkedConvert('version', (v) => (v as num).toInt()),
        text: $checkedConvert('text', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TextDocumentItemToJson(_TextDocumentItem instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'languageId': instance.languageId,
      'version': instance.version,
      'text': instance.text,
    };

_VersionedNotebookDocumentIdentifier
_$VersionedNotebookDocumentIdentifierFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_VersionedNotebookDocumentIdentifier', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['version', 'uri']);
      final val = _VersionedNotebookDocumentIdentifier(
        version: $checkedConvert('version', (v) => (v as num).toInt()),
        uri: $checkedConvert('uri', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$VersionedNotebookDocumentIdentifierToJson(
  _VersionedNotebookDocumentIdentifier instance,
) => <String, dynamic>{'version': instance.version, 'uri': instance.uri};

_NotebookDocumentChangeEvent _$NotebookDocumentChangeEventFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_NotebookDocumentChangeEvent', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['cells', 'metadata']);
  final val = _NotebookDocumentChangeEvent(
    cells: $checkedConvert(
      'cells',
      (v) => _$recordConvertNullable(
        v,
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
                    changes: ($jsonValue['changes'] as List<dynamic>)
                        .map(
                          (e) => TextDocumentContentChangeEventBase.fromJson(
                            e as Map<String, dynamic>,
                          ),
                        )
                        .toList(),
                    document: VersionedTextDocumentIdentifier.fromJson(
                      $jsonValue['document'] as Map<String, dynamic>,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ),
    metadata: $checkedConvert(
      'metadata',
      (v) => (v as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, LSPAnyBase.fromJson(e as Map<String, dynamic>)),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$NotebookDocumentChangeEventToJson(
  _NotebookDocumentChangeEvent instance,
) => <String, dynamic>{
  'cells': instance.cells == null
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
  'metadata': instance.metadata,
};

_NotebookDocumentIdentifier _$NotebookDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_NotebookDocumentIdentifier', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['uri']);
  final val = _NotebookDocumentIdentifier(
    uri: $checkedConvert('uri', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$NotebookDocumentIdentifierToJson(
  _NotebookDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri};

_InlineCompletionContext _$InlineCompletionContextFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineCompletionContext', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['triggerKind', 'selectedCompletionInfo'],
  );
  final val = _InlineCompletionContext(
    triggerKind: $checkedConvert(
      'triggerKind',
      (v) => $enumDecode(_$InlineCompletionTriggerKindEnumMap, v),
    ),
    selectedCompletionInfo: $checkedConvert(
      'selectedCompletionInfo',
      (v) => v == null
          ? null
          : SelectedCompletionInfo.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$InlineCompletionContextToJson(
  _InlineCompletionContext instance,
) => <String, dynamic>{
  'triggerKind': _$InlineCompletionTriggerKindEnumMap[instance.triggerKind]!,
  'selectedCompletionInfo': instance.selectedCompletionInfo,
};

const _$InlineCompletionTriggerKindEnumMap = {
  InlineCompletionTriggerKind.invokedValue: 'invokedValue',
  InlineCompletionTriggerKind.automaticValue: 'automaticValue',
};

_StringValue _$StringValueFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StringValue', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['kind', 'value']);
      final val = _StringValue(
        kind: $checkedConvert('kind', (v) => v as String),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$StringValueToJson(_StringValue instance) =>
    <String, dynamic>{'kind': instance.kind, 'value': instance.value};

_InlineCompletionOptions _$InlineCompletionOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineCompletionOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _InlineCompletionOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$InlineCompletionOptionsToJson(
  _InlineCompletionOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_Registration _$RegistrationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Registration', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'method', 'registerOptions']);
      final val = _Registration(
        id: $checkedConvert('id', (v) => v as String),
        method: $checkedConvert('method', (v) => v as String),
        registerOptions: $checkedConvert(
          'registerOptions',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegistrationToJson(_Registration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'registerOptions': instance.registerOptions,
    };

_Unregistration _$UnregistrationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Unregistration', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'method']);
      final val = _Unregistration(
        id: $checkedConvert('id', (v) => v as String),
        method: $checkedConvert('method', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$UnregistrationToJson(_Unregistration instance) =>
    <String, dynamic>{'id': instance.id, 'method': instance.method};

_TInitializeParams _$TInitializeParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TInitializeParams', json, ($checkedConvert) {
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
      final val = _TInitializeParams(
        processId: $checkedConvert(
          'processId',
          (v) => ProcessIdOrVersionBase.fromJson(v as Map<String, dynamic>),
        ),
        rootUri: $checkedConvert(
          'rootUri',
          (v) =>
              InitializeParamsRootUriBase.fromJson(v as Map<String, dynamic>),
        ),
        capabilities: $checkedConvert(
          'capabilities',
          (v) => ClientCapabilities.fromJson(v as Map<String, dynamic>),
        ),
        trace: $checkedConvert(
          'trace',
          (v) => $enumDecodeNullable(_$TraceValuesEnumMap, v),
        ),
        initializationOptions: $checkedConvert(
          'initializationOptions',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        rootPath: $checkedConvert(
          'rootPath',
          (v) => v == null
              ? null
              : InitializeParamsRootPathBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        locale: $checkedConvert('locale', (v) => v as String?),
        clientInfo: $checkedConvert(
          'clientInfo',
          (v) => _$recordConvertNullable(
            v,
            ($jsonValue) => (
              name: $jsonValue['name'] as String,
              version: $jsonValue['version'] as String?,
            ),
          ),
        ),
        workDoneToken: $checkedConvert(
          'workDoneToken',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TInitializeParamsToJson(_TInitializeParams instance) =>
    <String, dynamic>{
      'processId': instance.processId,
      'rootUri': instance.rootUri,
      'capabilities': instance.capabilities,
      'trace': _$TraceValuesEnumMap[instance.trace],
      'initializationOptions': instance.initializationOptions,
      'rootPath': instance.rootPath,
      'locale': instance.locale,
      'clientInfo': instance.clientInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.clientInfo!.name,
              'version': instance.clientInfo!.version,
            },
      'workDoneToken': instance.workDoneToken,
    };

_WorkspaceFoldersInitializeParams _$WorkspaceFoldersInitializeParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceFoldersInitializeParams', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['workspaceFolders']);
  final val = _WorkspaceFoldersInitializeParams(
    workspaceFolders: $checkedConvert(
      'workspaceFolders',
      (v) => v == null
          ? null
          : WorkspaceFoldersInitializeParamsWorkspaceFoldersBase.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceFoldersInitializeParamsToJson(
  _WorkspaceFoldersInitializeParams instance,
) => <String, dynamic>{'workspaceFolders': instance.workspaceFolders};

_ServerCapabilities _$ServerCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ServerCapabilities', json, ($checkedConvert) {
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
      final val = _ServerCapabilities(
        workspaceSymbolProvider: $checkedConvert(
          'workspaceSymbolProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesWorkspaceSymbolProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        documentHighlightProvider: $checkedConvert(
          'documentHighlightProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesDocumentHighlightProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        documentFormattingProvider: $checkedConvert(
          'documentFormattingProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesDocumentFormattingProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        codeActionProvider: $checkedConvert(
          'codeActionProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesCodeActionProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        completionProvider: $checkedConvert(
          'completionProvider',
          (v) => v == null
              ? null
              : CompletionOptions.fromJson(v as Map<String, dynamic>),
        ),
        workspace: $checkedConvert(
          'workspace',
          (v) => _$recordConvertNullable(
            v,
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
        ),
        inlineCompletionProvider: $checkedConvert(
          'inlineCompletionProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesInlineCompletionProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        diagnosticProvider: $checkedConvert(
          'diagnosticProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesDiagnosticProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        inlayHintProvider: $checkedConvert(
          'inlayHintProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesInlayHintProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        definitionProvider: $checkedConvert(
          'definitionProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesDefinitionProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        declarationProvider: $checkedConvert(
          'declarationProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesDeclarationProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        monikerProvider: $checkedConvert(
          'monikerProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesMonikerProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        semanticTokensProvider: $checkedConvert(
          'semanticTokensProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesSemanticTokensProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        linkedEditingRangeProvider: $checkedConvert(
          'linkedEditingRangeProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesLinkedEditingRangeProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        callHierarchyProvider: $checkedConvert(
          'callHierarchyProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesCallHierarchyProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        executeCommandProvider: $checkedConvert(
          'executeCommandProvider',
          (v) => v == null
              ? null
              : ExecuteCommandOptions.fromJson(v as Map<String, dynamic>),
        ),
        textDocumentSync: $checkedConvert(
          'textDocumentSync',
          (v) => v == null
              ? null
              : ServerCapabilitiesTextDocumentSyncBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        foldingRangeProvider: $checkedConvert(
          'foldingRangeProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesFoldingRangeProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        renameProvider: $checkedConvert(
          'renameProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesRenameProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        documentOnTypeFormattingProvider: $checkedConvert(
          'documentOnTypeFormattingProvider',
          (v) => v == null
              ? null
              : DocumentOnTypeFormattingOptions.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        documentRangeFormattingProvider: $checkedConvert(
          'documentRangeFormattingProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesDocumentRangeFormattingProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        experimental: $checkedConvert(
          'experimental',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        selectionRangeProvider: $checkedConvert(
          'selectionRangeProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesSelectionRangeProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        colorProvider: $checkedConvert(
          'colorProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesColorProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        documentLinkProvider: $checkedConvert(
          'documentLinkProvider',
          (v) => v == null
              ? null
              : DocumentLinkOptions.fromJson(v as Map<String, dynamic>),
        ),
        codeLensProvider: $checkedConvert(
          'codeLensProvider',
          (v) => v == null
              ? null
              : CodeLensOptions.fromJson(v as Map<String, dynamic>),
        ),
        notebookDocumentSync: $checkedConvert(
          'notebookDocumentSync',
          (v) => v == null
              ? null
              : ServerCapabilitiesNotebookDocumentSyncBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        documentSymbolProvider: $checkedConvert(
          'documentSymbolProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesDocumentSymbolProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        positionEncoding: $checkedConvert(
          'positionEncoding',
          (v) => $enumDecodeNullable(_$PositionEncodingKindEnumMap, v),
        ),
        referencesProvider: $checkedConvert(
          'referencesProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesReferencesProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        implementationProvider: $checkedConvert(
          'implementationProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesImplementationProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        typeDefinitionProvider: $checkedConvert(
          'typeDefinitionProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesTypeDefinitionProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        inlineValueProvider: $checkedConvert(
          'inlineValueProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesInlineValueProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        typeHierarchyProvider: $checkedConvert(
          'typeHierarchyProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesTypeHierarchyProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        signatureHelpProvider: $checkedConvert(
          'signatureHelpProvider',
          (v) => v == null
              ? null
              : SignatureHelpOptions.fromJson(v as Map<String, dynamic>),
        ),
        hoverProvider: $checkedConvert(
          'hoverProvider',
          (v) => v == null
              ? null
              : ServerCapabilitiesHoverProviderBase.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ServerCapabilitiesToJson(
  _ServerCapabilities instance,
) => <String, dynamic>{
  'workspaceSymbolProvider': instance.workspaceSymbolProvider,
  'documentHighlightProvider': instance.documentHighlightProvider,
  'documentFormattingProvider': instance.documentFormattingProvider,
  'codeActionProvider': instance.codeActionProvider,
  'completionProvider': instance.completionProvider,
  'workspace': instance.workspace == null
      ? null
      : <String, dynamic>{
          'fileOperations': instance.workspace!.fileOperations,
          'workspaceFolders': instance.workspace!.workspaceFolders,
        },
  'inlineCompletionProvider': instance.inlineCompletionProvider,
  'diagnosticProvider': instance.diagnosticProvider,
  'inlayHintProvider': instance.inlayHintProvider,
  'definitionProvider': instance.definitionProvider,
  'declarationProvider': instance.declarationProvider,
  'monikerProvider': instance.monikerProvider,
  'semanticTokensProvider': instance.semanticTokensProvider,
  'linkedEditingRangeProvider': instance.linkedEditingRangeProvider,
  'callHierarchyProvider': instance.callHierarchyProvider,
  'executeCommandProvider': instance.executeCommandProvider,
  'textDocumentSync': instance.textDocumentSync,
  'foldingRangeProvider': instance.foldingRangeProvider,
  'renameProvider': instance.renameProvider,
  'documentOnTypeFormattingProvider': instance.documentOnTypeFormattingProvider,
  'documentRangeFormattingProvider': instance.documentRangeFormattingProvider,
  'experimental': instance.experimental,
  'selectionRangeProvider': instance.selectionRangeProvider,
  'colorProvider': instance.colorProvider,
  'documentLinkProvider': instance.documentLinkProvider,
  'codeLensProvider': instance.codeLensProvider,
  'notebookDocumentSync': instance.notebookDocumentSync,
  'documentSymbolProvider': instance.documentSymbolProvider,
  'positionEncoding': _$PositionEncodingKindEnumMap[instance.positionEncoding],
  'referencesProvider': instance.referencesProvider,
  'implementationProvider': instance.implementationProvider,
  'typeDefinitionProvider': instance.typeDefinitionProvider,
  'inlineValueProvider': instance.inlineValueProvider,
  'typeHierarchyProvider': instance.typeHierarchyProvider,
  'signatureHelpProvider': instance.signatureHelpProvider,
  'hoverProvider': instance.hoverProvider,
};

const _$PositionEncodingKindEnumMap = {
  PositionEncodingKind.uTF8Value: 'uTF8Value',
  PositionEncodingKind.uTF16Value: 'uTF16Value',
  PositionEncodingKind.uTF32Value: 'uTF32Value',
};

_VersionedTextDocumentIdentifier _$VersionedTextDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_VersionedTextDocumentIdentifier', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri', 'version']);
      final val = _VersionedTextDocumentIdentifier(
        uri: $checkedConvert('uri', (v) => v as String),
        version: $checkedConvert('version', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$VersionedTextDocumentIdentifierToJson(
  _VersionedTextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri, 'version': instance.version};

_SaveOptions _$SaveOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SaveOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['includeText']);
      final val = _SaveOptions(
        includeText: $checkedConvert('includeText', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$SaveOptionsToJson(_SaveOptions instance) =>
    <String, dynamic>{'includeText': instance.includeText};

_FileEvent _$FileEventFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FileEvent', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri', 'type']);
      final val = _FileEvent(
        uri: $checkedConvert('uri', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$FileChangeTypeEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FileEventToJson(_FileEvent instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'type': _$FileChangeTypeEnumMap[instance.type]!,
    };

const _$FileChangeTypeEnumMap = {
  FileChangeType.createdValue: 'createdValue',
  FileChangeType.changedValue: 'changedValue',
  FileChangeType.deletedValue: 'deletedValue',
};

_FileSystemWatcher _$FileSystemWatcherFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FileSystemWatcher', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['globPattern', 'kind']);
      final val = _FileSystemWatcher(
        globPattern: $checkedConvert(
          'globPattern',
          (v) => GlobPatternBase.fromJson(v as Map<String, dynamic>),
        ),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$WatchKindEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FileSystemWatcherToJson(_FileSystemWatcher instance) =>
    <String, dynamic>{
      'globPattern': instance.globPattern,
      'kind': _$WatchKindEnumMap[instance.kind],
    };

const _$WatchKindEnumMap = {
  WatchKind.createValue: 'createValue',
  WatchKind.changeValue: 'changeValue',
  WatchKind.deleteValue: 'deleteValue',
};

_Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Diagnostic', json, ($checkedConvert) {
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
      final val = _Diagnostic(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        message: $checkedConvert('message', (v) => v as String),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        relatedInformation: $checkedConvert(
          'relatedInformation',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => DiagnosticRelatedInformation.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DiagnosticTagEnumMap, e))
              .toList(),
        ),
        source: $checkedConvert('source', (v) => v as String?),
        codeDescription: $checkedConvert(
          'codeDescription',
          (v) => v == null
              ? null
              : CodeDescription.fromJson(v as Map<String, dynamic>),
        ),
        code: $checkedConvert(
          'code',
          (v) => v == null
              ? null
              : ProgressTokenBase.fromJson(v as Map<String, dynamic>),
        ),
        severity: $checkedConvert(
          'severity',
          (v) => $enumDecodeNullable(_$DiagnosticSeverityEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DiagnosticToJson(_Diagnostic instance) =>
    <String, dynamic>{
      'range': instance.range,
      'message': instance.message,
      'data': instance.data,
      'relatedInformation': instance.relatedInformation,
      'tags': instance.tags?.map((e) => _$DiagnosticTagEnumMap[e]!).toList(),
      'source': instance.source,
      'codeDescription': instance.codeDescription,
      'code': instance.code,
      'severity': _$DiagnosticSeverityEnumMap[instance.severity],
    };

const _$DiagnosticTagEnumMap = {
  DiagnosticTag.unnecessaryValue: 'unnecessaryValue',
  DiagnosticTag.deprecatedValue: 'deprecatedValue',
};

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.errorValue: 'errorValue',
  DiagnosticSeverity.warningValue: 'warningValue',
  DiagnosticSeverity.informationValue: 'informationValue',
  DiagnosticSeverity.hintValue: 'hintValue',
};

_CompletionContext _$CompletionContextFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CompletionContext', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['triggerKind', 'triggerCharacter']);
      final val = _CompletionContext(
        triggerKind: $checkedConvert(
          'triggerKind',
          (v) => $enumDecode(_$CompletionTriggerKindEnumMap, v),
        ),
        triggerCharacter: $checkedConvert(
          'triggerCharacter',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$CompletionContextToJson(_CompletionContext instance) =>
    <String, dynamic>{
      'triggerKind': _$CompletionTriggerKindEnumMap[instance.triggerKind]!,
      'triggerCharacter': instance.triggerCharacter,
    };

const _$CompletionTriggerKindEnumMap = {
  CompletionTriggerKind.invokedValue: 'invokedValue',
  CompletionTriggerKind.triggerCharacterValue: 'triggerCharacterValue',
  CompletionTriggerKind.triggerForIncompleteCompletionsValue:
      'triggerForIncompleteCompletionsValue',
};

_CompletionItemLabelDetails _$CompletionItemLabelDetailsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CompletionItemLabelDetails', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['description', 'detail']);
  final val = _CompletionItemLabelDetails(
    description: $checkedConvert('description', (v) => v as String?),
    detail: $checkedConvert('detail', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$CompletionItemLabelDetailsToJson(
  _CompletionItemLabelDetails instance,
) => <String, dynamic>{
  'description': instance.description,
  'detail': instance.detail,
};

_InsertReplaceEdit _$InsertReplaceEditFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InsertReplaceEdit', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['newText', 'insert', 'replace']);
      final val = _InsertReplaceEdit(
        newText: $checkedConvert('newText', (v) => v as String),
        insert: $checkedConvert(
          'insert',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        replace: $checkedConvert(
          'replace',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InsertReplaceEditToJson(_InsertReplaceEdit instance) =>
    <String, dynamic>{
      'newText': instance.newText,
      'insert': instance.insert,
      'replace': instance.replace,
    };

_CompletionOptions _$CompletionOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CompletionOptions', json, ($checkedConvert) {
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
  final val = _CompletionOptions(
    completionItem: $checkedConvert(
      'completionItem',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) =>
            (labelDetailsSupport: $jsonValue['labelDetailsSupport'] as bool?),
      ),
    ),
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    allCommitCharacters: $checkedConvert(
      'allCommitCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    triggerCharacters: $checkedConvert(
      'triggerCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$CompletionOptionsToJson(
  _CompletionOptions instance,
) => <String, dynamic>{
  'completionItem': instance.completionItem == null
      ? null
      : <String, dynamic>{
          'labelDetailsSupport': instance.completionItem!.labelDetailsSupport,
        },
  'resolveProvider': instance.resolveProvider,
  'allCommitCharacters': instance.allCommitCharacters,
  'triggerCharacters': instance.triggerCharacters,
  'workDoneProgress': instance.workDoneProgress,
};

_HoverOptions _$HoverOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HoverOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['workDoneProgress']);
      final val = _HoverOptions(
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$HoverOptionsToJson(_HoverOptions instance) =>
    <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_SignatureHelpContext _$SignatureHelpContextFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SignatureHelpContext', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'triggerKind',
      'isRetrigger',
      'activeSignatureHelp',
      'triggerCharacter',
    ],
  );
  final val = _SignatureHelpContext(
    triggerKind: $checkedConvert(
      'triggerKind',
      (v) => $enumDecode(_$SignatureHelpTriggerKindEnumMap, v),
    ),
    isRetrigger: $checkedConvert('isRetrigger', (v) => v as bool),
    activeSignatureHelp: $checkedConvert(
      'activeSignatureHelp',
      (v) =>
          v == null ? null : SignatureHelp.fromJson(v as Map<String, dynamic>),
    ),
    triggerCharacter: $checkedConvert('triggerCharacter', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SignatureHelpContextToJson(
  _SignatureHelpContext instance,
) => <String, dynamic>{
  'triggerKind': _$SignatureHelpTriggerKindEnumMap[instance.triggerKind]!,
  'isRetrigger': instance.isRetrigger,
  'activeSignatureHelp': instance.activeSignatureHelp,
  'triggerCharacter': instance.triggerCharacter,
};

const _$SignatureHelpTriggerKindEnumMap = {
  SignatureHelpTriggerKind.invokedValue: 'invokedValue',
  SignatureHelpTriggerKind.triggerCharacterValue: 'triggerCharacterValue',
  SignatureHelpTriggerKind.contentChangeValue: 'contentChangeValue',
};

_SignatureInformation _$SignatureInformationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SignatureInformation', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'label',
      'activeParameter',
      'parameters',
      'documentation',
    ],
  );
  final val = _SignatureInformation(
    label: $checkedConvert('label', (v) => v as String),
    activeParameter: $checkedConvert(
      'activeParameter',
      (v) => (v as num?)?.toInt(),
    ),
    parameters: $checkedConvert(
      'parameters',
      (v) => (v as List<dynamic>?)
          ?.map((e) => ParameterInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    documentation: $checkedConvert(
      'documentation',
      (v) => v == null
          ? null
          : TooltipOrDocumentationBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SignatureInformationToJson(
  _SignatureInformation instance,
) => <String, dynamic>{
  'label': instance.label,
  'activeParameter': instance.activeParameter,
  'parameters': instance.parameters,
  'documentation': instance.documentation,
};

_SignatureHelpOptions _$SignatureHelpOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SignatureHelpOptions', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'retriggerCharacters',
      'triggerCharacters',
      'workDoneProgress',
    ],
  );
  final val = _SignatureHelpOptions(
    retriggerCharacters: $checkedConvert(
      'retriggerCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    triggerCharacters: $checkedConvert(
      'triggerCharacters',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SignatureHelpOptionsToJson(
  _SignatureHelpOptions instance,
) => <String, dynamic>{
  'retriggerCharacters': instance.retriggerCharacters,
  'triggerCharacters': instance.triggerCharacters,
  'workDoneProgress': instance.workDoneProgress,
};

_DefinitionOptions _$DefinitionOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DefinitionOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['workDoneProgress']);
      final val = _DefinitionOptions(
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DefinitionOptionsToJson(_DefinitionOptions instance) =>
    <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_ReferenceContext _$ReferenceContextFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ReferenceContext', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['includeDeclaration']);
      final val = _ReferenceContext(
        includeDeclaration: $checkedConvert(
          'includeDeclaration',
          (v) => v as bool,
        ),
      );
      return val;
    });

Map<String, dynamic> _$ReferenceContextToJson(_ReferenceContext instance) =>
    <String, dynamic>{'includeDeclaration': instance.includeDeclaration};

_ReferenceOptions _$ReferenceOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ReferenceOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['workDoneProgress']);
      final val = _ReferenceOptions(
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$ReferenceOptionsToJson(_ReferenceOptions instance) =>
    <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_DocumentHighlightOptions _$DocumentHighlightOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentHighlightOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _DocumentHighlightOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentHighlightOptionsToJson(
  _DocumentHighlightOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_BaseSymbolInformation _$BaseSymbolInformationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BaseSymbolInformation', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'kind', 'containerName', 'tags'],
  );
  final val = _BaseSymbolInformation(
    name: $checkedConvert('name', (v) => v as String),
    kind: $checkedConvert('kind', (v) => $enumDecode(_$SymbolKindEnumMap, v)),
    containerName: $checkedConvert('containerName', (v) => v as String?),
    tags: $checkedConvert(
      'tags',
      (v) => (v as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$BaseSymbolInformationToJson(
  _BaseSymbolInformation instance,
) => <String, dynamic>{
  'name': instance.name,
  'kind': _$SymbolKindEnumMap[instance.kind]!,
  'containerName': instance.containerName,
  'tags': instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
};

_DocumentSymbolOptions _$DocumentSymbolOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentSymbolOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['label', 'workDoneProgress']);
  final val = _DocumentSymbolOptions(
    label: $checkedConvert('label', (v) => v as String?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentSymbolOptionsToJson(
  _DocumentSymbolOptions instance,
) => <String, dynamic>{
  'label': instance.label,
  'workDoneProgress': instance.workDoneProgress,
};

_CodeActionContext _$CodeActionContextFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeActionContext', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['diagnostics', 'triggerKind', 'only'],
      );
      final val = _CodeActionContext(
        diagnostics: $checkedConvert(
          'diagnostics',
          (v) => (v as List<dynamic>)
              .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        triggerKind: $checkedConvert(
          'triggerKind',
          (v) => $enumDecodeNullable(_$CodeActionTriggerKindEnumMap, v),
        ),
        only: $checkedConvert(
          'only',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$CodeActionKindEnumMap, e))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CodeActionContextToJson(_CodeActionContext instance) =>
    <String, dynamic>{
      'diagnostics': instance.diagnostics,
      'triggerKind': _$CodeActionTriggerKindEnumMap[instance.triggerKind],
      'only': instance.only?.map((e) => _$CodeActionKindEnumMap[e]!).toList(),
    };

const _$CodeActionTriggerKindEnumMap = {
  CodeActionTriggerKind.invokedValue: 'invokedValue',
  CodeActionTriggerKind.automaticValue: 'automaticValue',
};

_CodeActionOptions _$CodeActionOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeActionOptions', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'resolveProvider',
          'codeActionKinds',
          'workDoneProgress',
        ],
      );
      final val = _CodeActionOptions(
        resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
        codeActionKinds: $checkedConvert(
          'codeActionKinds',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$CodeActionKindEnumMap, e))
              .toList(),
        ),
        workDoneProgress: $checkedConvert(
          'workDoneProgress',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$CodeActionOptionsToJson(_CodeActionOptions instance) =>
    <String, dynamic>{
      'resolveProvider': instance.resolveProvider,
      'codeActionKinds': instance.codeActionKinds
          ?.map((e) => _$CodeActionKindEnumMap[e]!)
          .toList(),
      'workDoneProgress': instance.workDoneProgress,
    };

_WorkspaceSymbolOptions _$WorkspaceSymbolOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceSymbolOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  final val = _WorkspaceSymbolOptions(
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceSymbolOptionsToJson(
  _WorkspaceSymbolOptions instance,
) => <String, dynamic>{
  'resolveProvider': instance.resolveProvider,
  'workDoneProgress': instance.workDoneProgress,
};

_CodeLensOptions _$CodeLensOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CodeLensOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  final val = _CodeLensOptions(
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$CodeLensOptionsToJson(_CodeLensOptions instance) =>
    <String, dynamic>{
      'resolveProvider': instance.resolveProvider,
      'workDoneProgress': instance.workDoneProgress,
    };

_DocumentLinkOptions _$DocumentLinkOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentLinkOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['resolveProvider', 'workDoneProgress']);
  final val = _DocumentLinkOptions(
    resolveProvider: $checkedConvert('resolveProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentLinkOptionsToJson(
  _DocumentLinkOptions instance,
) => <String, dynamic>{
  'resolveProvider': instance.resolveProvider,
  'workDoneProgress': instance.workDoneProgress,
};

_FormattingOptions _$FormattingOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FormattingOptions', json, ($checkedConvert) {
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
      final val = _FormattingOptions(
        tabSize: $checkedConvert('tabSize', (v) => (v as num).toInt()),
        insertSpaces: $checkedConvert('insertSpaces', (v) => v as bool),
        trimFinalNewlines: $checkedConvert(
          'trimFinalNewlines',
          (v) => v as bool?,
        ),
        insertFinalNewline: $checkedConvert(
          'insertFinalNewline',
          (v) => v as bool?,
        ),
        trimTrailingWhitespace: $checkedConvert(
          'trimTrailingWhitespace',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$FormattingOptionsToJson(_FormattingOptions instance) =>
    <String, dynamic>{
      'tabSize': instance.tabSize,
      'insertSpaces': instance.insertSpaces,
      'trimFinalNewlines': instance.trimFinalNewlines,
      'insertFinalNewline': instance.insertFinalNewline,
      'trimTrailingWhitespace': instance.trimTrailingWhitespace,
    };

_DocumentFormattingOptions _$DocumentFormattingOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentFormattingOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['workDoneProgress']);
  final val = _DocumentFormattingOptions(
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentFormattingOptionsToJson(
  _DocumentFormattingOptions instance,
) => <String, dynamic>{'workDoneProgress': instance.workDoneProgress};

_DocumentRangeFormattingOptions _$DocumentRangeFormattingOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentRangeFormattingOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['rangesSupport', 'workDoneProgress']);
  final val = _DocumentRangeFormattingOptions(
    rangesSupport: $checkedConvert('rangesSupport', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$DocumentRangeFormattingOptionsToJson(
  _DocumentRangeFormattingOptions instance,
) => <String, dynamic>{
  'rangesSupport': instance.rangesSupport,
  'workDoneProgress': instance.workDoneProgress,
};

_DocumentOnTypeFormattingOptions _$DocumentOnTypeFormattingOptionsFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_DocumentOnTypeFormattingOptions', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['firstTriggerCharacter', 'moreTriggerCharacter'],
      );
      final val = _DocumentOnTypeFormattingOptions(
        firstTriggerCharacter: $checkedConvert(
          'firstTriggerCharacter',
          (v) => v as String,
        ),
        moreTriggerCharacter: $checkedConvert(
          'moreTriggerCharacter',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentOnTypeFormattingOptionsToJson(
  _DocumentOnTypeFormattingOptions instance,
) => <String, dynamic>{
  'firstTriggerCharacter': instance.firstTriggerCharacter,
  'moreTriggerCharacter': instance.moreTriggerCharacter,
};

_RenameOptions _$RenameOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_RenameOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['prepareProvider', 'workDoneProgress']);
  final val = _RenameOptions(
    prepareProvider: $checkedConvert('prepareProvider', (v) => v as bool?),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$RenameOptionsToJson(_RenameOptions instance) =>
    <String, dynamic>{
      'prepareProvider': instance.prepareProvider,
      'workDoneProgress': instance.workDoneProgress,
    };

_ExecuteCommandOptions _$ExecuteCommandOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExecuteCommandOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['commands', 'workDoneProgress']);
  final val = _ExecuteCommandOptions(
    commands: $checkedConvert(
      'commands',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$ExecuteCommandOptionsToJson(
  _ExecuteCommandOptions instance,
) => <String, dynamic>{
  'commands': instance.commands,
  'workDoneProgress': instance.workDoneProgress,
};

_SemanticTokensLegend _$SemanticTokensLegendFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensLegend', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['tokenTypes', 'tokenModifiers']);
  final val = _SemanticTokensLegend(
    tokenTypes: $checkedConvert(
      'tokenTypes',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    tokenModifiers: $checkedConvert(
      'tokenModifiers',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensLegendToJson(
  _SemanticTokensLegend instance,
) => <String, dynamic>{
  'tokenTypes': instance.tokenTypes,
  'tokenModifiers': instance.tokenModifiers,
};

_OptionalVersionedTextDocumentIdentifier
_$OptionalVersionedTextDocumentIdentifierFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OptionalVersionedTextDocumentIdentifier', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['uri', 'version']);
      final val = _OptionalVersionedTextDocumentIdentifier(
        uri: $checkedConvert('uri', (v) => v as String),
        version: $checkedConvert(
          'version',
          (v) => ProcessIdOrVersionBase.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OptionalVersionedTextDocumentIdentifierToJson(
  _OptionalVersionedTextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri, 'version': instance.version};

_AnnotatedTextEdit _$AnnotatedTextEditFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AnnotatedTextEdit', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['range', 'newText', 'annotationId']);
      final val = _AnnotatedTextEdit(
        range: $checkedConvert(
          'range',
          (v) => Range.fromJson(v as Map<String, dynamic>),
        ),
        newText: $checkedConvert('newText', (v) => v as String),
        annotationId: $checkedConvert('annotationId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AnnotatedTextEditToJson(_AnnotatedTextEdit instance) =>
    <String, dynamic>{
      'range': instance.range,
      'newText': instance.newText,
      'annotationId': instance.annotationId,
    };

_ResourceOperation _$ResourceOperationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ResourceOperation', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['kind', 'annotationId']);
      final val = _ResourceOperation(
        kind: $checkedConvert('kind', (v) => v as String),
        annotationId: $checkedConvert('annotationId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ResourceOperationToJson(_ResourceOperation instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'annotationId': instance.annotationId,
    };

_CreateFileOptions _$CreateFileOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CreateFileOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['ignoreIfExists', 'overwrite']);
      final val = _CreateFileOptions(
        ignoreIfExists: $checkedConvert('ignoreIfExists', (v) => v as bool?),
        overwrite: $checkedConvert('overwrite', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$CreateFileOptionsToJson(_CreateFileOptions instance) =>
    <String, dynamic>{
      'ignoreIfExists': instance.ignoreIfExists,
      'overwrite': instance.overwrite,
    };

_RenameFileOptions _$RenameFileOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RenameFileOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['ignoreIfExists', 'overwrite']);
      final val = _RenameFileOptions(
        ignoreIfExists: $checkedConvert('ignoreIfExists', (v) => v as bool?),
        overwrite: $checkedConvert('overwrite', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$RenameFileOptionsToJson(_RenameFileOptions instance) =>
    <String, dynamic>{
      'ignoreIfExists': instance.ignoreIfExists,
      'overwrite': instance.overwrite,
    };

_DeleteFileOptions _$DeleteFileOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DeleteFileOptions', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['ignoreIfNotExists', 'recursive']);
      final val = _DeleteFileOptions(
        ignoreIfNotExists: $checkedConvert(
          'ignoreIfNotExists',
          (v) => v as bool?,
        ),
        recursive: $checkedConvert('recursive', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$DeleteFileOptionsToJson(_DeleteFileOptions instance) =>
    <String, dynamic>{
      'ignoreIfNotExists': instance.ignoreIfNotExists,
      'recursive': instance.recursive,
    };

_FileOperationPattern _$FileOperationPatternFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FileOperationPattern', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['glob', 'options', 'matches']);
  final val = _FileOperationPattern(
    glob: $checkedConvert('glob', (v) => v as String),
    options: $checkedConvert(
      'options',
      (v) => v == null
          ? null
          : FileOperationPatternOptions.fromJson(v as Map<String, dynamic>),
    ),
    matches: $checkedConvert(
      'matches',
      (v) => $enumDecodeNullable(_$FileOperationPatternKindEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$FileOperationPatternToJson(
  _FileOperationPattern instance,
) => <String, dynamic>{
  'glob': instance.glob,
  'options': instance.options,
  'matches': _$FileOperationPatternKindEnumMap[instance.matches],
};

const _$FileOperationPatternKindEnumMap = {
  FileOperationPatternKind.fileValue: 'fileValue',
  FileOperationPatternKind.folderValue: 'folderValue',
};

_WorkspaceFullDocumentDiagnosticReport
_$WorkspaceFullDocumentDiagnosticReportFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WorkspaceFullDocumentDiagnosticReport', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const ['kind', 'items', 'uri', 'version', 'resultId'],
      );
      final val = _WorkspaceFullDocumentDiagnosticReport(
        kind: $checkedConvert('kind', (v) => v as String),
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        uri: $checkedConvert('uri', (v) => v as String),
        version: $checkedConvert(
          'version',
          (v) => ProcessIdOrVersionBase.fromJson(v as Map<String, dynamic>),
        ),
        resultId: $checkedConvert('resultId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$WorkspaceFullDocumentDiagnosticReportToJson(
  _WorkspaceFullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'items': instance.items,
  'uri': instance.uri,
  'version': instance.version,
  'resultId': instance.resultId,
};

_WorkspaceUnchangedDocumentDiagnosticReport
_$WorkspaceUnchangedDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceUnchangedDocumentDiagnosticReport', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['kind', 'resultId', 'uri', 'version']);
  final val = _WorkspaceUnchangedDocumentDiagnosticReport(
    kind: $checkedConvert('kind', (v) => v as String),
    resultId: $checkedConvert('resultId', (v) => v as String),
    uri: $checkedConvert('uri', (v) => v as String),
    version: $checkedConvert(
      'version',
      (v) => ProcessIdOrVersionBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceUnchangedDocumentDiagnosticReportToJson(
  _WorkspaceUnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': instance.resultId,
  'uri': instance.uri,
  'version': instance.version,
};

_NotebookCell _$NotebookCellFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NotebookCell', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['kind', 'document', 'executionSummary', 'metadata'],
      );
      final val = _NotebookCell(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$NotebookCellKindEnumMap, v),
        ),
        document: $checkedConvert('document', (v) => v as String),
        executionSummary: $checkedConvert(
          'executionSummary',
          (v) => v == null
              ? null
              : ExecutionSummary.fromJson(v as Map<String, dynamic>),
        ),
        metadata: $checkedConvert(
          'metadata',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, LSPAnyBase.fromJson(e as Map<String, dynamic>)),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NotebookCellToJson(_NotebookCell instance) =>
    <String, dynamic>{
      'kind': _$NotebookCellKindEnumMap[instance.kind]!,
      'document': instance.document,
      'executionSummary': instance.executionSummary,
      'metadata': instance.metadata,
    };

const _$NotebookCellKindEnumMap = {
  NotebookCellKind.markupValue: 'markupValue',
  NotebookCellKind.codeValue: 'codeValue',
};

_NotebookCellArrayChange _$NotebookCellArrayChangeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_NotebookCellArrayChange', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['start', 'deleteCount', 'cells']);
  final val = _NotebookCellArrayChange(
    start: $checkedConvert('start', (v) => (v as num).toInt()),
    deleteCount: $checkedConvert('deleteCount', (v) => (v as num).toInt()),
    cells: $checkedConvert(
      'cells',
      (v) => (v as List<dynamic>?)
          ?.map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$NotebookCellArrayChangeToJson(
  _NotebookCellArrayChange instance,
) => <String, dynamic>{
  'start': instance.start,
  'deleteCount': instance.deleteCount,
  'cells': instance.cells,
};

_SelectedCompletionInfo _$SelectedCompletionInfoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SelectedCompletionInfo', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['range', 'text']);
  final val = _SelectedCompletionInfo(
    range: $checkedConvert(
      'range',
      (v) => Range.fromJson(v as Map<String, dynamic>),
    ),
    text: $checkedConvert('text', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$SelectedCompletionInfoToJson(
  _SelectedCompletionInfo instance,
) => <String, dynamic>{'range': instance.range, 'text': instance.text};

_ClientCapabilities _$ClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ClientCapabilities', json, ($checkedConvert) {
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
      final val = _ClientCapabilities(
        experimental: $checkedConvert(
          'experimental',
          (v) =>
              v == null ? null : LSPAnyBase.fromJson(v as Map<String, dynamic>),
        ),
        general: $checkedConvert(
          'general',
          (v) => v == null
              ? null
              : GeneralClientCapabilities.fromJson(v as Map<String, dynamic>),
        ),
        window: $checkedConvert(
          'window',
          (v) => v == null
              ? null
              : WindowClientCapabilities.fromJson(v as Map<String, dynamic>),
        ),
        notebookDocument: $checkedConvert(
          'notebookDocument',
          (v) => v == null
              ? null
              : NotebookDocumentClientCapabilities.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        textDocument: $checkedConvert(
          'textDocument',
          (v) => v == null
              ? null
              : TextDocumentClientCapabilities.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        workspace: $checkedConvert(
          'workspace',
          (v) => v == null
              ? null
              : WorkspaceClientCapabilities.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClientCapabilitiesToJson(_ClientCapabilities instance) =>
    <String, dynamic>{
      'experimental': instance.experimental,
      'general': instance.general,
      'window': instance.window,
      'notebookDocument': instance.notebookDocument,
      'textDocument': instance.textDocument,
      'workspace': instance.workspace,
    };

_TextDocumentSyncOptions _$TextDocumentSyncOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TextDocumentSyncOptions', json, ($checkedConvert) {
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
  final val = _TextDocumentSyncOptions(
    save: $checkedConvert(
      'save',
      (v) => v == null
          ? null
          : TextDocumentSyncOptionsSaveBase.fromJson(v as Map<String, dynamic>),
    ),
    willSaveWaitUntil: $checkedConvert('willSaveWaitUntil', (v) => v as bool?),
    willSave: $checkedConvert('willSave', (v) => v as bool?),
    change: $checkedConvert(
      'change',
      (v) => $enumDecodeNullable(_$TextDocumentSyncKindEnumMap, v),
    ),
    openClose: $checkedConvert('openClose', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$TextDocumentSyncOptionsToJson(
  _TextDocumentSyncOptions instance,
) => <String, dynamic>{
  'save': instance.save,
  'willSaveWaitUntil': instance.willSaveWaitUntil,
  'willSave': instance.willSave,
  'change': _$TextDocumentSyncKindEnumMap[instance.change],
  'openClose': instance.openClose,
};

_NotebookDocumentSyncOptions _$NotebookDocumentSyncOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_NotebookDocumentSyncOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['notebookSelector', 'save']);
  final val = _NotebookDocumentSyncOptions(
    notebookSelector: $checkedConvert(
      'notebookSelector',
      (v) => (v as List<dynamic>)
          .map(
            (e) => NotebookDocumentSyncOptionsNotebookSelectorBase.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    save: $checkedConvert('save', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$NotebookDocumentSyncOptionsToJson(
  _NotebookDocumentSyncOptions instance,
) => <String, dynamic>{
  'notebookSelector': instance.notebookSelector,
  'save': instance.save,
};

_NotebookDocumentSyncRegistrationOptions
_$NotebookDocumentSyncRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NotebookDocumentSyncRegistrationOptions', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['notebookSelector', 'id', 'save']);
      final val = _NotebookDocumentSyncRegistrationOptions(
        notebookSelector: $checkedConvert(
          'notebookSelector',
          (v) => (v as List<dynamic>)
              .map(
                (e) => NotebookDocumentSyncOptionsNotebookSelectorBase.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
        id: $checkedConvert('id', (v) => v as String?),
        save: $checkedConvert('save', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$NotebookDocumentSyncRegistrationOptionsToJson(
  _NotebookDocumentSyncRegistrationOptions instance,
) => <String, dynamic>{
  'notebookSelector': instance.notebookSelector,
  'id': instance.id,
  'save': instance.save,
};

_WorkspaceFoldersServerCapabilities
_$WorkspaceFoldersServerCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceFoldersServerCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['changeNotifications', 'supported']);
  final val = _WorkspaceFoldersServerCapabilities(
    changeNotifications: $checkedConvert(
      'changeNotifications',
      (v) => v == null
          ? null
          : WorkspaceFoldersServerCapabilitiesChangeNotificationsBase.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    supported: $checkedConvert('supported', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceFoldersServerCapabilitiesToJson(
  _WorkspaceFoldersServerCapabilities instance,
) => <String, dynamic>{
  'changeNotifications': instance.changeNotifications,
  'supported': instance.supported,
};

_FileOperationOptions _$FileOperationOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FileOperationOptions', json, ($checkedConvert) {
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
  final val = _FileOperationOptions(
    willDelete: $checkedConvert(
      'willDelete',
      (v) => v == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    didDelete: $checkedConvert(
      'didDelete',
      (v) => v == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    willRename: $checkedConvert(
      'willRename',
      (v) => v == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    didRename: $checkedConvert(
      'didRename',
      (v) => v == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    willCreate: $checkedConvert(
      'willCreate',
      (v) => v == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    didCreate: $checkedConvert(
      'didCreate',
      (v) => v == null
          ? null
          : FileOperationRegistrationOptions.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$FileOperationOptionsToJson(
  _FileOperationOptions instance,
) => <String, dynamic>{
  'willDelete': instance.willDelete,
  'didDelete': instance.didDelete,
  'willRename': instance.willRename,
  'didRename': instance.didRename,
  'willCreate': instance.willCreate,
  'didCreate': instance.didCreate,
};

_CodeDescription _$CodeDescriptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeDescription', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['href']);
      final val = _CodeDescription(
        href: $checkedConvert('href', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CodeDescriptionToJson(_CodeDescription instance) =>
    <String, dynamic>{'href': instance.href};

_DiagnosticRelatedInformation _$DiagnosticRelatedInformationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DiagnosticRelatedInformation', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['location', 'message']);
  final val = _DiagnosticRelatedInformation(
    location: $checkedConvert(
      'location',
      (v) => Location.fromJson(v as Map<String, dynamic>),
    ),
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$DiagnosticRelatedInformationToJson(
  _DiagnosticRelatedInformation instance,
) => <String, dynamic>{
  'location': instance.location,
  'message': instance.message,
};

_ParameterInformation _$ParameterInformationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ParameterInformation', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['label', 'documentation']);
  final val = _ParameterInformation(
    label: $checkedConvert(
      'label',
      (v) => ParameterInformationLabelBase.fromJson(v as Map<String, dynamic>),
    ),
    documentation: $checkedConvert(
      'documentation',
      (v) => v == null
          ? null
          : TooltipOrDocumentationBase.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ParameterInformationToJson(
  _ParameterInformation instance,
) => <String, dynamic>{
  'label': instance.label,
  'documentation': instance.documentation,
};

_NotebookCellTextDocumentFilter _$NotebookCellTextDocumentFilterFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_NotebookCellTextDocumentFilter', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['notebook', 'language']);
  final val = _NotebookCellTextDocumentFilter(
    notebook: $checkedConvert(
      'notebook',
      (v) => NotebookCellTextDocumentFilterNotebookBase.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
    language: $checkedConvert('language', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$NotebookCellTextDocumentFilterToJson(
  _NotebookCellTextDocumentFilter instance,
) => <String, dynamic>{
  'notebook': instance.notebook,
  'language': instance.language,
};

_FileOperationPatternOptions _$FileOperationPatternOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FileOperationPatternOptions', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['ignoreCase']);
  final val = _FileOperationPatternOptions(
    ignoreCase: $checkedConvert('ignoreCase', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$FileOperationPatternOptionsToJson(
  _FileOperationPatternOptions instance,
) => <String, dynamic>{'ignoreCase': instance.ignoreCase};

_ExecutionSummary _$ExecutionSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ExecutionSummary', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['executionOrder', 'success']);
      final val = _ExecutionSummary(
        executionOrder: $checkedConvert(
          'executionOrder',
          (v) => (v as num).toInt(),
        ),
        success: $checkedConvert('success', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$ExecutionSummaryToJson(_ExecutionSummary instance) =>
    <String, dynamic>{
      'executionOrder': instance.executionOrder,
      'success': instance.success,
    };

_WorkspaceClientCapabilities _$WorkspaceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceClientCapabilities', json, ($checkedConvert) {
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
  final val = _WorkspaceClientCapabilities(
    foldingRange: $checkedConvert(
      'foldingRange',
      (v) => v == null
          ? null
          : FoldingRangeWorkspaceClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    diagnostics: $checkedConvert(
      'diagnostics',
      (v) => v == null
          ? null
          : DiagnosticWorkspaceClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    inlayHint: $checkedConvert(
      'inlayHint',
      (v) => v == null
          ? null
          : InlayHintWorkspaceClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    inlineValue: $checkedConvert(
      'inlineValue',
      (v) => v == null
          ? null
          : InlineValueWorkspaceClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    fileOperations: $checkedConvert(
      'fileOperations',
      (v) => v == null
          ? null
          : FileOperationClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    codeLens: $checkedConvert(
      'codeLens',
      (v) => v == null
          ? null
          : CodeLensWorkspaceClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    semanticTokens: $checkedConvert(
      'semanticTokens',
      (v) => v == null
          ? null
          : SemanticTokensWorkspaceClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    configuration: $checkedConvert('configuration', (v) => v as bool?),
    workspaceFolders: $checkedConvert('workspaceFolders', (v) => v as bool?),
    executeCommand: $checkedConvert(
      'executeCommand',
      (v) => v == null
          ? null
          : ExecuteCommandClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    symbol: $checkedConvert(
      'symbol',
      (v) => v == null
          ? null
          : WorkspaceSymbolClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    didChangeWatchedFiles: $checkedConvert(
      'didChangeWatchedFiles',
      (v) => v == null
          ? null
          : DidChangeWatchedFilesClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    didChangeConfiguration: $checkedConvert(
      'didChangeConfiguration',
      (v) => v == null
          ? null
          : DidChangeConfigurationClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    workspaceEdit: $checkedConvert(
      'workspaceEdit',
      (v) => v == null
          ? null
          : WorkspaceEditClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    applyEdit: $checkedConvert('applyEdit', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceClientCapabilitiesToJson(
  _WorkspaceClientCapabilities instance,
) => <String, dynamic>{
  'foldingRange': instance.foldingRange,
  'diagnostics': instance.diagnostics,
  'inlayHint': instance.inlayHint,
  'inlineValue': instance.inlineValue,
  'fileOperations': instance.fileOperations,
  'codeLens': instance.codeLens,
  'semanticTokens': instance.semanticTokens,
  'configuration': instance.configuration,
  'workspaceFolders': instance.workspaceFolders,
  'executeCommand': instance.executeCommand,
  'symbol': instance.symbol,
  'didChangeWatchedFiles': instance.didChangeWatchedFiles,
  'didChangeConfiguration': instance.didChangeConfiguration,
  'workspaceEdit': instance.workspaceEdit,
  'applyEdit': instance.applyEdit,
};

_TextDocumentClientCapabilities _$TextDocumentClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TextDocumentClientCapabilities', json, ($checkedConvert) {
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
  final val = _TextDocumentClientCapabilities(
    inlineCompletion: $checkedConvert(
      'inlineCompletion',
      (v) => v == null
          ? null
          : InlineCompletionClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    diagnostic: $checkedConvert(
      'diagnostic',
      (v) => v == null
          ? null
          : DiagnosticClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    inlayHint: $checkedConvert(
      'inlayHint',
      (v) => v == null
          ? null
          : InlayHintClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    inlineValue: $checkedConvert(
      'inlineValue',
      (v) => v == null
          ? null
          : InlineValueClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    typeHierarchy: $checkedConvert(
      'typeHierarchy',
      (v) => v == null
          ? null
          : TypeHierarchyClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    moniker: $checkedConvert(
      'moniker',
      (v) => v == null
          ? null
          : MonikerClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    linkedEditingRange: $checkedConvert(
      'linkedEditingRange',
      (v) => v == null
          ? null
          : LinkedEditingRangeClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    semanticTokens: $checkedConvert(
      'semanticTokens',
      (v) => v == null
          ? null
          : SemanticTokensClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    callHierarchy: $checkedConvert(
      'callHierarchy',
      (v) => v == null
          ? null
          : CallHierarchyClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    publishDiagnostics: $checkedConvert(
      'publishDiagnostics',
      (v) => v == null
          ? null
          : PublishDiagnosticsClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    selectionRange: $checkedConvert(
      'selectionRange',
      (v) => v == null
          ? null
          : SelectionRangeClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    foldingRange: $checkedConvert(
      'foldingRange',
      (v) => v == null
          ? null
          : FoldingRangeClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    rename: $checkedConvert(
      'rename',
      (v) => v == null
          ? null
          : RenameClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    onTypeFormatting: $checkedConvert(
      'onTypeFormatting',
      (v) => v == null
          ? null
          : DocumentOnTypeFormattingClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    rangeFormatting: $checkedConvert(
      'rangeFormatting',
      (v) => v == null
          ? null
          : DocumentRangeFormattingClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    formatting: $checkedConvert(
      'formatting',
      (v) => v == null
          ? null
          : DocumentFormattingClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    colorProvider: $checkedConvert(
      'colorProvider',
      (v) => v == null
          ? null
          : DocumentColorClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    documentLink: $checkedConvert(
      'documentLink',
      (v) => v == null
          ? null
          : DocumentLinkClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    codeLens: $checkedConvert(
      'codeLens',
      (v) => v == null
          ? null
          : CodeLensClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    codeAction: $checkedConvert(
      'codeAction',
      (v) => v == null
          ? null
          : CodeActionClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    documentSymbol: $checkedConvert(
      'documentSymbol',
      (v) => v == null
          ? null
          : DocumentSymbolClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    documentHighlight: $checkedConvert(
      'documentHighlight',
      (v) => v == null
          ? null
          : DocumentHighlightClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    references: $checkedConvert(
      'references',
      (v) => v == null
          ? null
          : ReferenceClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    implementation: $checkedConvert(
      'implementation',
      (v) => v == null
          ? null
          : ImplementationClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    typeDefinition: $checkedConvert(
      'typeDefinition',
      (v) => v == null
          ? null
          : TypeDefinitionClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    definition: $checkedConvert(
      'definition',
      (v) => v == null
          ? null
          : DefinitionClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    declaration: $checkedConvert(
      'declaration',
      (v) => v == null
          ? null
          : DeclarationClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    signatureHelp: $checkedConvert(
      'signatureHelp',
      (v) => v == null
          ? null
          : SignatureHelpClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    hover: $checkedConvert(
      'hover',
      (v) => v == null
          ? null
          : HoverClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    completion: $checkedConvert(
      'completion',
      (v) => v == null
          ? null
          : CompletionClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    synchronization: $checkedConvert(
      'synchronization',
      (v) => v == null
          ? null
          : TextDocumentSyncClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$TextDocumentClientCapabilitiesToJson(
  _TextDocumentClientCapabilities instance,
) => <String, dynamic>{
  'inlineCompletion': instance.inlineCompletion,
  'diagnostic': instance.diagnostic,
  'inlayHint': instance.inlayHint,
  'inlineValue': instance.inlineValue,
  'typeHierarchy': instance.typeHierarchy,
  'moniker': instance.moniker,
  'linkedEditingRange': instance.linkedEditingRange,
  'semanticTokens': instance.semanticTokens,
  'callHierarchy': instance.callHierarchy,
  'publishDiagnostics': instance.publishDiagnostics,
  'selectionRange': instance.selectionRange,
  'foldingRange': instance.foldingRange,
  'rename': instance.rename,
  'onTypeFormatting': instance.onTypeFormatting,
  'rangeFormatting': instance.rangeFormatting,
  'formatting': instance.formatting,
  'colorProvider': instance.colorProvider,
  'documentLink': instance.documentLink,
  'codeLens': instance.codeLens,
  'codeAction': instance.codeAction,
  'documentSymbol': instance.documentSymbol,
  'documentHighlight': instance.documentHighlight,
  'references': instance.references,
  'implementation': instance.implementation,
  'typeDefinition': instance.typeDefinition,
  'definition': instance.definition,
  'declaration': instance.declaration,
  'signatureHelp': instance.signatureHelp,
  'hover': instance.hover,
  'completion': instance.completion,
  'synchronization': instance.synchronization,
};

_NotebookDocumentClientCapabilities
_$NotebookDocumentClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NotebookDocumentClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['synchronization']);
      final val = _NotebookDocumentClientCapabilities(
        synchronization: $checkedConvert(
          'synchronization',
          (v) => NotebookDocumentSyncClientCapabilities.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NotebookDocumentClientCapabilitiesToJson(
  _NotebookDocumentClientCapabilities instance,
) => <String, dynamic>{'synchronization': instance.synchronization};

_WindowClientCapabilities _$WindowClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WindowClientCapabilities', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['showDocument', 'showMessage', 'workDoneProgress'],
  );
  final val = _WindowClientCapabilities(
    showDocument: $checkedConvert(
      'showDocument',
      (v) => v == null
          ? null
          : ShowDocumentClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    showMessage: $checkedConvert(
      'showMessage',
      (v) => v == null
          ? null
          : ShowMessageRequestClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    workDoneProgress: $checkedConvert('workDoneProgress', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$WindowClientCapabilitiesToJson(
  _WindowClientCapabilities instance,
) => <String, dynamic>{
  'showDocument': instance.showDocument,
  'showMessage': instance.showMessage,
  'workDoneProgress': instance.workDoneProgress,
};

_GeneralClientCapabilities _$GeneralClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_GeneralClientCapabilities', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'positionEncodings',
      'markdown',
      'regularExpressions',
      'staleRequestSupport',
    ],
  );
  final val = _GeneralClientCapabilities(
    positionEncodings: $checkedConvert(
      'positionEncodings',
      (v) => (v as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PositionEncodingKindEnumMap, e))
          .toList(),
    ),
    markdown: $checkedConvert(
      'markdown',
      (v) => v == null
          ? null
          : MarkdownClientCapabilities.fromJson(v as Map<String, dynamic>),
    ),
    regularExpressions: $checkedConvert(
      'regularExpressions',
      (v) => v == null
          ? null
          : RegularExpressionsClientCapabilities.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    staleRequestSupport: $checkedConvert(
      'staleRequestSupport',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          cancel: $jsonValue['cancel'] as bool,
          retryOnContentModified:
              ($jsonValue['retryOnContentModified'] as List<dynamic>)
                  .map((e) => e as String)
                  .toList(),
        ),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$GeneralClientCapabilitiesToJson(
  _GeneralClientCapabilities instance,
) => <String, dynamic>{
  'positionEncodings': instance.positionEncodings
      ?.map((e) => _$PositionEncodingKindEnumMap[e]!)
      .toList(),
  'markdown': instance.markdown,
  'regularExpressions': instance.regularExpressions,
  'staleRequestSupport': instance.staleRequestSupport == null
      ? null
      : <String, dynamic>{
          'cancel': instance.staleRequestSupport!.cancel,
          'retryOnContentModified':
              instance.staleRequestSupport!.retryOnContentModified,
        },
};

_RelativePattern _$RelativePatternFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RelativePattern', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['baseUri', 'pattern']);
      final val = _RelativePattern(
        baseUri: $checkedConvert(
          'baseUri',
          (v) => RelativePatternBaseUriBase.fromJson(v as Map<String, dynamic>),
        ),
        pattern: $checkedConvert('pattern', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$RelativePatternToJson(_RelativePattern instance) =>
    <String, dynamic>{'baseUri': instance.baseUri, 'pattern': instance.pattern};

_WorkspaceEditClientCapabilities _$WorkspaceEditClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_WorkspaceEditClientCapabilities', json, ($checkedConvert) {
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
      final val = _WorkspaceEditClientCapabilities(
        changeAnnotationSupport: $checkedConvert(
          'changeAnnotationSupport',
          (v) => _$recordConvertNullable(
            v,
            ($jsonValue) =>
                (groupsOnLabel: $jsonValue['groupsOnLabel'] as bool?),
          ),
        ),
        normalizesLineEndings: $checkedConvert(
          'normalizesLineEndings',
          (v) => v as bool?,
        ),
        failureHandling: $checkedConvert(
          'failureHandling',
          (v) => $enumDecodeNullable(_$FailureHandlingKindEnumMap, v),
        ),
        resourceOperations: $checkedConvert(
          'resourceOperations',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ResourceOperationKindEnumMap, e))
              .toList(),
        ),
        documentChanges: $checkedConvert('documentChanges', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$WorkspaceEditClientCapabilitiesToJson(
  _WorkspaceEditClientCapabilities instance,
) => <String, dynamic>{
  'changeAnnotationSupport': instance.changeAnnotationSupport == null
      ? null
      : <String, dynamic>{
          'groupsOnLabel': instance.changeAnnotationSupport!.groupsOnLabel,
        },
  'normalizesLineEndings': instance.normalizesLineEndings,
  'failureHandling': _$FailureHandlingKindEnumMap[instance.failureHandling],
  'resourceOperations': instance.resourceOperations
      ?.map((e) => _$ResourceOperationKindEnumMap[e]!)
      .toList(),
  'documentChanges': instance.documentChanges,
};

const _$FailureHandlingKindEnumMap = {
  FailureHandlingKind.abortValue: 'abortValue',
  FailureHandlingKind.transactionalValue: 'transactionalValue',
  FailureHandlingKind.textOnlyTransactionalValue: 'textOnlyTransactionalValue',
  FailureHandlingKind.undoValue: 'undoValue',
};

const _$ResourceOperationKindEnumMap = {
  ResourceOperationKind.createValue: 'createValue',
  ResourceOperationKind.renameValue: 'renameValue',
  ResourceOperationKind.deleteValue: 'deleteValue',
};

_DidChangeConfigurationClientCapabilities
_$DidChangeConfigurationClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DidChangeConfigurationClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _DidChangeConfigurationClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DidChangeConfigurationClientCapabilitiesToJson(
  _DidChangeConfigurationClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_DidChangeWatchedFilesClientCapabilities
_$DidChangeWatchedFilesClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DidChangeWatchedFilesClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const ['relativePatternSupport', 'dynamicRegistration'],
      );
      final val = _DidChangeWatchedFilesClientCapabilities(
        relativePatternSupport: $checkedConvert(
          'relativePatternSupport',
          (v) => v as bool?,
        ),
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DidChangeWatchedFilesClientCapabilitiesToJson(
  _DidChangeWatchedFilesClientCapabilities instance,
) => <String, dynamic>{
  'relativePatternSupport': instance.relativePatternSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_WorkspaceSymbolClientCapabilities _$WorkspaceSymbolClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WorkspaceSymbolClientCapabilities', json, (
  $checkedConvert,
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
  final val = _WorkspaceSymbolClientCapabilities(
    resolveSupport: $checkedConvert(
      'resolveSupport',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          properties: ($jsonValue['properties'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        ),
      ),
    ),
    tagSupport: $checkedConvert(
      'tagSupport',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>)
              .map((e) => $enumDecode(_$SymbolTagEnumMap, e))
              .toList(),
        ),
      ),
    ),
    symbolKind: $checkedConvert(
      'symbolKind',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SymbolKindEnumMap, e))
              .toList(),
        ),
      ),
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$WorkspaceSymbolClientCapabilitiesToJson(
  _WorkspaceSymbolClientCapabilities instance,
) => <String, dynamic>{
  'resolveSupport': instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
  'tagSupport': instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$SymbolTagEnumMap[e]!)
              .toList(),
        },
  'symbolKind': instance.symbolKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.symbolKind!.valueSet
              ?.map((e) => _$SymbolKindEnumMap[e]!)
              .toList(),
        },
  'dynamicRegistration': instance.dynamicRegistration,
};

_ExecuteCommandClientCapabilities _$ExecuteCommandClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExecuteCommandClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  final val = _ExecuteCommandClientCapabilities(
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$ExecuteCommandClientCapabilitiesToJson(
  _ExecuteCommandClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_SemanticTokensWorkspaceClientCapabilities
_$SemanticTokensWorkspaceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensWorkspaceClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['refreshSupport']);
  final val = _SemanticTokensWorkspaceClientCapabilities(
    refreshSupport: $checkedConvert('refreshSupport', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SemanticTokensWorkspaceClientCapabilitiesToJson(
  _SemanticTokensWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': instance.refreshSupport};

_CodeLensWorkspaceClientCapabilities
_$CodeLensWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CodeLensWorkspaceClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['refreshSupport']);
      final val = _CodeLensWorkspaceClientCapabilities(
        refreshSupport: $checkedConvert('refreshSupport', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$CodeLensWorkspaceClientCapabilitiesToJson(
  _CodeLensWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': instance.refreshSupport};

_FileOperationClientCapabilities _$FileOperationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_FileOperationClientCapabilities', json, ($checkedConvert) {
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
      final val = _FileOperationClientCapabilities(
        willDelete: $checkedConvert('willDelete', (v) => v as bool?),
        didDelete: $checkedConvert('didDelete', (v) => v as bool?),
        willRename: $checkedConvert('willRename', (v) => v as bool?),
        didRename: $checkedConvert('didRename', (v) => v as bool?),
        willCreate: $checkedConvert('willCreate', (v) => v as bool?),
        didCreate: $checkedConvert('didCreate', (v) => v as bool?),
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$FileOperationClientCapabilitiesToJson(
  _FileOperationClientCapabilities instance,
) => <String, dynamic>{
  'willDelete': instance.willDelete,
  'didDelete': instance.didDelete,
  'willRename': instance.willRename,
  'didRename': instance.didRename,
  'willCreate': instance.willCreate,
  'didCreate': instance.didCreate,
  'dynamicRegistration': instance.dynamicRegistration,
};

_InlineValueWorkspaceClientCapabilities
_$InlineValueWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlineValueWorkspaceClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['refreshSupport']);
      final val = _InlineValueWorkspaceClientCapabilities(
        refreshSupport: $checkedConvert('refreshSupport', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$InlineValueWorkspaceClientCapabilitiesToJson(
  _InlineValueWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': instance.refreshSupport};

_InlayHintWorkspaceClientCapabilities
_$InlayHintWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlayHintWorkspaceClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['refreshSupport']);
      final val = _InlayHintWorkspaceClientCapabilities(
        refreshSupport: $checkedConvert('refreshSupport', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$InlayHintWorkspaceClientCapabilitiesToJson(
  _InlayHintWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': instance.refreshSupport};

_DiagnosticWorkspaceClientCapabilities
_$DiagnosticWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DiagnosticWorkspaceClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['refreshSupport']);
      final val = _DiagnosticWorkspaceClientCapabilities(
        refreshSupport: $checkedConvert('refreshSupport', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$DiagnosticWorkspaceClientCapabilitiesToJson(
  _DiagnosticWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': instance.refreshSupport};

_FoldingRangeWorkspaceClientCapabilities
_$FoldingRangeWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FoldingRangeWorkspaceClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['refreshSupport']);
      final val = _FoldingRangeWorkspaceClientCapabilities(
        refreshSupport: $checkedConvert('refreshSupport', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$FoldingRangeWorkspaceClientCapabilitiesToJson(
  _FoldingRangeWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': instance.refreshSupport};

_TextDocumentSyncClientCapabilities
_$TextDocumentSyncClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TextDocumentSyncClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const [
          'didSave',
          'willSaveWaitUntil',
          'willSave',
          'dynamicRegistration',
        ],
      );
      final val = _TextDocumentSyncClientCapabilities(
        didSave: $checkedConvert('didSave', (v) => v as bool?),
        willSaveWaitUntil: $checkedConvert(
          'willSaveWaitUntil',
          (v) => v as bool?,
        ),
        willSave: $checkedConvert('willSave', (v) => v as bool?),
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$TextDocumentSyncClientCapabilitiesToJson(
  _TextDocumentSyncClientCapabilities instance,
) => <String, dynamic>{
  'didSave': instance.didSave,
  'willSaveWaitUntil': instance.willSaveWaitUntil,
  'willSave': instance.willSave,
  'dynamicRegistration': instance.dynamicRegistration,
};

_CompletionClientCapabilities _$CompletionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CompletionClientCapabilities', json, ($checkedConvert) {
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
  final val = _CompletionClientCapabilities(
    completionList: $checkedConvert(
      'completionList',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          itemDefaults: ($jsonValue['itemDefaults'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        ),
      ),
    ),
    contextSupport: $checkedConvert('contextSupport', (v) => v as bool?),
    insertTextMode: $checkedConvert(
      'insertTextMode',
      (v) => $enumDecodeNullable(_$InsertTextModeEnumMap, v),
    ),
    completionItemKind: $checkedConvert(
      'completionItemKind',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$CompletionItemKindEnumMap, e))
              .toList(),
        ),
      ),
    ),
    completionItem: $checkedConvert(
      'completionItem',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          commitCharactersSupport:
              $jsonValue['commitCharactersSupport'] as bool?,
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
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$CompletionClientCapabilitiesToJson(
  _CompletionClientCapabilities instance,
) => <String, dynamic>{
  'completionList': instance.completionList == null
      ? null
      : <String, dynamic>{
          'itemDefaults': instance.completionList!.itemDefaults,
        },
  'contextSupport': instance.contextSupport,
  'insertTextMode': _$InsertTextModeEnumMap[instance.insertTextMode],
  'completionItemKind': instance.completionItemKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.completionItemKind!.valueSet
              ?.map((e) => _$CompletionItemKindEnumMap[e]!)
              .toList(),
        },
  'completionItem': instance.completionItem == null
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
  'dynamicRegistration': instance.dynamicRegistration,
};

_HoverClientCapabilities _$HoverClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_HoverClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['contentFormat', 'dynamicRegistration']);
  final val = _HoverClientCapabilities(
    contentFormat: $checkedConvert(
      'contentFormat',
      (v) => (v as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MarkupKindEnumMap, e))
          .toList(),
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$HoverClientCapabilitiesToJson(
  _HoverClientCapabilities instance,
) => <String, dynamic>{
  'contentFormat': instance.contentFormat
      ?.map((e) => _$MarkupKindEnumMap[e]!)
      .toList(),
  'dynamicRegistration': instance.dynamicRegistration,
};

_SignatureHelpClientCapabilities _$SignatureHelpClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SignatureHelpClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'contextSupport',
      'signatureInformation',
      'dynamicRegistration',
    ],
  );
  final val = _SignatureHelpClientCapabilities(
    contextSupport: $checkedConvert('contextSupport', (v) => v as bool?),
    signatureInformation: $checkedConvert(
      'signatureInformation',
      (v) => _$recordConvertNullable(
        v,
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
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$SignatureHelpClientCapabilitiesToJson(
  _SignatureHelpClientCapabilities instance,
) => <String, dynamic>{
  'contextSupport': instance.contextSupport,
  'signatureInformation': instance.signatureInformation == null
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
  'dynamicRegistration': instance.dynamicRegistration,
};

_DeclarationClientCapabilities _$DeclarationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DeclarationClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  final val = _DeclarationClientCapabilities(
    linkSupport: $checkedConvert('linkSupport', (v) => v as bool?),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$DeclarationClientCapabilitiesToJson(
  _DeclarationClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': instance.linkSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_DefinitionClientCapabilities _$DefinitionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DefinitionClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  final val = _DefinitionClientCapabilities(
    linkSupport: $checkedConvert('linkSupport', (v) => v as bool?),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$DefinitionClientCapabilitiesToJson(
  _DefinitionClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': instance.linkSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_TypeDefinitionClientCapabilities _$TypeDefinitionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TypeDefinitionClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  final val = _TypeDefinitionClientCapabilities(
    linkSupport: $checkedConvert('linkSupport', (v) => v as bool?),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$TypeDefinitionClientCapabilitiesToJson(
  _TypeDefinitionClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': instance.linkSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_ImplementationClientCapabilities _$ImplementationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ImplementationClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['linkSupport', 'dynamicRegistration']);
  final val = _ImplementationClientCapabilities(
    linkSupport: $checkedConvert('linkSupport', (v) => v as bool?),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$ImplementationClientCapabilitiesToJson(
  _ImplementationClientCapabilities instance,
) => <String, dynamic>{
  'linkSupport': instance.linkSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_ReferenceClientCapabilities _$ReferenceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ReferenceClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  final val = _ReferenceClientCapabilities(
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$ReferenceClientCapabilitiesToJson(
  _ReferenceClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_DocumentHighlightClientCapabilities
_$DocumentHighlightClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentHighlightClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _DocumentHighlightClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentHighlightClientCapabilitiesToJson(
  _DocumentHighlightClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_DocumentSymbolClientCapabilities _$DocumentSymbolClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentSymbolClientCapabilities', json, (
  $checkedConvert,
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
  final val = _DocumentSymbolClientCapabilities(
    labelSupport: $checkedConvert('labelSupport', (v) => v as bool?),
    tagSupport: $checkedConvert(
      'tagSupport',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>)
              .map((e) => $enumDecode(_$SymbolTagEnumMap, e))
              .toList(),
        ),
      ),
    ),
    hierarchicalDocumentSymbolSupport: $checkedConvert(
      'hierarchicalDocumentSymbolSupport',
      (v) => v as bool?,
    ),
    symbolKind: $checkedConvert(
      'symbolKind',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SymbolKindEnumMap, e))
              .toList(),
        ),
      ),
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentSymbolClientCapabilitiesToJson(
  _DocumentSymbolClientCapabilities instance,
) => <String, dynamic>{
  'labelSupport': instance.labelSupport,
  'tagSupport': instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$SymbolTagEnumMap[e]!)
              .toList(),
        },
  'hierarchicalDocumentSymbolSupport':
      instance.hierarchicalDocumentSymbolSupport,
  'symbolKind': instance.symbolKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.symbolKind!.valueSet
              ?.map((e) => _$SymbolKindEnumMap[e]!)
              .toList(),
        },
  'dynamicRegistration': instance.dynamicRegistration,
};

_CodeActionClientCapabilities _$CodeActionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CodeActionClientCapabilities', json, ($checkedConvert) {
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
  final val = _CodeActionClientCapabilities(
    honorsChangeAnnotations: $checkedConvert(
      'honorsChangeAnnotations',
      (v) => v as bool?,
    ),
    resolveSupport: $checkedConvert(
      'resolveSupport',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          properties: ($jsonValue['properties'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        ),
      ),
    ),
    dataSupport: $checkedConvert('dataSupport', (v) => v as bool?),
    disabledSupport: $checkedConvert('disabledSupport', (v) => v as bool?),
    isPreferredSupport: $checkedConvert(
      'isPreferredSupport',
      (v) => v as bool?,
    ),
    codeActionLiteralSupport: $checkedConvert(
      'codeActionLiteralSupport',
      (v) => _$recordConvertNullable(
        v,
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
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$CodeActionClientCapabilitiesToJson(
  _CodeActionClientCapabilities instance,
) => <String, dynamic>{
  'honorsChangeAnnotations': instance.honorsChangeAnnotations,
  'resolveSupport': instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
  'dataSupport': instance.dataSupport,
  'disabledSupport': instance.disabledSupport,
  'isPreferredSupport': instance.isPreferredSupport,
  'codeActionLiteralSupport': instance.codeActionLiteralSupport == null
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
  'dynamicRegistration': instance.dynamicRegistration,
};

_CodeLensClientCapabilities _$CodeLensClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CodeLensClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  final val = _CodeLensClientCapabilities(
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$CodeLensClientCapabilitiesToJson(
  _CodeLensClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_DocumentLinkClientCapabilities _$DocumentLinkClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentLinkClientCapabilities', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['tooltipSupport', 'dynamicRegistration'],
  );
  final val = _DocumentLinkClientCapabilities(
    tooltipSupport: $checkedConvert('tooltipSupport', (v) => v as bool?),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentLinkClientCapabilitiesToJson(
  _DocumentLinkClientCapabilities instance,
) => <String, dynamic>{
  'tooltipSupport': instance.tooltipSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_DocumentColorClientCapabilities _$DocumentColorClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_DocumentColorClientCapabilities', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _DocumentColorClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentColorClientCapabilitiesToJson(
  _DocumentColorClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_DocumentFormattingClientCapabilities
_$DocumentFormattingClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DocumentFormattingClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _DocumentFormattingClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DocumentFormattingClientCapabilitiesToJson(
  _DocumentFormattingClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_DocumentRangeFormattingClientCapabilities
_$DocumentRangeFormattingClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentRangeFormattingClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['rangesSupport', 'dynamicRegistration']);
  final val = _DocumentRangeFormattingClientCapabilities(
    rangesSupport: $checkedConvert('rangesSupport', (v) => v as bool?),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentRangeFormattingClientCapabilitiesToJson(
  _DocumentRangeFormattingClientCapabilities instance,
) => <String, dynamic>{
  'rangesSupport': instance.rangesSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_DocumentOnTypeFormattingClientCapabilities
_$DocumentOnTypeFormattingClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DocumentOnTypeFormattingClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  final val = _DocumentOnTypeFormattingClientCapabilities(
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$DocumentOnTypeFormattingClientCapabilitiesToJson(
  _DocumentOnTypeFormattingClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_RenameClientCapabilities _$RenameClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_RenameClientCapabilities', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'honorsChangeAnnotations',
      'prepareSupportDefaultBehavior',
      'prepareSupport',
      'dynamicRegistration',
    ],
  );
  final val = _RenameClientCapabilities(
    honorsChangeAnnotations: $checkedConvert(
      'honorsChangeAnnotations',
      (v) => v as bool?,
    ),
    prepareSupportDefaultBehavior: $checkedConvert(
      'prepareSupportDefaultBehavior',
      (v) => $enumDecodeNullable(_$PrepareSupportDefaultBehaviorEnumMap, v),
    ),
    prepareSupport: $checkedConvert('prepareSupport', (v) => v as bool?),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$RenameClientCapabilitiesToJson(
  _RenameClientCapabilities instance,
) => <String, dynamic>{
  'honorsChangeAnnotations': instance.honorsChangeAnnotations,
  'prepareSupportDefaultBehavior':
      _$PrepareSupportDefaultBehaviorEnumMap[instance
          .prepareSupportDefaultBehavior],
  'prepareSupport': instance.prepareSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

const _$PrepareSupportDefaultBehaviorEnumMap = {
  PrepareSupportDefaultBehavior.identifierValue: 'identifierValue',
};

_FoldingRangeClientCapabilities _$FoldingRangeClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_FoldingRangeClientCapabilities', json, ($checkedConvert) {
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
  final val = _FoldingRangeClientCapabilities(
    foldingRange: $checkedConvert(
      'foldingRange',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (collapsedText: $jsonValue['collapsedText'] as bool?),
      ),
    ),
    foldingRangeKind: $checkedConvert(
      'foldingRangeKind',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FoldingRangeKindEnumMap, e))
              .toList(),
        ),
      ),
    ),
    lineFoldingOnly: $checkedConvert('lineFoldingOnly', (v) => v as bool?),
    rangeLimit: $checkedConvert('rangeLimit', (v) => (v as num?)?.toInt()),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$FoldingRangeClientCapabilitiesToJson(
  _FoldingRangeClientCapabilities instance,
) => <String, dynamic>{
  'foldingRange': instance.foldingRange == null
      ? null
      : <String, dynamic>{
          'collapsedText': instance.foldingRange!.collapsedText,
        },
  'foldingRangeKind': instance.foldingRangeKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.foldingRangeKind!.valueSet
              ?.map((e) => _$FoldingRangeKindEnumMap[e]!)
              .toList(),
        },
  'lineFoldingOnly': instance.lineFoldingOnly,
  'rangeLimit': instance.rangeLimit,
  'dynamicRegistration': instance.dynamicRegistration,
};

_SelectionRangeClientCapabilities _$SelectionRangeClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SelectionRangeClientCapabilities', json, (
  $checkedConvert,
) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  final val = _SelectionRangeClientCapabilities(
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$SelectionRangeClientCapabilitiesToJson(
  _SelectionRangeClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_PublishDiagnosticsClientCapabilities
_$PublishDiagnosticsClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PublishDiagnosticsClientCapabilities', json, (
      $checkedConvert,
    ) {
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
      final val = _PublishDiagnosticsClientCapabilities(
        dataSupport: $checkedConvert('dataSupport', (v) => v as bool?),
        codeDescriptionSupport: $checkedConvert(
          'codeDescriptionSupport',
          (v) => v as bool?,
        ),
        versionSupport: $checkedConvert('versionSupport', (v) => v as bool?),
        tagSupport: $checkedConvert(
          'tagSupport',
          (v) => _$recordConvertNullable(
            v,
            ($jsonValue) => (
              valueSet: ($jsonValue['valueSet'] as List<dynamic>)
                  .map((e) => $enumDecode(_$DiagnosticTagEnumMap, e))
                  .toList(),
            ),
          ),
        ),
        relatedInformation: $checkedConvert(
          'relatedInformation',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$PublishDiagnosticsClientCapabilitiesToJson(
  _PublishDiagnosticsClientCapabilities instance,
) => <String, dynamic>{
  'dataSupport': instance.dataSupport,
  'codeDescriptionSupport': instance.codeDescriptionSupport,
  'versionSupport': instance.versionSupport,
  'tagSupport': instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$DiagnosticTagEnumMap[e]!)
              .toList(),
        },
  'relatedInformation': instance.relatedInformation,
};

_CallHierarchyClientCapabilities _$CallHierarchyClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_CallHierarchyClientCapabilities', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _CallHierarchyClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$CallHierarchyClientCapabilitiesToJson(
  _CallHierarchyClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_SemanticTokensClientCapabilities _$SemanticTokensClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SemanticTokensClientCapabilities', json, (
  $checkedConvert,
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
  final val = _SemanticTokensClientCapabilities(
    requests: $checkedConvert(
      'requests',
      (v) => _$recordConvert(
        v,
        ($jsonValue) => (
          full: $jsonValue['full'] == null
              ? null
              : SemanticTokensClientCapabilitiesFullBase.fromJson(
                  $jsonValue['full'] as Map<String, dynamic>,
                ),
          range: $jsonValue['range'] == null
              ? null
              : RangeBase.fromJson($jsonValue['range'] as Map<String, dynamic>),
        ),
      ),
    ),
    tokenTypes: $checkedConvert(
      'tokenTypes',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    tokenModifiers: $checkedConvert(
      'tokenModifiers',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    formats: $checkedConvert(
      'formats',
      (v) => (v as List<dynamic>)
          .map((e) => $enumDecode(_$TokenFormatEnumMap, e))
          .toList(),
    ),
    augmentsSyntaxTokens: $checkedConvert(
      'augmentsSyntaxTokens',
      (v) => v as bool?,
    ),
    serverCancelSupport: $checkedConvert(
      'serverCancelSupport',
      (v) => v as bool?,
    ),
    multilineTokenSupport: $checkedConvert(
      'multilineTokenSupport',
      (v) => v as bool?,
    ),
    overlappingTokenSupport: $checkedConvert(
      'overlappingTokenSupport',
      (v) => v as bool?,
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

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
  'augmentsSyntaxTokens': instance.augmentsSyntaxTokens,
  'serverCancelSupport': instance.serverCancelSupport,
  'multilineTokenSupport': instance.multilineTokenSupport,
  'overlappingTokenSupport': instance.overlappingTokenSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

const _$TokenFormatEnumMap = {TokenFormat.relativeValue: 'relativeValue'};

_LinkedEditingRangeClientCapabilities
_$LinkedEditingRangeClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LinkedEditingRangeClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _LinkedEditingRangeClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$LinkedEditingRangeClientCapabilitiesToJson(
  _LinkedEditingRangeClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_MonikerClientCapabilities _$MonikerClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_MonikerClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  final val = _MonikerClientCapabilities(
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$MonikerClientCapabilitiesToJson(
  _MonikerClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_TypeHierarchyClientCapabilities _$TypeHierarchyClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_TypeHierarchyClientCapabilities', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _TypeHierarchyClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$TypeHierarchyClientCapabilitiesToJson(
  _TypeHierarchyClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_InlineValueClientCapabilities _$InlineValueClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlineValueClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
  final val = _InlineValueClientCapabilities(
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$InlineValueClientCapabilitiesToJson(
  _InlineValueClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_InlayHintClientCapabilities _$InlayHintClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InlayHintClientCapabilities', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['resolveSupport', 'dynamicRegistration'],
  );
  final val = _InlayHintClientCapabilities(
    resolveSupport: $checkedConvert(
      'resolveSupport',
      (v) => _$recordConvertNullable(
        v,
        ($jsonValue) => (
          properties: ($jsonValue['properties'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        ),
      ),
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$InlayHintClientCapabilitiesToJson(
  _InlayHintClientCapabilities instance,
) => <String, dynamic>{
  'resolveSupport': instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
  'dynamicRegistration': instance.dynamicRegistration,
};

_DiagnosticClientCapabilities _$DiagnosticClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_DiagnosticClientCapabilities', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['relatedDocumentSupport', 'dynamicRegistration'],
  );
  final val = _DiagnosticClientCapabilities(
    relatedDocumentSupport: $checkedConvert(
      'relatedDocumentSupport',
      (v) => v as bool?,
    ),
    dynamicRegistration: $checkedConvert(
      'dynamicRegistration',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$DiagnosticClientCapabilitiesToJson(
  _DiagnosticClientCapabilities instance,
) => <String, dynamic>{
  'relatedDocumentSupport': instance.relatedDocumentSupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_InlineCompletionClientCapabilities
_$InlineCompletionClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_InlineCompletionClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['dynamicRegistration']);
      final val = _InlineCompletionClientCapabilities(
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$InlineCompletionClientCapabilitiesToJson(
  _InlineCompletionClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': instance.dynamicRegistration};

_NotebookDocumentSyncClientCapabilities
_$NotebookDocumentSyncClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NotebookDocumentSyncClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(
        json,
        allowedKeys: const ['executionSummarySupport', 'dynamicRegistration'],
      );
      final val = _NotebookDocumentSyncClientCapabilities(
        executionSummarySupport: $checkedConvert(
          'executionSummarySupport',
          (v) => v as bool?,
        ),
        dynamicRegistration: $checkedConvert(
          'dynamicRegistration',
          (v) => v as bool?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$NotebookDocumentSyncClientCapabilitiesToJson(
  _NotebookDocumentSyncClientCapabilities instance,
) => <String, dynamic>{
  'executionSummarySupport': instance.executionSummarySupport,
  'dynamicRegistration': instance.dynamicRegistration,
};

_ShowMessageRequestClientCapabilities
_$ShowMessageRequestClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ShowMessageRequestClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['messageActionItem']);
      final val = _ShowMessageRequestClientCapabilities(
        messageActionItem: $checkedConvert(
          'messageActionItem',
          (v) => _$recordConvertNullable(
            v,
            ($jsonValue) => (
              additionalPropertiesSupport:
                  $jsonValue['additionalPropertiesSupport'] as bool?,
            ),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ShowMessageRequestClientCapabilitiesToJson(
  _ShowMessageRequestClientCapabilities instance,
) => <String, dynamic>{
  'messageActionItem': instance.messageActionItem == null
      ? null
      : <String, dynamic>{
          'additionalPropertiesSupport':
              instance.messageActionItem!.additionalPropertiesSupport,
        },
};

_ShowDocumentClientCapabilities _$ShowDocumentClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ShowDocumentClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['support']);
  final val = _ShowDocumentClientCapabilities(
    support: $checkedConvert('support', (v) => v as bool),
  );
  return val;
});

Map<String, dynamic> _$ShowDocumentClientCapabilitiesToJson(
  _ShowDocumentClientCapabilities instance,
) => <String, dynamic>{'support': instance.support};

_RegularExpressionsClientCapabilities
_$RegularExpressionsClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RegularExpressionsClientCapabilities', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, allowedKeys: const ['engine', 'version']);
      final val = _RegularExpressionsClientCapabilities(
        engine: $checkedConvert('engine', (v) => v as String),
        version: $checkedConvert('version', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RegularExpressionsClientCapabilitiesToJson(
  _RegularExpressionsClientCapabilities instance,
) => <String, dynamic>{'engine': instance.engine, 'version': instance.version};

_MarkdownClientCapabilities _$MarkdownClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_MarkdownClientCapabilities', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['parser', 'allowedTags', 'version']);
  final val = _MarkdownClientCapabilities(
    parser: $checkedConvert('parser', (v) => v as String),
    allowedTags: $checkedConvert(
      'allowedTags',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    version: $checkedConvert('version', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$MarkdownClientCapabilitiesToJson(
  _MarkdownClientCapabilities instance,
) => <String, dynamic>{
  'parser': instance.parser,
  'allowedTags': instance.allowedTags,
  'version': instance.version,
};
