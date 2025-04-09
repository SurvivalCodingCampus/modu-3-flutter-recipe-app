import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/presentation/component/components.dart'
    show MediumButton;

void main() {
  testWidgets('MediumButton 렌더링이 정상적으로 이루어져야한다.', (WidgetTester tester) async {
    await tester.pumpWidget(MediumButtonTest(text: 'Render', onPressed: () {}));

    Finder result = find.text('Render');
    expect(result, findsOneWidget);
  });

  testWidgets('MediumButton 클릭 시 카운트가 증가해야한다.', (WidgetTester tester) async {
    int count = 0;

    await tester.pumpWidget(
      MediumButtonTest(text: 'Render', onPressed: () => count++),
    );

    await tester.tap(find.byType(MediumButton));
    expect(count, 1);
  });
}

class MediumButtonTest extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MediumButtonTest({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MediumButton(text: text, onPressed: () => onPressed())),
    );
  }
}
