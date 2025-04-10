import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({super.key, required this.ingredient});

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
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    ingredient.name,
                    style: TextStyles.normalBold(color: ColorStyles.labelColor),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Text(
                ingredient.weight,
                style: TextStyles.smallRegular(color: ColorStyles.gray3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
