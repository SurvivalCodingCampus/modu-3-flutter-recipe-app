import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-10/presentation/component/filter_button.dart';
import 'package:recipe_app/ui/color.dart';


void main() {
  testWidgets('FilterButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FilterButton(text: '아무거나'),
        ),
      ),
    );
    final textFinder = find.text('아무거나');
    expect(textFinder, findsOneWidget);

    Text textWidget = tester.widget(textFinder);
    expect(textWidget.style?.color, ColorStyles.primary100);

    await tester.tap(textFinder);
    await tester.pump();

    textWidget = tester.widget(textFinder);
    expect(textWidget.style?.color, ColorStyles.white);

  });
}