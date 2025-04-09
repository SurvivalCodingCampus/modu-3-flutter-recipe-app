import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presention/common/component/custom_input_field.dart';

void main() {
  testWidgets('custom_input_field test', (tester) async{
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: CustomInputField(labelString: '아이디'),),
      )
    );

    final labelTextFider = find.text('아이디');

    expect(labelTextFider, findsOneWidget);
  });
}