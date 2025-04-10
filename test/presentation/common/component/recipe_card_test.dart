import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/common/component/recipe_card.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';

void main() {

  Map testData = {
    'imagePath': 'assets/sample_image/tomato.jpg',
    'imageType': ImageType.path,
  };

  testWidgets('레시피 카드가 정상적으로 렌더링되는지 확인', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RecipeCard(
          recipeName: 'test',
          recipeAuthor: 'Author',
          imagePath: testData["imagePath"],
          recipeTime: 20,
          recipeRate: 30,
          imageType: testData["imageType"],
        ),
      ),
    );


    expect(find.text('test'), findsOneWidget);
    expect(find.text('Author'), findsOneWidget);
    expect(find.text('20 min'), findsOneWidget);
    expect(find.byIcon(Icons.bookmark_outline), findsOneWidget);
  });
}
