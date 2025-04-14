import '../data/model/recipe.dart';

abstract interface class RecipeDataSource {
  Future<List<Recipe>> getRecipeData();
}
