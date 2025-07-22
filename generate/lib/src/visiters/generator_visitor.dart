// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';

import '../generator_helper.dart';
import '../meta/protocol.dart';
import '../symbols/sealed_map.dart';
import 'type_resolver_visitor.dart';
import 'visitor.dart';

/// A concrete visitor that generates Dart code from MetaProtocol.
final class GeneratorVisitor implements MetaProtocolVisitor<Spec> {
  // Pass protocol for initial setup, but main logic is in visit methods
  GeneratorVisitor(MetaProtocol protocol)
    : _structures = Map.fromEntries(
        protocol.structures.map((s) => MapEntry(s.name, s)),
      ),
      _enumerations = Map.fromEntries(
        protocol.enumerations.map((e) => MapEntry(e.name, e)),
      ) {
    _sealedMap = SealedMap();
    _sealedMap.processProtocol(protocol);

    _typeResolverVisitor = TypeResolverVisitor(
      sealedMap: _sealedMap,
    );
  }

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;

  late final TypeResolverVisitor _typeResolverVisitor;
  late final SealedMap _sealedMap;


  @override
  Library visitProtocol(MetaProtocol protocol) => Library(
    (b) {

      for (final structure in protocol.structures) {
        b.body.add(visitStructure(structure));
      }
    },
  );

  @override
  TypeDef visitTypeAlias(MetaTypeAlias typeAlias) {
    throw UnimplementedError();
  }

  @override
  Class visitStructure(MetaStructure structure) {
    throw UnimplementedError();
  }

  @override
  Enum visitEnumeration(MetaEnumeration enumeration) {
    throw UnimplementedError();
  }

  @override
  Spec visitNotification(MetaNotification notification) => const CodeExpression(
    Code('// MetaNotification visitor not implemented for generation\n'),
  );

  @override
  Spec visitMetaData(MetaData metaData) => const CodeExpression(
    Code('// MetaData visitor not implemented for generation'),
  );

  @override
  Spec visitRequest(MetaRequest request) {
    throw UnimplementedError(
      'MetaRequest visitor not implemented for generation: ${request.method}',
    );
  }

  @override
  Spec visitProperty(MetaProperty property) => const CodeExpression(
    Code('// MetaProperty visitor not implemented for generation\n'),
  );

  @override
  Spec visitEnumMember(MetaEnumMember enumMember) => const CodeExpression(
    Code('// MetaEnumMember visitor not implemented for generation\n'),
  );

  @override
  Class visitLiteral(MetaLiteral literal) => throw UnimplementedError();
}

/// The main entry point for the protocol generation.
/// Orchestrates the visitation process.
class ProtocolGenerator {
  ProtocolGenerator(this.protocol);

  final MetaProtocol protocol;

  String generate() {
    final generatorVisitor = GeneratorVisitor(protocol);
    // Start the visitation process from the root MetaProtocol object
    final library = protocol.accept(generatorVisitor) as Library;
    final result = specToCode(library);

    return result;
  }
}
