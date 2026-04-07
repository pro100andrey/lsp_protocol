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


/// Adds pattern-matching-related methods to [ResolvedType].
extension ResolvedTypePatterns on ResolvedType {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DartCoreType value)?  dartCore,TResult Function( ClassType value)?  classType,TResult Function( EnumType value)?  enumType,TResult Function( AliasType value)?  aliasType,TResult Function( ListType value)?  listType,TResult Function( MapType value)?  mapType,TResult Function( NullableType value)?  nullableType,TResult Function( UnionType value)?  unionType,TResult Function( TupleType value)?  tupleType,TResult Function( StringLiteralType value)?  stringLiteralType,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DartCoreType() when dartCore != null:
return dartCore(_that);case ClassType() when classType != null:
return classType(_that);case EnumType() when enumType != null:
return enumType(_that);case AliasType() when aliasType != null:
return aliasType(_that);case ListType() when listType != null:
return listType(_that);case MapType() when mapType != null:
return mapType(_that);case NullableType() when nullableType != null:
return nullableType(_that);case UnionType() when unionType != null:
return unionType(_that);case TupleType() when tupleType != null:
return tupleType(_that);case StringLiteralType() when stringLiteralType != null:
return stringLiteralType(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DartCoreType value)  dartCore,required TResult Function( ClassType value)  classType,required TResult Function( EnumType value)  enumType,required TResult Function( AliasType value)  aliasType,required TResult Function( ListType value)  listType,required TResult Function( MapType value)  mapType,required TResult Function( NullableType value)  nullableType,required TResult Function( UnionType value)  unionType,required TResult Function( TupleType value)  tupleType,required TResult Function( StringLiteralType value)  stringLiteralType,}){
final _that = this;
switch (_that) {
case DartCoreType():
return dartCore(_that);case ClassType():
return classType(_that);case EnumType():
return enumType(_that);case AliasType():
return aliasType(_that);case ListType():
return listType(_that);case MapType():
return mapType(_that);case NullableType():
return nullableType(_that);case UnionType():
return unionType(_that);case TupleType():
return tupleType(_that);case StringLiteralType():
return stringLiteralType(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DartCoreType value)?  dartCore,TResult? Function( ClassType value)?  classType,TResult? Function( EnumType value)?  enumType,TResult? Function( AliasType value)?  aliasType,TResult? Function( ListType value)?  listType,TResult? Function( MapType value)?  mapType,TResult? Function( NullableType value)?  nullableType,TResult? Function( UnionType value)?  unionType,TResult? Function( TupleType value)?  tupleType,TResult? Function( StringLiteralType value)?  stringLiteralType,}){
final _that = this;
switch (_that) {
case DartCoreType() when dartCore != null:
return dartCore(_that);case ClassType() when classType != null:
return classType(_that);case EnumType() when enumType != null:
return enumType(_that);case AliasType() when aliasType != null:
return aliasType(_that);case ListType() when listType != null:
return listType(_that);case MapType() when mapType != null:
return mapType(_that);case NullableType() when nullableType != null:
return nullableType(_that);case UnionType() when unionType != null:
return unionType(_that);case TupleType() when tupleType != null:
return tupleType(_that);case StringLiteralType() when stringLiteralType != null:
return stringLiteralType(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String dartName)?  dartCore,TResult Function( ResolvedClass ref)?  classType,TResult Function( ResolvedEnum ref)?  enumType,TResult Function( ResolvedAlias ref)?  aliasType,TResult Function( ResolvedType element)?  listType,TResult Function( ResolvedType key,  ResolvedType value)?  mapType,TResult Function( ResolvedType inner)?  nullableType,TResult Function( List<ResolvedType> items)?  unionType,TResult Function( List<ResolvedType> items)?  tupleType,TResult Function( String value)?  stringLiteralType,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DartCoreType() when dartCore != null:
return dartCore(_that.dartName);case ClassType() when classType != null:
return classType(_that.ref);case EnumType() when enumType != null:
return enumType(_that.ref);case AliasType() when aliasType != null:
return aliasType(_that.ref);case ListType() when listType != null:
return listType(_that.element);case MapType() when mapType != null:
return mapType(_that.key,_that.value);case NullableType() when nullableType != null:
return nullableType(_that.inner);case UnionType() when unionType != null:
return unionType(_that.items);case TupleType() when tupleType != null:
return tupleType(_that.items);case StringLiteralType() when stringLiteralType != null:
return stringLiteralType(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String dartName)  dartCore,required TResult Function( ResolvedClass ref)  classType,required TResult Function( ResolvedEnum ref)  enumType,required TResult Function( ResolvedAlias ref)  aliasType,required TResult Function( ResolvedType element)  listType,required TResult Function( ResolvedType key,  ResolvedType value)  mapType,required TResult Function( ResolvedType inner)  nullableType,required TResult Function( List<ResolvedType> items)  unionType,required TResult Function( List<ResolvedType> items)  tupleType,required TResult Function( String value)  stringLiteralType,}) {final _that = this;
switch (_that) {
case DartCoreType():
return dartCore(_that.dartName);case ClassType():
return classType(_that.ref);case EnumType():
return enumType(_that.ref);case AliasType():
return aliasType(_that.ref);case ListType():
return listType(_that.element);case MapType():
return mapType(_that.key,_that.value);case NullableType():
return nullableType(_that.inner);case UnionType():
return unionType(_that.items);case TupleType():
return tupleType(_that.items);case StringLiteralType():
return stringLiteralType(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String dartName)?  dartCore,TResult? Function( ResolvedClass ref)?  classType,TResult? Function( ResolvedEnum ref)?  enumType,TResult? Function( ResolvedAlias ref)?  aliasType,TResult? Function( ResolvedType element)?  listType,TResult? Function( ResolvedType key,  ResolvedType value)?  mapType,TResult? Function( ResolvedType inner)?  nullableType,TResult? Function( List<ResolvedType> items)?  unionType,TResult? Function( List<ResolvedType> items)?  tupleType,TResult? Function( String value)?  stringLiteralType,}) {final _that = this;
switch (_that) {
case DartCoreType() when dartCore != null:
return dartCore(_that.dartName);case ClassType() when classType != null:
return classType(_that.ref);case EnumType() when enumType != null:
return enumType(_that.ref);case AliasType() when aliasType != null:
return aliasType(_that.ref);case ListType() when listType != null:
return listType(_that.element);case MapType() when mapType != null:
return mapType(_that.key,_that.value);case NullableType() when nullableType != null:
return nullableType(_that.inner);case UnionType() when unionType != null:
return unionType(_that.items);case TupleType() when tupleType != null:
return tupleType(_that.items);case StringLiteralType() when stringLiteralType != null:
return stringLiteralType(_that.value);case _:
  return null;

}
}

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

// dart format on
