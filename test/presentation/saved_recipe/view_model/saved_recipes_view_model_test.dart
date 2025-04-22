import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/recipe_info.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';
import 'package:recipe_app/domain/model/type/rate_type.dart';
import 'package:recipe_app/domain/model/type/time_filter_type.dart';
import 'package:recipe_app/domain/repository/book_mark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/toggle_favorite_use_case.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipes_view_model.dart';

class MockRecipeRepository implements RecipeRepository {
  List<Recipe> recipes;
  RecipeInfo recipeInfo;

  MockRecipeRepository({required this.recipes, required this.recipeInfo});

  @override
  Future<List<Recipe>> getSavedRecipes({
    String query = '',
    TimeFilterType? timeFilterType,
    RateType? rateType,
    CategoryFilterType? categoryFilterType,
  }) {
    return Future.value(recipes);
  }

  @override
  Future<RecipeInfo> getRecipesInfo({required String id}) async {
    return recipeInfo;
  }

  @override
  Future<List<Recipe>> getSavedRecentRecipes() {
    return Future.value(recipes);
  }

  @override
  Future<void> saveRecentRecipes(List<Recipe> recipes) async {}
}

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  @override
  Future<Recipe> toggleFavorite(String id) {
    return Future.value(Recipe.empty.copyWith(id: id, isFavorite: true));
  }
}

void main() {
  group('SavedRecipesViewModel Tests', () {
    MockRecipeRepository mockRepository = MockRecipeRepository(
      recipes: [
        Recipe(
          id: '1',
          name: '테스트 레시피',
          estimatedTime: 30,
          isFavorite: true,
          rate: 4.5,
          makeUserName: '테스트 유저',
          makeUserImageUrl: 'test.jpg',
          imageUrl: 'recipe.jpg',
          createdAt: DateTime.now(),
          category: CategoryFilterType.breakFast,
        ),
      ],
      recipeInfo: RecipeInfo.empty,
    );
    SavedRecipesViewModel viewModel = SavedRecipesViewModel(
      getSavedRecipesUseCase: GetSavedRecipesUseCase(
        recipeRepository: mockRepository,
      ),
      toggleFavoriteUseCase: ToggleFavoriteUseCase(
        bookmarkRepository: BookmarkRepositoryImpl(
          recipeDataSource: RecipeDataSourceImpl(),
        ),
      ),
    );

    test('fetchSavedRecipes should load recipes and update state', () async {
      await viewModel.getSavedRecipes();
      await viewModel.toggleFavorite('1');

      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.savedRecipes.length, 1);
      expect(viewModel.state.savedRecipes[0].name, '테스트 레시피');
      expect(viewModel.state.savedRecipes[0].isFavorite, true);
    });
  });
}
