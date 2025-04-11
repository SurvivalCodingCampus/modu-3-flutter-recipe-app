import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';

void main() {
  group('RatingButton FilterButton Widget Test', () {
    testWidgets('RatingButton 존재확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              text: "5",
              isSelected: true,
              icon: Icons.star,
              onChange: () {},
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
    });
    testWidgets('FilterButton 존재확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterButton(text: "text", isSelected: true, onChange: () {}),
          ),
        ),
      );

      expect(find.text('text'), findsOneWidget);
    });
  });
}
