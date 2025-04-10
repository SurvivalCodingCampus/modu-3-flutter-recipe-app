import 'package:flutter/material.dart';

import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/ui/ui.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        color: ColorStyles.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: ColorStyles.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(ingredient.imageUrl),
          ),
          const SizedBox(width: 16),
          Text(ingredient.name, style: TextStyles.normalTextBold),
          const Spacer(),
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
