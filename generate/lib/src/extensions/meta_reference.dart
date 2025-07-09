import '../meta/protocol.dart';

extension MetaReferenceExtensions on MetaReference {
  void on<T extends MetaReference>(
    void Function(T ref) callback,
  ) {
    if (this is T) {
      callback(this as T);
    }
  }

  // When using this extension, you can call the specific on methods

  T when<T>({
    T Function(LiteralRef ref)? literalRef,
    T Function(TypeRef ref)? typeRef,
    T Function(ArrayRef ref)? arrayRef,
    T Function(BaseRef ref)? baseRef,
    T Function(OrRef ref)? orRef,
    T Function(AndRef ref)? andRef,
    T Function(MapRef ref)? mapRef,
    T Function(TupleRef ref)? tupleRef,
    T Function(StringLiteralRef ref)? stringLiteralRef,
  }) {
    final ref = this;
    return switch (ref) {
      LiteralRef() => literalRef?.call(ref) as T,
      TypeRef() => typeRef?.call(ref) as T,
      ArrayRef() => arrayRef?.call(ref) as T,
      BaseRef() => baseRef?.call(ref) as T,
      OrRef() => orRef?.call(ref) as T,
      AndRef() => andRef?.call(ref) as T,
      MapRef() => mapRef?.call(ref) as T,
      TupleRef() => tupleRef?.call(ref) as T,
      StringLiteralRef() => stringLiteralRef?.call(ref) as T,
    };
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
