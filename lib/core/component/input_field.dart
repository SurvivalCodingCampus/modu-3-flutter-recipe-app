import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final void Function(String changed) onValueChange;
  final bool isDisabled;
  final bool isPassword;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
    this.isDisabled = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);
    // 커서가 항상 끝으로 가도록 처리
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.smallRegular()),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          onChanged: isDisabled ? null : onValueChange,
          enabled: !isDisabled,
          obscureText: isPassword,
          style: AppTextStyles.smallRegular(
            color: isDisabled ? ColorStyle.gray2 : ColorStyle.black,
          ),
          decoration: InputDecoration(
            hintText: placeHolder,
            hintStyle: AppTextStyles.smallRegular(color: ColorStyle.gray2),
            filled: isDisabled,
            fillColor: isDisabled ? ColorStyle.gray4 : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorStyle.gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorStyle.primary80),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorStyle.gray4),
            ),
          ),
        ),
      ],
    );
  }
}
