
import '../../data/model/recipes.dart';

abstract interface class BookmarkRepository {
  Future<List<Recipes>> getBookmarkRecipes();

  Future<void> addBookmark(int recipeId);
  Future<void> removeBookmark(int recipeId);
}