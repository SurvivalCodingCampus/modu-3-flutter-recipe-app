import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';

void main() {
  testWidgets('IngredientItem 렌더링이 정상적으로 이루어져야한다.', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      IngredientItemTest(
        name: 'Tomato',
        imagePath: 'assets/images/tomato.png',
        weight: '100g',
      ),
    );

    expect(find.text('Tomato'), findsOneWidget);
    expect(find.text('100g'), findsOneWidget);
  });
}

class IngredientItemTest extends StatelessWidget {
  final String name;
  final String weight;
  final String imagePath;

  const IngredientItemTest({
    super.key,
    required this.name,
    required this.weight,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            IngredientItem(name: name, weight: weight, imagePath: imagePath),
          ],
        ),
      ),
    );
  }
}
