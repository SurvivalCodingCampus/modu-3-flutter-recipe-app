import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterButton({super.key, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isSelected ? ColorStyle.primary100 : ColorStyle.white,
      side: BorderSide(color: ColorStyle.primary100),
      label: Text(
        text,
        style: AppTextStyles.smallRegular.copyWith(
          color: isSelected ? ColorStyle.white : ColorStyle.primary80,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
