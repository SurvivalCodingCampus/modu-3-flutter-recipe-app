import 'package:recipe_app/feature/receipe/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
