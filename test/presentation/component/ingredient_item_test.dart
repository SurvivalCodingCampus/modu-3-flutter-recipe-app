import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component_test_screen.dart';

void main() {
  testWidgets('IngredientItem 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: IngredientItem(
            ingredient: ComponentTestScreen.ingredients.first,
          ),
        ),
      ),
    );

    final Finder ingredientWidget = find.byType(IngredientItem);
    expect(ingredientWidget, findsOneWidget);
  });
}
