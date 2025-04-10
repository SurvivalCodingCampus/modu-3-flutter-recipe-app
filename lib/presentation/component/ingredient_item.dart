import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorStyles.gray4,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 52,
            height: 52,
            child: Image.asset(ingredient.imageUrl),
          ),
          SizedBox(width: 16),
          Text(ingredient.name, style: TextStyles.normalTextBold),
          Expanded(child: SizedBox()),
          Text('${ingredient.weight}g', style: TextStyles.smallTextRegular.copyWith(color: ColorStyles.gray3)),
        ],
      ),
    );
  }
}
