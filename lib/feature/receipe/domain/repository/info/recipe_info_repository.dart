import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

abstract interface class RecipeInfoRepository {
  Future<Result<Recipe>> getRecipeInfo(int id);
}
