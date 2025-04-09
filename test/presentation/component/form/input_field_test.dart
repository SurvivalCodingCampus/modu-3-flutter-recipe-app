import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/components.dart'
    show InputField;

void main() {
  const String label = 'Render';
  const String placeholder = 'Placeholder';

  testWidgets('InputFiled 렌더링이 정상적으로 이루어져야한다.', (WidgetTester tester) async {
    await tester.pumpWidget(
      InputFieldTest(
        label: label,
        placeholder: placeholder,
        onValueChange: (value) {},
      ),
    );

    expect(find.text(label), findsOneWidget);
    expect(find.text(placeholder), findsOneWidget);
  });

  testWidgets('InputFiled 변경 시 콜백 함수가 정상 작동해야한다.', (WidgetTester tester) async {
    const String text = 'abc';
    String result = '';

    await tester.pumpWidget(
      InputFieldTest(
        label: label,
        placeholder: placeholder,
        onValueChange: (value) {
          result = value;
        },
      ),
    );

    Finder field = find.byType(InputField);
    await tester.enterText(field, text);

    expect(result, isNot(''));
    expect(result, text);
  });
}

class InputFieldTest extends StatelessWidget {
  const InputFieldTest({
    super.key,
    required this.label,
    required this.placeholder,
    required this.onValueChange,
  });

  final String label;
  final String placeholder;
  final ValueChanged<String> onValueChange;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: InputField(
          label: label,
          onValueChange: onValueChange,
          placeholder: placeholder,
        ),
      ),
    );
  }
}
