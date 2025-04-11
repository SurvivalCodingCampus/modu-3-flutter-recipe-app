import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/ui/color_styles.dart';

void main() {
  testWidgets('rating button test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FilterButton(text: ['한식', '중식', '일식', '양식', '전부']),
      ),
    );
    expect(find.text('한식'), findsOneWidget);
    expect(find.text('중식'), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('양식')).style?.color,
      equals(ColorStyles.primary80),
    );

    await tester.tap(find.text('양식'));
    await tester.pump();
    expect(
      tester.widget<Text>(find.text('양식')).style?.color,
      equals(ColorStyles.white),
    );
  });
}
