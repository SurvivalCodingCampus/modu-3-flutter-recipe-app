import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _repository;

  GetRecipesUseCase(this._repository);

  Future<UiState<List<Recipe>>> execute() async {
    final result = await _repository.getRecipes();

    return switch (result) {
      Success(:final data) => UiState.success(data),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
