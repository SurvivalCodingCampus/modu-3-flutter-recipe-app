import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final String imageName;
  final String ingredientName;
  final String amount;

  const IngredientItem({
    super.key,
    required this.imageName,
    required this.ingredientName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: ColorStyle.gray4,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: ColorStyle.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imageName),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(ingredientName, style: AppTextStyles.normalBold),
          ),
          Text(
            amount,
            style: AppTextStyles.smallRegular.copyWith(color: ColorStyle.gray3),
          ),
        ],
      ),
    );
  }
}
