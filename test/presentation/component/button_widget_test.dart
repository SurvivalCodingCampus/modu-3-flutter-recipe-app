// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/presentation/component/button_widget.dart';

void main() {
  testWidgets('BigButton 테스트', (WidgetTester tester) async {
    bool isClicked = false;
    await tester.pumpWidget(
        MaterialApp(
          home: ButtonWidget(
              buttonSize: ButtonSize.big,
              buttonText: 'Button',
              onClick: () {
                isClicked = !isClicked;
              }
          ),
        )
    );
    final Finder bigButtonFinder = find.text('Button');
    expect(bigButtonFinder, findsOneWidget);

    await tester.tap(bigButtonFinder);
    await tester.pump();
    expect(isClicked, isTrue);
  });
  testWidgets('MediumButton 테스트', (WidgetTester tester) async {
    bool isClicked = false;
    await tester.pumpWidget(
        MaterialApp(
          home: ButtonWidget(
              buttonSize: ButtonSize.medium,
              buttonText: 'Button',
              onClick: () {
                isClicked = !isClicked;
              }
          ),
        )
    );
    final Finder mediumButtonFinder = find.text('Button');
    expect(mediumButtonFinder, findsOneWidget);

    await tester.tap(mediumButtonFinder);
    await tester.pump();
    expect(isClicked, isTrue);
  });
  testWidgets('SmallButton 테스트', (WidgetTester tester) async {
    bool isClicked = false;
    await tester.pumpWidget(
        MaterialApp(
          home: ButtonWidget(
              buttonSize: ButtonSize.small,
              buttonText: 'Button',
              onClick: () {
                isClicked = !isClicked;
              }
          ),
        )
    );
    final Finder smallButtonFinder = find.text('Button');
    expect(smallButtonFinder, findsOneWidget);

    await tester.tap(smallButtonFinder);
    await tester.pump();
    expect(isClicked, isTrue);
  });
}