import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/util/result.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
}
