import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final ValueChanged<String> onValueChange;
  final String label;
  final String placeholder;
  final String value;

  const InputField({
    super.key,
    required this.label,
    required this.placeholder,
    this.value = '',
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.smallTextRegular.copyWith(color: ColorStyles.black),
        ),
        TextField(
          onChanged: onValueChange,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
            ),
            focusColor: ColorStyles.primary80,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorStyles.primary80, width: 1.5),
            ),
            hintStyle: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray4,
            ),
            hintText: placeholder,
          ),
        ),
      ],
    );
  }
}
