import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/recipe_widget.dart';

void main() {
  testWidgets('RecipeWidget test', (WidgetTester tester) async {
    final recipe = Recipe(name: '떡볶이', imageUrl: 'http://www.naver.com', userId: '1');

    var tapCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: RecipeWidget(
          recipe: recipe,
          onTapName: (String name) {
            tapCount++;
          },
        ),
      ),
    );

    final Finder nameTextFinder = find.text(recipe.name);
    expect(nameTextFinder, findsOneWidget);

    expect(find.byKey(const Key('name')), findsOneWidget);

    // 탭
    await tester.tap(nameTextFinder);
    await tester.pump();
    expect(tapCount, 1);

    await tester.tap(nameTextFinder);
    await tester.pump();
    expect(tapCount, 2);
  });
}
