import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: TabsTestScreen())));
}

class TabsTestScreen extends StatefulWidget {
  const TabsTestScreen({super.key});

  @override
  State<TabsTestScreen> createState() => _TabsTestScreenState();
}

class _TabsTestScreenState extends State<TabsTestScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Tabs(
                labels: ['떡볶이', '짜장면'],
                selectedIndex: _selectedIndex,
                onChanged: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              Image.network(
                _selectedIndex == 0
                    ? 'https://i.namu.wiki/i/R0AhIJhNi8fkU2Al72pglkrT8QenAaCJd1as-d_iY6MC8nub1iI5VzIqzJlLa-1uzZm--TkB-KHFiT-P-t7bEg.webp'
                    : 'https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2024/06/14/73ab8414-563a-4d96-a7df-b8f34bd0ac0c.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
