// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LSPProtocol _$LSPProtocolFromJson(Map<String, dynamic> json) => LSPProtocol(
  metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
  requests: (json['requests'] as List<dynamic>)
      .map((e) => Request.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LSPProtocolToJson(LSPProtocol instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'requests': instance.requests,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) =>
    MetaData(version: json['version'] as String);

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
  'version': instance.version,
};

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
  method: json['method'] as String,
  params: json['params'] == null
      ? null
      : Parameters.fromJson(json['params'] as Map<String, dynamic>),
  result: Result.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
  'method': instance.method,
  'params': instance.params,
  'result': instance.result,
};

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
  name: json['name'] as String?,
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'name': instance.name,
};

const _$TypeKindEnumMap = {
  TypeKind.array: 'array',
  TypeKind.base: 'base',
  TypeKind.literal: 'literal',
  TypeKind.map: 'map',
  TypeKind.or: 'or',
  TypeKind.reference: 'reference',
  TypeKind.string: 'string_literal',
  TypeKind.tuple: 'tuple',
};

Parameters _$ParametersFromJson(Map<String, dynamic> json) => Parameters(
  kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
  name: json['name'] as String,
);

Map<String, dynamic> _$ParametersToJson(Parameters instance) =>
    <String, dynamic>{
      'kind': _$TypeKindEnumMap[instance.kind]!,
      'name': instance.name,
    };
