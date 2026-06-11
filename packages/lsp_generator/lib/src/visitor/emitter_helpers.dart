import 'package:code_builder/code_builder.dart';
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

/// Extension providing utility methods for building code blocks.
extension BlockBuilderExtensions on BlockBuilder {
  /// Adds an empty line to the code block for better readability.
  ///
  /// This is useful for separating logical sections of generated code.
  void addEmptyLine() => statements.add(const Code(''));
}
