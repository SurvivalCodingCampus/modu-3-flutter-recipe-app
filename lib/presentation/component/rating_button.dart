import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class RatingButton extends StatelessWidget {
  final double rate;
  final bool isSelected;
  final VoidCallback? onPressed;

  const RatingButton({
    super.key,
    required this.rate,
    required this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
        constraints: const BoxConstraints(minWidth: 0),
        decoration: BoxDecoration(
          color: isSelected ? ColorStyle.primary100 : ColorStyle.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? ColorStyle.primary100 : ColorStyle.primary80,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rate.toStringAsFixed(0),
              style: AppTextStyles.smallRegular(
                color: isSelected ? ColorStyle.white : ColorStyle.primary80,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.star,
              size: 20,
              color: isSelected ? ColorStyle.white : ColorStyle.primary80,
            ),
          ],
        ),
      ),
    );
  }
}
