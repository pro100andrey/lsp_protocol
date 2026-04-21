import 'dart:io';

import 'package:dar/dar.dart';

import '../../common.dart';

final class RunBuildRunnerAction extends BaseAction {
  @override
  Future<AppState?> reduce() async {
    final outputDir = select.resolvedOutputDir;
    final progress = logger.progress('Running build_runner in $outputDir...');

    final result = await Process.run(
      'dart',
      ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      workingDirectory: outputDir,
    );

    if (result.exitCode == 0) {
      progress.complete('build_runner completed successfully');
      final out = (result.stdout as String).trim();
      if (out.isNotEmpty) {
        logger.detail(out);
      }
    } else {
      progress.fail('build_runner failed (exit ${result.exitCode})');
      final err = (result.stderr as String).trim();
      if (err.isNotEmpty) {
        logger.err(err);
      }
      throw UserException(
      'build_runner exited with code ${result.exitCode}.',
        reason: err.isNotEmpty ? err : 'See output above.',
        code: result.exitCode,
      );
    }

    return null;
  }
}
