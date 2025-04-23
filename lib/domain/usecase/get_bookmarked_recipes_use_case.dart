import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class GetBookmarkedRecipesUseCase {
  final UserRepository userRepository;
  final RecipeRepository recipeRepository;

  const GetBookmarkedRecipesUseCase({
    required this.userRepository,
    required this.recipeRepository,
  });

  Future<UiState<List<Recipe>>> execute() async {
    final userResult = await userRepository.getCurrentUser();
    final recipeResult = await recipeRepository.getRecipes();

    if (userResult case Error(:final failure)) {
      return UiState.error(failure.message);
    }

    final user = (userResult as Success).data;

    return switch (recipeResult) {
      Success(:final data) =>
        data.isEmpty
            ? const UiState.empty()
            : UiState.success(
              data
                  .where((r) => user.bookmarkedRecipeIds.contains(r.id))
                  .toList(),
            ),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
