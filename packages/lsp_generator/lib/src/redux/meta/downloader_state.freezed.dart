// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DownloaderState {

 String get version;
/// Create a copy of DownloaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloaderStateCopyWith<DownloaderState> get copyWith => _$DownloaderStateCopyWithImpl<DownloaderState>(this as DownloaderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloaderState&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'DownloaderState(version: $version)';
}


}

/// @nodoc
abstract mixin class $DownloaderStateCopyWith<$Res>  {
  factory $DownloaderStateCopyWith(DownloaderState value, $Res Function(DownloaderState) _then) = _$DownloaderStateCopyWithImpl;
@useResult
$Res call({
 String version
});




}
/// @nodoc
class _$DownloaderStateCopyWithImpl<$Res>
    implements $DownloaderStateCopyWith<$Res> {
  _$DownloaderStateCopyWithImpl(this._self, this._then);

  final DownloaderState _self;
  final $Res Function(DownloaderState) _then;

/// Create a copy of DownloaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloaderState].
extension DownloaderStatePatterns on DownloaderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloaderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloaderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloaderState value)  $default,){
final _that = this;
switch (_that) {
case _DownloaderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloaderState value)?  $default,){
final _that = this;
switch (_that) {
case _DownloaderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloaderState() when $default != null:
return $default(_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version)  $default,) {final _that = this;
switch (_that) {
case _DownloaderState():
return $default(_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version)?  $default,) {final _that = this;
switch (_that) {
case _DownloaderState() when $default != null:
return $default(_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _DownloaderState implements DownloaderState {
  const _DownloaderState({this.version = '3.17'});
  

@override@JsonKey() final  String version;

/// Create a copy of DownloaderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloaderStateCopyWith<_DownloaderState> get copyWith => __$DownloaderStateCopyWithImpl<_DownloaderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloaderState&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'DownloaderState(version: $version)';
}


}

/// @nodoc
abstract mixin class _$DownloaderStateCopyWith<$Res> implements $DownloaderStateCopyWith<$Res> {
  factory _$DownloaderStateCopyWith(_DownloaderState value, $Res Function(_DownloaderState) _then) = __$DownloaderStateCopyWithImpl;
@override @useResult
$Res call({
 String version
});




}
/// @nodoc
class __$DownloaderStateCopyWithImpl<$Res>
    implements _$DownloaderStateCopyWith<$Res> {
  __$DownloaderStateCopyWithImpl(this._self, this._then);

  final _DownloaderState _self;
  final $Res Function(_DownloaderState) _then;

/// Create a copy of DownloaderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,}) {
  return _then(_DownloaderState(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
