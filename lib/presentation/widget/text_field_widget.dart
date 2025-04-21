import 'package:flutter/material.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged; 

  const TextFieldWidget({
    required this.hintText,
    this.prefixIcon,
    super.key, 
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12), // 높이 간섭 최소화
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorStyle.gray4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorStyle.gray4),
          ),
        ),
      ),
    );
  }
}
