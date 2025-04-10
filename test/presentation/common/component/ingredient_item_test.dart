import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/common/component/ingredient_item.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

void main() {
  testWidgets(
    'IngredientItem Widget 랜더링 테스트',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: IngredientItem(
            backgroundColor: ColorStyle.gray4,
            imagePath: 'assets/sample_image/strawberry.png',
            imageType: ImageType.path,
            name: 'StrawBerry',
            content: '500g',
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('StrawBerry'));
      expect(find.text('StrawBerry'), findsOneWidget);
      expect(find.text('500g'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(text.style!.fontWeight, AppTextStyles.normalBold().fontWeight);
    },


  );
}
