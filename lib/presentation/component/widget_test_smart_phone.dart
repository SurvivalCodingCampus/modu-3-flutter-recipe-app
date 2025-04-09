import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/medium_Button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            BigButton(lable: 'Button',
              onClick: () {
                print('BigButtonTest');
              },
            ),
            SizedBox(height: 16,), // 공백 추가
            MediumButton(lable: 'Button',
              onClick: () {
                print('MediumButtonTest');
              },
            ),
            SizedBox(height: 16,), // 공백 추가
            SmallButton(lable: 'Button',
              onClick: () {
                print('SmallButtonTest');
              },
            ),
          ],
        ),
      ),
    ),
  );
}