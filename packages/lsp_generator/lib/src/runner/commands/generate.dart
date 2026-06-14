import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import '../../emitter/generate_code.dart';
import '../../emitter/run_process.dart';
import '../../generator/resolver.dart';
import '../../network/fetch_lsp_license.dart';
import '../../network/fetch_lsp_model.dart';

/// CLI command that generates LSP code by fetching the meta-model,
/// resolving types, generating code, and running build_runner.
final class GenerateCommand extends Command<dynamic> {
  GenerateCommand({required this.logger}) {
    argParser.addOption(
      'output',
      abbr: 'o',
      help:
          'Output directory for generated files. '
          'Defaults to packages/pro_lsp.',
    );
  }

  @override
  final name = 'generate';

  @override
  final description = 'Generates code for the Language Server Protocol (LSP).';

  final Logger logger;

  /// Executes the full code generation pipeline:
  /// 1. Fetches the LSP meta-model and license
  /// 2. Resolves the model
  /// 3. Generates code
  /// 4. Runs build_runner and analyzer
  @override
  Future<void> run() async {
    final outputPath = argResults?['output'] as String? ?? 'packages/pro_lsp';

    final modelFuture = fetchLSPModel(outputPath, logger);
    final licenseFuture = fetchLSPLicense(outputPath, logger);

    final metaProtocol = await modelFuture;
    final resolved = ModelResolver().resolve(metaProtocol);
    generateCode(resolved, outputPath);

    await licenseFuture;

    await runBuildRunner(outputPath, logger);
    await runAnalyzer(outputPath, logger);
  }
}
