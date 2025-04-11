import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/recipe_card.dart';
import 'package:recipe_app/data/model/recipe.dart';

void main() {
  group('레시피 카드 테스트 : ', () {
    const Recipe recipe = Recipe(
      foodName: 'Traditional spare ribs baked',
      chef: 'Chef John',
      time: 20,
      rate: 4.0,
      image: 'assets/images/food.png',
    );

    testWidgets('제대로 생성되어야 한다.', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCard(recipe: recipe, onBookmarkClick: () {}),
          ),
        ),
      );

      expect(find.textContaining(recipe.chef), findsOneWidget);
      expect(find.textContaining(recipe.foodName), findsOneWidget);
      expect(find.textContaining(recipe.time.toString()), findsOneWidget);
      expect(find.textContaining(recipe.rate.toString()), findsOneWidget);
    });
    testWidgets('북마크 버튼을 누르면 카운트가 증가 되어야 한다.', (tester) async {
      int count = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeCard(
              recipe: recipe,
              onBookmarkClick: () {
                count++;
              },
            ),
          ),
        ),
      );

      final Finder findBookmarkButton = find.byType(CircleAvatar);

      await tester.tap(findBookmarkButton);

      expect(count, 1);
    });
  });
}
