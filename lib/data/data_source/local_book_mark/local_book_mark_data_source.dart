abstract class LocalBookMarkDataSource {
  Future<void> saveBookMark(String recipeId);
  Future<void> removeBookMark(String recipeId);
  Future<bool> isBookMarked(String recipeId);
  Future<List<String>> getBookMarkRecipeId();
}
