import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-09/presentation/component/big_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/input_field.dart';
import 'package:recipe_app/2025-04-09/presentation/component/small_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/tabs.dart';
import 'package:recipe_app/2025-04-09/ui/color_styles.dart';

import '2025-04-09/presentation/component/medium_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('UI 연습'),
          centerTitle: true,
          backgroundColor: ColorStyles.appBarColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BigButton(
                onClick: () {
                  print('빅버튼');
                },
              ),
              MediumButton(
                onClick: () {
                  print('미디움버튼');
                },
              ),
              SmallButton(
                onClick: () {
                  print('스몰버튼');
                },
              ),
              InputField(
                onValueChange: (String) {
                  print('입력내용 $String');
                },
              ),
              Tabs(
                selectedIndex: 0,
                labels: ['Label1', 'Label2'],
                onValueChange: (int) {
                  print('$int');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
