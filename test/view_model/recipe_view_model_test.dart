import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/data_source.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes.dart';

void main() {
  group('Recipe ViewModel 테스트', () {
    test('fetchSavedRecipes 테스트', () async {
      final viewModel = SavedRecipesViewModel(
        recipeRepository: RecipeRepositoryImpl(
          recipeDataSource: MockRecipeDataSourceImpl(),
        ),
      );

      expect(viewModel.savedRecipes, isEmpty);

      await viewModel.fetchSavedRecipes();

      expect(viewModel.savedRecipes.length, greaterThan(0));
      expect(viewModel.savedRecipes.first.name, isNotNull);
    });
  });
}
