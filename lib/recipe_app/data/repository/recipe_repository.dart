import '../model/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> fetchRecipes();

  Future<List<Recipe>> searchRecipes(String keyword);

  Future<List<Recipe>> filterRecipes(String filter);

  Future<List<Recipe>> bookMarkedRecipes(bool bookMark);
}
