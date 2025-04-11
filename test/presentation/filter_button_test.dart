import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentaiton/component/filter_button.dart';

void main() {
  testWidgets('버튼 누름 확인', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: FilterButton(buttons: Button(text: 'test'))),
    );
    expect(find.text('test'), findsOneWidget);
    await tester.tap(find.text('test'));
    await tester.pump();
  });
}
