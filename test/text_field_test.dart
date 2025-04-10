import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/custom_text_field.dart';

void main() {
  group('TextField Test', () {
    final label = 'label';
    final placeholder = 'placeholder';
    final inputValue = '';
    testWidgets('TextField 입력 값 확인', (widgetTester) async {
      widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              label: label,
              placeholder: placeholder,
              onValueChange: (value) {
                value = inputValue;
              },
            ),
          ),
        ),
      );

      expect(find.text('label'), findsOneWidget);
      expect(find.text('placeholder'), findsOneWidget);

      await widgetTester.enterText(find.byType(TextField), 'Hello');
      expect(inputValue, 'Hello');
    });
  });
}
