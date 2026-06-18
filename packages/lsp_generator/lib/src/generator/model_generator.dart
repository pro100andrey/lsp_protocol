import 'package:code_builder/code_builder.dart';
import 'package:meta/meta.dart' show visibleForTesting;

import '../config/files.dart';
import '../models/protocol.dart';
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import 'codegen_type.dart';
import 'generator_helpers.dart';
import 'resolver.dart';
import 'type_ref_helpers.dart';

part 'model_aliases.dart';
part 'model_classes.dart';
part 'model_enums.dart';
part 'model_serialization.dart';
part 'model_unions.dart';

/// Categories for organizing LSP classes into separate output files.
enum _ClassCategory {
  /// LSP capability classes (e.g. `TextDocumentSyncCapabilities`).
  capabilities,

  /// LSP parameter and option classes (e.g. `TextDocumentSyncOptions`).
  params,

  /// Common LSP types (everything else).
  common,
}

/// Builds code_builder [Library] objects from a fully resolved [ResolveResult].
///
/// Each [Library] can be emitted to a Dart source string via [DartEmitter].
final class ModelGenerator {
  ModelGenerator(this._resolved);

  final ResolveResult _resolved;

  late final _ctx = CodegenContext(_resolved);

  static const _header = 'GENERATED — do not edit.';

  /// All class names (including anonymous) — used to filter conflicting
  /// aliases.
  late final Set<String> _classNames = _ctx.classNames;

  /// Names of aliases emitted as sealed union classes (all union files
  /// combined).
  late final Set<String> _sealedUnionNames = _ctx.sealedUnionNames;

  /// Subset of [_sealedUnionNames]: purely scalar unions (only [DartCoreType]
  /// items). Emitted to [Files.scalarUnions]; no import of
  /// structures needed.
  late final Set<String> _scalarUnionNames = _ctx.scalarUnionNames;

  /// Inline anonymous unions collected from all class properties.
  late final Map<String, UnionType> _inlineUnions = _computeInlineUnions();

  // Public API

  /// Classifies [cls] into a [_ClassCategory] based on its name pattern.
  _ClassCategory _classifyClass(ResolvedClass cls) => switch (cls.name) {
    final s when s.contains('Capabilities') => .capabilities,
    final s when s.endsWith('Params') || s.endsWith('Options') => .params,
    _ => .common,
  };

  /// Returns classes matching [category], excluding underscore-prefixed base
  /// classes (e.g. `_InitializeParams`).
  ///
  /// LSP base classes are flattened into their subclasses via
  /// [_allProperties], so they must not be emitted standalone.
  Iterable<ResolvedClass> _classesForCategory(_ClassCategory category) =>
      _resolved.classes.where(
        (c) => !c.name.startsWith('_') && _classifyClass(c) == category,
      );

  /// Builds a [Library] containing only [cls], for exercising [_buildClass]
  /// (including the underscore-prefixed `@JsonSerializable` path) in isolation.
  @visibleForTesting
  Library buildSingleClass(ResolvedClass cls) => Library(
    (b) => b.body.add(_buildClass(cls)),
  );

  /// Builds a [Library] containing all resolved classes (anonymous first).
  Library buildStructures() {
    final allTypes = _resolved.classes.expand(
      (c) => [...c.properties.map((p) => p.type), ...c.extends$, ...c.mixins$],
    );

    return .new(
      (b) => b
        ..comments.addAll([_header])
        ..directives.add(
          .import('package:freezed_annotation/freezed_annotation.dart'),
        )
        ..directives.addAll(_crossImports(allTypes, Files.structures))
        ..directives.add(.part(Files.structuresFreezed))
        ..directives.add(.part(Files.structuresG))
        ..directives.add(.part(Files.structuresCapabilities))
        ..directives.add(.part(Files.structuresParams))
        ..directives.add(.part(Files.structuresCommon)),
    );
  }

  /// Builds a [Library] containing capability classes.
  Library buildStructuresCaps() => _buildCategoryLibrary(.capabilities);

  /// Builds a [Library] containing parameter and option classes.
  Library buildStructuresParams() => _buildCategoryLibrary(.params);

  /// Builds a [Library] containing common LSP classes.
  Library buildStructuresCommon() => _buildCategoryLibrary(.common);

  Library _buildCategoryLibrary(_ClassCategory category) => .new(
    (b) => b
      ..comments.addAll([
        _header,
        if (category == .params) 'ignore_for_file: lines_longer_than_80_chars',
      ])
      ..directives.add(.partOf(Files.structures))
      ..body.addAll(_classesForCategory(category).map(_buildClass)),
  );

  /// Builds a [Library] containing all resolved enumerations.
  Library buildEnumerations() => .new(
    (b) => b
      ..comments.add(_header)
      ..directives.add(.import('package:json_annotation/json_annotation.dart'))
      ..directives.add(.part(Files.enumerationsG))
      ..body.addAll(_resolved.enumerations.map(_buildEnum)),
  );

  /// Builds a [Library] containing a NotificationMethod enum with one member
  /// per LSP notification method string.
  ///
  /// Member names use the last path segment when unique across all
  /// notifications, and fall back to the full camelCase path on collisions
  /// (e.g. `textDocument/didOpen` vs `notebookDocument/didOpen`).
  Library buildNotificationMethods() {
    final notifications = _resolved.notifications;
    final requests = _resolved.requests;
    final notifNames = dartNames(notifications, (n) => n.method);
    final requestNames = dartNames(requests, (r) => r.method);

    return .new(
      (b) => b
        ..comments.add(_header)
        ..directives.add(
          .import('package:json_annotation/json_annotation.dart'),
        )
        ..directives.add(.part(Files.methodsG))
        ..body.add(_buildLSPMethodClass())
        ..body.add(
          _buildMethodEnum(
            'NotificationMethod',
            notifications.map(
              (n) => (
                memberName: notifNames[n]!,
                method: n.method,
                doc:
                    n.documentation ??
                    'LSP notification `${n.method}` '
                        '(${_directionLabel(n.messageDirection)}).',
              ),
            ),
          ),
        )
        ..body.add(
          _buildMethodEnum(
            'RequestMethod',
            requests.map(
              (r) => (
                memberName: requestNames[r]!,
                method: r.method,
                doc:
                    r.documentation ??
                    'LSP request `${r.method}` '
                        '(${_directionLabel(r.messageDirection)}).',
              ),
            ),
          ),
        ),
    );
  }

  /// Builds the abstract LSPMethod interface that both NotificationMethod
  /// and RequestMethod enums implement.
  Spec _buildLSPMethodClass() => Class((b) {
    b
      ..name = 'LSPMethod'
      ..abstract = true
      ..docs.add('/// Base interface for LSP method identifiers.');
    b.methods.add(
      .new(
        (m) => m
          ..name = 'value'
          ..returns = refer('String')
          ..type = .getter,
      ),
    );
  });

  /// Builds a [Library] containing all resolved type aliases.
  Library buildAliases() {
    // Skip aliases whose name is already a class — avoids ambiguous_export.
    // Skip aliases handled as sealed union classes by [buildUnions].
    final aliases = _resolved.aliases.where(
      (a) =>
          !_classNames.contains(a.name) && !_sealedUnionNames.contains(a.name),
    );
    final allTypes = aliases.map((a) => a.type);

    return Library(
      (b) => b
        ..comments.add(_header)
        ..directives.addAll(_crossImports(allTypes, Files.aliases))
        ..body.addAll(aliases.map(_buildAlias)),
    );
  }

  /// Builds a [Library] containing sealed classes for purely scalar unions
  /// (e.g. `ProgressToken = int | string`). Written to
  /// [Files.scalarUnions].
  ///
  /// This file does **not** import `structures.dart`, so `structures.dart` can
  /// safely import this file without creating a circular dependency.
  Library buildScalarUnions() =>
      _buildUnionLibrary(_scalarUnionNames, isScalar: true);

  /// Builds a [Library] containing typed sealed union classes for all
  /// non-scalar sealed union aliases (struct-based: struct+list,
  /// struct+struct).
  ///
  /// Sealed subclass naming: `${AliasName}\$${VariantSuffix}` — the `\$` acts
  /// as a separator and prevents name conflicts with generated struct classes.
  Library buildUnions() => _buildUnionLibrary(
    _sealedUnionNames.difference(_scalarUnionNames),
    isScalar: false,
  );

  /// Builds a [Library] containing extension types for union members,
  /// including both named sealed unions and inline anonymous unions.
  Library _buildUnionLibrary(
    Iterable<String> unionNames, {
    required bool isScalar,
  }) {
    final specs = <Spec>[];
    final referencedTypes = <ResolvedType>[];

    for (final name in unionNames) {
      final alias = _resolved.aliases.firstWhere((a) => a.name == name);
      final ut = alias.type as UnionType;
      final includeImports = !isScalar;
      specs.add(
        _buildExtensionTypeUnion(
          name,
          ut,
          deprecated: alias.deprecated,
          docs: _docLines(
            alias.documentation,
            since: alias.since,
            proposed: alias.proposed,
          ),
        ),
      );
      if (includeImports) {
        referencedTypes.addAll(ut.items);
      }
    }

    for (final entry in _inlineUnions.entries) {
      final name = entry.key;
      final ut = entry.value;
      final kind = _ctx.classifyUnion(ut);
      final matchesKind = isScalar ? kind == .scalar : kind != .scalar;
      if (matchesKind) {
        specs.add(
          _buildExtensionTypeUnion(
            name,
            ut,
            docs: _docLines('Inline union: $name.'),
          ),
        );
        if (!isScalar) {
          referencedTypes.addAll(ut.items);
        }
      }
    }

    return .new(
      (b) => b
        ..comments.addAll([
          _header,
          if (!isScalar) ...[
            'ignore_for_file: lines_longer_than_80_chars',
            'ignore_for_file: deprecated_consistency',
            'ignore_for_file: deprecated_member_use_from_same_package',
          ],
        ])
        ..directives.addAll(
          isScalar ? [] : _crossImports(referencedTypes, Files.unions),
        )
        ..body.addAll(specs),
    );
  }

  /// Returns [Directive.import] entries for types from a different output file.
  ///
  /// Walks [types] recursively; skips [currentFile] (no self-import).
  Iterable<Directive> _crossImports(
    Iterable<ResolvedType> types,
    String currentFile,
  ) {
    final needed = <String>{};

    void walk(ResolvedType type) {
      switch (type) {
        case ClassType():
          needed.add(Files.structures);
        case EnumType():
          needed.add(Files.enumerations);
        case AliasType(:final ref) when _scalarUnionNames.contains(ref.name):
          needed.add(Files.scalarUnions);
        case AliasType(:final ref) when _sealedUnionNames.contains(ref.name):
          needed.add(Files.unions);
        case AliasType():
          needed.add(Files.aliases);
        case ListType(:final element):
          walk(element);
        case MapType(:final key, :final value):
          walk(key);
          walk(value);
        case NullableType(:final inner):
          walk(inner);
        case InlineRecord(:final fields):
          for (final f in fields) {
            walk(f.type);
          }
        default:
      }
    }

    types.forEach(walk);
    needed.remove(currentFile); // no self-import

    // Preserve stable output order.
    return [
      for (final f in [
        Files.structures,
        Files.enumerations,
        Files.aliases,
        Files.scalarUnions,
        Files.unions,
      ])
        if (needed.contains(f)) Directive.import(f),
    ];
  }

  /// Returns a human-readable label for a [MessageDirection].
  String _directionLabel(MessageDirection d) => switch (d) {
    .clientToServer => 'client to server',
    .serverToClient => 'server to client',
    .both => 'both directions',
  };

  // Documentation helpers

  /// Formats a documentation string into `/// ` doc-comment lines.
  ///
  /// Resolves JSDoc `{@link Target}` and `{@link Target displayText}` to Dart
  /// cross-reference syntax:
  /// * `{@link Foo}` → `[Foo]`
  /// * `{@link Foo.bar}` → `[Foo.bar]`
  /// * `{@link Foo.bar name}` → `[name]` when *name* is a valid identifier,
  ///   otherwise `[Foo]` (type part only).
  ///
  /// When [since] is non-null, appends `/// @since X` after the main body (or
  /// emits it alone when [input] is blank). [proposed] appends `/// @proposed`
  /// similarly.
  ///
  /// Lines are word-wrapped at [maxWidth] characters. Returns an empty list
  /// when [input] is null or blank and neither [since] nor [proposed] are set.
  List<String> _docLines(
    String? input, {
    int maxWidth = 80,
    int indent = 0,
    String? since,
    bool proposed = false,
    List<String> extra = const [],
  }) {
    final tags = [
      if (since != null) '/// @since $since',
      if (proposed) '/// @proposed',
    ];

    final body = (input ?? '')
        .replaceAll(RegExp(r'\s*@since\s+.*?(?=\n|$)'), '')
        .replaceAll(RegExp(r'\s*@proposed\s*.*?(?=\n|$)'), '')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .trim();

    if (body.isEmpty) {
      return tags;
    }

    const prefix = '/// ';
    final maxContent = maxWidth - prefix.length - indent;

    final resolved = body.replaceAllMapped(
      RegExp(r'\{@link\s+(\S+?)(?:\s+([^}]*?))?\}'),
      (m) {
        final target = m.group(1)!.replaceAll('[]', '');
        final rawDisplay = m.group(2)?.replaceAll('`', '').trim() ?? '';
        if (rawDisplay.isEmpty) {
          return '`$target`';
        }
        if (RegExp(r'^\w+$').hasMatch(rawDisplay)) {
          return '`$rawDisplay`';
        }
        return '`${target.split('.').first}`';
      },
    );

    final paragraphs = resolved
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .split(RegExp(r'\n\s*\n'))
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList(growable: false);

    final lines = <String>[];
    for (final paragraph in paragraphs) {
      _wrapParagraph(paragraph, lines, prefix, maxContent);
    }

    if (extra.isNotEmpty) {
      for (final paragraph in extra) {
        _wrapParagraph(paragraph, lines, prefix, maxContent);
      }
    }

    if (tags.isNotEmpty) {
      lines
        ..add('///')
        ..addAll(tags);
    }
    return lines;
  }

  /// Word-wraps [paragraph] and appends the result to [lines] using [prefix]
  /// with maximum content width [maxContent].
  void _wrapParagraph(
    String paragraph,
    List<String> lines,
    String prefix,
    int maxContent,
  ) {
    if (lines.isNotEmpty) {
      lines.add('///');
    }
    final words = paragraph.replaceAll('\n', ' ').split(RegExp(r'\s+'));
    final buf = StringBuffer();
    for (final word in words) {
      if (buf.isEmpty) {
        buf.write(word);
      } else if (buf.length + 1 + word.length <= maxContent) {
        buf
          ..write(' ')
          ..write(word);
      } else {
        lines.add('$prefix$buf');
        buf
          ..clear()
          ..write(word);
      }
    }
    if (buf.isNotEmpty) {
      lines.add('$prefix$buf');
    }
  }

  /// If [type] is an inline [UnionType] (i.e. not a named alias), returns a
  /// one-line note listing the variant names, e.g.
  /// `['Type: TextDocumentSyncOptions | TextDocumentSyncKind']`.
  /// Returns an empty list for all other types.
  List<String> _inlineUnionNote(ResolvedType type) {
    if (type.nonNull case UnionType(:final items)) {
      return [
        'Type: ${items.map(
          (e) => '`${ResolvedTypeCodegenX.dartTypeName(e)}`',
        ).join(' | ')}',
      ];
    }
    return const [];
  }

  /// Returns the type reference for a [ResolvedProperty], handling inline
  /// union types by generating a named union type reference.
  Reference _propertyTypeRef(String className, ResolvedProperty p) {
    final inlineUnionName = _getInlineUnionName(className, p.name, p.type);
    if (inlineUnionName != null) {
      final actualType = p.type.nonNull;
      final isNullable = p.optional || p.type is NullableType;

      if (actualType case ListType()) {
        return TypeReference(
          (b) => b
            ..symbol = 'List'
            ..types.add(refer(inlineUnionName))
            ..isNullable = isNullable,
        );
      } else {
        return TypeReference(
          (b) => b
            ..symbol = inlineUnionName
            ..isNullable = isNullable,
        );
      }
    }

    return toRef(p.type, nullable: p.optional);
  }

  /// Returns the unique name of an inline union type for field [propName]
  /// of class [className], if it is indeed an inline union.
  String? _getInlineUnionName(
    String className,
    String propName,
    ResolvedType type,
  ) => switch (type.nonNull) {
    UnionType() => '$className${capitalize(propName)}',
    ListType(:final element) => switch (element.nonNull) {
      UnionType() => '$className${capitalize(propName)}Item',
      _ => null,
    },
    _ => null,
  };

  /// Traverse all classes and collect all unique inline union types.
  Map<String, UnionType> _computeInlineUnions() {
    final result = <String, UnionType>{};
    for (final cls in _resolved.classes) {
      for (final prop in _allProperties(cls)) {
        final name = _getInlineUnionName(cls.name, prop.name, prop.type);

        if (name != null) {
          final inner = prop.type.nonNull;

          if (inner case UnionType()) {
            result[name] = inner;
          } else if (inner case ListType(:final element)) {
            final innerType = element.nonNull;
            if (innerType case UnionType()) {
              result[name] = innerType;
            }
          }
        }
      }
    }

    // Synthesize union types for request inline union results
    for (final req in _resolved.requests) {
      final resType = req.result;

      if (isRequestResultUnion(resType)) {
        final unionType = resType!.nonNull as UnionType;
        final unionName = requestResultUnionName(req.method);
        result[unionName] = unionType;
      }
    }

    return result;
  }
}
