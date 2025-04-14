import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';

abstract interface class SearchRecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
}
