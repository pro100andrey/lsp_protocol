// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaProtocol _$MetaProtocolFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'metaData',
      'requests',
      'notifications',
      'structures',
      'enumerations',
      'typeAliases',
    ],
  );
  return MetaProtocol(
    metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
    requests: (json['requests'] as List<dynamic>)
        .map((e) => MetaRequest.fromJson(e as Map<String, dynamic>))
        .toList(),
    notifications: (json['notifications'] as List<dynamic>)
        .map((e) => MetaNotification.fromJson(e as Map<String, dynamic>))
        .toList(),
    structures: (json['structures'] as List<dynamic>)
        .map((e) => MetaStructure.fromJson(e as Map<String, dynamic>))
        .toList(),
    enumerations: (json['enumerations'] as List<dynamic>)
        .map((e) => MetaEnumeration.fromJson(e as Map<String, dynamic>))
        .toList(),
    typeAliases: (json['typeAliases'] as List<dynamic>)
        .map((e) => Element.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MetaProtocolToJson(MetaProtocol instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'requests': instance.requests,
      'notifications': instance.notifications,
      'structures': instance.structures,
      'enumerations': instance.enumerations,
      'typeAliases': instance.typeAliases,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['version']);
  return MetaData(version: json['version'] as String);
}

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
  'version': instance.version,
};

MetaRequest _$MetaRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'method',
      'messageDirection',
      'params',
      'result',
      'documentation',
      'partialResult',
      'registrationOptions',
      'since',
      'proposed',
      'registrationMethod',
      'errorData',
    ],
  );
  return MetaRequest(
    method: json['method'] as String,
    messageDirection: $enumDecode(
      _$MessageDirectionEnumMap,
      json['messageDirection'],
    ),
    params: json['params'] == null
        ? null
        : Element.fromJson(json['params'] as Map<String, dynamic>),
    result: json['result'] == null
        ? null
        : Element.fromJson(json['result'] as Map<String, dynamic>),
    documentation: json['documentation'] as String?,
    partialResult: json['partialResult'] == null
        ? null
        : Element.fromJson(json['partialResult'] as Map<String, dynamic>),
    registrationOptions: json['registrationOptions'] == null
        ? null
        : Element.fromJson(json['registrationOptions'] as Map<String, dynamic>),
    since: json['since'] as String?,
    proposed: json['proposed'] as bool?,
    registrationMethod: json['registrationMethod'] as String?,
    errorData: json['errorData'] == null
        ? null
        : Element.fromJson(json['errorData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetaRequestToJson(MetaRequest instance) =>
    <String, dynamic>{
      'method': instance.method,
      'messageDirection': _$MessageDirectionEnumMap[instance.messageDirection]!,
      'params': instance.params,
      'result': instance.result,
      'documentation': instance.documentation,
      'partialResult': instance.partialResult,
      'registrationOptions': instance.registrationOptions,
      'since': instance.since,
      'proposed': instance.proposed,
      'registrationMethod': instance.registrationMethod,
      'errorData': instance.errorData,
    };

const _$MessageDirectionEnumMap = {
  MessageDirection.both: 'both',
  MessageDirection.clientToServer: 'clientToServer',
  MessageDirection.serverToClient: 'serverToClient',
};

MetaNotification _$MetaNotificationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'method',
      'params',
      'messageDirection',
      'documentation',
      'registrationOptions',
      'since',
      'registrationMethod',
    ],
  );
  return MetaNotification(
    method: json['method'] as String,
    params: json['params'] == null
        ? null
        : Element.fromJson(json['params'] as Map<String, dynamic>),
    messageDirection: $enumDecode(
      _$MessageDirectionEnumMap,
      json['messageDirection'],
    ),
    documentation: json['documentation'] as String?,
    registrationOptions: json['registrationOptions'] == null
        ? null
        : Element.fromJson(json['registrationOptions'] as Map<String, dynamic>),
    since: json['since'] as String?,
    registrationMethod: json['registrationMethod'] as String?,
  );
}

Map<String, dynamic> _$MetaNotificationToJson(MetaNotification instance) =>
    <String, dynamic>{
      'method': instance.method,
      'params': instance.params,
      'messageDirection': _$MessageDirectionEnumMap[instance.messageDirection]!,
      'documentation': instance.documentation,
      'registrationOptions': instance.registrationOptions,
      'since': instance.since,
      'registrationMethod': instance.registrationMethod,
    };

MetaStructure _$MetaStructureFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'properties',
      'extends',
      'mixins',
      'documentation',
      'since',
      'proposed',
    ],
  );
  return MetaStructure(
    name: json['name'] as String,
    properties: (json['properties'] as List<dynamic>)
        .map((e) => Element.fromJson(e as Map<String, dynamic>))
        .toList(),
    extends$: (json['extends'] as List<dynamic>?)
        ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
        .toList(),
    mixins: (json['mixins'] as List<dynamic>?)
        ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
        .toList(),
    documentation: json['documentation'] as String?,
    since: json['since'] as String?,
    proposed: json['proposed'] as bool?,
  );
}

Map<String, dynamic> _$MetaStructureToJson(MetaStructure instance) =>
    <String, dynamic>{
      'name': instance.name,
      'properties': instance.properties,
      'extends': instance.extends$,
      'mixins': instance.mixins,
      'documentation': instance.documentation,
      'since': instance.since,
      'proposed': instance.proposed,
    };

MetaEnumeration _$MetaEnumerationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'type',
      'values',
      'supportsCustomValues',
      'documentation',
      'since',
      'proposed',
    ],
  );
  return MetaEnumeration(
    name: json['name'] as String,
    type: Element.fromJson(json['type'] as Map<String, dynamic>),
    values: (json['values'] as List<dynamic>)
        .map((e) => Element.fromJson(e as Map<String, dynamic>))
        .toList(),
    supportsCustomValues: json['supportsCustomValues'] as bool?,
    documentation: json['documentation'] as String?,
    since: json['since'] as String?,
    proposed: json['proposed'] as bool?,
  );
}

Map<String, dynamic> _$MetaEnumerationToJson(MetaEnumeration instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'values': instance.values,
      'supportsCustomValues': instance.supportsCustomValues,
      'documentation': instance.documentation,
      'since': instance.since,
      'proposed': instance.proposed,
    };

Element _$ElementFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'kind',
      'name',
      'element',
      'items',
      'type',
      'documentation',
      'optional',
      'since',
      'proposed',
      'key',
      'value',
      'properties',
      'deprecated',
    ],
  );
  return Element(
    kind: $enumDecodeNullable(_$TypeKindEnumMap, json['kind']),
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
        .toList(),
    element: json['element'] == null
        ? null
        : Element.fromJson(json['element'] as Map<String, dynamic>),
    name: json['name'] as String?,
    type: json['type'] == null
        ? null
        : Element.fromJson(json['type'] as Map<String, dynamic>),
    documentation: json['documentation'] as String?,
    optional: json['optional'] as bool?,
    since: json['since'] as String?,
    proposed: json['proposed'] as bool?,
    key: json['key'] == null
        ? null
        : Element.fromJson(json['key'] as Map<String, dynamic>),
    value: json['value'],
    properties: (json['properties'] as List<dynamic>?)
        ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
        .toList(),
    deprecated: json['deprecated'] as String?,
  );
}

Map<String, dynamic> _$ElementToJson(Element instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind],
  'name': instance.name,
  'element': instance.element,
  'items': instance.items,
  'type': instance.type,
  'documentation': instance.documentation,
  'optional': instance.optional,
  'since': instance.since,
  'proposed': instance.proposed,
  'key': instance.key,
  'value': instance.value,
  'properties': instance.properties,
  'deprecated': instance.deprecated,
};

const _$TypeKindEnumMap = {
  TypeKind.array: 'array',
  TypeKind.base$: 'base',
  TypeKind.literal: 'literal',
  TypeKind.map: 'map',
  TypeKind.or: 'or',
  TypeKind.and: 'and',
  TypeKind.reference: 'reference',
  TypeKind.string: 'stringLiteral',
  TypeKind.tuple: 'tuple',
};
