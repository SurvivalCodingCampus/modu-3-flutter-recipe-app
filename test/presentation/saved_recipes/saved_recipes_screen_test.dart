import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

void main() {
  testWidgets('SavedRecipesScreen 테스트', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: SavedRecipesScreen(
            viewModel: SavedRecipesViewModel(
              recipeRepository: RecipeRepositoryImpl(
                recipeDataSource: MockRecipeDataSourceImpl(),
              ),
            )..fetchRecipes(),
          ),
        ),
      );
    });

    final Finder ingredientWidget = find.byType(RecipeCard);
    expect(ingredientWidget, findsWidgets);
  });
}
