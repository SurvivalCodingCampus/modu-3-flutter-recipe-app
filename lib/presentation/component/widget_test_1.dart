import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/medium_Button.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16,), // 공백 추가
            InputField(titleLabel: 'Enter Password',
                controller: TextEditingController(),
                focusNode: FocusNode(),
                onValueChange: (changeValue) {
                  print('changeValue : $changeValue');
                }
            ),
            SizedBox(height: 16,), // 공백 추가
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
            SizedBox(height: 16,),
            Tabs(
              labels: ['Ingrident', 'Procedure'],
              selectedIndex: 0, // 상태 변수
              onValueChange: (index) {
                print('selectedIndex: $index');
              },
            ),

            SizedBox(height: 16,),
            Tabs(
              labels: ['Tab 1', 'Tab 2', 'Tab 3'],
              selectedIndex: 0, // 상태 변수
              onValueChange: (index) {
                print('selectedIndex: $index');
              },
            ),

          ],
        ),
      ),
    ),
  );
}