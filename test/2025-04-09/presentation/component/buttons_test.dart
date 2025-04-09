import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-09/presentation/component/buttons.dart';


void main() {
  testWidgets('ButtonsWidget', (WidgetTester tester) async {
    var tapCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: ButtonsWidget(
          onClick: () {
            tapCount ++;
          },
        )
      )
    );
    final Finder buttonFinder = find.byType(ElevatedButton);



    await tester.tap(buttonFinder.at(0));
    await tester.tap(buttonFinder.at(1));
    await tester.tap(buttonFinder.at(2));
    await tester.pump();

    expect(tapCount, 3);


  });
}