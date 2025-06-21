// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'downloader.dart';

Uri _lspSpecUri(String version) {
  final url =
      'https://microsoft.github.io/'
      'language-server-protocol/specifications/'
      'lsp/$version/metaModel/metaModel.json';

  return Uri.parse(url);
}

Uri _licenseUri() {
  const url =
      'https://microsoft.github.io/'
      'language-server-protocol/License-code.txt';
  return Uri.parse(url);
}

Future<void> _saveToFile(String content, String fileName) async {
  print('Saving content to $fileName');
  final file = File(fileName);
  await file.writeAsString(content);
  print('Content saved to $fileName');
}

Future<void> downloadLSPSpecAndLicense(String version) async {
  final specUri = _lspSpecUri(version);
  final licenseUri = _licenseUri();

  final result = await Future.wait([download(specUri), download(licenseUri)]);

  final [specResult, licenseResult] = result;

  final outputDir = 'lsp_download_$version';

  if (!Directory(outputDir).existsSync()) {
    await Directory(outputDir).create(recursive: true);
  }

  await _saveToFile(specResult, '$outputDir/lsp_spec_$version.json');
  await _saveToFile(licenseResult, '$outputDir/lsp_license.txt');
}

Future<void> cleanUp(String version) async {
  final outputDir = 'lsp_download_$version';
  final dir = Directory(outputDir);

  if (dir.existsSync()) {
    print('Cleaning up directory: $outputDir');
    await dir.delete(recursive: true);
    print('Directory $outputDir cleaned up.');
  } else {
    print('Directory $outputDir does not exist, nothing to clean up.');
  }
}

Future<Map<String, dynamic>> loadLSPMeta(String version) async {
  final fileName = 'lsp_download_$version/lsp_spec_$version.json';
  final file = File(fileName);

  if (!file.existsSync()) {
    throw Exception('LSP specification file not found: $fileName');
  }

  final content = await file.readAsString();
  final jsonData = jsonDecode(content) as Map<String, dynamic>;

  return jsonData;
}
