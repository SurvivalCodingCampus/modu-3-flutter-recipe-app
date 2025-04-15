import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/buttons.dart';

void main() {
  group('Buttons Widget Test', () {
    testWidgets('크기별 버튼이 존재확인 ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              Buttons(
                text: 'Big Button',
                size: ButtonSize.big,
                onPressed: () {
                  print('큰버튼');
                },
              ),
              Buttons(
                text: 'medium Button',
                size: ButtonSize.medium,
                onPressed: () {
                  print('중간 버튼');
                },
              ),
              Buttons(
                text: 'small Button',
                size: ButtonSize.small,
                onPressed: () {
                  print('작은 버튼');
                },
              ),
            ],
          ),
        ),
      );

      expect(find.text('Big Button'), findsOneWidget);
      expect(find.text('medium Button'), findsOneWidget);
      expect(find.text('small Button'), findsOneWidget);
    });

    testWidgets('클릭 시 콜백이 작동', (WidgetTester tester) async {
      var tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Buttons(
              text: '클릭하면 콜백',
              size: ButtonSize.small,
              onPressed: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Buttons);
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
      await tester.pump();
      expect(tapCount, 1);
    });
  });
}
