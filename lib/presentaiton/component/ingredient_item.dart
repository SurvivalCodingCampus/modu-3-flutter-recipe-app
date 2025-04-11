import 'package:flutter/material.dart';
import 'package:recipe_app/presentaiton/ui/color_styles.dart';

import '../ui/text_styles.dart';

class Ingredient {
  final String name;
  final int weight;

  const Ingredient({required this.name, required this.weight});
}

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: ColorStyles.gray4.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://egnmall.kr/thumb/d593060f9bf1cef1b7c8c1e58464c59a/800_800_ff051bc2a824cfe3df452c9ffcaf.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Text(
            ingredient.name,
            style: TextStyles.normalTextBold.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Text(
            '${ingredient.weight}g',
            style: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
        ],
      ),
    );
  }
}