import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

/// A record type that caches various path-related computations to avoid
/// repeated file system operations and path manipulations.
typedef PathCache = ({
  String path,
  bool isFile,
  bool isDirectory,
  bool isLink,
  bool isAbsolute,
  bool isRelative,
  bool notFound,
  String normalized,
  String canonicalized,
  String absolute,
  String relative,
  String dirname,
  String basename,
  String ext,
});

/// Creates a [PathCache] record for the given [path] by computing all
/// path-related properties once and caching them.
PathCache _getPathCache(String path) {
  final type = FileSystemEntity.typeSync(path);
  return (
    path: path,
    notFound: type == FileSystemEntityType.notFound,
    isFile: type == FileSystemEntityType.file,
    isDirectory: type == FileSystemEntityType.directory,
    isLink: type == FileSystemEntityType.link,
    isAbsolute: p.isAbsolute(path),
    isRelative: p.isRelative(path),
    normalized: p.normalize(path),
    canonicalized: p.canonicalize(path),
    absolute: p.absolute(path),
    relative: p.relative(path),
    dirname: p.dirname(path),
    basename: p.basename(path),
    ext: p.extension(path),
  );
}

/// Base extension type for file system entity paths that provides
/// cached access to common path operations and properties.
extension type FileEntityPath._(PathCache _cache) {
  /// The original path string.
  String get path => _cache.path;

  /// Whether the path does not exist in the file system.
  bool get notFound => _cache.notFound;

  /// Whether the path points to a file.
  bool get isFile => _cache.isFile;

  /// Whether the path points to a directory.
  bool get isDirectory => _cache.isDirectory;

  /// Whether the path points to a symbolic link.
  bool get isLink => _cache.isLink;

  /// Whether the path is absolute.
  bool get isAbsolute => _cache.isAbsolute;

  /// Whether the path is relative.
  bool get isRelative => _cache.isRelative;

  /// The normalized version of the path.
  String get normalized => _cache.normalized;

  /// The canonicalized version of the path.
  String get canonicalized => _cache.canonicalized;

  /// The absolute version of the path.
  String get absolute => _cache.absolute;

  /// The relative version of the path.
  String get relative => _cache.relative;

  /// The directory name portion of the path.
  String get dirname => _cache.dirname;

  /// The base name (file name with extension) of the path.
  String get basename => _cache.basename;

  /// The file extension of the path.
  String get ext => _cache.ext;
}

/// Extension type for directory paths that provides directory-specific
/// operations while implementing [FileEntityPath].
extension type DirectoryPath._(PathCache _cache) implements FileEntityPath {
  /// Creates a new [DirectoryPath] for the given [path].
  factory DirectoryPath(String path) => DirectoryPath._(_getPathCache(path));

  /// Creates a new [DirectoryPath] for the current working directory.
  factory DirectoryPath.current() =>
      DirectoryPath._(_getPathCache(Directory.current.path));

  /// Gets the underlying [Directory] object.
  Directory get _dir => Directory(path);

  /// Returns a new [DirectoryPath] instance with refreshed file system state.
  @useResult
  DirectoryPath get sync => DirectoryPath(path);

  /// Checks if the directory is empty.
  ///
  /// Throws an exception if the directory does not exist.
  bool get isEmpty => _dir.listSync().isEmpty;

  /// Lists the contents of the directory as a list of [FileEntityPath]s.
  List<FileEntityPath> list({
    bool recursive = false,
    bool followLinks = false,
  }) {
    final contents = _dir.listSync(
      recursive: recursive,
      followLinks: followLinks,
    );

    final result = contents
        .map((entity) {
          if (entity is File) {
            return FilePath(entity.path);
          } else if (entity is Directory) {
            return DirectoryPath(entity.path);
          } else {
            throw UnsupportedError('Unsupported file system entity type');
          }
        })
        .toList(growable: false);

    return result;
  }

  /// Checks if the directory can be created.
  ///
  /// Returns true if:
  /// - The path doesn't exist and the parent directory exists
  ///   and is writable
  /// - The path doesn't exist and is a relative path
  ///   (assumes current dir is writable)
  bool get canBeCreated {
    if (!notFound) {
      // Path already exists - check if it's not a file
      return !isFile;
    }

    // Path doesn't exist - check if parent directory exists
    final parentPath = p.dirname(canonicalized);
    final parentDir = Directory(parentPath);

    // Parent must exist and be a directory
    return parentDir.existsSync() &&
        FileSystemEntity.typeSync(parentPath) == FileSystemEntityType.directory;
  }

  /// Creates the directory in the file system.
  ///
  /// If [recursive] is true, creates all necessary parent directories.
  void create({bool recursive = false}) =>
      _dir.createSync(recursive: recursive);

  /// Joins the given [fileName] to the directory path and
  /// returns a [FilePath] representing the resulting file path.
  @useResult
  FilePath joinFile(String fileName) {
    final joinedPath = p.join(path, fileName);

    return FilePath(joinedPath);
  }

  /// Joins the given path [components] to the directory path and
  /// returns a new [DirectoryPath] representing the resulting path.
  ///
  /// The [components] parameter can be a relative path with separators,
  /// which will be split and joined appropriately.
  @useResult
  DirectoryPath join(String components) {
    final parts = p.split(components);
    final joinedPath = p.joinAll([path, ...parts]);

    return DirectoryPath(joinedPath);
  }
}

/// Extension type for file paths that provides file-specific operations
/// while implementing [FileEntityPath].
extension type FilePath._(PathCache _cache) implements FileEntityPath {
  /// Creates a new [FilePath] for the given [path].
  factory FilePath(String path) => FilePath._(_getPathCache(path));

  /// Gets the underlying [File] object.
  File get _file => File(path);

  /// Returns a new [FilePath] instance with refreshed file system state.
  @useResult
  FilePath get sync => FilePath(path);

  /// Reads the entire file contents as a string synchronously.
  String readAsString() => _file.readAsStringSync();

  /// Creates the file in the file system.
  ///
  /// If [recursive] is true, creates all necessary parent directories.
  void create({bool recursive = false}) =>
      _file.createSync(recursive: recursive);

  /// Reads the file contents as a list of lines synchronously.
  List<String> readAsLines() {
    final lines = _file.readAsLinesSync();
    return lines;
  }

  /// Writes the given [content] string to the file synchronously.
  void writeAsString(String content) {
    _file.writeAsStringSync(content);
  }

  /// Writes the given list of bytes [bytes] to the file synchronously.
  void writeAsBytes(List<int> bytes) {
    _file.writeAsBytesSync(bytes);
  }
}
