// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions/string.dart';
import 'meta/protocol.dart';
import 'symbols/symbol.dart';
import 'symbols/symbols.dart';

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

        for (final structure in symbols.structuresTable.values) {
          b.body.add(_generateStructure(structure));
        }

        for (final symbol in symbols.enumSymbols.values) {
          b.body.add(_generateEnumeration(symbol));
        }

        b.body.add(_generateRequestMethodEnum(protocol.requests));
        b.body.add(_generateNotificationMethodEnum(protocol.notifications));

        b.body.add(_generateOr(2));
        b.body.add(_generateOr(3));
        b.body.add(_generateOr(4));
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

    // return dartCode;

    return formatter.format(dartCode);
  }

  Spec _generateOr(int numberOfTypes) {
    final typeParams = List.generate(numberOfTypes, (i) => refer('T${i + 1}'));
    final className = 'Or$numberOfTypes';

    final clazz = Class((b) {
      b
        ..docs.add(
          '/// A class representing a value that can be one of $numberOfTypes types.',
        )
        ..annotations.add(refer('freezed'))
        ..abstract = true
        ..name = className
        ..types.addAll(typeParams)
        ..mixins.add(
          TypeReference(
            (m) => m
              ..symbol = '_\$$className'
              ..types.addAll(typeParams),
          ),
        );

      for (var i = 0; i < numberOfTypes; i++) {
        b.constructors.add(
          Constructor((ctor) {
            ctor
              ..constant = true
              ..factory = true
              ..name = 't${i + 1}'
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'value'
                    ..type = refer('T${i + 1}'),
                ),
              )
              ..redirect = TypeReference(
                (t) => t
                  ..symbol = '_${className}T${i + 1}'
                  ..types.addAll(typeParams),
              );
          }),
        );
      }

      b.constructors.add(
        Constructor((ctor) {
          ctor
            ..constant = true
            ..name = '_';
        }),
      );
    });

    return clazz;
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

  Spec _generateTypedef(TypedefSymbol symbol) => TypeDef((b) {
    b
      ..docs.addAll(symbol.doc)
      ..name = symbol.type
      ..definition = refer(symbol.definition);
  });

  Spec _generateStructure(StructureSymbol symbol) {
    final name = symbol.name.replaceFirstLetterIfExists('_', r'$');

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
                        final type = field.type.optional(
                          optional: field.optional,
                        );

                        if (field.converter != null) {
                          b.annotations.add(refer(field.converter!));
                        }

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
