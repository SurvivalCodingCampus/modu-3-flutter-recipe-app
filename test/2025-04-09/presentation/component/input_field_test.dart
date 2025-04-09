import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-09/presentation/component/input_field.dart';


void main() {
  testWidgets('InputWidget test', (WidgetTester tester) async {
    String? input;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputWidget(
            onValueChange: (value) {
              input = value;
            },
          ),
        ),
      ),
    );
    final textFieldFinder = find.byType(TextField);

    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'hello');
    await tester.pump();

    expect(input, 'hello');


  });
}