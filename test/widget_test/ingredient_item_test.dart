import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';

void main() {
  testWidgets('ingredient itme test', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IngredientItem(
              ingredientImage:
                  'https://cdn.pixabay.com/photo/2016/01/21/18/08/meet-1154341_1280.png',
              ingredientName: '소고기',
              ingredientQuantity: '500g',
            ),
          ),
        ),
      );
      expect(find.text('소고기'), findsOneWidget);
      expect(find.text('500g'), findsOneWidget);
    });
  });
}
