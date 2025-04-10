// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/main.dart';
import 'package:recipe_app/presentaiton/ui/color_styles.dart';
import 'package:recipe_app/presentaiton/ui/text_styles.dart';

void main() {
  final String placeHolder = 'Placeholder';

  testWidgets('value의 값 저장', (WidgetTester tester) async {
    final String value = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextFormField(
            initialValue: value,
            onChanged: (_){},
            style: TextStyles.smallerTextRegular,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray4,
              ),
              contentPadding: EdgeInsets.only(left: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorStyles.primary80,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );

   expect(find.text(placeHolder), findsOneWidget);
  });
}
