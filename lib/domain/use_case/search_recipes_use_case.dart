import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const SearchRecipesUseCase(this._recipeRepository);

  Future<Result<List<Recipe>, RecipeError>> execute(
    String query,
    FilterSearchBottomSheetState filterState,
  ) async {
    return await _recipeRepository.findAllByFilter(
      (recipe) =>
          recipe.name.toLowerCase().contains(query.toLowerCase()) &&
          recipe.rating >=
              FilterSearchBottomSheetState.rates[filterState.rateIndex],
    );
  }
}
