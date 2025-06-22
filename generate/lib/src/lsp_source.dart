// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import 'downloader.dart';

const _version = '3.17';
const _dirName = 'lsp_download_$_version';
const _specFileName = 'lsp_spec_$_version.json';
const _licenseFileName = 'lsp_license.txt';
const fullSpecFileName = '$_dirName/$_specFileName';
const fullLicenseFileName = '$_dirName/$_licenseFileName';

Uri _lspSpecUri() {
  const url =
      'https://microsoft.github.io/'
      'language-server-protocol/specifications/'
      'lsp/$_version/metaModel/metaModel.json';

  return Uri.parse(url);
}

Uri _licenseUri() {
  const url =
      'https://microsoft.github.io/'
      'language-server-protocol/License-code.txt';
  return Uri.parse(url);
}

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

Future<void> downloadLSPSpecAndLicense() async {
  await createDirectory(_dirName);

  if (File(fullSpecFileName).existsSync() &&
      File(fullLicenseFileName).existsSync()) {
    print('Files already exist in $_dirName, skipping download.');
    return;
  }

  final specUri = _lspSpecUri();
  final licenseUri = _licenseUri();

  final result = await Future.wait([download(specUri), download(licenseUri)]);

  final [specResult, licenseResult] = result;

  await writeToFile(specResult, fullSpecFileName);
  await writeToFile(licenseResult, fullLicenseFileName);
}

Future<void> cleanUp() async {
  final dir = Directory('$_dirName/');

  if (dir.existsSync()) {
    print('Cleaning up directory: $_dirName');
    await dir.delete(recursive: true);
    print('Directory $_dirName cleaned up.');
  } else {
    print('Directory $_dirName does not exist, nothing to clean up.');
  }
}

Future<Map<String, dynamic>> loadLSPMeta() async {
  final file = File(fullSpecFileName);

  if (!file.existsSync()) {
    throw Exception('LSP specification file not found: ${file.path}');
  }

  final content = await file.readAsString();
  final jsonData = jsonDecode(content) as Map<String, dynamic>;

  return jsonData;
}
