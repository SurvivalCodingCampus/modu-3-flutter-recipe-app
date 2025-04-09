import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      home: Scaffold(
        appBar: AppBar(title: Text('Recipe App')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 10,
                  children: [
                    BigButton(text: "Button", onPressed: () {}),
                    MediumButton(text: "Button", onPressed: () {}),
                    SmallButton(text: "Button", onPressed: () {}),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: InputField(
                  label: 'Label',
                  onValueChange: (value) {},
                  placeholder: 'Placeholder',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: MultiTab(
                  labels: ['Tab 1', 'Tab 2'],
                  onValueChange: (index) {
                    print(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
