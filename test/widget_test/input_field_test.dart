import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

void main() {
  testWidgets('input_field test', (tester) async {
    String changedValue = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            label: 'Id',
            holder: 'Id를 입력하세요',
            value: 'Harmony',
            onChanged: (val) {
              changedValue = val;
            },
          ),
        ),
      ),
    );
    expect(find.text('Id'), findsOneWidget);
    expect(find.text('Id를 입력하세요'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Harmony'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '집에 가고 싶다');
    expect(changedValue, '집에 가고 싶다');
  });
}
