import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/big_button.dart';

void main() {
  testWidgets('button test', (tester) async {
    var clickCounter = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: BigButton(
          text: 'Button',
          onClick: () {
            clickCounter++;
          },
        ),
      ),
    );

    await tester.tap(find.byType(BigButton));
    await tester.pump();

    expect(clickCounter, 1);

    await tester.tap(find.byType(BigButton));
    await tester.pump();

    expect(clickCounter, 2);
  });
}
