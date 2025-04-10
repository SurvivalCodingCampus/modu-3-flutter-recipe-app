import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';
import 'package:recipe_app/presentation/component/tabs_widget.dart';

import 'component/button_widget.dart';
import 'component/ingredient_item.dart';

class ComponentTestScreen extends StatelessWidget {
  const ComponentTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('과제중...'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
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
                SizedBox(
                  height: 55,
                  child: TabsWidget(
                    onValueChange: (index) {
                      print('index가 $index로 바뀌었습니다.');
                    },
                    labels: ['Label0', 'Label1'],
                    selectedIndex: 0,
                  ),
                ),
                IngredientItem(ingredient: Ingredient(name: 'Tomatos', weight: '500g')),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
