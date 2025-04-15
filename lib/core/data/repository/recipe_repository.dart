// Project imports:
import 'package:recipe_app/core/data/model/recipe.dart';
import 'package:recipe_app/core/result.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
}
