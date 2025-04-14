import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/widgets/base/textfield/app_textfield.dart';

void main() {
  testWidgets('text field widget test', (tester) async {
    final hintText = 'placeHolder';
    final text = 'test text';
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppTextField(controller: controller, hintText: hintText),
        ),
      ),
    );

    // 텍스트 필드에 글 작성
    await tester.enterText(find.byType(AppTextField), text);

    final hintTextFinder = find.text(hintText);
    final textFinder = find.text(text);

    expect(textFinder, findsOneWidget);
    expect(hintTextFinder, findsOneWidget);
  });
}
