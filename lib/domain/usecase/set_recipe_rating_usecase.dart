import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SetRecipeRatingUseCase {
  final RecipeRepository _repository;

  SetRecipeRatingUseCase(this._repository);

  Future<UiState<void>> call({
    required int recipeId,
    required double rating,
  }) async {
    final result = await _repository.setRecipeRating(recipeId, rating);

    return switch (result) {
      Success() => const UiState.success(null),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
