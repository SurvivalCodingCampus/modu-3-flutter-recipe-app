// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/button/big_button.dart';
import 'package:recipe_app/presentation/component/button/medium_button.dart';
import 'package:recipe_app/presentation/component/button/small_button.dart';

void main() {
  group('Component Widget Test', () {
    testWidgets('Button 확인', (widgetTester) async {
      // Given

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              BigButton(text: 'Big Button', onTap: () {}),
              MediumButton(text: 'Medium Button', onTap: () {}),
              SmallButton(text: 'Small Button', onTap: () {}),
            ],
          ),
        ),
      );

      expect(find.text('Big Button'), findsOneWidget);
      expect(find.text('Medium Button'), findsOneWidget);
      expect(find.text('Small Button'), findsOneWidget);
    });

    testWidgets('Button Click Event Test', (widgetTester) async {
      var tapCount = 0;
      await widgetTester.pumpWidget(
        MaterialApp(
          home: MediumButton(
            text: 'text',
            onTap: () {
              tapCount++;
            },
          ),
        ),
      );

      await widgetTester.tap(find.byType(MediumButton));
      await widgetTester.pump();

      expect(tapCount, 1);
    });
  });
}
