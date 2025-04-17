import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RecipeDetailCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(int value) onBookmarkClick;

  const RecipeDetailCard({
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
                  image: NetworkImage(recipe.image),
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
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, color: ColorStyle.white),
                    const SizedBox(width: 5.0),
                    Text(
                      recipe.time,
                      style: AppTextStyles.smallRegular.copyWith(
                        color: ColorStyle.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    onBookmarkClick(recipe.id);
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
