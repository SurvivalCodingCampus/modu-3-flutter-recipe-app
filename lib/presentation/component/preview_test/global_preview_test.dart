import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';
import 'package:recipe_app/presentation/component/custom_tab_bar.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ComponentPreviewPage(),
    ),
  );
}

class ComponentPreviewPage extends StatefulWidget {
  const ComponentPreviewPage({super.key});

  @override
  State<ComponentPreviewPage> createState() => _ComponentPreviewPageState();
}

class _ComponentPreviewPageState extends State<ComponentPreviewPage> {
  int _selectedTabIndex = 0;
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Component Preview')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 📌 CustomTabBar
            CustomTabBar(
              tabTitles: ['Tab 1', 'Tab 2'],
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            const SizedBox(height: 24),

            /// 📌 InputField
            InputField(
              labelTitle: '이름',
              placeholderText: '이름을 입력하세요',
              value: _inputText,
              onValueChange: (value) {
                _inputText = value;
              },
            ),
            const SizedBox(height: 24),

            /// 📌 CustomButton (Big / Medium / Small)
            CustomButton(
              title: 'Big Button',
              size: CustomButtonSize.big,
              onPressed: () => debugPrint('Big 버튼 눌림'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              title: 'Medium Button',
              size: CustomButtonSize.medium,
              onPressed: () => debugPrint('Medium 버튼 눌림'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              title: 'Small Button',
              size: CustomButtonSize.small,
              onPressed: () => debugPrint('Small 버튼 눌림'),
            ),
          ],
        ),
      ),
    );
  }
}
