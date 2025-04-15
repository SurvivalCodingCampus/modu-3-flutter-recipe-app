import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/presentation/component/input_field_widget.dart';

void main() {
  testWidgets('InputFieldWidget onClick 테스트', (WidgetTester tester) async {
    String sampleText = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputFieldWidget(
            label: 'label',
            placeHolder: 'placeHolder',
            onValueChange: (text) {
              sampleText = text;
            },
          ),
        ),
      ),
    );

    final Finder textField = find.byKey(const Key('textField'));
    final Finder label = find.text('label');
    final Finder placeHolder = find.text('placeHolder');
    expect(textField, findsOneWidget);
    expect(label, findsOneWidget);
    expect(placeHolder, findsOneWidget);

    await tester.enterText(textField, '12345');
    expect(sampleText, '12345');
  });
}
