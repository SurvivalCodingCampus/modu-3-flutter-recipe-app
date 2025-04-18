import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/domain/model/ingredient.dart';
import 'package:recipe_app/domain/model/ingredient_with_amount.dart';

class IngredientItem extends StatelessWidget {
  final IngredientWithAmount ingredientWithAmount;

  const IngredientItem({super.key, required this.ingredientWithAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: ColorStyles.gray4,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: ColorStyles.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(ingredientWithAmount.ingredient.image))
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    ingredientWithAmount.ingredient.name,
                    style: TextStyles.normalBold(color: ColorStyles.labelColor),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Text(
                '${ingredientWithAmount.amount}g',
                style: TextStyles.smallRegular(color: ColorStyles.gray3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
