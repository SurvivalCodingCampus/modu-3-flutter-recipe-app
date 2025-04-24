import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/repository.dart';

abstract interface class RecipeRepository implements Repository<Recipe, int> {
  Future<Result<List<Recipe>, RecipeError>> getRecentSearchRecipes();
  Future<void> addRecentSearchRecipe(List<Recipe> recipes);
}
