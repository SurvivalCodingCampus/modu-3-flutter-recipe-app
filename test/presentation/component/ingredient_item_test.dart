import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';

void main() {
  testWidgets('IngredientItem 테스트', (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IngredientItem(
                ingredient: Ingredient(id: 1, name: '', image: ''),
              ),
            ),
          ),
        );
      }
    );

    final Finder ingredientWidget = find.byType(IngredientItem);
    expect(ingredientWidget, findsOneWidget);
  });
}
