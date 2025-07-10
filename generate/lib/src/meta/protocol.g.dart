// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaProtocol _$MetaProtocolFromJson(Map<String, dynamic> json) =>
    _MetaProtocol(
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
          .map((e) => MetaTypeAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MetaProtocolToJson(_MetaProtocol instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'requests': instance.requests,
      'notifications': instance.notifications,
      'structures': instance.structures,
      'enumerations': instance.enumerations,
      'typeAliases': instance.typeAliases,
    };

_MetaData _$MetaDataFromJson(Map<String, dynamic> json) =>
    _MetaData(version: json['version'] as String);

Map<String, dynamic> _$MetaDataToJson(_MetaData instance) => <String, dynamic>{
  'version': instance.version,
};

_MetaRequest _$MetaRequestFromJson(Map<String, dynamic> json) {
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
  return _MetaRequest(
    method: json['method'] as String,
    messageDirection: $enumDecode(
      _$MessageDirectionEnumMap,
      json['messageDirection'],
    ),
    params: json['params'] == null
        ? null
        : MetaReference.fromJson(json['params'] as Map<String, dynamic>),
    result: json['result'] == null
        ? null
        : MetaReference.fromJson(json['result'] as Map<String, dynamic>),
    documentation: json['documentation'] as String?,
    partialResult: json['partialResult'] == null
        ? null
        : MetaReference.fromJson(json['partialResult'] as Map<String, dynamic>),
    registrationOptions: json['registrationOptions'] == null
        ? null
        : MetaReference.fromJson(
            json['registrationOptions'] as Map<String, dynamic>,
          ),
    since: json['since'] as String?,
    proposed: json['proposed'] as bool?,
    registrationMethod: json['registrationMethod'] as String?,
    errorData: json['errorData'] == null
        ? null
        : MetaReference.fromJson(json['errorData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetaRequestToJson(_MetaRequest instance) =>
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

TypeRef _$TypeRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'name']);
  return TypeRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TypeRefToJson(TypeRef instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'name': instance.name,
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

ArrayRef _$ArrayRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'element']);
  return ArrayRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    element: MetaReference.fromJson(json['element'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArrayRefToJson(ArrayRef instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'element': instance.element,
};

BaseRef _$BaseRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'name']);
  return BaseRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BaseRefToJson(BaseRef instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'name': instance.name,
};

OrRef _$OrRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'items']);
  return OrRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    items: (json['items'] as List<dynamic>)
        .map((e) => MetaReference.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrRefToJson(OrRef instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'items': instance.items,
};

AndRef _$AndRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'items']);
  return AndRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    items: (json['items'] as List<dynamic>)
        .map((e) => MetaReference.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AndRefToJson(AndRef instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'items': instance.items,
};

MapRef _$MapRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'key', 'value']);
  return MapRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    key: MetaReference.fromJson(json['key'] as Map<String, dynamic>),
    value: MetaReference.fromJson(json['value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MapRefToJson(MapRef instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'key': instance.key,
  'value': instance.value,
};

LiteralRef _$LiteralRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'value']);
  return LiteralRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    value: MetaLiteral.fromJson(json['value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LiteralRefToJson(LiteralRef instance) =>
    <String, dynamic>{
      'kind': _$TypeKindEnumMap[instance.kind]!,
      'value': instance.value,
    };

StringLiteralRef _$StringLiteralRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'value']);
  return StringLiteralRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$StringLiteralRefToJson(StringLiteralRef instance) =>
    <String, dynamic>{
      'kind': _$TypeKindEnumMap[instance.kind]!,
      'value': instance.value,
    };

TupleRef _$TupleRefFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['kind', 'items']);
  return TupleRef(
    kind: $enumDecode(_$TypeKindEnumMap, json['kind']),
    items: (json['items'] as List<dynamic>)
        .map((e) => MetaReference.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TupleRefToJson(TupleRef instance) => <String, dynamic>{
  'kind': _$TypeKindEnumMap[instance.kind]!,
  'items': instance.items,
};

_MetaLiteral _$MetaLiteralFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['properties']);
  return _MetaLiteral(
    properties: (json['properties'] as List<dynamic>)
        .map((e) => MetaProperty.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MetaLiteralToJson(_MetaLiteral instance) =>
    <String, dynamic>{'properties': instance.properties};

_MetaNotification _$MetaNotificationFromJson(Map<String, dynamic> json) =>
    _MetaNotification(
      method: json['method'] as String,
      messageDirection: $enumDecode(
        _$MessageDirectionEnumMap,
        json['messageDirection'],
      ),
      params: json['params'] == null
          ? null
          : MetaReference.fromJson(json['params'] as Map<String, dynamic>),
      documentation: json['documentation'] as String?,
      registrationOptions: json['registrationOptions'] == null
          ? null
          : MetaReference.fromJson(
              json['registrationOptions'] as Map<String, dynamic>,
            ),
      since: json['since'] as String?,
      registrationMethod: json['registrationMethod'] as String?,
    );

Map<String, dynamic> _$MetaNotificationToJson(_MetaNotification instance) =>
    <String, dynamic>{
      'method': instance.method,
      'messageDirection': _$MessageDirectionEnumMap[instance.messageDirection]!,
      'params': instance.params,
      'documentation': instance.documentation,
      'registrationOptions': instance.registrationOptions,
      'since': instance.since,
      'registrationMethod': instance.registrationMethod,
    };

_MetaProperty _$MetaPropertyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'type',
      'documentation',
      'since',
      'deprecated',
      'optional',
      'proposed',
    ],
  );
  return _MetaProperty(
    name: json['name'] as String,
    type: MetaReference.fromJson(json['type'] as Map<String, dynamic>),
    documentation: json['documentation'] as String?,
    since: json['since'] as String?,
    deprecated: json['deprecated'] as String?,
    optional: json['optional'] as bool? ?? false,
    proposed: json['proposed'] as bool? ?? false,
  );
}

Map<String, dynamic> _$MetaPropertyToJson(_MetaProperty instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'documentation': instance.documentation,
      'since': instance.since,
      'deprecated': instance.deprecated,
      'optional': instance.optional,
      'proposed': instance.proposed,
    };

_MetaStructure _$MetaStructureFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'properties',
      'documentation',
      'since',
      'proposed',
      'mixins',
      'extends',
    ],
  );
  return _MetaStructure(
    name: json['name'] as String,
    properties: (json['properties'] as List<dynamic>)
        .map((e) => MetaProperty.fromJson(e as Map<String, dynamic>))
        .toList(),
    documentation: json['documentation'] as String?,
    since: json['since'] as String?,
    proposed: json['proposed'] as bool? ?? false,
    mixins$:
        (json['mixins'] as List<dynamic>?)
            ?.map((e) => MetaReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
    extends$:
        (json['extends'] as List<dynamic>?)
            ?.map((e) => MetaReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$MetaStructureToJson(_MetaStructure instance) =>
    <String, dynamic>{
      'name': instance.name,
      'properties': instance.properties,
      'documentation': instance.documentation,
      'since': instance.since,
      'proposed': instance.proposed,
      'mixins': instance.mixins$,
      'extends': instance.extends$,
    };

_MetaEnumMember _$MetaEnumMemberFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'value', 'documentation', 'since'],
  );
  return _MetaEnumMember(
    name: json['name'] as String,
    value: const IntOrStringSealedConverter().fromJson(json['value'] as Object),
    documentation: json['documentation'] as String?,
    since: json['since'] as String?,
  );
}

Map<String, dynamic> _$MetaEnumMemberToJson(_MetaEnumMember instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': const IntOrStringSealedConverter().toJson(instance.value),
      'documentation': instance.documentation,
      'since': instance.since,
    };

EnumRawValueInteger _$EnumRawValueIntegerFromJson(Map<String, dynamic> json) =>
    EnumRawValueInteger(
      raw: json['raw'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EnumRawValueIntegerToJson(
  EnumRawValueInteger instance,
) => <String, dynamic>{'raw': instance.raw, 'runtimeType': instance.$type};

EnumRawValueString _$EnumRawValueStringFromJson(Map<String, dynamic> json) =>
    EnumRawValueString(
      raw: json['raw'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EnumRawValueStringToJson(EnumRawValueString instance) =>
    <String, dynamic>{'raw': instance.raw, 'runtimeType': instance.$type};

_MetaEnumeration _$MetaEnumerationFromJson(Map<String, dynamic> json) {
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
  return _MetaEnumeration(
    name: json['name'] as String,
    type: MetaReference.fromJson(json['type'] as Map<String, dynamic>),
    values: (json['values'] as List<dynamic>)
        .map((e) => MetaEnumMember.fromJson(e as Map<String, dynamic>))
        .toList(),
    supportsCustomValues: json['supportsCustomValues'] as bool?,
    documentation: json['documentation'] as String?,
    since: json['since'] as String?,
    proposed: json['proposed'] as bool? ?? false,
  );
}

Map<String, dynamic> _$MetaEnumerationToJson(_MetaEnumeration instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'values': instance.values,
      'supportsCustomValues': instance.supportsCustomValues,
      'documentation': instance.documentation,
      'since': instance.since,
      'proposed': instance.proposed,
    };

_MetaTypeAlias _$MetaTypeAliasFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'type',
      'documentation',
      'since',
      'deprecated',
      'proposed',
      'optional',
    ],
  );
  return _MetaTypeAlias(
    name: json['name'] as String,
    type: MetaReference.fromJson(json['type'] as Map<String, dynamic>),
    documentation: json['documentation'] as String?,
    since: json['since'] as String?,
    deprecated: json['deprecated'] as String?,
    proposed: json['proposed'] as bool? ?? false,
    optional: json['optional'] as bool? ?? false,
  );
}

Map<String, dynamic> _$MetaTypeAliasToJson(_MetaTypeAlias instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'documentation': instance.documentation,
      'since': instance.since,
      'deprecated': instance.deprecated,
      'proposed': instance.proposed,
      'optional': instance.optional,
    };
