import '../../model/recipe_ingredient.dart';
import '../../model/recipe_model.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();

  Future<List<Recipe>> searchRecipes(String keyword);

  Future<void> toggleBookMarkRecipe(Recipe recipe);

  Future<Recipe> getRecipeById(int id);

  // Future<List<Procedure>> getProceduresByRecipe(String recipeId);

  Future<List<RecipeIngredient>> getIngredientsByRecipe(int id);

  Future<List<Recipe>> getRecipesByIngredient(String ingredient);
}
