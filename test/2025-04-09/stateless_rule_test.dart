import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-09/stateless_rule.dart';

void main() {
  var tapCount = 0;
  testWidgets('RecipeWidget test', (WidgetTester tester) async {
    final recipe = Recipe(name: '떡볶이', imageUrl: 'naver.com');
    await tester.pumpWidget(
        MaterialApp(
            home: RecipeWidget(recipe: recipe, onTapName: (String name)  {
                tapCount++;
              },
            ),
        )
    );

    final Finder nameTextFinder = find.text('떡볶이');
    expect(nameTextFinder, findsOneWidget);

    expect(find.byKey(Key('name')), findsOneWidget);

    //탭
    await tester.tap(nameTextFinder);
    await tester.pump();
    expect(tapCount, 1);

    await tester.tap(nameTextFinder);
    await tester.pump();
    expect(tapCount, 2);
  });
}
