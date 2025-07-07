import '../meta/protocol.dart';

final class Symbols {
  Symbols()
    : _structures = {},
      _enumerations = {},
      _literals = {},
      _orMapReferences = {};

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;
  final Map<String, MetaLiteralDefinition> _literals;
  final Map<String, OrMapReference> _orMapReferences;

  void processProtocol(MetaProtocol protocol) {
    _collectLiterals(protocol);
  }

  void _collectLiterals(MetaProtocol protocol) {}
}
