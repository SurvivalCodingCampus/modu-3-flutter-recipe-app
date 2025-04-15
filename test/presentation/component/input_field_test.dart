import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

void main() {
  group('InputField widget test', () {
    testWidgets('InputField 존재확인', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputField(
              label: 'Label',
              placeHolder: 'PlaceHolder',
              value: 'value',
              onValueChange: (value) {},
            ),
          ),
        ),
      );

      final Finder finderBylabel = find.text('Label');
      final Finder finderByPlaceHolder = find.text('PlaceHolder');
      final Finder finderByValue = find.text('value');

      expect(finderBylabel, findsOneWidget);
      expect(finderByPlaceHolder, findsOneWidget);
      expect(finderByValue, findsOneWidget);
    });
    testWidgets('입력 확인', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputField(
              label: 'Label',
              placeHolder: 'PlaceHolder',
              value: 'value',
              onValueChange: (value) {},
            ),
          ),
        ),
      );

      final Finder finder = find.byType(InputField);

      await tester.enterText(finder, '입력');

      expect(find.text('입력'), findsOneWidget);
    });
  });
}
