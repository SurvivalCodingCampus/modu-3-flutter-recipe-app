import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(int value) onBookmarkClick;
  final bool isBookmark;
  const DishCard({
    super.key,
    required this.recipe,
    required this.onBookmarkClick,
    required this.isBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    recipe.foodName,
                    style: AppTextStyles.smallBold,
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
                style: AppTextStyles.smallRegular.copyWith(
                  color: ColorStyle.gray3,
                ),
              ),
              Text(
                recipe.time,
                style: AppTextStyles.smallBold.copyWith(
                  color: ColorStyle.gray1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 150,
          child: CircleAvatar(
            maxRadius: 55,
            backgroundImage: NetworkImage(recipe.image),
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
                  recipe.rate.toString(),
                  style: AppTextStyles.smallRegular.copyWith(fontSize: 10),
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
              onBookmarkClick(recipe.id);
            },
            child: SizedBox(
              width: 24,
              child: CircleAvatar(
                backgroundColor: ColorStyle.white,
                child: Icon(
                  !isBookmark ? Icons.bookmark_outline : Icons.bookmark,
                  color: ColorStyle.primary100,
                  size: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
