import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/common/component/custom_input_field.dart';

void main() {
  testWidgets('custom_input_field test', (tester) async{
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: CustomInputField(labelString: '아이디',focusNode:
        focusNode,),),
      )
    );

    final labelTextFider = find.text('아이디');

    expect(labelTextFider, findsOneWidget);


    expect(focusNode.hasFocus, false);


    focusNode.requestFocus();
    await tester.pump();


    expect(focusNode.hasFocus, true);

    await tester.enterText(find.byType(TextField), '테스트');

    expect(find.text('테스트'), findsOneWidget);
  });
}