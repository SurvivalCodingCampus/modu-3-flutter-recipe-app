import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onBookmarkClick;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onBookmarkClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 315 / 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(recipe.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 315 / 150,
            child: Container(
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
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyle.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                spacing: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: ColorStyle.rating, size: 12),
                  Text(
                    recipe.rate.toString(),
                    style: AppTextStyles.smallRegular.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    recipe.foodName,
                    style: AppTextStyles.mediumBold.copyWith(
                      color: ColorStyle.white,
                    ),
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
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.timer_outlined, color: ColorStyle.white),
                    const SizedBox(width: 5.0),
                    Text(
                      '${recipe.time} min',
                      style: AppTextStyles.smallRegular.copyWith(
                        color: ColorStyle.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                GestureDetector(
                  onTap: onBookmarkClick,
                  child: SizedBox(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
