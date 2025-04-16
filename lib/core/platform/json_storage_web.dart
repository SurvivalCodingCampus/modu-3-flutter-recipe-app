import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'json_storage_key.dart';

class JsonStorageImpl {
  static Future<void> save(
    JsonStorageKey key,
    Map<String, dynamic> data,
  ) async {
    final jsonString = jsonEncode(data);
    html.window.localStorage[key.key] = jsonString;
  }

  static Future<Map<String, dynamic>?> load(JsonStorageKey key) async {
    final jsonString = html.window.localStorage[key.key];
    if (jsonString == null) return null;

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  static Future<void> remove(JsonStorageKey key) async {
    html.window.localStorage.remove(key.key);
  }
}
