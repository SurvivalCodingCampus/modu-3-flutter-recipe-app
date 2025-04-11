import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentaiton/component/ingredient_item.dart';

void main() {
  testWidgets('재료 명', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: IngredientItem(
          ingredient: Ingredient(name: 'tomato', weight: 500),
          isTest: true,
        ),
      ),
    );

    expect(find.text('tomato'), findsOneWidget);
  });
}

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  final bool isTest;

  const IngredientItem({super.key, required this.ingredient, this.isTest = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          isTest
              ? Container(width: 52, height: 52, color: Colors.white)
              : Image.network(''),
          Text(ingredient.name),
        ],
      ),
    );
  }
}