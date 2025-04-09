import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_sytle.dart';
import 'package:recipe_app/ui/text_style.dart';

class InputField extends StatelessWidget {
  final String labelTitle;
  final String placeholderText;
  final String value;

  final void Function(String)? onValueChange;

  const InputField({
    super.key,
    required this.labelTitle,
    required this.placeholderText,
    required this.value,
    this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    final double rounded = 10.0;
    const double placeholderVerticalPadding = 20.0;
    const double placeholderHorizontalPadding = 20.0;
    const double borderWidth = 1.5;

    return Column(
      children: [
        Text(
          labelTitle,
          style: AppTextStyles.smallRegular(color: ColorStyle.labelColour),
        ),
        TextField(
          controller: TextEditingController(text: value),
          onChanged: (value) {
            onValueChange?.call(value);
          },
          style: AppTextStyles.extraSmallRegular(color: ColorStyle.black),
          decoration: InputDecoration(
            hintText: placeholderText,
            filled: true,
            fillColor: ColorStyle.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: placeholderVerticalPadding,
              horizontal: placeholderHorizontalPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(rounded),
              borderSide: const BorderSide(
                color: ColorStyle.gray4,
                width: borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(rounded),
              borderSide: const BorderSide(
                color: ColorStyle.primary80,
                width: borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(rounded),
              borderSide: const BorderSide(
                color: ColorStyle.gray4,
                width: borderWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
