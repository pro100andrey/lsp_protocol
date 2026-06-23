import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import '../../lsp_generator.dart' show ResolveResult;
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import 'generator_helpers.dart';
import 'property_resolver.dart';
import 'type_ref_helpers.dart';
import 'union_classifier.dart';

export 'property_resolver.dart' show PropertyResolver;
export 'union_classifier.dart'
    show CodegenUnionCheck, CodegenUnionKind, UnionClassifier;

/// Code generation utilities for working with resolved types, including
/// type checking, casting, and context management for the LSP protocol.
///
/// This library is split into three parts:
///  * `codegen_context.dart` — `CodegenContext`, the composition root that
///    indexes the model and delegates to [PropertyResolver] and
///    [UnionClassifier].
///  * `codegen_check.dart` — `ResolvedTypeCheckX` for generating type
///    guard expressions.
///  * `codegen_cast.dart` — `ResolvedTypeCodegenX` for generating cast
///    and conversion expressions.
part 'codegen_context.dart';
part 'codegen_check.dart';
part 'codegen_cast.dart';
