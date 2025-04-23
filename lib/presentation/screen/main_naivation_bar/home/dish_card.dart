import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;

  const DishCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/recipe-detail/${recipe.recipeId}');
      },
      child: Stack(
        children: [
          Positioned(
            top: 55,
            child: Container(
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorStyle.gray4,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      recipe.title,
                      style: AppTextStyles.smallBold(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
                ),
                Text(
                  '${recipe.time.toString()} Mins',
                  style: AppTextStyles.smallBold(color: ColorStyle.gray1),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: CircleAvatar(
              maxRadius: 55,
              backgroundImage: NetworkImage(recipe.thumbNailUrl),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
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
                    recipe.rating.toString(),
                    style: AppTextStyles.smallRegular(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: GestureDetector(
              onTap: () {
                print('북마크');
              },
              child: const SizedBox(
                width: 24,
                child: CircleAvatar(
                  backgroundColor: ColorStyle.white,
                  child: Icon(
                    Icons.bookmark_outline,
                    color: ColorStyle.primary100,
                    size: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
