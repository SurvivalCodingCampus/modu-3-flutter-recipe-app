// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/main.dart';
import 'package:recipe_app/presentaiton/component/tabs.dart';

void main() {
  testWidgets('탭 클릭시 인덱스 호출 확인', (WidgetTester tester) async {
    int selectedIndex = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: TabsWidget(
          labels: ['Label', 'Label2'],
          selectedIndex: 0,
          onValueChange: (index) {
            selectedIndex = index;
          },
        ),
      ),
    );

    // 초기값 확인
    expect(selectedIndex, 0);

    await tester.tap(find.text('Label2'));

    //UI 업테이트를 위해 필요
    await tester.pump();
    expect(selectedIndex, 1);
  });
}
