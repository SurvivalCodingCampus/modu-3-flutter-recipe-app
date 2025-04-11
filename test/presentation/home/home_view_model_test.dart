import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

void main() {
  group('HomeViewModel test', () {
    test('fetchRecipes', () async {
      final mockRepository = MockRecipeRepositoryImpl();
      final viewModel = HomeViewModel(mockRepository);

      expect(viewModel.isLoading, false);
      expect(viewModel.recipes.length, 0);

      await viewModel.fetchRecipes();
      expect(viewModel.recipes.isNotEmpty, true);
    });
  });
}
