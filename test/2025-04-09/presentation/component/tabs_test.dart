import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-09/presentation/component/tabs.dart';


void main() {
  testWidgets('TabsWidget test', (WidgetTester tester) async {
    int? selectedTab;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body:TabsWidget(
              labels: ['1','2'],
              selectedindex: 0,
              onValueChange: (index) {
                selectedTab = index;
              }
          ),
        ),
      )
    );

    final tabFinder = find.text('2');
    expect(tabFinder, findsOneWidget);

    await tester.tap(tabFinder);
    await tester.pump();

    expect(selectedTab, 1);

  });
}