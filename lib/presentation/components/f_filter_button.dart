import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FFilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FFilterButton({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary80 : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.primary80),
        ),
        child: Text(
          text,
          style: TextStyles.smallerTextRegular(
            color: isSelected ? AppColors.white : AppColors.primary80,
          ),
        ),
      ),
    );
  }
}
