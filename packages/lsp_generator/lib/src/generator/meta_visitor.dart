import '../models/protocol.dart';

/// Abstract base visitor for the [MetaProtocol] tree.
///
/// All structural methods recursively walk their children by default.
/// Leaf methods ([visitTypeRef], [visitBaseRef], [visitStringLiteralRef],
/// [visitEnumMember]) are no-ops by default.
///
/// Subclasses override only the hooks they need.
abstract class MetaVisitor {
  /// Entry point. Delegates to [visitProtocol].
  void run(MetaProtocol protocol) => visitProtocol(protocol);

  // Top-level hook

  /// Visits all top-level protocol elements: structures, enumerations,
  /// type aliases, requests, and notifications.
  void visitProtocol(MetaProtocol protocol) {
    protocol.structures.forEach(visitStructure);
    protocol.enumerations.forEach(visitEnumeration);
    protocol.typeAliases.forEach(visitTypeAlias);
    protocol.requests.forEach(visitRequest);
    protocol.notifications.forEach(visitNotification);
  }

  // Declaration hooks

  /// Visits all properties, base classes, and mixins of a [structure].
  void visitStructure(MetaStructure structure) {
    structure.properties.forEach(visitProperty);
    structure.extends$.forEach(visitRef);
    structure.mixins$.forEach(visitRef);
  }

  /// Visits the type and values of an [enumeration].
  void visitEnumeration(MetaEnumeration enumeration) {
    visitRef(enumeration.type);
    enumeration.values.forEach(visitEnumMember);
  }

  /// Visits the underlying type of a [typeAlias].
  void visitTypeAlias(MetaTypeAlias typeAlias) {
    visitRef(typeAlias.type);
  }

  /// Visits all components of a [request]: params, result, partial result,
  /// registration options, and error data.
  void visitRequest(MetaRequest request) {
    final params = request.params;
    if (params != null) {
      visitRef(params);
    }

    final result = request.result;
    if (result != null) {
      visitRef(result);
    }

    final partial = request.partialResult;
    if (partial != null) {
      visitRef(partial);
    }

    final regOpts = request.registrationOptions;
    if (regOpts != null) {
      visitRef(regOpts);
    }

    final errorData = request.errorData;
    if (errorData != null) {
      visitRef(errorData);
    }
  }

  /// Visits all components of a [notification]: params and
  /// registration options.
  void visitNotification(MetaNotification notification) {
    final params = notification.params;
    if (params != null) {
      visitRef(params);
    }

    final regOpts = notification.registrationOptions;
    if (regOpts != null) {
      visitRef(regOpts);
    }
  }

  // Property hook

  /// Visits the type of a [property].
  void visitProperty(MetaProperty property) {
    visitRef(property.type);
  }

  // Reference dispatcher — sealed switch ensures exhaustiveness

  /// Dispatches to the appropriate type-specific visitor method based on
  /// the concrete [ref] type.
  void visitRef(MetaReference ref) {
    switch (ref) {
      case TypeRef():
        visitTypeRef(ref);
      case BaseRef():
        visitBaseRef(ref);
      case ArrayRef():
        visitArrayRef(ref);
      case OrRef():
        visitOrRef(ref);
      case AndRef():
        visitAndRef(ref);
      case MapRef():
        visitMapRef(ref);
      case LiteralRef():
        visitLiteralRef(ref);
      case StringLiteralRef():
        visitStringLiteralRef(ref);
      case TupleRef():
        visitTupleRef(ref);
    }
  }

  // Structural reference hooks

  /// Visits the element type of an [ArrayRef].
  void visitArrayRef(ArrayRef ref) {
    visitRef(ref.element);
  }

  /// Visits all items of an [OrRef] (union type).
  void visitOrRef(OrRef ref) {
    ref.items.forEach(visitRef);
  }

  /// Visits all items of an [AndRef] (intersection type).
  void visitAndRef(AndRef ref) {
    ref.items.forEach(visitRef);
  }

  /// Visits both the key and value types of a [MapRef].
  void visitMapRef(MapRef ref) {
    visitRef(ref.key);
    visitRef(ref.value);
  }

  /// Visits all items of a [TupleRef].
  void visitTupleRef(TupleRef ref) {
    ref.items.forEach(visitRef);
  }

  /// Visits the value of a [LiteralRef].
  void visitLiteralRef(LiteralRef ref) {
    visitLiteral(ref.value);
  }

  /// Visits all properties of a [literal].
  void visitLiteral(MetaLiteral literal) {
    literal.properties.forEach(visitProperty);
  }

  // Leaf hooks — no-op by default

  void visitTypeRef(TypeRef ref) {}

  void visitBaseRef(BaseRef ref) {}

  void visitStringLiteralRef(StringLiteralRef ref) {}

  void visitEnumMember(MetaEnumMember member) {}
}
