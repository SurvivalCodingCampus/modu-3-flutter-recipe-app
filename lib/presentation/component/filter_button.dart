import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe_app/data/type/category_filter.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final void Function() onClick;
  final String text;
  final bool isSelected;
  final bool star;

  const FilterButton({
    super.key,
    required this.onClick,
    required this.text,
    required this.isSelected,
    required this.star
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected == true ? ColorStyles.primary100 : ColorStyles.white,
          border: Border.all(color: ColorStyles.primary100, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyles.smallerRegular(
                color:
                    isSelected == true
                        ? ColorStyles.white
                        : ColorStyles.primary100,
              ),
            ),
            SizedBox(width: 5,),
            star == true
                ? Icon(Icons.star, color: ColorStyles.primary100, size: 18)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
