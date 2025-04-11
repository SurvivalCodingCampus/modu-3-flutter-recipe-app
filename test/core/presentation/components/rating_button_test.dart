import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/rating_button.dart';

void main() {
  group('레이팅 버튼 테스트 : ', () {
    testWidgets('제대로 존재해야한다.', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: RatingButton(text: '5', isSelected: false)),
        ),
      );

      expect(find.text('5'), findsOneWidget);
    });
  });
}
