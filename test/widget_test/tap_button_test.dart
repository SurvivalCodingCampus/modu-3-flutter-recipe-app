import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/pushed_button/big_tap_button.dart';

void main() {
  testWidgets('tapButton test', (tester) async {
    bool clicked = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BigTapButton(
            text: 'Button',
            onClick: () {
              clicked = true;
            },
          ),
        ),
      ),
    );
    expect(find.text('Button'), findsOneWidget);
    await tester.tap(find.text('Button'));
    await tester.pump();
    expect(clicked, true);
  });
}
