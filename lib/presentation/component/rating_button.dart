import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final void Function() onClick;
  final String text;
  final bool isSelected;

  const RatingButton({super.key, required this.text, required this.isSelected, required this.onClick});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.smallerRegular(
                color:
                    isSelected == true
                        ? ColorStyles.white
                        : ColorStyles.primary80,
              ),
            ),
            SizedBox(width: 5,),
            Icon(
              Icons.star,
              color: isSelected == true ? ColorStyles.white : ColorStyles.primary80,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
