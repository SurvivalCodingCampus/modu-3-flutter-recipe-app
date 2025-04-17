abstract interface class RecipeDataSource {
  Future<Map<String,dynamic>> getRecipes();
}