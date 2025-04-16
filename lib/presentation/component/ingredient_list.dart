import 'package:flutter/material.dart';

import '../../data/model/recipe_ingredient.dart';

class IngredientList extends StatelessWidget {
  final List<RecipeIngredient> ingredients;

  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = ingredients[index];

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.network(item.ingredient.imageUrl, width: 40, height: 40),
              const SizedBox(width: 12),
              Expanded(child: Text(item.ingredient.name)),
              Text('${item.amount}g'),
            ],
          ),
        );
      },
    );
  }
}
