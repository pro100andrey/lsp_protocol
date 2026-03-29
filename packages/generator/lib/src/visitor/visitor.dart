import '../meta/protocol.dart';

/// Visitor interface for all MetaProtocol model types.
abstract interface class MetaProtocolVisitor<T> {
  // ---- Top-level protocol sections ----------------------------------------

  T visitMetaData(MetaData data);
  T visitMetaRequest(MetaRequest request);
  T visitMetaNotification(MetaNotification notification);
  T visitMetaEnumeration(MetaEnumeration enumeration);
  T visitMetaTypeAlias(MetaTypeAlias typeAlias);
  T visitMetaStructure(MetaStructure structure);

  // ---- Supporting types ---------------------------------------------------

  T visitMetaProperty(MetaProperty property);
  T visitMetaEnumMember(MetaEnumMember member);
  T visitMetaLiteral(MetaLiteral literal);

  // ---- MetaReference variants ---------------------------------------------

  T visitTypeRef(TypeRef ref);
  T visitArrayRef(ArrayRef ref);
  T visitBaseRef(BaseRef ref);
  T visitOrRef(OrRef ref);
  T visitAndRef(AndRef ref);
  T visitMapRef(MapRef ref);
  T visitLiteralRef(LiteralRef ref);
  T visitStringLiteralRef(StringLiteralRef ref);
  T visitTupleRef(TupleRef ref);
}

/// Dispatches a [MetaReference] to the appropriate visitor method.
extension MetaReferenceAccept on MetaReference {
  T accept<T>(MetaProtocolVisitor<T> visitor) => switch (this) {
    final TypeRef r => visitor.visitTypeRef(r),
    final ArrayRef r => visitor.visitArrayRef(r),
    final BaseRef r => visitor.visitBaseRef(r),
    final OrRef r => visitor.visitOrRef(r),
    final AndRef r => visitor.visitAndRef(r),
    final MapRef r => visitor.visitMapRef(r),
    final LiteralRef r => visitor.visitLiteralRef(r),
    final StringLiteralRef r => visitor.visitStringLiteralRef(r),
    final TupleRef r => visitor.visitTupleRef(r),
  };
}
