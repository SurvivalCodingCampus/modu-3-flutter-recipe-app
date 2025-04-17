import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecipeByIdUseCase {
  final RecipeRepository repository;

  const GetRecipeByIdUseCase(this.repository);

  Future<UiState<Recipe>> call(int id) async {
    final result = await repository.getRecipeById(id);
    return switch (result) {
      Success(:final data) => UiState.success(data),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
