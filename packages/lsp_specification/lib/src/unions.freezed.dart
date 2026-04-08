// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Definition {

 Object get value;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Definition&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Definition(value: $value)';
}


}

/// @nodoc
class $DefinitionCopyWith<$Res>  {
$DefinitionCopyWith(Definition _, $Res Function(Definition) __);
}


/// Adds pattern-matching-related methods to [Definition].
extension DefinitionPatterns on Definition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Definition$Location value)?  location,TResult Function( Definition$List value)?  list,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Definition$Location() when location != null:
return location(_that);case Definition$List() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Definition$Location value)  location,required TResult Function( Definition$List value)  list,}){
final _that = this;
switch (_that) {
case Definition$Location():
return location(_that);case Definition$List():
return list(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Definition$Location value)?  location,TResult? Function( Definition$List value)?  list,}){
final _that = this;
switch (_that) {
case Definition$Location() when location != null:
return location(_that);case Definition$List() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Location value)?  location,TResult Function( List<Location> value)?  list,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Definition$Location() when location != null:
return location(_that.value);case Definition$List() when list != null:
return list(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Location value)  location,required TResult Function( List<Location> value)  list,}) {final _that = this;
switch (_that) {
case Definition$Location():
return location(_that.value);case Definition$List():
return list(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Location value)?  location,TResult? Function( List<Location> value)?  list,}) {final _that = this;
switch (_that) {
case Definition$Location() when location != null:
return location(_that.value);case Definition$List() when list != null:
return list(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class Definition$Location extends Definition {
  const Definition$Location({required this.value}): super._();
  

@override final  Location value;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Definition$LocationCopyWith<Definition$Location> get copyWith => _$Definition$LocationCopyWithImpl<Definition$Location>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Definition$Location&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Definition.location(value: $value)';
}


}

/// @nodoc
abstract mixin class $Definition$LocationCopyWith<$Res> implements $DefinitionCopyWith<$Res> {
  factory $Definition$LocationCopyWith(Definition$Location value, $Res Function(Definition$Location) _then) = _$Definition$LocationCopyWithImpl;
@useResult
$Res call({
 Location value
});


$LocationCopyWith<$Res> get value;

}
/// @nodoc
class _$Definition$LocationCopyWithImpl<$Res>
    implements $Definition$LocationCopyWith<$Res> {
  _$Definition$LocationCopyWithImpl(this._self, this._then);

  final Definition$Location _self;
  final $Res Function(Definition$Location) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(Definition$Location(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Location,
  ));
}

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get value {
  
  return $LocationCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class Definition$List extends Definition {
  const Definition$List({required final  List<Location> value}): _value = value,super._();
  

 final  List<Location> _value;
@override List<Location> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Definition$ListCopyWith<Definition$List> get copyWith => _$Definition$ListCopyWithImpl<Definition$List>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Definition$List&&const DeepCollectionEquality().equals(other._value, _value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'Definition.list(value: $value)';
}


}

/// @nodoc
abstract mixin class $Definition$ListCopyWith<$Res> implements $DefinitionCopyWith<$Res> {
  factory $Definition$ListCopyWith(Definition$List value, $Res Function(Definition$List) _then) = _$Definition$ListCopyWithImpl;
@useResult
$Res call({
 List<Location> value
});




}
/// @nodoc
class _$Definition$ListCopyWithImpl<$Res>
    implements $Definition$ListCopyWith<$Res> {
  _$Definition$ListCopyWithImpl(this._self, this._then);

  final Definition$List _self;
  final $Res Function(Definition$List) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(Definition$List(
value: null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<Location>,
  ));
}


}

/// @nodoc
mixin _$Declaration {

 Object get value;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Declaration&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Declaration(value: $value)';
}


}

/// @nodoc
class $DeclarationCopyWith<$Res>  {
$DeclarationCopyWith(Declaration _, $Res Function(Declaration) __);
}


/// Adds pattern-matching-related methods to [Declaration].
extension DeclarationPatterns on Declaration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Declaration$Location value)?  location,TResult Function( Declaration$List value)?  list,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Declaration$Location() when location != null:
return location(_that);case Declaration$List() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Declaration$Location value)  location,required TResult Function( Declaration$List value)  list,}){
final _that = this;
switch (_that) {
case Declaration$Location():
return location(_that);case Declaration$List():
return list(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Declaration$Location value)?  location,TResult? Function( Declaration$List value)?  list,}){
final _that = this;
switch (_that) {
case Declaration$Location() when location != null:
return location(_that);case Declaration$List() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Location value)?  location,TResult Function( List<Location> value)?  list,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Declaration$Location() when location != null:
return location(_that.value);case Declaration$List() when list != null:
return list(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Location value)  location,required TResult Function( List<Location> value)  list,}) {final _that = this;
switch (_that) {
case Declaration$Location():
return location(_that.value);case Declaration$List():
return list(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Location value)?  location,TResult? Function( List<Location> value)?  list,}) {final _that = this;
switch (_that) {
case Declaration$Location() when location != null:
return location(_that.value);case Declaration$List() when list != null:
return list(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class Declaration$Location extends Declaration {
  const Declaration$Location({required this.value}): super._();
  

@override final  Location value;

/// Create a copy of Declaration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Declaration$LocationCopyWith<Declaration$Location> get copyWith => _$Declaration$LocationCopyWithImpl<Declaration$Location>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Declaration$Location&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Declaration.location(value: $value)';
}


}

/// @nodoc
abstract mixin class $Declaration$LocationCopyWith<$Res> implements $DeclarationCopyWith<$Res> {
  factory $Declaration$LocationCopyWith(Declaration$Location value, $Res Function(Declaration$Location) _then) = _$Declaration$LocationCopyWithImpl;
@useResult
$Res call({
 Location value
});


$LocationCopyWith<$Res> get value;

}
/// @nodoc
class _$Declaration$LocationCopyWithImpl<$Res>
    implements $Declaration$LocationCopyWith<$Res> {
  _$Declaration$LocationCopyWithImpl(this._self, this._then);

  final Declaration$Location _self;
  final $Res Function(Declaration$Location) _then;

/// Create a copy of Declaration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(Declaration$Location(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Location,
  ));
}

/// Create a copy of Declaration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get value {
  
  return $LocationCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class Declaration$List extends Declaration {
  const Declaration$List({required final  List<Location> value}): _value = value,super._();
  

 final  List<Location> _value;
@override List<Location> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


/// Create a copy of Declaration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Declaration$ListCopyWith<Declaration$List> get copyWith => _$Declaration$ListCopyWithImpl<Declaration$List>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Declaration$List&&const DeepCollectionEquality().equals(other._value, _value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'Declaration.list(value: $value)';
}


}

/// @nodoc
abstract mixin class $Declaration$ListCopyWith<$Res> implements $DeclarationCopyWith<$Res> {
  factory $Declaration$ListCopyWith(Declaration$List value, $Res Function(Declaration$List) _then) = _$Declaration$ListCopyWithImpl;
@useResult
$Res call({
 List<Location> value
});




}
/// @nodoc
class _$Declaration$ListCopyWithImpl<$Res>
    implements $Declaration$ListCopyWith<$Res> {
  _$Declaration$ListCopyWithImpl(this._self, this._then);

  final Declaration$List _self;
  final $Res Function(Declaration$List) _then;

/// Create a copy of Declaration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(Declaration$List(
value: null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<Location>,
  ));
}


}

/// @nodoc
mixin _$InlineValue {

 Object get value;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InlineValue&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'InlineValue(value: $value)';
}


}

/// @nodoc
class $InlineValueCopyWith<$Res>  {
$InlineValueCopyWith(InlineValue _, $Res Function(InlineValue) __);
}


/// Adds pattern-matching-related methods to [InlineValue].
extension InlineValuePatterns on InlineValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InlineValue$Text value)?  text,TResult Function( InlineValue$VariableLookup value)?  variableLookup,TResult Function( InlineValue$EvaluatableExpression value)?  evaluatableExpression,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InlineValue$Text() when text != null:
return text(_that);case InlineValue$VariableLookup() when variableLookup != null:
return variableLookup(_that);case InlineValue$EvaluatableExpression() when evaluatableExpression != null:
return evaluatableExpression(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InlineValue$Text value)  text,required TResult Function( InlineValue$VariableLookup value)  variableLookup,required TResult Function( InlineValue$EvaluatableExpression value)  evaluatableExpression,}){
final _that = this;
switch (_that) {
case InlineValue$Text():
return text(_that);case InlineValue$VariableLookup():
return variableLookup(_that);case InlineValue$EvaluatableExpression():
return evaluatableExpression(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InlineValue$Text value)?  text,TResult? Function( InlineValue$VariableLookup value)?  variableLookup,TResult? Function( InlineValue$EvaluatableExpression value)?  evaluatableExpression,}){
final _that = this;
switch (_that) {
case InlineValue$Text() when text != null:
return text(_that);case InlineValue$VariableLookup() when variableLookup != null:
return variableLookup(_that);case InlineValue$EvaluatableExpression() when evaluatableExpression != null:
return evaluatableExpression(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( InlineValueText value)?  text,TResult Function( InlineValueVariableLookup value)?  variableLookup,TResult Function( InlineValueEvaluatableExpression value)?  evaluatableExpression,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InlineValue$Text() when text != null:
return text(_that.value);case InlineValue$VariableLookup() when variableLookup != null:
return variableLookup(_that.value);case InlineValue$EvaluatableExpression() when evaluatableExpression != null:
return evaluatableExpression(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( InlineValueText value)  text,required TResult Function( InlineValueVariableLookup value)  variableLookup,required TResult Function( InlineValueEvaluatableExpression value)  evaluatableExpression,}) {final _that = this;
switch (_that) {
case InlineValue$Text():
return text(_that.value);case InlineValue$VariableLookup():
return variableLookup(_that.value);case InlineValue$EvaluatableExpression():
return evaluatableExpression(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( InlineValueText value)?  text,TResult? Function( InlineValueVariableLookup value)?  variableLookup,TResult? Function( InlineValueEvaluatableExpression value)?  evaluatableExpression,}) {final _that = this;
switch (_that) {
case InlineValue$Text() when text != null:
return text(_that.value);case InlineValue$VariableLookup() when variableLookup != null:
return variableLookup(_that.value);case InlineValue$EvaluatableExpression() when evaluatableExpression != null:
return evaluatableExpression(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class InlineValue$Text extends InlineValue {
  const InlineValue$Text({required this.value}): super._();
  

@override final  InlineValueText value;

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InlineValue$TextCopyWith<InlineValue$Text> get copyWith => _$InlineValue$TextCopyWithImpl<InlineValue$Text>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InlineValue$Text&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'InlineValue.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $InlineValue$TextCopyWith<$Res> implements $InlineValueCopyWith<$Res> {
  factory $InlineValue$TextCopyWith(InlineValue$Text value, $Res Function(InlineValue$Text) _then) = _$InlineValue$TextCopyWithImpl;
@useResult
$Res call({
 InlineValueText value
});


$InlineValueTextCopyWith<$Res> get value;

}
/// @nodoc
class _$InlineValue$TextCopyWithImpl<$Res>
    implements $InlineValue$TextCopyWith<$Res> {
  _$InlineValue$TextCopyWithImpl(this._self, this._then);

  final InlineValue$Text _self;
  final $Res Function(InlineValue$Text) _then;

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(InlineValue$Text(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as InlineValueText,
  ));
}

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InlineValueTextCopyWith<$Res> get value {
  
  return $InlineValueTextCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class InlineValue$VariableLookup extends InlineValue {
  const InlineValue$VariableLookup({required this.value}): super._();
  

@override final  InlineValueVariableLookup value;

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InlineValue$VariableLookupCopyWith<InlineValue$VariableLookup> get copyWith => _$InlineValue$VariableLookupCopyWithImpl<InlineValue$VariableLookup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InlineValue$VariableLookup&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'InlineValue.variableLookup(value: $value)';
}


}

/// @nodoc
abstract mixin class $InlineValue$VariableLookupCopyWith<$Res> implements $InlineValueCopyWith<$Res> {
  factory $InlineValue$VariableLookupCopyWith(InlineValue$VariableLookup value, $Res Function(InlineValue$VariableLookup) _then) = _$InlineValue$VariableLookupCopyWithImpl;
@useResult
$Res call({
 InlineValueVariableLookup value
});


$InlineValueVariableLookupCopyWith<$Res> get value;

}
/// @nodoc
class _$InlineValue$VariableLookupCopyWithImpl<$Res>
    implements $InlineValue$VariableLookupCopyWith<$Res> {
  _$InlineValue$VariableLookupCopyWithImpl(this._self, this._then);

  final InlineValue$VariableLookup _self;
  final $Res Function(InlineValue$VariableLookup) _then;

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(InlineValue$VariableLookup(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as InlineValueVariableLookup,
  ));
}

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InlineValueVariableLookupCopyWith<$Res> get value {
  
  return $InlineValueVariableLookupCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class InlineValue$EvaluatableExpression extends InlineValue {
  const InlineValue$EvaluatableExpression({required this.value}): super._();
  

@override final  InlineValueEvaluatableExpression value;

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InlineValue$EvaluatableExpressionCopyWith<InlineValue$EvaluatableExpression> get copyWith => _$InlineValue$EvaluatableExpressionCopyWithImpl<InlineValue$EvaluatableExpression>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InlineValue$EvaluatableExpression&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'InlineValue.evaluatableExpression(value: $value)';
}


}

/// @nodoc
abstract mixin class $InlineValue$EvaluatableExpressionCopyWith<$Res> implements $InlineValueCopyWith<$Res> {
  factory $InlineValue$EvaluatableExpressionCopyWith(InlineValue$EvaluatableExpression value, $Res Function(InlineValue$EvaluatableExpression) _then) = _$InlineValue$EvaluatableExpressionCopyWithImpl;
@useResult
$Res call({
 InlineValueEvaluatableExpression value
});


$InlineValueEvaluatableExpressionCopyWith<$Res> get value;

}
/// @nodoc
class _$InlineValue$EvaluatableExpressionCopyWithImpl<$Res>
    implements $InlineValue$EvaluatableExpressionCopyWith<$Res> {
  _$InlineValue$EvaluatableExpressionCopyWithImpl(this._self, this._then);

  final InlineValue$EvaluatableExpression _self;
  final $Res Function(InlineValue$EvaluatableExpression) _then;

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(InlineValue$EvaluatableExpression(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as InlineValueEvaluatableExpression,
  ));
}

/// Create a copy of InlineValue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InlineValueEvaluatableExpressionCopyWith<$Res> get value {
  
  return $InlineValueEvaluatableExpressionCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc
mixin _$DocumentDiagnosticReport {

 Object get value;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentDiagnosticReport&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'DocumentDiagnosticReport(value: $value)';
}


}

/// @nodoc
class $DocumentDiagnosticReportCopyWith<$Res>  {
$DocumentDiagnosticReportCopyWith(DocumentDiagnosticReport _, $Res Function(DocumentDiagnosticReport) __);
}


/// Adds pattern-matching-related methods to [DocumentDiagnosticReport].
extension DocumentDiagnosticReportPatterns on DocumentDiagnosticReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport value)?  relatedFullDocumentDiagnosticReport,TResult Function( DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport value)?  relatedUnchangedDocumentDiagnosticReport,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport() when relatedFullDocumentDiagnosticReport != null:
return relatedFullDocumentDiagnosticReport(_that);case DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport() when relatedUnchangedDocumentDiagnosticReport != null:
return relatedUnchangedDocumentDiagnosticReport(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport value)  relatedFullDocumentDiagnosticReport,required TResult Function( DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport value)  relatedUnchangedDocumentDiagnosticReport,}){
final _that = this;
switch (_that) {
case DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport():
return relatedFullDocumentDiagnosticReport(_that);case DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport():
return relatedUnchangedDocumentDiagnosticReport(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport value)?  relatedFullDocumentDiagnosticReport,TResult? Function( DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport value)?  relatedUnchangedDocumentDiagnosticReport,}){
final _that = this;
switch (_that) {
case DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport() when relatedFullDocumentDiagnosticReport != null:
return relatedFullDocumentDiagnosticReport(_that);case DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport() when relatedUnchangedDocumentDiagnosticReport != null:
return relatedUnchangedDocumentDiagnosticReport(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RelatedFullDocumentDiagnosticReport value)?  relatedFullDocumentDiagnosticReport,TResult Function( RelatedUnchangedDocumentDiagnosticReport value)?  relatedUnchangedDocumentDiagnosticReport,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport() when relatedFullDocumentDiagnosticReport != null:
return relatedFullDocumentDiagnosticReport(_that.value);case DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport() when relatedUnchangedDocumentDiagnosticReport != null:
return relatedUnchangedDocumentDiagnosticReport(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RelatedFullDocumentDiagnosticReport value)  relatedFullDocumentDiagnosticReport,required TResult Function( RelatedUnchangedDocumentDiagnosticReport value)  relatedUnchangedDocumentDiagnosticReport,}) {final _that = this;
switch (_that) {
case DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport():
return relatedFullDocumentDiagnosticReport(_that.value);case DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport():
return relatedUnchangedDocumentDiagnosticReport(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RelatedFullDocumentDiagnosticReport value)?  relatedFullDocumentDiagnosticReport,TResult? Function( RelatedUnchangedDocumentDiagnosticReport value)?  relatedUnchangedDocumentDiagnosticReport,}) {final _that = this;
switch (_that) {
case DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport() when relatedFullDocumentDiagnosticReport != null:
return relatedFullDocumentDiagnosticReport(_that.value);case DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport() when relatedUnchangedDocumentDiagnosticReport != null:
return relatedUnchangedDocumentDiagnosticReport(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport extends DocumentDiagnosticReport {
  const DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport({required this.value}): super._();
  

@override final  RelatedFullDocumentDiagnosticReport value;

/// Create a copy of DocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWith<DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport> get copyWith => _$DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWithImpl<DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'DocumentDiagnosticReport.relatedFullDocumentDiagnosticReport(value: $value)';
}


}

/// @nodoc
abstract mixin class $DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWith<$Res> implements $DocumentDiagnosticReportCopyWith<$Res> {
  factory $DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWith(DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport value, $Res Function(DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport) _then) = _$DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWithImpl;
@useResult
$Res call({
 RelatedFullDocumentDiagnosticReport value
});


$RelatedFullDocumentDiagnosticReportCopyWith<$Res> get value;

}
/// @nodoc
class _$DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWithImpl<$Res>
    implements $DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWith<$Res> {
  _$DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReportCopyWithImpl(this._self, this._then);

  final DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport _self;
  final $Res Function(DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport) _then;

/// Create a copy of DocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as RelatedFullDocumentDiagnosticReport,
  ));
}

/// Create a copy of DocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RelatedFullDocumentDiagnosticReportCopyWith<$Res> get value {
  
  return $RelatedFullDocumentDiagnosticReportCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport extends DocumentDiagnosticReport {
  const DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport({required this.value}): super._();
  

@override final  RelatedUnchangedDocumentDiagnosticReport value;

/// Create a copy of DocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWith<DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport> get copyWith => _$DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWithImpl<DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'DocumentDiagnosticReport.relatedUnchangedDocumentDiagnosticReport(value: $value)';
}


}

/// @nodoc
abstract mixin class $DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWith<$Res> implements $DocumentDiagnosticReportCopyWith<$Res> {
  factory $DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWith(DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport value, $Res Function(DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport) _then) = _$DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWithImpl;
@useResult
$Res call({
 RelatedUnchangedDocumentDiagnosticReport value
});


$RelatedUnchangedDocumentDiagnosticReportCopyWith<$Res> get value;

}
/// @nodoc
class _$DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWithImpl<$Res>
    implements $DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWith<$Res> {
  _$DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReportCopyWithImpl(this._self, this._then);

  final DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport _self;
  final $Res Function(DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport) _then;

/// Create a copy of DocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as RelatedUnchangedDocumentDiagnosticReport,
  ));
}

/// Create a copy of DocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RelatedUnchangedDocumentDiagnosticReportCopyWith<$Res> get value {
  
  return $RelatedUnchangedDocumentDiagnosticReportCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc
mixin _$WorkspaceDocumentDiagnosticReport {

 Object get value;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceDocumentDiagnosticReport&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'WorkspaceDocumentDiagnosticReport(value: $value)';
}


}

/// @nodoc
class $WorkspaceDocumentDiagnosticReportCopyWith<$Res>  {
$WorkspaceDocumentDiagnosticReportCopyWith(WorkspaceDocumentDiagnosticReport _, $Res Function(WorkspaceDocumentDiagnosticReport) __);
}


/// Adds pattern-matching-related methods to [WorkspaceDocumentDiagnosticReport].
extension WorkspaceDocumentDiagnosticReportPatterns on WorkspaceDocumentDiagnosticReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport value)?  workspaceFullDocumentDiagnosticReport,TResult Function( WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport value)?  workspaceUnchangedDocumentDiagnosticReport,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport() when workspaceFullDocumentDiagnosticReport != null:
return workspaceFullDocumentDiagnosticReport(_that);case WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport() when workspaceUnchangedDocumentDiagnosticReport != null:
return workspaceUnchangedDocumentDiagnosticReport(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport value)  workspaceFullDocumentDiagnosticReport,required TResult Function( WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport value)  workspaceUnchangedDocumentDiagnosticReport,}){
final _that = this;
switch (_that) {
case WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport():
return workspaceFullDocumentDiagnosticReport(_that);case WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport():
return workspaceUnchangedDocumentDiagnosticReport(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport value)?  workspaceFullDocumentDiagnosticReport,TResult? Function( WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport value)?  workspaceUnchangedDocumentDiagnosticReport,}){
final _that = this;
switch (_that) {
case WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport() when workspaceFullDocumentDiagnosticReport != null:
return workspaceFullDocumentDiagnosticReport(_that);case WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport() when workspaceUnchangedDocumentDiagnosticReport != null:
return workspaceUnchangedDocumentDiagnosticReport(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( WorkspaceFullDocumentDiagnosticReport value)?  workspaceFullDocumentDiagnosticReport,TResult Function( WorkspaceUnchangedDocumentDiagnosticReport value)?  workspaceUnchangedDocumentDiagnosticReport,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport() when workspaceFullDocumentDiagnosticReport != null:
return workspaceFullDocumentDiagnosticReport(_that.value);case WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport() when workspaceUnchangedDocumentDiagnosticReport != null:
return workspaceUnchangedDocumentDiagnosticReport(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( WorkspaceFullDocumentDiagnosticReport value)  workspaceFullDocumentDiagnosticReport,required TResult Function( WorkspaceUnchangedDocumentDiagnosticReport value)  workspaceUnchangedDocumentDiagnosticReport,}) {final _that = this;
switch (_that) {
case WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport():
return workspaceFullDocumentDiagnosticReport(_that.value);case WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport():
return workspaceUnchangedDocumentDiagnosticReport(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( WorkspaceFullDocumentDiagnosticReport value)?  workspaceFullDocumentDiagnosticReport,TResult? Function( WorkspaceUnchangedDocumentDiagnosticReport value)?  workspaceUnchangedDocumentDiagnosticReport,}) {final _that = this;
switch (_that) {
case WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport() when workspaceFullDocumentDiagnosticReport != null:
return workspaceFullDocumentDiagnosticReport(_that.value);case WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport() when workspaceUnchangedDocumentDiagnosticReport != null:
return workspaceUnchangedDocumentDiagnosticReport(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport extends WorkspaceDocumentDiagnosticReport {
  const WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport({required this.value}): super._();
  

@override final  WorkspaceFullDocumentDiagnosticReport value;

/// Create a copy of WorkspaceDocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWith<WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport> get copyWith => _$WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWithImpl<WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'WorkspaceDocumentDiagnosticReport.workspaceFullDocumentDiagnosticReport(value: $value)';
}


}

/// @nodoc
abstract mixin class $WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWith<$Res> implements $WorkspaceDocumentDiagnosticReportCopyWith<$Res> {
  factory $WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWith(WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport value, $Res Function(WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport) _then) = _$WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWithImpl;
@useResult
$Res call({
 WorkspaceFullDocumentDiagnosticReport value
});


$WorkspaceFullDocumentDiagnosticReportCopyWith<$Res> get value;

}
/// @nodoc
class _$WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWithImpl<$Res>
    implements $WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWith<$Res> {
  _$WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReportCopyWithImpl(this._self, this._then);

  final WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport _self;
  final $Res Function(WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport) _then;

/// Create a copy of WorkspaceDocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as WorkspaceFullDocumentDiagnosticReport,
  ));
}

/// Create a copy of WorkspaceDocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkspaceFullDocumentDiagnosticReportCopyWith<$Res> get value {
  
  return $WorkspaceFullDocumentDiagnosticReportCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport extends WorkspaceDocumentDiagnosticReport {
  const WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport({required this.value}): super._();
  

@override final  WorkspaceUnchangedDocumentDiagnosticReport value;

/// Create a copy of WorkspaceDocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWith<WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport> get copyWith => _$WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWithImpl<WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'WorkspaceDocumentDiagnosticReport.workspaceUnchangedDocumentDiagnosticReport(value: $value)';
}


}

/// @nodoc
abstract mixin class $WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWith<$Res> implements $WorkspaceDocumentDiagnosticReportCopyWith<$Res> {
  factory $WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWith(WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport value, $Res Function(WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport) _then) = _$WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWithImpl;
@useResult
$Res call({
 WorkspaceUnchangedDocumentDiagnosticReport value
});


$WorkspaceUnchangedDocumentDiagnosticReportCopyWith<$Res> get value;

}
/// @nodoc
class _$WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWithImpl<$Res>
    implements $WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWith<$Res> {
  _$WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReportCopyWithImpl(this._self, this._then);

  final WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport _self;
  final $Res Function(WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport) _then;

/// Create a copy of WorkspaceDocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as WorkspaceUnchangedDocumentDiagnosticReport,
  ));
}

/// Create a copy of WorkspaceDocumentDiagnosticReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkspaceUnchangedDocumentDiagnosticReportCopyWith<$Res> get value {
  
  return $WorkspaceUnchangedDocumentDiagnosticReportCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

// dart format on
