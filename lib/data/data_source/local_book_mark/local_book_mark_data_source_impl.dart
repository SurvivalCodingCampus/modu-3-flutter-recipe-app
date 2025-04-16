import 'package:shared_preferences/shared_preferences.dart';

import 'local_book_mark_data_source.dart';

// 북마크된 레시피 Id 목록을 로컬에 저장 및 불러오는 클래스 -> 저장소(SharedPreferences)
// 북마크는 레시피 Id를 리스트에 추가, 저장
// 로컬 저장소(SharedPreferences): json형식(key-value)으로 저장
class LocalBookMarkDataSourceImpl implements LocalBookMarkDataSource {
  static const _key = 'bookMark_recipe_id';

  @override
  Future<List<String>> getBookMarkRecipeId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  @override
  Future<bool> isBookMarked(String recipeId) async {
    final saved = await getBookMarkRecipeId();
    return saved.contains(recipeId);
  }

  @override
  Future<void> removeBookMark(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_key) ?? [];
    saved.remove(recipeId);
    await prefs.setStringList(_key, saved);
  }

  @override
  Future<void> saveBookMark(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_key) ?? [];

    if (!saved.contains(recipeId)) {
      saved.add(recipeId);
      await prefs.setStringList(_key, saved);
    }
  }
}
