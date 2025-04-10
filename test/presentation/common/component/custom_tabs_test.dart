import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/common/component/custom_tabs.dart';

void main() {
  List<String> labels = ["레시피", "소개"];
  int selectedIndex = 0;
  int? tappedIndex;
  testWidgets('custom tabs test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTabs(
            labels: labels,
            selectedIndex: selectedIndex,
            onValueChange: (selectedIndex) {
              labels.map((e) {
                selectedIndex = labels.indexOf(e);
              });
              tappedIndex = selectedIndex;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text(labels[1]));
    await tester.pump();
    expect(tappedIndex, 1);
  });
}
