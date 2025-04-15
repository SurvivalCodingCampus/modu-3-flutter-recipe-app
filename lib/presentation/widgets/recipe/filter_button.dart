import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _borderColor),
          color: _bgColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTextStyle.smallRegular.copyWith(color: _textColor),
            ),
          ],
        ),
      ),
    );
  }

  Color get _borderColor =>
      isSelected ? AppColor.primary100 : AppColor.primary80;
  Color get _textColor => isSelected ? AppColor.white : AppColor.primary80;
  Color get _bgColor => isSelected ? AppColor.primary100 : AppColor.white;
}
