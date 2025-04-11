import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/ingredient_item.dart';

void main() {
  group('재료 목록 아이템 : ', () {
    const String ingredientName = 'tomatos';
    const String imageName = 'assets/images/tomato.png';
    const String amount = '500g';

    testWidgets('제대로 생성되어야 한다.', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IngredientItem(
              imageName: imageName,
              ingredientName: ingredientName,
              amount: amount,
            ),
          ),
        ),
      );

      expect(find.text(ingredientName), findsOneWidget);
      expect(find.text(amount), findsOneWidget);
    });
  });
}
