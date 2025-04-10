import 'package:flutter/material.dart';
import 'package:recipe_app/ui/text_styles.dart';

import '../../../ui/color_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final void Function(String changed) onValueChange;

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
        Text(label, style: AppTextStyles.smallRegular),
        const SizedBox(height: 4),
        TextField(
          controller: TextEditingController(text: value),
          onChanged: (value) {
            onValueChange(value);
          },
          decoration: InputDecoration(
            hintText: placeHolder,
            hintStyle: AppTextStyles.smallRegular.copyWith(
              color: ColorStyle.gray4,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorStyle.gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorStyle.primary80),
            ),
          ),
        ),
      ],
    );
  }
}
