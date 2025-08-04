import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions/string.dart';
import 'meta/protocol.dart';

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

String literalToRecord({
  required LiteralRef ref,
  required String Function(MetaReference) typeResolver,
  bool forceOptional = false,
}) {
  final record = RecordType(
    (rb) {
      final entries = <MapEntry<String, Reference>>[];
      for (final prop in ref.value.properties) {
        final propType = typeResolver(prop.type);
        final propName = prop.name;
        final type = propType.optional(
          optional: prop.optional || forceOptional,
        );
        final typRefer = refer(type);

        entries.add(MapEntry(propName, typRefer));

        rb.namedFieldTypes.addEntries(entries);
      }
    },
  );

  final result = specToCode(record, format: false);

  return result;
}

String tupleToRecord(
  TupleRef ref,
  String Function(MetaReference) typeResolver,
) {
  final record = RecordType(
    (rb) {
      for (final item in ref.items) {
        final propType = typeResolver(item);
        rb.positionalFieldTypes.add(refer(propType));
      }
    },
  );

  final result = specToCode(record, format: false);

  return result;
}
