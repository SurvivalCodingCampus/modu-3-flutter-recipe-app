abstract class BookmarkRepository {
  Future<void> saveRecipe(int recipeId);
  Future<void> removeRecipe(int recipeId);
  Future<List<int>> getSavedRecipes();
  Future<bool> isSaved(int recipeId);
}
