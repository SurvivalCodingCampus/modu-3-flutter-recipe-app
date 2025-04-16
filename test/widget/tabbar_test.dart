import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/widgets/tab/app_tabbar.dart';

void main() {
  testWidgets('tabbar widget test', (tester) async {
    final tabs = ['test1', 'test2'];
    int value = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            body: AppTabBar(
              tabs: tabs,
              onValueChange: (val) {
                value = val;
              },
            ),
          ),
        ),
      ),
    );
    final tab1Finder = find.text(tabs[0]);
    final tab2Finder = find.text(tabs[1]);
    await tester.tap(tab2Finder);

    expect(tab1Finder, findsOneWidget);
    expect(tab2Finder, findsOneWidget);
    expect(value, equals(1));
  });
}
