import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final Set<int> _bookmarkedIds = {}; // 예시용. 실제 앱에서는 SharedPreferences 등 사용.

  @override
  Future<void> saveRecipe(int recipeId) async {
    _bookmarkedIds.add(recipeId);
  }

  @override
  Future<void> removeRecipe(int recipeId) async {
    _bookmarkedIds.remove(recipeId);
  }

  @override
  Future<List<int>> getSavedRecipes() async {
    return _bookmarkedIds.toList();
  }

  @override
  Future<bool> isSaved(int recipeId) async {
    return _bookmarkedIds.contains(recipeId);
  }
}
