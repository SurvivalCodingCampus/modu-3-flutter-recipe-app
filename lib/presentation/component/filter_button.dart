import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData? icon;
  final VoidCallback onChange;

  const FilterButton({
    super.key,
    required this.text,
    this.isSelected = false,
    this.icon,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = ColorStyle.primary100;
    final Color unselectedColor = ColorStyle.primary80;

    final Color backgroundColor = isSelected ? selectedColor : ColorStyle.white;
    final Color borderColor = isSelected ? selectedColor : unselectedColor;
    final Color textColor = isSelected ? ColorStyle.white : unselectedColor;
    final Color iconColor = textColor;

    return GestureDetector(
      onTap: onChange,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: AppTextStyles.smallRegular(color: textColor)),

            if (icon != null) ...[
              const SizedBox(width: 6),
              Icon(icon, size: 18, color: iconColor),
            ],
          ],
        ),
      ),
    );
  }
}
