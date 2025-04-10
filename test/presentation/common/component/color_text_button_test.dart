import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/common/component/color_text_button.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';

void main() {
  int _count = 0;

  testWidgets('ColorTextButton test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ColorTextButton(
            buttonHeight: 60,
            buttonWidth: 315,
            buttonText: 'button',
            buttonColor: ColorStyle.primary100,
            textColor: ColorStyle.white,
            onPressed: () {
              _count++;
              print("테스트 카운터 $_count");
            },
            buttonRadius: 10,
          ),
        ),
      ),
    );

    final titleFider = find.text('button');
    await tester.tap(titleFider);
    await tester.pump();

    expect(titleFider, findsOneWidget);
    expect(_count, 1);
  });

}
