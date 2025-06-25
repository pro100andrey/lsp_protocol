import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/int_or_string_converter.dart';

part 'protocol.freezed.dart';
part 'protocol.g.dart';

abstract class MetaReferenceVisitor<T> {
  const MetaReferenceVisitor();

  // Methods for visiting MetaReference types
  T visitTypeRef(TypeRef ref);
  T visitArrayRef(ArrayRef ref);
  T visitBaseRef(BaseRef ref);
  T visitOrRef(OrRef ref);
  T visitAndRef(AndRef ref);
  T visitMapRef(MapRef ref);
  T visitLiteralRef(LiteralRef ref);
  T visitStringLiteralRef(StringLiteralRef ref);
  T visitTupleRef(TupleRef ref);
}

abstract class MetaProtocolVisitor<T> implements MetaReferenceVisitor<T> {
  const MetaProtocolVisitor();

  T visitProtocol(MetaProtocol protocol);
  T visitMetaData(MetaData metaData);
  T visitRequest(MetaRequest request);
  T visitNotification(MetaNotification notification);
  T visitStructure(MetaStructure structure);
  T visitEnumeration(MetaEnumeration enumeration);
  T visitTypeAlias(MetaTypeAlias typeAlias);

  T visitProperty(MetaProperty property);
  T visitEnumMember(MetaEnumMember enumMember);
  T visitLiteral(MetaLiteral literal);
}

sealed class BaseMeta {
  const BaseMeta();

  T accept<T>(MetaProtocolVisitor<T> visitor);
}

@freezed
abstract class MetaProtocol extends BaseMeta with _$MetaProtocol {
  const factory MetaProtocol({
    @JsonSerializable(disallowUnrecognizedKeys: true)
    required MetaData metaData,
    required List<MetaRequest> requests,
    required List<MetaNotification> notifications,
    required List<MetaStructure> structures,
    required List<MetaEnumeration> enumerations,
    required List<MetaTypeAlias> typeAliases,
  }) = _MetaProtocol;

  const MetaProtocol._();

  factory MetaProtocol.fromJson(Map<String, Object?> json) =>
      _$MetaProtocolFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitProtocol(this);
}

@freezed
abstract class MetaData extends BaseMeta with _$MetaData {
  const factory MetaData({
    @JsonSerializable(disallowUnrecognizedKeys: true) required String version,
  }) = _MetaData;

  const MetaData._();

  factory MetaData.fromJson(Map<String, Object?> json) =>
      _$MetaDataFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitMetaData(this);
}

@freezed
abstract class MetaRequest extends BaseMeta with _$MetaRequest {
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

  const MetaRequest._();

  factory MetaRequest.fromJson(Map<String, Object?> json) =>
      _$MetaRequestFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitRequest(this);
}

@Freezed(unionKey: 'kind')
sealed class MetaReference extends BaseMeta with _$MetaReference {
  const MetaReference._();

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

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => throw UnimplementedError(
    'MetaReference should not be visited directly by MetaProtocolVisitor '
    'for type resolution. Use its specific visit methods instead.',
  );

  // Метод, который будет использоваться с TypeResolverVisitor
  R resolveType<R>(MetaReferenceVisitor<R> visitor) => switch (this) {
    final TypeRef ref => visitor.visitTypeRef(ref),
    final ArrayRef ref => visitor.visitArrayRef(ref),
    final BaseRef ref => visitor.visitBaseRef(ref),
    final OrRef ref => visitor.visitOrRef(ref),
    final AndRef ref => visitor.visitAndRef(ref),
    final MapRef ref => visitor.visitMapRef(ref),
    final LiteralRef ref => visitor.visitLiteralRef(ref),
    final StringLiteralRef ref => visitor.visitStringLiteralRef(ref),
    final TupleRef ref => visitor.visitTupleRef(ref),
  };
}

@freezed
abstract class MetaLiteral extends BaseMeta with _$MetaLiteral {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaLiteral({
    required List<MetaProperty> properties,
  }) = _MetaLiteral;

  const MetaLiteral._();

  factory MetaLiteral.fromJson(Map<String, Object?> json) =>
      _$MetaLiteralFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitLiteral(this);
}

@freezed
abstract class MetaNotification extends BaseMeta with _$MetaNotification {
  const factory MetaNotification({
    @JsonSerializable(disallowUnrecognizedKeys: true) required String method,
    required MessageDirection messageDirection,
    TypeRef? params,
    String? documentation,
    TypeRef? registrationOptions,
    String? since,
    String? registrationMethod,
  }) = _MetaNotification;

  const MetaNotification._();

  factory MetaNotification.fromJson(Map<String, Object?> json) =>
      _$MetaNotificationFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) =>
      visitor.visitNotification(this);
}

@freezed
abstract class MetaProperty extends BaseMeta with _$MetaProperty {
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

  const MetaProperty._();

  factory MetaProperty.fromJson(Map<String, Object?> json) =>
      _$MetaPropertyFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitProperty(this);
}

@freezed
abstract class MetaStructure extends BaseMeta with _$MetaStructure {
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

  const MetaStructure._();

  factory MetaStructure.fromJson(Map<String, Object?> json) =>
      _$MetaStructureFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitStructure(this);
}

@freezed
abstract class MetaEnumMember extends BaseMeta with _$MetaEnumMember {
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory MetaEnumMember({
    required String name,
    @IntOrStringSealedConverter() required IntOrString value,
    String? documentation,
    String? since,
  }) = _MetaEnumMember;

  const MetaEnumMember._();

  factory MetaEnumMember.fromJson(Map<String, Object?> json) =>
      _$MetaEnumMemberFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitEnumMember(this);
}

@freezed
abstract class MetaEnumeration extends BaseMeta with _$MetaEnumeration {
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

  const MetaEnumeration._();

  factory MetaEnumeration.fromJson(Map<String, Object?> json) =>
      _$MetaEnumerationFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitEnumeration(this);
}

@freezed
abstract class MetaTypeAlias extends BaseMeta with _$MetaTypeAlias {
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

  const MetaTypeAlias._();

  factory MetaTypeAlias.fromJson(Map<String, Object?> json) =>
      _$MetaTypeAliasFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitTypeAlias(this);
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
