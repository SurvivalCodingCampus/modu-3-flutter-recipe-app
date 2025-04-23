import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/ingredients.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class IngredientItem extends StatelessWidget {
  final Ingredients ingredients;

  const IngredientItem({super.key, required this.ingredients});

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
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Image.network(
              ingredients.ingredient.image,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          ),
          SizedBox(width: 16),
          Text(ingredients.ingredient.name, style: TextStyles.normalTextBold),
          Expanded(child: SizedBox()),
          Text(
            '${ingredients.amount}g',
            style: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
