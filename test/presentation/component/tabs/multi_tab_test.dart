import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/tabs/tabs.dart';

void main() {
  final List<String> labels = ['Tab 1', 'Tab 2'];

  testWidgets('MultiTab 렌더링이 정상적으로 이루어져야한다.', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiTabTest(labels: labels, onValueChange: (value) {}),
    );

    expect(find.text(labels[0]), findsOneWidget);
    expect(find.text(labels[1]), findsOneWidget);
  });

  testWidgets('MultiTab의 탭 요소 클릭 시 인덱스를 반환해야한다.', (WidgetTester tester) async {
    int firstCount = 0;
    int secondCount = 0;

    await tester.pumpWidget(
      MultiTabTest(
        labels: labels,
        onValueChange: (index) {
          if (index == 0) {
            firstCount++;
          } else if (index == 1) {
            secondCount++;
          }
        },
      ),
    );

    Finder first = find.text(labels[0]);
    Finder second = find.text(labels[1]);

    await tester.tap(first);
    await tester.tap(second);

    expect(firstCount, 1);
    expect(secondCount, 1);
  });
}

class MultiTabTest extends StatelessWidget {
  final List<String> labels;
  final ValueChanged<int> onValueChange;
  final int selectedIndex;

  const MultiTabTest({
    super.key,
    required this.labels,
    required this.onValueChange,
    int selectIndex = 0,
  }) : selectedIndex = selectIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MultiTab(
          onValueChange: onValueChange,
          labels: labels,
          selectIndex: selectedIndex,
        ),
      ),
    );
  }
}
