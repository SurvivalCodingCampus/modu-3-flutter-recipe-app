import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/tabs.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class TabsExampleScreen extends StatefulWidget {
  const TabsExampleScreen({super.key});

  @override
  State<TabsExampleScreen> createState() => _TabsExampleScreen();
}

class _TabsExampleScreen extends State<TabsExampleScreen> {
  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  int selectedIndex3 = 0;

  void onValueChange1(int index) {
    setState(() {
      selectedIndex1 = index;
    });
  }

  void onValueChange2(int index) {
    setState(() {
      selectedIndex2 = index;
    });
  }

  void onValueChange3(int index) {
    setState(() {
      selectedIndex3 = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs 미리보기', style: AppTextStyles.largeBold()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Tabs(
              labels: const ['Label1', 'Label2'],
              selectIndex: selectedIndex1,
              onValueChange: onValueChange1,
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: IndexedStack(
                index: selectedIndex1,
                children: const [
                  Text('[1번탭] 첫 번째 탭 내용'),
                  Text('[1번탭] 두 번째 탭 내용'),
                ],
              ),
            ),

            Tabs(
              labels: const ['Label1', 'Label2', 'Label3'],
              selectIndex: selectedIndex2,
              onValueChange: onValueChange2,
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: IndexedStack(
                index: selectedIndex2,
                children: const [
                  Text('[2번탭] 첫 번째 탭 내용'),
                  Text('[2번탭] 두 번째 탭 내용'),
                  Text('[2번탭] 세 번째 탭 내용'),
                ],
              ),
            ),

            Tabs(
              labels: const ['Label1', 'Label2', 'Label3', 'Label4'],
              selectIndex: selectedIndex3,
              onValueChange: onValueChange3,
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: IndexedStack(
                index: selectedIndex3,
                children: const [
                  Text('[3번탭] 첫 번째 탭 내용'),
                  Text('[3번탭] 두 번째 탭 내용'),
                  Text('[3번탭] 세 번째 탭 내용'),
                  Text('[3번탭] 네 번째 탭 내용'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
