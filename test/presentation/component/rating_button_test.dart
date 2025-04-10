// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';

void main() {
  testWidgets('RatingButton 테스트', (WidgetTester tester) async {
    bool isClicked = false;
    await tester.pumpWidget(
        MaterialApp(
          home: RatingButton(
              text: '3',
              isSelected: false,
              onClick: () {
                isClicked = true;
              })
        )
    );
    final Finder ratingButtonFinder = find.byType(RatingButton);
    expect(ratingButtonFinder, findsOneWidget);

    await tester.tap(ratingButtonFinder);
    await tester.pump();
    expect(isClicked, isTrue);
  });
}