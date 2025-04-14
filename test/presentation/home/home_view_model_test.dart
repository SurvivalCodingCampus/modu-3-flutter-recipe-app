import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

void main() {
  group('HomeViewModel test', () {
    test('fetchRecipes', () async {
      final mockRepository = MockRecipeRepositoryImpl();
      final viewModel = HomeViewModel(mockRepository);
      final state = viewModel.state;

      expect(state.isLoading, false);
      expect(state.recipes.length, 0);

      await viewModel.fetchRecipes();
      expect(state.recipes.isNotEmpty, true);
    });
  });
}
