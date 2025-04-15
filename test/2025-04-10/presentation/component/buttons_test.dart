import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/buttons.dart';

void main() {
  testWidgets('Buttons onTap', (WidgetTester tester) async {
    bool click = false;

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: Buttons(onClick: () {
        click = true;
      }))),
    );

    final buttonFinder = find.text('Button');
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    expect(click, isTrue);

  });
}
