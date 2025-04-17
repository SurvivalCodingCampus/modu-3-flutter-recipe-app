import '../model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipe();

  // Future<List<Recipe>> searchRecipes();
}
