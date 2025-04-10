import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final void Function() onClick;
  final String text;
  final bool isSelected;

  const FilterButton({super.key, required this.onClick, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 50,
        height: 28,
        decoration: BoxDecoration(
            color: isSelected == true
                ? ColorStyles.primary80
                : ColorStyles.white,
            border: Border.all(
              color: ColorStyles.primary80,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.smallerRegular(
              color:
              isSelected == true
                  ? ColorStyles.white
                  : ColorStyles.primary80,
            ),
          ),
        ),
      ),
    );
  }
}
