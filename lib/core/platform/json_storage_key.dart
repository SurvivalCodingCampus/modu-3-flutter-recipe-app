enum JsonStorageKey { user, recipes, search_data }

extension JsonStorageKeyExt on JsonStorageKey {
  String get fileName => '${name}.json'; // 예: user.json, recipes.json
  String get key => name; // 로컬스토리지용 키 (웹용)
}
