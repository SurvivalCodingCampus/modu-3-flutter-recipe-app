import '../../model/recipes.dart';

abstract interface class RecipeDataSource {
  Future<List<Recipes>> getRecipes();

}