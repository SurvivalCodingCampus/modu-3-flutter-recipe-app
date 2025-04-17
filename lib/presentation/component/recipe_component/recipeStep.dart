import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';

class RecipeStep extends StatelessWidget {
  final int index;
  final String description;

  const RecipeStep({super.key, required this.index, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: ColorStyle.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step ${index + 1}',
            style: AppTextStyles.smallBold(color: ColorStyle.labelColour),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
          ),
        ],
      ),
    );
  }
}
