// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolved_decl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResolvedClass {

 String get name; set name(String value); List<ResolvedProperty> get properties; set properties(List<ResolvedProperty> value); List<ClassType> get extends$; set extends$(List<ClassType> value); List<ClassType> get mixins$; set mixins$(List<ClassType> value); String? get documentation; set documentation(String? value); String? get since; set since(String? value); bool get proposed; set proposed(bool value);
/// Create a copy of ResolvedClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedClassCopyWith<ResolvedClass> get copyWith => _$ResolvedClassCopyWithImpl<ResolvedClass>(this as ResolvedClass, _$identity);





@override
String toString() {
  return 'ResolvedClass(name: $name, properties: $properties, extends\$: ${extends$}, mixins\$: ${mixins$}, documentation: $documentation, since: $since, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class $ResolvedClassCopyWith<$Res>  {
  factory $ResolvedClassCopyWith(ResolvedClass value, $Res Function(ResolvedClass) _then) = _$ResolvedClassCopyWithImpl;
@useResult
$Res call({
 String name, List<ResolvedProperty> properties, List<ClassType> extends$, List<ClassType> mixins$, String? documentation, String? since, bool proposed
});




}
/// @nodoc
class _$ResolvedClassCopyWithImpl<$Res>
    implements $ResolvedClassCopyWith<$Res> {
  _$ResolvedClassCopyWithImpl(this._self, this._then);

  final ResolvedClass _self;
  final $Res Function(ResolvedClass) _then;

/// Create a copy of ResolvedClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? properties = null,Object? extends$ = null,Object? mixins$ = null,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as List<ResolvedProperty>,extends$: null == extends$ ? _self.extends$ : extends$ // ignore: cast_nullable_to_non_nullable
as List<ClassType>,mixins$: null == mixins$ ? _self.mixins$ : mixins$ // ignore: cast_nullable_to_non_nullable
as List<ClassType>,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ResolvedClass].
extension ResolvedClassPatterns on ResolvedClass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedClass() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedClass value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedClass():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedClass value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedClass() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<ResolvedProperty> properties,  List<ClassType> extends$,  List<ClassType> mixins$,  String? documentation,  String? since,  bool proposed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedClass() when $default != null:
return $default(_that.name,_that.properties,_that.extends$,_that.mixins$,_that.documentation,_that.since,_that.proposed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<ResolvedProperty> properties,  List<ClassType> extends$,  List<ClassType> mixins$,  String? documentation,  String? since,  bool proposed)  $default,) {final _that = this;
switch (_that) {
case _ResolvedClass():
return $default(_that.name,_that.properties,_that.extends$,_that.mixins$,_that.documentation,_that.since,_that.proposed);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<ResolvedProperty> properties,  List<ClassType> extends$,  List<ClassType> mixins$,  String? documentation,  String? since,  bool proposed)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedClass() when $default != null:
return $default(_that.name,_that.properties,_that.extends$,_that.mixins$,_that.documentation,_that.since,_that.proposed);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedClass extends ResolvedClass {
   _ResolvedClass({required this.name, required this.properties, this.extends$ = const [], this.mixins$ = const [], this.documentation, this.since, this.proposed = false}): super._();
  

@override  String name;
@override  List<ResolvedProperty> properties;
@override@JsonKey()  List<ClassType> extends$;
@override@JsonKey()  List<ClassType> mixins$;
@override  String? documentation;
@override  String? since;
@override@JsonKey()  bool proposed;

/// Create a copy of ResolvedClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedClassCopyWith<_ResolvedClass> get copyWith => __$ResolvedClassCopyWithImpl<_ResolvedClass>(this, _$identity);





@override
String toString() {
  return 'ResolvedClass(name: $name, properties: $properties, extends\$: ${extends$}, mixins\$: ${mixins$}, documentation: $documentation, since: $since, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class _$ResolvedClassCopyWith<$Res> implements $ResolvedClassCopyWith<$Res> {
  factory _$ResolvedClassCopyWith(_ResolvedClass value, $Res Function(_ResolvedClass) _then) = __$ResolvedClassCopyWithImpl;
@override @useResult
$Res call({
 String name, List<ResolvedProperty> properties, List<ClassType> extends$, List<ClassType> mixins$, String? documentation, String? since, bool proposed
});




}
/// @nodoc
class __$ResolvedClassCopyWithImpl<$Res>
    implements _$ResolvedClassCopyWith<$Res> {
  __$ResolvedClassCopyWithImpl(this._self, this._then);

  final _ResolvedClass _self;
  final $Res Function(_ResolvedClass) _then;

/// Create a copy of ResolvedClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? properties = null,Object? extends$ = null,Object? mixins$ = null,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_ResolvedClass(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as List<ResolvedProperty>,extends$: null == extends$ ? _self.extends$ : extends$ // ignore: cast_nullable_to_non_nullable
as List<ClassType>,mixins$: null == mixins$ ? _self.mixins$ : mixins$ // ignore: cast_nullable_to_non_nullable
as List<ClassType>,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ResolvedEnum {

 String get name; List<ResolvedEnumMember> get members; String get valueType; bool get supportsCustomValues; String? get documentation; String? get since; bool get proposed;
/// Create a copy of ResolvedEnum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedEnumCopyWith<ResolvedEnum> get copyWith => _$ResolvedEnumCopyWithImpl<ResolvedEnum>(this as ResolvedEnum, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedEnum&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.valueType, valueType) || other.valueType == valueType)&&(identical(other.supportsCustomValues, supportsCustomValues) || other.supportsCustomValues == supportsCustomValues)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(members),valueType,supportsCustomValues,documentation,since,proposed);

@override
String toString() {
  return 'ResolvedEnum(name: $name, members: $members, valueType: $valueType, supportsCustomValues: $supportsCustomValues, documentation: $documentation, since: $since, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class $ResolvedEnumCopyWith<$Res>  {
  factory $ResolvedEnumCopyWith(ResolvedEnum value, $Res Function(ResolvedEnum) _then) = _$ResolvedEnumCopyWithImpl;
@useResult
$Res call({
 String name, List<ResolvedEnumMember> members, String valueType, bool supportsCustomValues, String? documentation, String? since, bool proposed
});




}
/// @nodoc
class _$ResolvedEnumCopyWithImpl<$Res>
    implements $ResolvedEnumCopyWith<$Res> {
  _$ResolvedEnumCopyWithImpl(this._self, this._then);

  final ResolvedEnum _self;
  final $Res Function(ResolvedEnum) _then;

/// Create a copy of ResolvedEnum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? members = null,Object? valueType = null,Object? supportsCustomValues = null,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<ResolvedEnumMember>,valueType: null == valueType ? _self.valueType : valueType // ignore: cast_nullable_to_non_nullable
as String,supportsCustomValues: null == supportsCustomValues ? _self.supportsCustomValues : supportsCustomValues // ignore: cast_nullable_to_non_nullable
as bool,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ResolvedEnum].
extension ResolvedEnumPatterns on ResolvedEnum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedEnum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedEnum() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedEnum value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedEnum():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedEnum value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedEnum() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<ResolvedEnumMember> members,  String valueType,  bool supportsCustomValues,  String? documentation,  String? since,  bool proposed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedEnum() when $default != null:
return $default(_that.name,_that.members,_that.valueType,_that.supportsCustomValues,_that.documentation,_that.since,_that.proposed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<ResolvedEnumMember> members,  String valueType,  bool supportsCustomValues,  String? documentation,  String? since,  bool proposed)  $default,) {final _that = this;
switch (_that) {
case _ResolvedEnum():
return $default(_that.name,_that.members,_that.valueType,_that.supportsCustomValues,_that.documentation,_that.since,_that.proposed);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<ResolvedEnumMember> members,  String valueType,  bool supportsCustomValues,  String? documentation,  String? since,  bool proposed)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedEnum() when $default != null:
return $default(_that.name,_that.members,_that.valueType,_that.supportsCustomValues,_that.documentation,_that.since,_that.proposed);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedEnum implements ResolvedEnum {
  const _ResolvedEnum({required this.name, required final  List<ResolvedEnumMember> members, required this.valueType, this.supportsCustomValues = false, this.documentation, this.since, this.proposed = false}): _members = members;
  

@override final  String name;
 final  List<ResolvedEnumMember> _members;
@override List<ResolvedEnumMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override final  String valueType;
@override@JsonKey() final  bool supportsCustomValues;
@override final  String? documentation;
@override final  String? since;
@override@JsonKey() final  bool proposed;

/// Create a copy of ResolvedEnum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedEnumCopyWith<_ResolvedEnum> get copyWith => __$ResolvedEnumCopyWithImpl<_ResolvedEnum>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedEnum&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.valueType, valueType) || other.valueType == valueType)&&(identical(other.supportsCustomValues, supportsCustomValues) || other.supportsCustomValues == supportsCustomValues)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_members),valueType,supportsCustomValues,documentation,since,proposed);

@override
String toString() {
  return 'ResolvedEnum(name: $name, members: $members, valueType: $valueType, supportsCustomValues: $supportsCustomValues, documentation: $documentation, since: $since, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class _$ResolvedEnumCopyWith<$Res> implements $ResolvedEnumCopyWith<$Res> {
  factory _$ResolvedEnumCopyWith(_ResolvedEnum value, $Res Function(_ResolvedEnum) _then) = __$ResolvedEnumCopyWithImpl;
@override @useResult
$Res call({
 String name, List<ResolvedEnumMember> members, String valueType, bool supportsCustomValues, String? documentation, String? since, bool proposed
});




}
/// @nodoc
class __$ResolvedEnumCopyWithImpl<$Res>
    implements _$ResolvedEnumCopyWith<$Res> {
  __$ResolvedEnumCopyWithImpl(this._self, this._then);

  final _ResolvedEnum _self;
  final $Res Function(_ResolvedEnum) _then;

/// Create a copy of ResolvedEnum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? members = null,Object? valueType = null,Object? supportsCustomValues = null,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_ResolvedEnum(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<ResolvedEnumMember>,valueType: null == valueType ? _self.valueType : valueType // ignore: cast_nullable_to_non_nullable
as String,supportsCustomValues: null == supportsCustomValues ? _self.supportsCustomValues : supportsCustomValues // ignore: cast_nullable_to_non_nullable
as bool,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ResolvedAlias {

 String get name; set name(String value); ResolvedType get type; set type(ResolvedType value); String? get documentation; set documentation(String? value); String? get since; set since(String? value); String? get deprecated; set deprecated(String? value); bool get proposed; set proposed(bool value);
/// Create a copy of ResolvedAlias
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedAliasCopyWith<ResolvedAlias> get copyWith => _$ResolvedAliasCopyWithImpl<ResolvedAlias>(this as ResolvedAlias, _$identity);





@override
String toString() {
  return 'ResolvedAlias(name: $name, type: $type, documentation: $documentation, since: $since, deprecated: $deprecated, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class $ResolvedAliasCopyWith<$Res>  {
  factory $ResolvedAliasCopyWith(ResolvedAlias value, $Res Function(ResolvedAlias) _then) = _$ResolvedAliasCopyWithImpl;
@useResult
$Res call({
 String name, ResolvedType type, String? documentation, String? since, String? deprecated, bool proposed
});


$ResolvedTypeCopyWith<$Res> get type;

}
/// @nodoc
class _$ResolvedAliasCopyWithImpl<$Res>
    implements $ResolvedAliasCopyWith<$Res> {
  _$ResolvedAliasCopyWithImpl(this._self, this._then);

  final ResolvedAlias _self;
  final $Res Function(ResolvedAlias) _then;

/// Create a copy of ResolvedAlias
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,Object? proposed = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResolvedType,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ResolvedAlias
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get type {
  
  return $ResolvedTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolvedAlias].
extension ResolvedAliasPatterns on ResolvedAlias {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedAlias value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedAlias() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedAlias value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedAlias():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedAlias value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedAlias() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  ResolvedType type,  String? documentation,  String? since,  String? deprecated,  bool proposed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedAlias() when $default != null:
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.proposed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  ResolvedType type,  String? documentation,  String? since,  String? deprecated,  bool proposed)  $default,) {final _that = this;
switch (_that) {
case _ResolvedAlias():
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.proposed);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  ResolvedType type,  String? documentation,  String? since,  String? deprecated,  bool proposed)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedAlias() when $default != null:
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.proposed);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedAlias extends ResolvedAlias {
   _ResolvedAlias({required this.name, required this.type, this.documentation, this.since, this.deprecated, this.proposed = false}): super._();
  

@override  String name;
@override  ResolvedType type;
@override  String? documentation;
@override  String? since;
@override  String? deprecated;
@override@JsonKey()  bool proposed;

/// Create a copy of ResolvedAlias
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedAliasCopyWith<_ResolvedAlias> get copyWith => __$ResolvedAliasCopyWithImpl<_ResolvedAlias>(this, _$identity);





@override
String toString() {
  return 'ResolvedAlias(name: $name, type: $type, documentation: $documentation, since: $since, deprecated: $deprecated, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class _$ResolvedAliasCopyWith<$Res> implements $ResolvedAliasCopyWith<$Res> {
  factory _$ResolvedAliasCopyWith(_ResolvedAlias value, $Res Function(_ResolvedAlias) _then) = __$ResolvedAliasCopyWithImpl;
@override @useResult
$Res call({
 String name, ResolvedType type, String? documentation, String? since, String? deprecated, bool proposed
});


@override $ResolvedTypeCopyWith<$Res> get type;

}
/// @nodoc
class __$ResolvedAliasCopyWithImpl<$Res>
    implements _$ResolvedAliasCopyWith<$Res> {
  __$ResolvedAliasCopyWithImpl(this._self, this._then);

  final _ResolvedAlias _self;
  final $Res Function(_ResolvedAlias) _then;

/// Create a copy of ResolvedAlias
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,Object? proposed = null,}) {
  return _then(_ResolvedAlias(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResolvedType,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ResolvedAlias
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get type {
  
  return $ResolvedTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

/// @nodoc
mixin _$ResolvedProperty {

 String get name; ResolvedType get type; bool get optional; String? get documentation; String? get since; String? get deprecated;
/// Create a copy of ResolvedProperty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedPropertyCopyWith<ResolvedProperty> get copyWith => _$ResolvedPropertyCopyWithImpl<ResolvedProperty>(this as ResolvedProperty, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedProperty&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.optional, optional) || other.optional == optional)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,optional,documentation,since,deprecated);

@override
String toString() {
  return 'ResolvedProperty(name: $name, type: $type, optional: $optional, documentation: $documentation, since: $since, deprecated: $deprecated)';
}


}

/// @nodoc
abstract mixin class $ResolvedPropertyCopyWith<$Res>  {
  factory $ResolvedPropertyCopyWith(ResolvedProperty value, $Res Function(ResolvedProperty) _then) = _$ResolvedPropertyCopyWithImpl;
@useResult
$Res call({
 String name, ResolvedType type, bool optional, String? documentation, String? since, String? deprecated
});


$ResolvedTypeCopyWith<$Res> get type;

}
/// @nodoc
class _$ResolvedPropertyCopyWithImpl<$Res>
    implements $ResolvedPropertyCopyWith<$Res> {
  _$ResolvedPropertyCopyWithImpl(this._self, this._then);

  final ResolvedProperty _self;
  final $Res Function(ResolvedProperty) _then;

/// Create a copy of ResolvedProperty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? optional = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResolvedType,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ResolvedProperty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get type {
  
  return $ResolvedTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolvedProperty].
extension ResolvedPropertyPatterns on ResolvedProperty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedProperty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedProperty() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedProperty value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedProperty():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedProperty value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedProperty() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  ResolvedType type,  bool optional,  String? documentation,  String? since,  String? deprecated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedProperty() when $default != null:
return $default(_that.name,_that.type,_that.optional,_that.documentation,_that.since,_that.deprecated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  ResolvedType type,  bool optional,  String? documentation,  String? since,  String? deprecated)  $default,) {final _that = this;
switch (_that) {
case _ResolvedProperty():
return $default(_that.name,_that.type,_that.optional,_that.documentation,_that.since,_that.deprecated);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  ResolvedType type,  bool optional,  String? documentation,  String? since,  String? deprecated)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedProperty() when $default != null:
return $default(_that.name,_that.type,_that.optional,_that.documentation,_that.since,_that.deprecated);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedProperty implements ResolvedProperty {
  const _ResolvedProperty({required this.name, required this.type, this.optional = false, this.documentation, this.since, this.deprecated});
  

@override final  String name;
@override final  ResolvedType type;
@override@JsonKey() final  bool optional;
@override final  String? documentation;
@override final  String? since;
@override final  String? deprecated;

/// Create a copy of ResolvedProperty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedPropertyCopyWith<_ResolvedProperty> get copyWith => __$ResolvedPropertyCopyWithImpl<_ResolvedProperty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedProperty&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.optional, optional) || other.optional == optional)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,optional,documentation,since,deprecated);

@override
String toString() {
  return 'ResolvedProperty(name: $name, type: $type, optional: $optional, documentation: $documentation, since: $since, deprecated: $deprecated)';
}


}

/// @nodoc
abstract mixin class _$ResolvedPropertyCopyWith<$Res> implements $ResolvedPropertyCopyWith<$Res> {
  factory _$ResolvedPropertyCopyWith(_ResolvedProperty value, $Res Function(_ResolvedProperty) _then) = __$ResolvedPropertyCopyWithImpl;
@override @useResult
$Res call({
 String name, ResolvedType type, bool optional, String? documentation, String? since, String? deprecated
});


@override $ResolvedTypeCopyWith<$Res> get type;

}
/// @nodoc
class __$ResolvedPropertyCopyWithImpl<$Res>
    implements _$ResolvedPropertyCopyWith<$Res> {
  __$ResolvedPropertyCopyWithImpl(this._self, this._then);

  final _ResolvedProperty _self;
  final $Res Function(_ResolvedProperty) _then;

/// Create a copy of ResolvedProperty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? optional = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,}) {
  return _then(_ResolvedProperty(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResolvedType,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ResolvedProperty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res> get type {
  
  return $ResolvedTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

/// @nodoc
mixin _$ResolvedEnumMember {

 String get name;/// Raw value (may be int or String depending on enum kind).
 Object get value; String? get documentation; String? get since; String? get deprecated;
/// Create a copy of ResolvedEnumMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedEnumMemberCopyWith<ResolvedEnumMember> get copyWith => _$ResolvedEnumMemberCopyWithImpl<ResolvedEnumMember>(this as ResolvedEnumMember, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedEnumMember&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(value),documentation,since,deprecated);

@override
String toString() {
  return 'ResolvedEnumMember(name: $name, value: $value, documentation: $documentation, since: $since, deprecated: $deprecated)';
}


}

/// @nodoc
abstract mixin class $ResolvedEnumMemberCopyWith<$Res>  {
  factory $ResolvedEnumMemberCopyWith(ResolvedEnumMember value, $Res Function(ResolvedEnumMember) _then) = _$ResolvedEnumMemberCopyWithImpl;
@useResult
$Res call({
 String name, Object value, String? documentation, String? since, String? deprecated
});




}
/// @nodoc
class _$ResolvedEnumMemberCopyWithImpl<$Res>
    implements $ResolvedEnumMemberCopyWith<$Res> {
  _$ResolvedEnumMemberCopyWithImpl(this._self, this._then);

  final ResolvedEnumMember _self;
  final $Res Function(ResolvedEnumMember) _then;

/// Create a copy of ResolvedEnumMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? value = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value ,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResolvedEnumMember].
extension ResolvedEnumMemberPatterns on ResolvedEnumMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedEnumMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedEnumMember() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedEnumMember value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedEnumMember():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedEnumMember value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedEnumMember() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  Object value,  String? documentation,  String? since,  String? deprecated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedEnumMember() when $default != null:
return $default(_that.name,_that.value,_that.documentation,_that.since,_that.deprecated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  Object value,  String? documentation,  String? since,  String? deprecated)  $default,) {final _that = this;
switch (_that) {
case _ResolvedEnumMember():
return $default(_that.name,_that.value,_that.documentation,_that.since,_that.deprecated);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  Object value,  String? documentation,  String? since,  String? deprecated)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedEnumMember() when $default != null:
return $default(_that.name,_that.value,_that.documentation,_that.since,_that.deprecated);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedEnumMember implements ResolvedEnumMember {
  const _ResolvedEnumMember({required this.name, required this.value, this.documentation, this.since, this.deprecated});
  

@override final  String name;
/// Raw value (may be int or String depending on enum kind).
@override final  Object value;
@override final  String? documentation;
@override final  String? since;
@override final  String? deprecated;

/// Create a copy of ResolvedEnumMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedEnumMemberCopyWith<_ResolvedEnumMember> get copyWith => __$ResolvedEnumMemberCopyWithImpl<_ResolvedEnumMember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedEnumMember&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(value),documentation,since,deprecated);

@override
String toString() {
  return 'ResolvedEnumMember(name: $name, value: $value, documentation: $documentation, since: $since, deprecated: $deprecated)';
}


}

/// @nodoc
abstract mixin class _$ResolvedEnumMemberCopyWith<$Res> implements $ResolvedEnumMemberCopyWith<$Res> {
  factory _$ResolvedEnumMemberCopyWith(_ResolvedEnumMember value, $Res Function(_ResolvedEnumMember) _then) = __$ResolvedEnumMemberCopyWithImpl;
@override @useResult
$Res call({
 String name, Object value, String? documentation, String? since, String? deprecated
});




}
/// @nodoc
class __$ResolvedEnumMemberCopyWithImpl<$Res>
    implements _$ResolvedEnumMemberCopyWith<$Res> {
  __$ResolvedEnumMemberCopyWithImpl(this._self, this._then);

  final _ResolvedEnumMember _self;
  final $Res Function(_ResolvedEnumMember) _then;

/// Create a copy of ResolvedEnumMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? value = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,}) {
  return _then(_ResolvedEnumMember(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value ,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ResolvedRequest {

 String get method; MessageDirection get messageDirection; ResolvedType? get params; ResolvedType? get result; String? get documentation; ResolvedType? get partialResult; ResolvedType? get registrationOptions; String? get since; bool get proposed; String? get registrationMethod; ResolvedType? get errorData;
/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedRequestCopyWith<ResolvedRequest> get copyWith => _$ResolvedRequestCopyWithImpl<ResolvedRequest>(this as ResolvedRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.result, result) || other.result == result)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.partialResult, partialResult) || other.partialResult == partialResult)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod)&&(identical(other.errorData, errorData) || other.errorData == errorData));
}


@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,result,documentation,partialResult,registrationOptions,since,proposed,registrationMethod,errorData);

@override
String toString() {
  return 'ResolvedRequest(method: $method, messageDirection: $messageDirection, params: $params, result: $result, documentation: $documentation, partialResult: $partialResult, registrationOptions: $registrationOptions, since: $since, proposed: $proposed, registrationMethod: $registrationMethod, errorData: $errorData)';
}


}

/// @nodoc
abstract mixin class $ResolvedRequestCopyWith<$Res>  {
  factory $ResolvedRequestCopyWith(ResolvedRequest value, $Res Function(ResolvedRequest) _then) = _$ResolvedRequestCopyWithImpl;
@useResult
$Res call({
 String method, MessageDirection messageDirection, ResolvedType? params, ResolvedType? result, String? documentation, ResolvedType? partialResult, ResolvedType? registrationOptions, String? since, bool proposed, String? registrationMethod, ResolvedType? errorData
});


$ResolvedTypeCopyWith<$Res>? get params;$ResolvedTypeCopyWith<$Res>? get result;$ResolvedTypeCopyWith<$Res>? get partialResult;$ResolvedTypeCopyWith<$Res>? get registrationOptions;$ResolvedTypeCopyWith<$Res>? get errorData;

}
/// @nodoc
class _$ResolvedRequestCopyWithImpl<$Res>
    implements $ResolvedRequestCopyWith<$Res> {
  _$ResolvedRequestCopyWithImpl(this._self, this._then);

  final ResolvedRequest _self;
  final $Res Function(ResolvedRequest) _then;

/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? result = freezed,Object? documentation = freezed,Object? partialResult = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? proposed = null,Object? registrationMethod = freezed,Object? errorData = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ResolvedType?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ResolvedType?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,partialResult: freezed == partialResult ? _self.partialResult : partialResult // ignore: cast_nullable_to_non_nullable
as ResolvedType?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as ResolvedType?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,errorData: freezed == errorData ? _self.errorData : errorData // ignore: cast_nullable_to_non_nullable
as ResolvedType?,
  ));
}
/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get partialResult {
    if (_self.partialResult == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.partialResult!, (value) {
    return _then(_self.copyWith(partialResult: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get errorData {
    if (_self.errorData == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.errorData!, (value) {
    return _then(_self.copyWith(errorData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolvedRequest].
extension ResolvedRequestPatterns on ResolvedRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedRequest value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  ResolvedType? params,  ResolvedType? result,  String? documentation,  ResolvedType? partialResult,  ResolvedType? registrationOptions,  String? since,  bool proposed,  String? registrationMethod,  ResolvedType? errorData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedRequest() when $default != null:
return $default(_that.method,_that.messageDirection,_that.params,_that.result,_that.documentation,_that.partialResult,_that.registrationOptions,_that.since,_that.proposed,_that.registrationMethod,_that.errorData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  ResolvedType? params,  ResolvedType? result,  String? documentation,  ResolvedType? partialResult,  ResolvedType? registrationOptions,  String? since,  bool proposed,  String? registrationMethod,  ResolvedType? errorData)  $default,) {final _that = this;
switch (_that) {
case _ResolvedRequest():
return $default(_that.method,_that.messageDirection,_that.params,_that.result,_that.documentation,_that.partialResult,_that.registrationOptions,_that.since,_that.proposed,_that.registrationMethod,_that.errorData);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  MessageDirection messageDirection,  ResolvedType? params,  ResolvedType? result,  String? documentation,  ResolvedType? partialResult,  ResolvedType? registrationOptions,  String? since,  bool proposed,  String? registrationMethod,  ResolvedType? errorData)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedRequest() when $default != null:
return $default(_that.method,_that.messageDirection,_that.params,_that.result,_that.documentation,_that.partialResult,_that.registrationOptions,_that.since,_that.proposed,_that.registrationMethod,_that.errorData);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedRequest implements ResolvedRequest {
  const _ResolvedRequest({required this.method, required this.messageDirection, this.params, this.result, this.documentation, this.partialResult, this.registrationOptions, this.since, this.proposed = false, this.registrationMethod, this.errorData});
  

@override final  String method;
@override final  MessageDirection messageDirection;
@override final  ResolvedType? params;
@override final  ResolvedType? result;
@override final  String? documentation;
@override final  ResolvedType? partialResult;
@override final  ResolvedType? registrationOptions;
@override final  String? since;
@override@JsonKey() final  bool proposed;
@override final  String? registrationMethod;
@override final  ResolvedType? errorData;

/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedRequestCopyWith<_ResolvedRequest> get copyWith => __$ResolvedRequestCopyWithImpl<_ResolvedRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.result, result) || other.result == result)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.partialResult, partialResult) || other.partialResult == partialResult)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod)&&(identical(other.errorData, errorData) || other.errorData == errorData));
}


@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,result,documentation,partialResult,registrationOptions,since,proposed,registrationMethod,errorData);

@override
String toString() {
  return 'ResolvedRequest(method: $method, messageDirection: $messageDirection, params: $params, result: $result, documentation: $documentation, partialResult: $partialResult, registrationOptions: $registrationOptions, since: $since, proposed: $proposed, registrationMethod: $registrationMethod, errorData: $errorData)';
}


}

/// @nodoc
abstract mixin class _$ResolvedRequestCopyWith<$Res> implements $ResolvedRequestCopyWith<$Res> {
  factory _$ResolvedRequestCopyWith(_ResolvedRequest value, $Res Function(_ResolvedRequest) _then) = __$ResolvedRequestCopyWithImpl;
@override @useResult
$Res call({
 String method, MessageDirection messageDirection, ResolvedType? params, ResolvedType? result, String? documentation, ResolvedType? partialResult, ResolvedType? registrationOptions, String? since, bool proposed, String? registrationMethod, ResolvedType? errorData
});


@override $ResolvedTypeCopyWith<$Res>? get params;@override $ResolvedTypeCopyWith<$Res>? get result;@override $ResolvedTypeCopyWith<$Res>? get partialResult;@override $ResolvedTypeCopyWith<$Res>? get registrationOptions;@override $ResolvedTypeCopyWith<$Res>? get errorData;

}
/// @nodoc
class __$ResolvedRequestCopyWithImpl<$Res>
    implements _$ResolvedRequestCopyWith<$Res> {
  __$ResolvedRequestCopyWithImpl(this._self, this._then);

  final _ResolvedRequest _self;
  final $Res Function(_ResolvedRequest) _then;

/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? result = freezed,Object? documentation = freezed,Object? partialResult = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? proposed = null,Object? registrationMethod = freezed,Object? errorData = freezed,}) {
  return _then(_ResolvedRequest(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ResolvedType?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ResolvedType?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,partialResult: freezed == partialResult ? _self.partialResult : partialResult // ignore: cast_nullable_to_non_nullable
as ResolvedType?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as ResolvedType?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,errorData: freezed == errorData ? _self.errorData : errorData // ignore: cast_nullable_to_non_nullable
as ResolvedType?,
  ));
}

/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get partialResult {
    if (_self.partialResult == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.partialResult!, (value) {
    return _then(_self.copyWith(partialResult: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}/// Create a copy of ResolvedRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get errorData {
    if (_self.errorData == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.errorData!, (value) {
    return _then(_self.copyWith(errorData: value));
  });
}
}

/// @nodoc
mixin _$ResolvedNotification {

 String get method; MessageDirection get messageDirection; ResolvedType? get params; String? get documentation; ResolvedType? get registrationOptions; String? get since; String? get registrationMethod;
/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedNotificationCopyWith<ResolvedNotification> get copyWith => _$ResolvedNotificationCopyWithImpl<ResolvedNotification>(this as ResolvedNotification, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedNotification&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod));
}


@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,documentation,registrationOptions,since,registrationMethod);

@override
String toString() {
  return 'ResolvedNotification(method: $method, messageDirection: $messageDirection, params: $params, documentation: $documentation, registrationOptions: $registrationOptions, since: $since, registrationMethod: $registrationMethod)';
}


}

/// @nodoc
abstract mixin class $ResolvedNotificationCopyWith<$Res>  {
  factory $ResolvedNotificationCopyWith(ResolvedNotification value, $Res Function(ResolvedNotification) _then) = _$ResolvedNotificationCopyWithImpl;
@useResult
$Res call({
 String method, MessageDirection messageDirection, ResolvedType? params, String? documentation, ResolvedType? registrationOptions, String? since, String? registrationMethod
});


$ResolvedTypeCopyWith<$Res>? get params;$ResolvedTypeCopyWith<$Res>? get registrationOptions;

}
/// @nodoc
class _$ResolvedNotificationCopyWithImpl<$Res>
    implements $ResolvedNotificationCopyWith<$Res> {
  _$ResolvedNotificationCopyWithImpl(this._self, this._then);

  final ResolvedNotification _self;
  final $Res Function(ResolvedNotification) _then;

/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? documentation = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? registrationMethod = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ResolvedType?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as ResolvedType?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolvedNotification].
extension ResolvedNotificationPatterns on ResolvedNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedNotification() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedNotification value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedNotification():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedNotification value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedNotification() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  ResolvedType? params,  String? documentation,  ResolvedType? registrationOptions,  String? since,  String? registrationMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedNotification() when $default != null:
return $default(_that.method,_that.messageDirection,_that.params,_that.documentation,_that.registrationOptions,_that.since,_that.registrationMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  ResolvedType? params,  String? documentation,  ResolvedType? registrationOptions,  String? since,  String? registrationMethod)  $default,) {final _that = this;
switch (_that) {
case _ResolvedNotification():
return $default(_that.method,_that.messageDirection,_that.params,_that.documentation,_that.registrationOptions,_that.since,_that.registrationMethod);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  MessageDirection messageDirection,  ResolvedType? params,  String? documentation,  ResolvedType? registrationOptions,  String? since,  String? registrationMethod)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedNotification() when $default != null:
return $default(_that.method,_that.messageDirection,_that.params,_that.documentation,_that.registrationOptions,_that.since,_that.registrationMethod);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedNotification implements ResolvedNotification {
  const _ResolvedNotification({required this.method, required this.messageDirection, this.params, this.documentation, this.registrationOptions, this.since, this.registrationMethod});
  

@override final  String method;
@override final  MessageDirection messageDirection;
@override final  ResolvedType? params;
@override final  String? documentation;
@override final  ResolvedType? registrationOptions;
@override final  String? since;
@override final  String? registrationMethod;

/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedNotificationCopyWith<_ResolvedNotification> get copyWith => __$ResolvedNotificationCopyWithImpl<_ResolvedNotification>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedNotification&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod));
}


@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,documentation,registrationOptions,since,registrationMethod);

@override
String toString() {
  return 'ResolvedNotification(method: $method, messageDirection: $messageDirection, params: $params, documentation: $documentation, registrationOptions: $registrationOptions, since: $since, registrationMethod: $registrationMethod)';
}


}

/// @nodoc
abstract mixin class _$ResolvedNotificationCopyWith<$Res> implements $ResolvedNotificationCopyWith<$Res> {
  factory _$ResolvedNotificationCopyWith(_ResolvedNotification value, $Res Function(_ResolvedNotification) _then) = __$ResolvedNotificationCopyWithImpl;
@override @useResult
$Res call({
 String method, MessageDirection messageDirection, ResolvedType? params, String? documentation, ResolvedType? registrationOptions, String? since, String? registrationMethod
});


@override $ResolvedTypeCopyWith<$Res>? get params;@override $ResolvedTypeCopyWith<$Res>? get registrationOptions;

}
/// @nodoc
class __$ResolvedNotificationCopyWithImpl<$Res>
    implements _$ResolvedNotificationCopyWith<$Res> {
  __$ResolvedNotificationCopyWithImpl(this._self, this._then);

  final _ResolvedNotification _self;
  final $Res Function(_ResolvedNotification) _then;

/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? documentation = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? registrationMethod = freezed,}) {
  return _then(_ResolvedNotification(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ResolvedType?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as ResolvedType?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of ResolvedNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedTypeCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $ResolvedTypeCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}
}

// dart format on
