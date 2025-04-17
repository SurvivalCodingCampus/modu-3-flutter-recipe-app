import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/component/tabs.dart';

void main() {
  group('Tabs widget test', () {
    testWidgets('Tabs 라벨 렌더링 확인', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Tabs(
              labels: const ['Label1', 'Label2'],
              selectIndex: 0,
              onValueChange: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Label1'), findsOneWidget);
      expect(find.text('Label2'), findsOneWidget);
    });

    testWidgets('Tabs 탭 클릭 동작 확인', (tester) async {
      int selectedIndex = 0;
      late StateSetter setState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setStateCallback) {
                setState = setStateCallback;
                return Tabs(
                  labels: const ['Label1', 'Label2'],
                  selectIndex: selectedIndex,
                  onValueChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Label2'));
      await tester.pumpAndSettle();
      expect(selectedIndex, 1);
    });
  });
}
