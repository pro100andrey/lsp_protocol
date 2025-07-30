import 'package:freezed_annotation/freezed_annotation.dart';

import '../visiters/visitor.dart';

part 'protocol.freezed.dart';
part 'protocol.g.dart';

typedef OrMapReference = ({OrRef orRef, String name});

sealed class BaseMeta {
  const BaseMeta();

  T accept<T>(MetaProtocolVisitor<T> visitor);
}

@freezed
abstract class MetaProtocol extends BaseMeta with _$MetaProtocol {
  const factory MetaProtocol({
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
    required String version,
  }) = _MetaData;

  const MetaData._();

  factory MetaData.fromJson(Map<String, Object?> json) =>
      _$MetaDataFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitMetaData(this);
}

@freezed
abstract class MetaRequest extends BaseMeta with _$MetaRequest {
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

  const MetaRequest._();

  factory MetaRequest.fromJson(Map<String, Object?> json) =>
      _$MetaRequestFromJson(json);

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => visitor.visitRequest(this);
}

@Freezed(unionKey: 'kind')
sealed class MetaReference extends BaseMeta with _$MetaReference {
  const MetaReference._();

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

  @override
  T accept<T>(MetaProtocolVisitor<T> visitor) => throw UnimplementedError(
    'MetaReference should not be visited directly by MetaProtocolVisitor '
    'for type resolution. Use its specific visit methods instead.',
  );

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

  bool get isType => this is TypeRef;
  bool get isBase => this is BaseRef;
  bool get isOr => this is OrRef;
  bool get isAnd => this is AndRef;
  bool get isArray => this is ArrayRef;
  bool get isMap => this is MapRef;
  bool get isLiteral => this is LiteralRef;
  bool get isStringLiteral => this is StringLiteralRef;
  bool get isTuple => this is TupleRef;
}

@freezed
abstract class MetaLiteral extends BaseMeta with _$MetaLiteral {
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
    required String method,
    required MessageDirection messageDirection,
    MetaReference? params,
    String? documentation,
    MetaReference? registrationOptions,
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
  const factory MetaEnumMember({
    required String name,
    @IntOrStringSealedConverter() required EnumRawValue value,
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
sealed class EnumRawValue with _$EnumRawValue {
  factory EnumRawValue.fromJson(Map<String, Object?> json) =>
      _$EnumRawValueFromJson(json);
  const factory EnumRawValue.integer({
    required String raw,
  }) = EnumRawValueInteger;

  const factory EnumRawValue.string({
    required String raw,
  }) = EnumRawValueString;

  const EnumRawValue._();

  String get type => switch (this) {
    EnumRawValueInteger() => 'int',
    EnumRawValueString() => 'String',
  };

  String get literal => switch (this) {
    EnumRawValueInteger(raw: final value) => value,
    EnumRawValueString(raw: final value) => "'$value'",
  };
}

@freezed
abstract class MetaEnumeration extends BaseMeta with _$MetaEnumeration {
  const factory MetaEnumeration({
    required String name,
    required MetaReference type,
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
