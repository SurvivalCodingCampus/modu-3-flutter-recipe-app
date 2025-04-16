import 'json_storage_key.dart';
import 'json_storage_web.dart' if (dart.library.io) 'json_storage_mobile.dart';

abstract class JsonStorage {
  static Future<void> save(JsonStorageKey key, Map<String, dynamic> data) =>
      JsonStorageImpl.save(key, data);

  static Future<Map<String, dynamic>?> load(JsonStorageKey key) =>
      JsonStorageImpl.load(key);

  static Future<void> remove(JsonStorageKey key) => JsonStorageImpl.remove(key);
}
