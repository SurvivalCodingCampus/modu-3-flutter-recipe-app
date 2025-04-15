import 'package:flutter/material.dart';
import 'package:recipe_app/ui/text_styles.dart';

import '../../../ui/color_styles.dart';

class SearchInput extends StatelessWidget {
  final void Function(String changed) onValueChange;
  final TextEditingController controller;

  const SearchInput({
    super.key,
    required this.onValueChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          onValueChange(value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: ColorStyle.gray4),
          hintText: 'Search recipe',
          hintStyle: AppTextStyles.smallRegular.copyWith(
            color: ColorStyle.gray4,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorStyle.gray4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorStyle.primary80),
          ),
        ),
      ),
    );
  }
}
