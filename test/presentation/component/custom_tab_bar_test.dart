// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  const tabs = ['전체', '한식', '양식'];

  testWidgets('CustomTabBar에서 탭을 클릭하면 콜백이 호출된다', (tester) async {
    int selectedIndex = -1;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Tabs(
            tabTitles: tabs,
            selectedIndex: 0,
            onTabSelected: (index) {
              selectedIndex = index;
            },
          ),
        ),
      ),
    );

    for (final label in tabs) {
      expect(find.text(label), findsOneWidget);
    }

    await tester.tap(find.text('양식'));
    expect(selectedIndex, 2);
  });
}
