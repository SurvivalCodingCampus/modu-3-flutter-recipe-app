import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/custom_tab_bar.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomButtonPreviewPage(),
    ),
  );
}

class CustomButtonPreviewPage extends StatelessWidget {
  const CustomButtonPreviewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomButton Preview')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTabBar(
              tabTitles: ['test', 'test2'],
              onTabSelected: (index) {
                print(index);
              },
              selectedIndex: 0,
            ),
          ],
        ),
      ),
    );
  }
}
