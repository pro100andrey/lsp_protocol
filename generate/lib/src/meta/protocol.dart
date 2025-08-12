import 'package:freezed_annotation/freezed_annotation.dart';

part 'protocol.freezed.dart';
part 'protocol.g.dart';

@freezed
abstract class MetaProtocol with _$MetaProtocol {
  const factory MetaProtocol({
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
    required String version,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, Object?> json) =>
      _$MetaDataFromJson(json);
}

@freezed
abstract class MetaRequest with _$MetaRequest {
  const factory MetaRequest({
    required String method,
    required MessageDirection messageDirection,
    MetaReference? params,
    MetaReference? result,
    String? documentation,
    MetaReference? partialResult,
    MetaReference? registrationOptions,
    String? since,
    bool? proposed,
    String? registrationMethod,
    MetaReference? errorData,
  }) = _MetaRequest;

  factory MetaRequest.fromJson(Map<String, Object?> json) =>
      _$MetaRequestFromJson(json);
}

@Freezed(unionKey: 'kind')
sealed class MetaReference with _$MetaReference {
  @FreezedUnionValue('reference')
  const factory MetaReference.type({
    required TypeKind kind,
    required String name,
  }) = TypeRef;

  @FreezedUnionValue('array')
  const factory MetaReference.array({
    required TypeKind kind,
    required MetaReference element,
  }) = ArrayRef;

  @FreezedUnionValue('base')
  const factory MetaReference.base({
    required TypeKind kind,
    required String name,
  }) = BaseRef;

  @FreezedUnionValue('or')
  const factory MetaReference.or({
    required TypeKind kind,
    required List<MetaReference> items,
  }) = OrRef;

  @FreezedUnionValue('and')
  const factory MetaReference.and({
    required TypeKind kind,
    required List<MetaReference> items,
  }) = AndRef;

  @FreezedUnionValue('map')
  const factory MetaReference.map({
    required TypeKind kind,
    required MetaReference key,
    required MetaReference value,
  }) = MapRef;

  @FreezedUnionValue('literal')
  const factory MetaReference.literal({
    required TypeKind kind,
    required MetaLiteral value,
  }) = LiteralRef;

  @FreezedUnionValue('stringLiteral')
  const factory MetaReference.stringLiteral({
    required TypeKind kind,
    required String value,
  }) = StringLiteralRef;

  @FreezedUnionValue('tuple')
  const factory MetaReference.tuple({
    required TypeKind kind,
    required List<MetaReference> items,
  }) = TupleRef;

  factory MetaReference.fromJson(Map<String, Object?> json) =>
      _$MetaReferenceFromJson(json);
}

@freezed
abstract class MetaLiteral with _$MetaLiteral {
  const factory MetaLiteral({
    required List<MetaProperty> properties,
  }) = _MetaLiteral;

  factory MetaLiteral.fromJson(Map<String, Object?> json) =>
      _$MetaLiteralFromJson(json);
}

@freezed
abstract class MetaNotification with _$MetaNotification {
  const factory MetaNotification({
    required String method,
    required MessageDirection messageDirection,
    MetaReference? params,
    String? documentation,
    MetaReference? registrationOptions,
    String? since,
    String? registrationMethod,
  }) = _MetaNotification;

  factory MetaNotification.fromJson(Map<String, Object?> json) =>
      _$MetaNotificationFromJson(json);
}

@freezed
abstract class MetaProperty with _$MetaProperty {
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
  const factory MetaEnumMember({
    required String name,
    @IntOrStringSealedConverter() required EnumRawValue value,
    String? documentation,
    String? since,
  }) = _MetaEnumMember;

  factory MetaEnumMember.fromJson(Map<String, Object?> json) =>
      _$MetaEnumMemberFromJson(json);
}

@freezed
sealed class EnumRawValue with _$EnumRawValue {
  factory EnumRawValue.fromJson(Map<String, Object?> json) =>
      _$EnumRawValueFromJson(json);
  const factory EnumRawValue.integer({
    required String raw,
  }) = EnumRawValueInteger;

  const factory EnumRawValue.string({
    required String raw,
  }) = EnumRawValueString;
}

@freezed
abstract class MetaEnumeration with _$MetaEnumeration {
  const factory MetaEnumeration({
    required String name,
    required MetaReference type,
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

// Custom converter for IntOrString sealed class
class IntOrStringSealedConverter
    implements JsonConverter<EnumRawValue, Object> {
  const IntOrStringSealedConverter();

  @override
  EnumRawValue fromJson(Object json) {
    if (json is int) {
      return EnumRawValue.integer(raw: json.toString());
    } else if (json is String) {
      return EnumRawValue.string(raw: json);
    }
    throw Exception(
      'Expected int or String for IntOrString, but got ${json.runtimeType}',
    );
  }

  @override
  Object toJson(EnumRawValue object) => object.raw;
}
