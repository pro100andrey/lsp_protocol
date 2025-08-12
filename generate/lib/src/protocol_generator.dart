// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions/string.dart';
import 'meta/protocol.dart';
import 'symbols/symbol.dart';
import 'symbols/symbols.dart';
import 'symbols/symbols_table.dart';
import 'utils.dart';

/// A concrete visitor that generates Dart code from MetaProtocol.
final class ProtocolGenerator {
  // Pass protocol for initial setup, but main logic is in visit methods
  const ProtocolGenerator();

  String generate(MetaProtocol protocol) {
    final symbols = Symbols()..collect(protocol);

    final library = Library(
      (b) {
        b.docs.addAll(_docs());
        b.body.addAll(_generateFreezedHeader());
        b.body.add(_generateMetadata(protocol.metaData));

        for (final symbol in symbols.typedefsTable.values) {
          b.body.add(_generateTypedef(symbol));
        }

        for (final symbol in symbols.literalsTable.values) {
          b.body.add(_generateLiteralTypeAlias(symbol));
        }

        for (final symbol in symbols.sealedTable.values) {
          b.body.addAll(_generateBaseOrClass(symbol));
        }

        for (final structure in symbols.structuresTable.values) {
          b.body.add(_generateStructure(structure));
        }

        for (final symbol in symbols.enumSymbols.values) {
          b.body.add(_generateEnumeration(symbol));
        }

        b.body.add(_generateRequestMethodEnum(protocol.requests));
        b.body.add(_generateNotificationMethodEnum(protocol.notifications));
      },
    );

    // Start the visitation process from the root MetaProtocol object
    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      useNullSafetySyntax: true,
      orderDirectives: true,
    );

    final formatter = DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
      pageWidth: DartFormatter.defaultPageWidth,
      trailingCommas: TrailingCommas.automate,
    );

    final dartCode = library.accept(emitter).toString();

    return formatter.format(dartCode);
  }

  List<String> _docs() => [
    '/// Do not edit it manually.',
    '',
    '// ignore_for_file: doc_directive_unknown',
    '// ignore_for_file: always_put_required_named_parameters_first',
  ];

  List<Spec> _generateFreezedHeader() => const [
    Code('// Freezed header not implemented for generation\n'),
    Code("import 'package:freezed_annotation/freezed_annotation.dart';"),
    Code("part 'protocol.freezed.dart';"),
    Code("part 'protocol.g.dart';"),
  ];

  Spec _generateMetadata(MetaData metaData) => declareConst(
    'kLSPVersion',
    type: refer('String'),
  ).assign(literalString(metaData.version)).statement;

  Spec _generateLiteralTypeAlias(LiteralSymbol symbol) {
    final buffer = StringBuffer();

    for (final prop in symbol.properties) {
      final type = prop.type.optional(optional: prop.optional);

      prop.doc.forEach(buffer.writeln);

      buffer.write(
        '$type ${prop.name}${prop == symbol.properties.last ? '' : ', '}',
      );
    }

    final rawCode = buffer.toString();
    final code = rawCode.isEmpty ? '()' : '({$rawCode})';
    final definition = CodeExpression(Code(code));

    final def = TypeDef((b) {
      b
        ..name = indexedType(symbol.type)
        ..docs.addAll(symbol.doc)
        ..definition = definition;
    });

    return def;
  }

  Spec _generateTypedef(TypedefSymbol symbol) => TypeDef((b) {
    b
      ..docs.addAll(symbol.doc)
      ..name = symbol.type
      ..definition = refer(indexedType(symbol.definition));
  });

  Spec _generateStructure(StructureSymbol symbol) {
    final name = symbol.name.replaceFirstLetterIfExists('_', 'T');

    final clazz = Class(
      (b) {
        b
          ..docs.addAll(symbol.doc)
          ..name = name
          ..annotations.add(refer('freezed'))
          ..mixins.add(refer('_\$$name'))
          ..abstract = true;

        b.constructors.addAll(
          [
            Constructor(
              (b) => b
                ..factory = true
                ..constant = true
                ..redirect = refer('_$name')
                ..optionalParameters.addAll(
                  symbol.properties.map(
                    (field) => Parameter(
                      (b) {
                        final type = indexedType(field.type).optional(
                          optional: field.optional,
                        );

                        b
                          ..docs.addAll(field.doc)
                          ..name = field.name
                          ..type = refer(type)
                          ..named = true
                          ..required = !field.optional;
                      },
                    ),
                  ),
                ),
            ),
            Constructor(
              (b) => b
                ..factory = true
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = refer('Map<String, dynamic>'),
                  ),
                )
                ..lambda = true
                ..body = Code('_\$${name}FromJson(json)'),
            ),
          ],
        );
      },
    );

    return clazz;
  }

  Enum _generateEnumeration(EnumSymbol symbol) {
    final result = Enum((eb) {
      eb
        ..annotations.add(refer("JsonEnum(valueField: 'value')"))
        ..docs.addAll(symbol.doc)
        ..name = symbol.name
        ..constructors.add(
          Constructor(
            (ecb) {
              ecb
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (pb) {
                      pb
                        ..name = 'value'
                        ..named = true
                        ..toThis = true;
                    },
                  ),
                )
                ..docs.add('// The list of all values in this enumeration.');
            },
          ),
        );

      eb.fields.add(
        Field(
          (fb) {
            fb
              ..name = 'value'
              ..modifier = FieldModifier.final$
              ..type = refer(symbol.valueType)
              ..docs.add('// The type of this enumeration.');
          },
        ),
      );

      for (final m in symbol.values) {
        eb.values.add(
          EnumValue(
            (evb) {
              evb.docs.addAll(m.doc);
              evb.arguments.add(refer(m.argument));
              evb.name = m.name;
            },
          ),
        );
      }
    });

    return result;
  }

  List<Spec> _generateBaseOrClass(SealedSymbol symbol) {
    final baseClass = Class(
      (b) {
        b
          ..name = indexedType(symbol.type)
          ..sealed = true;

        b.constructors.addAll(
          [
            Constructor((b) => b..constant = true),
          ],
        );
      },
    );

    return [baseClass];
  }

  Spec _generateRequestMethodEnum(List<MetaRequest> requests) => Enum((eb) {
    eb
      ..name = 'RequestMethod'
      ..docs.add('/// This class contains methods for handling requests.')
      ..constructors.add(
        Constructor(
          (ecb) {
            ecb
              ..constant = true
              ..requiredParameters.add(
                Parameter(
                  (pb) {
                    pb
                      ..name = 'value'
                      ..named = true
                      ..toThis = true;
                  },
                ),
              )
              ..docs.add('// The list of all methods in this enumeration.');
          },
        ),
      )
      ..fields.add(
        Field(
          (fb) {
            fb
              ..name = 'value'
              ..modifier = FieldModifier.final$
              ..type = refer('String')
              ..docs.add('// The type of this enumeration.');
          },
        ),
      );

    for (final request in requests) {
      final method = _getMethodName(request.method);
      final methodPath = request.method;
      final doc = [
        '/// Method: $methodPath',
        '///',
        ...request.documentation.asDoc(width: 70),
      ];

      eb.values.add(
        EnumValue((evb) {
          evb.name = method;
          evb.arguments.add(literalString(methodPath));
          evb.docs.addAll(doc);
        }),
      );
    }
  });

  String _getMethodName(String method) {
    final parts = method
        .replaceAll(r'$/', '')
        .split('/')
        .map((part) => part.upperFirstLetter())
        .join();

    return parts.lowerFirstLetter();
  }

  Spec _generateNotificationMethodEnum(List<MetaNotification> notifications) =>
      Enum((eb) {
        eb
          ..name = 'NotificationMethod'
          ..docs.add(
            '/// This class contains methods for handling notifications.',
          )
          ..constructors.add(
            Constructor(
              (ecb) {
                ecb
                  ..constant = true
                  ..requiredParameters.add(
                    Parameter(
                      (pb) {
                        pb
                          ..name = 'value'
                          ..named = true
                          ..toThis = true;
                      },
                    ),
                  )
                  ..docs.add('// The list of all methods in this enumeration.');
              },
            ),
          )
          ..fields.add(
            Field(
              (fb) {
                fb
                  ..name = 'value'
                  ..modifier = FieldModifier.final$
                  ..type = refer('String')
                  ..docs.add('// The type of this enumeration.');
              },
            ),
          );

        for (final notification in notifications) {
          final method = _getMethodName(notification.method);
          final methodPath = notification.method;

          final doc = [
            '/// Method: $methodPath',
            '///',
            ...notification.documentation.asDoc(width: 70),
          ];

          eb.values.add(
            EnumValue((evb) {
              evb.name = method;

              evb.arguments.add(
                literalString(methodPath, raw: methodPath.startsWith(r'$/')),
              );
              evb.docs.addAll(doc);
            }),
          );
        }
      });
}
