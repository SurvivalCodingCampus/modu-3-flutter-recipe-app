import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final bool isBookmarked;
  final void Function(int recipeId) onBookmarkTap;
  const DishCard({
    super.key,
    required this.recipe,
    required this.isBookmarked,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(width: 150, height: 231),

        Positioned(
          bottom: 0,
          child: Container(
            width: 150,
            height: 176,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorStyles.gray4,
            ),
            child: Center(
              child: Text(
                recipe.title,
                style: TextStyles.smallTextBold,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: SizedBox(
            width: 50,
            height: 40,
            child: Column(
              children: [
                Text(
                  "Time",
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
                Text(recipe.cookingTime, style: TextStyles.smallerTextBold),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              onBookmarkTap(recipe.recipeId);
            },
            child: SizedBox(
              width: 24,
              height: 24,
              child:
                  isBookmarked
                      ? Icon(
                        Icons.bookmark_added,
                        color: ColorStyles.secondary100,
                      )
                      : Icon(Icons.bookmark_border, color: ColorStyles.white),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 20,
          child: CircleAvatar(
            radius: 55,
            foregroundImage: NetworkImage(recipe.imageUrl),
          ),
        ),
        Positioned(
          top: 30,
          right: 0,
          child: Container(
            height: 23,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorStyles.secondary20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: ColorStyles.rating, size: 10),
                SizedBox(width: 2.0),
                Text(
                  recipe.rating.toString(),
                  style: TextStyles.smallerTextRegular,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
