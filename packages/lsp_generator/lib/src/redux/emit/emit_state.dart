/// Emit state — holds the generated source strings for each output file.
final class EmitState {
  const EmitState({
    required this.structures,
    required this.enumerations,
    required this.aliases,
    required this.scalarUnions,
    required this.unions,
    required this.methods,
  });

  final String structures;
  final String enumerations;
  final String aliases;
  final String scalarUnions;
  final String unions;
  final String methods;
}
