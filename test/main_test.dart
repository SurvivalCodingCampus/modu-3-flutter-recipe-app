import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-09/presentation/component/big_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/input_field.dart';
import 'package:recipe_app/2025-04-09/presentation/component/medium_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/small_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/tabs.dart';
import 'package:recipe_app/main.dart';

void main() {
  testWidgets('Widget Buttons Test', (WidgetTester tester) async {
    final bigButton = BigButton(
      onClick: () {
        print('빅 버튼');
      },
    );
    final mediumButton = MediumButton(
      onClick: () {
        print('미디움 버튼');
      },
    );
    final smallButton = SmallButton(
      onClick: () {
        print('스몰 버튼');
      },
    );
    await tester.pumpWidget(MyApp());
    //BigButton이라는 타입의 위젯이 있는지 확인
    expect(find.byType(BigButton), findsOneWidget);
    expect(find.byType(MediumButton), findsOneWidget);
    expect(find.byType(SmallButton), findsOneWidget);
  });

  testWidgets('Widget Label Test', (WidgetTester tester) async {
    String updatedValue = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            onValueChange: (value) {
              updatedValue = value;
            },
          ),
        ),
      ),
    );

    // TextField를 찾아서 "Flutter" 입력
    await tester.enterText(find.byType(TextField), 'Flutter');
    await tester.pump();

    // updatedValue가 제대로 업데이트됐는지 확인
    expect(updatedValue, 'Flutter');
  });

  testWidgets('Widget Tabs Test', (tester) async {
    final labels = ['LABEL1', 'LABEL2'];
    final selectedIndex = 0;
    int testIndex = 0;
    onValueChange(int index) {
      testIndex = index;
    }

    final tabs = Tabs(
      labels: labels,
      selectedIndex: selectedIndex,
      onValueChange: onValueChange,
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: tabs)));

    // 탭이 존재하는지 확인
    for (final label in labels) {
      expect(find.text(label), findsOneWidget);
    }

    for (int i = 0; i < labels.length; i++) {
      await tester.tap(find.text(labels[i])); // 첫 번째 탭 클릭
      await tester.pump(); // 상태 반영
      expect(testIndex, i); // 클릭한 탭의 인덱스가 0인지 확인
    }
  });
}
