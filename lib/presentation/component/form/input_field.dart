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

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color, width: 1.5),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          label,
          style: TextStyles.smallTextRegular.copyWith(color: ColorStyles.black),
        ),
        TextField(
          onChanged: onValueChange,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 19,
            ),
            border: _border(ColorStyles.gray4),
            focusColor: ColorStyles.primary80,
            focusedBorder: _border(ColorStyles.primary80),
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
