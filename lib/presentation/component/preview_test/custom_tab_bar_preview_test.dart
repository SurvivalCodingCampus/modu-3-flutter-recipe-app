import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/custom_tab_bar.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomTabBarPreviewPage(),
    ),
  );
}

class CustomTabBarPreviewPage extends StatefulWidget {
  const CustomTabBarPreviewPage({super.key});

  @override
  State<CustomTabBarPreviewPage> createState() =>
      _CustomTabBarPreviewPageState();
}

class _CustomTabBarPreviewPageState extends State<CustomTabBarPreviewPage> {
  int _tabsTwoSelectedIndex = 0;
  int _tabsThreeSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomTabBar Preview')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTabBar(
              tabTitles: ['test', 'test2'],
              onTabSelected: (index) {
                setState(() {
                  _tabsTwoSelectedIndex = index;
                });
              },
              selectedIndex: _tabsTwoSelectedIndex,
            ),
            CustomTabBar(
              tabTitles: ['test', 'test2', 'test3'],
              onTabSelected: (index) {
                setState(() {
                  _tabsThreeSelectedIndex = index;
                });
              },
              selectedIndex: _tabsThreeSelectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
