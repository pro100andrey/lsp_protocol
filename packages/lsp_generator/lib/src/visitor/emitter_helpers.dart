import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';

/// Adds helpers that complement [Expression] from `code_builder`.
extension ExpressionX on Expression {
  /// Returns `this as [type]` **without** wrapping parentheses.
  ///
  /// Use instead of [Expression.asA] when the cast is a terminal expression
  /// (record field, return value, argument) and parentheses are unnecessary.
  /// Keep using [Expression.asA] when chaining further (`.property()`, etc.).
  Expression bareAsA(Expression type) {
    final e = DartEmitter();
    return CodeExpression(Code('${accept(e)} as ${type.accept(e)}'));
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

  return Code(ifElse);
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

/// Extension providing convenient property access for expressions.
extension ExpressionExtensions on Expression {
  /// Accesses a property on this expression.
  ///
  /// When [nullSafe] is `true`, uses null-safe property access (`?.`).
  /// Otherwise uses regular property access (`.`).
  ///
  /// Example:
  /// ```dart
  /// 'obj'.ref.prop('field') // obj.field
  /// 'obj'.ref.prop('field', nullSafe: true) // obj?.field
  /// ```
  BinaryExpression prop(String name, {bool nullSafe = false}) =>
      (nullSafe ? nullSafeProperty(name) : property(name)) as BinaryExpression;
}

// ---------------------------------------------------------------------------
// Common Type and Expression References
// ---------------------------------------------------------------------------

/// Common type references.
final tString = refer('String');
final tDynamic = refer('dynamic');
final tObject = refer('Object');
final tObjectNullable = refer('Object?');
final tBool = refer('bool');
final tVoid = refer('void');
final tNull = refer('Null');
final tList = refer('List');
final tLspConnection = refer('LspConnection');
final tMapStringDynamic = refer('Map<String, dynamic>');
final tMapSD = TypeReference(
  (b) => b
    ..symbol = 'Map'
    ..types.addAll([tString, tDynamic]),
);
final tJsonSerializable = refer('JsonSerializable');
final tJsonEnum = refer('JsonEnum');
final tDeprecated = refer('Deprecated');
final tFreezed = refer('freezed');

/// Common expression references.
final eJson = refer('json');
final eValue = refer('value');
final eConnection = refer('_connection');
final eParams = refer('params');

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

/// Formats and emits a [Library] as a string with standard
/// ignore_for_file header.
String emitLibrary(Library lib) {
  try {
    return '// ignore_for_file: type=lint\n\n${formatLibrary(lib)}';
  } on Object catch (_) {
    final emitter = DartEmitter.scoped(
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    return '// ignore_for_file: type=lint\n\n${lib.accept(emitter)}';
  }
}

/// Ensures an identifier is valid Dart (avoids reserved words).
String safeIdentifier(String name) {
  const reserved = {
    'class',
    'enum',
    'null',
    'void',
    'async',
    'await',
    'yield',
    'abstract',
    'interface',
    'operator',
    'static',
    'macro',
    'value',
  };

  return reserved.contains(name) ? '${name}_' : name;
}

/// Maps each item in [items] to a unique Dart identifier derived from its
/// LSP method string (e.g. `textDocument/didOpen` → `didOpen`).
///
/// Uses the last path segment when it is unique across all items; falls back
/// to the full camelCase path on collisions.
Map<T, String> dartNames<T>(List<T> items, String Function(T) getMethod) {
  String clean(String m) => m.startsWith(r'$/')
      ? m.substring(2)
      : m.startsWith(r'$')
      ? m.substring(1)
      : m;
  String lastSeg(String m) => clean(m).split('/').last;
  String camelCase(String m) {
    final parts = clean(m).split('/');
    return [
      parts.first,
      ...parts.skip(1).map((s) => s[0].toUpperCase() + s.substring(1)),
    ].join();
  }

  final lastSegs = {for (final x in items) x: lastSeg(getMethod(x))};
  final counts = <String, int>{};
  for (final s in lastSegs.values) {
    counts[s] = (counts[s] ?? 0) + 1;
  }
  return {
    for (final x in items)
      x: safeIdentifier(
        counts[lastSegs[x]!]! > 1 ? camelCase(getMethod(x)) : lastSegs[x]!,
      ),
  };
}

/// Extracts (namespace, dartMethodName) from a wire method string.
(String, String) namespacedMethod(String method) {
  final clean = method.startsWith(r'$/')
      ? method.substring(2)
      : method.startsWith(r'$')
      ? method.substring(1)
      : method;

  final slashIdx = clean.indexOf('/');
  if (slashIdx == -1) {
    return ('general', safeIdentifier(clean));
  }

  final ns = clean.substring(0, slashIdx);
  final rest = clean.substring(slashIdx + 1);
  final parts = rest.split('/');
  final camel = [
    parts.first,
    ...parts.skip(1).map((s) => s[0].toUpperCase() + s.substring(1)),
  ].join();

  return (ns, safeIdentifier(camel));
}

/// Returns the synthesized union name for a request's inline union result.
String requestResultUnionName(String method) {
  final (_, dartName) = namespacedMethod(method);
  final capitalized = dartName[0].toUpperCase() + dartName.substring(1);
  return '${capitalized}Result';
}
