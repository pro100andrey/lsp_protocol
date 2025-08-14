// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../generator.dart';

const _version = '3.17';
const _dirName = 'lsp_downloads';
const _specFileName = 'lsp_spec_$_version.json';
const _licenseFileName = 'lsp_license.txt';
const fullSpecFileName = '$_dirName/$_specFileName';
const fullLicenseFileName = '$_dirName/$_licenseFileName';

Uri _lspSpecUri() {
  const url =
      'https://microsoft.github.io/'
      'language-server-protocol/specifications/'
      'lsp/$_version/metaModel/metaModel.json';

  print(url);

  return Uri.parse(url);
}

Uri _licenseUri() {
  const url =
      'https://microsoft.github.io/'
      'language-server-protocol/License-code.txt';
  return Uri.parse(url);
}

Future<MetaProtocol> downloadAndParseLSP() async {
  await createDirectory(_dirName);

  if (File(fullSpecFileName).existsSync() &&
      File(fullLicenseFileName).existsSync()) {
    print('Files already exist in $_dirName, skipping download.');
    return _loadMetaProtocol();
  }

  final specUri = _lspSpecUri();
  final licenseUri = _licenseUri();

  final result = await Future.wait([_download(specUri), _download(licenseUri)]);

  final [specResult, licenseResult] = result;

  await writeToFile(specResult, fullSpecFileName);
  await writeToFile(licenseResult, fullLicenseFileName);

  return _loadMetaProtocol();
}

Future<void> cleanUpDownloads({required bool skip}) async {
  if (skip) {
    print('Skipping cleanup of $_dirName');
    return;
  }

  final dir = Directory('$_dirName/');

  if (dir.existsSync()) {
    print('Cleaning up directory: $_dirName');
    await dir.delete(recursive: true);
    print('Directory $_dirName cleaned up.');
  } else {
    print('Directory $_dirName does not exist, nothing to clean up.');
  }
}

Future<MetaProtocol> _loadMetaProtocol() async {
  final file = File(fullSpecFileName);

  if (!file.existsSync()) {
    throw Exception('LSP specification file not found: ${file.path}');
  }

  final content = await file.readAsString();
  final jsonData = jsonDecode(content) as Map<String, dynamic>;

  final metaProtocol = MetaProtocol.fromJson(jsonData);

  return metaProtocol;
}

Future<String> _download(Uri uri) async {
  print('Downloading from $uri');
  final watch = Stopwatch()..start();

  final response = await get(uri);
  watch.stop();
  print('Download completed in ${watch.elapsedMilliseconds} ms');

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to download: ${response.reasonPhrase}');
  }
}
