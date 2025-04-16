import 'package:flutter/material.dart';

import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final void Function(String value) onValueChange;

  const InputField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextFontStyle.smallRegular()),
        Container(
          padding: const EdgeInsets.only(top: 5),
          width: double.infinity,
          child: TextField(
            style: TextFontStyle.smallRegular(color: ColorStyle.black),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: placeholder,
              hintStyle: TextFontStyle.smallRegular(color: ColorStyle.gray4),
              labelStyle: TextFontStyle.smallRegular(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ColorStyle.gray4,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ColorStyle.primary80,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (value) {
              onValueChange(value);
            },
          ),
        ),
      ],
    );
  }
}
