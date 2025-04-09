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
import 'package:recipe_app/presentation/component/medium_Button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';

void main() {
  int tapCount = 0;

  testWidgets('BigButton test', (WidgetTester tester) async {
    tapCount = 0;
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

  testWidgets('MediumButton test', (WidgetTester tester) async {
    tapCount = 0;
    await tester.pumpWidget(
        MaterialApp(
          home: MediumButton(lable: 'MediumButton', onClick: () {
            tapCount++;
          }),
        )
    );

    final Finder MediumButtonFinder = find.text('MediumButton');
    expect(MediumButtonFinder, findsOneWidget);

    await tester.tap(MediumButtonFinder);
    await tester.pump();
    expect(tapCount, 1);
  });

  testWidgets('SmallButton test', (WidgetTester tester) async {
    tapCount = 0;
    await tester.pumpWidget(
        MaterialApp(
          home: SmallButton(lable: 'SmallButton', onClick: () {
            tapCount++;
          }),
        )
    );

    final Finder SmallButtonFinder = find.text('SmallButton');
    expect(SmallButtonFinder, findsOneWidget);

    await tester.tap(SmallButtonFinder);
    await tester.pump();
    expect(tapCount, 1);
  });


}
