// GENERATED — do not edit.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scalar_unions.freezed.dart';

@freezed
sealed class ProgressToken with _$ProgressToken {
  const ProgressToken._();

  const factory ProgressToken.int({required int value}) = ProgressToken$Int;

  const factory ProgressToken.string({required String value}) =
      ProgressToken$String;

  static ProgressToken fromJson(Object? json) {
    if (json is int) {
      return ProgressToken.int(value: json);
    }
    return ProgressToken.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    ProgressToken$Int(:final value) => value,
    ProgressToken$String(:final value) => value,
  };
}

/// Inline union: CancelParamsId.
@freezed
sealed class CancelParamsId with _$CancelParamsId {
  const CancelParamsId._();

  const factory CancelParamsId.int({required int value}) = CancelParamsId$Int;

  const factory CancelParamsId.string({required String value}) =
      CancelParamsId$String;

  static CancelParamsId fromJson(Object? json) {
    if (json is int) {
      return CancelParamsId.int(value: json);
    }
    return CancelParamsId.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    CancelParamsId$Int(:final value) => value,
    CancelParamsId$String(:final value) => value,
  };
}

/// Inline union: DiagnosticCode.
@freezed
sealed class DiagnosticCode with _$DiagnosticCode {
  const DiagnosticCode._();

  const factory DiagnosticCode.int({required int value}) = DiagnosticCode$Int;

  const factory DiagnosticCode.string({required String value}) =
      DiagnosticCode$String;

  static DiagnosticCode fromJson(Object? json) {
    if (json is int) {
      return DiagnosticCode.int(value: json);
    }
    return DiagnosticCode.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    DiagnosticCode$Int(:final value) => value,
    DiagnosticCode$String(:final value) => value,
  };
}

/// Inline union: WorkspaceFoldersServerCapabilitiesChangeNotifications.
@freezed
sealed class WorkspaceFoldersServerCapabilitiesChangeNotifications
    with _$WorkspaceFoldersServerCapabilitiesChangeNotifications {
  const WorkspaceFoldersServerCapabilitiesChangeNotifications._();

  const factory WorkspaceFoldersServerCapabilitiesChangeNotifications.string({
    required String value,
  }) = WorkspaceFoldersServerCapabilitiesChangeNotifications$String;

  const factory WorkspaceFoldersServerCapabilitiesChangeNotifications.bool({
    required bool value,
  }) = WorkspaceFoldersServerCapabilitiesChangeNotifications$Bool;

  static WorkspaceFoldersServerCapabilitiesChangeNotifications fromJson(
    Object? json,
  ) {
    if (json is String) {
      return WorkspaceFoldersServerCapabilitiesChangeNotifications.string(
        value: json,
      );
    }
    return WorkspaceFoldersServerCapabilitiesChangeNotifications.bool(
      value: (json as bool),
    );
  }

  Object toJson() => switch (this) {
    WorkspaceFoldersServerCapabilitiesChangeNotifications$String(
      :final value,
    ) =>
      value,
    WorkspaceFoldersServerCapabilitiesChangeNotifications$Bool(:final value) =>
      value,
  };
}

/// Inline union: ParameterInformationLabel.
@freezed
sealed class ParameterInformationLabel with _$ParameterInformationLabel {
  const ParameterInformationLabel._();

  const factory ParameterInformationLabel.string({required String value}) =
      ParameterInformationLabel$String;

  static ParameterInformationLabel fromJson(Object? json) {
    return ParameterInformationLabel.string(value: (json as String));
  }

  Object toJson() => switch (this) {
    ParameterInformationLabel$String(:final value) => value,
  };
}
