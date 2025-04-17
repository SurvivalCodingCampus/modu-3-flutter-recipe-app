import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/repository/mock_user_repository_impl.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

void main() {
  group('HomeViewModel test', () {
    test('fetchRecipes', () async {
      final userRepository = MockUserRepositoryImpl();
      final getSavedRecipesUseCase = MockUseCase();

      final viewModel = HomeViewModel(
        getSavedRecipesUseCase: getSavedRecipesUseCase,
        userRepository: userRepository,
      );
      final state = viewModel.state;

      expect(state.isLoading, false);
      expect(state.recipes.length, 0);

      await viewModel.fetchRecipes();
      expect(state.recipes.isNotEmpty, true);
    });
  });
}

class MockUseCase implements GetSavedRecipesUseCase {
  @override
  Future<List<Recipe>> execute() async {
    return [
      Recipe(name: 'name1', imageUrl: '', userId: '1'),
      Recipe(name: 'name2', imageUrl: '', userId: '2'),
      Recipe(name: 'name3', imageUrl: '', userId: '1'),
    ];
  }
}
