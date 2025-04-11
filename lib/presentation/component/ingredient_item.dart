import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final String ingredientImage;
  final String ingredientName;
  final String ingredientQuantity;

  const IngredientItem({
    super.key,
    required this.ingredientImage,
    required this.ingredientName,
    required this.ingredientQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        color: ColorStyles.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorStyles.white,
              image: DecorationImage(
                image: NetworkImage(ingredientImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Text(
            ingredientName,
            style: TextStyles.normalBold.copyWith(
              color: ColorStyles.black,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            ingredientQuantity,
            style: TextStyles.smallBold.copyWith(
              color: ColorStyles.gray3,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
