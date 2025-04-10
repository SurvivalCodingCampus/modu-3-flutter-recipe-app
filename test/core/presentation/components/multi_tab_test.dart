import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/multi_tabs.dart';

void main() {
  group('다수 탭 : ', () {
    const List<String> labels = ['label1', 'label2'];
    const int testSelectedIndex = 0;
    testFunc(value) {}

    testWidgets('존재 확인', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiTabs(
              labels: labels,
              selectedIndex: testSelectedIndex,
              onValueChange: testFunc,
            ),
          ),
        ),
      );

      final Finder findByLabelOne = find.text(labels[0]);
      final Finder findByLabelTwo = find.text(labels[1]);

      expect(findByLabelOne, findsOneWidget);
      expect(findByLabelTwo, findsOneWidget);
    });
    testWidgets('콜백 확인', (tester) async {
      int testCount = -11;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiTabs(
              labels: labels,
              selectedIndex: testSelectedIndex,
              onValueChange: (value) {
                testCount = value;
              },
            ),
          ),
        ),
      );

      final Finder findByLabelOne = find.text(labels[0]);
      final Finder findByLabelTwo = find.text(labels[1]);

      await tester.tap(findByLabelOne);
      await tester.pump();

      expect(testCount, 0);

      await tester.tap(findByLabelTwo);
      await tester.pump();

      expect(testCount, 1);
    });
  });
}
