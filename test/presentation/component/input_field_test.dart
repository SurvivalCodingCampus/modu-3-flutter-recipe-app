import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

void main() {
  const testLabel = '이름';
  const testPlaceholder = '이름을 입력하세요';
  const testValue = '홍길동';

  testWidgets('InputField 위젯이 라벨, 플레이스홀더, 값, 콜백을 제대로 처리한다', (tester) async {
    String changedValue = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            labelTitle: testLabel,
            placeholderText: testPlaceholder,
            value: testValue,
            onValueChange: (val) => changedValue = val,
          ),
        ),
      ),
    );

    expect(find.text(testLabel), findsOneWidget);
    expect(find.text(testPlaceholder), findsOneWidget);
    expect(find.text(testValue), findsOneWidget);

    await tester.enterText(find.byType(TextField), '이순신');
    expect(changedValue, '이순신');
  });
}
