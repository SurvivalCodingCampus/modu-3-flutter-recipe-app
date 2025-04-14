import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

void main() {
  MockRecipeDataImpl mockRecipeDataImpl = MockRecipeDataImpl();
  RecipeRepository repository = RecipeRepositoryImpl(
    recipeDataSource: mockRecipeDataImpl,
  );
  SearchRecipesViewModel searchRecipesViewModel = SearchRecipesViewModel(
    repository,
  );
  FilterSearchViewModel filterSearchViewModel = FilterSearchViewModel(
    repository,
  );
  testWidgets('SavedRecipesScreen Check Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchRecipesScreen(
            searchRecipesViewModel: searchRecipesViewModel,
            filterSearchViewModel: filterSearchViewModel,
          ),
        ),
      ),
    );
    expect(find.byType(SearchRecipesScreen), findsOneWidget);
  });
}
