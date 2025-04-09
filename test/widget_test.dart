// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/presentation/component/big_button.dart';

void main() {
  int tapCount = 0;

  testWidgets('BigButton test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BigButton(lable: 'BigButton', onClick: () {
          tapCount++;
        }),
      )
    );

    final Finder BigButtonFinder = find.text('BigButton');
    expect(BigButtonFinder, findsOneWidget);

    await tester.tap(BigButtonFinder);
    await tester.pump();
    expect(tapCount, 1);
  });
}
