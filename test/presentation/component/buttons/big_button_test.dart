import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/presentation/component/components.dart'
    show BigButton;

void main() {
  testWidgets('BigButton 렌더링이 정상적으로 이루어져야한다.', (WidgetTester tester) async {
    await tester.pumpWidget(BigButtonTest(text: 'Render', onPressed: () {}));

    Finder result = find.text('Render');
    expect(result, findsOneWidget);
  });

  testWidgets('BigButton 클릭 시 카운트가 증가해야한다.', (WidgetTester tester) async {
    int count = 0;

    await tester.pumpWidget(
      BigButtonTest(text: 'Render', onPressed: () => count++),
    );

    await tester.tap(find.byType(BigButton));
    expect(count, 1);
  });
}

class BigButtonTest extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BigButtonTest({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: BigButton(text: text, onPressed: () => onPressed())),
    );
  }
}
