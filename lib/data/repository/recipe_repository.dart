import 'package:recipe_app/data/model/recipes.dart';

abstract interface class RecipeRepository {
  Future<List<Recipes>> getRecipes();
}