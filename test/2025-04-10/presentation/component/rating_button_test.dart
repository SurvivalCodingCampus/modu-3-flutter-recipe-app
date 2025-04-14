import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/ui/color.dart';


void main() {
  testWidgets('RatingButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RatingButton(),
        ),
      ),
    );
    final rateFinder = find.text('5');
    expect(rateFinder, findsOneWidget);

    Text textWidget = tester.widget(rateFinder);
    expect(textWidget.style?.color, ColorStyles.primary100);

    await tester.tap(rateFinder);
    await tester.pump();

    textWidget = tester.widget(rateFinder);
    expect(textWidget.style?.color, ColorStyles.white);

  });
}