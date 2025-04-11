import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/filter_button.dart';

void main() {
  group('필터 버튼 테스트 : ', () {
    testWidgets('제대로 존재해야한다.', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FilterButton(text: 'text', isSelected: false)),
        ),
      );

      expect(find.text('text'), findsOneWidget);
    });
  });
}
