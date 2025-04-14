import 'package:recipe_app/data/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
