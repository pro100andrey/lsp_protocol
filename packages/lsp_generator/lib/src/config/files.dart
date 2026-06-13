import 'dart:io';

import 'package:path/path.dart' as p;

/// File name constants for all generated output files.
class Files {
  // ---------------------------------------------------------------------------
  // Model files
  // ---------------------------------------------------------------------------

  static const structures = 'structures.dart';
  static const structuresCapabilities = 'structures.capabilities.dart';
  static const structuresParams = 'structures.params.dart';
  static const structuresCommon = 'structures.common.dart';
  static const enumerations = 'enumerations.dart';
  static const aliases = 'type_aliases.dart';
  static const scalarUnions = 'scalar_unions.dart';
  static const unions = 'unions.dart';
  static const methods = 'methods.dart';

  // ---------------------------------------------------------------------------
  // Part files
  // ---------------------------------------------------------------------------

  static const structuresFreezed = 'structures.freezed.dart';
  static const structuresG = 'structures.g.dart';
  static const enumerationsG = 'enumerations.g.dart';
  static const methodsG = 'methods.g.dart';

  // ---------------------------------------------------------------------------
  // Server API
  // ---------------------------------------------------------------------------

  static const serverApi = 'server_api.dart';

  // ---------------------------------------------------------------------------
  // Client API
  // ---------------------------------------------------------------------------

  static const clientApi = 'client_api.dart';
}

/// Extension on [Directory] that provides paths to generated output files.
///
/// Example:
/// ```dart
/// final outputDir = Directory('path/to/project');
/// outputDir.modelsDir.createSync(recursive: true);
/// outputDir.structuresFile.writeAsStringSync(source);
/// ```
extension GeneratedPaths on Directory {
  // ---------------------------------------------------------------------------
  // Directories
  // ---------------------------------------------------------------------------

  Directory get libDir => Directory(p.join(path, 'lib'));

  Directory get modelsDir =>
      Directory(p.join(libDir.path, 'src', 'generated', 'models'));

  Directory get serverDir =>
      Directory(p.join(libDir.path, 'src', 'generated', 'server'));

  Directory get clientDir =>
      Directory(p.join(libDir.path, 'src', 'generated', 'client'));

  // ---------------------------------------------------------------------------
  // Model files
  // ---------------------------------------------------------------------------

  File get structuresFile => File(p.join(modelsDir.path, Files.structures));
  File get structuresCapabilitiesFile =>
      File(p.join(modelsDir.path, Files.structuresCapabilities));
  File get structuresParamsFile =>
      File(p.join(modelsDir.path, Files.structuresParams));
  File get structuresCommonFile =>
      File(p.join(modelsDir.path, Files.structuresCommon));
  File get enumerationsFile => File(p.join(modelsDir.path, Files.enumerations));
  File get aliasesFile => File(p.join(modelsDir.path, Files.aliases));
  File get scalarUnionsFile => File(p.join(modelsDir.path, Files.scalarUnions));
  File get unionsFile => File(p.join(modelsDir.path, Files.unions));
  File get methodsFile => File(p.join(modelsDir.path, Files.methods));

  // ---------------------------------------------------------------------------
  // Server API
  // ---------------------------------------------------------------------------

  File get serverApiFile => File(p.join(serverDir.path, Files.serverApi));

  // ---------------------------------------------------------------------------
  // Client API
  // ---------------------------------------------------------------------------

  File get clientApiFile => File(p.join(clientDir.path, Files.clientApi));

  // ---------------------------------------------------------------------------
  // Barrel file
  // ---------------------------------------------------------------------------

  /// Package name extracted from the last path segment.
  String get packageName => p.basename(path);

  /// `outputDir/lib/<packageName>.dart`
  File get barrelFile => File(p.join(libDir.path, '$packageName.dart'));

  /// Relative export path for a model file: `src/generated/models/<fileName>`.
  static String modelExport(String fileName) =>
      p.join('src', 'generated', 'models', fileName);

  /// Relative export path for a server API file: `src/generated/server/<fileName>`.
  static String serverApiExport(String fileName) =>
      p.join('src', 'generated', 'server', fileName);

  /// Relative export path for a client API file: `src/generated/client/<fileName>`.
  static String clientApiExport(String fileName) =>
      p.join('src', 'generated', 'client', fileName);
}
