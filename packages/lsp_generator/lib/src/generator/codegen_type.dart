import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import '../../lsp_generator.dart' show ResolveResult;
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import 'generator_helpers.dart';
import 'type_ref_helpers.dart';

/// Code generation utilities for working with resolved types, including
/// type checking, casting, and context management for the LSP protocol.
///
/// This library is split into three parts:
///  * `codegen_context.dart` — `CodegenContext` for union classification
///    and property resolution.
///  * `codegen_check.dart` — `ResolvedTypeCheckX` for generating type
///    guard expressions.
///  * `codegen_cast.dart` — `ResolvedTypeCodegenX` for generating cast
///    and conversion expressions.
part 'codegen_context.dart';
part 'codegen_check.dart';
part 'codegen_cast.dart';
