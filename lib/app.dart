import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigButton(text: 'Button'),
              SizedBox(height: 10),
              MediumButton(text: 'Button'),
              SizedBox(height: 10),
              SmallButton(text: 'Button'),
              SizedBox(height: 10),
              InputField(
                label: 'Lable',
                holder: 'Placeholder',
                value: '',
                onChanged: (value) {},
              ),
              SizedBox(height: 10),
              Tabs(
                labels: ['어제', '오늘', '내일'],
                selectedIndex: 1,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
