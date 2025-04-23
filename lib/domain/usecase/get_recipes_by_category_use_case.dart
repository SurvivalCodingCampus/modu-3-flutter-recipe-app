import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecipesByCategoryUseCase {
  final RecipeRepository _repository;

  GetRecipesByCategoryUseCase(this._repository);

  Future<UiState<List<Recipe>>> execute(String category) async {
    final result = await _repository.getRecipesByCategory(category);

    return switch (result) {
      Success(:final data) => UiState.success(data),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
