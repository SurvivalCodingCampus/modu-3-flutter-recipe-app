import 'package:recipe_app/model/recipe.dart';

abstract interface class RecipeDataSource {
  Future<List<Recipe>> getRecipes();
}
