import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';
import 'package:recipe_app/domain/model/type/rate_type.dart';
import 'package:recipe_app/domain/model/type/time_filter_type.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetSavedRecipesUseCase({required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository;

  Future<List<Recipe>> getSavedRecipes({
    String query = '',
    TimeFilterType? timeFilterType,
    RateType? rateType,
    CategoryFilterType? categoryFilterType,
  }) async {
    return await _recipeRepository.getSavedRecipes(
      query: query,
      timeFilterType: timeFilterType,
      rateType: rateType,
      categoryFilterType: categoryFilterType,
    );
  }
}
