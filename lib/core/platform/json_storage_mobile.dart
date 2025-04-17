import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'json_storage_key.dart';

class JsonStorageImpl {
  static Future<File> _getFile(JsonStorageKey key) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/${key.fileName}');
  }

  static Future<void> save(
    JsonStorageKey key,
    Map<String, dynamic> data,
  ) async {
    final file = await _getFile(key);
    final jsonString = jsonEncode(data);
    await file.writeAsString(jsonString);
  }

  static Future<Map<String, dynamic>?> load(JsonStorageKey key) async {
    final file = await _getFile(key);
    if (!await file.exists()) return null;

    final jsonString = await file.readAsString();
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  static Future<void> remove(JsonStorageKey key) async {
    final file = await _getFile(key);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
