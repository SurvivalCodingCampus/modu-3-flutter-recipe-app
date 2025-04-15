import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';

void main() {
  testWidgets('recipe card test', (tester) async {
    await mockNetworkImagesFor(() async {
      final testRecipe = Recipe(
        category: 'Spicy Nelly',
        id: 1,
        name: 'Test Recipe',
        imageUrl:
            'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
        chef: 'Chef Nelly',
        time: '10 min',
        rating: 4.5,
        ingredients: [],
        procedures: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                child: RecipeCard(
                  recipe: testRecipe,
                  showBookMarked: true,
                  showTitle: true,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Spicy Nelly'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('by Chef Nelly'), findsOneWidget);
      expect(find.text('10 min'), findsOneWidget);

      final bookmarkIcon = find.byIcon(Icons.bookmark);
      expect(bookmarkIcon, findsOneWidget);

      // 토글
      await tester.tap(bookmarkIcon);
      await tester.pump();

      final bookmarkedIcon = find.byIcon(Icons.bookmark_border_outlined);
      expect(bookmarkedIcon, findsOneWidget);
    });
  });
}
