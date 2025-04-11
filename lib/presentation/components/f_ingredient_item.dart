import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FIngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const FIngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gray4,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Image.network(
              ingredient.imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return const Icon(Icons.image_not_supported, size: 24);
              },
              loadingBuilder:  (_, widget, imageChunkEvent) {
                if (imageChunkEvent == null) {
                  return widget;
                }

                return const Icon(Icons.fastfood, size: 24);
              },
            ),
          ),

          const SizedBox(width: 16),

          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 114),
              child: Text(
                ingredient.name,
                style: TextStyles.normalTextBold(color: AppColors.black),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ),

          const Spacer(),
          Text(
            ingredient.weight,
            style: TextStyles.smallTextRegular(color: AppColors.gray3),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
