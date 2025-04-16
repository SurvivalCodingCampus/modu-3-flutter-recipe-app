import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/domain/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
}
