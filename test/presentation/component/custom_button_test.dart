import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';

void main() {
  group('CustomButton Widget Test', () {
    const bigText = 'Big';
    const mediumText = 'Medium';
    const smallText = 'Small';
    const clickMeText = 'Click Me';

    testWidgets('렌더링: big, medium, small 버튼 각각 표시되는지', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: const [
              CustomButton(title: bigText, size: CustomButtonSize.big),
              CustomButton(title: mediumText, size: CustomButtonSize.medium),
              CustomButton(title: smallText, size: CustomButtonSize.small),
            ],
          ),
        ),
      );

      expect(find.text(bigText), findsOneWidget);
      expect(find.text(mediumText), findsOneWidget);
      expect(find.text(smallText), findsOneWidget);
    });

    testWidgets('클릭 시 콜백이 잘 동작하는지', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: CustomButton(
            title: clickMeText,
            size: CustomButtonSize.medium,
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      );

      await tester.tap(find.byType(CustomButton));
      await tester.pump();

      expect(wasPressed, isTrue);
    });
  });
}
