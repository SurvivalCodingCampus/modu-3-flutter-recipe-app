import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/repository/recipe_repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

void main() {
  group('SavedRecipeViewModel test', () {
    test('fetchApp', () async {
      final mockRepository = MockRecipeRepositoryImpl();
      final viewModel = SavedRecipeViewModel(mockRepository);

      expect(viewModel.savedRecipes, []);
      expect(viewModel.isLoading, false);

      await viewModel.fetchSavedRecipes();
      expect(viewModel.savedRecipes.length, 3);
      expect(viewModel.isLoading, false);
    });
  });
}
