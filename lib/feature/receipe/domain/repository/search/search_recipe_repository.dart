import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

abstract interface class SearchRecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();

  Future<Result<List<String>>> getRecentSearchText();

  Future<Result<List<String>>> saveRecentSearchText(String text);
}
