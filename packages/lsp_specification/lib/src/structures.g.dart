// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImplementationParams _$ImplementationParamsFromJson(
  Map<String, dynamic> json,
) => _ImplementationParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$ImplementationParamsToJson(
  _ImplementationParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  uri: json['uri'] as String,
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'uri': instance.uri,
  'range': instance.range.toJson(),
};

_ImplementationRegistrationOptions _$ImplementationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _ImplementationRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$ImplementationRegistrationOptionsToJson(
  _ImplementationRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'id': ?instance.id,
};

_TypeDefinitionParams _$TypeDefinitionParamsFromJson(
  Map<String, dynamic> json,
) => _TypeDefinitionParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$TypeDefinitionParamsToJson(
  _TypeDefinitionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_TypeDefinitionRegistrationOptions _$TypeDefinitionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _TypeDefinitionRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$TypeDefinitionRegistrationOptionsToJson(
  _TypeDefinitionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'id': ?instance.id,
};

_WorkspaceFolder _$WorkspaceFolderFromJson(Map<String, dynamic> json) =>
    _WorkspaceFolder(uri: json['uri'] as String, name: json['name'] as String);

Map<String, dynamic> _$WorkspaceFolderToJson(_WorkspaceFolder instance) =>
    <String, dynamic>{'uri': instance.uri, 'name': instance.name};

_DidChangeWorkspaceFoldersParams _$DidChangeWorkspaceFoldersParamsFromJson(
  Map<String, dynamic> json,
) => _DidChangeWorkspaceFoldersParams(
  event: WorkspaceFoldersChangeEvent.fromJson(
    json['event'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DidChangeWorkspaceFoldersParamsToJson(
  _DidChangeWorkspaceFoldersParams instance,
) => <String, dynamic>{'event': instance.event.toJson()};

_ConfigurationParams _$ConfigurationParamsFromJson(Map<String, dynamic> json) =>
    _ConfigurationParams(
      items: (json['items'] as List<dynamic>)
          .map((e) => ConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigurationParamsToJson(
  _ConfigurationParams instance,
) => <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};

_DocumentColorParams _$DocumentColorParamsFromJson(Map<String, dynamic> json) =>
    _DocumentColorParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DocumentColorParamsToJson(
  _DocumentColorParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
};

_ColorInformation _$ColorInformationFromJson(Map<String, dynamic> json) =>
    _ColorInformation(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      color: Color.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ColorInformationToJson(_ColorInformation instance) =>
    <String, dynamic>{
      'range': instance.range.toJson(),
      'color': instance.color.toJson(),
    };

_DocumentColorRegistrationOptions _$DocumentColorRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentColorRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$DocumentColorRegistrationOptionsToJson(
  _DocumentColorRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'id': ?instance.id,
};

_ColorPresentationParams _$ColorPresentationParamsFromJson(
  Map<String, dynamic> json,
) => _ColorPresentationParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  color: Color.fromJson(json['color'] as Map<String, dynamic>),
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ColorPresentationParamsToJson(
  _ColorPresentationParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'color': instance.color.toJson(),
  'range': instance.range.toJson(),
};

_ColorPresentation _$ColorPresentationFromJson(Map<String, dynamic> json) =>
    _ColorPresentation(
      label: json['label'] as String,
      textEdit: json['textEdit'] == null
          ? null
          : TextEdit.fromJson(json['textEdit'] as Map<String, dynamic>),
      additionalTextEdits: (json['additionalTextEdits'] as List<dynamic>?)
          ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ColorPresentationToJson(_ColorPresentation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'textEdit': ?instance.textEdit?.toJson(),
      'additionalTextEdits': ?instance.additionalTextEdits
          ?.map((e) => e.toJson())
          .toList(),
    };

_WorkDoneProgressOptions _$WorkDoneProgressOptionsFromJson(
  Map<String, dynamic> json,
) => _WorkDoneProgressOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$WorkDoneProgressOptionsToJson(
  _WorkDoneProgressOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_TextDocumentRegistrationOptions _$TextDocumentRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _TextDocumentRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
);

Map<String, dynamic> _$TextDocumentRegistrationOptionsToJson(
  _TextDocumentRegistrationOptions instance,
) => <String, dynamic>{'documentSelector': ?instance.documentSelector};

_FoldingRangeParams _$FoldingRangeParamsFromJson(Map<String, dynamic> json) =>
    _FoldingRangeParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FoldingRangeParamsToJson(_FoldingRangeParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
      'textDocument': instance.textDocument.toJson(),
    };

_FoldingRange _$FoldingRangeFromJson(Map<String, dynamic> json) =>
    _FoldingRange(
      startLine: (json['startLine'] as num).toInt(),
      startCharacter: (json['startCharacter'] as num?)?.toInt(),
      endLine: (json['endLine'] as num).toInt(),
      endCharacter: (json['endCharacter'] as num?)?.toInt(),
      kind: json['kind'] == null
          ? null
          : FoldingRangeKind.fromJson(json['kind']),
      collapsedText: json['collapsedText'] as String?,
    );

Map<String, dynamic> _$FoldingRangeToJson(_FoldingRange instance) =>
    <String, dynamic>{
      'startLine': instance.startLine,
      'startCharacter': ?instance.startCharacter,
      'endLine': instance.endLine,
      'endCharacter': ?instance.endCharacter,
      'kind': ?instance.kind?.toJson(),
      'collapsedText': ?instance.collapsedText,
    };

_FoldingRangeRegistrationOptions _$FoldingRangeRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _FoldingRangeRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$FoldingRangeRegistrationOptionsToJson(
  _FoldingRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'id': ?instance.id,
};

_DeclarationParams _$DeclarationParamsFromJson(Map<String, dynamic> json) =>
    _DeclarationParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
    );

Map<String, dynamic> _$DeclarationParamsToJson(_DeclarationParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument.toJson(),
      'position': instance.position.toJson(),
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
    };

_DeclarationRegistrationOptions _$DeclarationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DeclarationRegistrationOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$DeclarationRegistrationOptionsToJson(
  _DeclarationRegistrationOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
};

_SelectionRangeParams _$SelectionRangeParamsFromJson(
  Map<String, dynamic> json,
) => _SelectionRangeParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  positions: (json['positions'] as List<dynamic>)
      .map((e) => Position.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SelectionRangeParamsToJson(
  _SelectionRangeParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'positions': instance.positions.map((e) => e.toJson()).toList(),
};

_SelectionRange _$SelectionRangeFromJson(Map<String, dynamic> json) =>
    _SelectionRange(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      parent: json['parent'] == null
          ? null
          : SelectionRange.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SelectionRangeToJson(_SelectionRange instance) =>
    <String, dynamic>{
      'range': instance.range.toJson(),
      'parent': ?instance.parent?.toJson(),
    };

_SelectionRangeRegistrationOptions _$SelectionRangeRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _SelectionRangeRegistrationOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$SelectionRangeRegistrationOptionsToJson(
  _SelectionRangeRegistrationOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
};

_WorkDoneProgressCreateParams _$WorkDoneProgressCreateParamsFromJson(
  Map<String, dynamic> json,
) => _WorkDoneProgressCreateParams(
  token: const _ProgressTokenConverter().fromJson(json['token'] as Object),
);

Map<String, dynamic> _$WorkDoneProgressCreateParamsToJson(
  _WorkDoneProgressCreateParams instance,
) => <String, dynamic>{
  'token': const _ProgressTokenConverter().toJson(instance.token),
};

_WorkDoneProgressCancelParams _$WorkDoneProgressCancelParamsFromJson(
  Map<String, dynamic> json,
) => _WorkDoneProgressCancelParams(
  token: const _ProgressTokenConverter().fromJson(json['token'] as Object),
);

Map<String, dynamic> _$WorkDoneProgressCancelParamsToJson(
  _WorkDoneProgressCancelParams instance,
) => <String, dynamic>{
  'token': const _ProgressTokenConverter().toJson(instance.token),
};

_CallHierarchyPrepareParams _$CallHierarchyPrepareParamsFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyPrepareParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$CallHierarchyPrepareParamsToJson(
  _CallHierarchyPrepareParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_CallHierarchyItem _$CallHierarchyItemFromJson(Map<String, dynamic> json) =>
    _CallHierarchyItem(
      name: json['name'] as String,
      kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
          .toList(),
      detail: json['detail'] as String?,
      uri: json['uri'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      selectionRange: Range.fromJson(
        json['selectionRange'] as Map<String, dynamic>,
      ),
      data: json['data'],
    );

Map<String, dynamic> _$CallHierarchyItemToJson(_CallHierarchyItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
      'detail': ?instance.detail,
      'uri': instance.uri,
      'range': instance.range.toJson(),
      'selectionRange': instance.selectionRange.toJson(),
      'data': ?instance.data,
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

const _$SymbolTagEnumMap = {SymbolTag.deprecated: 1};

_CallHierarchyRegistrationOptions _$CallHierarchyRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$CallHierarchyRegistrationOptionsToJson(
  _CallHierarchyRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'id': ?instance.id,
};

_CallHierarchyIncomingCallsParams _$CallHierarchyIncomingCallsParamsFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyIncomingCallsParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  item: CallHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CallHierarchyIncomingCallsParamsToJson(
  _CallHierarchyIncomingCallsParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'item': instance.item.toJson(),
};

_CallHierarchyIncomingCall _$CallHierarchyIncomingCallFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyIncomingCall(
  from: CallHierarchyItem.fromJson(json['from'] as Map<String, dynamic>),
  fromRanges: (json['fromRanges'] as List<dynamic>)
      .map((e) => Range.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CallHierarchyIncomingCallToJson(
  _CallHierarchyIncomingCall instance,
) => <String, dynamic>{
  'from': instance.from.toJson(),
  'fromRanges': instance.fromRanges.map((e) => e.toJson()).toList(),
};

_CallHierarchyOutgoingCallsParams _$CallHierarchyOutgoingCallsParamsFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyOutgoingCallsParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  item: CallHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CallHierarchyOutgoingCallsParamsToJson(
  _CallHierarchyOutgoingCallsParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'item': instance.item.toJson(),
};

_CallHierarchyOutgoingCall _$CallHierarchyOutgoingCallFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyOutgoingCall(
  to: CallHierarchyItem.fromJson(json['to'] as Map<String, dynamic>),
  fromRanges: (json['fromRanges'] as List<dynamic>)
      .map((e) => Range.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CallHierarchyOutgoingCallToJson(
  _CallHierarchyOutgoingCall instance,
) => <String, dynamic>{
  'to': instance.to.toJson(),
  'fromRanges': instance.fromRanges.map((e) => e.toJson()).toList(),
};

_SemanticTokensParams _$SemanticTokensParamsFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SemanticTokensParamsToJson(
  _SemanticTokensParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
};

_SemanticTokens _$SemanticTokensFromJson(Map<String, dynamic> json) =>
    _SemanticTokens(
      resultId: json['resultId'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SemanticTokensToJson(_SemanticTokens instance) =>
    <String, dynamic>{'resultId': ?instance.resultId, 'data': instance.data};

_SemanticTokensPartialResult _$SemanticTokensPartialResultFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensPartialResult(
  data: (json['data'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$SemanticTokensPartialResultToJson(
  _SemanticTokensPartialResult instance,
) => <String, dynamic>{'data': instance.data};

_SemanticTokensRegistrationOptions _$SemanticTokensRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  legend: SemanticTokensLegend.fromJson(json['legend'] as Map<String, dynamic>),
  range: json['range'],
  full: json['full'],
  id: json['id'] as String?,
);

Map<String, dynamic> _$SemanticTokensRegistrationOptionsToJson(
  _SemanticTokensRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'legend': instance.legend.toJson(),
  'range': ?instance.range,
  'full': ?instance.full,
  'id': ?instance.id,
};

_SemanticTokensDeltaParams _$SemanticTokensDeltaParamsFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensDeltaParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  previousResultId: json['previousResultId'] as String,
);

Map<String, dynamic> _$SemanticTokensDeltaParamsToJson(
  _SemanticTokensDeltaParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'previousResultId': instance.previousResultId,
};

_SemanticTokensDelta _$SemanticTokensDeltaFromJson(Map<String, dynamic> json) =>
    _SemanticTokensDelta(
      resultId: json['resultId'] as String?,
      edits: (json['edits'] as List<dynamic>)
          .map((e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SemanticTokensDeltaToJson(
  _SemanticTokensDelta instance,
) => <String, dynamic>{
  'resultId': ?instance.resultId,
  'edits': instance.edits.map((e) => e.toJson()).toList(),
};

_SemanticTokensDeltaPartialResult _$SemanticTokensDeltaPartialResultFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensDeltaPartialResult(
  edits: (json['edits'] as List<dynamic>)
      .map((e) => SemanticTokensEdit.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SemanticTokensDeltaPartialResultToJson(
  _SemanticTokensDeltaPartialResult instance,
) => <String, dynamic>{'edits': instance.edits.map((e) => e.toJson()).toList()};

_SemanticTokensRangeParams _$SemanticTokensRangeParamsFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensRangeParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SemanticTokensRangeParamsToJson(
  _SemanticTokensRangeParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'range': instance.range.toJson(),
};

_ShowDocumentParams _$ShowDocumentParamsFromJson(Map<String, dynamic> json) =>
    _ShowDocumentParams(
      uri: json['uri'] as String,
      external: json['external'] as bool?,
      takeFocus: json['takeFocus'] as bool?,
      selection: json['selection'] == null
          ? null
          : Range.fromJson(json['selection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowDocumentParamsToJson(_ShowDocumentParams instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'external': ?instance.external,
      'takeFocus': ?instance.takeFocus,
      'selection': ?instance.selection?.toJson(),
    };

_ShowDocumentResult _$ShowDocumentResultFromJson(Map<String, dynamic> json) =>
    _ShowDocumentResult(success: json['success'] as bool);

Map<String, dynamic> _$ShowDocumentResultToJson(_ShowDocumentResult instance) =>
    <String, dynamic>{'success': instance.success};

_LinkedEditingRangeParams _$LinkedEditingRangeParamsFromJson(
  Map<String, dynamic> json,
) => _LinkedEditingRangeParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$LinkedEditingRangeParamsToJson(
  _LinkedEditingRangeParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_LinkedEditingRanges _$LinkedEditingRangesFromJson(Map<String, dynamic> json) =>
    _LinkedEditingRanges(
      ranges: (json['ranges'] as List<dynamic>)
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      wordPattern: json['wordPattern'] as String?,
    );

Map<String, dynamic> _$LinkedEditingRangesToJson(
  _LinkedEditingRanges instance,
) => <String, dynamic>{
  'ranges': instance.ranges.map((e) => e.toJson()).toList(),
  'wordPattern': ?instance.wordPattern,
};

_LinkedEditingRangeRegistrationOptions
_$LinkedEditingRangeRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _LinkedEditingRangeRegistrationOptions(
      documentSelector: (json['documentSelector'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LinkedEditingRangeRegistrationOptionsToJson(
  _LinkedEditingRangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'id': ?instance.id,
};

_CreateFilesParams _$CreateFilesParamsFromJson(Map<String, dynamic> json) =>
    _CreateFilesParams(
      files: (json['files'] as List<dynamic>)
          .map((e) => FileCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateFilesParamsToJson(_CreateFilesParams instance) =>
    <String, dynamic>{'files': instance.files.map((e) => e.toJson()).toList()};

_WorkspaceEdit _$WorkspaceEditFromJson(
  Map<String, dynamic> json,
) => _WorkspaceEdit(
  changes: (json['changes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
  documentChanges: (json['documentChanges'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  changeAnnotations: (json['changeAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, ChangeAnnotation.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$WorkspaceEditToJson(_WorkspaceEdit instance) =>
    <String, dynamic>{
      'changes': ?instance.changes?.map(
        (k, e) => MapEntry(k, e.map((e) => e.toJson()).toList()),
      ),
      'documentChanges': ?instance.documentChanges,
      'changeAnnotations': ?instance.changeAnnotations?.map(
        (k, e) => MapEntry(k, e.toJson()),
      ),
    };

_FileOperationRegistrationOptions _$FileOperationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _FileOperationRegistrationOptions(
  filters: (json['filters'] as List<dynamic>)
      .map((e) => FileOperationFilter.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FileOperationRegistrationOptionsToJson(
  _FileOperationRegistrationOptions instance,
) => <String, dynamic>{
  'filters': instance.filters.map((e) => e.toJson()).toList(),
};

_RenameFilesParams _$RenameFilesParamsFromJson(Map<String, dynamic> json) =>
    _RenameFilesParams(
      files: (json['files'] as List<dynamic>)
          .map((e) => FileRename.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RenameFilesParamsToJson(_RenameFilesParams instance) =>
    <String, dynamic>{'files': instance.files.map((e) => e.toJson()).toList()};

_DeleteFilesParams _$DeleteFilesParamsFromJson(Map<String, dynamic> json) =>
    _DeleteFilesParams(
      files: (json['files'] as List<dynamic>)
          .map((e) => FileDelete.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeleteFilesParamsToJson(_DeleteFilesParams instance) =>
    <String, dynamic>{'files': instance.files.map((e) => e.toJson()).toList()};

_MonikerParams _$MonikerParamsFromJson(Map<String, dynamic> json) =>
    _MonikerParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
    );

Map<String, dynamic> _$MonikerParamsToJson(_MonikerParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument.toJson(),
      'position': instance.position.toJson(),
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
    };

_Moniker _$MonikerFromJson(Map<String, dynamic> json) => _Moniker(
  scheme: json['scheme'] as String,
  identifier: json['identifier'] as String,
  unique: $enumDecode(_$UniquenessLevelEnumMap, json['unique']),
  kind: $enumDecodeNullable(_$MonikerKindEnumMap, json['kind']),
);

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
) => _MonikerRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$MonikerRegistrationOptionsToJson(
  _MonikerRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_TypeHierarchyPrepareParams _$TypeHierarchyPrepareParamsFromJson(
  Map<String, dynamic> json,
) => _TypeHierarchyPrepareParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$TypeHierarchyPrepareParamsToJson(
  _TypeHierarchyPrepareParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_TypeHierarchyItem _$TypeHierarchyItemFromJson(Map<String, dynamic> json) =>
    _TypeHierarchyItem(
      name: json['name'] as String,
      kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
          .toList(),
      detail: json['detail'] as String?,
      uri: json['uri'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      selectionRange: Range.fromJson(
        json['selectionRange'] as Map<String, dynamic>,
      ),
      data: json['data'],
    );

Map<String, dynamic> _$TypeHierarchyItemToJson(_TypeHierarchyItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
      'detail': ?instance.detail,
      'uri': instance.uri,
      'range': instance.range.toJson(),
      'selectionRange': instance.selectionRange.toJson(),
      'data': ?instance.data,
    };

_TypeHierarchyRegistrationOptions _$TypeHierarchyRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _TypeHierarchyRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$TypeHierarchyRegistrationOptionsToJson(
  _TypeHierarchyRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'id': ?instance.id,
};

_TypeHierarchySupertypesParams _$TypeHierarchySupertypesParamsFromJson(
  Map<String, dynamic> json,
) => _TypeHierarchySupertypesParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  item: TypeHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TypeHierarchySupertypesParamsToJson(
  _TypeHierarchySupertypesParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'item': instance.item.toJson(),
};

_TypeHierarchySubtypesParams _$TypeHierarchySubtypesParamsFromJson(
  Map<String, dynamic> json,
) => _TypeHierarchySubtypesParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  item: TypeHierarchyItem.fromJson(json['item'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TypeHierarchySubtypesParamsToJson(
  _TypeHierarchySubtypesParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'item': instance.item.toJson(),
};

_InlineValueParams _$InlineValueParamsFromJson(Map<String, dynamic> json) =>
    _InlineValueParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      context: InlineValueContext.fromJson(
        json['context'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$InlineValueParamsToJson(_InlineValueParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'textDocument': instance.textDocument.toJson(),
      'range': instance.range.toJson(),
      'context': instance.context.toJson(),
    };

_InlineValueRegistrationOptions _$InlineValueRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _InlineValueRegistrationOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$InlineValueRegistrationOptionsToJson(
  _InlineValueRegistrationOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
};

_InlayHintParams _$InlayHintParamsFromJson(Map<String, dynamic> json) =>
    _InlayHintParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlayHintParamsToJson(_InlayHintParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'textDocument': instance.textDocument.toJson(),
      'range': instance.range.toJson(),
    };

_InlayHint _$InlayHintFromJson(Map<String, dynamic> json) => _InlayHint(
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  label: json['label'] as Object,
  kind: $enumDecodeNullable(_$InlayHintKindEnumMap, json['kind']),
  textEdits: (json['textEdits'] as List<dynamic>?)
      ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
      .toList(),
  tooltip: json['tooltip'],
  paddingLeft: json['paddingLeft'] as bool?,
  paddingRight: json['paddingRight'] as bool?,
  data: json['data'],
);

Map<String, dynamic> _$InlayHintToJson(_InlayHint instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'label': instance.label,
      'kind': ?_$InlayHintKindEnumMap[instance.kind],
      'textEdits': ?instance.textEdits?.map((e) => e.toJson()).toList(),
      'tooltip': ?instance.tooltip,
      'paddingLeft': ?instance.paddingLeft,
      'paddingRight': ?instance.paddingRight,
      'data': ?instance.data,
    };

const _$InlayHintKindEnumMap = {
  InlayHintKind.type: 1,
  InlayHintKind.parameter: 2,
};

_InlayHintRegistrationOptions _$InlayHintRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _InlayHintRegistrationOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  resolveProvider: json['resolveProvider'] as bool?,
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$InlayHintRegistrationOptionsToJson(
  _InlayHintRegistrationOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'resolveProvider': ?instance.resolveProvider,
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
};

_DocumentDiagnosticParams _$DocumentDiagnosticParamsFromJson(
  Map<String, dynamic> json,
) => _DocumentDiagnosticParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  identifier: json['identifier'] as String?,
  previousResultId: json['previousResultId'] as String?,
);

Map<String, dynamic> _$DocumentDiagnosticParamsToJson(
  _DocumentDiagnosticParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'identifier': ?instance.identifier,
  'previousResultId': ?instance.previousResultId,
};

_DocumentDiagnosticReportPartialResult
_$DocumentDiagnosticReportPartialResultFromJson(Map<String, dynamic> json) =>
    _DocumentDiagnosticReportPartialResult(
      relatedDocuments: (json['relatedDocuments'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
    );

Map<String, dynamic> _$DocumentDiagnosticReportPartialResultToJson(
  _DocumentDiagnosticReportPartialResult instance,
) => <String, dynamic>{'relatedDocuments': instance.relatedDocuments};

_DiagnosticServerCancellationData _$DiagnosticServerCancellationDataFromJson(
  Map<String, dynamic> json,
) => _DiagnosticServerCancellationData(
  retriggerRequest: json['retriggerRequest'] as bool,
);

Map<String, dynamic> _$DiagnosticServerCancellationDataToJson(
  _DiagnosticServerCancellationData instance,
) => <String, dynamic>{'retriggerRequest': instance.retriggerRequest};

_DiagnosticRegistrationOptions _$DiagnosticRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DiagnosticRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  identifier: json['identifier'] as String?,
  interFileDependencies: json['interFileDependencies'] as bool,
  workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
  id: json['id'] as String?,
);

Map<String, dynamic> _$DiagnosticRegistrationOptionsToJson(
  _DiagnosticRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'identifier': ?instance.identifier,
  'interFileDependencies': instance.interFileDependencies,
  'workspaceDiagnostics': instance.workspaceDiagnostics,
  'id': ?instance.id,
};

_WorkspaceDiagnosticParams _$WorkspaceDiagnosticParamsFromJson(
  Map<String, dynamic> json,
) => _WorkspaceDiagnosticParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  identifier: json['identifier'] as String?,
  previousResultIds: (json['previousResultIds'] as List<dynamic>)
      .map((e) => PreviousResultId.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkspaceDiagnosticParamsToJson(
  _WorkspaceDiagnosticParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'identifier': ?instance.identifier,
  'previousResultIds': instance.previousResultIds
      .map((e) => e.toJson())
      .toList(),
};

_WorkspaceDiagnosticReport _$WorkspaceDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => _WorkspaceDiagnosticReport(
  items: const _WorkspaceDocumentDiagnosticReportListConverter().fromJson(
    json['items'] as List,
  ),
);

Map<String, dynamic> _$WorkspaceDiagnosticReportToJson(
  _WorkspaceDiagnosticReport instance,
) => <String, dynamic>{
  'items': const _WorkspaceDocumentDiagnosticReportListConverter().toJson(
    instance.items,
  ),
};

_WorkspaceDiagnosticReportPartialResult
_$WorkspaceDiagnosticReportPartialResultFromJson(Map<String, dynamic> json) =>
    _WorkspaceDiagnosticReportPartialResult(
      items: const _WorkspaceDocumentDiagnosticReportListConverter().fromJson(
        json['items'] as List,
      ),
    );

Map<String, dynamic> _$WorkspaceDiagnosticReportPartialResultToJson(
  _WorkspaceDiagnosticReportPartialResult instance,
) => <String, dynamic>{
  'items': const _WorkspaceDocumentDiagnosticReportListConverter().toJson(
    instance.items,
  ),
};

_DidOpenNotebookDocumentParams _$DidOpenNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidOpenNotebookDocumentParams(
  notebookDocument: NotebookDocument.fromJson(
    json['notebookDocument'] as Map<String, dynamic>,
  ),
  cellTextDocuments: (json['cellTextDocuments'] as List<dynamic>)
      .map((e) => TextDocumentItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DidOpenNotebookDocumentParamsToJson(
  _DidOpenNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument.toJson(),
  'cellTextDocuments': instance.cellTextDocuments
      .map((e) => e.toJson())
      .toList(),
};

_DidChangeNotebookDocumentParams _$DidChangeNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidChangeNotebookDocumentParams(
  notebookDocument: VersionedNotebookDocumentIdentifier.fromJson(
    json['notebookDocument'] as Map<String, dynamic>,
  ),
  change: NotebookDocumentChangeEvent.fromJson(
    json['change'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DidChangeNotebookDocumentParamsToJson(
  _DidChangeNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument.toJson(),
  'change': instance.change.toJson(),
};

_DidSaveNotebookDocumentParams _$DidSaveNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidSaveNotebookDocumentParams(
  notebookDocument: NotebookDocumentIdentifier.fromJson(
    json['notebookDocument'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DidSaveNotebookDocumentParamsToJson(
  _DidSaveNotebookDocumentParams instance,
) => <String, dynamic>{'notebookDocument': instance.notebookDocument.toJson()};

_DidCloseNotebookDocumentParams _$DidCloseNotebookDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidCloseNotebookDocumentParams(
  notebookDocument: NotebookDocumentIdentifier.fromJson(
    json['notebookDocument'] as Map<String, dynamic>,
  ),
  cellTextDocuments: (json['cellTextDocuments'] as List<dynamic>)
      .map((e) => TextDocumentIdentifier.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DidCloseNotebookDocumentParamsToJson(
  _DidCloseNotebookDocumentParams instance,
) => <String, dynamic>{
  'notebookDocument': instance.notebookDocument.toJson(),
  'cellTextDocuments': instance.cellTextDocuments
      .map((e) => e.toJson())
      .toList(),
};

_InlineCompletionParams _$InlineCompletionParamsFromJson(
  Map<String, dynamic> json,
) => _InlineCompletionParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  context: InlineCompletionContext.fromJson(
    json['context'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$InlineCompletionParamsToJson(
  _InlineCompletionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'context': instance.context.toJson(),
};

_InlineCompletionList _$InlineCompletionListFromJson(
  Map<String, dynamic> json,
) => _InlineCompletionList(
  items: (json['items'] as List<dynamic>)
      .map((e) => InlineCompletionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InlineCompletionListToJson(
  _InlineCompletionList instance,
) => <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};

_InlineCompletionItem _$InlineCompletionItemFromJson(
  Map<String, dynamic> json,
) => _InlineCompletionItem(
  insertText: json['insertText'] as Object,
  filterText: json['filterText'] as String?,
  range: json['range'] == null
      ? null
      : Range.fromJson(json['range'] as Map<String, dynamic>),
  command: json['command'] == null
      ? null
      : Command.fromJson(json['command'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InlineCompletionItemToJson(
  _InlineCompletionItem instance,
) => <String, dynamic>{
  'insertText': instance.insertText,
  'filterText': ?instance.filterText,
  'range': ?instance.range?.toJson(),
  'command': ?instance.command?.toJson(),
};

_InlineCompletionRegistrationOptions
_$InlineCompletionRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _InlineCompletionRegistrationOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      documentSelector: (json['documentSelector'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$InlineCompletionRegistrationOptionsToJson(
  _InlineCompletionRegistrationOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'documentSelector': ?instance.documentSelector,
  'id': ?instance.id,
};

_RegistrationParams _$RegistrationParamsFromJson(Map<String, dynamic> json) =>
    _RegistrationParams(
      registrations: (json['registrations'] as List<dynamic>)
          .map((e) => Registration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegistrationParamsToJson(_RegistrationParams instance) =>
    <String, dynamic>{
      'registrations': instance.registrations.map((e) => e.toJson()).toList(),
    };

_UnregistrationParams _$UnregistrationParamsFromJson(
  Map<String, dynamic> json,
) => _UnregistrationParams(
  unregisterations: (json['unregisterations'] as List<dynamic>)
      .map((e) => Unregistration.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UnregistrationParamsToJson(
  _UnregistrationParams instance,
) => <String, dynamic>{
  'unregisterations': instance.unregisterations.map((e) => e.toJson()).toList(),
};

_InitializeParams _$InitializeParamsFromJson(Map<String, dynamic> json) =>
    _InitializeParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      processId: (json['processId'] as num?)?.toInt(),
      clientInfo: _$recordConvertNullable(
        json['clientInfo'],
        ($jsonValue) => (
          name: $jsonValue['name'] as String,
          version: $jsonValue['version'] as String?,
        ),
      ),
      locale: json['locale'] as String?,
      rootPath: json['rootPath'] as String?,
      rootUri: json['rootUri'] as String?,
      capabilities: ClientCapabilities.fromJson(
        json['capabilities'] as Map<String, dynamic>,
      ),
      initializationOptions: json['initializationOptions'],
      trace: $enumDecodeNullable(_$TraceValuesEnumMap, json['trace']),
      workspaceFolders: (json['workspaceFolders'] as List<dynamic>?)
          ?.map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InitializeParamsToJson(_InitializeParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'processId': ?instance.processId,
      'clientInfo': ?instance.clientInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.clientInfo!.name,
              'version': instance.clientInfo!.version,
            },
      'locale': ?instance.locale,
      'rootPath': ?instance.rootPath,
      'rootUri': ?instance.rootUri,
      'capabilities': instance.capabilities.toJson(),
      'initializationOptions': ?instance.initializationOptions,
      'trace': ?_$TraceValuesEnumMap[instance.trace],
      'workspaceFolders': ?instance.workspaceFolders
          ?.map((e) => e.toJson())
          .toList(),
    };

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) => value == null ? null : convert(value as Map<String, dynamic>);

const _$TraceValuesEnumMap = {
  TraceValues.off: 'off',
  TraceValues.messages: 'messages',
  TraceValues.verbose: 'verbose',
};

_InitializeResult _$InitializeResultFromJson(Map<String, dynamic> json) =>
    _InitializeResult(
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

Map<String, dynamic> _$InitializeResultToJson(_InitializeResult instance) =>
    <String, dynamic>{
      'capabilities': instance.capabilities.toJson(),
      'serverInfo': ?instance.serverInfo == null
          ? null
          : <String, dynamic>{
              'name': instance.serverInfo!.name,
              'version': instance.serverInfo!.version,
            },
    };

_InitializeError _$InitializeErrorFromJson(Map<String, dynamic> json) =>
    _InitializeError(retry: json['retry'] as bool);

Map<String, dynamic> _$InitializeErrorToJson(_InitializeError instance) =>
    <String, dynamic>{'retry': instance.retry};

_InitializedParams _$InitializedParamsFromJson(Map<String, dynamic> json) =>
    _InitializedParams();

Map<String, dynamic> _$InitializedParamsToJson(_InitializedParams instance) =>
    <String, dynamic>{};

_DidChangeConfigurationParams _$DidChangeConfigurationParamsFromJson(
  Map<String, dynamic> json,
) => _DidChangeConfigurationParams(settings: json['settings'] as Object);

Map<String, dynamic> _$DidChangeConfigurationParamsToJson(
  _DidChangeConfigurationParams instance,
) => <String, dynamic>{'settings': instance.settings};

_DidChangeConfigurationRegistrationOptions
_$DidChangeConfigurationRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DidChangeConfigurationRegistrationOptions(section: json['section']);

Map<String, dynamic> _$DidChangeConfigurationRegistrationOptionsToJson(
  _DidChangeConfigurationRegistrationOptions instance,
) => <String, dynamic>{'section': ?instance.section};

_ShowMessageParams _$ShowMessageParamsFromJson(Map<String, dynamic> json) =>
    _ShowMessageParams(
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      message: json['message'] as String,
    );

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
) => _ShowMessageRequestParams(
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
  message: json['message'] as String,
  actions: (json['actions'] as List<dynamic>?)
      ?.map((e) => MessageActionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ShowMessageRequestParamsToJson(
  _ShowMessageRequestParams instance,
) => <String, dynamic>{
  'type': _$MessageTypeEnumMap[instance.type]!,
  'message': instance.message,
  'actions': ?instance.actions?.map((e) => e.toJson()).toList(),
};

_MessageActionItem _$MessageActionItemFromJson(Map<String, dynamic> json) =>
    _MessageActionItem(title: json['title'] as String);

Map<String, dynamic> _$MessageActionItemToJson(_MessageActionItem instance) =>
    <String, dynamic>{'title': instance.title};

_LogMessageParams _$LogMessageParamsFromJson(Map<String, dynamic> json) =>
    _LogMessageParams(
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LogMessageParamsToJson(_LogMessageParams instance) =>
    <String, dynamic>{
      'type': _$MessageTypeEnumMap[instance.type]!,
      'message': instance.message,
    };

_DidOpenTextDocumentParams _$DidOpenTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidOpenTextDocumentParams(
  textDocument: TextDocumentItem.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DidOpenTextDocumentParamsToJson(
  _DidOpenTextDocumentParams instance,
) => <String, dynamic>{'textDocument': instance.textDocument.toJson()};

_DidChangeTextDocumentParams _$DidChangeTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidChangeTextDocumentParams(
  textDocument: VersionedTextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  contentChanges: const _TextDocumentContentChangeEventListConverter().fromJson(
    json['contentChanges'] as List,
  ),
);

Map<String, dynamic> _$DidChangeTextDocumentParamsToJson(
  _DidChangeTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'contentChanges': const _TextDocumentContentChangeEventListConverter().toJson(
    instance.contentChanges,
  ),
};

_TextDocumentChangeRegistrationOptions
_$TextDocumentChangeRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _TextDocumentChangeRegistrationOptions(
      documentSelector: (json['documentSelector'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      syncKind: $enumDecode(_$TextDocumentSyncKindEnumMap, json['syncKind']),
    );

Map<String, dynamic> _$TextDocumentChangeRegistrationOptionsToJson(
  _TextDocumentChangeRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'syncKind': _$TextDocumentSyncKindEnumMap[instance.syncKind]!,
};

const _$TextDocumentSyncKindEnumMap = {
  TextDocumentSyncKind.none: 0,
  TextDocumentSyncKind.full: 1,
  TextDocumentSyncKind.incremental: 2,
};

_DidCloseTextDocumentParams _$DidCloseTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidCloseTextDocumentParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DidCloseTextDocumentParamsToJson(
  _DidCloseTextDocumentParams instance,
) => <String, dynamic>{'textDocument': instance.textDocument.toJson()};

_DidSaveTextDocumentParams _$DidSaveTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _DidSaveTextDocumentParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  text: json['text'] as String?,
);

Map<String, dynamic> _$DidSaveTextDocumentParamsToJson(
  _DidSaveTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'text': ?instance.text,
};

_TextDocumentSaveRegistrationOptions
_$TextDocumentSaveRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _TextDocumentSaveRegistrationOptions(
      documentSelector: (json['documentSelector'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      includeText: json['includeText'] as bool?,
    );

Map<String, dynamic> _$TextDocumentSaveRegistrationOptionsToJson(
  _TextDocumentSaveRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'includeText': ?instance.includeText,
};

_WillSaveTextDocumentParams _$WillSaveTextDocumentParamsFromJson(
  Map<String, dynamic> json,
) => _WillSaveTextDocumentParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  reason: $enumDecode(_$TextDocumentSaveReasonEnumMap, json['reason']),
);

Map<String, dynamic> _$WillSaveTextDocumentParamsToJson(
  _WillSaveTextDocumentParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'reason': _$TextDocumentSaveReasonEnumMap[instance.reason]!,
};

const _$TextDocumentSaveReasonEnumMap = {
  TextDocumentSaveReason.manual: 1,
  TextDocumentSaveReason.afterDelay: 2,
  TextDocumentSaveReason.focusOut: 3,
};

_TextEdit _$TextEditFromJson(Map<String, dynamic> json) => _TextEdit(
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
  newText: json['newText'] as String,
);

Map<String, dynamic> _$TextEditToJson(_TextEdit instance) => <String, dynamic>{
  'range': instance.range.toJson(),
  'newText': instance.newText,
};

_DidChangeWatchedFilesParams _$DidChangeWatchedFilesParamsFromJson(
  Map<String, dynamic> json,
) => _DidChangeWatchedFilesParams(
  changes: (json['changes'] as List<dynamic>)
      .map((e) => FileEvent.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DidChangeWatchedFilesParamsToJson(
  _DidChangeWatchedFilesParams instance,
) => <String, dynamic>{
  'changes': instance.changes.map((e) => e.toJson()).toList(),
};

_DidChangeWatchedFilesRegistrationOptions
_$DidChangeWatchedFilesRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _DidChangeWatchedFilesRegistrationOptions(
      watchers: (json['watchers'] as List<dynamic>)
          .map((e) => FileSystemWatcher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DidChangeWatchedFilesRegistrationOptionsToJson(
  _DidChangeWatchedFilesRegistrationOptions instance,
) => <String, dynamic>{
  'watchers': instance.watchers.map((e) => e.toJson()).toList(),
};

_PublishDiagnosticsParams _$PublishDiagnosticsParamsFromJson(
  Map<String, dynamic> json,
) => _PublishDiagnosticsParams(
  uri: json['uri'] as String,
  version: (json['version'] as num?)?.toInt(),
  diagnostics: (json['diagnostics'] as List<dynamic>)
      .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PublishDiagnosticsParamsToJson(
  _PublishDiagnosticsParams instance,
) => <String, dynamic>{
  'uri': instance.uri,
  'version': ?instance.version,
  'diagnostics': instance.diagnostics.map((e) => e.toJson()).toList(),
};

_CompletionParams _$CompletionParamsFromJson(Map<String, dynamic> json) =>
    _CompletionParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      context: json['context'] == null
          ? null
          : CompletionContext.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompletionParamsToJson(_CompletionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument.toJson(),
      'position': instance.position.toJson(),
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
      'context': ?instance.context?.toJson(),
    };

_CompletionItem _$CompletionItemFromJson(Map<String, dynamic> json) =>
    _CompletionItem(
      label: json['label'] as String,
      labelDetails: json['labelDetails'] == null
          ? null
          : CompletionItemLabelDetails.fromJson(
              json['labelDetails'] as Map<String, dynamic>,
            ),
      kind: $enumDecodeNullable(_$CompletionItemKindEnumMap, json['kind']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CompletionItemTagEnumMap, e))
          .toList(),
      detail: json['detail'] as String?,
      documentation: json['documentation'],
      deprecated: json['deprecated'] as bool?,
      preselect: json['preselect'] as bool?,
      sortText: json['sortText'] as String?,
      filterText: json['filterText'] as String?,
      insertText: json['insertText'] as String?,
      insertTextFormat: $enumDecodeNullable(
        _$InsertTextFormatEnumMap,
        json['insertTextFormat'],
      ),
      insertTextMode: $enumDecodeNullable(
        _$InsertTextModeEnumMap,
        json['insertTextMode'],
      ),
      textEdit: json['textEdit'],
      textEditText: json['textEditText'] as String?,
      additionalTextEdits: (json['additionalTextEdits'] as List<dynamic>?)
          ?.map((e) => TextEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
      commitCharacters: (json['commitCharacters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      data: json['data'],
    );

Map<String, dynamic> _$CompletionItemToJson(
  _CompletionItem instance,
) => <String, dynamic>{
  'label': instance.label,
  'labelDetails': ?instance.labelDetails?.toJson(),
  'kind': ?_$CompletionItemKindEnumMap[instance.kind],
  'tags': ?instance.tags?.map((e) => _$CompletionItemTagEnumMap[e]!).toList(),
  'detail': ?instance.detail,
  'documentation': ?instance.documentation,
  'deprecated': ?instance.deprecated,
  'preselect': ?instance.preselect,
  'sortText': ?instance.sortText,
  'filterText': ?instance.filterText,
  'insertText': ?instance.insertText,
  'insertTextFormat': ?_$InsertTextFormatEnumMap[instance.insertTextFormat],
  'insertTextMode': ?_$InsertTextModeEnumMap[instance.insertTextMode],
  'textEdit': ?instance.textEdit,
  'textEditText': ?instance.textEditText,
  'additionalTextEdits': ?instance.additionalTextEdits
      ?.map((e) => e.toJson())
      .toList(),
  'commitCharacters': ?instance.commitCharacters,
  'command': ?instance.command?.toJson(),
  'data': ?instance.data,
};

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

const _$CompletionItemTagEnumMap = {CompletionItemTag.deprecated: 1};

const _$InsertTextFormatEnumMap = {
  InsertTextFormat.plainText: 1,
  InsertTextFormat.snippet: 2,
};

const _$InsertTextModeEnumMap = {
  InsertTextMode.asIs: 1,
  InsertTextMode.adjustIndentation: 2,
};

_CompletionList _$CompletionListFromJson(Map<String, dynamic> json) =>
    _CompletionList(
      isIncomplete: json['isIncomplete'] as bool,
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
      items: (json['items'] as List<dynamic>)
          .map((e) => CompletionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompletionListToJson(
  _CompletionList instance,
) => <String, dynamic>{
  'isIncomplete': instance.isIncomplete,
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
  'items': instance.items.map((e) => e.toJson()).toList(),
};

_CompletionRegistrationOptions _$CompletionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _CompletionRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  allCommitCharacters: (json['allCommitCharacters'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  resolveProvider: json['resolveProvider'] as bool?,
  completionItem: _$recordConvertNullable(
    json['completionItem'],
    ($jsonValue) =>
        (labelDetailsSupport: $jsonValue['labelDetailsSupport'] as bool?),
  ),
);

Map<String, dynamic> _$CompletionRegistrationOptionsToJson(
  _CompletionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'triggerCharacters': ?instance.triggerCharacters,
  'allCommitCharacters': ?instance.allCommitCharacters,
  'resolveProvider': ?instance.resolveProvider,
  'completionItem': ?instance.completionItem == null
      ? null
      : <String, dynamic>{
          'labelDetailsSupport': instance.completionItem!.labelDetailsSupport,
        },
};

_HoverParams _$HoverParamsFromJson(Map<String, dynamic> json) => _HoverParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$HoverParamsToJson(_HoverParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument.toJson(),
      'position': instance.position.toJson(),
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
    };

_Hover _$HoverFromJson(Map<String, dynamic> json) => _Hover(
  contents: json['contents'] as Object,
  range: json['range'] == null
      ? null
      : Range.fromJson(json['range'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HoverToJson(_Hover instance) => <String, dynamic>{
  'contents': instance.contents,
  'range': ?instance.range?.toJson(),
};

_HoverRegistrationOptions _$HoverRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _HoverRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$HoverRegistrationOptionsToJson(
  _HoverRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_SignatureHelpParams _$SignatureHelpParamsFromJson(Map<String, dynamic> json) =>
    _SignatureHelpParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      context: json['context'] == null
          ? null
          : SignatureHelpContext.fromJson(
              json['context'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SignatureHelpParamsToJson(
  _SignatureHelpParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'context': ?instance.context?.toJson(),
};

_SignatureHelp _$SignatureHelpFromJson(Map<String, dynamic> json) =>
    _SignatureHelp(
      signatures: (json['signatures'] as List<dynamic>)
          .map((e) => SignatureInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeSignature: (json['activeSignature'] as num?)?.toInt(),
      activeParameter: (json['activeParameter'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignatureHelpToJson(_SignatureHelp instance) =>
    <String, dynamic>{
      'signatures': instance.signatures.map((e) => e.toJson()).toList(),
      'activeSignature': ?instance.activeSignature,
      'activeParameter': ?instance.activeParameter,
    };

_SignatureHelpRegistrationOptions _$SignatureHelpRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _SignatureHelpRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  retriggerCharacters: (json['retriggerCharacters'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SignatureHelpRegistrationOptionsToJson(
  _SignatureHelpRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'triggerCharacters': ?instance.triggerCharacters,
  'retriggerCharacters': ?instance.retriggerCharacters,
};

_DefinitionParams _$DefinitionParamsFromJson(Map<String, dynamic> json) =>
    _DefinitionParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
    );

Map<String, dynamic> _$DefinitionParamsToJson(_DefinitionParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument.toJson(),
      'position': instance.position.toJson(),
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
    };

_DefinitionRegistrationOptions _$DefinitionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DefinitionRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$DefinitionRegistrationOptionsToJson(
  _DefinitionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_ReferenceParams _$ReferenceParamsFromJson(Map<String, dynamic> json) =>
    _ReferenceParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      context: ReferenceContext.fromJson(
        json['context'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ReferenceParamsToJson(_ReferenceParams instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument.toJson(),
      'position': instance.position.toJson(),
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
      'context': instance.context.toJson(),
    };

_ReferenceRegistrationOptions _$ReferenceRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _ReferenceRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$ReferenceRegistrationOptionsToJson(
  _ReferenceRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentHighlightParams _$DocumentHighlightParamsFromJson(
  Map<String, dynamic> json,
) => _DocumentHighlightParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$DocumentHighlightParamsToJson(
  _DocumentHighlightParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_DocumentHighlight _$DocumentHighlightFromJson(Map<String, dynamic> json) =>
    _DocumentHighlight(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      kind: $enumDecodeNullable(_$DocumentHighlightKindEnumMap, json['kind']),
    );

Map<String, dynamic> _$DocumentHighlightToJson(_DocumentHighlight instance) =>
    <String, dynamic>{
      'range': instance.range.toJson(),
      'kind': ?_$DocumentHighlightKindEnumMap[instance.kind],
    };

const _$DocumentHighlightKindEnumMap = {
  DocumentHighlightKind.text: 1,
  DocumentHighlightKind.read: 2,
  DocumentHighlightKind.write: 3,
};

_DocumentHighlightRegistrationOptions
_$DocumentHighlightRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _DocumentHighlightRegistrationOptions(
      documentSelector: (json['documentSelector'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );

Map<String, dynamic> _$DocumentHighlightRegistrationOptionsToJson(
  _DocumentHighlightRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentSymbolParams _$DocumentSymbolParamsFromJson(
  Map<String, dynamic> json,
) => _DocumentSymbolParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DocumentSymbolParamsToJson(
  _DocumentSymbolParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
};

_SymbolInformation _$SymbolInformationFromJson(Map<String, dynamic> json) =>
    _SymbolInformation(
      name: json['name'] as String,
      kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
          .toList(),
      containerName: json['containerName'] as String?,
      deprecated: json['deprecated'] as bool?,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SymbolInformationToJson(_SymbolInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
      'containerName': ?instance.containerName,
      'deprecated': ?instance.deprecated,
      'location': instance.location.toJson(),
    };

_DocumentSymbol _$DocumentSymbolFromJson(Map<String, dynamic> json) =>
    _DocumentSymbol(
      name: json['name'] as String,
      detail: json['detail'] as String?,
      kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
          .toList(),
      deprecated: json['deprecated'] as bool?,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      selectionRange: Range.fromJson(
        json['selectionRange'] as Map<String, dynamic>,
      ),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => DocumentSymbol.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocumentSymbolToJson(_DocumentSymbol instance) =>
    <String, dynamic>{
      'name': instance.name,
      'detail': ?instance.detail,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
      'deprecated': ?instance.deprecated,
      'range': instance.range.toJson(),
      'selectionRange': instance.selectionRange.toJson(),
      'children': ?instance.children?.map((e) => e.toJson()).toList(),
    };

_DocumentSymbolRegistrationOptions _$DocumentSymbolRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentSymbolRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  label: json['label'] as String?,
);

Map<String, dynamic> _$DocumentSymbolRegistrationOptionsToJson(
  _DocumentSymbolRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'label': ?instance.label,
};

_CodeActionParams _$CodeActionParamsFromJson(Map<String, dynamic> json) =>
    _CodeActionParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      context: CodeActionContext.fromJson(
        json['context'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CodeActionParamsToJson(_CodeActionParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
      'textDocument': instance.textDocument.toJson(),
      'range': instance.range.toJson(),
      'context': instance.context.toJson(),
    };

_Command _$CommandFromJson(Map<String, dynamic> json) => _Command(
  title: json['title'] as String,
  command: json['command'] as String,
  arguments: (json['arguments'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
);

Map<String, dynamic> _$CommandToJson(_Command instance) => <String, dynamic>{
  'title': instance.title,
  'command': instance.command,
  'arguments': ?instance.arguments,
};

_CodeAction _$CodeActionFromJson(Map<String, dynamic> json) => _CodeAction(
  title: json['title'] as String,
  kind: json['kind'] == null ? null : CodeActionKind.fromJson(json['kind']),
  diagnostics: (json['diagnostics'] as List<dynamic>?)
      ?.map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
      .toList(),
  isPreferred: json['isPreferred'] as bool?,
  disabled: _$recordConvertNullable(
    json['disabled'],
    ($jsonValue) => (reason: $jsonValue['reason'] as String),
  ),
  edit: json['edit'] == null
      ? null
      : WorkspaceEdit.fromJson(json['edit'] as Map<String, dynamic>),
  command: json['command'] == null
      ? null
      : Command.fromJson(json['command'] as Map<String, dynamic>),
  data: json['data'],
);

Map<String, dynamic> _$CodeActionToJson(_CodeAction instance) =>
    <String, dynamic>{
      'title': instance.title,
      'kind': ?instance.kind?.toJson(),
      'diagnostics': ?instance.diagnostics?.map((e) => e.toJson()).toList(),
      'isPreferred': ?instance.isPreferred,
      'disabled': ?instance.disabled == null
          ? null
          : <String, dynamic>{'reason': instance.disabled!.reason},
      'edit': ?instance.edit?.toJson(),
      'command': ?instance.command?.toJson(),
      'data': ?instance.data,
    };

_CodeActionRegistrationOptions _$CodeActionRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _CodeActionRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  codeActionKinds: (json['codeActionKinds'] as List<dynamic>?)
      ?.map(CodeActionKind.fromJson)
      .toList(),
  resolveProvider: json['resolveProvider'] as bool?,
);

Map<String, dynamic> _$CodeActionRegistrationOptionsToJson(
  _CodeActionRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'codeActionKinds': ?instance.codeActionKinds?.map((e) => e.toJson()).toList(),
  'resolveProvider': ?instance.resolveProvider,
};

_WorkspaceSymbolParams _$WorkspaceSymbolParamsFromJson(
  Map<String, dynamic> json,
) => _WorkspaceSymbolParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['partialResultToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  query: json['query'] as String,
);

Map<String, dynamic> _$WorkspaceSymbolParamsToJson(
  _WorkspaceSymbolParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
  'query': instance.query,
};

_WorkspaceSymbol _$WorkspaceSymbolFromJson(Map<String, dynamic> json) =>
    _WorkspaceSymbol(
      name: json['name'] as String,
      kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
          .toList(),
      containerName: json['containerName'] as String?,
      location: json['location'] as Object,
      data: json['data'],
    );

Map<String, dynamic> _$WorkspaceSymbolToJson(_WorkspaceSymbol instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': _$SymbolKindEnumMap[instance.kind]!,
      'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
      'containerName': ?instance.containerName,
      'location': instance.location,
      'data': ?instance.data,
    };

_WorkspaceSymbolRegistrationOptions
_$WorkspaceSymbolRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _WorkspaceSymbolRegistrationOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      resolveProvider: json['resolveProvider'] as bool?,
    );

Map<String, dynamic> _$WorkspaceSymbolRegistrationOptionsToJson(
  _WorkspaceSymbolRegistrationOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'resolveProvider': ?instance.resolveProvider,
};

_CodeLensParams _$CodeLensParamsFromJson(Map<String, dynamic> json) =>
    _CodeLensParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CodeLensParamsToJson(_CodeLensParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
      'textDocument': instance.textDocument.toJson(),
    };

_CodeLens _$CodeLensFromJson(Map<String, dynamic> json) => _CodeLens(
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
  command: json['command'] == null
      ? null
      : Command.fromJson(json['command'] as Map<String, dynamic>),
  data: json['data'],
);

Map<String, dynamic> _$CodeLensToJson(_CodeLens instance) => <String, dynamic>{
  'range': instance.range.toJson(),
  'command': ?instance.command?.toJson(),
  'data': ?instance.data,
};

_CodeLensRegistrationOptions _$CodeLensRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _CodeLensRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  resolveProvider: json['resolveProvider'] as bool?,
);

Map<String, dynamic> _$CodeLensRegistrationOptionsToJson(
  _CodeLensRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'resolveProvider': ?instance.resolveProvider,
};

_DocumentLinkParams _$DocumentLinkParamsFromJson(Map<String, dynamic> json) =>
    _DocumentLinkParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DocumentLinkParamsToJson(_DocumentLinkParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.partialResultToken,
        const _ProgressTokenConverter().toJson,
      ),
      'textDocument': instance.textDocument.toJson(),
    };

_DocumentLink _$DocumentLinkFromJson(Map<String, dynamic> json) =>
    _DocumentLink(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      target: json['target'] as String?,
      tooltip: json['tooltip'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$DocumentLinkToJson(_DocumentLink instance) =>
    <String, dynamic>{
      'range': instance.range.toJson(),
      'target': ?instance.target,
      'tooltip': ?instance.tooltip,
      'data': ?instance.data,
    };

_DocumentLinkRegistrationOptions _$DocumentLinkRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentLinkRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  resolveProvider: json['resolveProvider'] as bool?,
);

Map<String, dynamic> _$DocumentLinkRegistrationOptionsToJson(
  _DocumentLinkRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'resolveProvider': ?instance.resolveProvider,
};

_DocumentFormattingParams _$DocumentFormattingParamsFromJson(
  Map<String, dynamic> json,
) => _DocumentFormattingParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  options: FormattingOptions.fromJson(json['options'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DocumentFormattingParamsToJson(
  _DocumentFormattingParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'options': instance.options.toJson(),
};

_DocumentFormattingRegistrationOptions
_$DocumentFormattingRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _DocumentFormattingRegistrationOptions(
      documentSelector: (json['documentSelector'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      workDoneProgress: json['workDoneProgress'] as bool?,
    );

Map<String, dynamic> _$DocumentFormattingRegistrationOptionsToJson(
  _DocumentFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
};

_DocumentRangeFormattingParams _$DocumentRangeFormattingParamsFromJson(
  Map<String, dynamic> json,
) => _DocumentRangeFormattingParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
  options: FormattingOptions.fromJson(json['options'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DocumentRangeFormattingParamsToJson(
  _DocumentRangeFormattingParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'range': instance.range.toJson(),
  'options': instance.options.toJson(),
};

_DocumentRangeFormattingRegistrationOptions
_$DocumentRangeFormattingRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentRangeFormattingRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  rangesSupport: json['rangesSupport'] as bool?,
);

Map<String, dynamic> _$DocumentRangeFormattingRegistrationOptionsToJson(
  _DocumentRangeFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'rangesSupport': ?instance.rangesSupport,
};

_DocumentRangesFormattingParams _$DocumentRangesFormattingParamsFromJson(
  Map<String, dynamic> json,
) => _DocumentRangesFormattingParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  ranges: (json['ranges'] as List<dynamic>)
      .map((e) => Range.fromJson(e as Map<String, dynamic>))
      .toList(),
  options: FormattingOptions.fromJson(json['options'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DocumentRangesFormattingParamsToJson(
  _DocumentRangesFormattingParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'textDocument': instance.textDocument.toJson(),
  'ranges': instance.ranges.map((e) => e.toJson()).toList(),
  'options': instance.options.toJson(),
};

_DocumentOnTypeFormattingParams _$DocumentOnTypeFormattingParamsFromJson(
  Map<String, dynamic> json,
) => _DocumentOnTypeFormattingParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
  ch: json['ch'] as String,
  options: FormattingOptions.fromJson(json['options'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DocumentOnTypeFormattingParamsToJson(
  _DocumentOnTypeFormattingParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'ch': instance.ch,
  'options': instance.options.toJson(),
};

_DocumentOnTypeFormattingRegistrationOptions
_$DocumentOnTypeFormattingRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentOnTypeFormattingRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  firstTriggerCharacter: json['firstTriggerCharacter'] as String,
  moreTriggerCharacter: (json['moreTriggerCharacter'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$DocumentOnTypeFormattingRegistrationOptionsToJson(
  _DocumentOnTypeFormattingRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'firstTriggerCharacter': instance.firstTriggerCharacter,
  'moreTriggerCharacter': ?instance.moreTriggerCharacter,
};

_RenameParams _$RenameParamsFromJson(Map<String, dynamic> json) =>
    _RenameParams(
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      newName: json['newName'] as String,
    );

Map<String, dynamic> _$RenameParamsToJson(_RenameParams instance) =>
    <String, dynamic>{
      'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
        instance.workDoneToken,
        const _ProgressTokenConverter().toJson,
      ),
      'textDocument': instance.textDocument.toJson(),
      'position': instance.position.toJson(),
      'newName': instance.newName,
    };

_RenameRegistrationOptions _$RenameRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _RenameRegistrationOptions(
  documentSelector: (json['documentSelector'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
  workDoneProgress: json['workDoneProgress'] as bool?,
  prepareProvider: json['prepareProvider'] as bool?,
);

Map<String, dynamic> _$RenameRegistrationOptionsToJson(
  _RenameRegistrationOptions instance,
) => <String, dynamic>{
  'documentSelector': ?instance.documentSelector,
  'workDoneProgress': ?instance.workDoneProgress,
  'prepareProvider': ?instance.prepareProvider,
};

_PrepareRenameParams _$PrepareRenameParamsFromJson(Map<String, dynamic> json) =>
    _PrepareRenameParams(
      textDocument: TextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['workDoneToken'],
        const _ProgressTokenConverter().fromJson,
      ),
    );

Map<String, dynamic> _$PrepareRenameParamsToJson(
  _PrepareRenameParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_ExecuteCommandParams _$ExecuteCommandParamsFromJson(
  Map<String, dynamic> json,
) => _ExecuteCommandParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
  command: json['command'] as String,
  arguments: (json['arguments'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList(),
);

Map<String, dynamic> _$ExecuteCommandParamsToJson(
  _ExecuteCommandParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
  'command': instance.command,
  'arguments': ?instance.arguments,
};

_ExecuteCommandRegistrationOptions _$ExecuteCommandRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _ExecuteCommandRegistrationOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  commands: (json['commands'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ExecuteCommandRegistrationOptionsToJson(
  _ExecuteCommandRegistrationOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'commands': instance.commands,
};

_ApplyWorkspaceEditParams _$ApplyWorkspaceEditParamsFromJson(
  Map<String, dynamic> json,
) => _ApplyWorkspaceEditParams(
  label: json['label'] as String?,
  edit: WorkspaceEdit.fromJson(json['edit'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApplyWorkspaceEditParamsToJson(
  _ApplyWorkspaceEditParams instance,
) => <String, dynamic>{
  'label': ?instance.label,
  'edit': instance.edit.toJson(),
};

_ApplyWorkspaceEditResult _$ApplyWorkspaceEditResultFromJson(
  Map<String, dynamic> json,
) => _ApplyWorkspaceEditResult(
  applied: json['applied'] as bool,
  failureReason: json['failureReason'] as String?,
  failedChange: (json['failedChange'] as num?)?.toInt(),
);

Map<String, dynamic> _$ApplyWorkspaceEditResultToJson(
  _ApplyWorkspaceEditResult instance,
) => <String, dynamic>{
  'applied': instance.applied,
  'failureReason': ?instance.failureReason,
  'failedChange': ?instance.failedChange,
};

_WorkDoneProgressBegin _$WorkDoneProgressBeginFromJson(
  Map<String, dynamic> json,
) => _WorkDoneProgressBegin(
  kind: json['kind'] as String,
  title: json['title'] as String,
  cancellable: json['cancellable'] as bool?,
  message: json['message'] as String?,
  percentage: (json['percentage'] as num?)?.toInt(),
);

Map<String, dynamic> _$WorkDoneProgressBeginToJson(
  _WorkDoneProgressBegin instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'title': instance.title,
  'cancellable': ?instance.cancellable,
  'message': ?instance.message,
  'percentage': ?instance.percentage,
};

_WorkDoneProgressReport _$WorkDoneProgressReportFromJson(
  Map<String, dynamic> json,
) => _WorkDoneProgressReport(
  kind: json['kind'] as String,
  cancellable: json['cancellable'] as bool?,
  message: json['message'] as String?,
  percentage: (json['percentage'] as num?)?.toInt(),
);

Map<String, dynamic> _$WorkDoneProgressReportToJson(
  _WorkDoneProgressReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'cancellable': ?instance.cancellable,
  'message': ?instance.message,
  'percentage': ?instance.percentage,
};

_WorkDoneProgressEnd _$WorkDoneProgressEndFromJson(Map<String, dynamic> json) =>
    _WorkDoneProgressEnd(
      kind: json['kind'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WorkDoneProgressEndToJson(
  _WorkDoneProgressEnd instance,
) => <String, dynamic>{'kind': instance.kind, 'message': ?instance.message};

_SetTraceParams _$SetTraceParamsFromJson(Map<String, dynamic> json) =>
    _SetTraceParams(value: $enumDecode(_$TraceValuesEnumMap, json['value']));

Map<String, dynamic> _$SetTraceParamsToJson(_SetTraceParams instance) =>
    <String, dynamic>{'value': _$TraceValuesEnumMap[instance.value]!};

_LogTraceParams _$LogTraceParamsFromJson(Map<String, dynamic> json) =>
    _LogTraceParams(
      message: json['message'] as String,
      verbose: json['verbose'] as String?,
    );

Map<String, dynamic> _$LogTraceParamsToJson(_LogTraceParams instance) =>
    <String, dynamic>{
      'message': instance.message,
      'verbose': ?instance.verbose,
    };

_CancelParams _$CancelParamsFromJson(Map<String, dynamic> json) =>
    _CancelParams(id: json['id'] as Object);

Map<String, dynamic> _$CancelParamsToJson(_CancelParams instance) =>
    <String, dynamic>{'id': instance.id};

_ProgressParams _$ProgressParamsFromJson(Map<String, dynamic> json) =>
    _ProgressParams(
      token: const _ProgressTokenConverter().fromJson(json['token'] as Object),
      value: json['value'] as Object,
    );

Map<String, dynamic> _$ProgressParamsToJson(_ProgressParams instance) =>
    <String, dynamic>{
      'token': const _ProgressTokenConverter().toJson(instance.token),
      'value': instance.value,
    };

_TextDocumentPositionParams _$TextDocumentPositionParamsFromJson(
  Map<String, dynamic> json,
) => _TextDocumentPositionParams(
  textDocument: TextDocumentIdentifier.fromJson(
    json['textDocument'] as Map<String, dynamic>,
  ),
  position: Position.fromJson(json['position'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TextDocumentPositionParamsToJson(
  _TextDocumentPositionParams instance,
) => <String, dynamic>{
  'textDocument': instance.textDocument.toJson(),
  'position': instance.position.toJson(),
};

_WorkDoneProgressParams _$WorkDoneProgressParamsFromJson(
  Map<String, dynamic> json,
) => _WorkDoneProgressParams(
  workDoneToken: _$JsonConverterFromJson<Object, ProgressToken>(
    json['workDoneToken'],
    const _ProgressTokenConverter().fromJson,
  ),
);

Map<String, dynamic> _$WorkDoneProgressParamsToJson(
  _WorkDoneProgressParams instance,
) => <String, dynamic>{
  'workDoneToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.workDoneToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_PartialResultParams _$PartialResultParamsFromJson(Map<String, dynamic> json) =>
    _PartialResultParams(
      partialResultToken: _$JsonConverterFromJson<Object, ProgressToken>(
        json['partialResultToken'],
        const _ProgressTokenConverter().fromJson,
      ),
    );

Map<String, dynamic> _$PartialResultParamsToJson(
  _PartialResultParams instance,
) => <String, dynamic>{
  'partialResultToken': ?_$JsonConverterToJson<Object, ProgressToken>(
    instance.partialResultToken,
    const _ProgressTokenConverter().toJson,
  ),
};

_LocationLink _$LocationLinkFromJson(Map<String, dynamic> json) =>
    _LocationLink(
      originSelectionRange: json['originSelectionRange'] == null
          ? null
          : Range.fromJson(
              json['originSelectionRange'] as Map<String, dynamic>,
            ),
      targetUri: json['targetUri'] as String,
      targetRange: Range.fromJson(json['targetRange'] as Map<String, dynamic>),
      targetSelectionRange: Range.fromJson(
        json['targetSelectionRange'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LocationLinkToJson(_LocationLink instance) =>
    <String, dynamic>{
      'originSelectionRange': ?instance.originSelectionRange?.toJson(),
      'targetUri': instance.targetUri,
      'targetRange': instance.targetRange.toJson(),
      'targetSelectionRange': instance.targetSelectionRange.toJson(),
    };

_Range _$RangeFromJson(Map<String, dynamic> json) => _Range(
  start: Position.fromJson(json['start'] as Map<String, dynamic>),
  end: Position.fromJson(json['end'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RangeToJson(_Range instance) => <String, dynamic>{
  'start': instance.start.toJson(),
  'end': instance.end.toJson(),
};

_ImplementationOptions _$ImplementationOptionsFromJson(
  Map<String, dynamic> json,
) =>
    _ImplementationOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$ImplementationOptionsToJson(
  _ImplementationOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_StaticRegistrationOptions _$StaticRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) => _StaticRegistrationOptions(id: json['id'] as String?);

Map<String, dynamic> _$StaticRegistrationOptionsToJson(
  _StaticRegistrationOptions instance,
) => <String, dynamic>{'id': ?instance.id};

_TypeDefinitionOptions _$TypeDefinitionOptionsFromJson(
  Map<String, dynamic> json,
) =>
    _TypeDefinitionOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$TypeDefinitionOptionsToJson(
  _TypeDefinitionOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_WorkspaceFoldersChangeEvent _$WorkspaceFoldersChangeEventFromJson(
  Map<String, dynamic> json,
) => _WorkspaceFoldersChangeEvent(
  added: (json['added'] as List<dynamic>)
      .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
      .toList(),
  removed: (json['removed'] as List<dynamic>)
      .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkspaceFoldersChangeEventToJson(
  _WorkspaceFoldersChangeEvent instance,
) => <String, dynamic>{
  'added': instance.added.map((e) => e.toJson()).toList(),
  'removed': instance.removed.map((e) => e.toJson()).toList(),
};

_ConfigurationItem _$ConfigurationItemFromJson(Map<String, dynamic> json) =>
    _ConfigurationItem(
      scopeUri: json['scopeUri'] as String?,
      section: json['section'] as String?,
    );

Map<String, dynamic> _$ConfigurationItemToJson(_ConfigurationItem instance) =>
    <String, dynamic>{
      'scopeUri': ?instance.scopeUri,
      'section': ?instance.section,
    };

_TextDocumentIdentifier _$TextDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) => _TextDocumentIdentifier(uri: json['uri'] as String);

Map<String, dynamic> _$TextDocumentIdentifierToJson(
  _TextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri};

_Color _$ColorFromJson(Map<String, dynamic> json) => _Color(
  red: (json['red'] as num).toDouble(),
  green: (json['green'] as num).toDouble(),
  blue: (json['blue'] as num).toDouble(),
  alpha: (json['alpha'] as num).toDouble(),
);

Map<String, dynamic> _$ColorToJson(_Color instance) => <String, dynamic>{
  'red': instance.red,
  'green': instance.green,
  'blue': instance.blue,
  'alpha': instance.alpha,
};

_DocumentColorOptions _$DocumentColorOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentColorOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$DocumentColorOptionsToJson(
  _DocumentColorOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_FoldingRangeOptions _$FoldingRangeOptionsFromJson(Map<String, dynamic> json) =>
    _FoldingRangeOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$FoldingRangeOptionsToJson(
  _FoldingRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_DeclarationOptions _$DeclarationOptionsFromJson(Map<String, dynamic> json) =>
    _DeclarationOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$DeclarationOptionsToJson(_DeclarationOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_Position _$PositionFromJson(Map<String, dynamic> json) => _Position(
  line: (json['line'] as num).toInt(),
  character: (json['character'] as num).toInt(),
);

Map<String, dynamic> _$PositionToJson(_Position instance) => <String, dynamic>{
  'line': instance.line,
  'character': instance.character,
};

_SelectionRangeOptions _$SelectionRangeOptionsFromJson(
  Map<String, dynamic> json,
) =>
    _SelectionRangeOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$SelectionRangeOptionsToJson(
  _SelectionRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_CallHierarchyOptions _$CallHierarchyOptionsFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$CallHierarchyOptionsToJson(
  _CallHierarchyOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_SemanticTokensOptions _$SemanticTokensOptionsFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  legend: SemanticTokensLegend.fromJson(json['legend'] as Map<String, dynamic>),
  range: json['range'],
  full: json['full'],
);

Map<String, dynamic> _$SemanticTokensOptionsToJson(
  _SemanticTokensOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'legend': instance.legend.toJson(),
  'range': ?instance.range,
  'full': ?instance.full,
};

_SemanticTokensEdit _$SemanticTokensEditFromJson(Map<String, dynamic> json) =>
    _SemanticTokensEdit(
      start: (json['start'] as num).toInt(),
      deleteCount: (json['deleteCount'] as num).toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SemanticTokensEditToJson(_SemanticTokensEdit instance) =>
    <String, dynamic>{
      'start': instance.start,
      'deleteCount': instance.deleteCount,
      'data': ?instance.data,
    };

_LinkedEditingRangeOptions _$LinkedEditingRangeOptionsFromJson(
  Map<String, dynamic> json,
) => _LinkedEditingRangeOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$LinkedEditingRangeOptionsToJson(
  _LinkedEditingRangeOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_FileCreate _$FileCreateFromJson(Map<String, dynamic> json) =>
    _FileCreate(uri: json['uri'] as String);

Map<String, dynamic> _$FileCreateToJson(_FileCreate instance) =>
    <String, dynamic>{'uri': instance.uri};

_TextDocumentEdit _$TextDocumentEditFromJson(Map<String, dynamic> json) =>
    _TextDocumentEdit(
      textDocument: OptionalVersionedTextDocumentIdentifier.fromJson(
        json['textDocument'] as Map<String, dynamic>,
      ),
      edits: (json['edits'] as List<dynamic>).map((e) => e as Object).toList(),
    );

Map<String, dynamic> _$TextDocumentEditToJson(_TextDocumentEdit instance) =>
    <String, dynamic>{
      'textDocument': instance.textDocument.toJson(),
      'edits': instance.edits,
    };

_CreateFile _$CreateFileFromJson(Map<String, dynamic> json) => _CreateFile(
  annotationId: json['annotationId'] as String?,
  kind: json['kind'] as String,
  uri: json['uri'] as String,
  options: json['options'] == null
      ? null
      : CreateFileOptions.fromJson(json['options'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateFileToJson(_CreateFile instance) =>
    <String, dynamic>{
      'annotationId': ?instance.annotationId,
      'kind': instance.kind,
      'uri': instance.uri,
      'options': ?instance.options?.toJson(),
    };

_RenameFile _$RenameFileFromJson(Map<String, dynamic> json) => _RenameFile(
  annotationId: json['annotationId'] as String?,
  kind: json['kind'] as String,
  oldUri: json['oldUri'] as String,
  newUri: json['newUri'] as String,
  options: json['options'] == null
      ? null
      : RenameFileOptions.fromJson(json['options'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RenameFileToJson(_RenameFile instance) =>
    <String, dynamic>{
      'annotationId': ?instance.annotationId,
      'kind': instance.kind,
      'oldUri': instance.oldUri,
      'newUri': instance.newUri,
      'options': ?instance.options?.toJson(),
    };

_DeleteFile _$DeleteFileFromJson(Map<String, dynamic> json) => _DeleteFile(
  annotationId: json['annotationId'] as String?,
  kind: json['kind'] as String,
  uri: json['uri'] as String,
  options: json['options'] == null
      ? null
      : DeleteFileOptions.fromJson(json['options'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteFileToJson(_DeleteFile instance) =>
    <String, dynamic>{
      'annotationId': ?instance.annotationId,
      'kind': instance.kind,
      'uri': instance.uri,
      'options': ?instance.options?.toJson(),
    };

_ChangeAnnotation _$ChangeAnnotationFromJson(Map<String, dynamic> json) =>
    _ChangeAnnotation(
      label: json['label'] as String,
      needsConfirmation: json['needsConfirmation'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ChangeAnnotationToJson(_ChangeAnnotation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'needsConfirmation': ?instance.needsConfirmation,
      'description': ?instance.description,
    };

_FileOperationFilter _$FileOperationFilterFromJson(Map<String, dynamic> json) =>
    _FileOperationFilter(
      scheme: json['scheme'] as String?,
      pattern: FileOperationPattern.fromJson(
        json['pattern'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FileOperationFilterToJson(
  _FileOperationFilter instance,
) => <String, dynamic>{
  'scheme': ?instance.scheme,
  'pattern': instance.pattern.toJson(),
};

_FileRename _$FileRenameFromJson(Map<String, dynamic> json) => _FileRename(
  oldUri: json['oldUri'] as String,
  newUri: json['newUri'] as String,
);

Map<String, dynamic> _$FileRenameToJson(_FileRename instance) =>
    <String, dynamic>{'oldUri': instance.oldUri, 'newUri': instance.newUri};

_FileDelete _$FileDeleteFromJson(Map<String, dynamic> json) =>
    _FileDelete(uri: json['uri'] as String);

Map<String, dynamic> _$FileDeleteToJson(_FileDelete instance) =>
    <String, dynamic>{'uri': instance.uri};

_MonikerOptions _$MonikerOptionsFromJson(Map<String, dynamic> json) =>
    _MonikerOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$MonikerOptionsToJson(_MonikerOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_TypeHierarchyOptions _$TypeHierarchyOptionsFromJson(
  Map<String, dynamic> json,
) => _TypeHierarchyOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$TypeHierarchyOptionsToJson(
  _TypeHierarchyOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_InlineValueContext _$InlineValueContextFromJson(Map<String, dynamic> json) =>
    _InlineValueContext(
      frameId: (json['frameId'] as num).toInt(),
      stoppedLocation: Range.fromJson(
        json['stoppedLocation'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$InlineValueContextToJson(_InlineValueContext instance) =>
    <String, dynamic>{
      'frameId': instance.frameId,
      'stoppedLocation': instance.stoppedLocation.toJson(),
    };

_InlineValueText _$InlineValueTextFromJson(Map<String, dynamic> json) =>
    _InlineValueText(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$InlineValueTextToJson(_InlineValueText instance) =>
    <String, dynamic>{'range': instance.range.toJson(), 'text': instance.text};

_InlineValueVariableLookup _$InlineValueVariableLookupFromJson(
  Map<String, dynamic> json,
) => _InlineValueVariableLookup(
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
  variableName: json['variableName'] as String?,
  caseSensitiveLookup: json['caseSensitiveLookup'] as bool,
);

Map<String, dynamic> _$InlineValueVariableLookupToJson(
  _InlineValueVariableLookup instance,
) => <String, dynamic>{
  'range': instance.range.toJson(),
  'variableName': ?instance.variableName,
  'caseSensitiveLookup': instance.caseSensitiveLookup,
};

_InlineValueEvaluatableExpression _$InlineValueEvaluatableExpressionFromJson(
  Map<String, dynamic> json,
) => _InlineValueEvaluatableExpression(
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
  expression: json['expression'] as String?,
);

Map<String, dynamic> _$InlineValueEvaluatableExpressionToJson(
  _InlineValueEvaluatableExpression instance,
) => <String, dynamic>{
  'range': instance.range.toJson(),
  'expression': ?instance.expression,
};

_InlineValueOptions _$InlineValueOptionsFromJson(Map<String, dynamic> json) =>
    _InlineValueOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$InlineValueOptionsToJson(_InlineValueOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_InlayHintLabelPart _$InlayHintLabelPartFromJson(Map<String, dynamic> json) =>
    _InlayHintLabelPart(
      value: json['value'] as String,
      tooltip: json['tooltip'],
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlayHintLabelPartToJson(_InlayHintLabelPart instance) =>
    <String, dynamic>{
      'value': instance.value,
      'tooltip': ?instance.tooltip,
      'location': ?instance.location?.toJson(),
      'command': ?instance.command?.toJson(),
    };

_MarkupContent _$MarkupContentFromJson(Map<String, dynamic> json) =>
    _MarkupContent(
      kind: $enumDecode(_$MarkupKindEnumMap, json['kind']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$MarkupContentToJson(_MarkupContent instance) =>
    <String, dynamic>{
      'kind': _$MarkupKindEnumMap[instance.kind]!,
      'value': instance.value,
    };

const _$MarkupKindEnumMap = {
  MarkupKind.plainText: 'plaintext',
  MarkupKind.markdown: 'markdown',
};

_InlayHintOptions _$InlayHintOptionsFromJson(Map<String, dynamic> json) =>
    _InlayHintOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      resolveProvider: json['resolveProvider'] as bool?,
    );

Map<String, dynamic> _$InlayHintOptionsToJson(_InlayHintOptions instance) =>
    <String, dynamic>{
      'workDoneProgress': ?instance.workDoneProgress,
      'resolveProvider': ?instance.resolveProvider,
    };

_RelatedFullDocumentDiagnosticReport
_$RelatedFullDocumentDiagnosticReportFromJson(Map<String, dynamic> json) =>
    _RelatedFullDocumentDiagnosticReport(
      kind: json['kind'] as String,
      resultId: json['resultId'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedDocuments: (json['relatedDocuments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as Object)),
    );

Map<String, dynamic> _$RelatedFullDocumentDiagnosticReportToJson(
  _RelatedFullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': ?instance.resultId,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'relatedDocuments': ?instance.relatedDocuments,
};

_RelatedUnchangedDocumentDiagnosticReport
_$RelatedUnchangedDocumentDiagnosticReportFromJson(Map<String, dynamic> json) =>
    _RelatedUnchangedDocumentDiagnosticReport(
      kind: json['kind'] as String,
      resultId: json['resultId'] as String,
      relatedDocuments: (json['relatedDocuments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as Object)),
    );

Map<String, dynamic> _$RelatedUnchangedDocumentDiagnosticReportToJson(
  _RelatedUnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': instance.resultId,
  'relatedDocuments': ?instance.relatedDocuments,
};

_FullDocumentDiagnosticReport _$FullDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => _FullDocumentDiagnosticReport(
  kind: json['kind'] as String,
  resultId: json['resultId'] as String?,
  items: (json['items'] as List<dynamic>)
      .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FullDocumentDiagnosticReportToJson(
  _FullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': ?instance.resultId,
  'items': instance.items.map((e) => e.toJson()).toList(),
};

_UnchangedDocumentDiagnosticReport _$UnchangedDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => _UnchangedDocumentDiagnosticReport(
  kind: json['kind'] as String,
  resultId: json['resultId'] as String,
);

Map<String, dynamic> _$UnchangedDocumentDiagnosticReportToJson(
  _UnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{'kind': instance.kind, 'resultId': instance.resultId};

_DiagnosticOptions _$DiagnosticOptionsFromJson(Map<String, dynamic> json) =>
    _DiagnosticOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      identifier: json['identifier'] as String?,
      interFileDependencies: json['interFileDependencies'] as bool,
      workspaceDiagnostics: json['workspaceDiagnostics'] as bool,
    );

Map<String, dynamic> _$DiagnosticOptionsToJson(_DiagnosticOptions instance) =>
    <String, dynamic>{
      'workDoneProgress': ?instance.workDoneProgress,
      'identifier': ?instance.identifier,
      'interFileDependencies': instance.interFileDependencies,
      'workspaceDiagnostics': instance.workspaceDiagnostics,
    };

_PreviousResultId _$PreviousResultIdFromJson(Map<String, dynamic> json) =>
    _PreviousResultId(
      uri: json['uri'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$PreviousResultIdToJson(_PreviousResultId instance) =>
    <String, dynamic>{'uri': instance.uri, 'value': instance.value};

_NotebookDocument _$NotebookDocumentFromJson(Map<String, dynamic> json) =>
    _NotebookDocument(
      uri: json['uri'] as String,
      notebookType: json['notebookType'] as String,
      version: (json['version'] as num).toInt(),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      cells: (json['cells'] as List<dynamic>)
          .map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotebookDocumentToJson(_NotebookDocument instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'notebookType': instance.notebookType,
      'version': instance.version,
      'metadata': ?instance.metadata,
      'cells': instance.cells.map((e) => e.toJson()).toList(),
    };

_TextDocumentItem _$TextDocumentItemFromJson(Map<String, dynamic> json) =>
    _TextDocumentItem(
      uri: json['uri'] as String,
      languageId: json['languageId'] as String,
      version: (json['version'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$TextDocumentItemToJson(_TextDocumentItem instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'languageId': instance.languageId,
      'version': instance.version,
      'text': instance.text,
    };

_VersionedNotebookDocumentIdentifier
_$VersionedNotebookDocumentIdentifierFromJson(Map<String, dynamic> json) =>
    _VersionedNotebookDocumentIdentifier(
      version: (json['version'] as num).toInt(),
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$VersionedNotebookDocumentIdentifierToJson(
  _VersionedNotebookDocumentIdentifier instance,
) => <String, dynamic>{'version': instance.version, 'uri': instance.uri};

_NotebookDocumentChangeEvent _$NotebookDocumentChangeEventFromJson(
  Map<String, dynamic> json,
) => _NotebookDocumentChangeEvent(
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as Object),
  ),
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
                (e) =>
                    TextDocumentIdentifier.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
          didOpen: ($jsonValue['didOpen'] as List<dynamic>?)
              ?.map((e) => TextDocumentItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
      textContent: ($jsonValue['textContent'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$NotebookDocumentChangeEventToJson(
  _NotebookDocumentChangeEvent instance,
) => <String, dynamic>{
  'metadata': ?instance.metadata,
  'cells': ?instance.cells == null
      ? null
      : <String, dynamic>{
          'data': instance.cells!.data?.map((e) => e.toJson()).toList(),
          'structure': instance.cells!.structure == null
              ? null
              : <String, dynamic>{
                  'array': instance.cells!.structure!.array.toJson(),
                  'didClose': instance.cells!.structure!.didClose
                      ?.map((e) => e.toJson())
                      .toList(),
                  'didOpen': instance.cells!.structure!.didOpen
                      ?.map((e) => e.toJson())
                      .toList(),
                },
          'textContent': instance.cells!.textContent,
        },
};

_NotebookDocumentIdentifier _$NotebookDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) => _NotebookDocumentIdentifier(uri: json['uri'] as String);

Map<String, dynamic> _$NotebookDocumentIdentifierToJson(
  _NotebookDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri};

_InlineCompletionContext _$InlineCompletionContextFromJson(
  Map<String, dynamic> json,
) => _InlineCompletionContext(
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

Map<String, dynamic> _$InlineCompletionContextToJson(
  _InlineCompletionContext instance,
) => <String, dynamic>{
  'triggerKind': _$InlineCompletionTriggerKindEnumMap[instance.triggerKind]!,
  'selectedCompletionInfo': ?instance.selectedCompletionInfo?.toJson(),
};

const _$InlineCompletionTriggerKindEnumMap = {
  InlineCompletionTriggerKind.invoked: 0,
  InlineCompletionTriggerKind.automatic: 1,
};

_StringValue _$StringValueFromJson(Map<String, dynamic> json) =>
    _StringValue(kind: json['kind'] as String, value: json['value'] as String);

Map<String, dynamic> _$StringValueToJson(_StringValue instance) =>
    <String, dynamic>{'kind': instance.kind, 'value': instance.value};

_InlineCompletionOptions _$InlineCompletionOptionsFromJson(
  Map<String, dynamic> json,
) => _InlineCompletionOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$InlineCompletionOptionsToJson(
  _InlineCompletionOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_Registration _$RegistrationFromJson(Map<String, dynamic> json) =>
    _Registration(
      id: json['id'] as String,
      method: json['method'] as String,
      registerOptions: json['registerOptions'],
    );

Map<String, dynamic> _$RegistrationToJson(_Registration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'registerOptions': ?instance.registerOptions,
    };

_Unregistration _$UnregistrationFromJson(Map<String, dynamic> json) =>
    _Unregistration(id: json['id'] as String, method: json['method'] as String);

Map<String, dynamic> _$UnregistrationToJson(_Unregistration instance) =>
    <String, dynamic>{'id': instance.id, 'method': instance.method};

_WorkspaceFoldersInitializeParams _$WorkspaceFoldersInitializeParamsFromJson(
  Map<String, dynamic> json,
) => _WorkspaceFoldersInitializeParams(
  workspaceFolders: (json['workspaceFolders'] as List<dynamic>?)
      ?.map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkspaceFoldersInitializeParamsToJson(
  _WorkspaceFoldersInitializeParams instance,
) => <String, dynamic>{
  'workspaceFolders': ?instance.workspaceFolders
      ?.map((e) => e.toJson())
      .toList(),
};

_ServerCapabilities _$ServerCapabilitiesFromJson(Map<String, dynamic> json) =>
    _ServerCapabilities(
      positionEncoding: json['positionEncoding'] == null
          ? null
          : PositionEncodingKind.fromJson(json['positionEncoding']),
      textDocumentSync: json['textDocumentSync'],
      notebookDocumentSync: json['notebookDocumentSync'],
      completionProvider: json['completionProvider'] == null
          ? null
          : CompletionOptions.fromJson(
              json['completionProvider'] as Map<String, dynamic>,
            ),
      hoverProvider: json['hoverProvider'],
      signatureHelpProvider: json['signatureHelpProvider'] == null
          ? null
          : SignatureHelpOptions.fromJson(
              json['signatureHelpProvider'] as Map<String, dynamic>,
            ),
      declarationProvider: json['declarationProvider'],
      definitionProvider: json['definitionProvider'],
      typeDefinitionProvider: json['typeDefinitionProvider'],
      implementationProvider: json['implementationProvider'],
      referencesProvider: json['referencesProvider'],
      documentHighlightProvider: json['documentHighlightProvider'],
      documentSymbolProvider: json['documentSymbolProvider'],
      codeActionProvider: json['codeActionProvider'],
      codeLensProvider: json['codeLensProvider'] == null
          ? null
          : CodeLensOptions.fromJson(
              json['codeLensProvider'] as Map<String, dynamic>,
            ),
      documentLinkProvider: json['documentLinkProvider'] == null
          ? null
          : DocumentLinkOptions.fromJson(
              json['documentLinkProvider'] as Map<String, dynamic>,
            ),
      colorProvider: json['colorProvider'],
      workspaceSymbolProvider: json['workspaceSymbolProvider'],
      documentFormattingProvider: json['documentFormattingProvider'],
      documentRangeFormattingProvider: json['documentRangeFormattingProvider'],
      documentOnTypeFormattingProvider:
          json['documentOnTypeFormattingProvider'] == null
          ? null
          : DocumentOnTypeFormattingOptions.fromJson(
              json['documentOnTypeFormattingProvider'] as Map<String, dynamic>,
            ),
      renameProvider: json['renameProvider'],
      foldingRangeProvider: json['foldingRangeProvider'],
      selectionRangeProvider: json['selectionRangeProvider'],
      executeCommandProvider: json['executeCommandProvider'] == null
          ? null
          : ExecuteCommandOptions.fromJson(
              json['executeCommandProvider'] as Map<String, dynamic>,
            ),
      callHierarchyProvider: json['callHierarchyProvider'],
      linkedEditingRangeProvider: json['linkedEditingRangeProvider'],
      semanticTokensProvider: json['semanticTokensProvider'],
      monikerProvider: json['monikerProvider'],
      typeHierarchyProvider: json['typeHierarchyProvider'],
      inlineValueProvider: json['inlineValueProvider'],
      inlayHintProvider: json['inlayHintProvider'],
      diagnosticProvider: json['diagnosticProvider'],
      inlineCompletionProvider: json['inlineCompletionProvider'],
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
      experimental: json['experimental'],
    );

Map<String, dynamic> _$ServerCapabilitiesToJson(
  _ServerCapabilities instance,
) => <String, dynamic>{
  'positionEncoding': ?instance.positionEncoding?.toJson(),
  'textDocumentSync': ?instance.textDocumentSync,
  'notebookDocumentSync': ?instance.notebookDocumentSync,
  'completionProvider': ?instance.completionProvider?.toJson(),
  'hoverProvider': ?instance.hoverProvider,
  'signatureHelpProvider': ?instance.signatureHelpProvider?.toJson(),
  'declarationProvider': ?instance.declarationProvider,
  'definitionProvider': ?instance.definitionProvider,
  'typeDefinitionProvider': ?instance.typeDefinitionProvider,
  'implementationProvider': ?instance.implementationProvider,
  'referencesProvider': ?instance.referencesProvider,
  'documentHighlightProvider': ?instance.documentHighlightProvider,
  'documentSymbolProvider': ?instance.documentSymbolProvider,
  'codeActionProvider': ?instance.codeActionProvider,
  'codeLensProvider': ?instance.codeLensProvider?.toJson(),
  'documentLinkProvider': ?instance.documentLinkProvider?.toJson(),
  'colorProvider': ?instance.colorProvider,
  'workspaceSymbolProvider': ?instance.workspaceSymbolProvider,
  'documentFormattingProvider': ?instance.documentFormattingProvider,
  'documentRangeFormattingProvider': ?instance.documentRangeFormattingProvider,
  'documentOnTypeFormattingProvider': ?instance.documentOnTypeFormattingProvider
      ?.toJson(),
  'renameProvider': ?instance.renameProvider,
  'foldingRangeProvider': ?instance.foldingRangeProvider,
  'selectionRangeProvider': ?instance.selectionRangeProvider,
  'executeCommandProvider': ?instance.executeCommandProvider?.toJson(),
  'callHierarchyProvider': ?instance.callHierarchyProvider,
  'linkedEditingRangeProvider': ?instance.linkedEditingRangeProvider,
  'semanticTokensProvider': ?instance.semanticTokensProvider,
  'monikerProvider': ?instance.monikerProvider,
  'typeHierarchyProvider': ?instance.typeHierarchyProvider,
  'inlineValueProvider': ?instance.inlineValueProvider,
  'inlayHintProvider': ?instance.inlayHintProvider,
  'diagnosticProvider': ?instance.diagnosticProvider,
  'inlineCompletionProvider': ?instance.inlineCompletionProvider,
  'workspace': ?instance.workspace == null
      ? null
      : <String, dynamic>{
          'fileOperations': instance.workspace!.fileOperations?.toJson(),
          'workspaceFolders': instance.workspace!.workspaceFolders?.toJson(),
        },
  'experimental': ?instance.experimental,
};

_VersionedTextDocumentIdentifier _$VersionedTextDocumentIdentifierFromJson(
  Map<String, dynamic> json,
) => _VersionedTextDocumentIdentifier(
  uri: json['uri'] as String,
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$VersionedTextDocumentIdentifierToJson(
  _VersionedTextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri, 'version': instance.version};

_SaveOptions _$SaveOptionsFromJson(Map<String, dynamic> json) =>
    _SaveOptions(includeText: json['includeText'] as bool?);

Map<String, dynamic> _$SaveOptionsToJson(_SaveOptions instance) =>
    <String, dynamic>{'includeText': ?instance.includeText};

_FileEvent _$FileEventFromJson(Map<String, dynamic> json) => _FileEvent(
  uri: json['uri'] as String,
  type: $enumDecode(_$FileChangeTypeEnumMap, json['type']),
);

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

_FileSystemWatcher _$FileSystemWatcherFromJson(Map<String, dynamic> json) =>
    _FileSystemWatcher(
      globPattern: json['globPattern'] as Object,
      kind: json['kind'] == null ? null : WatchKind.fromJson(json['kind']),
    );

Map<String, dynamic> _$FileSystemWatcherToJson(_FileSystemWatcher instance) =>
    <String, dynamic>{
      'globPattern': instance.globPattern,
      'kind': ?instance.kind?.toJson(),
    };

_Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) => _Diagnostic(
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
  severity: $enumDecodeNullable(_$DiagnosticSeverityEnumMap, json['severity']),
  code: json['code'],
  codeDescription: json['codeDescription'] == null
      ? null
      : CodeDescription.fromJson(
          json['codeDescription'] as Map<String, dynamic>,
        ),
  source: json['source'] as String?,
  message: json['message'] as String,
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$DiagnosticTagEnumMap, e))
      .toList(),
  relatedInformation: (json['relatedInformation'] as List<dynamic>?)
      ?.map(
        (e) => DiagnosticRelatedInformation.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  data: json['data'],
);

Map<String, dynamic> _$DiagnosticToJson(_Diagnostic instance) =>
    <String, dynamic>{
      'range': instance.range.toJson(),
      'severity': ?_$DiagnosticSeverityEnumMap[instance.severity],
      'code': ?instance.code,
      'codeDescription': ?instance.codeDescription?.toJson(),
      'source': ?instance.source,
      'message': instance.message,
      'tags': ?instance.tags?.map((e) => _$DiagnosticTagEnumMap[e]!).toList(),
      'relatedInformation': ?instance.relatedInformation
          ?.map((e) => e.toJson())
          .toList(),
      'data': ?instance.data,
    };

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.error: 1,
  DiagnosticSeverity.warning: 2,
  DiagnosticSeverity.information: 3,
  DiagnosticSeverity.hint: 4,
};

const _$DiagnosticTagEnumMap = {
  DiagnosticTag.unnecessary: 1,
  DiagnosticTag.deprecated: 2,
};

_CompletionContext _$CompletionContextFromJson(Map<String, dynamic> json) =>
    _CompletionContext(
      triggerKind: $enumDecode(
        _$CompletionTriggerKindEnumMap,
        json['triggerKind'],
      ),
      triggerCharacter: json['triggerCharacter'] as String?,
    );

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
) => _CompletionItemLabelDetails(
  detail: json['detail'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$CompletionItemLabelDetailsToJson(
  _CompletionItemLabelDetails instance,
) => <String, dynamic>{
  'detail': ?instance.detail,
  'description': ?instance.description,
};

_InsertReplaceEdit _$InsertReplaceEditFromJson(Map<String, dynamic> json) =>
    _InsertReplaceEdit(
      newText: json['newText'] as String,
      insert: Range.fromJson(json['insert'] as Map<String, dynamic>),
      replace: Range.fromJson(json['replace'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InsertReplaceEditToJson(_InsertReplaceEdit instance) =>
    <String, dynamic>{
      'newText': instance.newText,
      'insert': instance.insert.toJson(),
      'replace': instance.replace.toJson(),
    };

_CompletionOptions _$CompletionOptionsFromJson(Map<String, dynamic> json) =>
    _CompletionOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allCommitCharacters: (json['allCommitCharacters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      resolveProvider: json['resolveProvider'] as bool?,
      completionItem: _$recordConvertNullable(
        json['completionItem'],
        ($jsonValue) =>
            (labelDetailsSupport: $jsonValue['labelDetailsSupport'] as bool?),
      ),
    );

Map<String, dynamic> _$CompletionOptionsToJson(
  _CompletionOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'triggerCharacters': ?instance.triggerCharacters,
  'allCommitCharacters': ?instance.allCommitCharacters,
  'resolveProvider': ?instance.resolveProvider,
  'completionItem': ?instance.completionItem == null
      ? null
      : <String, dynamic>{
          'labelDetailsSupport': instance.completionItem!.labelDetailsSupport,
        },
};

_HoverOptions _$HoverOptionsFromJson(Map<String, dynamic> json) =>
    _HoverOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$HoverOptionsToJson(_HoverOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_SignatureHelpContext _$SignatureHelpContextFromJson(
  Map<String, dynamic> json,
) => _SignatureHelpContext(
  triggerKind: $enumDecode(
    _$SignatureHelpTriggerKindEnumMap,
    json['triggerKind'],
  ),
  triggerCharacter: json['triggerCharacter'] as String?,
  isRetrigger: json['isRetrigger'] as bool,
  activeSignatureHelp: json['activeSignatureHelp'] == null
      ? null
      : SignatureHelp.fromJson(
          json['activeSignatureHelp'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SignatureHelpContextToJson(
  _SignatureHelpContext instance,
) => <String, dynamic>{
  'triggerKind': _$SignatureHelpTriggerKindEnumMap[instance.triggerKind]!,
  'triggerCharacter': ?instance.triggerCharacter,
  'isRetrigger': instance.isRetrigger,
  'activeSignatureHelp': ?instance.activeSignatureHelp?.toJson(),
};

const _$SignatureHelpTriggerKindEnumMap = {
  SignatureHelpTriggerKind.invoked: 1,
  SignatureHelpTriggerKind.triggerCharacter: 2,
  SignatureHelpTriggerKind.contentChange: 3,
};

_SignatureInformation _$SignatureInformationFromJson(
  Map<String, dynamic> json,
) => _SignatureInformation(
  label: json['label'] as String,
  documentation: json['documentation'],
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map((e) => ParameterInformation.fromJson(e as Map<String, dynamic>))
      .toList(),
  activeParameter: (json['activeParameter'] as num?)?.toInt(),
);

Map<String, dynamic> _$SignatureInformationToJson(
  _SignatureInformation instance,
) => <String, dynamic>{
  'label': instance.label,
  'documentation': ?instance.documentation,
  'parameters': ?instance.parameters?.map((e) => e.toJson()).toList(),
  'activeParameter': ?instance.activeParameter,
};

_SignatureHelpOptions _$SignatureHelpOptionsFromJson(
  Map<String, dynamic> json,
) => _SignatureHelpOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  triggerCharacters: (json['triggerCharacters'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  retriggerCharacters: (json['retriggerCharacters'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SignatureHelpOptionsToJson(
  _SignatureHelpOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'triggerCharacters': ?instance.triggerCharacters,
  'retriggerCharacters': ?instance.retriggerCharacters,
};

_DefinitionOptions _$DefinitionOptionsFromJson(Map<String, dynamic> json) =>
    _DefinitionOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$DefinitionOptionsToJson(_DefinitionOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_ReferenceContext _$ReferenceContextFromJson(Map<String, dynamic> json) =>
    _ReferenceContext(includeDeclaration: json['includeDeclaration'] as bool);

Map<String, dynamic> _$ReferenceContextToJson(_ReferenceContext instance) =>
    <String, dynamic>{'includeDeclaration': instance.includeDeclaration};

_ReferenceOptions _$ReferenceOptionsFromJson(Map<String, dynamic> json) =>
    _ReferenceOptions(workDoneProgress: json['workDoneProgress'] as bool?);

Map<String, dynamic> _$ReferenceOptionsToJson(_ReferenceOptions instance) =>
    <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_DocumentHighlightOptions _$DocumentHighlightOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentHighlightOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$DocumentHighlightOptionsToJson(
  _DocumentHighlightOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_BaseSymbolInformation _$BaseSymbolInformationFromJson(
  Map<String, dynamic> json,
) => _BaseSymbolInformation(
  name: json['name'] as String,
  kind: $enumDecode(_$SymbolKindEnumMap, json['kind']),
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$SymbolTagEnumMap, e))
      .toList(),
  containerName: json['containerName'] as String?,
);

Map<String, dynamic> _$BaseSymbolInformationToJson(
  _BaseSymbolInformation instance,
) => <String, dynamic>{
  'name': instance.name,
  'kind': _$SymbolKindEnumMap[instance.kind]!,
  'tags': ?instance.tags?.map((e) => _$SymbolTagEnumMap[e]!).toList(),
  'containerName': ?instance.containerName,
};

_DocumentSymbolOptions _$DocumentSymbolOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentSymbolOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  label: json['label'] as String?,
);

Map<String, dynamic> _$DocumentSymbolOptionsToJson(
  _DocumentSymbolOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'label': ?instance.label,
};

_CodeActionContext _$CodeActionContextFromJson(Map<String, dynamic> json) =>
    _CodeActionContext(
      diagnostics: (json['diagnostics'] as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      only: (json['only'] as List<dynamic>?)
          ?.map(CodeActionKind.fromJson)
          .toList(),
      triggerKind: $enumDecodeNullable(
        _$CodeActionTriggerKindEnumMap,
        json['triggerKind'],
      ),
    );

Map<String, dynamic> _$CodeActionContextToJson(_CodeActionContext instance) =>
    <String, dynamic>{
      'diagnostics': instance.diagnostics.map((e) => e.toJson()).toList(),
      'only': ?instance.only?.map((e) => e.toJson()).toList(),
      'triggerKind': ?_$CodeActionTriggerKindEnumMap[instance.triggerKind],
    };

const _$CodeActionTriggerKindEnumMap = {
  CodeActionTriggerKind.invoked: 1,
  CodeActionTriggerKind.automatic: 2,
};

_CodeActionOptions _$CodeActionOptionsFromJson(Map<String, dynamic> json) =>
    _CodeActionOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      codeActionKinds: (json['codeActionKinds'] as List<dynamic>?)
          ?.map(CodeActionKind.fromJson)
          .toList(),
      resolveProvider: json['resolveProvider'] as bool?,
    );

Map<String, dynamic> _$CodeActionOptionsToJson(
  _CodeActionOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'codeActionKinds': ?instance.codeActionKinds?.map((e) => e.toJson()).toList(),
  'resolveProvider': ?instance.resolveProvider,
};

_WorkspaceSymbolOptions _$WorkspaceSymbolOptionsFromJson(
  Map<String, dynamic> json,
) => _WorkspaceSymbolOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  resolveProvider: json['resolveProvider'] as bool?,
);

Map<String, dynamic> _$WorkspaceSymbolOptionsToJson(
  _WorkspaceSymbolOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'resolveProvider': ?instance.resolveProvider,
};

_CodeLensOptions _$CodeLensOptionsFromJson(Map<String, dynamic> json) =>
    _CodeLensOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      resolveProvider: json['resolveProvider'] as bool?,
    );

Map<String, dynamic> _$CodeLensOptionsToJson(_CodeLensOptions instance) =>
    <String, dynamic>{
      'workDoneProgress': ?instance.workDoneProgress,
      'resolveProvider': ?instance.resolveProvider,
    };

_DocumentLinkOptions _$DocumentLinkOptionsFromJson(Map<String, dynamic> json) =>
    _DocumentLinkOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      resolveProvider: json['resolveProvider'] as bool?,
    );

Map<String, dynamic> _$DocumentLinkOptionsToJson(
  _DocumentLinkOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'resolveProvider': ?instance.resolveProvider,
};

_FormattingOptions _$FormattingOptionsFromJson(Map<String, dynamic> json) =>
    _FormattingOptions(
      tabSize: (json['tabSize'] as num).toInt(),
      insertSpaces: json['insertSpaces'] as bool,
      trimTrailingWhitespace: json['trimTrailingWhitespace'] as bool?,
      insertFinalNewline: json['insertFinalNewline'] as bool?,
      trimFinalNewlines: json['trimFinalNewlines'] as bool?,
    );

Map<String, dynamic> _$FormattingOptionsToJson(_FormattingOptions instance) =>
    <String, dynamic>{
      'tabSize': instance.tabSize,
      'insertSpaces': instance.insertSpaces,
      'trimTrailingWhitespace': ?instance.trimTrailingWhitespace,
      'insertFinalNewline': ?instance.insertFinalNewline,
      'trimFinalNewlines': ?instance.trimFinalNewlines,
    };

_DocumentFormattingOptions _$DocumentFormattingOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentFormattingOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
);

Map<String, dynamic> _$DocumentFormattingOptionsToJson(
  _DocumentFormattingOptions instance,
) => <String, dynamic>{'workDoneProgress': ?instance.workDoneProgress};

_DocumentRangeFormattingOptions _$DocumentRangeFormattingOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentRangeFormattingOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  rangesSupport: json['rangesSupport'] as bool?,
);

Map<String, dynamic> _$DocumentRangeFormattingOptionsToJson(
  _DocumentRangeFormattingOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'rangesSupport': ?instance.rangesSupport,
};

_DocumentOnTypeFormattingOptions _$DocumentOnTypeFormattingOptionsFromJson(
  Map<String, dynamic> json,
) => _DocumentOnTypeFormattingOptions(
  firstTriggerCharacter: json['firstTriggerCharacter'] as String,
  moreTriggerCharacter: (json['moreTriggerCharacter'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$DocumentOnTypeFormattingOptionsToJson(
  _DocumentOnTypeFormattingOptions instance,
) => <String, dynamic>{
  'firstTriggerCharacter': instance.firstTriggerCharacter,
  'moreTriggerCharacter': ?instance.moreTriggerCharacter,
};

_RenameOptions _$RenameOptionsFromJson(Map<String, dynamic> json) =>
    _RenameOptions(
      workDoneProgress: json['workDoneProgress'] as bool?,
      prepareProvider: json['prepareProvider'] as bool?,
    );

Map<String, dynamic> _$RenameOptionsToJson(_RenameOptions instance) =>
    <String, dynamic>{
      'workDoneProgress': ?instance.workDoneProgress,
      'prepareProvider': ?instance.prepareProvider,
    };

_ExecuteCommandOptions _$ExecuteCommandOptionsFromJson(
  Map<String, dynamic> json,
) => _ExecuteCommandOptions(
  workDoneProgress: json['workDoneProgress'] as bool?,
  commands: (json['commands'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ExecuteCommandOptionsToJson(
  _ExecuteCommandOptions instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'commands': instance.commands,
};

_SemanticTokensLegend _$SemanticTokensLegendFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensLegend(
  tokenTypes: (json['tokenTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tokenModifiers: (json['tokenModifiers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SemanticTokensLegendToJson(
  _SemanticTokensLegend instance,
) => <String, dynamic>{
  'tokenTypes': instance.tokenTypes,
  'tokenModifiers': instance.tokenModifiers,
};

_OptionalVersionedTextDocumentIdentifier
_$OptionalVersionedTextDocumentIdentifierFromJson(Map<String, dynamic> json) =>
    _OptionalVersionedTextDocumentIdentifier(
      uri: json['uri'] as String,
      version: (json['version'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OptionalVersionedTextDocumentIdentifierToJson(
  _OptionalVersionedTextDocumentIdentifier instance,
) => <String, dynamic>{'uri': instance.uri, 'version': ?instance.version};

_AnnotatedTextEdit _$AnnotatedTextEditFromJson(Map<String, dynamic> json) =>
    _AnnotatedTextEdit(
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
      newText: json['newText'] as String,
      annotationId: json['annotationId'] as String,
    );

Map<String, dynamic> _$AnnotatedTextEditToJson(_AnnotatedTextEdit instance) =>
    <String, dynamic>{
      'range': instance.range.toJson(),
      'newText': instance.newText,
      'annotationId': instance.annotationId,
    };

_ResourceOperation _$ResourceOperationFromJson(Map<String, dynamic> json) =>
    _ResourceOperation(
      kind: json['kind'] as String,
      annotationId: json['annotationId'] as String?,
    );

Map<String, dynamic> _$ResourceOperationToJson(_ResourceOperation instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'annotationId': ?instance.annotationId,
    };

_CreateFileOptions _$CreateFileOptionsFromJson(Map<String, dynamic> json) =>
    _CreateFileOptions(
      overwrite: json['overwrite'] as bool?,
      ignoreIfExists: json['ignoreIfExists'] as bool?,
    );

Map<String, dynamic> _$CreateFileOptionsToJson(_CreateFileOptions instance) =>
    <String, dynamic>{
      'overwrite': ?instance.overwrite,
      'ignoreIfExists': ?instance.ignoreIfExists,
    };

_RenameFileOptions _$RenameFileOptionsFromJson(Map<String, dynamic> json) =>
    _RenameFileOptions(
      overwrite: json['overwrite'] as bool?,
      ignoreIfExists: json['ignoreIfExists'] as bool?,
    );

Map<String, dynamic> _$RenameFileOptionsToJson(_RenameFileOptions instance) =>
    <String, dynamic>{
      'overwrite': ?instance.overwrite,
      'ignoreIfExists': ?instance.ignoreIfExists,
    };

_DeleteFileOptions _$DeleteFileOptionsFromJson(Map<String, dynamic> json) =>
    _DeleteFileOptions(
      recursive: json['recursive'] as bool?,
      ignoreIfNotExists: json['ignoreIfNotExists'] as bool?,
    );

Map<String, dynamic> _$DeleteFileOptionsToJson(_DeleteFileOptions instance) =>
    <String, dynamic>{
      'recursive': ?instance.recursive,
      'ignoreIfNotExists': ?instance.ignoreIfNotExists,
    };

_FileOperationPattern _$FileOperationPatternFromJson(
  Map<String, dynamic> json,
) => _FileOperationPattern(
  glob: json['glob'] as String,
  matches: $enumDecodeNullable(
    _$FileOperationPatternKindEnumMap,
    json['matches'],
  ),
  options: json['options'] == null
      ? null
      : FileOperationPatternOptions.fromJson(
          json['options'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FileOperationPatternToJson(
  _FileOperationPattern instance,
) => <String, dynamic>{
  'glob': instance.glob,
  'matches': ?_$FileOperationPatternKindEnumMap[instance.matches],
  'options': ?instance.options?.toJson(),
};

const _$FileOperationPatternKindEnumMap = {
  FileOperationPatternKind.file: 'file',
  FileOperationPatternKind.folder: 'folder',
};

_WorkspaceFullDocumentDiagnosticReport
_$WorkspaceFullDocumentDiagnosticReportFromJson(Map<String, dynamic> json) =>
    _WorkspaceFullDocumentDiagnosticReport(
      kind: json['kind'] as String,
      resultId: json['resultId'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      uri: json['uri'] as String,
      version: (json['version'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WorkspaceFullDocumentDiagnosticReportToJson(
  _WorkspaceFullDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': ?instance.resultId,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'uri': instance.uri,
  'version': ?instance.version,
};

_WorkspaceUnchangedDocumentDiagnosticReport
_$WorkspaceUnchangedDocumentDiagnosticReportFromJson(
  Map<String, dynamic> json,
) => _WorkspaceUnchangedDocumentDiagnosticReport(
  kind: json['kind'] as String,
  resultId: json['resultId'] as String,
  uri: json['uri'] as String,
  version: (json['version'] as num?)?.toInt(),
);

Map<String, dynamic> _$WorkspaceUnchangedDocumentDiagnosticReportToJson(
  _WorkspaceUnchangedDocumentDiagnosticReport instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'resultId': instance.resultId,
  'uri': instance.uri,
  'version': ?instance.version,
};

_NotebookCell _$NotebookCellFromJson(Map<String, dynamic> json) =>
    _NotebookCell(
      kind: $enumDecode(_$NotebookCellKindEnumMap, json['kind']),
      document: json['document'] as String,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      executionSummary: json['executionSummary'] == null
          ? null
          : ExecutionSummary.fromJson(
              json['executionSummary'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$NotebookCellToJson(_NotebookCell instance) =>
    <String, dynamic>{
      'kind': _$NotebookCellKindEnumMap[instance.kind]!,
      'document': instance.document,
      'metadata': ?instance.metadata,
      'executionSummary': ?instance.executionSummary?.toJson(),
    };

const _$NotebookCellKindEnumMap = {
  NotebookCellKind.markup: 1,
  NotebookCellKind.code: 2,
};

_NotebookCellArrayChange _$NotebookCellArrayChangeFromJson(
  Map<String, dynamic> json,
) => _NotebookCellArrayChange(
  start: (json['start'] as num).toInt(),
  deleteCount: (json['deleteCount'] as num).toInt(),
  cells: (json['cells'] as List<dynamic>?)
      ?.map((e) => NotebookCell.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NotebookCellArrayChangeToJson(
  _NotebookCellArrayChange instance,
) => <String, dynamic>{
  'start': instance.start,
  'deleteCount': instance.deleteCount,
  'cells': ?instance.cells?.map((e) => e.toJson()).toList(),
};

_SelectedCompletionInfo _$SelectedCompletionInfoFromJson(
  Map<String, dynamic> json,
) => _SelectedCompletionInfo(
  range: Range.fromJson(json['range'] as Map<String, dynamic>),
  text: json['text'] as String,
);

Map<String, dynamic> _$SelectedCompletionInfoToJson(
  _SelectedCompletionInfo instance,
) => <String, dynamic>{'range': instance.range.toJson(), 'text': instance.text};

_ClientCapabilities _$ClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _ClientCapabilities(
      workspace: json['workspace'] == null
          ? null
          : WorkspaceClientCapabilities.fromJson(
              json['workspace'] as Map<String, dynamic>,
            ),
      textDocument: json['textDocument'] == null
          ? null
          : TextDocumentClientCapabilities.fromJson(
              json['textDocument'] as Map<String, dynamic>,
            ),
      notebookDocument: json['notebookDocument'] == null
          ? null
          : NotebookDocumentClientCapabilities.fromJson(
              json['notebookDocument'] as Map<String, dynamic>,
            ),
      window: json['window'] == null
          ? null
          : WindowClientCapabilities.fromJson(
              json['window'] as Map<String, dynamic>,
            ),
      general: json['general'] == null
          ? null
          : GeneralClientCapabilities.fromJson(
              json['general'] as Map<String, dynamic>,
            ),
      experimental: json['experimental'],
    );

Map<String, dynamic> _$ClientCapabilitiesToJson(_ClientCapabilities instance) =>
    <String, dynamic>{
      'workspace': ?instance.workspace?.toJson(),
      'textDocument': ?instance.textDocument?.toJson(),
      'notebookDocument': ?instance.notebookDocument?.toJson(),
      'window': ?instance.window?.toJson(),
      'general': ?instance.general?.toJson(),
      'experimental': ?instance.experimental,
    };

_TextDocumentSyncOptions _$TextDocumentSyncOptionsFromJson(
  Map<String, dynamic> json,
) => _TextDocumentSyncOptions(
  openClose: json['openClose'] as bool?,
  change: $enumDecodeNullable(_$TextDocumentSyncKindEnumMap, json['change']),
  willSave: json['willSave'] as bool?,
  willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
  save: json['save'],
);

Map<String, dynamic> _$TextDocumentSyncOptionsToJson(
  _TextDocumentSyncOptions instance,
) => <String, dynamic>{
  'openClose': ?instance.openClose,
  'change': ?_$TextDocumentSyncKindEnumMap[instance.change],
  'willSave': ?instance.willSave,
  'willSaveWaitUntil': ?instance.willSaveWaitUntil,
  'save': ?instance.save,
};

_NotebookDocumentSyncOptions _$NotebookDocumentSyncOptionsFromJson(
  Map<String, dynamic> json,
) => _NotebookDocumentSyncOptions(
  notebookSelector: (json['notebookSelector'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
  save: json['save'] as bool?,
);

Map<String, dynamic> _$NotebookDocumentSyncOptionsToJson(
  _NotebookDocumentSyncOptions instance,
) => <String, dynamic>{
  'notebookSelector': instance.notebookSelector,
  'save': ?instance.save,
};

_NotebookDocumentSyncRegistrationOptions
_$NotebookDocumentSyncRegistrationOptionsFromJson(Map<String, dynamic> json) =>
    _NotebookDocumentSyncRegistrationOptions(
      notebookSelector: (json['notebookSelector'] as List<dynamic>)
          .map((e) => e as Object)
          .toList(),
      save: json['save'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NotebookDocumentSyncRegistrationOptionsToJson(
  _NotebookDocumentSyncRegistrationOptions instance,
) => <String, dynamic>{
  'notebookSelector': instance.notebookSelector,
  'save': ?instance.save,
  'id': ?instance.id,
};

_WorkspaceFoldersServerCapabilities
_$WorkspaceFoldersServerCapabilitiesFromJson(Map<String, dynamic> json) =>
    _WorkspaceFoldersServerCapabilities(
      supported: json['supported'] as bool?,
      changeNotifications: json['changeNotifications'],
    );

Map<String, dynamic> _$WorkspaceFoldersServerCapabilitiesToJson(
  _WorkspaceFoldersServerCapabilities instance,
) => <String, dynamic>{
  'supported': ?instance.supported,
  'changeNotifications': ?instance.changeNotifications,
};

_FileOperationOptions _$FileOperationOptionsFromJson(
  Map<String, dynamic> json,
) => _FileOperationOptions(
  didCreate: json['didCreate'] == null
      ? null
      : FileOperationRegistrationOptions.fromJson(
          json['didCreate'] as Map<String, dynamic>,
        ),
  willCreate: json['willCreate'] == null
      ? null
      : FileOperationRegistrationOptions.fromJson(
          json['willCreate'] as Map<String, dynamic>,
        ),
  didRename: json['didRename'] == null
      ? null
      : FileOperationRegistrationOptions.fromJson(
          json['didRename'] as Map<String, dynamic>,
        ),
  willRename: json['willRename'] == null
      ? null
      : FileOperationRegistrationOptions.fromJson(
          json['willRename'] as Map<String, dynamic>,
        ),
  didDelete: json['didDelete'] == null
      ? null
      : FileOperationRegistrationOptions.fromJson(
          json['didDelete'] as Map<String, dynamic>,
        ),
  willDelete: json['willDelete'] == null
      ? null
      : FileOperationRegistrationOptions.fromJson(
          json['willDelete'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FileOperationOptionsToJson(
  _FileOperationOptions instance,
) => <String, dynamic>{
  'didCreate': ?instance.didCreate?.toJson(),
  'willCreate': ?instance.willCreate?.toJson(),
  'didRename': ?instance.didRename?.toJson(),
  'willRename': ?instance.willRename?.toJson(),
  'didDelete': ?instance.didDelete?.toJson(),
  'willDelete': ?instance.willDelete?.toJson(),
};

_CodeDescription _$CodeDescriptionFromJson(Map<String, dynamic> json) =>
    _CodeDescription(href: json['href'] as String);

Map<String, dynamic> _$CodeDescriptionToJson(_CodeDescription instance) =>
    <String, dynamic>{'href': instance.href};

_DiagnosticRelatedInformation _$DiagnosticRelatedInformationFromJson(
  Map<String, dynamic> json,
) => _DiagnosticRelatedInformation(
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  message: json['message'] as String,
);

Map<String, dynamic> _$DiagnosticRelatedInformationToJson(
  _DiagnosticRelatedInformation instance,
) => <String, dynamic>{
  'location': instance.location.toJson(),
  'message': instance.message,
};

_ParameterInformation _$ParameterInformationFromJson(
  Map<String, dynamic> json,
) => _ParameterInformation(
  label: json['label'] as Object,
  documentation: json['documentation'],
);

Map<String, dynamic> _$ParameterInformationToJson(
  _ParameterInformation instance,
) => <String, dynamic>{
  'label': instance.label,
  'documentation': ?instance.documentation,
};

_NotebookCellTextDocumentFilter _$NotebookCellTextDocumentFilterFromJson(
  Map<String, dynamic> json,
) => _NotebookCellTextDocumentFilter(
  notebook: json['notebook'] as Object,
  language: json['language'] as String?,
);

Map<String, dynamic> _$NotebookCellTextDocumentFilterToJson(
  _NotebookCellTextDocumentFilter instance,
) => <String, dynamic>{
  'notebook': instance.notebook,
  'language': ?instance.language,
};

_FileOperationPatternOptions _$FileOperationPatternOptionsFromJson(
  Map<String, dynamic> json,
) => _FileOperationPatternOptions(ignoreCase: json['ignoreCase'] as bool?);

Map<String, dynamic> _$FileOperationPatternOptionsToJson(
  _FileOperationPatternOptions instance,
) => <String, dynamic>{'ignoreCase': ?instance.ignoreCase};

_ExecutionSummary _$ExecutionSummaryFromJson(Map<String, dynamic> json) =>
    _ExecutionSummary(
      executionOrder: (json['executionOrder'] as num).toInt(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$ExecutionSummaryToJson(_ExecutionSummary instance) =>
    <String, dynamic>{
      'executionOrder': instance.executionOrder,
      'success': ?instance.success,
    };

_WorkspaceClientCapabilities _$WorkspaceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _WorkspaceClientCapabilities(
  applyEdit: json['applyEdit'] as bool?,
  workspaceEdit: json['workspaceEdit'] == null
      ? null
      : WorkspaceEditClientCapabilities.fromJson(
          json['workspaceEdit'] as Map<String, dynamic>,
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
  symbol: json['symbol'] == null
      ? null
      : WorkspaceSymbolClientCapabilities.fromJson(
          json['symbol'] as Map<String, dynamic>,
        ),
  executeCommand: json['executeCommand'] == null
      ? null
      : ExecuteCommandClientCapabilities.fromJson(
          json['executeCommand'] as Map<String, dynamic>,
        ),
  workspaceFolders: json['workspaceFolders'] as bool?,
  configuration: json['configuration'] as bool?,
  semanticTokens: json['semanticTokens'] == null
      ? null
      : SemanticTokensWorkspaceClientCapabilities.fromJson(
          json['semanticTokens'] as Map<String, dynamic>,
        ),
  codeLens: json['codeLens'] == null
      ? null
      : CodeLensWorkspaceClientCapabilities.fromJson(
          json['codeLens'] as Map<String, dynamic>,
        ),
  fileOperations: json['fileOperations'] == null
      ? null
      : FileOperationClientCapabilities.fromJson(
          json['fileOperations'] as Map<String, dynamic>,
        ),
  inlineValue: json['inlineValue'] == null
      ? null
      : InlineValueWorkspaceClientCapabilities.fromJson(
          json['inlineValue'] as Map<String, dynamic>,
        ),
  inlayHint: json['inlayHint'] == null
      ? null
      : InlayHintWorkspaceClientCapabilities.fromJson(
          json['inlayHint'] as Map<String, dynamic>,
        ),
  diagnostics: json['diagnostics'] == null
      ? null
      : DiagnosticWorkspaceClientCapabilities.fromJson(
          json['diagnostics'] as Map<String, dynamic>,
        ),
  foldingRange: json['foldingRange'] == null
      ? null
      : FoldingRangeWorkspaceClientCapabilities.fromJson(
          json['foldingRange'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WorkspaceClientCapabilitiesToJson(
  _WorkspaceClientCapabilities instance,
) => <String, dynamic>{
  'applyEdit': ?instance.applyEdit,
  'workspaceEdit': ?instance.workspaceEdit?.toJson(),
  'didChangeConfiguration': ?instance.didChangeConfiguration?.toJson(),
  'didChangeWatchedFiles': ?instance.didChangeWatchedFiles?.toJson(),
  'symbol': ?instance.symbol?.toJson(),
  'executeCommand': ?instance.executeCommand?.toJson(),
  'workspaceFolders': ?instance.workspaceFolders,
  'configuration': ?instance.configuration,
  'semanticTokens': ?instance.semanticTokens?.toJson(),
  'codeLens': ?instance.codeLens?.toJson(),
  'fileOperations': ?instance.fileOperations?.toJson(),
  'inlineValue': ?instance.inlineValue?.toJson(),
  'inlayHint': ?instance.inlayHint?.toJson(),
  'diagnostics': ?instance.diagnostics?.toJson(),
  'foldingRange': ?instance.foldingRange?.toJson(),
};

_TextDocumentClientCapabilities _$TextDocumentClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _TextDocumentClientCapabilities(
  synchronization: json['synchronization'] == null
      ? null
      : TextDocumentSyncClientCapabilities.fromJson(
          json['synchronization'] as Map<String, dynamic>,
        ),
  completion: json['completion'] == null
      ? null
      : CompletionClientCapabilities.fromJson(
          json['completion'] as Map<String, dynamic>,
        ),
  hover: json['hover'] == null
      ? null
      : HoverClientCapabilities.fromJson(json['hover'] as Map<String, dynamic>),
  signatureHelp: json['signatureHelp'] == null
      ? null
      : SignatureHelpClientCapabilities.fromJson(
          json['signatureHelp'] as Map<String, dynamic>,
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
  typeDefinition: json['typeDefinition'] == null
      ? null
      : TypeDefinitionClientCapabilities.fromJson(
          json['typeDefinition'] as Map<String, dynamic>,
        ),
  implementation: json['implementation'] == null
      ? null
      : ImplementationClientCapabilities.fromJson(
          json['implementation'] as Map<String, dynamic>,
        ),
  references: json['references'] == null
      ? null
      : ReferenceClientCapabilities.fromJson(
          json['references'] as Map<String, dynamic>,
        ),
  documentHighlight: json['documentHighlight'] == null
      ? null
      : DocumentHighlightClientCapabilities.fromJson(
          json['documentHighlight'] as Map<String, dynamic>,
        ),
  documentSymbol: json['documentSymbol'] == null
      ? null
      : DocumentSymbolClientCapabilities.fromJson(
          json['documentSymbol'] as Map<String, dynamic>,
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
  documentLink: json['documentLink'] == null
      ? null
      : DocumentLinkClientCapabilities.fromJson(
          json['documentLink'] as Map<String, dynamic>,
        ),
  colorProvider: json['colorProvider'] == null
      ? null
      : DocumentColorClientCapabilities.fromJson(
          json['colorProvider'] as Map<String, dynamic>,
        ),
  formatting: json['formatting'] == null
      ? null
      : DocumentFormattingClientCapabilities.fromJson(
          json['formatting'] as Map<String, dynamic>,
        ),
  rangeFormatting: json['rangeFormatting'] == null
      ? null
      : DocumentRangeFormattingClientCapabilities.fromJson(
          json['rangeFormatting'] as Map<String, dynamic>,
        ),
  onTypeFormatting: json['onTypeFormatting'] == null
      ? null
      : DocumentOnTypeFormattingClientCapabilities.fromJson(
          json['onTypeFormatting'] as Map<String, dynamic>,
        ),
  rename: json['rename'] == null
      ? null
      : RenameClientCapabilities.fromJson(
          json['rename'] as Map<String, dynamic>,
        ),
  foldingRange: json['foldingRange'] == null
      ? null
      : FoldingRangeClientCapabilities.fromJson(
          json['foldingRange'] as Map<String, dynamic>,
        ),
  selectionRange: json['selectionRange'] == null
      ? null
      : SelectionRangeClientCapabilities.fromJson(
          json['selectionRange'] as Map<String, dynamic>,
        ),
  publishDiagnostics: json['publishDiagnostics'] == null
      ? null
      : PublishDiagnosticsClientCapabilities.fromJson(
          json['publishDiagnostics'] as Map<String, dynamic>,
        ),
  callHierarchy: json['callHierarchy'] == null
      ? null
      : CallHierarchyClientCapabilities.fromJson(
          json['callHierarchy'] as Map<String, dynamic>,
        ),
  semanticTokens: json['semanticTokens'] == null
      ? null
      : SemanticTokensClientCapabilities.fromJson(
          json['semanticTokens'] as Map<String, dynamic>,
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
  typeHierarchy: json['typeHierarchy'] == null
      ? null
      : TypeHierarchyClientCapabilities.fromJson(
          json['typeHierarchy'] as Map<String, dynamic>,
        ),
  inlineValue: json['inlineValue'] == null
      ? null
      : InlineValueClientCapabilities.fromJson(
          json['inlineValue'] as Map<String, dynamic>,
        ),
  inlayHint: json['inlayHint'] == null
      ? null
      : InlayHintClientCapabilities.fromJson(
          json['inlayHint'] as Map<String, dynamic>,
        ),
  diagnostic: json['diagnostic'] == null
      ? null
      : DiagnosticClientCapabilities.fromJson(
          json['diagnostic'] as Map<String, dynamic>,
        ),
  inlineCompletion: json['inlineCompletion'] == null
      ? null
      : InlineCompletionClientCapabilities.fromJson(
          json['inlineCompletion'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TextDocumentClientCapabilitiesToJson(
  _TextDocumentClientCapabilities instance,
) => <String, dynamic>{
  'synchronization': ?instance.synchronization?.toJson(),
  'completion': ?instance.completion?.toJson(),
  'hover': ?instance.hover?.toJson(),
  'signatureHelp': ?instance.signatureHelp?.toJson(),
  'declaration': ?instance.declaration?.toJson(),
  'definition': ?instance.definition?.toJson(),
  'typeDefinition': ?instance.typeDefinition?.toJson(),
  'implementation': ?instance.implementation?.toJson(),
  'references': ?instance.references?.toJson(),
  'documentHighlight': ?instance.documentHighlight?.toJson(),
  'documentSymbol': ?instance.documentSymbol?.toJson(),
  'codeAction': ?instance.codeAction?.toJson(),
  'codeLens': ?instance.codeLens?.toJson(),
  'documentLink': ?instance.documentLink?.toJson(),
  'colorProvider': ?instance.colorProvider?.toJson(),
  'formatting': ?instance.formatting?.toJson(),
  'rangeFormatting': ?instance.rangeFormatting?.toJson(),
  'onTypeFormatting': ?instance.onTypeFormatting?.toJson(),
  'rename': ?instance.rename?.toJson(),
  'foldingRange': ?instance.foldingRange?.toJson(),
  'selectionRange': ?instance.selectionRange?.toJson(),
  'publishDiagnostics': ?instance.publishDiagnostics?.toJson(),
  'callHierarchy': ?instance.callHierarchy?.toJson(),
  'semanticTokens': ?instance.semanticTokens?.toJson(),
  'linkedEditingRange': ?instance.linkedEditingRange?.toJson(),
  'moniker': ?instance.moniker?.toJson(),
  'typeHierarchy': ?instance.typeHierarchy?.toJson(),
  'inlineValue': ?instance.inlineValue?.toJson(),
  'inlayHint': ?instance.inlayHint?.toJson(),
  'diagnostic': ?instance.diagnostic?.toJson(),
  'inlineCompletion': ?instance.inlineCompletion?.toJson(),
};

_NotebookDocumentClientCapabilities
_$NotebookDocumentClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _NotebookDocumentClientCapabilities(
      synchronization: NotebookDocumentSyncClientCapabilities.fromJson(
        json['synchronization'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$NotebookDocumentClientCapabilitiesToJson(
  _NotebookDocumentClientCapabilities instance,
) => <String, dynamic>{'synchronization': instance.synchronization.toJson()};

_WindowClientCapabilities _$WindowClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _WindowClientCapabilities(
  workDoneProgress: json['workDoneProgress'] as bool?,
  showMessage: json['showMessage'] == null
      ? null
      : ShowMessageRequestClientCapabilities.fromJson(
          json['showMessage'] as Map<String, dynamic>,
        ),
  showDocument: json['showDocument'] == null
      ? null
      : ShowDocumentClientCapabilities.fromJson(
          json['showDocument'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WindowClientCapabilitiesToJson(
  _WindowClientCapabilities instance,
) => <String, dynamic>{
  'workDoneProgress': ?instance.workDoneProgress,
  'showMessage': ?instance.showMessage?.toJson(),
  'showDocument': ?instance.showDocument?.toJson(),
};

_GeneralClientCapabilities _$GeneralClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _GeneralClientCapabilities(
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
  regularExpressions: json['regularExpressions'] == null
      ? null
      : RegularExpressionsClientCapabilities.fromJson(
          json['regularExpressions'] as Map<String, dynamic>,
        ),
  markdown: json['markdown'] == null
      ? null
      : MarkdownClientCapabilities.fromJson(
          json['markdown'] as Map<String, dynamic>,
        ),
  positionEncodings: (json['positionEncodings'] as List<dynamic>?)
      ?.map(PositionEncodingKind.fromJson)
      .toList(),
);

Map<String, dynamic> _$GeneralClientCapabilitiesToJson(
  _GeneralClientCapabilities instance,
) => <String, dynamic>{
  'staleRequestSupport': ?instance.staleRequestSupport == null
      ? null
      : <String, dynamic>{
          'cancel': instance.staleRequestSupport!.cancel,
          'retryOnContentModified':
              instance.staleRequestSupport!.retryOnContentModified,
        },
  'regularExpressions': ?instance.regularExpressions?.toJson(),
  'markdown': ?instance.markdown?.toJson(),
  'positionEncodings': ?instance.positionEncodings
      ?.map((e) => e.toJson())
      .toList(),
};

_RelativePattern _$RelativePatternFromJson(Map<String, dynamic> json) =>
    _RelativePattern(
      baseUri: json['baseUri'] as Object,
      pattern: json['pattern'] as String,
    );

Map<String, dynamic> _$RelativePatternToJson(_RelativePattern instance) =>
    <String, dynamic>{'baseUri': instance.baseUri, 'pattern': instance.pattern};

_WorkspaceEditClientCapabilities _$WorkspaceEditClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _WorkspaceEditClientCapabilities(
  documentChanges: json['documentChanges'] as bool?,
  resourceOperations: (json['resourceOperations'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$ResourceOperationKindEnumMap, e))
      .toList(),
  failureHandling: $enumDecodeNullable(
    _$FailureHandlingKindEnumMap,
    json['failureHandling'],
  ),
  normalizesLineEndings: json['normalizesLineEndings'] as bool?,
  changeAnnotationSupport: _$recordConvertNullable(
    json['changeAnnotationSupport'],
    ($jsonValue) => (groupsOnLabel: $jsonValue['groupsOnLabel'] as bool?),
  ),
);

Map<String, dynamic> _$WorkspaceEditClientCapabilitiesToJson(
  _WorkspaceEditClientCapabilities instance,
) => <String, dynamic>{
  'documentChanges': ?instance.documentChanges,
  'resourceOperations': ?instance.resourceOperations
      ?.map((e) => _$ResourceOperationKindEnumMap[e]!)
      .toList(),
  'failureHandling': ?_$FailureHandlingKindEnumMap[instance.failureHandling],
  'normalizesLineEndings': ?instance.normalizesLineEndings,
  'changeAnnotationSupport': ?instance.changeAnnotationSupport == null
      ? null
      : <String, dynamic>{
          'groupsOnLabel': instance.changeAnnotationSupport!.groupsOnLabel,
        },
};

const _$ResourceOperationKindEnumMap = {
  ResourceOperationKind.create: 'create',
  ResourceOperationKind.rename: 'rename',
  ResourceOperationKind.delete: 'delete',
};

const _$FailureHandlingKindEnumMap = {
  FailureHandlingKind.abort: 'abort',
  FailureHandlingKind.transactional: 'transactional',
  FailureHandlingKind.textOnlyTransactional: 'textOnlyTransactional',
  FailureHandlingKind.undo: 'undo',
};

_DidChangeConfigurationClientCapabilities
_$DidChangeConfigurationClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _DidChangeConfigurationClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );

Map<String, dynamic> _$DidChangeConfigurationClientCapabilitiesToJson(
  _DidChangeConfigurationClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DidChangeWatchedFilesClientCapabilities
_$DidChangeWatchedFilesClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _DidChangeWatchedFilesClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      relativePatternSupport: json['relativePatternSupport'] as bool?,
    );

Map<String, dynamic> _$DidChangeWatchedFilesClientCapabilitiesToJson(
  _DidChangeWatchedFilesClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'relativePatternSupport': ?instance.relativePatternSupport,
};

_WorkspaceSymbolClientCapabilities _$WorkspaceSymbolClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _WorkspaceSymbolClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  symbolKind: _$recordConvertNullable(
    json['symbolKind'],
    ($jsonValue) => (
      valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolKindEnumMap, e))
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
  resolveSupport: _$recordConvertNullable(
    json['resolveSupport'],
    ($jsonValue) => (
      properties: ($jsonValue['properties'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$WorkspaceSymbolClientCapabilitiesToJson(
  _WorkspaceSymbolClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'symbolKind': ?instance.symbolKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.symbolKind!.valueSet
              ?.map((e) => _$SymbolKindEnumMap[e]!)
              .toList(),
        },
  'tagSupport': ?instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$SymbolTagEnumMap[e]!)
              .toList(),
        },
  'resolveSupport': ?instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
};

_ExecuteCommandClientCapabilities _$ExecuteCommandClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _ExecuteCommandClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$ExecuteCommandClientCapabilitiesToJson(
  _ExecuteCommandClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_SemanticTokensWorkspaceClientCapabilities
_$SemanticTokensWorkspaceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensWorkspaceClientCapabilities(
  refreshSupport: json['refreshSupport'] as bool?,
);

Map<String, dynamic> _$SemanticTokensWorkspaceClientCapabilitiesToJson(
  _SemanticTokensWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_CodeLensWorkspaceClientCapabilities
_$CodeLensWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _CodeLensWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );

Map<String, dynamic> _$CodeLensWorkspaceClientCapabilitiesToJson(
  _CodeLensWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_FileOperationClientCapabilities _$FileOperationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _FileOperationClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  didCreate: json['didCreate'] as bool?,
  willCreate: json['willCreate'] as bool?,
  didRename: json['didRename'] as bool?,
  willRename: json['willRename'] as bool?,
  didDelete: json['didDelete'] as bool?,
  willDelete: json['willDelete'] as bool?,
);

Map<String, dynamic> _$FileOperationClientCapabilitiesToJson(
  _FileOperationClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'didCreate': ?instance.didCreate,
  'willCreate': ?instance.willCreate,
  'didRename': ?instance.didRename,
  'willRename': ?instance.willRename,
  'didDelete': ?instance.didDelete,
  'willDelete': ?instance.willDelete,
};

_InlineValueWorkspaceClientCapabilities
_$InlineValueWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _InlineValueWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );

Map<String, dynamic> _$InlineValueWorkspaceClientCapabilitiesToJson(
  _InlineValueWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_InlayHintWorkspaceClientCapabilities
_$InlayHintWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _InlayHintWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );

Map<String, dynamic> _$InlayHintWorkspaceClientCapabilitiesToJson(
  _InlayHintWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_DiagnosticWorkspaceClientCapabilities
_$DiagnosticWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _DiagnosticWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );

Map<String, dynamic> _$DiagnosticWorkspaceClientCapabilitiesToJson(
  _DiagnosticWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_FoldingRangeWorkspaceClientCapabilities
_$FoldingRangeWorkspaceClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _FoldingRangeWorkspaceClientCapabilities(
      refreshSupport: json['refreshSupport'] as bool?,
    );

Map<String, dynamic> _$FoldingRangeWorkspaceClientCapabilitiesToJson(
  _FoldingRangeWorkspaceClientCapabilities instance,
) => <String, dynamic>{'refreshSupport': ?instance.refreshSupport};

_TextDocumentSyncClientCapabilities
_$TextDocumentSyncClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _TextDocumentSyncClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      willSave: json['willSave'] as bool?,
      willSaveWaitUntil: json['willSaveWaitUntil'] as bool?,
      didSave: json['didSave'] as bool?,
    );

Map<String, dynamic> _$TextDocumentSyncClientCapabilitiesToJson(
  _TextDocumentSyncClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'willSave': ?instance.willSave,
  'willSaveWaitUntil': ?instance.willSaveWaitUntil,
  'didSave': ?instance.didSave,
};

_CompletionClientCapabilities _$CompletionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _CompletionClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  completionItem: _$recordConvertNullable(
    json['completionItem'],
    ($jsonValue) => (
      commitCharactersSupport: $jsonValue['commitCharactersSupport'] as bool?,
      deprecatedSupport: $jsonValue['deprecatedSupport'] as bool?,
      documentationFormat: ($jsonValue['documentationFormat'] as List<dynamic>?)
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
  completionItemKind: _$recordConvertNullable(
    json['completionItemKind'],
    ($jsonValue) => (
      valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CompletionItemKindEnumMap, e))
          .toList(),
    ),
  ),
  insertTextMode: $enumDecodeNullable(
    _$InsertTextModeEnumMap,
    json['insertTextMode'],
  ),
  contextSupport: json['contextSupport'] as bool?,
  completionList: _$recordConvertNullable(
    json['completionList'],
    ($jsonValue) => (
      itemDefaults: ($jsonValue['itemDefaults'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$CompletionClientCapabilitiesToJson(
  _CompletionClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
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
  'completionItemKind': ?instance.completionItemKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.completionItemKind!.valueSet
              ?.map((e) => _$CompletionItemKindEnumMap[e]!)
              .toList(),
        },
  'insertTextMode': ?_$InsertTextModeEnumMap[instance.insertTextMode],
  'contextSupport': ?instance.contextSupport,
  'completionList': ?instance.completionList == null
      ? null
      : <String, dynamic>{
          'itemDefaults': instance.completionList!.itemDefaults,
        },
};

_HoverClientCapabilities _$HoverClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _HoverClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  contentFormat: (json['contentFormat'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$MarkupKindEnumMap, e))
      .toList(),
);

Map<String, dynamic> _$HoverClientCapabilitiesToJson(
  _HoverClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'contentFormat': ?instance.contentFormat
      ?.map((e) => _$MarkupKindEnumMap[e]!)
      .toList(),
};

_SignatureHelpClientCapabilities _$SignatureHelpClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _SignatureHelpClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  signatureInformation: _$recordConvertNullable(
    json['signatureInformation'],
    ($jsonValue) => (
      activeParameterSupport: $jsonValue['activeParameterSupport'] as bool?,
      documentationFormat: ($jsonValue['documentationFormat'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MarkupKindEnumMap, e))
          .toList(),
      parameterInformation: _$recordConvertNullable(
        $jsonValue['parameterInformation'],
        ($jsonValue) =>
            (labelOffsetSupport: $jsonValue['labelOffsetSupport'] as bool?),
      ),
    ),
  ),
  contextSupport: json['contextSupport'] as bool?,
);

Map<String, dynamic> _$SignatureHelpClientCapabilitiesToJson(
  _SignatureHelpClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
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
  'contextSupport': ?instance.contextSupport,
};

_DeclarationClientCapabilities _$DeclarationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DeclarationClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  linkSupport: json['linkSupport'] as bool?,
);

Map<String, dynamic> _$DeclarationClientCapabilitiesToJson(
  _DeclarationClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'linkSupport': ?instance.linkSupport,
};

_DefinitionClientCapabilities _$DefinitionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DefinitionClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  linkSupport: json['linkSupport'] as bool?,
);

Map<String, dynamic> _$DefinitionClientCapabilitiesToJson(
  _DefinitionClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'linkSupport': ?instance.linkSupport,
};

_TypeDefinitionClientCapabilities _$TypeDefinitionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _TypeDefinitionClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  linkSupport: json['linkSupport'] as bool?,
);

Map<String, dynamic> _$TypeDefinitionClientCapabilitiesToJson(
  _TypeDefinitionClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'linkSupport': ?instance.linkSupport,
};

_ImplementationClientCapabilities _$ImplementationClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _ImplementationClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  linkSupport: json['linkSupport'] as bool?,
);

Map<String, dynamic> _$ImplementationClientCapabilitiesToJson(
  _ImplementationClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'linkSupport': ?instance.linkSupport,
};

_ReferenceClientCapabilities _$ReferenceClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _ReferenceClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$ReferenceClientCapabilitiesToJson(
  _ReferenceClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentHighlightClientCapabilities
_$DocumentHighlightClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _DocumentHighlightClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );

Map<String, dynamic> _$DocumentHighlightClientCapabilitiesToJson(
  _DocumentHighlightClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentSymbolClientCapabilities _$DocumentSymbolClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DocumentSymbolClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  symbolKind: _$recordConvertNullable(
    json['symbolKind'],
    ($jsonValue) => (
      valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SymbolKindEnumMap, e))
          .toList(),
    ),
  ),
  hierarchicalDocumentSymbolSupport:
      json['hierarchicalDocumentSymbolSupport'] as bool?,
  tagSupport: _$recordConvertNullable(
    json['tagSupport'],
    ($jsonValue) => (
      valueSet: ($jsonValue['valueSet'] as List<dynamic>)
          .map((e) => $enumDecode(_$SymbolTagEnumMap, e))
          .toList(),
    ),
  ),
  labelSupport: json['labelSupport'] as bool?,
);

Map<String, dynamic> _$DocumentSymbolClientCapabilitiesToJson(
  _DocumentSymbolClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'symbolKind': ?instance.symbolKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.symbolKind!.valueSet
              ?.map((e) => _$SymbolKindEnumMap[e]!)
              .toList(),
        },
  'hierarchicalDocumentSymbolSupport':
      ?instance.hierarchicalDocumentSymbolSupport,
  'tagSupport': ?instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$SymbolTagEnumMap[e]!)
              .toList(),
        },
  'labelSupport': ?instance.labelSupport,
};

_CodeActionClientCapabilities _$CodeActionClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _CodeActionClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  codeActionLiteralSupport: _$recordConvertNullable(
    json['codeActionLiteralSupport'],
    ($jsonValue) => (
      codeActionKind: _$recordConvert(
        $jsonValue['codeActionKind'],
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>)
              .map(CodeActionKind.fromJson)
              .toList(),
        ),
      ),
    ),
  ),
  isPreferredSupport: json['isPreferredSupport'] as bool?,
  disabledSupport: json['disabledSupport'] as bool?,
  dataSupport: json['dataSupport'] as bool?,
  resolveSupport: _$recordConvertNullable(
    json['resolveSupport'],
    ($jsonValue) => (
      properties: ($jsonValue['properties'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    ),
  ),
  honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
);

Map<String, dynamic> _$CodeActionClientCapabilitiesToJson(
  _CodeActionClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'codeActionLiteralSupport': ?instance.codeActionLiteralSupport == null
      ? null
      : <String, dynamic>{
          'codeActionKind': <String, dynamic>{
            'valueSet': instance
                .codeActionLiteralSupport!
                .codeActionKind
                .valueSet
                .map((e) => e.toJson())
                .toList(),
          },
        },
  'isPreferredSupport': ?instance.isPreferredSupport,
  'disabledSupport': ?instance.disabledSupport,
  'dataSupport': ?instance.dataSupport,
  'resolveSupport': ?instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
  'honorsChangeAnnotations': ?instance.honorsChangeAnnotations,
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

_CodeLensClientCapabilities _$CodeLensClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _CodeLensClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$CodeLensClientCapabilitiesToJson(
  _CodeLensClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentLinkClientCapabilities _$DocumentLinkClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DocumentLinkClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  tooltipSupport: json['tooltipSupport'] as bool?,
);

Map<String, dynamic> _$DocumentLinkClientCapabilitiesToJson(
  _DocumentLinkClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'tooltipSupport': ?instance.tooltipSupport,
};

_DocumentColorClientCapabilities _$DocumentColorClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DocumentColorClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$DocumentColorClientCapabilitiesToJson(
  _DocumentColorClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentFormattingClientCapabilities
_$DocumentFormattingClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _DocumentFormattingClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );

Map<String, dynamic> _$DocumentFormattingClientCapabilitiesToJson(
  _DocumentFormattingClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_DocumentRangeFormattingClientCapabilities
_$DocumentRangeFormattingClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DocumentRangeFormattingClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  rangesSupport: json['rangesSupport'] as bool?,
);

Map<String, dynamic> _$DocumentRangeFormattingClientCapabilitiesToJson(
  _DocumentRangeFormattingClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'rangesSupport': ?instance.rangesSupport,
};

_DocumentOnTypeFormattingClientCapabilities
_$DocumentOnTypeFormattingClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DocumentOnTypeFormattingClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$DocumentOnTypeFormattingClientCapabilitiesToJson(
  _DocumentOnTypeFormattingClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_RenameClientCapabilities _$RenameClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _RenameClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  prepareSupport: json['prepareSupport'] as bool?,
  prepareSupportDefaultBehavior: $enumDecodeNullable(
    _$PrepareSupportDefaultBehaviorEnumMap,
    json['prepareSupportDefaultBehavior'],
  ),
  honorsChangeAnnotations: json['honorsChangeAnnotations'] as bool?,
);

Map<String, dynamic> _$RenameClientCapabilitiesToJson(
  _RenameClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'prepareSupport': ?instance.prepareSupport,
  'prepareSupportDefaultBehavior':
      ?_$PrepareSupportDefaultBehaviorEnumMap[instance
          .prepareSupportDefaultBehavior],
  'honorsChangeAnnotations': ?instance.honorsChangeAnnotations,
};

const _$PrepareSupportDefaultBehaviorEnumMap = {
  PrepareSupportDefaultBehavior.identifier: 1,
};

_FoldingRangeClientCapabilities _$FoldingRangeClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _FoldingRangeClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  rangeLimit: (json['rangeLimit'] as num?)?.toInt(),
  lineFoldingOnly: json['lineFoldingOnly'] as bool?,
  foldingRangeKind: _$recordConvertNullable(
    json['foldingRangeKind'],
    ($jsonValue) => (
      valueSet: ($jsonValue['valueSet'] as List<dynamic>?)
          ?.map(FoldingRangeKind.fromJson)
          .toList(),
    ),
  ),
  foldingRange: _$recordConvertNullable(
    json['foldingRange'],
    ($jsonValue) => (collapsedText: $jsonValue['collapsedText'] as bool?),
  ),
);

Map<String, dynamic> _$FoldingRangeClientCapabilitiesToJson(
  _FoldingRangeClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'rangeLimit': ?instance.rangeLimit,
  'lineFoldingOnly': ?instance.lineFoldingOnly,
  'foldingRangeKind': ?instance.foldingRangeKind == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.foldingRangeKind!.valueSet
              ?.map((e) => e.toJson())
              .toList(),
        },
  'foldingRange': ?instance.foldingRange == null
      ? null
      : <String, dynamic>{
          'collapsedText': instance.foldingRange!.collapsedText,
        },
};

_SelectionRangeClientCapabilities _$SelectionRangeClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _SelectionRangeClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$SelectionRangeClientCapabilitiesToJson(
  _SelectionRangeClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_PublishDiagnosticsClientCapabilities
_$PublishDiagnosticsClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _PublishDiagnosticsClientCapabilities(
      relatedInformation: json['relatedInformation'] as bool?,
      tagSupport: _$recordConvertNullable(
        json['tagSupport'],
        ($jsonValue) => (
          valueSet: ($jsonValue['valueSet'] as List<dynamic>)
              .map((e) => $enumDecode(_$DiagnosticTagEnumMap, e))
              .toList(),
        ),
      ),
      versionSupport: json['versionSupport'] as bool?,
      codeDescriptionSupport: json['codeDescriptionSupport'] as bool?,
      dataSupport: json['dataSupport'] as bool?,
    );

Map<String, dynamic> _$PublishDiagnosticsClientCapabilitiesToJson(
  _PublishDiagnosticsClientCapabilities instance,
) => <String, dynamic>{
  'relatedInformation': ?instance.relatedInformation,
  'tagSupport': ?instance.tagSupport == null
      ? null
      : <String, dynamic>{
          'valueSet': instance.tagSupport!.valueSet
              .map((e) => _$DiagnosticTagEnumMap[e]!)
              .toList(),
        },
  'versionSupport': ?instance.versionSupport,
  'codeDescriptionSupport': ?instance.codeDescriptionSupport,
  'dataSupport': ?instance.dataSupport,
};

_CallHierarchyClientCapabilities _$CallHierarchyClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _CallHierarchyClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$CallHierarchyClientCapabilitiesToJson(
  _CallHierarchyClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_SemanticTokensClientCapabilities _$SemanticTokensClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _SemanticTokensClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
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
  overlappingTokenSupport: json['overlappingTokenSupport'] as bool?,
  multilineTokenSupport: json['multilineTokenSupport'] as bool?,
  serverCancelSupport: json['serverCancelSupport'] as bool?,
  augmentsSyntaxTokens: json['augmentsSyntaxTokens'] as bool?,
);

Map<String, dynamic> _$SemanticTokensClientCapabilitiesToJson(
  _SemanticTokensClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'requests': <String, dynamic>{
    'full': instance.requests.full,
    'range': instance.requests.range,
  },
  'tokenTypes': instance.tokenTypes,
  'tokenModifiers': instance.tokenModifiers,
  'formats': instance.formats.map((e) => _$TokenFormatEnumMap[e]!).toList(),
  'overlappingTokenSupport': ?instance.overlappingTokenSupport,
  'multilineTokenSupport': ?instance.multilineTokenSupport,
  'serverCancelSupport': ?instance.serverCancelSupport,
  'augmentsSyntaxTokens': ?instance.augmentsSyntaxTokens,
};

const _$TokenFormatEnumMap = {TokenFormat.relative: 'relative'};

_LinkedEditingRangeClientCapabilities
_$LinkedEditingRangeClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _LinkedEditingRangeClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );

Map<String, dynamic> _$LinkedEditingRangeClientCapabilitiesToJson(
  _LinkedEditingRangeClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_MonikerClientCapabilities _$MonikerClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _MonikerClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$MonikerClientCapabilitiesToJson(
  _MonikerClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_TypeHierarchyClientCapabilities _$TypeHierarchyClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _TypeHierarchyClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$TypeHierarchyClientCapabilitiesToJson(
  _TypeHierarchyClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_InlineValueClientCapabilities _$InlineValueClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _InlineValueClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
);

Map<String, dynamic> _$InlineValueClientCapabilitiesToJson(
  _InlineValueClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_InlayHintClientCapabilities _$InlayHintClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _InlayHintClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  resolveSupport: _$recordConvertNullable(
    json['resolveSupport'],
    ($jsonValue) => (
      properties: ($jsonValue['properties'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$InlayHintClientCapabilitiesToJson(
  _InlayHintClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'resolveSupport': ?instance.resolveSupport == null
      ? null
      : <String, dynamic>{'properties': instance.resolveSupport!.properties},
};

_DiagnosticClientCapabilities _$DiagnosticClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _DiagnosticClientCapabilities(
  dynamicRegistration: json['dynamicRegistration'] as bool?,
  relatedDocumentSupport: json['relatedDocumentSupport'] as bool?,
);

Map<String, dynamic> _$DiagnosticClientCapabilitiesToJson(
  _DiagnosticClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'relatedDocumentSupport': ?instance.relatedDocumentSupport,
};

_InlineCompletionClientCapabilities
_$InlineCompletionClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _InlineCompletionClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
    );

Map<String, dynamic> _$InlineCompletionClientCapabilitiesToJson(
  _InlineCompletionClientCapabilities instance,
) => <String, dynamic>{'dynamicRegistration': ?instance.dynamicRegistration};

_NotebookDocumentSyncClientCapabilities
_$NotebookDocumentSyncClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _NotebookDocumentSyncClientCapabilities(
      dynamicRegistration: json['dynamicRegistration'] as bool?,
      executionSummarySupport: json['executionSummarySupport'] as bool?,
    );

Map<String, dynamic> _$NotebookDocumentSyncClientCapabilitiesToJson(
  _NotebookDocumentSyncClientCapabilities instance,
) => <String, dynamic>{
  'dynamicRegistration': ?instance.dynamicRegistration,
  'executionSummarySupport': ?instance.executionSummarySupport,
};

_ShowMessageRequestClientCapabilities
_$ShowMessageRequestClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _ShowMessageRequestClientCapabilities(
      messageActionItem: _$recordConvertNullable(
        json['messageActionItem'],
        ($jsonValue) => (
          additionalPropertiesSupport:
              $jsonValue['additionalPropertiesSupport'] as bool?,
        ),
      ),
    );

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
) => _ShowDocumentClientCapabilities(support: json['support'] as bool);

Map<String, dynamic> _$ShowDocumentClientCapabilitiesToJson(
  _ShowDocumentClientCapabilities instance,
) => <String, dynamic>{'support': instance.support};

_RegularExpressionsClientCapabilities
_$RegularExpressionsClientCapabilitiesFromJson(Map<String, dynamic> json) =>
    _RegularExpressionsClientCapabilities(
      engine: json['engine'] as String,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$RegularExpressionsClientCapabilitiesToJson(
  _RegularExpressionsClientCapabilities instance,
) => <String, dynamic>{'engine': instance.engine, 'version': ?instance.version};

_MarkdownClientCapabilities _$MarkdownClientCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _MarkdownClientCapabilities(
  parser: json['parser'] as String,
  version: json['version'] as String?,
  allowedTags: (json['allowedTags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$MarkdownClientCapabilitiesToJson(
  _MarkdownClientCapabilities instance,
) => <String, dynamic>{
  'parser': instance.parser,
  'version': ?instance.version,
  'allowedTags': ?instance.allowedTags,
};
