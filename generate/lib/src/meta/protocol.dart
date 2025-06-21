import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';

sealed class Meta extends Equatable {
  const Meta();

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool get stringify => false;
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class MetaProtocol extends Meta {
  const MetaProtocol({
    required this.metaData,
    required this.requests,
    required this.notifications,
    required this.structures,
    required this.enumerations,
    required this.typeAliases,
  });

  factory MetaProtocol.fromJson(Map<String, dynamic> json) =>
      _$MetaProtocolFromJson(json);

  final MetaData metaData;
  final List<MetaRequest> requests;
  final List<MetaNotification> notifications;
  final List<MetaStructure> structures;
  final List<MetaEnumeration> enumerations;
  final List<Element> typeAliases;

  @override
  List<Object?> get props => [
    metaData,
    requests,
    notifications,
    structures,
    enumerations,
  ];

  Map<String, dynamic> toJson() => _$MetaProtocolToJson(this);
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class MetaData extends Meta {
  const MetaData({required this.version});

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  final String version;

  @override
  List<Object?> get props => [version];

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class MetaRequest extends Meta {
  const MetaRequest({
    required this.method,
    required this.messageDirection,
    required this.params,
    required this.result,
    required this.documentation,
    required this.partialResult,
    required this.registrationOptions,
    required this.since,
    required this.proposed,
    required this.registrationMethod,
    required this.errorData,
  });

  factory MetaRequest.fromJson(Map<String, dynamic> json) =>
      _$MetaRequestFromJson(json);

  final String method;
  final MessageDirection messageDirection;
  final Element? params;
  final Element? result;
  final String? documentation;
  final Element? partialResult;
  final Element? registrationOptions;
  final String? since;
  final bool? proposed;
  final String? registrationMethod;
  final Element? errorData;

  @override
  List<Object?> get props => [
    method,
    params,
    result,
    messageDirection,
    documentation,
    partialResult,
    registrationOptions,
    since,
    proposed,
    registrationMethod,
    errorData,
  ];

  Map<String, dynamic> toJson() => _$MetaRequestToJson(this);
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class MetaNotification extends Meta {
  const MetaNotification({
    required this.method,
    required this.params,
    required this.messageDirection,
    required this.documentation,
    required this.registrationOptions,
    required this.since,
    required this.registrationMethod,
  });

  factory MetaNotification.fromJson(Map<String, dynamic> json) =>
      _$MetaNotificationFromJson(json);

  final String method;
  final Element? params;
  final MessageDirection messageDirection;
  final String? documentation;
  final Element? registrationOptions;
  final String? since;
  final String? registrationMethod;

  @override
  List<Object?> get props => [
    method,
    params,
    messageDirection,
    documentation,
    registrationOptions,
    since,
    registrationMethod,
  ];

  Map<String, dynamic> toJson() => _$MetaNotificationToJson(this);
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class MetaStructure extends Meta {
  const MetaStructure({
    required this.name,
    required this.properties,
    required this.extends$,
    required this.mixins,
    required this.documentation,
    required this.since,
    required this.proposed,
  });

  factory MetaStructure.fromJson(Map<String, dynamic> json) =>
      _$MetaStructureFromJson(json);

  final String name;
  final List<Element> properties;
  @JsonKey(name: 'extends')
  final List<Element>? extends$;
  final List<Element>? mixins;
  final String? documentation;
  final String? since;
  final bool? proposed;

  @override
  List<Object?> get props => [
    name,
    properties,
    extends$,
    mixins,
    documentation,
    since,
    proposed,
  ];

  Map<String, dynamic> toJson() => _$MetaStructureToJson(this);
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class MetaEnumeration extends Meta {
  const MetaEnumeration({
    required this.name,
    required this.type,
    required this.values,
    this.supportsCustomValues,
    this.documentation,
    this.since,
    this.proposed,
  });

  factory MetaEnumeration.fromJson(Map<String, dynamic> json) =>
      _$MetaEnumerationFromJson(json);

  final String name;
  final Element type;
  final List<Element> values;
  final bool? supportsCustomValues;
  final String? documentation;
  final String? since;
  final bool? proposed;

  @override
  List<Object?> get props => [
    name,
    type,
    values,
    supportsCustomValues,
    documentation,
    since,
    proposed,
  ];

  Map<String, dynamic> toJson() => _$MetaEnumerationToJson(this);
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class Element extends Meta {
  const Element({
    required this.kind,
    required this.items,
    required this.element,
    required this.name,
    required this.type,
    required this.documentation,
    required this.optional,
    required this.since,
    required this.proposed,
    required this.key,
    required this.value,
    required this.properties,
    required this.deprecated,
  });

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);

  final TypeKind? kind;
  final String? name;
  final Element? element;
  final List<Element>? items;
  final Element? type;
  final String? documentation;
  final bool? optional;
  final String? since;
  final bool? proposed;
  final Element? key;
  final Object? value;
  final List<Element>? properties;
  final String? deprecated;

  @override
  List<Object?> get props => [
    kind,
    items,
    element,
    name,
    type,
    documentation,
    optional,
    since,
    proposed,
    key,
    value,
    properties,
    deprecated,
  ];

  Map<String, dynamic> toJson() => _$ElementToJson(this);
}

@JsonEnum(valueField: 'kind')
enum TypeKind {
  array('array'),
  base$('base'),
  literal('literal'),
  map('map'),
  or('or'),
  and('and'),
  reference('reference'),
  string('stringLiteral'),
  tuple('tuple');

  const TypeKind(this.kind);
  final String kind;
}

@JsonEnum(valueField: 'messageDirection')
enum MessageDirection {
  both('both'),
  clientToServer('clientToServer'),
  serverToClient('serverToClient');

  const MessageDirection(this.messageDirection);
  final String messageDirection;
}
