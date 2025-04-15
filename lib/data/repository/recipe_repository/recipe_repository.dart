import '../../model/recipe_model.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();

  Future<List<Recipe>> searchRecipes(String keyword);
}
