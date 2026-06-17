import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';

import '../models/resolved_type.dart';
import 'type_ref_helpers.dart';

/// Adds helpers that complement [Expression] from `code_builder`.
extension ExpressionX on Expression {
  /// Returns `this as [type]` **without** wrapping parentheses.
  ///
  /// Use instead of [Expression.asA] when the cast is a terminal expression
  /// (record field, return value, argument) and parentheses are unnecessary.
  /// Keep using [Expression.asA] when chaining further (`.property()`, etc.).
  Expression bareAsA(Expression type) {
    final e = DartEmitter();

    return CodeExpression(
      .new('${accept(e)} as ${type.accept(e)}'),
    );
  }
}

/// Generates an if-else statement as code.
///
/// Creates a code block with the given [condition], executing [ifBlock] when
/// true and optionally [elseBlock] when false.
///
/// This is a utility function for generating conditional code when using
/// code_builder, as it doesn't provide a built-in if-else construct.
Code ifStatement(Expression condition, Block ifBlock, [Block? elseBlock]) {
  final emitter = DartEmitter();
  final conditionV = condition.accept(emitter);
  final ifBlockV = ifBlock.accept(emitter);
  final elseBlockV = elseBlock?.accept(emitter);

  final ifElse =
      'if($conditionV){$ifBlockV}'
      '${elseBlockV != null ? 'else {$elseBlockV}' : ''}';

  return .new(ifElse);
}

/// A wrapper around [Reference] that guarantees a non-null symbol.
///
/// This extension type provides convenient access to the symbol property
/// without null checks, as it's guaranteed to be non-null when constructed
/// through the provided extensions.
extension type const Ref._(Reference ref) implements Reference {
  /// Returns the non-null symbol from the underlying [Reference].
  @redeclare
  String get symbol => ref.symbol!;
}

/// Extension providing shortcut methods for creating references from strings.
extension StringRef on String {
  /// Creates a [Ref] from this string as a symbol reference.
  ///
  /// Example:
  /// ```dart
  /// 'MyClass'.ref // Ref to MyClass
  /// ```
  Ref get ref => Ref._(Reference(this));

  /// Creates a [Ref] representing a type reference.
  ///
  /// Example:
  /// ```dart
  /// 'String'.typeRef() // String
  /// 'int'.typeRef(isNullable: true) // int?
  /// ```
  Ref typeRef({bool isNullable = false}) => Ref._(
    TypeReference(
      (b) => b
        ..isNullable = isNullable
        ..symbol = this,
    ),
  );
}

/// Formats and emits a [Library] as a string.
String formatLibrary(Library lib) {
  final emitter = DartEmitter.scoped(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  final formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  );

  return formatter.format(lib.accept(emitter).toString());
}

/// Formats and emits a [Library] as a string, falling back to unformatted
/// output if the formatter fails.
String emitLibrary(Library lib) {
  try {
    return formatLibrary(lib);
  } on Object catch (e) {
    // Formatting usually only fails when the emitted source has a syntax the
    // formatter rejects — exactly the case worth knowing about. Still emit the
    // unformatted output so it can be inspected, but don't hide the failure.
    stderr.writeln(
      'warning: dart_style failed to format a generated library; emitting '
      'unformatted output. Cause: $e',
    );
    final emitter = DartEmitter.scoped(
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    return '${lib.accept(emitter)}';
  }
}

/// Set of names that must not be used as bare identifiers in generated code.
///
/// Contains every Dart *reserved word* — these are compile errors in any
/// identifier position, so an LSP member or property with such a name must be
/// escaped (e.g. `in`, `is`, `default`, `void`).
///
/// It also retains the built-in identifiers that occur as real LSP enum values
/// (`static`, `abstract`, `async`, `interface`, `operator` — used by
/// `SemanticTokenTypes`/`SemanticTokenModifiers`) and the `value`/`macro`
/// names that collide with freezed / json_serializable generation. These are
/// kept for API stability with the already-published generated output, even
/// though they are technically legal as member names.
const reservedDartKeywords = {
  // Dart reserved words — illegal as identifiers anywhere.
  'assert',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'default',
  'do',
  'else',
  'enum',
  'extends',
  'false',
  'final',
  'finally',
  'for',
  'if',
  'in',
  'is',
  'new',
  'null',
  'rethrow',
  'return',
  'super',
  'switch',
  'this',
  'throw',
  'true',
  'try',
  'var',
  'void',
  'while',
  'with',
  // Built-in identifiers that appear as LSP enum values — escaped historically;
  // kept for stability with the published generated output.
  'static',
  'abstract',
  'async',
  'interface',
  'operator',
  // Project-specific collisions with freezed / json_serializable generation.
  'value',
  'macro',
};

/// Ensures an identifier is valid Dart (avoids reserved words).
String safeIdentifier(String name) =>
    reservedDartKeywords.contains(name) ? '$name\$' : name;

/// Strips a leading `$` or `$/` prefix from an LSP method string.
String stripMethodPrefix(String method) => method.startsWith(r'$/')
    ? method.substring(2)
    : method.startsWith(r'$')
    ? method.substring(1)
    : method;

/// Converts an LSP method path segment to camelCase.
/// e.g. `'textDocument/didOpen'` → `'textDocumentDidOpen'`.
String toMethodCamelCase(String method) {
  final parts = stripMethodPrefix(method).split('/');
  return [
    parts.first,
    ...parts.skip(1).map((s) => s[0].toUpperCase() + s.substring(1)),
  ].join();
}

/// Maps each item in [items] to a unique Dart identifier derived from its
/// LSP method string (e.g. `textDocument/didOpen` → `didOpen`).
///
/// Uses the last path segment when it is unique across all items; falls back
/// to the full camelCase path on collisions.
Map<T, String> dartNames<T>(List<T> items, String Function(T) getMethod) {
  String lastSeg(String m) => stripMethodPrefix(m).split('/').last;

  final lastSegs = {for (final x in items) x: lastSeg(getMethod(x))};
  final counts = <String, int>{};
  for (final s in lastSegs.values) {
    counts[s] = (counts[s] ?? 0) + 1;
  }

  return {
    for (final x in items)
      x: safeIdentifier(
        counts[lastSegs[x]!]! > 1
            ? toMethodCamelCase(getMethod(x))
            : lastSegs[x]!,
      ),
  };
}

/// Extracts (namespace, dartMethodName) from a wire method string.
(String, String) namespacedMethod(String method) {
  final clean = stripMethodPrefix(method);
  final slashIdx = clean.indexOf('/');
  if (slashIdx == -1) {
    return ('general', safeIdentifier(clean));
  }

  final ns = clean.substring(0, slashIdx);
  final rest = clean.substring(slashIdx + 1);
  final parts = rest.split('/');
  final camelRest = [
    parts.first,
    ...parts.skip(1).map((s) => s[0].toUpperCase() + s.substring(1)),
  ].join();

  return (ns, safeIdentifier(camelRest));
}

/// Returns the synthesized union name for a request's inline union result.
String requestResultUnionName(String method) {
  final (_, dartName) = namespacedMethod(method);
  final capitalized = dartName[0].toUpperCase() + dartName.substring(1);

  return '${capitalized}Result';
}

/// Converts [name] to lower camelCase (e.g. `'myName'` → `'myName'`,
/// `'MyName'` → `'myName'`).
String toLowerCamelCase(String name) =>
    name.isEmpty ? name : name[0].toLowerCase() + name.substring(1);

/// Capitalizes the first character of [s] (e.g. `'myName'` → `'MyName'`).
String capitalize(String s) =>
    s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

/// Orders [items] so that required ones (per [isRequired]) come first,
/// followed by the rest, each group preserving its original relative order.
///
/// Mirrors the LSP convention of emitting required constructor parameters
/// before optional ones.
List<T> sortByRequired<T>(Iterable<T> items, bool Function(T) isRequired) => [
  ...items.where(isRequired),
  ...items.where((e) => !isRequired(e)),
];

/// Returns true if [result] represents a union type with multiple non-null
/// items, indicating a synthesized union result for a request.
bool isRequestResultUnion(ResolvedType? result) {
  if (result == null) {
    return false;
  }
  return result.nonNull is UnionType;
}
