import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presention/common/component/custom_input_field.dart';

void main() {
  testWidgets('custom_input_field test', (tester) async{
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: CustomInputField(labelString: '아이디'),),
      )
    );

    final labelTextFider = find.text('아이디');

    expect(labelTextFider, findsOneWidget);

    // 초기 상태 확인
    expect(focusNode.hasFocus, false);

    // 필드에 포커스 주기
    focusNode.requestFocus();
    await tester.pump();

    // 포커스 상태 확인
    expect(focusNode.hasFocus, true);

    // 텍스트 입력 테스트
    await tester.enterText(find.byType(TextField), '테스트');
    
    expect(find.text('테스트'), findsOneWidget);
  });
}