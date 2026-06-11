import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import '../../emitter/generate_code.dart';
import '../../emitter/generate_server_api.dart';
import '../../emitter/run_analyzer.dart';
import '../../emitter/run_build_runner.dart';
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
    final outputPath =
        argResults?['output'] as String? ?? 'packages/pro_lsp';
    const lspVersion = '3.17';

    await Future.wait([
      fetchLSPModel(lspVersion, outputPath, logger).then((metaProtocol) {
        final resolvedModel = resolveModel(metaProtocol);
        generateCode(resolvedModel, outputPath);
        generateServerApi(resolvedModel);
      }),
      fetchLSPLicense(lspVersion, outputPath, logger),
    ]);

    await runBuildRunner(outputPath, logger);
    await runAnalyzer(outputPath, logger);
  }
}
