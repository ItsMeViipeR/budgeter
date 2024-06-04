import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:toml/toml.dart';

class License {
  Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final String path = await _localPath;
    return File('$path/license.toml');
  }

  Future<File> writeLicenseFile() async {
    File file = await _localFile;

    if (!await file.exists()) {
      file = await file.create();
    }

    // Write the file
    return file.writeAsString('''
[license]
accepted = true
''');
  }

  Future<Map<String, dynamic>> readLicenseFile() async {
    try {
      final File file = await _localFile;

      // Read the file
      var contents = TomlDocument.parse(await file.readAsString()).toMap();

      // print("License: ${contents['license']['accepted']}");

      return contents;
    } catch (e) {
      return {};
    }
  }
}
