import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/di/get_it.dart';
import 'package:recipe_app/data/repository/recipe_repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

void main() {
  group('SavedRecipeViewModel test', () {
    final mockRepository = MockRecipeRepositoryImpl();
    final viewModel = SearchRecipesViewModel(getIt());

    test('initial state ', () async {
      expect(viewModel.state.keyword, '');
      expect(viewModel.state.isFiltered, false);
      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.recipes, []);
      expect(viewModel.state.filteredRecipes, []);
    });
    test('no keyword ', () async {
      expect(viewModel.state.recipes.length, 3);
    });
    test('keyword chicken', () async {
      await viewModel.updateKeyword('chicken');
      expect(viewModel.state.keyword, 'chicken');
    });
  });
}
