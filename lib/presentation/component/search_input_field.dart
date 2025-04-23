import 'package:flutter/material.dart';

import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SearchInputField extends StatelessWidget {
  final String placeholder;
  final void Function(String value) onValueChange;
  final VoidCallback onTap;
  final bool isRead;

  const SearchInputField({
    super.key,
    required this.placeholder,
    required this.onValueChange,
    required this.onTap,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 44,
      child: TextField(
        onTap: onTap,
        readOnly: isRead,
        style: TextFontStyle.smallRegular(color: ColorStyle.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: ColorStyle.gray4),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          hintText: placeholder,
          hintStyle: TextFontStyle.smallRegular(color: ColorStyle.gray4),
          labelStyle: TextFontStyle.smallRegular(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorStyle.gray4, width: 1.5),
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
    );
  }
}
