import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class IngredientItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String weight;

  const IngredientItem({
    required this.title,
    required this.imagePath,
    required this.weight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ColorStyle.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 52,
            height: 52,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // ← 요게 핵심
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: ColorStyle.black,
                      child: const Icon(
                        Icons.error,
                        color: ColorStyle.white,
                        size: 24,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.normalBold(color: ColorStyle.labelColour),
            ),
          ),
          const Spacer(),
          Text(
            weight,
            style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
          ),
        ],
      ),
    );
  }
}
