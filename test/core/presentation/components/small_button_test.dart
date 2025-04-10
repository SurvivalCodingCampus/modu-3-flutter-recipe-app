import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';

void main() {
  group('작은 버튼 테스트', () {
    const String testText = 'Small Button';
    int testValue = 0;

    testWidgets('글자 테스트', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: SmallButton(text: testText, onClick: () {})),
      );

      final Finder finder = find.text(testText);

      expect(finder, findsNWidgets(1));
    });
    testWidgets('콜백 테스트', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SmallButton(
            text: testText,
            onClick: () {
              testValue++;
            },
          ),
        ),
      );

      final Finder finder = find.byType(SmallButton);

      await tester.tap(finder);
      await tester.pump();

      expect(testValue, 1);
    });
  });
}
