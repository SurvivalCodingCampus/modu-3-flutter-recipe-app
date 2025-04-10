import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const RatingButton({required this.text, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _borderColor),
          color: _bgColor,
        ),
        child: Row(
          children: [
            Text(
              text,
              style: AppTextStyle.smallRegular.copyWith(color: _textIconColor),
            ),
            const SizedBox(width: 5),
            Icon(Icons.star, color: _textIconColor),
          ],
        ),
      ),
    );
  }

  Color get _borderColor =>
      isSelected ? AppColor.primary100 : AppColor.primary80;
  Color get _textIconColor => isSelected ? AppColor.white : AppColor.primary80;
  Color get _bgColor => isSelected ? AppColor.primary100 : AppColor.white;
}
