// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path/path.dart' as p;

String resolvePath(String path) {
  final resolved = p.normalize(p.absolute(path));

  return resolved;
}

Future<void> writeToFile(String content, String fileName) async {
  print('Saving content to $fileName');
  final file = File(fileName);
  await file.writeAsString(content);
  print('Content saved to $fileName');
}

Future<void> createDirectoryForFilePath(String filePath) async {
  final dir = Directory(p.dirname(filePath));
  await createDirectory(dir.path);
}

Future<void> createDirectory(String dirPath) async {
  final dir = Directory(dirPath);
  if (!dir.existsSync()) {
    print('Creating directory: ${dir.path}');
    await dir.create(recursive: true);
    print('Directory created: ${dir.path}');
  } else {
    print('Directory already exists: ${dir.path}');
  }
}
