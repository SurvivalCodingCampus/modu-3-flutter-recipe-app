import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/ingredient.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  final List<String> weights = ['500g', '300g'];

  IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: ColorStyles.gray4,
        border: Border.all(color: ColorStyles.gray4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 52,
              height: 52,
              child: Image.network(ingredient.imageUrl),
            ),
            const SizedBox(width: 16),
            Text(
              ingredient.name,
              style: TextStyles.normalTextBold.copyWith(
                color: ColorStyles.label,
              ),
            ),
            const Spacer(),
            Text(
              weights[Random().nextInt(weights.length)],
              style: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
