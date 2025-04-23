import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/components/big_button.dart';
import 'package:recipe_app/presentation/components/input_field.dart';
import 'package:recipe_app/presentation/components/medium_button.dart';
import 'package:recipe_app/presentation/components/small_button.dart';
import 'package:recipe_app/presentation/components/tabs.dart';

void main() {
  group('컴포넌트 테스트', () {
    testWidgets('버튼위젯 테스트', (WidgetTester tester) async {
      bool bigButtonClicked = false;
      bool mediumButtonClicked = false;
      bool smallButtonClicked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                BigButton(
                  name: '빅버튼',
                  onClick: () => bigButtonClicked = true,
                  icon: Icons.arrow_forward,
                  color: Colors.blue,
                ),
                MediumButton(
                  name: '미디움버튼',
                  onClick: () => mediumButtonClicked = true,
                  icon: Icons.arrow_forward_sharp,
                  color: Colors.blue,
                ),
                SmallButton(
                  name: '스몰버튼',
                  onClick: () => smallButtonClicked = true,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      );

      // 텍스트가 표시되는지 확인
      expect(find.text('빅버튼'), findsOneWidget);
      expect(find.text('미디움버튼'), findsOneWidget);
      expect(find.text('스몰버튼'), findsOneWidget);

      // 아이콘이 표시되는지 확인
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_sharp), findsOneWidget);

      // 버튼을 탭하면 콜백이 실행되어야 함
      await tester.tap(find.byType(BigButton));
      expect(bigButtonClicked, isTrue);
      await tester.tap(find.byType(MediumButton));
      expect(mediumButtonClicked, isTrue);
      await tester.tap(find.byType(SmallButton));
      expect(smallButtonClicked, isTrue);
    });
  });

  testWidgets('인풋필드위젯 테스트', (WidgetTester tester) async {
    String updatedValue = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            label: 'Label',
            placeHolder: 'placeHolder',
            isSearch: false,
            controller: TextEditingController(),
            onValueChange: (value) => updatedValue = value,
            onTap: () {
              
            },
          ),
        ),
      ),
    );

    // 라벨 텍스트가 보이는지
    expect(find.text('Label'), findsOneWidget);

    // placeholder가 보이는지
    expect(find.text('placeHolder'), findsOneWidget);

    // 기본값이 있는지
    expect(find.text('기본값'), findsOneWidget);

    // 입력을 바꾸면 콜백이 실행되는지
    await tester.enterText(find.byType(TextFormField), '새이름');
    expect(updatedValue, '새이름');
  });

  testWidgets('탭스위젯 테스트', (WidgetTester tester) async {
    int selectedTab = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Tabs(
            labels: ['전체', '디저트', '음료'],
            selectedIndex: selectedTab,
            onValueChange: (index) => selectedTab = index,
          ),
        ),
      ),
    );

    // 탭 텍스트들이 보이는지 확인
    expect(find.text('전체'), findsOneWidget);
    expect(find.text('디저트'), findsOneWidget);
    expect(find.text('음료'), findsOneWidget);

    // 특정 탭을 누르면 콜백이 실행되어 selectedTab이 바뀌어야 함
    await tester.tap(find.text('음료'));
    expect(selectedTab, 2);
  });
}
