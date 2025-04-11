import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final String name;
  final String weight;
  final String imagePath;

  const IngredientItem({
    super.key,
    required this.name,
    required this.weight,
    required this.imagePath,
  });

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
              child: Image.asset(imagePath),
            ),
            const SizedBox(width: 16),
            Text(
              name,
              style: TextStyles.normalTextBold.copyWith(
                color: ColorStyles.label,
              ),
            ),
            const Spacer(),
            Text(
              weight,
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
