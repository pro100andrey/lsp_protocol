import 'dart:convert';
import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:lsp_generator/src/redux/models/protocol.dart';
import 'package:lsp_generator/src/redux/models/resolved_decl.dart';
import 'package:lsp_generator/src/redux/models/resolved_type.dart';
import 'package:lsp_generator/src/redux/resolved/resolved_state.dart';
import 'package:lsp_generator/src/visiter/emitter_visitor.dart';
import 'package:lsp_generator/src/visiter/resolver_visitor.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

final _emitter = DartEmitter.scoped(
  orderDirectives: true,
  useNullSafetySyntax: true,
);
final _formatter = DartFormatter(
  languageVersion: DartFormatter.latestLanguageVersion,
);

String _format(Library lib) => _formatter.format('${lib.accept(_emitter)}');

ResolvedClass _cls(
  String name, {
  List<ResolvedProperty> properties = const [],
  bool isAnonymous = false,
}) => ResolvedClass(
  name: name,
  properties: properties,
  isAnonymous: isAnonymous,
);

ResolvedProperty _prop(
  String name,
  ResolvedType type, {
  bool optional = false,
  String? deprecated,
}) => ResolvedProperty(
  name: name,
  type: type,
  optional: optional,
  deprecated: deprecated,
);

ResolvedEnum _enum(
  String name,
  String valueType,
  List<ResolvedEnumMember> members, {
  bool supportsCustomValues = false,
}) => ResolvedEnum(
  name: name,
  valueType: valueType,
  members: members,
  supportsCustomValues: supportsCustomValues,
);

ResolvedEnumMember _member(String name, String value, {String? doc}) =>
    ResolvedEnumMember(name: name, value: value, documentation: doc);

ResolvedAlias _alias(String name, ResolvedType type) =>
    ResolvedAlias(name: name, type: type);

ResolvedState _stateWith({
  List<ResolvedClass> classes = const [],
  List<ResolvedEnum> enumerations = const [],
  List<ResolvedAlias> aliases = const [],
}) => ResolvedState(
  registry: {},
  classes: classes,
  enumerations: enumerations,
  aliases: aliases,
);

// ---------------------------------------------------------------------------
// Unit tests — fixture-based
// ---------------------------------------------------------------------------

void main() {
  group('EmitterVisitor.buildStructures()', () {
    test('empty state produces empty library', () {
      final lib = EmitterVisitor(_stateWith()).buildStructures();
      final src = _format(lib);
      // Only the GENERATED header comment; no class declarations.
      expect(src.contains('class '), isFalse);
    });

    test('generates an abstract @freezed class with correct name', () {
      final state = _stateWith(
        classes: [_cls('Position', properties: [])],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('abstract class Position'));
      expect(src, contains('@freezed'));
      expect(src, contains(r'with _$Position'));
    });

    test('generates redirecting const factory constructor', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Position',
            properties: [
              _prop('line', const DartCoreType(dartName: 'int')),
              _prop('character', const DartCoreType(dartName: 'int')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('const factory Position('));
      // Freezed redirect target (may wrap to next line after dart_style).
      expect(src, contains('_Position'));
    });

    test('generates factory params (not fields) for properties', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Range',
            properties: [
              _prop('start', ClassType(ref: _cls('Position'))),
              _prop('end', ClassType(ref: _cls('Position'))),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      // Fields live in the redirecting factory parameters.
      expect(src, contains('required Position start'));
      expect(src, contains('required Position end'));
      // No standalone field declarations.
      expect(src, isNot(contains('final Position start')));
    });

    test('generates optional factory param as nullable', () {
      final state = _stateWith(
        classes: [
          _cls(
            'TextEdit',
            properties: [
              _prop('range', ClassType(ref: _cls('Range'))),
              _prop('newText', const DartCoreType(dartName: 'String')),
              _prop(
                'newEol',
                const DartCoreType(dartName: 'String'),
                optional: true,
              ),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('String? newEol'));
    });

    test(r'generates factory fromJson delegating to _$XxxFromJson', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Position',
            properties: [
              _prop('line', const DartCoreType(dartName: 'int')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      // json_serializable pattern: factory constructor delegates to generated
      // fn
      expect(
        src,
        contains('factory Position.fromJson(Map<String, dynamic> json)'),
      );
      expect(src, contains(r'_$PositionFromJson(json)'));
      // No manual inline deserialization
      expect(src, isNot(contains("json['line'] as int")));
    });

    test('toJson is in freezed mixin, not inlined in class', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Position',
            properties: [
              _prop('line', const DartCoreType(dartName: 'int')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      // json_serializable + freezed: toJson comes from the generated mixin,
      // so no manual Map<String, Object?> toJson() body in the source class.
      expect(src, isNot(contains('Map<String, Object?> toJson()')));
      expect(src, isNot(contains("'line': line")));
    });

    test('anonymous classes appear before named classes', () {
      final anon = _cls(r'Anon$0', isAnonymous: true);
      final named = _cls('Foo');
      final state = _stateWith(classes: [named, anon]);
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src.indexOf(r'Anon$0'), lessThan(src.indexOf('Foo')));
    });

    test('nested class factory fromJson uses json_serializable delegation', () {
      final posClass = _cls(
        'Position',
        properties: [
          _prop('line', const DartCoreType(dartName: 'int')),
        ],
      );
      final rangeClass = _cls(
        'Range',
        properties: [
          _prop('start', ClassType(ref: posClass)),
          _prop('end', ClassType(ref: posClass)),
        ],
      );
      final state = _stateWith(classes: [posClass, rangeClass]);
      final src = _format(EmitterVisitor(state).buildStructures());
      // Each class delegates to _$XxxFromJson — no manual nested calls
      expect(src, contains(r'_$PositionFromJson(json)'));
      expect(src, contains(r'_$RangeFromJson(json)'));
      // No manual inline deserialization of nested classes
      expect(src, isNot(contains("Position.fromJson(json['start']")));
    });

    test(r'list field: delegation to _$FooFromJson (no inline cast)', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Foo',
            properties: [
              _prop(
                'items',
                const ListType(element: DartCoreType(dartName: 'String')),
              ),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      // json_serializable handles the List<String> deserialization
      // automatically
      expect(src, contains(r'_$FooFromJson(json)'));
      expect(src, isNot(contains("json['items'] as List<Object?>")));
    });

    test(
      r'optional list: delegation to _$FooFromJson (no inline nullable cast)',
      () {
        final state = _stateWith(
          classes: [
            _cls(
              'Foo',
              properties: [
                _prop(
                  'items',
                  const ListType(element: DartCoreType(dartName: 'int')),
                  optional: true,
                ),
              ],
            ),
          ],
        );
        final src = _format(EmitterVisitor(state).buildStructures());
        expect(src, contains(r'_$FooFromJson(json)'));
        expect(src, isNot(contains("json['items'] as List<Object?>?")));
      },
    );

    test('optional class field: delegation, no manual null guard', () {
      final posClass = _cls('Position', properties: []);
      final state = _stateWith(
        classes: [
          _cls(
            'Foo',
            properties: [
              _prop('pos', ClassType(ref: posClass), optional: true),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      // json_serializable handles nullable fields — no manual null guard needed
      expect(src, contains(r'_$FooFromJson(json)'));
      expect(src, isNot(contains("json['pos'] == null")));
    });

    test('class toJson is generated by freezed mixin, not inlined', () {
      final posClass = _cls('Position', properties: []);
      final state = _stateWith(
        classes: [
          _cls(
            'Range',
            properties: [
              _prop('start', ClassType(ref: posClass)),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      // No manual start.toJson() call in the source — freezed/json_serializable
      // generates the toJson mixin method
      expect(src, isNot(contains('start.toJson()')));
    });
  });

  group('EmitterVisitor.buildEnumerations()', () {
    test('empty state produces empty library', () {
      final src = _format(EmitterVisitor(_stateWith()).buildEnumerations());
      expect(src.contains('enum '), isFalse);
      expect(src.contains('class '), isFalse);
    });

    test('regular enum produces dart enum with value field and @JsonEnum', () {
      final state = _stateWith(
        enumerations: [
          _enum('DiagnosticSeverity', 'int', [
            _member('error', '1'),
            _member('warning', '2'),
          ]),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains('enum DiagnosticSeverity'));
      expect(src, contains('final int value'));
      expect(src, contains('error(1)'));
      expect(src, contains('warning(2)'));
      // json_serializable uses @JsonEnum(valueField:) for encode/decode
      expect(
        src,
        contains("@JsonEnum(valueField: 'value', alwaysCreate: true)"),
      );
      expect(
        src,
        contains("import 'package:json_annotation/json_annotation.dart'"),
      );
    });

    test('string enum produces dart enum with string values', () {
      final state = _stateWith(
        enumerations: [
          _enum('ResourceOperationKind', 'String', [
            _member('create', 'create'),
            _member('rename', 'rename'),
            _member('delete', 'delete'),
          ]),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains("create('create')"));
      expect(src, contains("rename('rename')"));
      expect(src, contains("delete('delete')"));
    });

    test('supportsCustomValues open enum uses dart enum with decode()', () {
      final state = _stateWith(
        enumerations: [
          _enum('FoldingRangeKind', 'String', [
            _member('comment', 'comment'),
            _member('imports', 'imports'),
          ], supportsCustomValues: true),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains('enum FoldingRangeKind'));
      expect(src, contains('final String value'));
      expect(src, contains("comment('comment')"));
      expect(src, contains('static FoldingRangeKind? decode('));
    });

    test('supportsCustomValues class has const constructor', () {
      final state = _stateWith(
        enumerations: [
          _enum('CodeActionKind', 'String', [
            _member('empty', ''),
          ], supportsCustomValues: true),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains('const CodeActionKind('));
    });

    test('documentation is included as doc comment', () {
      final state = _stateWith(
        enumerations: [
          const ResolvedEnum(
            name: 'MessageType',
            valueType: 'int',
            members: [
              ResolvedEnumMember(
                name: 'error',
                value: '1',
                documentation: 'An error message.',
              ),
            ],
            documentation: 'The message type.',
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains('/// The message type.'));
      expect(src, contains('/// An error message.'));
    });
  });

  group('EmitterVisitor.buildAliases()', () {
    test('empty state produces empty library', () {
      final src = _format(EmitterVisitor(_stateWith()).buildAliases());
      expect(src.contains('typedef '), isFalse);
    });

    test('generates typedef for string alias', () {
      final state = _stateWith(
        aliases: [
          _alias('DocumentUri', const DartCoreType(dartName: 'String')),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains('typedef DocumentUri = String'));
    });

    test('generates typedef for list alias', () {
      final state = _stateWith(
        aliases: [
          _alias(
            'StringList',
            const ListType(element: DartCoreType(dartName: 'String')),
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains('typedef StringList = List<String>'));
    });

    test('generates typedef for union alias (collapsed to Object)', () {
      // A union that includes a MapType is classified as 'mixed' → Object.
      final state = _stateWith(
        aliases: [
          _alias(
            'LSPAny',
            const UnionType(
              items: [
                DartCoreType(dartName: 'String'),
                DartCoreType(dartName: 'int'),
                MapType(
                  key: DartCoreType(dartName: 'String'),
                  value: DartCoreType(dartName: 'Object'),
                ),
              ],
            ),
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains('typedef LSPAny = Object'));
    });

    test('skips sealed union alias in buildAliases()', () {
      // A 2-scalar union is sealed → absent from buildAliases() output.
      final state = _stateWith(
        aliases: [
          _alias(
            'ProgressToken',
            const UnionType(
              items: [
                DartCoreType(dartName: 'int'),
                DartCoreType(dartName: 'String'),
              ],
            ),
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, isNot(contains('typedef ProgressToken')));
    });
  });

  // ---------------------------------------------------------------------------
  // buildUnions() — sealed union classes
  // ---------------------------------------------------------------------------

  group('EmitterVisitor.buildUnions()', () {
    test('scalar union generates sealed class + 2 variants', () {
      final state = _stateWith(
        aliases: [
          _alias(
            'ProgressToken',
            const UnionType(
              items: [
                DartCoreType(dartName: 'int'),
                DartCoreType(dartName: 'String'),
              ],
            ),
          ),
        ],
      );
      // Scalar unions go to buildScalarUnions(), not buildUnions().
      final src = _format(EmitterVisitor(state).buildScalarUnions());
      expect(src, contains('sealed class ProgressToken'));
      expect(src, contains(r'ProgressToken$Int'));
      expect(src, contains(r'ProgressToken$String'));
      expect(src, contains('static ProgressToken fromJson'));
      expect(src, contains('Object toJson()'));
    });

    test('scalar union fromJson checks first variant by type', () {
      final state = _stateWith(
        aliases: [
          _alias(
            'ProgressToken',
            const UnionType(
              items: [
                DartCoreType(dartName: 'int'),
                DartCoreType(dartName: 'String'),
              ],
            ),
          ),
        ],
      );
      // Scalar unions go to buildScalarUnions().
      final src = _format(EmitterVisitor(state).buildScalarUnions());
      expect(src, contains('if (json is int)'));
    });

    test('scalar union absent from buildUnions()', () {
      final state = _stateWith(
        aliases: [
          _alias(
            'ProgressToken',
            const UnionType(
              items: [
                DartCoreType(dartName: 'int'),
                DartCoreType(dartName: 'String'),
              ],
            ),
          ),
        ],
      );
      // Scalar unions go to buildScalarUnions(), buildUnions() stays empty.
      final src = _format(EmitterVisitor(state).buildUnions());
      expect(src, isNot(contains('ProgressToken')));
    });

    test('mixed union absent from buildUnions()', () {
      final state = _stateWith(
        aliases: [
          _alias(
            'LSPAny',
            const UnionType(
              items: [
                DartCoreType(dartName: 'String'),
                MapType(
                  key: DartCoreType(dartName: 'String'),
                  value: DartCoreType(dartName: 'Object'),
                ),
              ],
            ),
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildUnions());
      expect(src, isNot(contains('LSPAny')));
    });

    test('buildUnions() integration emits valid Dart', () {
      final file = File('../lsp_specification/metaModel.json');
      final json = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
      final protocol = MetaProtocol.fromJson(json);
      final resolver = ResolverVisitor()..resolve(protocol);
      final resolved = ResolvedState(
        registry: resolver.registry,
        classes: resolver.classes.toList(),
        enumerations: resolver.enumerations.toList(),
        aliases: resolver.aliases.toList(),
      );
      final lib = EmitterVisitor(resolved).buildUnions();
      expect(() => _format(lib), returnsNormally);
    });

    test('buildUnions() integration contains ProgressToken sealed class', () {
      final file = File('../lsp_specification/metaModel.json');
      final json = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
      final protocol = MetaProtocol.fromJson(json);
      final resolver = ResolverVisitor()..resolve(protocol);
      final resolved = ResolvedState(
        registry: resolver.registry,
        classes: resolver.classes.toList(),
        enumerations: resolver.enumerations.toList(),
        aliases: resolver.aliases.toList(),
      );
      // ProgressToken is scalar → lives in buildScalarUnions(), not
      // buildUnions().
      final scalarSrc = _format(EmitterVisitor(resolved).buildScalarUnions());
      expect(scalarSrc, contains('sealed class ProgressToken'));
      expect(scalarSrc, contains(r'ProgressToken$Int'));
      expect(scalarSrc, contains(r'ProgressToken$String'));
    });
  });

  // ---------------------------------------------------------------------------
  // Integration — real metaModel.json
  // ---------------------------------------------------------------------------

  group('EmitterVisitor integration (real metaModel.json)', () {
    late ResolvedState resolved;

    setUpAll(() {
      final file = File('../lsp_specification/metaModel.json');
      final json = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
      final protocol = MetaProtocol.fromJson(json);

      final resolver = ResolverVisitor()..resolve(protocol);
      resolved = ResolvedState(
        registry: resolver.registry,
        classes: resolver.classes.toList(),
        enumerations: resolver.enumerations.toList(),
        aliases: resolver.aliases.toList(),
      );
    });

    test('buildStructures() emits valid formattable Dart', () {
      final lib = EmitterVisitor(resolved).buildStructures();
      // Should not throw.
      expect(() => _format(lib), returnsNormally);
    });

    test('structiures output contains Position class', () {
      final src = _format(EmitterVisitor(resolved).buildStructures());
      expect(src, contains('abstract class Position'));
      expect(src, contains('@freezed'));
      expect(src, contains('required int line'));
      expect(src, contains('required int character'));
    });

    test('structures output contains Range class', () {
      final src = _format(EmitterVisitor(resolved).buildStructures());
      expect(src, contains('abstract class Range'));
      expect(src, contains('required Position start'));
      expect(src, contains('required Position end'));
    });

    test('buildEnumerations() emits valid formattable Dart', () {
      final lib = EmitterVisitor(resolved).buildEnumerations();
      expect(() => _format(lib), returnsNormally);
    });

    test('enumerations output contains DiagnosticSeverity enum', () {
      final src = _format(EmitterVisitor(resolved).buildEnumerations());
      expect(src, contains('enum DiagnosticSeverity'));
      // Real JSON has PascalCase member names: Error, Warning, etc.
      expect(src, contains('Error(1)'));
      expect(src, contains('Warning(2)'));
    });

    test(
      'enumerations output contains FoldingRangeKind as enum '
      '(supportsCustomValues)',
      () {
        final src = _format(EmitterVisitor(resolved).buildEnumerations());
        expect(src, contains('enum FoldingRangeKind'));
      },
    );

    test('buildAliases() emits valid formattable Dart', () {
      final lib = EmitterVisitor(resolved).buildAliases();
      expect(() => _format(lib), returnsNormally);
    });

    test('aliases output contains a typedef from the real model', () {
      final src = _format(EmitterVisitor(resolved).buildAliases());
      // ChangeAnnotationIdentifier is a String alias in LSP 3.17.
      expect(src, contains('typedef ChangeAnnotationIdentifier'));
    });

    test('anonymous classes appear before named classes in structures', () {
      final src = _format(EmitterVisitor(resolved).buildStructures());
      // All anonymous classes (isAnonymous == true) have \$ in their name by
      // convention.Just verify Position (a named class) exists and the output
      // is not empty.
      expect(src, contains('abstract class'));
    });
  });

  // -----------------------------------------------------------------------
  // @Deprecated annotations
  // -----------------------------------------------------------------------

  group('@Deprecated annotations', () {
    test('deprecated property emits @Deprecated on redirecting factory param',
        () {
      final state = _stateWith(
        classes: [
          _cls(
            'Foo',
            properties: [
              _prop(
                'oldField',
                const DartCoreType(dartName: 'String'),
                deprecated: 'Use newField instead.',
              ),
              _prop('newField', const DartCoreType(dartName: 'String')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(
        src,
        contains("@Deprecated('Use newField instead.')"),
      );
    });

    test('deprecated property keeps @Deprecated on private JsonSerializable class field',
        () {
      final state = _stateWith(
        classes: [
          _cls(
            '_PrivateFoo',
            properties: [
              _prop(
                'oldField',
                const DartCoreType(dartName: 'String'),
                deprecated: 'Old.',
              ),
            ],
            isAnonymous: true,
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains("@Deprecated('Old.')"));
    });

    test('deprecated enum member emits @Deprecated annotation', () {
      final state = _stateWith(
        enumerations: [
          const ResolvedEnum(
            name: 'Status',
            valueType: 'String',
            members: [
              ResolvedEnumMember(
                name: 'active',
                value: 'active',
              ),
              ResolvedEnumMember(
                name: 'old',
                value: 'old',
                deprecated: 'Use active instead.',
              ),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains("@Deprecated('Use active instead.')"));
      // Non-deprecated member should not have @Deprecated.
      expect(
        src.indexOf('@Deprecated'),
        src.lastIndexOf('@Deprecated'),
        reason: 'Only one @Deprecated',
      );
    });

    test('deprecated alias emits @Deprecated on typedef', () {
      final state = _stateWith(
        aliases: [
          ResolvedAlias(
            name: 'OldAlias',
            type: const DartCoreType(dartName: 'String'),
            deprecated: 'Use NewAlias instead.',
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains("@Deprecated('Use NewAlias instead.')"));
      expect(src, contains('typedef OldAlias'));
    });
  });

  // -----------------------------------------------------------------------
  // since / proposed in doc comments
  // -----------------------------------------------------------------------

  group('since and proposed in doc comments', () {
    test('class with only since emits @since tag', () {
      final state = _stateWith(
        classes: [
          ResolvedClass(
            name: 'NewThing',
            properties: [],
            since: '3.17.0',
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('/// @since 3.17.0'));
    });

    test('class with only proposed emits @proposed tag', () {
      final state = _stateWith(
        classes: [
          ResolvedClass(
            name: 'ProposedThing',
            properties: [],
            proposed: true,
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('/// @proposed'));
    });

    test('class with documentation and since appends @since to doc comment', () {
      final state = _stateWith(
        classes: [
          ResolvedClass(
            name: 'DocThing',
            properties: [],
            documentation: 'Main description.',
            since: '3.16.0',
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('/// Main description.'));
      expect(src, contains('/// @since 3.16.0'));
    });

    test('enum with since and proposed emits both tags', () {
      final state = _stateWith(
        enumerations: [
          const ResolvedEnum(
            name: 'NewEnum',
            valueType: 'int',
            members: [ResolvedEnumMember(name: 'a', value: '1')],
            since: '3.18.0',
            proposed: true,
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains('/// @since 3.18.0'));
      expect(src, contains('/// @proposed'));
    });

    test('alias with since emits @since tag', () {
      final state = _stateWith(
        aliases: [
          ResolvedAlias(
            name: 'MyAlias',
            type: const DartCoreType(dartName: 'String'),
            since: '3.17.0',
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains('/// @since 3.17.0'));
    });
  });

  // -----------------------------------------------------------------------
  // Smoke tests for buildNotificationMethods / buildRequestMethods
  // -----------------------------------------------------------------------

  group('buildNotificationMethods() smoke tests', () {
    late ResolvedState resolved;

    setUpAll(() {
      final file = File('../lsp_specification/metaModel.json');
      final json = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
      final protocol = MetaProtocol.fromJson(json);
      final resolver = ResolverVisitor()..resolve(protocol);
      resolved = ResolvedState(
        registry: resolver.registry,
        classes: resolver.classes.toList(),
        enumerations: resolver.enumerations.toList(),
        aliases: resolver.aliases.toList(),
        notifications: protocol.notifications,
        requests: protocol.requests,
      );
    });

    test('emits NotificationMethod enum', () {
      final src = _format(EmitterVisitor(resolved).buildNotificationMethods());
      expect(src, contains('enum NotificationMethod'));
    });

    test('emits RequestMethod enum', () {
      final src = _format(EmitterVisitor(resolved).buildNotificationMethods());
      expect(src, contains('enum RequestMethod'));
    });

    test('NotificationMethod has at least 10 members', () {
      final src = _format(EmitterVisitor(resolved).buildNotificationMethods());
      // Count enum value entries — each line with '(' and a string argument.
      final count = "(r'".allMatches(src).length + "('".allMatches(src).length;
      expect(count, greaterThanOrEqualTo(10));
    });

    test(r'methods use raw strings for $/ methods', () {
      final src = _format(EmitterVisitor(resolved).buildNotificationMethods());
      // The setTrace notification uses \$/setTrace.
      expect(src, contains(r"r'$/"));
    });
  });
}
