// ignore_for_file: type=lint

// GENERATED — do not edit.

extension type const ProgressToken(Object value) {
  factory ProgressToken.fromJson(Object json) => ProgressToken(json);

  Object toJson() => value;

  bool get isInt => value is int;

  int? get asInt {
    return value is int ? value as int : null;
  }

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }
}

/// Inline union: CancelParamsId.
extension type const CancelParamsId(Object value) {
  factory CancelParamsId.fromJson(Object json) => CancelParamsId(json);

  Object toJson() => value;

  bool get isInt => value is int;

  int? get asInt {
    return value is int ? value as int : null;
  }

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }
}

/// Inline union: DiagnosticCode.
extension type const DiagnosticCode(Object value) {
  factory DiagnosticCode.fromJson(Object json) => DiagnosticCode(json);

  Object toJson() => value;

  bool get isInt => value is int;

  int? get asInt {
    return value is int ? value as int : null;
  }

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }
}

/// Inline union: WorkspaceFoldersServerCapabilitiesChangeNotifications.
extension type const WorkspaceFoldersServerCapabilitiesChangeNotifications(
  Object value
) {
  factory WorkspaceFoldersServerCapabilitiesChangeNotifications.fromJson(
    Object json,
  ) => WorkspaceFoldersServerCapabilitiesChangeNotifications(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isBool => value is bool;

  bool? get asBool {
    return value is bool ? value as bool : null;
  }
}

/// Inline union: ParameterInformationLabel.
extension type const ParameterInformationLabel(Object value) {
  factory ParameterInformationLabel.fromJson(Object json) =>
      ParameterInformationLabel(json);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString {
    return value is String ? value as String : null;
  }

  bool get isTuple => value is List && (value as List).length == 2;

  (int, int)? get asTuple {
    if (isTuple) {
      final list = value as List;
      return (list[0] as int, list[1] as int);
    }
    return null;
  }
}
