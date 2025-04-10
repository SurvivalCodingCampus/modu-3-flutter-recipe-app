import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final Function(String) onValueChange;
  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.smallTextRegular),
        SizedBox(height: 5),
        SizedBox(
          height: 55,
          width: 315,
          child: TextFormField(
            initialValue: value,
            onChanged: onValueChange,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorStyles.primary80,
                  width: 1.5,
                ),
              ),
              hintText: placeHolder,
              hintStyle: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.gray4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
