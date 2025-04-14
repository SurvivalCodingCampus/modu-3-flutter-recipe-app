import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/model/ingredient/ingredient.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';

void main() {
  group('IngredientItemr Button Widget Test', () {
    testWidgets('IngredientItem Button', (WidgetTester tester) async {
      final ingredient = Ingredient(
        name: 'Tomatos',
        weight: 100,
        imageUrl: 'assets/images/tomatos.png',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: IngredientItem(ingredient: ingredient)),
        ),
      );

      expect(find.text('Tomatos'), findsOneWidget);
      expect(find.text('100g'), findsOneWidget);

      // 4. 이미지 위젯이 존재하는지 확인 (asset path는 실제 asset 없어도 테스트 가능)
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
