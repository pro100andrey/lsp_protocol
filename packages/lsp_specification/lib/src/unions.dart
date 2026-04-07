// GENERATED — do not edit.

import 'structures.dart';

sealed class Definition {
  static Definition fromJson(Object? json) {
    if (json is List) {
      return Definition$List(
        (json as List<Object?>)
            .map((e) => Location.fromJson(e as Map<String, Object?>))
            .toList(),
      );
    }
    return Definition$Location(Location.fromJson(json as Map<String, Object?>));
  }

  Object toJson();
}

final class Definition$Location extends Definition {
  Definition$Location(this.value);
  final Location value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

final class Definition$List extends Definition {
  Definition$List(this.value);
  final List<Location> value;
  @override
  List<Object?> toJson() => value.map((e) => e.toJson()).toList();
}

sealed class Declaration {
  static Declaration fromJson(Object? json) {
    if (json is List) {
      return Declaration$List(
        (json as List<Object?>)
            .map((e) => Location.fromJson(e as Map<String, Object?>))
            .toList(),
      );
    }
    return Declaration$Location(
      Location.fromJson(json as Map<String, Object?>),
    );
  }

  Object toJson();
}

final class Declaration$Location extends Declaration {
  Declaration$Location(this.value);
  final Location value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

final class Declaration$List extends Declaration {
  Declaration$List(this.value);
  final List<Location> value;
  @override
  List<Object?> toJson() => value.map((e) => e.toJson()).toList();
}

sealed class InlineValue {
  static InlineValue fromJson(Map<String, Object?> json) {
    if (json.containsKey('text'))
      return InlineValue$Text(InlineValueText.fromJson(json));
    if (json.containsKey('caseSensitiveLookup'))
      return InlineValue$VariableLookup(
        InlineValueVariableLookup.fromJson(json),
      );
    return InlineValue$EvaluatableExpression(
      InlineValueEvaluatableExpression.fromJson(json),
    );
  }

  Object toJson();
}

final class InlineValue$Text extends InlineValue {
  InlineValue$Text(this.value);
  final InlineValueText value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

final class InlineValue$VariableLookup extends InlineValue {
  InlineValue$VariableLookup(this.value);
  final InlineValueVariableLookup value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

final class InlineValue$EvaluatableExpression extends InlineValue {
  InlineValue$EvaluatableExpression(this.value);
  final InlineValueEvaluatableExpression value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

sealed class DocumentDiagnosticReport {
  static DocumentDiagnosticReport fromJson(Map<String, Object?> json) {
    if (json['kind'] == 'full')
      return DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport(
        RelatedFullDocumentDiagnosticReport.fromJson(json),
      );
    return DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport(
      RelatedUnchangedDocumentDiagnosticReport.fromJson(json),
    );
  }

  Object toJson();
}

final class DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport
    extends DocumentDiagnosticReport {
  DocumentDiagnosticReport$RelatedFullDocumentDiagnosticReport(this.value);
  final RelatedFullDocumentDiagnosticReport value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

final class DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport
    extends DocumentDiagnosticReport {
  DocumentDiagnosticReport$RelatedUnchangedDocumentDiagnosticReport(this.value);
  final RelatedUnchangedDocumentDiagnosticReport value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

sealed class WorkspaceDocumentDiagnosticReport {
  static WorkspaceDocumentDiagnosticReport fromJson(Map<String, Object?> json) {
    if (json['kind'] == 'full')
      return WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport(
        WorkspaceFullDocumentDiagnosticReport.fromJson(json),
      );
    return WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport(
      WorkspaceUnchangedDocumentDiagnosticReport.fromJson(json),
    );
  }

  Object toJson();
}

final class WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport
    extends WorkspaceDocumentDiagnosticReport {
  WorkspaceDocumentDiagnosticReport$WorkspaceFullDocumentDiagnosticReport(
    this.value,
  );
  final WorkspaceFullDocumentDiagnosticReport value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}

final class WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport
    extends WorkspaceDocumentDiagnosticReport {
  WorkspaceDocumentDiagnosticReport$WorkspaceUnchangedDocumentDiagnosticReport(
    this.value,
  );
  final WorkspaceUnchangedDocumentDiagnosticReport value;
  @override
  Map<String, Object?> toJson() => value.toJson();
}
