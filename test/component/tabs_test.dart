import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  testWidgets('Tabs 테스트', (tester) async {
    final labels = ['탭1', '탭2', '탭3'];
    final selectedIndex = 0;
    int testIndex = 0;
    onTap(int index) {
      testIndex = index;
    }

    final tabs = Tabs(
      labels: labels,
      selectedIndex: selectedIndex,
      onTap: onTap,
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: tabs)));

    // 탭이 존재하는지 확인
    for (final label in labels) {
      expect(find.text(label), findsOneWidget);
    }

    for (int i = 0; i < labels.length; i++) {
      // 탭을 클릭했을 때 onTap이 호출되는지 확인
      await tester.tap(find.text(labels[i])); // 첫 번째 탭 클릭
      await tester.pump(); // 상태 반영
      expect(testIndex, i); // 클릭한 탭의 인덱스가 0인지 확인
    }
  });
}
