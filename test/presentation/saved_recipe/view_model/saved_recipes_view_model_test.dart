import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/saved_recipe/view_model/saved_recipes_view_model.dart';

class MockRecipeRepository implements RecipeRepository {
  List<Recipe> recipes;

  MockRecipeRepository({
    required this.recipes,
  });

  @override
  Future<List<Recipe>> getSavedRecipe() async {
    return recipes;
  }
}

void main() {
  group('SavedRecipesViewModel Tests', () {
    MockRecipeRepository mockRepository = MockRecipeRepository(recipes: [Recipe(
        id: '1',
        name: '테스트 레시피',
        estimatedTime: 30,
        isFavorite: true,
        rate: 4.5,
        makeUserName: '테스트 유저',
        makeUserImageUrl: 'test.jpg',
        imageUrl: 'recipe.jpg'
    )
    ]);
    SavedRecipesViewModel viewModel = SavedRecipesViewModel(
        recipeRepository: mockRepository);

    test('fetchSavedRecipes should load recipes and update state', () async {
      await viewModel.fetchSavedRecipes();

      expect(viewModel.isLoading, false);
      expect(viewModel.savedRecipes.length, 1);
      expect(viewModel.savedRecipes[0].name, '테스트 레시피');
    });
  });
}