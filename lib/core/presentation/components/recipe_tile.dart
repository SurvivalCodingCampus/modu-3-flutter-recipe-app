import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;
  const RecipeTile({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(recipe.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorStyle.black.withValues(alpha: 0.7),
                ColorStyle.black.withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: ColorStyle.secondary20,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: ColorStyle.rating, size: 12),
                Text(
                  recipe.rate.toString(),
                  style: AppTextStyles.smallRegular.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 130,
                child: Text(
                  recipe.foodName,
                  style: AppTextStyles.smallBold.copyWith(
                    color: ColorStyle.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Text(
                'By ${recipe.chef}',
                style: AppTextStyles.smallRegular.copyWith(
                  color: ColorStyle.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
