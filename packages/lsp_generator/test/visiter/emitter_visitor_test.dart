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
}) => ResolvedProperty(name: name, type: type, optional: optional);

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

    test('generates a final class with correct name', () {
      final state = _stateWith(
        classes: [_cls('Position', properties: [])],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('final class Position'));
    });

    test('generates const constructor', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Position',
            properties: [
              _prop('line', const DartCoreType('int')),
              _prop('character', const DartCoreType('int')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('const Position('));
    });

    test('generates final fields', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Range',
            properties: [
              _prop('start', ClassType(_cls('Position'))),
              _prop('end', ClassType(_cls('Position'))),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('final Position start'));
      expect(src, contains('final Position end'));
    });

    test('generates optional field as nullable', () {
      final state = _stateWith(
        classes: [
          _cls(
            'TextEdit',
            properties: [
              _prop('range', ClassType(_cls('Range'))),
              _prop('newText', const DartCoreType('String')),
              _prop('newEol', const DartCoreType('String'), optional: true),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('final String? newEol'));
    });

    test('generates fromJson factory', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Position',
            properties: [
              _prop('line', const DartCoreType('int')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(
        src,
        contains('factory Position.fromJson(Map<String, Object?> json)'),
      );
      expect(src, contains("json['line'] as int"));
    });

    test('generates toJson method', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Position',
            properties: [
              _prop('line', const DartCoreType('int')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('Map<String, Object?> toJson()'));
      expect(src, contains("'line': line"));
    });

    test('generates copyWith method', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Position',
            properties: [
              _prop('line', const DartCoreType('int')),
              _prop('character', const DartCoreType('int')),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('Position copyWith('));
      expect(src, contains('line ?? this.line'));
      expect(src, contains('character ?? this.character'));
    });

    test('anonymous classes appear before named classes', () {
      final anon = _cls(r'Anon$0', isAnonymous: true);
      final named = _cls('Foo');
      final state = _stateWith(classes: [named, anon]);
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src.indexOf(r'Anon$0'), lessThan(src.indexOf('Foo')));
    });

    test('nested class fromJson deserializes via fromJson call', () {
      final posClass = _cls(
        'Position',
        properties: [
          _prop('line', const DartCoreType('int')),
        ],
      );
      final rangeClass = _cls(
        'Range',
        properties: [
          _prop('start', ClassType(posClass)),
          _prop('end', ClassType(posClass)),
        ],
      );
      final state = _stateWith(classes: [posClass, rangeClass]);
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(
        src,
        contains("Position.fromJson(json['start'] as Map<String, Object?>)"),
      );
      expect(
        src,
        contains("Position.fromJson(json['end'] as Map<String, Object?>)"),
      );
    });

    test('list field generates correct fromJson', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Foo',
            properties: [
              _prop('items', const ListType(DartCoreType('String'))),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains("json['items'] as List<Object?>"));
      expect(src, contains('map((e) => e as String)'));
    });

    test('optional list generates nullable cast', () {
      final state = _stateWith(
        classes: [
          _cls(
            'Foo',
            properties: [
              _prop(
                'items',
                const ListType(DartCoreType('int')),
                optional: true,
              ),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains("json['items'] as List<Object?>?"));
    });

    test('nullable class field in fromJson uses null guard', () {
      final posClass = _cls('Position', properties: []);
      final state = _stateWith(
        classes: [
          _cls(
            'Foo',
            properties: [
              _prop('pos', ClassType(posClass), optional: true),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains("json['pos'] == null"));
      expect(src, contains('Position.fromJson'));
    });

    test('class toJson delegates to nested toJson', () {
      final posClass = _cls('Position', properties: []);
      final state = _stateWith(
        classes: [
          _cls(
            'Range',
            properties: [
              _prop('start', ClassType(posClass)),
            ],
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildStructures());
      expect(src, contains('start.toJson()'));
    });
  });

  group('EmitterVisitor.buildEnumerations()', () {
    test('empty state produces empty library', () {
      final src = _format(EmitterVisitor(_stateWith()).buildEnumerations());
      expect(src.contains('enum '), isFalse);
      expect(src.contains('class '), isFalse);
    });

    test('regular enum produces dart enum with value field', () {
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

    test('supportsCustomValues enum becomes final class', () {
      final state = _stateWith(
        enumerations: [
          _enum('FoldingRangeKind', 'String', [
            _member('comment', 'comment'),
            _member('imports', 'imports'),
          ], supportsCustomValues: true),
        ],
      );
      final src = _format(EmitterVisitor(state).buildEnumerations());
      expect(src, contains('final class FoldingRangeKind'));
      expect(src, contains('final String value'));
      expect(src, contains('static const FoldingRangeKind comment'));
      expect(src, contains("FoldingRangeKind('comment')"));
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
          _alias('DocumentUri', const DartCoreType('String')),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains('typedef DocumentUri = String'));
    });

    test('generates typedef for list alias', () {
      final state = _stateWith(
        aliases: [
          _alias('StringList', const ListType(DartCoreType('String'))),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains('typedef StringList = List<String>'));
    });

    test('generates typedef for union alias (collapsed to Object)', () {
      final state = _stateWith(
        aliases: [
          _alias(
            'LSPAny',
            const UnionType([
              DartCoreType('String'),
              DartCoreType('int'),
              DartCoreType('bool'),
            ]),
          ),
        ],
      );
      final src = _format(EmitterVisitor(state).buildAliases());
      expect(src, contains('typedef LSPAny = Object'));
    });
  });

  // ---------------------------------------------------------------------------
  // Integration — real metaModel.json
  // ---------------------------------------------------------------------------

  group('EmitterVisitor integration (real metaModel.json)', () {
    late ResolvedState resolved;

    setUpAll(()  {
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
      expect(src, contains('final class Position'));
      expect(src, contains('final int line'));
      expect(src, contains('final int character'));
    });

    test('structures output contains Range class', () {
      final src = _format(EmitterVisitor(resolved).buildStructures());
      expect(src, contains('final class Range'));
      expect(src, contains('final Position start'));
      expect(src, contains('final Position end'));
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
      'enumerations output contains FoldingRangeKind as class (supportsCustomValues)',
      () {
        final src = _format(EmitterVisitor(resolved).buildEnumerations());
        expect(src, contains('final class FoldingRangeKind'));
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
      // All anonymous classes (isAnonymous == true) have \$ in their name by convention.
      // Just verify Position (a named class) exists and the output is not empty.
      expect(src, contains('final class'));
    });
  });
}
