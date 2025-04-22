import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecipeCategoriesUseCase {
  final RecipeRepository _repository;

  GetRecipeCategoriesUseCase(this._repository);

  Future<UiState<List<String>>> execute() async {
    final result = await _repository.getRecipeCategories();

    return switch (result) {
      Success(:final data) => UiState.success(data),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
