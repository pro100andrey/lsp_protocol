import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';

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
