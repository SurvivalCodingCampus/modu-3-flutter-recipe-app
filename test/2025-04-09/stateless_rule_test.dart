import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-09/stateless_rule.dart';

void main() {
  testWidgets('RecipeWidget test', (WidgetTester tester) async {
    final recipe = Recipe(name: '곱창', imageUrl: 'www.naver.com');
    var tapCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: RecipeWidget(
          recipe: recipe,
          onTabName: (name) {
            tapCount++;
          },
          onTabImageUrl: (recipe) {
            print('onTabImageUrl: $recipe');
          },
          onTab: (recipe) {
            print('onTab: $recipe');
          },
        ),
      ),
    );

    final Finder textFinder = find.text(recipe.name);
    print(find.byKey(const Key('name')));
    expect(textFinder, findsOneWidget);
    expect(find.byKey(const Key('name')), findsOneWidget);

    await tester.tap(textFinder);
    await tester.pump();
    expect(tapCount, 1);

  });
}
