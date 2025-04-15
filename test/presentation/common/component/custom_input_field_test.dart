import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/common/component/custom_input_field.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';

void main() {
  testWidgets('custom_input_field test', (tester) async {
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomInputField(labelString: '아이디', focusNode: focusNode, hintString: '아이디 입력',),
        ),
      ),
    );

    final labelTextFider = find.text('아이디');

    expect(labelTextFider, findsOneWidget);

    expect(focusNode.hasFocus, false);

    focusNode.requestFocus();
    await tester.pump();

    expect(focusNode.hasFocus, true);

    await tester.enterText(find.byType(TextField), '테스트');

    expect(find.text('테스트'), findsOneWidget);

    final textField = find.byType(TextField);
    final decoration =
        tester.widget<TextField>(textField).decoration as InputDecoration;
    expect(decoration.focusedBorder, isNotNull);
    expect(
      (decoration.focusedBorder as OutlineInputBorder).borderSide.color,
      equals(ColorStyle.primary100),
    );
  });
}
