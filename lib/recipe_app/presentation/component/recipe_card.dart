import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

import '../../data/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool showTimerAndBookmark;
  final VoidCallback onToggleBookMark;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.showTimerAndBookmark,
    required this.onToggleBookMark,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(recipe.imagePath),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 150,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          right: 6,
          top: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
            child: Container(
              width: 37,
              height: 16,
              decoration: BoxDecoration(
                color: ColorStyles.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: ColorStyles.rating, size: 7.5),
                    SizedBox(width: 2),
                    Text(
                      recipe.rate.toStringAsFixed(1),
                      style: TextStyles.rateText.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 12,
          bottom: 15,
          right: showTimerAndBookmark ? 110 : 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.title,
                style:
                    showTimerAndBookmark
                        ? TextStyles.menuIntroduceText
                        : TextStyles.menuIntroduceText.copyWith(fontSize: 11),
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 3),
              Text(
                'By ${recipe.chef}',
                style:
                    showTimerAndBookmark
                        ? TextStyles.chefNameText
                        : TextStyles.chefNameText.copyWith(fontSize: 8),
              ),
            ],
          ),
        ),
        if (showTimerAndBookmark)
          Positioned(
            right: 12,
            bottom: 10,
            child: Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: ColorStyles.chefName,
                  size: 17,
                ),
                SizedBox(width: 3),
                Text.rich(
                  TextSpan(
                    text: recipe.minutes.toString(),
                    style: TextStyles.cookingTimeText,
                    children: [
                      TextSpan(text: ' min', style: TextStyles.cookingTimeText),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: onToggleBookMark,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    width: 24,
                    height: 24,
                    child: Icon(
                      recipe.bookMarked
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
