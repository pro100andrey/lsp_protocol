// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolved_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResolvedState {

/// Symbol table: declaration name → resolved declaration.
 Map<String, ResolvedDecl> get registry; List<ResolvedClass> get classes; List<ResolvedEnum> get enumerations; List<ResolvedAlias> get aliases;
/// Create a copy of ResolvedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedStateCopyWith<ResolvedState> get copyWith => _$ResolvedStateCopyWithImpl<ResolvedState>(this as ResolvedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedState&&const DeepCollectionEquality().equals(other.registry, registry)&&const DeepCollectionEquality().equals(other.classes, classes)&&const DeepCollectionEquality().equals(other.enumerations, enumerations)&&const DeepCollectionEquality().equals(other.aliases, aliases));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(registry),const DeepCollectionEquality().hash(classes),const DeepCollectionEquality().hash(enumerations),const DeepCollectionEquality().hash(aliases));

@override
String toString() {
  return 'ResolvedState(registry: $registry, classes: $classes, enumerations: $enumerations, aliases: $aliases)';
}


}

/// @nodoc
abstract mixin class $ResolvedStateCopyWith<$Res>  {
  factory $ResolvedStateCopyWith(ResolvedState value, $Res Function(ResolvedState) _then) = _$ResolvedStateCopyWithImpl;
@useResult
$Res call({
 Map<String, ResolvedDecl> registry, List<ResolvedClass> classes, List<ResolvedEnum> enumerations, List<ResolvedAlias> aliases
});




}
/// @nodoc
class _$ResolvedStateCopyWithImpl<$Res>
    implements $ResolvedStateCopyWith<$Res> {
  _$ResolvedStateCopyWithImpl(this._self, this._then);

  final ResolvedState _self;
  final $Res Function(ResolvedState) _then;

/// Create a copy of ResolvedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registry = null,Object? classes = null,Object? enumerations = null,Object? aliases = null,}) {
  return _then(_self.copyWith(
registry: null == registry ? _self.registry : registry // ignore: cast_nullable_to_non_nullable
as Map<String, ResolvedDecl>,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as List<ResolvedClass>,enumerations: null == enumerations ? _self.enumerations : enumerations // ignore: cast_nullable_to_non_nullable
as List<ResolvedEnum>,aliases: null == aliases ? _self.aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<ResolvedAlias>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResolvedState].
extension ResolvedStatePatterns on ResolvedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedState value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedState value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, ResolvedDecl> registry,  List<ResolvedClass> classes,  List<ResolvedEnum> enumerations,  List<ResolvedAlias> aliases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedState() when $default != null:
return $default(_that.registry,_that.classes,_that.enumerations,_that.aliases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, ResolvedDecl> registry,  List<ResolvedClass> classes,  List<ResolvedEnum> enumerations,  List<ResolvedAlias> aliases)  $default,) {final _that = this;
switch (_that) {
case _ResolvedState():
return $default(_that.registry,_that.classes,_that.enumerations,_that.aliases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, ResolvedDecl> registry,  List<ResolvedClass> classes,  List<ResolvedEnum> enumerations,  List<ResolvedAlias> aliases)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedState() when $default != null:
return $default(_that.registry,_that.classes,_that.enumerations,_that.aliases);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedState implements ResolvedState {
  const _ResolvedState({required final  Map<String, ResolvedDecl> registry, required final  List<ResolvedClass> classes, required final  List<ResolvedEnum> enumerations, required final  List<ResolvedAlias> aliases}): _registry = registry,_classes = classes,_enumerations = enumerations,_aliases = aliases;
  

/// Symbol table: declaration name → resolved declaration.
 final  Map<String, ResolvedDecl> _registry;
/// Symbol table: declaration name → resolved declaration.
@override Map<String, ResolvedDecl> get registry {
  if (_registry is EqualUnmodifiableMapView) return _registry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_registry);
}

 final  List<ResolvedClass> _classes;
@override List<ResolvedClass> get classes {
  if (_classes is EqualUnmodifiableListView) return _classes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classes);
}

 final  List<ResolvedEnum> _enumerations;
@override List<ResolvedEnum> get enumerations {
  if (_enumerations is EqualUnmodifiableListView) return _enumerations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enumerations);
}

 final  List<ResolvedAlias> _aliases;
@override List<ResolvedAlias> get aliases {
  if (_aliases is EqualUnmodifiableListView) return _aliases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aliases);
}


/// Create a copy of ResolvedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedStateCopyWith<_ResolvedState> get copyWith => __$ResolvedStateCopyWithImpl<_ResolvedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedState&&const DeepCollectionEquality().equals(other._registry, _registry)&&const DeepCollectionEquality().equals(other._classes, _classes)&&const DeepCollectionEquality().equals(other._enumerations, _enumerations)&&const DeepCollectionEquality().equals(other._aliases, _aliases));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_registry),const DeepCollectionEquality().hash(_classes),const DeepCollectionEquality().hash(_enumerations),const DeepCollectionEquality().hash(_aliases));

@override
String toString() {
  return 'ResolvedState(registry: $registry, classes: $classes, enumerations: $enumerations, aliases: $aliases)';
}


}

/// @nodoc
abstract mixin class _$ResolvedStateCopyWith<$Res> implements $ResolvedStateCopyWith<$Res> {
  factory _$ResolvedStateCopyWith(_ResolvedState value, $Res Function(_ResolvedState) _then) = __$ResolvedStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, ResolvedDecl> registry, List<ResolvedClass> classes, List<ResolvedEnum> enumerations, List<ResolvedAlias> aliases
});




}
/// @nodoc
class __$ResolvedStateCopyWithImpl<$Res>
    implements _$ResolvedStateCopyWith<$Res> {
  __$ResolvedStateCopyWithImpl(this._self, this._then);

  final _ResolvedState _self;
  final $Res Function(_ResolvedState) _then;

/// Create a copy of ResolvedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registry = null,Object? classes = null,Object? enumerations = null,Object? aliases = null,}) {
  return _then(_ResolvedState(
registry: null == registry ? _self._registry : registry // ignore: cast_nullable_to_non_nullable
as Map<String, ResolvedDecl>,classes: null == classes ? _self._classes : classes // ignore: cast_nullable_to_non_nullable
as List<ResolvedClass>,enumerations: null == enumerations ? _self._enumerations : enumerations // ignore: cast_nullable_to_non_nullable
as List<ResolvedEnum>,aliases: null == aliases ? _self._aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<ResolvedAlias>,
  ));
}


}

// dart format on
