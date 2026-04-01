import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions/string.dart';
import 'meta/protocol.dart';

/// Generates a Dart file containing the [LspMethod] enum.
///
/// Every LSP request and notification method string gets a corresponding
/// enum value, e.g. `'textDocument/implementation'` → `textDocumentImplementation`.
final class MethodEnumGenerator {
  const MethodEnumGenerator();

  String generate(MetaProtocol protocol) {
    final methods = <String>{};
    for (final r in protocol.requests) {
      methods.add(r.method);
    }
    for (final n in protocol.notifications) {
      methods.add(n.method);
    }

    final values = methods.toList()..sort();

    final library = Library((b) {
      b
        ..comments.addAll([
          ' GENERATED CODE – DO NOT MODIFY BY HAND',
          ' LSP Version: ${protocol.metaData.version}',
        ])
        ..body.add(_buildEnum(values));
    });

    final emitter = DartEmitter(
      useNullSafetySyntax: true,
      orderDirectives: true,
    );

    return DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
      pageWidth: DartFormatter.defaultPageWidth,
      trailingCommas: TrailingCommas.automate,
    ).format(library.accept(emitter).toString());
  }

  Enum _buildEnum(List<String> methods) => Enum((b) {
    b
      ..name = 'LspMethod'
      ..docs.add('/// All LSP method strings as typed enum values.')
      ..values.addAll(methods.map(_buildValue))
      ..fields.add(
        Field(
          (f) => f
            ..modifier = FieldModifier.final$
            ..type = refer('String')
            ..name = 'value',
        ),
      )
      ..constructors.add(
        Constructor(
          (c) => c
            ..constant = true
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = 'value'
                  ..toThis = true,
              ),
            ),
        ),
      );
  });

  EnumValue _buildValue(String method) => EnumValue((b) {
    b
      ..name = _camelName(method)
      ..arguments.add(literalString(method, raw: method.contains(r'$')));
  });

  /// Converts `textDocument/implementation` → `textDocumentImplementation`.
  /// Converts `$/cancelRequest` → `cancelRequest`.
  String _camelName(String method) => method
      .replaceAll(r'$/', '')
      .split('/')
      .map((p) => p.upperFirstLetter())
      .join()
      .lowerFirstLetter();
}
