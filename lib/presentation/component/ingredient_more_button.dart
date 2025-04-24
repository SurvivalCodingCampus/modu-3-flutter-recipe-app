import 'package:flutter/material.dart';

enum IngredientMore { share, rateRecipe, review, unSave }

class IngredientMoreButton extends StatelessWidget {
  final IngredientMore selectedItem;
  final void Function(IngredientMore) onSelected;
  final void Function()? onTapRateRecipe;
  const IngredientMoreButton({
    super.key,
    required this.selectedItem,
    required this.onSelected,
    this.onTapRateRecipe,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<IngredientMore>(
      initialValue: selectedItem,
      onSelected: (IngredientMore value) => onSelected(value),
      color: Colors.white,
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<IngredientMore>>[
            const PopupMenuItem<IngredientMore>(
              value: IngredientMore.share,
              child: Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 10),
                  Text('Share'),
                ],
              ),
            ),
            PopupMenuItem<IngredientMore>(
              onTap: onTapRateRecipe,
              value: IngredientMore.rateRecipe,
              child: const Row(
                children: [
                  Icon(Icons.star),
                  SizedBox(width: 10),
                  Text('Rate Recipe'),
                ],
              ),
            ),
            const PopupMenuItem<IngredientMore>(
              value: IngredientMore.review,
              child: Row(
                children: [
                  Icon(Icons.rate_review),
                  SizedBox(width: 10),
                  Text('Review'),
                ],
              ),
            ),
            const PopupMenuItem<IngredientMore>(
              value: IngredientMore.unSave,
              child: Row(
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 10),
                  Text('Unsave'),
                ],
              ),
            ),
          ],
    );
  }
}
