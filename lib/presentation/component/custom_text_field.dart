import 'package:flutter/material.dart';

import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final void Function(String value) onValueChange;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextFontStyle.smallRegular()),
        Container(
          padding: EdgeInsets.only(top: 5),
          width: 315,
          child: TextField(
            style: TextFontStyle.smallRegular(color: ColorStyle.black),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: placeHolder,
              hintStyle: TextFontStyle.smallRegular(color: ColorStyle.gray4),
              labelStyle: TextFontStyle.smallRegular(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorStyle.gray4, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorStyle.primary80, width: 1.5),
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
