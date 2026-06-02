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
