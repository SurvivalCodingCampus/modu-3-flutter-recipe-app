import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final void Function(String value) onValueChange;

  final TextEditingController controller;
  final FocusNode focusNode;
  final String titleLabel;

  const InputField({
    super.key,
    required this.titleLabel,
    required this.controller,
    required this.focusNode,
    required this.onValueChange,
  });

  bool get isFocused => focusNode.hasFocus;

  bool get hasText => controller.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // 화면의 80%
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleLabel, style: AppTextStyles.smallRegular),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            focusNode: focusNode,
            enableInteractiveSelection: false,
            onSubmitted: (value) {
              onValueChange(value);
            },
            onTapOutside: (event) {
              onValueChange(controller.text);
            },
            decoration: InputDecoration(
              hintText: isFocused || hasText ? '' : 'Placeholder',
              hintStyle: AppTextStyles.smallRegular,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.gray4, width: 1.5),
              ),
              // 포커스
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.primary80, width: 1.5),
              ),
              // 비활성화(enabled: false)
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.gray4, width: 1.5),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
