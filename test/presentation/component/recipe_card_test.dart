import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository_impl.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/component_test_screen.dart';

void main() {
  testWidgets('RecipeCard 테스트', (WidgetTester tester) async {
    final RecipeDataSource recipeDataSource = MockRecipeDataSourceImpl();
    final RecipeRepository recipeRepository = RecipeRepositoryImpl(
      recipeDataSource: recipeDataSource,
    );
    final List<Recipe> recipes = await recipeRepository.getRecipes();

    int bookmarkedId = 0;
    await mockNetworkImagesFor(
      () async => await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCard(
              recipe: recipes.first,
              isBookmarked: false,
              onBookmark: (int id) {
                bookmarkedId = id;
              },
            ),
          ),
        ),
      ),
    );

    final Finder recipeCard = find.byType(RecipeCard);
    expect(recipeCard, findsOneWidget);

    final Finder bookmarkButton = find.byKey(
      const Key('recipeCardBookmarkButton'),
    );
    expect(bookmarkButton, findsOneWidget);

    await tester.tap(bookmarkButton);
    await tester.pump(const Duration(milliseconds: 100));
    expect(bookmarkedId, 1);
  });
}
