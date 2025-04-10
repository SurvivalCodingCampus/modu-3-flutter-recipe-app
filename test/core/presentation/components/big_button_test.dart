import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/big_button.dart';

void main() {
  group('큰 버튼 테스트', () {
    testWidgets('글자 테스트', (tester) async {
      const String testText = 'Big Button';

      await tester.pumpWidget(
        MaterialApp(home: BigButton(text: testText, onClick: () {})),
      );

      final Finder finder = find.text(testText);

      expect(finder, findsNWidgets(1));
    });
    testWidgets('콜백 테스트', (tester) async {
      const String testText = 'Big Button';
      int testValue = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: BigButton(
            text: testText,
            onClick: () {
              testValue++;
            },
          ),
        ),
      );

      final Finder finder = find.byType(BigButton);

      await tester.tap(finder);
      await tester.pump();

      expect(testValue, 1);
    });
  });
}
