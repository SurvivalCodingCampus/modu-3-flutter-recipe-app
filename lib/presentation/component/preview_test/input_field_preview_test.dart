import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputFieldPreviewPage(),
    ),
  );
}

class InputFieldPreviewPage extends StatelessWidget {
  const InputFieldPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    String text = '';
    return Scaffold(
      appBar: AppBar(title: const Text('InputField Preview')),
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
