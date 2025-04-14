import 'package:recipe_app/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
