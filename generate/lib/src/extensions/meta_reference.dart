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
    T Function(MetaReference ref)? orElse,
  }) {
    final ref = this;
    final result = switch (ref) {
      LiteralRef() => literalRef?.call(ref),
      TypeRef() => typeRef?.call(ref),
      ArrayRef() => arrayRef?.call(ref),
      BaseRef() => baseRef?.call(ref),
      OrRef() => orRef?.call(ref),
      AndRef() => andRef?.call(ref),
      MapRef() => mapRef?.call(ref),
      TupleRef() => tupleRef?.call(ref),
      StringLiteralRef() => stringLiteralRef?.call(ref),
    };

    if (result != null) {
      return result;
    } else if (orElse != null) {
      return orElse(this);
    } else {
      throw ArgumentError(
        'No matching case for ${ref.runtimeType}. '
        'Ensure you handle all cases or provide an orElse function.',
      );
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


extension LiteralRefExtensions on LiteralRef {
  void forEachProperty(
    void Function(MetaProperty prop) callback,
  ) {
    onLiteralRef((ref) => ref.value.properties.forEach(callback));
  }
}

extension OrRefExtensions on OrRef {
  void forEachItem(
    void Function(MetaReference ref) callback,
  ) {
    onOrRef((ref) => ref.items.forEach(callback));
  }
}
