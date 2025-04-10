import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/common/component/custom_tabs.dart';

void main() {
  List<String> labels = ["레시피", "소개"];
  int selectedIndex = 0;

  testWidgets('custom tabs test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTabs(
            labels: labels,
            selectedIndex: selectedIndex,
            onValueChange: (selectedIndex) {
              print(selectedIndex);
            },
          ),
        ),
      ),
    );
    labels.map((e) => expect(find.text(e), findsOneWidget));
  });
}
