import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../data/model/recipe_model.dart';
import '../../ui/text_styles.dart';

class IngredientList extends StatelessWidget {
  final Recipe recipe;

  const IngredientList({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipe.ingredients.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = recipe.ingredients[index];

        return Container(
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: ColorStyles.gray4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.ingredient.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item.ingredient.name,
                  style: TextStyles.mediumBold.copyWith(fontSize: 16),
                ),
              ),
              Text(
                '${item.amount}g',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        );
      },
    );
  }
}
