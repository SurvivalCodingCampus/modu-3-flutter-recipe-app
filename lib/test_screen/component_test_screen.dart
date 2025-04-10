import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';

import 'package:recipe_app/presentation/component/input_field.dart';

import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/test_screen/button_screen.dart';
import 'package:recipe_app/test_screen/ingredient_screen.dart';
import 'package:recipe_app/test_screen/rating_screen.dart';
import 'package:recipe_app/test_screen/recipe_card_screen.dart';
import 'package:recipe_app/ui/color_style.dart';

class ComponentTestScreen extends StatelessWidget {
  const ComponentTestScreen({super.key});

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
                    name: 'Ingredient',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => IngredientScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  BigButton(
                    name: 'Recipe Card',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecipeCardScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  BigButton(
                    name: '버튼 스크린',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ButtonScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  BigButton(
                    name: '레이팅 스크린',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RatingScreen()),
                      );
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
