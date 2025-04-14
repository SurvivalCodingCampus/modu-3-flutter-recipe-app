import 'package:recipe_app/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getSavedRecipe({String query});
}