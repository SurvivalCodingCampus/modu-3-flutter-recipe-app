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
import 'package:recipe_app/presentation/component/filter_search_sheet/rating_button.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';

void main() {
  testWidgets('RatingDialog 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RatingDialog(
          title: 'Rate recipe',
          actionName: 'Send',
          onChange: (int rateValue) {},
        ),
      ),
    );
    final Finder ratingDialogFinder = find.byType(RatingDialog);
    expect(ratingDialogFinder, findsOneWidget);
  });
}
