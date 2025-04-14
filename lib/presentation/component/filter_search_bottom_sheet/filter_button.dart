import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

  const FilterButton({
    super.key,
    required this.title,
    required this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, right: 4),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          constraints: const BoxConstraints(minWidth: 0),
          decoration: BoxDecoration(
            color: isSelected ? ColorStyle.primary100 : ColorStyle.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? ColorStyle.primary100 : ColorStyle.primary80,
              width: 1,
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.smallRegular(
              color: isSelected ? ColorStyle.white : ColorStyle.primary80,
            ),
          ),
        ),
      ),
    );
  }
}
