// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolved_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResolvedType {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResolvedType()';
}


}

/// @nodoc
class $ResolvedTypeCopyWith<$Res>  {
$ResolvedTypeCopyWith(ResolvedType _, $Res Function(ResolvedType) __);
}



/// @nodoc


class DartCoreType implements ResolvedType {
  const DartCoreType({required this.dartName});
  

 final  String dartName;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartCoreTypeCopyWith<DartCoreType> get copyWith => _$DartCoreTypeCopyWithImpl<DartCoreType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartCoreType&&(identical(other.dartName, dartName) || other.dartName == dartName));
}


@override
int get hashCode => Object.hash(runtimeType,dartName);

@override
String toString() {
  return 'ResolvedType.dartCore(dartName: $dartName)';
}


}

/// @nodoc
abstract mixin class $DartCoreTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $DartCoreTypeCopyWith(DartCoreType value, $Res Function(DartCoreType) _then) = _$DartCoreTypeCopyWithImpl;
@useResult
$Res call({
 String dartName
});




}
/// @nodoc
class _$DartCoreTypeCopyWithImpl<$Res>
    implements $DartCoreTypeCopyWith<$Res> {
  _$DartCoreTypeCopyWithImpl(this._self, this._then);

  final DartCoreType _self;
  final $Res Function(DartCoreType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dartName = null,}) {
  return _then(DartCoreType(
dartName: null == dartName ? _self.dartName : dartName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClassType implements ResolvedType {
  const ClassType({required this.ref});
  

 final  ResolvedClass ref;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassTypeCopyWith<ClassType> get copyWith => _$ClassTypeCopyWithImpl<ClassType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassType&&(identical(other.ref, ref) || other.ref == ref));
}


@override
int get hashCode => Object.hash(runtimeType,ref);

@override
String toString() {
  return 'ResolvedType.classType(ref: $ref)';
}


}

/// @nodoc
abstract mixin class $ClassTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $ClassTypeCopyWith(ClassType value, $Res Function(ClassType) _then) = _$ClassTypeCopyWithImpl;
@useResult
$Res call({
 ResolvedClass ref
});


$ResolvedClassCopyWith<$Res> get ref;

}
/// @nodoc
class _$ClassTypeCopyWithImpl<$Res>
    implements $ClassTypeCopyWith<$Res> {
  _$ClassTypeCopyWithImpl(this._self, this._then);

  final ClassType _self;
  final $Res Function(ClassType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ref = null,}) {
  return _then(ClassType(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as ResolvedClass,
  ));
}

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedClassCopyWith<$Res> get ref {
  
  return $ResolvedClassCopyWith<$Res>(_self.ref, (value) {
    return _then(_self.copyWith(ref: value));
  });
}
}

/// @nodoc


class EnumType implements ResolvedType {
  const EnumType({required this.ref});
  

 final  ResolvedEnum ref;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnumTypeCopyWith<EnumType> get copyWith => _$EnumTypeCopyWithImpl<EnumType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnumType&&(identical(other.ref, ref) || other.ref == ref));
}


@override
int get hashCode => Object.hash(runtimeType,ref);

@override
String toString() {
  return 'ResolvedType.enumType(ref: $ref)';
}


}

/// @nodoc
abstract mixin class $EnumTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $EnumTypeCopyWith(EnumType value, $Res Function(EnumType) _then) = _$EnumTypeCopyWithImpl;
@useResult
$Res call({
 ResolvedEnum ref
});


$ResolvedEnumCopyWith<$Res> get ref;

}
/// @nodoc
class _$EnumTypeCopyWithImpl<$Res>
    implements $EnumTypeCopyWith<$Res> {
  _$EnumTypeCopyWithImpl(this._self, this._then);

  final EnumType _self;
  final $Res Function(EnumType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ref = null,}) {
  return _then(EnumType(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as ResolvedEnum,
  ));
}

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedEnumCopyWith<$Res> get ref {
  
  return $ResolvedEnumCopyWith<$Res>(_self.ref, (value) {
    return _then(_self.copyWith(ref: value));
  });
}
}

/// @nodoc


class AliasType implements ResolvedType {
  const AliasType({required this.ref});
  

 final  ResolvedAlias ref;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AliasTypeCopyWith<AliasType> get copyWith => _$AliasTypeCopyWithImpl<AliasType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AliasType&&(identical(other.ref, ref) || other.ref == ref));
}


@override
int get hashCode => Object.hash(runtimeType,ref);

@override
String toString() {
  return 'ResolvedType.aliasType(ref: $ref)';
}


}

/// @nodoc
abstract mixin class $AliasTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $AliasTypeCopyWith(AliasType value, $Res Function(AliasType) _then) = _$AliasTypeCopyWithImpl;
@useResult
$Res call({
 ResolvedAlias ref
});


$ResolvedAliasCopyWith<$Res> get ref;

}
/// @nodoc
class _$AliasTypeCopyWithImpl<$Res>
    implements $AliasTypeCopyWith<$Res> {
  _$AliasTypeCopyWithImpl(this._self, this._then);

  final AliasType _self;
  final $Res Function(AliasType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ref = null,}) {
  return _then(AliasType(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as ResolvedAlias,
  ));
}

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedAliasCopyWith<$Res> get ref {
  
  return $ResolvedAliasCopyWith<$Res>(_self.ref, (value) {
    return _then(_self.copyWith(ref: value));
  });
}
}

/// @nodoc


class ListType implements ResolvedType {
  const ListType({required this.element});
  

 final  ResolvedType element;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListTypeCopyWith<ListType> get copyWith => _$ListTypeCopyWithImpl<ListType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListType&&(identical(other.element, element) || other.element == element));
}


@override
int get hashCode => Object.hash(runtimeType,element);

@override
String toString() {
  return 'ResolvedType.listType(element: $element)';
}


}

/// @nodoc
abstract mixin class $ListTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $ListTypeCopyWith(ListType value, $Res Function(ListType) _then) = _$ListTypeCopyWithImpl;
@useResult
$Res call({
 ResolvedType element
});


$ResolvedTypeCopyWith<$Res> get element;

}
/// @nodoc
class _$ListTypeCopyWithImpl<$Res>
    implements $ListTypeCopyWith<$Res> {
  _$ListTypeCopyWithImpl(this._self, this._then);

  final ListType _self;
  final $Res Function(ListType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? element = null,}) {
  return _then(ListType(
element: null == element ? _self.element : element // ignore: cast_nullable_to_non_nullable
as ResolvedType,
  ));
}

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get element {
  
  return $ResolvedTypeCopyWith<$Res>(_self.element, (value) {
    return _then(_self.copyWith(element: value));
  });
}
}

/// @nodoc


class MapType implements ResolvedType {
  const MapType({required this.key, required this.value});
  

 final  ResolvedType key;
 final  ResolvedType value;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapTypeCopyWith<MapType> get copyWith => _$MapTypeCopyWithImpl<MapType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapType&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'ResolvedType.mapType(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $MapTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $MapTypeCopyWith(MapType value, $Res Function(MapType) _then) = _$MapTypeCopyWithImpl;
@useResult
$Res call({
 ResolvedType key, ResolvedType value
});


$ResolvedTypeCopyWith<$Res> get key;$ResolvedTypeCopyWith<$Res> get value;

}
/// @nodoc
class _$MapTypeCopyWithImpl<$Res>
    implements $MapTypeCopyWith<$Res> {
  _$MapTypeCopyWithImpl(this._self, this._then);

  final MapType _self;
  final $Res Function(MapType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(MapType(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as ResolvedType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as ResolvedType,
  ));
}

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get key {
  
  return $ResolvedTypeCopyWith<$Res>(_self.key, (value) {
    return _then(_self.copyWith(key: value));
  });
}/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get value {
  
  return $ResolvedTypeCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class NullableType implements ResolvedType {
  const NullableType({required this.inner});
  

 final  ResolvedType inner;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NullableTypeCopyWith<NullableType> get copyWith => _$NullableTypeCopyWithImpl<NullableType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NullableType&&(identical(other.inner, inner) || other.inner == inner));
}


@override
int get hashCode => Object.hash(runtimeType,inner);

@override
String toString() {
  return 'ResolvedType.nullableType(inner: $inner)';
}


}

/// @nodoc
abstract mixin class $NullableTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $NullableTypeCopyWith(NullableType value, $Res Function(NullableType) _then) = _$NullableTypeCopyWithImpl;
@useResult
$Res call({
 ResolvedType inner
});


$ResolvedTypeCopyWith<$Res> get inner;

}
/// @nodoc
class _$NullableTypeCopyWithImpl<$Res>
    implements $NullableTypeCopyWith<$Res> {
  _$NullableTypeCopyWithImpl(this._self, this._then);

  final NullableType _self;
  final $Res Function(NullableType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inner = null,}) {
  return _then(NullableType(
inner: null == inner ? _self.inner : inner // ignore: cast_nullable_to_non_nullable
as ResolvedType,
  ));
}

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get inner {
  
  return $ResolvedTypeCopyWith<$Res>(_self.inner, (value) {
    return _then(_self.copyWith(inner: value));
  });
}
}

/// @nodoc


class UnionType implements ResolvedType {
  const UnionType({required final  List<ResolvedType> items}): _items = items;
  

 final  List<ResolvedType> _items;
 List<ResolvedType> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnionTypeCopyWith<UnionType> get copyWith => _$UnionTypeCopyWithImpl<UnionType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnionType&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ResolvedType.unionType(items: $items)';
}


}

/// @nodoc
abstract mixin class $UnionTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $UnionTypeCopyWith(UnionType value, $Res Function(UnionType) _then) = _$UnionTypeCopyWithImpl;
@useResult
$Res call({
 List<ResolvedType> items
});




}
/// @nodoc
class _$UnionTypeCopyWithImpl<$Res>
    implements $UnionTypeCopyWith<$Res> {
  _$UnionTypeCopyWithImpl(this._self, this._then);

  final UnionType _self;
  final $Res Function(UnionType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(UnionType(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ResolvedType>,
  ));
}


}

/// @nodoc


class TupleType implements ResolvedType {
  const TupleType({required final  List<ResolvedType> items}): _items = items;
  

 final  List<ResolvedType> _items;
 List<ResolvedType> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TupleTypeCopyWith<TupleType> get copyWith => _$TupleTypeCopyWithImpl<TupleType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TupleType&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ResolvedType.tupleType(items: $items)';
}


}

/// @nodoc
abstract mixin class $TupleTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $TupleTypeCopyWith(TupleType value, $Res Function(TupleType) _then) = _$TupleTypeCopyWithImpl;
@useResult
$Res call({
 List<ResolvedType> items
});




}
/// @nodoc
class _$TupleTypeCopyWithImpl<$Res>
    implements $TupleTypeCopyWith<$Res> {
  _$TupleTypeCopyWithImpl(this._self, this._then);

  final TupleType _self;
  final $Res Function(TupleType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(TupleType(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ResolvedType>,
  ));
}


}

/// @nodoc


class StringLiteralType implements ResolvedType {
  const StringLiteralType({required this.value});
  

 final  String value;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StringLiteralTypeCopyWith<StringLiteralType> get copyWith => _$StringLiteralTypeCopyWithImpl<StringLiteralType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StringLiteralType&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ResolvedType.stringLiteralType(value: $value)';
}


}

/// @nodoc
abstract mixin class $StringLiteralTypeCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $StringLiteralTypeCopyWith(StringLiteralType value, $Res Function(StringLiteralType) _then) = _$StringLiteralTypeCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$StringLiteralTypeCopyWithImpl<$Res>
    implements $StringLiteralTypeCopyWith<$Res> {
  _$StringLiteralTypeCopyWithImpl(this._self, this._then);

  final StringLiteralType _self;
  final $Res Function(StringLiteralType) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(StringLiteralType(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InlineRecord implements ResolvedType {
  const InlineRecord({required final  List<ResolvedProperty> fields}): _fields = fields;
  

 final  List<ResolvedProperty> _fields;
 List<ResolvedProperty> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}


/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InlineRecordCopyWith<InlineRecord> get copyWith => _$InlineRecordCopyWithImpl<InlineRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InlineRecord&&const DeepCollectionEquality().equals(other._fields, _fields));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'ResolvedType.inlineRecord(fields: $fields)';
}


}

/// @nodoc
abstract mixin class $InlineRecordCopyWith<$Res> implements $ResolvedTypeCopyWith<$Res> {
  factory $InlineRecordCopyWith(InlineRecord value, $Res Function(InlineRecord) _then) = _$InlineRecordCopyWithImpl;
@useResult
$Res call({
 List<ResolvedProperty> fields
});




}
/// @nodoc
class _$InlineRecordCopyWithImpl<$Res>
    implements $InlineRecordCopyWith<$Res> {
  _$InlineRecordCopyWithImpl(this._self, this._then);

  final InlineRecord _self;
  final $Res Function(InlineRecord) _then;

/// Create a copy of ResolvedType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fields = null,}) {
  return _then(InlineRecord(
fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<ResolvedProperty>,
  ));
}


}

// dart format on
