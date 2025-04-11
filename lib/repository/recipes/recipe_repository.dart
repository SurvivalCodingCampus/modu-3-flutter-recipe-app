import 'package:recipe_app/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getSaveRecipeList ();
}