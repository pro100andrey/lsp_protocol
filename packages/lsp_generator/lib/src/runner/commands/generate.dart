import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import '../../emitter/generate_code.dart';
import '../../emitter/run_process.dart';
import '../../network/fetch_lsp_license.dart';
import '../../network/fetch_lsp_model.dart';
import '../../resolver/resolve_model.dart';

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

  @override
  Future<void> run() async {
    final outputPath = argResults?['output'] as String? ?? 'packages/pro_lsp';

    final modelFuture = fetchLSPModel(outputPath, logger);
    final licenseFuture = fetchLSPLicense(outputPath, logger);

    final metaProtocol = await modelFuture;
    final resolvedModel = resolveModel(metaProtocol);
    generateCode(resolvedModel, outputPath);

    await licenseFuture;

    await runBuildRunner(outputPath, logger);
    await runAnalyzer(outputPath, logger);
  }
}
