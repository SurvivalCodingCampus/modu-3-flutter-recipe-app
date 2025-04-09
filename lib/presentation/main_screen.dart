import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';
import 'package:recipe_app/presentation/component/tabs_widget.dart';

import 'component/button_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('과제중...'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            ButtonWidget(
              buttonSize: ButtonSize.big,
              buttonText: 'Button',
              onClick: () {
                print('Big Button');
              },
            ),
            ButtonWidget(
              buttonSize: ButtonSize.medium,
              buttonText: 'Button',
              onClick: () {
                print('Medium Button');
              },
            ),
            ButtonWidget(
              buttonSize: ButtonSize.small,
              buttonText: 'Button',
              onClick: () {
                print('Small Button');
              },
            ),
            InputFieldWidget(
              label: 'Label',
              placeHolder: 'PlaceHolder',
              value: 'PlaceHolder',
              onValueChange: (String value) {
                print(value);
              },
            ),
            TabsWidget(
              onValueChange: (index) {
                print('index가 $index로 바뀌었습니다.');
              },
              labels: ['Label0', 'Label1'],
              selectedIndex: 0,
            ),
          ],
        ),
      ),
    );
  }
}
