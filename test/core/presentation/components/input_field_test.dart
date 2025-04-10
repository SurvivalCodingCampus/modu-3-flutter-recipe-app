import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/input_field.dart';

void main() {
  group('인풋 필드', () {
    const String testLabel = 'testLabel';
    const String testPlaceHolder = 'testPlaceHolder';
    const String testValue = 'value';
    testFunc(value) {}

    testWidgets('존재 확인', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputField(
              label: testLabel,
              placeHolder: testPlaceHolder,
              value: testValue,
              onValueChange: testFunc,
            ),
          ),
        ),
      );

      final Finder finderBylabel = find.text(testLabel);
      final Finder finderByPlaceHolder = find.text(testPlaceHolder);
      final Finder finderByValue = find.text(testValue);

      expect(finderBylabel, findsOneWidget);
      expect(finderByPlaceHolder, findsOneWidget);
      expect(finderByValue, findsOneWidget);
    });
    testWidgets('입력 확인', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputField(
              label: testLabel,
              placeHolder: testPlaceHolder,
              value: testValue,
              onValueChange: testFunc,
            ),
          ),
        ),
      );

      final Finder finder = find.byType(InputField);

      await tester.enterText(finder, 'Input Test');

      expect(find.text('Input Test'), findsOneWidget);
    });
  });
}
