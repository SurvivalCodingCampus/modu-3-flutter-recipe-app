import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/component_test_screen.dart';

void main() {
  testWidgets('RecipeCard 테스트', (WidgetTester tester) async {
    String bookmarkedName = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecipeCard(
            recipe: ComponentTestScreen.recipes.first,
            isBookmarked: false,
            onBookmark: (String name) {
              bookmarkedName = name;
            },
          ),
        ),
      ),
    );

    final Finder recipeCard = find.byType(RecipeCard);
    expect(recipeCard, findsOneWidget);

    final Finder bookmarkButton = find.byKey(const Key('recipeCardBookmarkButton'));
    expect(bookmarkButton, findsOneWidget);

    await tester.tap(bookmarkButton);
    await tester.pump(const Duration(milliseconds: 100));
    expect(bookmarkedName, 'Traditional spare ribs baked');
  });
}
