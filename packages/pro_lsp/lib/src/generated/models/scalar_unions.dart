// GENERATED — do not edit.

extension type const ProgressToken._(Object value) {
  const factory ProgressToken.fromJson(Object json) = ProgressToken._;

  const factory ProgressToken.int(int value) = ProgressToken._;

  const factory ProgressToken.string(String value) = ProgressToken._;

  Object toJson() => value;

  bool get isInt => value is int;

  int? get asInt => isInt ? value as int : null;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;
}

/// Inline union: CancelParamsId.
extension type const CancelParamsId._(Object value) {
  const factory CancelParamsId.fromJson(Object json) = CancelParamsId._;

  const factory CancelParamsId.int(int value) = CancelParamsId._;

  const factory CancelParamsId.string(String value) = CancelParamsId._;

  Object toJson() => value;

  bool get isInt => value is int;

  int? get asInt => isInt ? value as int : null;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;
}

/// Inline union: DiagnosticCode.
extension type const DiagnosticCode._(Object value) {
  const factory DiagnosticCode.fromJson(Object json) = DiagnosticCode._;

  const factory DiagnosticCode.int(int value) = DiagnosticCode._;

  const factory DiagnosticCode.string(String value) = DiagnosticCode._;

  Object toJson() => value;

  bool get isInt => value is int;

  int? get asInt => isInt ? value as int : null;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;
}

/// Inline union: WorkspaceFoldersServerCapabilitiesChangeNotifications.
extension type const WorkspaceFoldersServerCapabilitiesChangeNotifications._(
  Object value
) {
  const factory WorkspaceFoldersServerCapabilitiesChangeNotifications.fromJson(
    Object json,
  ) = WorkspaceFoldersServerCapabilitiesChangeNotifications._;

  const factory WorkspaceFoldersServerCapabilitiesChangeNotifications.string(
    String value,
  ) = WorkspaceFoldersServerCapabilitiesChangeNotifications._;

  const factory WorkspaceFoldersServerCapabilitiesChangeNotifications.bool(
    bool value,
  ) = WorkspaceFoldersServerCapabilitiesChangeNotifications._;

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isBool => value is bool;

  bool? get asBool => isBool ? value as bool : null;
}

/// Inline union: ParameterInformationLabel.
extension type const ParameterInformationLabel._(Object value) {
  const factory ParameterInformationLabel.fromJson(Object json) =
      ParameterInformationLabel._;

  const factory ParameterInformationLabel.string(String value) =
      ParameterInformationLabel._;

  factory ParameterInformationLabel.tuple((int, int) value) =>
      ParameterInformationLabel._([value.$1, value.$2]);

  Object toJson() => value;

  bool get isString => value is String;

  String? get asString => isString ? value as String : null;

  bool get isTuple => value is List && (value as List).length == 2;

  (int, int)? get asTuple {
    if (isTuple) {
      final list = value as List;
      return (list[0] as int, list[1] as int);
    }
    return null;
  }
}
