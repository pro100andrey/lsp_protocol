// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scalar_unions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressToken {

 Object get value;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressToken&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'ProgressToken(value: $value)';
}


}

/// @nodoc
class $ProgressTokenCopyWith<$Res>  {
$ProgressTokenCopyWith(ProgressToken _, $Res Function(ProgressToken) __);
}


/// Adds pattern-matching-related methods to [ProgressToken].
extension ProgressTokenPatterns on ProgressToken {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProgressToken$Int value)?  int,TResult Function( ProgressToken$String value)?  string,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProgressToken$Int() when int != null:
return int(_that);case ProgressToken$String() when string != null:
return string(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProgressToken$Int value)  int,required TResult Function( ProgressToken$String value)  string,}){
final _that = this;
switch (_that) {
case ProgressToken$Int():
return int(_that);case ProgressToken$String():
return string(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProgressToken$Int value)?  int,TResult? Function( ProgressToken$String value)?  string,}){
final _that = this;
switch (_that) {
case ProgressToken$Int() when int != null:
return int(_that);case ProgressToken$String() when string != null:
return string(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int value)?  int,TResult Function( String value)?  string,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProgressToken$Int() when int != null:
return int(_that.value);case ProgressToken$String() when string != null:
return string(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int value)  int,required TResult Function( String value)  string,}) {final _that = this;
switch (_that) {
case ProgressToken$Int():
return int(_that.value);case ProgressToken$String():
return string(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int value)?  int,TResult? Function( String value)?  string,}) {final _that = this;
switch (_that) {
case ProgressToken$Int() when int != null:
return int(_that.value);case ProgressToken$String() when string != null:
return string(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class ProgressToken$Int extends ProgressToken {
  const ProgressToken$Int({required this.value}): super._();
  

@override final  int value;

/// Create a copy of ProgressToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressToken$IntCopyWith<ProgressToken$Int> get copyWith => _$ProgressToken$IntCopyWithImpl<ProgressToken$Int>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressToken$Int&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ProgressToken.int(value: $value)';
}


}

/// @nodoc
abstract mixin class $ProgressToken$IntCopyWith<$Res> implements $ProgressTokenCopyWith<$Res> {
  factory $ProgressToken$IntCopyWith(ProgressToken$Int value, $Res Function(ProgressToken$Int) _then) = _$ProgressToken$IntCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class _$ProgressToken$IntCopyWithImpl<$Res>
    implements $ProgressToken$IntCopyWith<$Res> {
  _$ProgressToken$IntCopyWithImpl(this._self, this._then);

  final ProgressToken$Int _self;
  final $Res Function(ProgressToken$Int) _then;

/// Create a copy of ProgressToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ProgressToken$Int(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ProgressToken$String extends ProgressToken {
  const ProgressToken$String({required this.value}): super._();
  

@override final  String value;

/// Create a copy of ProgressToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressToken$StringCopyWith<ProgressToken$String> get copyWith => _$ProgressToken$StringCopyWithImpl<ProgressToken$String>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressToken$String&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ProgressToken.string(value: $value)';
}


}

/// @nodoc
abstract mixin class $ProgressToken$StringCopyWith<$Res> implements $ProgressTokenCopyWith<$Res> {
  factory $ProgressToken$StringCopyWith(ProgressToken$String value, $Res Function(ProgressToken$String) _then) = _$ProgressToken$StringCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$ProgressToken$StringCopyWithImpl<$Res>
    implements $ProgressToken$StringCopyWith<$Res> {
  _$ProgressToken$StringCopyWithImpl(this._self, this._then);

  final ProgressToken$String _self;
  final $Res Function(ProgressToken$String) _then;

/// Create a copy of ProgressToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ProgressToken$String(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
