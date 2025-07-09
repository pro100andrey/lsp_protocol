import '../meta/protocol.dart';

extension MetaReferenceExtensions on MetaReference {
  void on<T extends MetaReference>(
    void Function(T ref) callback,
  ) {
    if (this is T) {
      callback(this as T);
    }
  }

  void onLiteralRef(
    void Function(LiteralRef ref) callback,
  ) => on<LiteralRef>(callback);

  void onTypeRef(
    void Function(TypeRef ref) callback,
  ) => on<TypeRef>(callback);
  void onArrayRef(
    void Function(ArrayRef ref) callback,
  ) => on<ArrayRef>(callback);

  void onBaseRef(
    void Function(BaseRef ref) callback,
  ) => on<BaseRef>(callback);

  void onOrRef(
    void Function(OrRef ref) callback,
  ) => on<OrRef>(callback);

  void onAndRef(
    void Function(AndRef ref) callback,
  ) => on<AndRef>(callback);

  void onMapRef(
    void Function(MapRef ref) callback,
  ) => on<MapRef>(callback);

  void onTupleRef(
    void Function(TupleRef ref) callback,
  ) => on<TupleRef>(callback);

  void onStringLiteralRef(
    void Function(StringLiteralRef ref) callback,
  ) => on<StringLiteralRef>(callback);
}
