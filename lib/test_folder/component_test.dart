import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/ui/color_style.dart';

class ComponentTest extends StatelessWidget {
  const ComponentTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BigButton(
                    name: 'Button',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      print('나는 빅버튼');
                    },
                  ),
                  SizedBox(height: 12),
                  MediumButton(
                    name: 'Button',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      print('나는 미디움버튼');
                    },
                  ),
                  SizedBox(height: 12),
                  SmallButton(
                    name: 'Button',
                    color: ColorStyles.primary100,

                    onClick: () {
                      print('나는 스몰버튼');
                    },
                  ),
                  SizedBox(height: 12),
                  InputField(
                    label: 'Label',
                    placeHolder: 'PlaceHolder',
                    value: 'value',
                    onValueChange: (value) {
                      print('입력이 변경되었습니다.');
                    },
                  ),
                  SizedBox(height: 12),
                  InputField(
                    label: 'Label',
                    placeHolder: 'PlaceHolder',
                    value: '',
                    onValueChange: (value) {
                      print('입력이 변경되었습니다.');
                    },
                  ),
                  SizedBox(height: 12),
                  Tabs(
                    labels: ['label', 'label'],
                    selectedIndex: 0,
                    onValueChange: (index) {
                      print('클릭된 인덱스 : $index');
                    },
                  ),
                  SizedBox(height: 12),
                  Tabs(
                    labels: ['label', 'label', 'label'],
                    selectedIndex: 1,
                    onValueChange: (index) {
                      print('클릭된 인덱스 : $index');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
