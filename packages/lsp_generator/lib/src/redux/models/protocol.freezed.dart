// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'protocol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaProtocol {

 MetaData get metaData; List<MetaRequest> get requests; List<MetaNotification> get notifications; List<MetaStructure> get structures; List<MetaEnumeration> get enumerations; List<MetaTypeAlias> get typeAliases;
/// Create a copy of MetaProtocol
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaProtocolCopyWith<MetaProtocol> get copyWith => _$MetaProtocolCopyWithImpl<MetaProtocol>(this as MetaProtocol, _$identity);

  /// Serializes this MetaProtocol to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaProtocol&&(identical(other.metaData, metaData) || other.metaData == metaData)&&const DeepCollectionEquality().equals(other.requests, requests)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&const DeepCollectionEquality().equals(other.structures, structures)&&const DeepCollectionEquality().equals(other.enumerations, enumerations)&&const DeepCollectionEquality().equals(other.typeAliases, typeAliases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metaData,const DeepCollectionEquality().hash(requests),const DeepCollectionEquality().hash(notifications),const DeepCollectionEquality().hash(structures),const DeepCollectionEquality().hash(enumerations),const DeepCollectionEquality().hash(typeAliases));

@override
String toString() {
  return 'MetaProtocol(metaData: $metaData, requests: $requests, notifications: $notifications, structures: $structures, enumerations: $enumerations, typeAliases: $typeAliases)';
}


}

/// @nodoc
abstract mixin class $MetaProtocolCopyWith<$Res>  {
  factory $MetaProtocolCopyWith(MetaProtocol value, $Res Function(MetaProtocol) _then) = _$MetaProtocolCopyWithImpl;
@useResult
$Res call({
 MetaData metaData, List<MetaRequest> requests, List<MetaNotification> notifications, List<MetaStructure> structures, List<MetaEnumeration> enumerations, List<MetaTypeAlias> typeAliases
});


$MetaDataCopyWith<$Res> get metaData;

}
/// @nodoc
class _$MetaProtocolCopyWithImpl<$Res>
    implements $MetaProtocolCopyWith<$Res> {
  _$MetaProtocolCopyWithImpl(this._self, this._then);

  final MetaProtocol _self;
  final $Res Function(MetaProtocol) _then;

/// Create a copy of MetaProtocol
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metaData = null,Object? requests = null,Object? notifications = null,Object? structures = null,Object? enumerations = null,Object? typeAliases = null,}) {
  return _then(_self.copyWith(
metaData: null == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as MetaData,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<MetaRequest>,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<MetaNotification>,structures: null == structures ? _self.structures : structures // ignore: cast_nullable_to_non_nullable
as List<MetaStructure>,enumerations: null == enumerations ? _self.enumerations : enumerations // ignore: cast_nullable_to_non_nullable
as List<MetaEnumeration>,typeAliases: null == typeAliases ? _self.typeAliases : typeAliases // ignore: cast_nullable_to_non_nullable
as List<MetaTypeAlias>,
  ));
}
/// Create a copy of MetaProtocol
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDataCopyWith<$Res> get metaData {
  
  return $MetaDataCopyWith<$Res>(_self.metaData, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaProtocol].
extension MetaProtocolPatterns on MetaProtocol {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaProtocol value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaProtocol() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaProtocol value)  $default,){
final _that = this;
switch (_that) {
case _MetaProtocol():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaProtocol value)?  $default,){
final _that = this;
switch (_that) {
case _MetaProtocol() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaData metaData,  List<MetaRequest> requests,  List<MetaNotification> notifications,  List<MetaStructure> structures,  List<MetaEnumeration> enumerations,  List<MetaTypeAlias> typeAliases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaProtocol() when $default != null:
return $default(_that.metaData,_that.requests,_that.notifications,_that.structures,_that.enumerations,_that.typeAliases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaData metaData,  List<MetaRequest> requests,  List<MetaNotification> notifications,  List<MetaStructure> structures,  List<MetaEnumeration> enumerations,  List<MetaTypeAlias> typeAliases)  $default,) {final _that = this;
switch (_that) {
case _MetaProtocol():
return $default(_that.metaData,_that.requests,_that.notifications,_that.structures,_that.enumerations,_that.typeAliases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaData metaData,  List<MetaRequest> requests,  List<MetaNotification> notifications,  List<MetaStructure> structures,  List<MetaEnumeration> enumerations,  List<MetaTypeAlias> typeAliases)?  $default,) {final _that = this;
switch (_that) {
case _MetaProtocol() when $default != null:
return $default(_that.metaData,_that.requests,_that.notifications,_that.structures,_that.enumerations,_that.typeAliases);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaProtocol implements MetaProtocol {
  const _MetaProtocol({required this.metaData, required final  List<MetaRequest> requests, required final  List<MetaNotification> notifications, required final  List<MetaStructure> structures, required final  List<MetaEnumeration> enumerations, required final  List<MetaTypeAlias> typeAliases}): _requests = requests,_notifications = notifications,_structures = structures,_enumerations = enumerations,_typeAliases = typeAliases;
  factory _MetaProtocol.fromJson(Map<String, dynamic> json) => _$MetaProtocolFromJson(json);

@override final  MetaData metaData;
 final  List<MetaRequest> _requests;
@override List<MetaRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  List<MetaNotification> _notifications;
@override List<MetaNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  List<MetaStructure> _structures;
@override List<MetaStructure> get structures {
  if (_structures is EqualUnmodifiableListView) return _structures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_structures);
}

 final  List<MetaEnumeration> _enumerations;
@override List<MetaEnumeration> get enumerations {
  if (_enumerations is EqualUnmodifiableListView) return _enumerations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enumerations);
}

 final  List<MetaTypeAlias> _typeAliases;
@override List<MetaTypeAlias> get typeAliases {
  if (_typeAliases is EqualUnmodifiableListView) return _typeAliases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typeAliases);
}


/// Create a copy of MetaProtocol
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaProtocolCopyWith<_MetaProtocol> get copyWith => __$MetaProtocolCopyWithImpl<_MetaProtocol>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaProtocolToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaProtocol&&(identical(other.metaData, metaData) || other.metaData == metaData)&&const DeepCollectionEquality().equals(other._requests, _requests)&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&const DeepCollectionEquality().equals(other._structures, _structures)&&const DeepCollectionEquality().equals(other._enumerations, _enumerations)&&const DeepCollectionEquality().equals(other._typeAliases, _typeAliases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metaData,const DeepCollectionEquality().hash(_requests),const DeepCollectionEquality().hash(_notifications),const DeepCollectionEquality().hash(_structures),const DeepCollectionEquality().hash(_enumerations),const DeepCollectionEquality().hash(_typeAliases));

@override
String toString() {
  return 'MetaProtocol(metaData: $metaData, requests: $requests, notifications: $notifications, structures: $structures, enumerations: $enumerations, typeAliases: $typeAliases)';
}


}

/// @nodoc
abstract mixin class _$MetaProtocolCopyWith<$Res> implements $MetaProtocolCopyWith<$Res> {
  factory _$MetaProtocolCopyWith(_MetaProtocol value, $Res Function(_MetaProtocol) _then) = __$MetaProtocolCopyWithImpl;
@override @useResult
$Res call({
 MetaData metaData, List<MetaRequest> requests, List<MetaNotification> notifications, List<MetaStructure> structures, List<MetaEnumeration> enumerations, List<MetaTypeAlias> typeAliases
});


@override $MetaDataCopyWith<$Res> get metaData;

}
/// @nodoc
class __$MetaProtocolCopyWithImpl<$Res>
    implements _$MetaProtocolCopyWith<$Res> {
  __$MetaProtocolCopyWithImpl(this._self, this._then);

  final _MetaProtocol _self;
  final $Res Function(_MetaProtocol) _then;

/// Create a copy of MetaProtocol
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metaData = null,Object? requests = null,Object? notifications = null,Object? structures = null,Object? enumerations = null,Object? typeAliases = null,}) {
  return _then(_MetaProtocol(
metaData: null == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as MetaData,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<MetaRequest>,notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<MetaNotification>,structures: null == structures ? _self._structures : structures // ignore: cast_nullable_to_non_nullable
as List<MetaStructure>,enumerations: null == enumerations ? _self._enumerations : enumerations // ignore: cast_nullable_to_non_nullable
as List<MetaEnumeration>,typeAliases: null == typeAliases ? _self._typeAliases : typeAliases // ignore: cast_nullable_to_non_nullable
as List<MetaTypeAlias>,
  ));
}

/// Create a copy of MetaProtocol
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDataCopyWith<$Res> get metaData {
  
  return $MetaDataCopyWith<$Res>(_self.metaData, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}


/// @nodoc
mixin _$MetaData {

 String get version;
/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaDataCopyWith<MetaData> get copyWith => _$MetaDataCopyWithImpl<MetaData>(this as MetaData, _$identity);

  /// Serializes this MetaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaData&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'MetaData(version: $version)';
}


}

/// @nodoc
abstract mixin class $MetaDataCopyWith<$Res>  {
  factory $MetaDataCopyWith(MetaData value, $Res Function(MetaData) _then) = _$MetaDataCopyWithImpl;
@useResult
$Res call({
 String version
});




}
/// @nodoc
class _$MetaDataCopyWithImpl<$Res>
    implements $MetaDataCopyWith<$Res> {
  _$MetaDataCopyWithImpl(this._self, this._then);

  final MetaData _self;
  final $Res Function(MetaData) _then;

/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaData].
extension MetaDataPatterns on MetaData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaData value)  $default,){
final _that = this;
switch (_that) {
case _MetaData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaData value)?  $default,){
final _that = this;
switch (_that) {
case _MetaData() when $default != null:
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
case _MetaData() when $default != null:
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
case _MetaData():
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
case _MetaData() when $default != null:
return $default(_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaData implements MetaData {
  const _MetaData({required this.version});
  factory _MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);

@override final  String version;

/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaDataCopyWith<_MetaData> get copyWith => __$MetaDataCopyWithImpl<_MetaData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaData&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'MetaData(version: $version)';
}


}

/// @nodoc
abstract mixin class _$MetaDataCopyWith<$Res> implements $MetaDataCopyWith<$Res> {
  factory _$MetaDataCopyWith(_MetaData value, $Res Function(_MetaData) _then) = __$MetaDataCopyWithImpl;
@override @useResult
$Res call({
 String version
});




}
/// @nodoc
class __$MetaDataCopyWithImpl<$Res>
    implements _$MetaDataCopyWith<$Res> {
  __$MetaDataCopyWithImpl(this._self, this._then);

  final _MetaData _self;
  final $Res Function(_MetaData) _then;

/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,}) {
  return _then(_MetaData(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MetaRequest {

 String get method; MessageDirection get messageDirection; MetaReference? get params; MetaReference? get result; String? get documentation; MetaReference? get partialResult; MetaReference? get registrationOptions; String? get since; bool? get proposed; String? get registrationMethod; MetaReference? get errorData;
/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaRequestCopyWith<MetaRequest> get copyWith => _$MetaRequestCopyWithImpl<MetaRequest>(this as MetaRequest, _$identity);

  /// Serializes this MetaRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.result, result) || other.result == result)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.partialResult, partialResult) || other.partialResult == partialResult)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod)&&(identical(other.errorData, errorData) || other.errorData == errorData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,result,documentation,partialResult,registrationOptions,since,proposed,registrationMethod,errorData);

@override
String toString() {
  return 'MetaRequest(method: $method, messageDirection: $messageDirection, params: $params, result: $result, documentation: $documentation, partialResult: $partialResult, registrationOptions: $registrationOptions, since: $since, proposed: $proposed, registrationMethod: $registrationMethod, errorData: $errorData)';
}


}

/// @nodoc
abstract mixin class $MetaRequestCopyWith<$Res>  {
  factory $MetaRequestCopyWith(MetaRequest value, $Res Function(MetaRequest) _then) = _$MetaRequestCopyWithImpl;
@useResult
$Res call({
 String method, MessageDirection messageDirection, MetaReference? params, MetaReference? result, String? documentation, MetaReference? partialResult, MetaReference? registrationOptions, String? since, bool? proposed, String? registrationMethod, MetaReference? errorData
});


$MetaReferenceCopyWith<$Res>? get params;$MetaReferenceCopyWith<$Res>? get result;$MetaReferenceCopyWith<$Res>? get partialResult;$MetaReferenceCopyWith<$Res>? get registrationOptions;$MetaReferenceCopyWith<$Res>? get errorData;

}
/// @nodoc
class _$MetaRequestCopyWithImpl<$Res>
    implements $MetaRequestCopyWith<$Res> {
  _$MetaRequestCopyWithImpl(this._self, this._then);

  final MetaRequest _self;
  final $Res Function(MetaRequest) _then;

/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? result = freezed,Object? documentation = freezed,Object? partialResult = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? proposed = freezed,Object? registrationMethod = freezed,Object? errorData = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as MetaReference?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as MetaReference?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,partialResult: freezed == partialResult ? _self.partialResult : partialResult // ignore: cast_nullable_to_non_nullable
as MetaReference?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as MetaReference?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: freezed == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,errorData: freezed == errorData ? _self.errorData : errorData // ignore: cast_nullable_to_non_nullable
as MetaReference?,
  ));
}
/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get partialResult {
    if (_self.partialResult == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.partialResult!, (value) {
    return _then(_self.copyWith(partialResult: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get errorData {
    if (_self.errorData == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.errorData!, (value) {
    return _then(_self.copyWith(errorData: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaRequest].
extension MetaRequestPatterns on MetaRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaRequest value)  $default,){
final _that = this;
switch (_that) {
case _MetaRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MetaRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  MetaReference? params,  MetaReference? result,  String? documentation,  MetaReference? partialResult,  MetaReference? registrationOptions,  String? since,  bool? proposed,  String? registrationMethod,  MetaReference? errorData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  MetaReference? params,  MetaReference? result,  String? documentation,  MetaReference? partialResult,  MetaReference? registrationOptions,  String? since,  bool? proposed,  String? registrationMethod,  MetaReference? errorData)  $default,) {final _that = this;
switch (_that) {
case _MetaRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  MessageDirection messageDirection,  MetaReference? params,  MetaReference? result,  String? documentation,  MetaReference? partialResult,  MetaReference? registrationOptions,  String? since,  bool? proposed,  String? registrationMethod,  MetaReference? errorData)?  $default,) {final _that = this;
switch (_that) {
case _MetaRequest() when $default != null:
return $default(_that.method,_that.messageDirection,_that.params,_that.result,_that.documentation,_that.partialResult,_that.registrationOptions,_that.since,_that.proposed,_that.registrationMethod,_that.errorData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaRequest implements MetaRequest {
  const _MetaRequest({required this.method, required this.messageDirection, this.params, this.result, this.documentation, this.partialResult, this.registrationOptions, this.since, this.proposed, this.registrationMethod, this.errorData});
  factory _MetaRequest.fromJson(Map<String, dynamic> json) => _$MetaRequestFromJson(json);

@override final  String method;
@override final  MessageDirection messageDirection;
@override final  MetaReference? params;
@override final  MetaReference? result;
@override final  String? documentation;
@override final  MetaReference? partialResult;
@override final  MetaReference? registrationOptions;
@override final  String? since;
@override final  bool? proposed;
@override final  String? registrationMethod;
@override final  MetaReference? errorData;

/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaRequestCopyWith<_MetaRequest> get copyWith => __$MetaRequestCopyWithImpl<_MetaRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.result, result) || other.result == result)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.partialResult, partialResult) || other.partialResult == partialResult)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod)&&(identical(other.errorData, errorData) || other.errorData == errorData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,result,documentation,partialResult,registrationOptions,since,proposed,registrationMethod,errorData);

@override
String toString() {
  return 'MetaRequest(method: $method, messageDirection: $messageDirection, params: $params, result: $result, documentation: $documentation, partialResult: $partialResult, registrationOptions: $registrationOptions, since: $since, proposed: $proposed, registrationMethod: $registrationMethod, errorData: $errorData)';
}


}

/// @nodoc
abstract mixin class _$MetaRequestCopyWith<$Res> implements $MetaRequestCopyWith<$Res> {
  factory _$MetaRequestCopyWith(_MetaRequest value, $Res Function(_MetaRequest) _then) = __$MetaRequestCopyWithImpl;
@override @useResult
$Res call({
 String method, MessageDirection messageDirection, MetaReference? params, MetaReference? result, String? documentation, MetaReference? partialResult, MetaReference? registrationOptions, String? since, bool? proposed, String? registrationMethod, MetaReference? errorData
});


@override $MetaReferenceCopyWith<$Res>? get params;@override $MetaReferenceCopyWith<$Res>? get result;@override $MetaReferenceCopyWith<$Res>? get partialResult;@override $MetaReferenceCopyWith<$Res>? get registrationOptions;@override $MetaReferenceCopyWith<$Res>? get errorData;

}
/// @nodoc
class __$MetaRequestCopyWithImpl<$Res>
    implements _$MetaRequestCopyWith<$Res> {
  __$MetaRequestCopyWithImpl(this._self, this._then);

  final _MetaRequest _self;
  final $Res Function(_MetaRequest) _then;

/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? result = freezed,Object? documentation = freezed,Object? partialResult = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? proposed = freezed,Object? registrationMethod = freezed,Object? errorData = freezed,}) {
  return _then(_MetaRequest(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as MetaReference?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as MetaReference?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,partialResult: freezed == partialResult ? _self.partialResult : partialResult // ignore: cast_nullable_to_non_nullable
as MetaReference?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as MetaReference?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: freezed == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,errorData: freezed == errorData ? _self.errorData : errorData // ignore: cast_nullable_to_non_nullable
as MetaReference?,
  ));
}

/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get partialResult {
    if (_self.partialResult == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.partialResult!, (value) {
    return _then(_self.copyWith(partialResult: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get errorData {
    if (_self.errorData == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.errorData!, (value) {
    return _then(_self.copyWith(errorData: value));
  });
}
}

MetaReference _$MetaReferenceFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'reference':
          return TypeRef.fromJson(
            json
          );
                case 'array':
          return ArrayRef.fromJson(
            json
          );
                case 'base':
          return BaseRef.fromJson(
            json
          );
                case 'or':
          return OrRef.fromJson(
            json
          );
                case 'and':
          return AndRef.fromJson(
            json
          );
                case 'map':
          return MapRef.fromJson(
            json
          );
                case 'literal':
          return LiteralRef.fromJson(
            json
          );
                case 'stringLiteral':
          return StringLiteralRef.fromJson(
            json
          );
                case 'tuple':
          return TupleRef.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'MetaReference',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$MetaReference {

 TypeKind get kind;
/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<MetaReference> get copyWith => _$MetaReferenceCopyWithImpl<MetaReference>(this as MetaReference, _$identity);

  /// Serializes this MetaReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaReference&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'MetaReference(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $MetaReferenceCopyWith<$Res>  {
  factory $MetaReferenceCopyWith(MetaReference value, $Res Function(MetaReference) _then) = _$MetaReferenceCopyWithImpl;
@useResult
$Res call({
 TypeKind kind
});




}
/// @nodoc
class _$MetaReferenceCopyWithImpl<$Res>
    implements $MetaReferenceCopyWith<$Res> {
  _$MetaReferenceCopyWithImpl(this._self, this._then);

  final MetaReference _self;
  final $Res Function(MetaReference) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaReference].
extension MetaReferencePatterns on MetaReference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TypeRef value)?  type,TResult Function( ArrayRef value)?  array,TResult Function( BaseRef value)?  base,TResult Function( OrRef value)?  or,TResult Function( AndRef value)?  and,TResult Function( MapRef value)?  map,TResult Function( LiteralRef value)?  literal,TResult Function( StringLiteralRef value)?  stringLiteral,TResult Function( TupleRef value)?  tuple,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TypeRef() when type != null:
return type(_that);case ArrayRef() when array != null:
return array(_that);case BaseRef() when base != null:
return base(_that);case OrRef() when or != null:
return or(_that);case AndRef() when and != null:
return and(_that);case MapRef() when map != null:
return map(_that);case LiteralRef() when literal != null:
return literal(_that);case StringLiteralRef() when stringLiteral != null:
return stringLiteral(_that);case TupleRef() when tuple != null:
return tuple(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TypeRef value)  type,required TResult Function( ArrayRef value)  array,required TResult Function( BaseRef value)  base,required TResult Function( OrRef value)  or,required TResult Function( AndRef value)  and,required TResult Function( MapRef value)  map,required TResult Function( LiteralRef value)  literal,required TResult Function( StringLiteralRef value)  stringLiteral,required TResult Function( TupleRef value)  tuple,}){
final _that = this;
switch (_that) {
case TypeRef():
return type(_that);case ArrayRef():
return array(_that);case BaseRef():
return base(_that);case OrRef():
return or(_that);case AndRef():
return and(_that);case MapRef():
return map(_that);case LiteralRef():
return literal(_that);case StringLiteralRef():
return stringLiteral(_that);case TupleRef():
return tuple(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TypeRef value)?  type,TResult? Function( ArrayRef value)?  array,TResult? Function( BaseRef value)?  base,TResult? Function( OrRef value)?  or,TResult? Function( AndRef value)?  and,TResult? Function( MapRef value)?  map,TResult? Function( LiteralRef value)?  literal,TResult? Function( StringLiteralRef value)?  stringLiteral,TResult? Function( TupleRef value)?  tuple,}){
final _that = this;
switch (_that) {
case TypeRef() when type != null:
return type(_that);case ArrayRef() when array != null:
return array(_that);case BaseRef() when base != null:
return base(_that);case OrRef() when or != null:
return or(_that);case AndRef() when and != null:
return and(_that);case MapRef() when map != null:
return map(_that);case LiteralRef() when literal != null:
return literal(_that);case StringLiteralRef() when stringLiteral != null:
return stringLiteral(_that);case TupleRef() when tuple != null:
return tuple(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TypeKind kind,  String name)?  type,TResult Function( TypeKind kind,  MetaReference element)?  array,TResult Function( TypeKind kind,  String name)?  base,TResult Function( TypeKind kind,  List<MetaReference> items)?  or,TResult Function( TypeKind kind,  List<MetaReference> items)?  and,TResult Function( TypeKind kind,  MetaReference key,  MetaReference value)?  map,TResult Function( TypeKind kind,  MetaLiteral value)?  literal,TResult Function( TypeKind kind,  String value)?  stringLiteral,TResult Function( TypeKind kind,  List<MetaReference> items)?  tuple,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TypeRef() when type != null:
return type(_that.kind,_that.name);case ArrayRef() when array != null:
return array(_that.kind,_that.element);case BaseRef() when base != null:
return base(_that.kind,_that.name);case OrRef() when or != null:
return or(_that.kind,_that.items);case AndRef() when and != null:
return and(_that.kind,_that.items);case MapRef() when map != null:
return map(_that.kind,_that.key,_that.value);case LiteralRef() when literal != null:
return literal(_that.kind,_that.value);case StringLiteralRef() when stringLiteral != null:
return stringLiteral(_that.kind,_that.value);case TupleRef() when tuple != null:
return tuple(_that.kind,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TypeKind kind,  String name)  type,required TResult Function( TypeKind kind,  MetaReference element)  array,required TResult Function( TypeKind kind,  String name)  base,required TResult Function( TypeKind kind,  List<MetaReference> items)  or,required TResult Function( TypeKind kind,  List<MetaReference> items)  and,required TResult Function( TypeKind kind,  MetaReference key,  MetaReference value)  map,required TResult Function( TypeKind kind,  MetaLiteral value)  literal,required TResult Function( TypeKind kind,  String value)  stringLiteral,required TResult Function( TypeKind kind,  List<MetaReference> items)  tuple,}) {final _that = this;
switch (_that) {
case TypeRef():
return type(_that.kind,_that.name);case ArrayRef():
return array(_that.kind,_that.element);case BaseRef():
return base(_that.kind,_that.name);case OrRef():
return or(_that.kind,_that.items);case AndRef():
return and(_that.kind,_that.items);case MapRef():
return map(_that.kind,_that.key,_that.value);case LiteralRef():
return literal(_that.kind,_that.value);case StringLiteralRef():
return stringLiteral(_that.kind,_that.value);case TupleRef():
return tuple(_that.kind,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TypeKind kind,  String name)?  type,TResult? Function( TypeKind kind,  MetaReference element)?  array,TResult? Function( TypeKind kind,  String name)?  base,TResult? Function( TypeKind kind,  List<MetaReference> items)?  or,TResult? Function( TypeKind kind,  List<MetaReference> items)?  and,TResult? Function( TypeKind kind,  MetaReference key,  MetaReference value)?  map,TResult? Function( TypeKind kind,  MetaLiteral value)?  literal,TResult? Function( TypeKind kind,  String value)?  stringLiteral,TResult? Function( TypeKind kind,  List<MetaReference> items)?  tuple,}) {final _that = this;
switch (_that) {
case TypeRef() when type != null:
return type(_that.kind,_that.name);case ArrayRef() when array != null:
return array(_that.kind,_that.element);case BaseRef() when base != null:
return base(_that.kind,_that.name);case OrRef() when or != null:
return or(_that.kind,_that.items);case AndRef() when and != null:
return and(_that.kind,_that.items);case MapRef() when map != null:
return map(_that.kind,_that.key,_that.value);case LiteralRef() when literal != null:
return literal(_that.kind,_that.value);case StringLiteralRef() when stringLiteral != null:
return stringLiteral(_that.kind,_that.value);case TupleRef() when tuple != null:
return tuple(_that.kind,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TypeRef implements MetaReference {
  const TypeRef({required this.kind, required this.name});
  factory TypeRef.fromJson(Map<String, dynamic> json) => _$TypeRefFromJson(json);

@override final  TypeKind kind;
 final  String name;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeRefCopyWith<TypeRef> get copyWith => _$TypeRefCopyWithImpl<TypeRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,name);

@override
String toString() {
  return 'MetaReference.type(kind: $kind, name: $name)';
}


}

/// @nodoc
abstract mixin class $TypeRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $TypeRefCopyWith(TypeRef value, $Res Function(TypeRef) _then) = _$TypeRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, String name
});




}
/// @nodoc
class _$TypeRefCopyWithImpl<$Res>
    implements $TypeRefCopyWith<$Res> {
  _$TypeRefCopyWithImpl(this._self, this._then);

  final TypeRef _self;
  final $Res Function(TypeRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? name = null,}) {
  return _then(TypeRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ArrayRef implements MetaReference {
  const ArrayRef({required this.kind, required this.element});
  factory ArrayRef.fromJson(Map<String, dynamic> json) => _$ArrayRefFromJson(json);

@override final  TypeKind kind;
 final  MetaReference element;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArrayRefCopyWith<ArrayRef> get copyWith => _$ArrayRefCopyWithImpl<ArrayRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArrayRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArrayRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.element, element) || other.element == element));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,element);

@override
String toString() {
  return 'MetaReference.array(kind: $kind, element: $element)';
}


}

/// @nodoc
abstract mixin class $ArrayRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $ArrayRefCopyWith(ArrayRef value, $Res Function(ArrayRef) _then) = _$ArrayRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, MetaReference element
});


$MetaReferenceCopyWith<$Res> get element;

}
/// @nodoc
class _$ArrayRefCopyWithImpl<$Res>
    implements $ArrayRefCopyWith<$Res> {
  _$ArrayRefCopyWithImpl(this._self, this._then);

  final ArrayRef _self;
  final $Res Function(ArrayRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? element = null,}) {
  return _then(ArrayRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,element: null == element ? _self.element : element // ignore: cast_nullable_to_non_nullable
as MetaReference,
  ));
}

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get element {
  
  return $MetaReferenceCopyWith<$Res>(_self.element, (value) {
    return _then(_self.copyWith(element: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class BaseRef implements MetaReference {
  const BaseRef({required this.kind, required this.name});
  factory BaseRef.fromJson(Map<String, dynamic> json) => _$BaseRefFromJson(json);

@override final  TypeKind kind;
 final  String name;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseRefCopyWith<BaseRef> get copyWith => _$BaseRefCopyWithImpl<BaseRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BaseRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,name);

@override
String toString() {
  return 'MetaReference.base(kind: $kind, name: $name)';
}


}

/// @nodoc
abstract mixin class $BaseRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $BaseRefCopyWith(BaseRef value, $Res Function(BaseRef) _then) = _$BaseRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, String name
});




}
/// @nodoc
class _$BaseRefCopyWithImpl<$Res>
    implements $BaseRefCopyWith<$Res> {
  _$BaseRefCopyWithImpl(this._self, this._then);

  final BaseRef _self;
  final $Res Function(BaseRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? name = null,}) {
  return _then(BaseRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class OrRef implements MetaReference {
  const OrRef({required this.kind, required final  List<MetaReference> items}): _items = items;
  factory OrRef.fromJson(Map<String, dynamic> json) => _$OrRefFromJson(json);

@override final  TypeKind kind;
 final  List<MetaReference> _items;
 List<MetaReference> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrRefCopyWith<OrRef> get copyWith => _$OrRefCopyWithImpl<OrRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrRef&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MetaReference.or(kind: $kind, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $OrRefCopyWith(OrRef value, $Res Function(OrRef) _then) = _$OrRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, List<MetaReference> items
});




}
/// @nodoc
class _$OrRefCopyWithImpl<$Res>
    implements $OrRefCopyWith<$Res> {
  _$OrRefCopyWithImpl(this._self, this._then);

  final OrRef _self;
  final $Res Function(OrRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? items = null,}) {
  return _then(OrRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AndRef implements MetaReference {
  const AndRef({required this.kind, required final  List<MetaReference> items}): _items = items;
  factory AndRef.fromJson(Map<String, dynamic> json) => _$AndRefFromJson(json);

@override final  TypeKind kind;
 final  List<MetaReference> _items;
 List<MetaReference> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AndRefCopyWith<AndRef> get copyWith => _$AndRefCopyWithImpl<AndRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AndRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AndRef&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MetaReference.and(kind: $kind, items: $items)';
}


}

/// @nodoc
abstract mixin class $AndRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $AndRefCopyWith(AndRef value, $Res Function(AndRef) _then) = _$AndRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, List<MetaReference> items
});




}
/// @nodoc
class _$AndRefCopyWithImpl<$Res>
    implements $AndRefCopyWith<$Res> {
  _$AndRefCopyWithImpl(this._self, this._then);

  final AndRef _self;
  final $Res Function(AndRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? items = null,}) {
  return _then(AndRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MapRef implements MetaReference {
  const MapRef({required this.kind, required this.key, required this.value});
  factory MapRef.fromJson(Map<String, dynamic> json) => _$MapRefFromJson(json);

@override final  TypeKind kind;
 final  MetaReference key;
 final  MetaReference value;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapRefCopyWith<MapRef> get copyWith => _$MapRefCopyWithImpl<MapRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,key,value);

@override
String toString() {
  return 'MetaReference.map(kind: $kind, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $MapRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $MapRefCopyWith(MapRef value, $Res Function(MapRef) _then) = _$MapRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, MetaReference key, MetaReference value
});


$MetaReferenceCopyWith<$Res> get key;$MetaReferenceCopyWith<$Res> get value;

}
/// @nodoc
class _$MapRefCopyWithImpl<$Res>
    implements $MapRefCopyWith<$Res> {
  _$MapRefCopyWithImpl(this._self, this._then);

  final MapRef _self;
  final $Res Function(MapRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? key = null,Object? value = null,}) {
  return _then(MapRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as MetaReference,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as MetaReference,
  ));
}

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get key {
  
  return $MetaReferenceCopyWith<$Res>(_self.key, (value) {
    return _then(_self.copyWith(key: value));
  });
}/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get value {
  
  return $MetaReferenceCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class LiteralRef implements MetaReference {
  const LiteralRef({required this.kind, required this.value});
  factory LiteralRef.fromJson(Map<String, dynamic> json) => _$LiteralRefFromJson(json);

@override final  TypeKind kind;
 final  MetaLiteral value;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiteralRefCopyWith<LiteralRef> get copyWith => _$LiteralRefCopyWithImpl<LiteralRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiteralRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiteralRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,value);

@override
String toString() {
  return 'MetaReference.literal(kind: $kind, value: $value)';
}


}

/// @nodoc
abstract mixin class $LiteralRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $LiteralRefCopyWith(LiteralRef value, $Res Function(LiteralRef) _then) = _$LiteralRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, MetaLiteral value
});


$MetaLiteralCopyWith<$Res> get value;

}
/// @nodoc
class _$LiteralRefCopyWithImpl<$Res>
    implements $LiteralRefCopyWith<$Res> {
  _$LiteralRefCopyWithImpl(this._self, this._then);

  final LiteralRef _self;
  final $Res Function(LiteralRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? value = null,}) {
  return _then(LiteralRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as MetaLiteral,
  ));
}

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaLiteralCopyWith<$Res> get value {
  
  return $MetaLiteralCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class StringLiteralRef implements MetaReference {
  const StringLiteralRef({required this.kind, required this.value});
  factory StringLiteralRef.fromJson(Map<String, dynamic> json) => _$StringLiteralRefFromJson(json);

@override final  TypeKind kind;
 final  String value;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StringLiteralRefCopyWith<StringLiteralRef> get copyWith => _$StringLiteralRefCopyWithImpl<StringLiteralRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StringLiteralRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StringLiteralRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,value);

@override
String toString() {
  return 'MetaReference.stringLiteral(kind: $kind, value: $value)';
}


}

/// @nodoc
abstract mixin class $StringLiteralRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $StringLiteralRefCopyWith(StringLiteralRef value, $Res Function(StringLiteralRef) _then) = _$StringLiteralRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, String value
});




}
/// @nodoc
class _$StringLiteralRefCopyWithImpl<$Res>
    implements $StringLiteralRefCopyWith<$Res> {
  _$StringLiteralRefCopyWithImpl(this._self, this._then);

  final StringLiteralRef _self;
  final $Res Function(StringLiteralRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? value = null,}) {
  return _then(StringLiteralRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TupleRef implements MetaReference {
  const TupleRef({required this.kind, required final  List<MetaReference> items}): _items = items;
  factory TupleRef.fromJson(Map<String, dynamic> json) => _$TupleRefFromJson(json);

@override final  TypeKind kind;
 final  List<MetaReference> _items;
 List<MetaReference> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TupleRefCopyWith<TupleRef> get copyWith => _$TupleRefCopyWithImpl<TupleRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TupleRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TupleRef&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MetaReference.tuple(kind: $kind, items: $items)';
}


}

/// @nodoc
abstract mixin class $TupleRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $TupleRefCopyWith(TupleRef value, $Res Function(TupleRef) _then) = _$TupleRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, List<MetaReference> items
});




}
/// @nodoc
class _$TupleRefCopyWithImpl<$Res>
    implements $TupleRefCopyWith<$Res> {
  _$TupleRefCopyWithImpl(this._self, this._then);

  final TupleRef _self;
  final $Res Function(TupleRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? items = null,}) {
  return _then(TupleRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,
  ));
}


}


/// @nodoc
mixin _$MetaLiteral {

 List<MetaProperty> get properties;
/// Create a copy of MetaLiteral
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaLiteralCopyWith<MetaLiteral> get copyWith => _$MetaLiteralCopyWithImpl<MetaLiteral>(this as MetaLiteral, _$identity);

  /// Serializes this MetaLiteral to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaLiteral&&const DeepCollectionEquality().equals(other.properties, properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(properties));

@override
String toString() {
  return 'MetaLiteral(properties: $properties)';
}


}

/// @nodoc
abstract mixin class $MetaLiteralCopyWith<$Res>  {
  factory $MetaLiteralCopyWith(MetaLiteral value, $Res Function(MetaLiteral) _then) = _$MetaLiteralCopyWithImpl;
@useResult
$Res call({
 List<MetaProperty> properties
});




}
/// @nodoc
class _$MetaLiteralCopyWithImpl<$Res>
    implements $MetaLiteralCopyWith<$Res> {
  _$MetaLiteralCopyWithImpl(this._self, this._then);

  final MetaLiteral _self;
  final $Res Function(MetaLiteral) _then;

/// Create a copy of MetaLiteral
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? properties = null,}) {
  return _then(_self.copyWith(
properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as List<MetaProperty>,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaLiteral].
extension MetaLiteralPatterns on MetaLiteral {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaLiteral value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaLiteral() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaLiteral value)  $default,){
final _that = this;
switch (_that) {
case _MetaLiteral():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaLiteral value)?  $default,){
final _that = this;
switch (_that) {
case _MetaLiteral() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MetaProperty> properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaLiteral() when $default != null:
return $default(_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MetaProperty> properties)  $default,) {final _that = this;
switch (_that) {
case _MetaLiteral():
return $default(_that.properties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MetaProperty> properties)?  $default,) {final _that = this;
switch (_that) {
case _MetaLiteral() when $default != null:
return $default(_that.properties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaLiteral implements MetaLiteral {
  const _MetaLiteral({required final  List<MetaProperty> properties}): _properties = properties;
  factory _MetaLiteral.fromJson(Map<String, dynamic> json) => _$MetaLiteralFromJson(json);

 final  List<MetaProperty> _properties;
@override List<MetaProperty> get properties {
  if (_properties is EqualUnmodifiableListView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_properties);
}


/// Create a copy of MetaLiteral
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaLiteralCopyWith<_MetaLiteral> get copyWith => __$MetaLiteralCopyWithImpl<_MetaLiteral>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaLiteralToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaLiteral&&const DeepCollectionEquality().equals(other._properties, _properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_properties));

@override
String toString() {
  return 'MetaLiteral(properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$MetaLiteralCopyWith<$Res> implements $MetaLiteralCopyWith<$Res> {
  factory _$MetaLiteralCopyWith(_MetaLiteral value, $Res Function(_MetaLiteral) _then) = __$MetaLiteralCopyWithImpl;
@override @useResult
$Res call({
 List<MetaProperty> properties
});




}
/// @nodoc
class __$MetaLiteralCopyWithImpl<$Res>
    implements _$MetaLiteralCopyWith<$Res> {
  __$MetaLiteralCopyWithImpl(this._self, this._then);

  final _MetaLiteral _self;
  final $Res Function(_MetaLiteral) _then;

/// Create a copy of MetaLiteral
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? properties = null,}) {
  return _then(_MetaLiteral(
properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as List<MetaProperty>,
  ));
}


}


/// @nodoc
mixin _$MetaNotification {

 String get method; MessageDirection get messageDirection; MetaReference? get params; String? get documentation; MetaReference? get registrationOptions; String? get since; String? get registrationMethod;
/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaNotificationCopyWith<MetaNotification> get copyWith => _$MetaNotificationCopyWithImpl<MetaNotification>(this as MetaNotification, _$identity);

  /// Serializes this MetaNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaNotification&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,documentation,registrationOptions,since,registrationMethod);

@override
String toString() {
  return 'MetaNotification(method: $method, messageDirection: $messageDirection, params: $params, documentation: $documentation, registrationOptions: $registrationOptions, since: $since, registrationMethod: $registrationMethod)';
}


}

/// @nodoc
abstract mixin class $MetaNotificationCopyWith<$Res>  {
  factory $MetaNotificationCopyWith(MetaNotification value, $Res Function(MetaNotification) _then) = _$MetaNotificationCopyWithImpl;
@useResult
$Res call({
 String method, MessageDirection messageDirection, MetaReference? params, String? documentation, MetaReference? registrationOptions, String? since, String? registrationMethod
});


$MetaReferenceCopyWith<$Res>? get params;$MetaReferenceCopyWith<$Res>? get registrationOptions;

}
/// @nodoc
class _$MetaNotificationCopyWithImpl<$Res>
    implements $MetaNotificationCopyWith<$Res> {
  _$MetaNotificationCopyWithImpl(this._self, this._then);

  final MetaNotification _self;
  final $Res Function(MetaNotification) _then;

/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? documentation = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? registrationMethod = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as MetaReference?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as MetaReference?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaNotification].
extension MetaNotificationPatterns on MetaNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaNotification value)  $default,){
final _that = this;
switch (_that) {
case _MetaNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaNotification value)?  $default,){
final _that = this;
switch (_that) {
case _MetaNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  MetaReference? params,  String? documentation,  MetaReference? registrationOptions,  String? since,  String? registrationMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaNotification() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  MessageDirection messageDirection,  MetaReference? params,  String? documentation,  MetaReference? registrationOptions,  String? since,  String? registrationMethod)  $default,) {final _that = this;
switch (_that) {
case _MetaNotification():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  MessageDirection messageDirection,  MetaReference? params,  String? documentation,  MetaReference? registrationOptions,  String? since,  String? registrationMethod)?  $default,) {final _that = this;
switch (_that) {
case _MetaNotification() when $default != null:
return $default(_that.method,_that.messageDirection,_that.params,_that.documentation,_that.registrationOptions,_that.since,_that.registrationMethod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaNotification implements MetaNotification {
  const _MetaNotification({required this.method, required this.messageDirection, this.params, this.documentation, this.registrationOptions, this.since, this.registrationMethod});
  factory _MetaNotification.fromJson(Map<String, dynamic> json) => _$MetaNotificationFromJson(json);

@override final  String method;
@override final  MessageDirection messageDirection;
@override final  MetaReference? params;
@override final  String? documentation;
@override final  MetaReference? registrationOptions;
@override final  String? since;
@override final  String? registrationMethod;

/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaNotificationCopyWith<_MetaNotification> get copyWith => __$MetaNotificationCopyWithImpl<_MetaNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaNotification&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&(identical(other.params, params) || other.params == params)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,params,documentation,registrationOptions,since,registrationMethod);

@override
String toString() {
  return 'MetaNotification(method: $method, messageDirection: $messageDirection, params: $params, documentation: $documentation, registrationOptions: $registrationOptions, since: $since, registrationMethod: $registrationMethod)';
}


}

/// @nodoc
abstract mixin class _$MetaNotificationCopyWith<$Res> implements $MetaNotificationCopyWith<$Res> {
  factory _$MetaNotificationCopyWith(_MetaNotification value, $Res Function(_MetaNotification) _then) = __$MetaNotificationCopyWithImpl;
@override @useResult
$Res call({
 String method, MessageDirection messageDirection, MetaReference? params, String? documentation, MetaReference? registrationOptions, String? since, String? registrationMethod
});


@override $MetaReferenceCopyWith<$Res>? get params;@override $MetaReferenceCopyWith<$Res>? get registrationOptions;

}
/// @nodoc
class __$MetaNotificationCopyWithImpl<$Res>
    implements _$MetaNotificationCopyWith<$Res> {
  __$MetaNotificationCopyWithImpl(this._self, this._then);

  final _MetaNotification _self;
  final $Res Function(_MetaNotification) _then;

/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? messageDirection = null,Object? params = freezed,Object? documentation = freezed,Object? registrationOptions = freezed,Object? since = freezed,Object? registrationMethod = freezed,}) {
  return _then(_MetaNotification(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,messageDirection: null == messageDirection ? _self.messageDirection : messageDirection // ignore: cast_nullable_to_non_nullable
as MessageDirection,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as MetaReference?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as MetaReference?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res>? get registrationOptions {
    if (_self.registrationOptions == null) {
    return null;
  }

  return $MetaReferenceCopyWith<$Res>(_self.registrationOptions!, (value) {
    return _then(_self.copyWith(registrationOptions: value));
  });
}
}


/// @nodoc
mixin _$MetaProperty {

 String get name; MetaReference get type; String? get documentation; String? get since; String? get deprecated; bool get optional; bool get proposed;
/// Create a copy of MetaProperty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaPropertyCopyWith<MetaProperty> get copyWith => _$MetaPropertyCopyWithImpl<MetaProperty>(this as MetaProperty, _$identity);

  /// Serializes this MetaProperty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaProperty&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.optional, optional) || other.optional == optional)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,documentation,since,deprecated,optional,proposed);

@override
String toString() {
  return 'MetaProperty(name: $name, type: $type, documentation: $documentation, since: $since, deprecated: $deprecated, optional: $optional, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class $MetaPropertyCopyWith<$Res>  {
  factory $MetaPropertyCopyWith(MetaProperty value, $Res Function(MetaProperty) _then) = _$MetaPropertyCopyWithImpl;
@useResult
$Res call({
 String name, MetaReference type, String? documentation, String? since, String? deprecated, bool optional, bool proposed
});


$MetaReferenceCopyWith<$Res> get type;

}
/// @nodoc
class _$MetaPropertyCopyWithImpl<$Res>
    implements $MetaPropertyCopyWith<$Res> {
  _$MetaPropertyCopyWithImpl(this._self, this._then);

  final MetaProperty _self;
  final $Res Function(MetaProperty) _then;

/// Create a copy of MetaProperty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,Object? optional = null,Object? proposed = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetaReference,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MetaProperty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get type {
  
  return $MetaReferenceCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaProperty].
extension MetaPropertyPatterns on MetaProperty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaProperty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaProperty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaProperty value)  $default,){
final _that = this;
switch (_that) {
case _MetaProperty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaProperty value)?  $default,){
final _that = this;
switch (_that) {
case _MetaProperty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  MetaReference type,  String? documentation,  String? since,  String? deprecated,  bool optional,  bool proposed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaProperty() when $default != null:
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.optional,_that.proposed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  MetaReference type,  String? documentation,  String? since,  String? deprecated,  bool optional,  bool proposed)  $default,) {final _that = this;
switch (_that) {
case _MetaProperty():
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.optional,_that.proposed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  MetaReference type,  String? documentation,  String? since,  String? deprecated,  bool optional,  bool proposed)?  $default,) {final _that = this;
switch (_that) {
case _MetaProperty() when $default != null:
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.optional,_that.proposed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaProperty implements MetaProperty {
  const _MetaProperty({required this.name, required this.type, this.documentation, this.since, this.deprecated, this.optional = false, this.proposed = false});
  factory _MetaProperty.fromJson(Map<String, dynamic> json) => _$MetaPropertyFromJson(json);

@override final  String name;
@override final  MetaReference type;
@override final  String? documentation;
@override final  String? since;
@override final  String? deprecated;
@override@JsonKey() final  bool optional;
@override@JsonKey() final  bool proposed;

/// Create a copy of MetaProperty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaPropertyCopyWith<_MetaProperty> get copyWith => __$MetaPropertyCopyWithImpl<_MetaProperty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaPropertyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaProperty&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.optional, optional) || other.optional == optional)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,documentation,since,deprecated,optional,proposed);

@override
String toString() {
  return 'MetaProperty(name: $name, type: $type, documentation: $documentation, since: $since, deprecated: $deprecated, optional: $optional, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class _$MetaPropertyCopyWith<$Res> implements $MetaPropertyCopyWith<$Res> {
  factory _$MetaPropertyCopyWith(_MetaProperty value, $Res Function(_MetaProperty) _then) = __$MetaPropertyCopyWithImpl;
@override @useResult
$Res call({
 String name, MetaReference type, String? documentation, String? since, String? deprecated, bool optional, bool proposed
});


@override $MetaReferenceCopyWith<$Res> get type;

}
/// @nodoc
class __$MetaPropertyCopyWithImpl<$Res>
    implements _$MetaPropertyCopyWith<$Res> {
  __$MetaPropertyCopyWithImpl(this._self, this._then);

  final _MetaProperty _self;
  final $Res Function(_MetaProperty) _then;

/// Create a copy of MetaProperty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,Object? optional = null,Object? proposed = null,}) {
  return _then(_MetaProperty(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetaReference,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MetaProperty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get type {
  
  return $MetaReferenceCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$MetaStructure {

 String get name; List<MetaProperty> get properties; String? get documentation; String? get since; bool get proposed;@JsonKey(name: 'mixins') List<MetaReference> get mixins$;@JsonKey(name: 'extends') List<MetaReference> get extends$;
/// Create a copy of MetaStructure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaStructureCopyWith<MetaStructure> get copyWith => _$MetaStructureCopyWithImpl<MetaStructure>(this as MetaStructure, _$identity);

  /// Serializes this MetaStructure to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaStructure&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.properties, properties)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&const DeepCollectionEquality().equals(other.mixins$, mixins$)&&const DeepCollectionEquality().equals(other.extends$, extends$));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(properties),documentation,since,proposed,const DeepCollectionEquality().hash(mixins$),const DeepCollectionEquality().hash(extends$));

@override
String toString() {
  return 'MetaStructure(name: $name, properties: $properties, documentation: $documentation, since: $since, proposed: $proposed, mixins\$: ${mixins$}, extends\$: ${extends$})';
}


}

/// @nodoc
abstract mixin class $MetaStructureCopyWith<$Res>  {
  factory $MetaStructureCopyWith(MetaStructure value, $Res Function(MetaStructure) _then) = _$MetaStructureCopyWithImpl;
@useResult
$Res call({
 String name, List<MetaProperty> properties, String? documentation, String? since, bool proposed,@JsonKey(name: 'mixins') List<MetaReference> mixins$,@JsonKey(name: 'extends') List<MetaReference> extends$
});




}
/// @nodoc
class _$MetaStructureCopyWithImpl<$Res>
    implements $MetaStructureCopyWith<$Res> {
  _$MetaStructureCopyWithImpl(this._self, this._then);

  final MetaStructure _self;
  final $Res Function(MetaStructure) _then;

/// Create a copy of MetaStructure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? properties = null,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,Object? mixins$ = null,Object? extends$ = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as List<MetaProperty>,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,mixins$: null == mixins$ ? _self.mixins$ : mixins$ // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,extends$: null == extends$ ? _self.extends$ : extends$ // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaStructure].
extension MetaStructurePatterns on MetaStructure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaStructure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaStructure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaStructure value)  $default,){
final _that = this;
switch (_that) {
case _MetaStructure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaStructure value)?  $default,){
final _that = this;
switch (_that) {
case _MetaStructure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<MetaProperty> properties,  String? documentation,  String? since,  bool proposed, @JsonKey(name: 'mixins')  List<MetaReference> mixins$, @JsonKey(name: 'extends')  List<MetaReference> extends$)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaStructure() when $default != null:
return $default(_that.name,_that.properties,_that.documentation,_that.since,_that.proposed,_that.mixins$,_that.extends$);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<MetaProperty> properties,  String? documentation,  String? since,  bool proposed, @JsonKey(name: 'mixins')  List<MetaReference> mixins$, @JsonKey(name: 'extends')  List<MetaReference> extends$)  $default,) {final _that = this;
switch (_that) {
case _MetaStructure():
return $default(_that.name,_that.properties,_that.documentation,_that.since,_that.proposed,_that.mixins$,_that.extends$);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<MetaProperty> properties,  String? documentation,  String? since,  bool proposed, @JsonKey(name: 'mixins')  List<MetaReference> mixins$, @JsonKey(name: 'extends')  List<MetaReference> extends$)?  $default,) {final _that = this;
switch (_that) {
case _MetaStructure() when $default != null:
return $default(_that.name,_that.properties,_that.documentation,_that.since,_that.proposed,_that.mixins$,_that.extends$);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaStructure implements MetaStructure {
  const _MetaStructure({required this.name, required final  List<MetaProperty> properties, this.documentation, this.since, this.proposed = false, @JsonKey(name: 'mixins') final  List<MetaReference> mixins$ = const [], @JsonKey(name: 'extends') final  List<MetaReference> extends$ = const []}): _properties = properties,_mixins$ = mixins$,_extends$ = extends$;
  factory _MetaStructure.fromJson(Map<String, dynamic> json) => _$MetaStructureFromJson(json);

@override final  String name;
 final  List<MetaProperty> _properties;
@override List<MetaProperty> get properties {
  if (_properties is EqualUnmodifiableListView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_properties);
}

@override final  String? documentation;
@override final  String? since;
@override@JsonKey() final  bool proposed;
 final  List<MetaReference> _mixins$;
@override@JsonKey(name: 'mixins') List<MetaReference> get mixins$ {
  if (_mixins$ is EqualUnmodifiableListView) return _mixins$;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mixins$);
}

 final  List<MetaReference> _extends$;
@override@JsonKey(name: 'extends') List<MetaReference> get extends$ {
  if (_extends$ is EqualUnmodifiableListView) return _extends$;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extends$);
}


/// Create a copy of MetaStructure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaStructureCopyWith<_MetaStructure> get copyWith => __$MetaStructureCopyWithImpl<_MetaStructure>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaStructureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaStructure&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._properties, _properties)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&const DeepCollectionEquality().equals(other._mixins$, _mixins$)&&const DeepCollectionEquality().equals(other._extends$, _extends$));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_properties),documentation,since,proposed,const DeepCollectionEquality().hash(_mixins$),const DeepCollectionEquality().hash(_extends$));

@override
String toString() {
  return 'MetaStructure(name: $name, properties: $properties, documentation: $documentation, since: $since, proposed: $proposed, mixins\$: ${mixins$}, extends\$: ${extends$})';
}


}

/// @nodoc
abstract mixin class _$MetaStructureCopyWith<$Res> implements $MetaStructureCopyWith<$Res> {
  factory _$MetaStructureCopyWith(_MetaStructure value, $Res Function(_MetaStructure) _then) = __$MetaStructureCopyWithImpl;
@override @useResult
$Res call({
 String name, List<MetaProperty> properties, String? documentation, String? since, bool proposed,@JsonKey(name: 'mixins') List<MetaReference> mixins$,@JsonKey(name: 'extends') List<MetaReference> extends$
});




}
/// @nodoc
class __$MetaStructureCopyWithImpl<$Res>
    implements _$MetaStructureCopyWith<$Res> {
  __$MetaStructureCopyWithImpl(this._self, this._then);

  final _MetaStructure _self;
  final $Res Function(_MetaStructure) _then;

/// Create a copy of MetaStructure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? properties = null,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,Object? mixins$ = null,Object? extends$ = null,}) {
  return _then(_MetaStructure(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as List<MetaProperty>,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,mixins$: null == mixins$ ? _self._mixins$ : mixins$ // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,extends$: null == extends$ ? _self._extends$ : extends$ // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,
  ));
}


}


/// @nodoc
mixin _$MetaEnumMember {

 String get name;@IntOrStringSealedConverter() EnumRawValue get value; String? get documentation; String? get since; String? get deprecated;
/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaEnumMemberCopyWith<MetaEnumMember> get copyWith => _$MetaEnumMemberCopyWithImpl<MetaEnumMember>(this as MetaEnumMember, _$identity);

  /// Serializes this MetaEnumMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaEnumMember&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value,documentation,since,deprecated);

@override
String toString() {
  return 'MetaEnumMember(name: $name, value: $value, documentation: $documentation, since: $since, deprecated: $deprecated)';
}


}

/// @nodoc
abstract mixin class $MetaEnumMemberCopyWith<$Res>  {
  factory $MetaEnumMemberCopyWith(MetaEnumMember value, $Res Function(MetaEnumMember) _then) = _$MetaEnumMemberCopyWithImpl;
@useResult
$Res call({
 String name,@IntOrStringSealedConverter() EnumRawValue value, String? documentation, String? since, String? deprecated
});


$EnumRawValueCopyWith<$Res> get value;

}
/// @nodoc
class _$MetaEnumMemberCopyWithImpl<$Res>
    implements $MetaEnumMemberCopyWith<$Res> {
  _$MetaEnumMemberCopyWithImpl(this._self, this._then);

  final MetaEnumMember _self;
  final $Res Function(MetaEnumMember) _then;

/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? value = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as EnumRawValue,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EnumRawValueCopyWith<$Res> get value {
  
  return $EnumRawValueCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaEnumMember].
extension MetaEnumMemberPatterns on MetaEnumMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaEnumMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaEnumMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaEnumMember value)  $default,){
final _that = this;
switch (_that) {
case _MetaEnumMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaEnumMember value)?  $default,){
final _that = this;
switch (_that) {
case _MetaEnumMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @IntOrStringSealedConverter()  EnumRawValue value,  String? documentation,  String? since,  String? deprecated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaEnumMember() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @IntOrStringSealedConverter()  EnumRawValue value,  String? documentation,  String? since,  String? deprecated)  $default,) {final _that = this;
switch (_that) {
case _MetaEnumMember():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @IntOrStringSealedConverter()  EnumRawValue value,  String? documentation,  String? since,  String? deprecated)?  $default,) {final _that = this;
switch (_that) {
case _MetaEnumMember() when $default != null:
return $default(_that.name,_that.value,_that.documentation,_that.since,_that.deprecated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaEnumMember implements MetaEnumMember {
  const _MetaEnumMember({required this.name, @IntOrStringSealedConverter() required this.value, this.documentation, this.since, this.deprecated});
  factory _MetaEnumMember.fromJson(Map<String, dynamic> json) => _$MetaEnumMemberFromJson(json);

@override final  String name;
@override@IntOrStringSealedConverter() final  EnumRawValue value;
@override final  String? documentation;
@override final  String? since;
@override final  String? deprecated;

/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaEnumMemberCopyWith<_MetaEnumMember> get copyWith => __$MetaEnumMemberCopyWithImpl<_MetaEnumMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaEnumMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaEnumMember&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value,documentation,since,deprecated);

@override
String toString() {
  return 'MetaEnumMember(name: $name, value: $value, documentation: $documentation, since: $since, deprecated: $deprecated)';
}


}

/// @nodoc
abstract mixin class _$MetaEnumMemberCopyWith<$Res> implements $MetaEnumMemberCopyWith<$Res> {
  factory _$MetaEnumMemberCopyWith(_MetaEnumMember value, $Res Function(_MetaEnumMember) _then) = __$MetaEnumMemberCopyWithImpl;
@override @useResult
$Res call({
 String name,@IntOrStringSealedConverter() EnumRawValue value, String? documentation, String? since, String? deprecated
});


@override $EnumRawValueCopyWith<$Res> get value;

}
/// @nodoc
class __$MetaEnumMemberCopyWithImpl<$Res>
    implements _$MetaEnumMemberCopyWith<$Res> {
  __$MetaEnumMemberCopyWithImpl(this._self, this._then);

  final _MetaEnumMember _self;
  final $Res Function(_MetaEnumMember) _then;

/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? value = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,}) {
  return _then(_MetaEnumMember(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as EnumRawValue,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EnumRawValueCopyWith<$Res> get value {
  
  return $EnumRawValueCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

EnumRawValue _$EnumRawValueFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'integer':
          return EnumRawValueInteger.fromJson(
            json
          );
                case 'string':
          return EnumRawValueString.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'EnumRawValue',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$EnumRawValue {

 String get raw;
/// Create a copy of EnumRawValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnumRawValueCopyWith<EnumRawValue> get copyWith => _$EnumRawValueCopyWithImpl<EnumRawValue>(this as EnumRawValue, _$identity);

  /// Serializes this EnumRawValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnumRawValue&&(identical(other.raw, raw) || other.raw == raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raw);

@override
String toString() {
  return 'EnumRawValue(raw: $raw)';
}


}

/// @nodoc
abstract mixin class $EnumRawValueCopyWith<$Res>  {
  factory $EnumRawValueCopyWith(EnumRawValue value, $Res Function(EnumRawValue) _then) = _$EnumRawValueCopyWithImpl;
@useResult
$Res call({
 String raw
});




}
/// @nodoc
class _$EnumRawValueCopyWithImpl<$Res>
    implements $EnumRawValueCopyWith<$Res> {
  _$EnumRawValueCopyWithImpl(this._self, this._then);

  final EnumRawValue _self;
  final $Res Function(EnumRawValue) _then;

/// Create a copy of EnumRawValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? raw = null,}) {
  return _then(_self.copyWith(
raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EnumRawValue].
extension EnumRawValuePatterns on EnumRawValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EnumRawValueInteger value)?  integer,TResult Function( EnumRawValueString value)?  string,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EnumRawValueInteger() when integer != null:
return integer(_that);case EnumRawValueString() when string != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EnumRawValueInteger value)  integer,required TResult Function( EnumRawValueString value)  string,}){
final _that = this;
switch (_that) {
case EnumRawValueInteger():
return integer(_that);case EnumRawValueString():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EnumRawValueInteger value)?  integer,TResult? Function( EnumRawValueString value)?  string,}){
final _that = this;
switch (_that) {
case EnumRawValueInteger() when integer != null:
return integer(_that);case EnumRawValueString() when string != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String raw)?  integer,TResult Function( String raw)?  string,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EnumRawValueInteger() when integer != null:
return integer(_that.raw);case EnumRawValueString() when string != null:
return string(_that.raw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String raw)  integer,required TResult Function( String raw)  string,}) {final _that = this;
switch (_that) {
case EnumRawValueInteger():
return integer(_that.raw);case EnumRawValueString():
return string(_that.raw);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String raw)?  integer,TResult? Function( String raw)?  string,}) {final _that = this;
switch (_that) {
case EnumRawValueInteger() when integer != null:
return integer(_that.raw);case EnumRawValueString() when string != null:
return string(_that.raw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class EnumRawValueInteger implements EnumRawValue {
  const EnumRawValueInteger({required this.raw, final  String? $type}): $type = $type ?? 'integer';
  factory EnumRawValueInteger.fromJson(Map<String, dynamic> json) => _$EnumRawValueIntegerFromJson(json);

@override final  String raw;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of EnumRawValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnumRawValueIntegerCopyWith<EnumRawValueInteger> get copyWith => _$EnumRawValueIntegerCopyWithImpl<EnumRawValueInteger>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnumRawValueIntegerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnumRawValueInteger&&(identical(other.raw, raw) || other.raw == raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raw);

@override
String toString() {
  return 'EnumRawValue.integer(raw: $raw)';
}


}

/// @nodoc
abstract mixin class $EnumRawValueIntegerCopyWith<$Res> implements $EnumRawValueCopyWith<$Res> {
  factory $EnumRawValueIntegerCopyWith(EnumRawValueInteger value, $Res Function(EnumRawValueInteger) _then) = _$EnumRawValueIntegerCopyWithImpl;
@override @useResult
$Res call({
 String raw
});




}
/// @nodoc
class _$EnumRawValueIntegerCopyWithImpl<$Res>
    implements $EnumRawValueIntegerCopyWith<$Res> {
  _$EnumRawValueIntegerCopyWithImpl(this._self, this._then);

  final EnumRawValueInteger _self;
  final $Res Function(EnumRawValueInteger) _then;

/// Create a copy of EnumRawValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? raw = null,}) {
  return _then(EnumRawValueInteger(
raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class EnumRawValueString implements EnumRawValue {
  const EnumRawValueString({required this.raw, final  String? $type}): $type = $type ?? 'string';
  factory EnumRawValueString.fromJson(Map<String, dynamic> json) => _$EnumRawValueStringFromJson(json);

@override final  String raw;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of EnumRawValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnumRawValueStringCopyWith<EnumRawValueString> get copyWith => _$EnumRawValueStringCopyWithImpl<EnumRawValueString>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnumRawValueStringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnumRawValueString&&(identical(other.raw, raw) || other.raw == raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raw);

@override
String toString() {
  return 'EnumRawValue.string(raw: $raw)';
}


}

/// @nodoc
abstract mixin class $EnumRawValueStringCopyWith<$Res> implements $EnumRawValueCopyWith<$Res> {
  factory $EnumRawValueStringCopyWith(EnumRawValueString value, $Res Function(EnumRawValueString) _then) = _$EnumRawValueStringCopyWithImpl;
@override @useResult
$Res call({
 String raw
});




}
/// @nodoc
class _$EnumRawValueStringCopyWithImpl<$Res>
    implements $EnumRawValueStringCopyWith<$Res> {
  _$EnumRawValueStringCopyWithImpl(this._self, this._then);

  final EnumRawValueString _self;
  final $Res Function(EnumRawValueString) _then;

/// Create a copy of EnumRawValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? raw = null,}) {
  return _then(EnumRawValueString(
raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MetaEnumeration {

 String get name; MetaReference get type; List<MetaEnumMember> get values; bool? get supportsCustomValues; String? get documentation; String? get since; bool get proposed;
/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaEnumerationCopyWith<MetaEnumeration> get copyWith => _$MetaEnumerationCopyWithImpl<MetaEnumeration>(this as MetaEnumeration, _$identity);

  /// Serializes this MetaEnumeration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaEnumeration&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.supportsCustomValues, supportsCustomValues) || other.supportsCustomValues == supportsCustomValues)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,const DeepCollectionEquality().hash(values),supportsCustomValues,documentation,since,proposed);

@override
String toString() {
  return 'MetaEnumeration(name: $name, type: $type, values: $values, supportsCustomValues: $supportsCustomValues, documentation: $documentation, since: $since, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class $MetaEnumerationCopyWith<$Res>  {
  factory $MetaEnumerationCopyWith(MetaEnumeration value, $Res Function(MetaEnumeration) _then) = _$MetaEnumerationCopyWithImpl;
@useResult
$Res call({
 String name, MetaReference type, List<MetaEnumMember> values, bool? supportsCustomValues, String? documentation, String? since, bool proposed
});


$MetaReferenceCopyWith<$Res> get type;

}
/// @nodoc
class _$MetaEnumerationCopyWithImpl<$Res>
    implements $MetaEnumerationCopyWith<$Res> {
  _$MetaEnumerationCopyWithImpl(this._self, this._then);

  final MetaEnumeration _self;
  final $Res Function(MetaEnumeration) _then;

/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? values = null,Object? supportsCustomValues = freezed,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetaReference,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<MetaEnumMember>,supportsCustomValues: freezed == supportsCustomValues ? _self.supportsCustomValues : supportsCustomValues // ignore: cast_nullable_to_non_nullable
as bool?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get type {
  
  return $MetaReferenceCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaEnumeration].
extension MetaEnumerationPatterns on MetaEnumeration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaEnumeration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaEnumeration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaEnumeration value)  $default,){
final _that = this;
switch (_that) {
case _MetaEnumeration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaEnumeration value)?  $default,){
final _that = this;
switch (_that) {
case _MetaEnumeration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  MetaReference type,  List<MetaEnumMember> values,  bool? supportsCustomValues,  String? documentation,  String? since,  bool proposed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaEnumeration() when $default != null:
return $default(_that.name,_that.type,_that.values,_that.supportsCustomValues,_that.documentation,_that.since,_that.proposed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  MetaReference type,  List<MetaEnumMember> values,  bool? supportsCustomValues,  String? documentation,  String? since,  bool proposed)  $default,) {final _that = this;
switch (_that) {
case _MetaEnumeration():
return $default(_that.name,_that.type,_that.values,_that.supportsCustomValues,_that.documentation,_that.since,_that.proposed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  MetaReference type,  List<MetaEnumMember> values,  bool? supportsCustomValues,  String? documentation,  String? since,  bool proposed)?  $default,) {final _that = this;
switch (_that) {
case _MetaEnumeration() when $default != null:
return $default(_that.name,_that.type,_that.values,_that.supportsCustomValues,_that.documentation,_that.since,_that.proposed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaEnumeration implements MetaEnumeration {
  const _MetaEnumeration({required this.name, required this.type, required final  List<MetaEnumMember> values, this.supportsCustomValues, this.documentation, this.since, this.proposed = false}): _values = values;
  factory _MetaEnumeration.fromJson(Map<String, dynamic> json) => _$MetaEnumerationFromJson(json);

@override final  String name;
@override final  MetaReference type;
 final  List<MetaEnumMember> _values;
@override List<MetaEnumMember> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}

@override final  bool? supportsCustomValues;
@override final  String? documentation;
@override final  String? since;
@override@JsonKey() final  bool proposed;

/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaEnumerationCopyWith<_MetaEnumeration> get copyWith => __$MetaEnumerationCopyWithImpl<_MetaEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaEnumeration&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.supportsCustomValues, supportsCustomValues) || other.supportsCustomValues == supportsCustomValues)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,const DeepCollectionEquality().hash(_values),supportsCustomValues,documentation,since,proposed);

@override
String toString() {
  return 'MetaEnumeration(name: $name, type: $type, values: $values, supportsCustomValues: $supportsCustomValues, documentation: $documentation, since: $since, proposed: $proposed)';
}


}

/// @nodoc
abstract mixin class _$MetaEnumerationCopyWith<$Res> implements $MetaEnumerationCopyWith<$Res> {
  factory _$MetaEnumerationCopyWith(_MetaEnumeration value, $Res Function(_MetaEnumeration) _then) = __$MetaEnumerationCopyWithImpl;
@override @useResult
$Res call({
 String name, MetaReference type, List<MetaEnumMember> values, bool? supportsCustomValues, String? documentation, String? since, bool proposed
});


@override $MetaReferenceCopyWith<$Res> get type;

}
/// @nodoc
class __$MetaEnumerationCopyWithImpl<$Res>
    implements _$MetaEnumerationCopyWith<$Res> {
  __$MetaEnumerationCopyWithImpl(this._self, this._then);

  final _MetaEnumeration _self;
  final $Res Function(_MetaEnumeration) _then;

/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? values = null,Object? supportsCustomValues = freezed,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_MetaEnumeration(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetaReference,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<MetaEnumMember>,supportsCustomValues: freezed == supportsCustomValues ? _self.supportsCustomValues : supportsCustomValues // ignore: cast_nullable_to_non_nullable
as bool?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get type {
  
  return $MetaReferenceCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$MetaTypeAlias {

 String get name; MetaReference get type; String? get documentation; String? get since; String? get deprecated; bool get proposed; bool get optional;
/// Create a copy of MetaTypeAlias
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaTypeAliasCopyWith<MetaTypeAlias> get copyWith => _$MetaTypeAliasCopyWithImpl<MetaTypeAlias>(this as MetaTypeAlias, _$identity);

  /// Serializes this MetaTypeAlias to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaTypeAlias&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,documentation,since,deprecated,proposed,optional);

@override
String toString() {
  return 'MetaTypeAlias(name: $name, type: $type, documentation: $documentation, since: $since, deprecated: $deprecated, proposed: $proposed, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $MetaTypeAliasCopyWith<$Res>  {
  factory $MetaTypeAliasCopyWith(MetaTypeAlias value, $Res Function(MetaTypeAlias) _then) = _$MetaTypeAliasCopyWithImpl;
@useResult
$Res call({
 String name, MetaReference type, String? documentation, String? since, String? deprecated, bool proposed, bool optional
});


$MetaReferenceCopyWith<$Res> get type;

}
/// @nodoc
class _$MetaTypeAliasCopyWithImpl<$Res>
    implements $MetaTypeAliasCopyWith<$Res> {
  _$MetaTypeAliasCopyWithImpl(this._self, this._then);

  final MetaTypeAlias _self;
  final $Res Function(MetaTypeAlias) _then;

/// Create a copy of MetaTypeAlias
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,Object? proposed = null,Object? optional = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetaReference,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MetaTypeAlias
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get type {
  
  return $MetaReferenceCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaTypeAlias].
extension MetaTypeAliasPatterns on MetaTypeAlias {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaTypeAlias value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaTypeAlias() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaTypeAlias value)  $default,){
final _that = this;
switch (_that) {
case _MetaTypeAlias():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaTypeAlias value)?  $default,){
final _that = this;
switch (_that) {
case _MetaTypeAlias() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  MetaReference type,  String? documentation,  String? since,  String? deprecated,  bool proposed,  bool optional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaTypeAlias() when $default != null:
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.proposed,_that.optional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  MetaReference type,  String? documentation,  String? since,  String? deprecated,  bool proposed,  bool optional)  $default,) {final _that = this;
switch (_that) {
case _MetaTypeAlias():
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.proposed,_that.optional);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  MetaReference type,  String? documentation,  String? since,  String? deprecated,  bool proposed,  bool optional)?  $default,) {final _that = this;
switch (_that) {
case _MetaTypeAlias() when $default != null:
return $default(_that.name,_that.type,_that.documentation,_that.since,_that.deprecated,_that.proposed,_that.optional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaTypeAlias implements MetaTypeAlias {
  const _MetaTypeAlias({required this.name, required this.type, this.documentation, this.since, this.deprecated, this.proposed = false, this.optional = false});
  factory _MetaTypeAlias.fromJson(Map<String, dynamic> json) => _$MetaTypeAliasFromJson(json);

@override final  String name;
@override final  MetaReference type;
@override final  String? documentation;
@override final  String? since;
@override final  String? deprecated;
@override@JsonKey() final  bool proposed;
@override@JsonKey() final  bool optional;

/// Create a copy of MetaTypeAlias
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaTypeAliasCopyWith<_MetaTypeAlias> get copyWith => __$MetaTypeAliasCopyWithImpl<_MetaTypeAlias>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaTypeAliasToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaTypeAlias&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,documentation,since,deprecated,proposed,optional);

@override
String toString() {
  return 'MetaTypeAlias(name: $name, type: $type, documentation: $documentation, since: $since, deprecated: $deprecated, proposed: $proposed, optional: $optional)';
}


}

/// @nodoc
abstract mixin class _$MetaTypeAliasCopyWith<$Res> implements $MetaTypeAliasCopyWith<$Res> {
  factory _$MetaTypeAliasCopyWith(_MetaTypeAlias value, $Res Function(_MetaTypeAlias) _then) = __$MetaTypeAliasCopyWithImpl;
@override @useResult
$Res call({
 String name, MetaReference type, String? documentation, String? since, String? deprecated, bool proposed, bool optional
});


@override $MetaReferenceCopyWith<$Res> get type;

}
/// @nodoc
class __$MetaTypeAliasCopyWithImpl<$Res>
    implements _$MetaTypeAliasCopyWith<$Res> {
  __$MetaTypeAliasCopyWithImpl(this._self, this._then);

  final _MetaTypeAlias _self;
  final $Res Function(_MetaTypeAlias) _then;

/// Create a copy of MetaTypeAlias
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? documentation = freezed,Object? since = freezed,Object? deprecated = freezed,Object? proposed = null,Object? optional = null,}) {
  return _then(_MetaTypeAlias(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetaReference,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,deprecated: freezed == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MetaTypeAlias
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<$Res> get type {
  
  return $MetaReferenceCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

// dart format on
