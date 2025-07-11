import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'meta/protocol.dart';
import 'visiters/visitor.dart';

String specToCode(Spec spec, {bool format = true}) {
  final emitter = DartEmitter(
    allocator: Allocator.simplePrefixing(),
    useNullSafetySyntax: true,
    orderDirectives: true,
  );

  final dartCode = spec.accept(emitter).toString();

  if (!format) {
    return dartCode;
  }

  final formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
    pageWidth: DartFormatter.defaultPageWidth,
    trailingCommas: TrailingCommas.automate,
  );

  final result = formatter.format(dartCode);

  return result;
}

String literalToRecord(LiteralRef ref, MetaReferenceVisitor visitor) {
      final record = RecordType(
    (rb) {
      final entries = <MapEntry<String, Reference>>[];
      for (final prop in ref.value.properties) {
        final propType = prop.type.resolveType(visitor);
        final propName = prop.name;

        entries.add(MapEntry(propName, refer(propType)));

        rb.namedFieldTypes.addEntries(entries);
      }
    },
  );

  final result = specToCode(record, format: false);

  return result;
}
