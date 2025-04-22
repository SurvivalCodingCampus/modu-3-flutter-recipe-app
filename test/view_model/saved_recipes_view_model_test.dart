import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/remote_data_source/remote_data_source.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/domain/use_case/use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes.dart';

void main() {
  test('SavedRecipesViewModel 테스트', () async {
    final viewModel = SavedRecipesViewModel(
      getSavedRecipesUseCase: GetSavedRecipesUseCase(
        recipeRepository: RecipeRepositoryImpl(
          recipeDataSource: MockRecipeDataSourceImpl(),
        ),
        bookmarkRepository: BookmarkRepositoryImpl(),
      ),
      toggleBookmarkRecipeUseCase: ToggleBookmarkRecipeUseCase(
        recipeRepository: RecipeRepositoryImpl(
          recipeDataSource: MockRecipeDataSourceImpl(),
        ),
        bookmarkRepository: BookmarkRepositoryImpl(),
      ),
    );

    expect(viewModel.state.recipes, isEmpty);

    await viewModel.fetchSavedRecipes();

    expect(viewModel.state.recipes, isNotEmpty);
  });
}
