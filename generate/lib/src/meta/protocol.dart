import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/int_or_string_converter.dart';

part 'protocol.freezed.dart';
part 'protocol.g.dart';

@freezed
abstract class MetaProtocol with _$MetaProtocol {
  const factory MetaProtocol({
    @JsonSerializable(disallowUnrecognizedKeys: true)
    required MetaData metaData,
    required List<MetaRequest> requests,
    required List<MetaNotification> notifications,
    required List<MetaStructure> structures,
    required List<MetaEnumeration> enumerations,
    required List<MetaTypeAlias> typeAliases,
  }) = _MetaProtocol;

  factory MetaProtocol.fromJson(Map<String, Object?> json) =>
      _$MetaProtocolFromJson(json);
}

@freezed
abstract class MetaData with _$MetaData {
  const factory MetaData({
    @JsonSerializable(disallowUnrecognizedKeys: true) required String version,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, Object?> json) =>
      _$MetaDataFromJson(json);
}

@freezed
abstract class MetaRequest with _$MetaRequest {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaRequest({
    required String method,
    required MessageDirection messageDirection,
    TypeRef? params,
    MetaReference? result,
    String? documentation,
    MetaReference? partialResult,
    MetaReference? registrationOptions,
    String? since,
    bool? proposed,
    String? registrationMethod,
    TypeRef? errorData,
  }) = _MetaRequest;

  factory MetaRequest.fromJson(Map<String, Object?> json) =>
      _$MetaRequestFromJson(json);
}

@Freezed(unionKey: 'kind')
sealed class MetaReference with _$MetaReference {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('reference')
  const factory MetaReference.type({
    required TypeKind kind,
    required String name,
    @Default(false) bool optional,
  }) = TypeRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('array')
  const factory MetaReference.array({
    required MetaReference element,
    @Default(false) bool optional,
  }) = ArrayRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('base')
  const factory MetaReference.base({
    required String name,
    @Default(false) bool optional,
  }) = BaseRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('or')
  const factory MetaReference.or({
    required List<MetaReference> items,
    @Default(false) bool optional,
  }) = OrRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('and')
  const factory MetaReference.and({
    required List<TypeRef> items,
    @Default(false) bool optional,
  }) = AndRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('map')
  const factory MetaReference.map({
    required TypeRef key,
    required MetaReference value,
    @Default(false) bool optional,
  }) = MapRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('literal')
  const factory MetaReference.literal({
    required MetaLiteral value,
    @Default(false) bool optional,
  }) = LiteralRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('stringLiteral')
  const factory MetaReference.stringLiteral({
    required String value,
    @Default(false) bool optional,
  }) = StringLiteralRef;

  @JsonSerializable(disallowUnrecognizedKeys: true)
  @FreezedUnionValue('tuple')
  const factory MetaReference.tuple({
    required List<TypeRef> items,
    @Default(false) bool optional,
  }) = TupleRef;

  factory MetaReference.fromJson(Map<String, Object?> json) =>
      _$MetaReferenceFromJson(json);
}

@freezed
abstract class MetaLiteral with _$MetaLiteral {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaLiteral({
    required List<MetaProperty> properties,
  }) = _MetaLiteral;
  factory MetaLiteral.fromJson(Map<String, Object?> json) =>
      _$MetaLiteralFromJson(json);
}

@freezed
abstract class MetaNotification with _$MetaNotification {
  const factory MetaNotification({
    @JsonSerializable(disallowUnrecognizedKeys: true) required String method,
    required MessageDirection messageDirection,
    TypeRef? params,
    String? documentation,
    TypeRef? registrationOptions,
    String? since,
    String? registrationMethod,
  }) = _MetaNotification;

  factory MetaNotification.fromJson(Map<String, Object?> json) =>
      _$MetaNotificationFromJson(json);
}

@freezed
abstract class MetaProperty with _$MetaProperty {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaProperty({
    required String name,
    required MetaReference type,
    String? documentation,
    String? since,
    String? deprecated,
    @Default(false) bool optional,
    @Default(false) bool proposed,
  }) = _MetaProperty;

  factory MetaProperty.fromJson(Map<String, Object?> json) =>
      _$MetaPropertyFromJson(json);
}

@freezed
abstract class MetaStructure with _$MetaStructure {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaStructure({
    required String name,
    required List<MetaProperty> properties,
    String? documentation,
    String? since,
    @Default(false) bool proposed,
    @JsonKey(name: 'mixins') @Default([]) List<MetaReference> mixins$,
    @JsonKey(name: 'extends') @Default([]) List<MetaReference> extends$,
  }) = _MetaStructure;

  factory MetaStructure.fromJson(Map<String, Object?> json) =>
      _$MetaStructureFromJson(json);
}

@freezed
abstract class MetaEnumMember with _$MetaEnumMember {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaEnumMember({
    required String name,
    @IntOrStringSealedConverter() required IntOrString value,
    String? documentation,
    String? since,
  }) = _MetaEnumMember;

  factory MetaEnumMember.fromJson(Map<String, Object?> json) =>
      _$MetaEnumMemberFromJson(json);
}

@freezed
abstract class MetaEnumeration with _$MetaEnumeration {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaEnumeration({
    required String name,
    required TypeRef type,
    required List<MetaEnumMember> values,
    bool? supportsCustomValues,
    String? documentation,
    String? since,
    @Default(false) bool proposed,
  }) = _MetaEnumeration;

  factory MetaEnumeration.fromJson(Map<String, Object?> json) =>
      _$MetaEnumerationFromJson(json);
}

@freezed
abstract class MetaTypeAlias with _$MetaTypeAlias {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaTypeAlias({
    required String name,
    required MetaReference type,
    String? documentation,
    String? since,
    String? deprecated,
    @Default(false) bool proposed,
    @Default(false) bool optional,
  }) = _MetaTypeAlias;

  factory MetaTypeAlias.fromJson(Map<String, Object?> json) =>
      _$MetaTypeAliasFromJson(json);
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
