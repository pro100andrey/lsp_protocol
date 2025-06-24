// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

@JsonSerializable(disallowUnrecognizedKeys: true) MetaData get metaData; List<MetaRequest> get requests; List<MetaNotification> get notifications; List<MetaStructure> get structures; List<MetaEnumeration> get enumerations; List<MetaTypeAlias> get typeAliases;
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
@JsonSerializable(disallowUnrecognizedKeys: true) MetaData metaData, List<MetaRequest> requests, List<MetaNotification> notifications, List<MetaStructure> structures, List<MetaEnumeration> enumerations, List<MetaTypeAlias> typeAliases
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


/// @nodoc
@JsonSerializable()

class _MetaProtocol implements MetaProtocol {
  const _MetaProtocol({@JsonSerializable(disallowUnrecognizedKeys: true) required this.metaData, required final  List<MetaRequest> requests, required final  List<MetaNotification> notifications, required final  List<MetaStructure> structures, required final  List<MetaEnumeration> enumerations, required final  List<MetaTypeAlias> typeAliases}): _requests = requests,_notifications = notifications,_structures = structures,_enumerations = enumerations,_typeAliases = typeAliases;
  factory _MetaProtocol.fromJson(Map<String, dynamic> json) => _$MetaProtocolFromJson(json);

@override@JsonSerializable(disallowUnrecognizedKeys: true) final  MetaData metaData;
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
@JsonSerializable(disallowUnrecognizedKeys: true) MetaData metaData, List<MetaRequest> requests, List<MetaNotification> notifications, List<MetaStructure> structures, List<MetaEnumeration> enumerations, List<MetaTypeAlias> typeAliases
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

@JsonSerializable(disallowUnrecognizedKeys: true) String get version;
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
@JsonSerializable(disallowUnrecognizedKeys: true) String version
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


/// @nodoc
@JsonSerializable()

class _MetaData implements MetaData {
  const _MetaData({@JsonSerializable(disallowUnrecognizedKeys: true) required this.version});
  factory _MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);

@override@JsonSerializable(disallowUnrecognizedKeys: true) final  String version;

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
@JsonSerializable(disallowUnrecognizedKeys: true) String version
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

 String get method; MessageDirection get messageDirection; TypeRef? get params; MetaReference? get result; String? get documentation; MetaReference? get partialResult; MetaReference? get registrationOptions; String? get since; bool? get proposed; String? get registrationMethod; TypeRef? get errorData;
/// Create a copy of MetaRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaRequestCopyWith<MetaRequest> get copyWith => _$MetaRequestCopyWithImpl<MetaRequest>(this as MetaRequest, _$identity);

  /// Serializes this MetaRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.result, result) || other.result == result)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.partialResult, partialResult) || other.partialResult == partialResult)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod)&&const DeepCollectionEquality().equals(other.errorData, errorData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,const DeepCollectionEquality().hash(params),result,documentation,partialResult,registrationOptions,since,proposed,registrationMethod,const DeepCollectionEquality().hash(errorData));

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
 String method, MessageDirection messageDirection, TypeRef? params, MetaReference? result, String? documentation, MetaReference? partialResult, MetaReference? registrationOptions, String? since, bool? proposed, String? registrationMethod, TypeRef? errorData
});


$MetaReferenceCopyWith<$Res>? get result;$MetaReferenceCopyWith<$Res>? get partialResult;$MetaReferenceCopyWith<$Res>? get registrationOptions;

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
as TypeRef?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as MetaReference?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,partialResult: freezed == partialResult ? _self.partialResult : partialResult // ignore: cast_nullable_to_non_nullable
as MetaReference?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as MetaReference?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: freezed == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,errorData: freezed == errorData ? _self.errorData : errorData // ignore: cast_nullable_to_non_nullable
as TypeRef?,
  ));
}
/// Create a copy of MetaRequest
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
}
}


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class _MetaRequest implements MetaRequest {
  const _MetaRequest({required this.method, required this.messageDirection, this.params, this.result, this.documentation, this.partialResult, this.registrationOptions, this.since, this.proposed, this.registrationMethod, this.errorData});
  factory _MetaRequest.fromJson(Map<String, dynamic> json) => _$MetaRequestFromJson(json);

@override final  String method;
@override final  MessageDirection messageDirection;
@override final  TypeRef? params;
@override final  MetaReference? result;
@override final  String? documentation;
@override final  MetaReference? partialResult;
@override final  MetaReference? registrationOptions;
@override final  String? since;
@override final  bool? proposed;
@override final  String? registrationMethod;
@override final  TypeRef? errorData;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.result, result) || other.result == result)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.partialResult, partialResult) || other.partialResult == partialResult)&&(identical(other.registrationOptions, registrationOptions) || other.registrationOptions == registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod)&&const DeepCollectionEquality().equals(other.errorData, errorData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,const DeepCollectionEquality().hash(params),result,documentation,partialResult,registrationOptions,since,proposed,registrationMethod,const DeepCollectionEquality().hash(errorData));

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
 String method, MessageDirection messageDirection, TypeRef? params, MetaReference? result, String? documentation, MetaReference? partialResult, MetaReference? registrationOptions, String? since, bool? proposed, String? registrationMethod, TypeRef? errorData
});


@override $MetaReferenceCopyWith<$Res>? get result;@override $MetaReferenceCopyWith<$Res>? get partialResult;@override $MetaReferenceCopyWith<$Res>? get registrationOptions;

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
as TypeRef?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as MetaReference?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,partialResult: freezed == partialResult ? _self.partialResult : partialResult // ignore: cast_nullable_to_non_nullable
as MetaReference?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as MetaReference?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: freezed == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,errorData: freezed == errorData ? _self.errorData : errorData // ignore: cast_nullable_to_non_nullable
as TypeRef?,
  ));
}

/// Create a copy of MetaRequest
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

 bool get optional;
/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaReferenceCopyWith<MetaReference> get copyWith => _$MetaReferenceCopyWithImpl<MetaReference>(this as MetaReference, _$identity);

  /// Serializes this MetaReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaReference&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optional);

@override
String toString() {
  return 'MetaReference(optional: $optional)';
}


}

/// @nodoc
abstract mixin class $MetaReferenceCopyWith<$Res>  {
  factory $MetaReferenceCopyWith(MetaReference value, $Res Function(MetaReference) _then) = _$MetaReferenceCopyWithImpl;
@useResult
$Res call({
 bool optional
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
@pragma('vm:prefer-inline') @override $Res call({Object? optional = null,}) {
  return _then(_self.copyWith(
optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class TypeRef implements MetaReference {
  const TypeRef({required this.kind, required this.name, this.optional = false});
  factory TypeRef.fromJson(Map<String, dynamic> json) => _$TypeRefFromJson(json);

 final  TypeKind kind;
 final  String name;
@override@JsonKey() final  bool optional;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,name,optional);

@override
String toString() {
  return 'MetaReference.type(kind: $kind, name: $name, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $TypeRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $TypeRefCopyWith(TypeRef value, $Res Function(TypeRef) _then) = _$TypeRefCopyWithImpl;
@override @useResult
$Res call({
 TypeKind kind, String name, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? name = null,Object? optional = null,}) {
  return _then(TypeRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TypeKind,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class ArrayRef implements MetaReference {
  const ArrayRef({required this.element, this.optional = false, final  String? $type}): $type = $type ?? 'array';
  factory ArrayRef.fromJson(Map<String, dynamic> json) => _$ArrayRefFromJson(json);

 final  MetaReference element;
@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArrayRef&&(identical(other.element, element) || other.element == element)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,element,optional);

@override
String toString() {
  return 'MetaReference.array(element: $element, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $ArrayRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $ArrayRefCopyWith(ArrayRef value, $Res Function(ArrayRef) _then) = _$ArrayRefCopyWithImpl;
@override @useResult
$Res call({
 MetaReference element, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? element = null,Object? optional = null,}) {
  return _then(ArrayRef(
element: null == element ? _self.element : element // ignore: cast_nullable_to_non_nullable
as MetaReference,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
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

@JsonSerializable(disallowUnrecognizedKeys: true)
class BaseRef implements MetaReference {
  const BaseRef({required this.name, this.optional = false, final  String? $type}): $type = $type ?? 'base';
  factory BaseRef.fromJson(Map<String, dynamic> json) => _$BaseRefFromJson(json);

 final  String name;
@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseRef&&(identical(other.name, name) || other.name == name)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,optional);

@override
String toString() {
  return 'MetaReference.base(name: $name, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $BaseRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $BaseRefCopyWith(BaseRef value, $Res Function(BaseRef) _then) = _$BaseRefCopyWithImpl;
@override @useResult
$Res call({
 String name, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? optional = null,}) {
  return _then(BaseRef(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class OrRef implements MetaReference {
  const OrRef({required final  List<MetaReference> items, this.optional = false, final  String? $type}): _items = items,$type = $type ?? 'or';
  factory OrRef.fromJson(Map<String, dynamic> json) => _$OrRefFromJson(json);

 final  List<MetaReference> _items;
 List<MetaReference> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrRef&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),optional);

@override
String toString() {
  return 'MetaReference.or(items: $items, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $OrRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $OrRefCopyWith(OrRef value, $Res Function(OrRef) _then) = _$OrRefCopyWithImpl;
@override @useResult
$Res call({
 List<MetaReference> items, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? optional = null,}) {
  return _then(OrRef(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MetaReference>,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class AndRef implements MetaReference {
  const AndRef({required final  List<TypeRef> items, this.optional = false, final  String? $type}): _items = items,$type = $type ?? 'and';
  factory AndRef.fromJson(Map<String, dynamic> json) => _$AndRefFromJson(json);

 final  List<TypeRef> _items;
 List<TypeRef> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AndRef&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),optional);

@override
String toString() {
  return 'MetaReference.and(items: $items, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $AndRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $AndRefCopyWith(AndRef value, $Res Function(AndRef) _then) = _$AndRefCopyWithImpl;
@override @useResult
$Res call({
 List<TypeRef> items, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? optional = null,}) {
  return _then(AndRef(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TypeRef>,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class MapRef implements MetaReference {
  const MapRef({required this.key, required this.value, this.optional = false, final  String? $type}): $type = $type ?? 'map';
  factory MapRef.fromJson(Map<String, dynamic> json) => _$MapRefFromJson(json);

 final  TypeRef key;
 final  MetaReference value;
@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapRef&&const DeepCollectionEquality().equals(other.key, key)&&(identical(other.value, value) || other.value == value)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(key),value,optional);

@override
String toString() {
  return 'MetaReference.map(key: $key, value: $value, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $MapRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $MapRefCopyWith(MapRef value, $Res Function(MapRef) _then) = _$MapRefCopyWithImpl;
@override @useResult
$Res call({
 TypeRef key, MetaReference value, bool optional
});


$MetaReferenceCopyWith<$Res> get value;

}
/// @nodoc
class _$MapRefCopyWithImpl<$Res>
    implements $MapRefCopyWith<$Res> {
  _$MapRefCopyWithImpl(this._self, this._then);

  final MapRef _self;
  final $Res Function(MapRef) _then;

/// Create a copy of MetaReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? value = null,Object? optional = null,}) {
  return _then(MapRef(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as TypeRef,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as MetaReference,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MetaReference
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

@JsonSerializable(disallowUnrecognizedKeys: true)
class LiteralRef implements MetaReference {
  const LiteralRef({required this.value, this.optional = false, final  String? $type}): $type = $type ?? 'literal';
  factory LiteralRef.fromJson(Map<String, dynamic> json) => _$LiteralRefFromJson(json);

 final  MetaLiteral value;
@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiteralRef&&(identical(other.value, value) || other.value == value)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,optional);

@override
String toString() {
  return 'MetaReference.literal(value: $value, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $LiteralRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $LiteralRefCopyWith(LiteralRef value, $Res Function(LiteralRef) _then) = _$LiteralRefCopyWithImpl;
@override @useResult
$Res call({
 MetaLiteral value, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? optional = null,}) {
  return _then(LiteralRef(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as MetaLiteral,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
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

@JsonSerializable(disallowUnrecognizedKeys: true)
class StringLiteralRef implements MetaReference {
  const StringLiteralRef({required this.value, this.optional = false, final  String? $type}): $type = $type ?? 'stringLiteral';
  factory StringLiteralRef.fromJson(Map<String, dynamic> json) => _$StringLiteralRefFromJson(json);

 final  String value;
@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StringLiteralRef&&(identical(other.value, value) || other.value == value)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,optional);

@override
String toString() {
  return 'MetaReference.stringLiteral(value: $value, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $StringLiteralRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $StringLiteralRefCopyWith(StringLiteralRef value, $Res Function(StringLiteralRef) _then) = _$StringLiteralRefCopyWithImpl;
@override @useResult
$Res call({
 String value, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? optional = null,}) {
  return _then(StringLiteralRef(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class TupleRef implements MetaReference {
  const TupleRef({required final  List<TypeRef> items, this.optional = false, final  String? $type}): _items = items,$type = $type ?? 'tuple';
  factory TupleRef.fromJson(Map<String, dynamic> json) => _$TupleRefFromJson(json);

 final  List<TypeRef> _items;
 List<TypeRef> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool optional;

@JsonKey(name: 'kind')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TupleRef&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.optional, optional) || other.optional == optional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),optional);

@override
String toString() {
  return 'MetaReference.tuple(items: $items, optional: $optional)';
}


}

/// @nodoc
abstract mixin class $TupleRefCopyWith<$Res> implements $MetaReferenceCopyWith<$Res> {
  factory $TupleRefCopyWith(TupleRef value, $Res Function(TupleRef) _then) = _$TupleRefCopyWithImpl;
@override @useResult
$Res call({
 List<TypeRef> items, bool optional
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
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? optional = null,}) {
  return _then(TupleRef(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TypeRef>,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,
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


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
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

@JsonSerializable(disallowUnrecognizedKeys: true) String get method; MessageDirection get messageDirection; TypeRef? get params; String? get documentation; TypeRef? get registrationOptions; String? get since; String? get registrationMethod;
/// Create a copy of MetaNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaNotificationCopyWith<MetaNotification> get copyWith => _$MetaNotificationCopyWithImpl<MetaNotification>(this as MetaNotification, _$identity);

  /// Serializes this MetaNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaNotification&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&const DeepCollectionEquality().equals(other.registrationOptions, registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,const DeepCollectionEquality().hash(params),documentation,const DeepCollectionEquality().hash(registrationOptions),since,registrationMethod);

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
@JsonSerializable(disallowUnrecognizedKeys: true) String method, MessageDirection messageDirection, TypeRef? params, String? documentation, TypeRef? registrationOptions, String? since, String? registrationMethod
});




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
as TypeRef?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as TypeRef?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MetaNotification implements MetaNotification {
  const _MetaNotification({@JsonSerializable(disallowUnrecognizedKeys: true) required this.method, required this.messageDirection, this.params, this.documentation, this.registrationOptions, this.since, this.registrationMethod});
  factory _MetaNotification.fromJson(Map<String, dynamic> json) => _$MetaNotificationFromJson(json);

@override@JsonSerializable(disallowUnrecognizedKeys: true) final  String method;
@override final  MessageDirection messageDirection;
@override final  TypeRef? params;
@override final  String? documentation;
@override final  TypeRef? registrationOptions;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaNotification&&(identical(other.method, method) || other.method == method)&&(identical(other.messageDirection, messageDirection) || other.messageDirection == messageDirection)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&const DeepCollectionEquality().equals(other.registrationOptions, registrationOptions)&&(identical(other.since, since) || other.since == since)&&(identical(other.registrationMethod, registrationMethod) || other.registrationMethod == registrationMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,messageDirection,const DeepCollectionEquality().hash(params),documentation,const DeepCollectionEquality().hash(registrationOptions),since,registrationMethod);

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
@JsonSerializable(disallowUnrecognizedKeys: true) String method, MessageDirection messageDirection, TypeRef? params, String? documentation, TypeRef? registrationOptions, String? since, String? registrationMethod
});




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
as TypeRef?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,registrationOptions: freezed == registrationOptions ? _self.registrationOptions : registrationOptions // ignore: cast_nullable_to_non_nullable
as TypeRef?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,registrationMethod: freezed == registrationMethod ? _self.registrationMethod : registrationMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
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


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
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

 String get name;@IntOrStringSealedConverter() IntOrString get value; String? get documentation; String? get since;
/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaEnumMemberCopyWith<MetaEnumMember> get copyWith => _$MetaEnumMemberCopyWithImpl<MetaEnumMember>(this as MetaEnumMember, _$identity);

  /// Serializes this MetaEnumMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaEnumMember&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value,documentation,since);

@override
String toString() {
  return 'MetaEnumMember(name: $name, value: $value, documentation: $documentation, since: $since)';
}


}

/// @nodoc
abstract mixin class $MetaEnumMemberCopyWith<$Res>  {
  factory $MetaEnumMemberCopyWith(MetaEnumMember value, $Res Function(MetaEnumMember) _then) = _$MetaEnumMemberCopyWithImpl;
@useResult
$Res call({
 String name,@IntOrStringSealedConverter() IntOrString value, String? documentation, String? since
});




}
/// @nodoc
class _$MetaEnumMemberCopyWithImpl<$Res>
    implements $MetaEnumMemberCopyWith<$Res> {
  _$MetaEnumMemberCopyWithImpl(this._self, this._then);

  final MetaEnumMember _self;
  final $Res Function(MetaEnumMember) _then;

/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? value = null,Object? documentation = freezed,Object? since = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as IntOrString,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class _MetaEnumMember implements MetaEnumMember {
  const _MetaEnumMember({required this.name, @IntOrStringSealedConverter() required this.value, this.documentation, this.since});
  factory _MetaEnumMember.fromJson(Map<String, dynamic> json) => _$MetaEnumMemberFromJson(json);

@override final  String name;
@override@IntOrStringSealedConverter() final  IntOrString value;
@override final  String? documentation;
@override final  String? since;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaEnumMember&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value,documentation,since);

@override
String toString() {
  return 'MetaEnumMember(name: $name, value: $value, documentation: $documentation, since: $since)';
}


}

/// @nodoc
abstract mixin class _$MetaEnumMemberCopyWith<$Res> implements $MetaEnumMemberCopyWith<$Res> {
  factory _$MetaEnumMemberCopyWith(_MetaEnumMember value, $Res Function(_MetaEnumMember) _then) = __$MetaEnumMemberCopyWithImpl;
@override @useResult
$Res call({
 String name,@IntOrStringSealedConverter() IntOrString value, String? documentation, String? since
});




}
/// @nodoc
class __$MetaEnumMemberCopyWithImpl<$Res>
    implements _$MetaEnumMemberCopyWith<$Res> {
  __$MetaEnumMemberCopyWithImpl(this._self, this._then);

  final _MetaEnumMember _self;
  final $Res Function(_MetaEnumMember) _then;

/// Create a copy of MetaEnumMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? value = null,Object? documentation = freezed,Object? since = freezed,}) {
  return _then(_MetaEnumMember(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as IntOrString,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MetaEnumeration {

 String get name; TypeRef get type; List<MetaEnumMember> get values; bool? get supportsCustomValues; String? get documentation; String? get since; bool get proposed;
/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaEnumerationCopyWith<MetaEnumeration> get copyWith => _$MetaEnumerationCopyWithImpl<MetaEnumeration>(this as MetaEnumeration, _$identity);

  /// Serializes this MetaEnumeration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaEnumeration&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.type, type)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.supportsCustomValues, supportsCustomValues) || other.supportsCustomValues == supportsCustomValues)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(type),const DeepCollectionEquality().hash(values),supportsCustomValues,documentation,since,proposed);

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
 String name, TypeRef type, List<MetaEnumMember> values, bool? supportsCustomValues, String? documentation, String? since, bool proposed
});




}
/// @nodoc
class _$MetaEnumerationCopyWithImpl<$Res>
    implements $MetaEnumerationCopyWith<$Res> {
  _$MetaEnumerationCopyWithImpl(this._self, this._then);

  final MetaEnumeration _self;
  final $Res Function(MetaEnumeration) _then;

/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = freezed,Object? values = null,Object? supportsCustomValues = freezed,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeRef,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<MetaEnumMember>,supportsCustomValues: freezed == supportsCustomValues ? _self.supportsCustomValues : supportsCustomValues // ignore: cast_nullable_to_non_nullable
as bool?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class _MetaEnumeration implements MetaEnumeration {
  const _MetaEnumeration({required this.name, required this.type, required final  List<MetaEnumMember> values, this.supportsCustomValues, this.documentation, this.since, this.proposed = false}): _values = values;
  factory _MetaEnumeration.fromJson(Map<String, dynamic> json) => _$MetaEnumerationFromJson(json);

@override final  String name;
@override final  TypeRef type;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaEnumeration&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.type, type)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.supportsCustomValues, supportsCustomValues) || other.supportsCustomValues == supportsCustomValues)&&(identical(other.documentation, documentation) || other.documentation == documentation)&&(identical(other.since, since) || other.since == since)&&(identical(other.proposed, proposed) || other.proposed == proposed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(type),const DeepCollectionEquality().hash(_values),supportsCustomValues,documentation,since,proposed);

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
 String name, TypeRef type, List<MetaEnumMember> values, bool? supportsCustomValues, String? documentation, String? since, bool proposed
});




}
/// @nodoc
class __$MetaEnumerationCopyWithImpl<$Res>
    implements _$MetaEnumerationCopyWith<$Res> {
  __$MetaEnumerationCopyWithImpl(this._self, this._then);

  final _MetaEnumeration _self;
  final $Res Function(_MetaEnumeration) _then;

/// Create a copy of MetaEnumeration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = freezed,Object? values = null,Object? supportsCustomValues = freezed,Object? documentation = freezed,Object? since = freezed,Object? proposed = null,}) {
  return _then(_MetaEnumeration(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeRef,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<MetaEnumMember>,supportsCustomValues: freezed == supportsCustomValues ? _self.supportsCustomValues : supportsCustomValues // ignore: cast_nullable_to_non_nullable
as bool?,documentation: freezed == documentation ? _self.documentation : documentation // ignore: cast_nullable_to_non_nullable
as String?,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,proposed: null == proposed ? _self.proposed : proposed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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


/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
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
