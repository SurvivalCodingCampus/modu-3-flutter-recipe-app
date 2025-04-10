// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';

void main() {
  testWidgets('FilterButton 테스트', (WidgetTester tester) async {
    bool isClicked = false;
    await tester.pumpWidget(
        MaterialApp(
            home: FilterButton(
                text: 'text',
                isSelected: false,
                onClick: () {
                  isClicked = true;
                })
        )
    );
    final Finder filterButtonFinder = find.byType(FilterButton);
    expect(filterButtonFinder, findsOneWidget);

    await tester.tap(filterButtonFinder);
    await tester.pump();
    expect(isClicked, isTrue);
  });
}