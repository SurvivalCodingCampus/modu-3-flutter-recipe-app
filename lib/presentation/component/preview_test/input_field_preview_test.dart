import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

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
    String text = '';
    return Scaffold(
      appBar: AppBar(title: const Text('CustomButton Preview')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              labelTitle: 'labelTitle',
              placeholderText: 'placeholderText',
              value: text,
              onValueChange: (value) {
                text = value;
                print(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
