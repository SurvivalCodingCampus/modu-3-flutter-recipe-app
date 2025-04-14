import '../model/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> fetchRecipes();
}
