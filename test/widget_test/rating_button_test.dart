import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/ui/color_styles.dart';

void main() {
  testWidgets('rating button test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: RatingButton(rate: 4)));

    expect(
      tester.widget<Text>(find.text('1')).style?.color,
      equals(ColorStyles.primary80),
    );

    await tester.tap(find.text('1'));
    await tester.pump();

    expect(
      tester.widget<Text>(find.text('1')).style?.color,
      equals(ColorStyles.white),
    );
  });
}
