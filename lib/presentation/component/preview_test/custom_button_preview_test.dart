import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';

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
