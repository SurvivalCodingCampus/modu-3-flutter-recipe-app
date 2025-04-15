import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/label_input_field.dart';

void main() {
  testWidgets('Label Input Field 테스트', (tester) async {
    final label = '라벨';
    final hintText = '힌트 텍스트';
    final String firstValue = '처음값';
    String changedValue = firstValue;
    final String testValue = '헬로 플러터';

    final labelInputField = LabelInputField(
      label: label,
      placeholder: hintText,
      value: firstValue,
      onValueChange: (value) {
        changedValue = value;
      },
    );

    // 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: labelInputField)));

    // 라벨이 존재하는지 확인
    expect(find.text(label), findsOneWidget);

    // TextField를 찾아 텍스트 입력
    await tester.enterText(find.byType(TextField), testValue);
    await tester.pump(); // 상태 반영

    // 콜백이 호출되었는지 확인
    expect(changedValue, testValue);
  });
}
