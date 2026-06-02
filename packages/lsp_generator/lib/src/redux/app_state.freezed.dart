// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppState {

 MetaState get meta; ResolvedState? get resolved; EmitState? get emit;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.resolved, resolved) || other.resolved == resolved)&&(identical(other.emit, emit) || other.emit == emit));
}


@override
int get hashCode => Object.hash(runtimeType,meta,resolved,emit);

@override
String toString() {
  return 'AppState(meta: $meta, resolved: $resolved, emit: $emit)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 MetaState meta, ResolvedState? resolved, EmitState? emit
});


$MetaStateCopyWith<$Res> get meta;$ResolvedStateCopyWith<$Res>? get resolved;

}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = null,Object? resolved = freezed,Object? emit = freezed,}) {
  return _then(_self.copyWith(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaState,resolved: freezed == resolved ? _self.resolved : resolved // ignore: cast_nullable_to_non_nullable
as ResolvedState?,emit: freezed == emit ? _self.emit : emit // ignore: cast_nullable_to_non_nullable
as EmitState?,
  ));
}
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaStateCopyWith<$Res> get meta {
  
  return $MetaStateCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedStateCopyWith<$Res>? get resolved {
    if (_self.resolved == null) {
    return null;
  }

  return $ResolvedStateCopyWith<$Res>(_self.resolved!, (value) {
    return _then(_self.copyWith(resolved: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaState meta,  ResolvedState? resolved,  EmitState? emit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.meta,_that.resolved,_that.emit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaState meta,  ResolvedState? resolved,  EmitState? emit)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.meta,_that.resolved,_that.emit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaState meta,  ResolvedState? resolved,  EmitState? emit)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.meta,_that.resolved,_that.emit);case _:
  return null;

}
}

}

/// @nodoc


class _AppState implements AppState {
  const _AppState({required this.meta, this.resolved, this.emit});
  

@override final  MetaState meta;
@override final  ResolvedState? resolved;
@override final  EmitState? emit;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.resolved, resolved) || other.resolved == resolved)&&(identical(other.emit, emit) || other.emit == emit));
}


@override
int get hashCode => Object.hash(runtimeType,meta,resolved,emit);

@override
String toString() {
  return 'AppState(meta: $meta, resolved: $resolved, emit: $emit)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 MetaState meta, ResolvedState? resolved, EmitState? emit
});


@override $MetaStateCopyWith<$Res> get meta;@override $ResolvedStateCopyWith<$Res>? get resolved;

}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = null,Object? resolved = freezed,Object? emit = freezed,}) {
  return _then(_AppState(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaState,resolved: freezed == resolved ? _self.resolved : resolved // ignore: cast_nullable_to_non_nullable
as ResolvedState?,emit: freezed == emit ? _self.emit : emit // ignore: cast_nullable_to_non_nullable
as EmitState?,
  ));
}

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaStateCopyWith<$Res> get meta {
  
  return $MetaStateCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedStateCopyWith<$Res>? get resolved {
    if (_self.resolved == null) {
    return null;
  }

  return $ResolvedStateCopyWith<$Res>(_self.resolved!, (value) {
    return _then(_self.copyWith(resolved: value));
  });
}
}

// dart format on
