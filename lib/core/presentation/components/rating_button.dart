import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const RatingButton({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      decoration: BoxDecoration(
        color: !isSelected ? ColorStyle.white : ColorStyle.primary100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: !isSelected ? ColorStyle.primary100 : ColorStyle.white,
        ),
      ),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyles.smallBold.copyWith(
              color: !isSelected ? ColorStyle.primary80 : ColorStyle.white,
            ),
          ),
          Icon(
            Icons.star,
            color: !isSelected ? ColorStyle.primary80 : ColorStyle.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}
