import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-10/ui/color_styles2.dart';
import 'package:recipe_app/2025-04-10/ui/text_styles2.dart';

class IngredientItem extends StatelessWidget {
  final String imagePath;
  final String ingredient;
  final String amount;

  const IngredientItem({
    super.key,
    required this.imagePath,
    required this.ingredient,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        color: ColorStyles2.containerColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 0, 3),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Image.asset(imagePath),
                  ),
                  SizedBox(width: 12),
                  Text(ingredient, style: TextStyles2.ingredientsText),
                ],
              ),
            ),
            Text(amount, style: TextStyles2.amountText),
          ],
        ),
      ),
    );
  }
}
