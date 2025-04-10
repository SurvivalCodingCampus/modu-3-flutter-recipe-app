import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/presentation/component/tabs_widget.dart';

void main() {
  testWidgets('TabsWidget onClick 테스트', (WidgetTester tester) async {
    int sampleIndex = 1;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TabsWidget(
              onValueChange: (index) {
                sampleIndex = index;
              },
              labels: ['label0', 'label1'],
              selectedIndex: 0
          )
        ),
      ),
    );
    final Finder label0 = find.text('label0');
    final Finder label1 = find.text('label1');
    expect(label0, findsOneWidget);
    expect(label1, findsOneWidget);

    await tester.tap(label0);
    expect(sampleIndex, 0);

    await tester.tap(label1);
    expect(sampleIndex, 1);
  });
}