import 'package:recipe_app/recipe_app/model/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> fetchRecipes();
}
