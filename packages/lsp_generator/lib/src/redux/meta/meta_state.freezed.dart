// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetaState {

 String get version; MetaProtocol? get protocol;
/// Create a copy of MetaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaStateCopyWith<MetaState> get copyWith => _$MetaStateCopyWithImpl<MetaState>(this as MetaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaState&&(identical(other.version, version) || other.version == version)&&(identical(other.protocol, protocol) || other.protocol == protocol));
}


@override
int get hashCode => Object.hash(runtimeType,version,protocol);

@override
String toString() {
  return 'MetaState(version: $version, protocol: $protocol)';
}


}

/// @nodoc
abstract mixin class $MetaStateCopyWith<$Res>  {
  factory $MetaStateCopyWith(MetaState value, $Res Function(MetaState) _then) = _$MetaStateCopyWithImpl;
@useResult
$Res call({
 String version, MetaProtocol? protocol
});


$MetaProtocolCopyWith<$Res>? get protocol;

}
/// @nodoc
class _$MetaStateCopyWithImpl<$Res>
    implements $MetaStateCopyWith<$Res> {
  _$MetaStateCopyWithImpl(this._self, this._then);

  final MetaState _self;
  final $Res Function(MetaState) _then;

/// Create a copy of MetaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? protocol = freezed,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,protocol: freezed == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as MetaProtocol?,
  ));
}
/// Create a copy of MetaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaProtocolCopyWith<$Res>? get protocol {
    if (_self.protocol == null) {
    return null;
  }

  return $MetaProtocolCopyWith<$Res>(_self.protocol!, (value) {
    return _then(_self.copyWith(protocol: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaState].
extension MetaStatePatterns on MetaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaState value)  $default,){
final _that = this;
switch (_that) {
case _MetaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaState value)?  $default,){
final _that = this;
switch (_that) {
case _MetaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  MetaProtocol? protocol)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaState() when $default != null:
return $default(_that.version,_that.protocol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  MetaProtocol? protocol)  $default,) {final _that = this;
switch (_that) {
case _MetaState():
return $default(_that.version,_that.protocol);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  MetaProtocol? protocol)?  $default,) {final _that = this;
switch (_that) {
case _MetaState() when $default != null:
return $default(_that.version,_that.protocol);case _:
  return null;

}
}

}

/// @nodoc


class _MetaState implements MetaState {
  const _MetaState({this.version = '3.17', this.protocol});
  

@override@JsonKey() final  String version;
@override final  MetaProtocol? protocol;

/// Create a copy of MetaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaStateCopyWith<_MetaState> get copyWith => __$MetaStateCopyWithImpl<_MetaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaState&&(identical(other.version, version) || other.version == version)&&(identical(other.protocol, protocol) || other.protocol == protocol));
}


@override
int get hashCode => Object.hash(runtimeType,version,protocol);

@override
String toString() {
  return 'MetaState(version: $version, protocol: $protocol)';
}


}

/// @nodoc
abstract mixin class _$MetaStateCopyWith<$Res> implements $MetaStateCopyWith<$Res> {
  factory _$MetaStateCopyWith(_MetaState value, $Res Function(_MetaState) _then) = __$MetaStateCopyWithImpl;
@override @useResult
$Res call({
 String version, MetaProtocol? protocol
});


@override $MetaProtocolCopyWith<$Res>? get protocol;

}
/// @nodoc
class __$MetaStateCopyWithImpl<$Res>
    implements _$MetaStateCopyWith<$Res> {
  __$MetaStateCopyWithImpl(this._self, this._then);

  final _MetaState _self;
  final $Res Function(_MetaState) _then;

/// Create a copy of MetaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? protocol = freezed,}) {
  return _then(_MetaState(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,protocol: freezed == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as MetaProtocol?,
  ));
}

/// Create a copy of MetaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaProtocolCopyWith<$Res>? get protocol {
    if (_self.protocol == null) {
    return null;
  }

  return $MetaProtocolCopyWith<$Res>(_self.protocol!, (value) {
    return _then(_self.copyWith(protocol: value));
  });
}
}

// dart format on
