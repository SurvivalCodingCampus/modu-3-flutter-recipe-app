import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/input_field.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class InputFieldExampleScreen extends StatelessWidget {
  const InputFieldExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputField 미리보기', style: AppTextStyles.largeBold()),
      ),
      body: Column(
        children: [
          InputField(
            label: 'Label 1',
            placeHolder: 'PlaceHolder',
            value: '',
            onValueChange: (value) {},
          ),
          InputField(
            label: 'Label 2',
            placeHolder: 'PlaceHolder',
            value: 'PlaceHolder',
            onValueChange: (value) {},
          ),
          InputField(
            label: 'Label 3',
            placeHolder: 'PlaceHolder',
            value: 'PlaceHolder',
            isDisabled: true,
            onValueChange: (value) {},
          ),
        ],
      ),
    );
  }
}
