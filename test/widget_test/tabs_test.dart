import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  testWidgets('tabs test', (tester) async {
    int tappedIndex = -1;
    await tester.pumpWidget(
      MaterialApp(
        home: Tabs(
          labels: ['one', 'two', 'three'],
          selectedIndex: 1,
          onChanged: (index) {
            tappedIndex = index;
          },
        ),
      ),
    );
    expect(find.text('two'), findsOneWidget);
    await tester.tap(find.text('three'));
    await tester.pump();
    expect(tappedIndex, 2);
  });
}
