import '../meta/protocol.dart';

abstract class MetaReferenceVisitor<T> {
  const MetaReferenceVisitor();

  // Methods for visiting MetaReference types
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

abstract class MetaProtocolVisitor<T>  {
  const MetaProtocolVisitor();

  T visitProtocol(MetaProtocol protocol);
  T visitMetaData(MetaData metaData);
  T visitRequest(MetaRequest request);
  T visitNotification(MetaNotification notification);
  T visitStructure(MetaStructure structure);
  T visitEnumeration(MetaEnumeration enumeration);
  T visitTypeAlias(MetaTypeAlias typeAlias);

  T visitProperty(MetaProperty property);
  T visitEnumMember(MetaEnumMember enumMember);
  T visitLiteral(MetaLiteral literal);
}
