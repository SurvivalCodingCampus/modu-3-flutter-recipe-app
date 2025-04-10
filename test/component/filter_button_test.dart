import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/ui/ui.dart';

void main() {
  testWidgets('Filter Button 테스트', (tester) async {
    final btnName = '필터 버튼';
    final filterBtn = FilterButton(text: btnName);

    // 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: filterBtn)));

    // 초기 상태: 흰색
    final containerFinder = find.byType(Container);
    final containerWidget = tester.widget<Container>(containerFinder);

    final decoration = containerWidget.decoration as BoxDecoration?;
    expect(decoration?.color, ColorStyles.white);

    // 첫 번째 탭: primary100으로 변경
    await tester.tap(find.text(btnName));
    await tester.pump();

    final containerWidget1 = tester.widget<Container>(containerFinder);
    final decoration1 = containerWidget1.decoration as BoxDecoration?;
    expect(decoration1?.color, ColorStyles.primary100);

    // 두 번째 탭: 다시 흰색
    await tester.tap(find.text(btnName));
    await tester.pump();

    final containerWidget2 = tester.widget<Container>(containerFinder);
    final decoration2 = containerWidget2.decoration as BoxDecoration?;
    expect(decoration2?.color, ColorStyles.white);
  });
}
