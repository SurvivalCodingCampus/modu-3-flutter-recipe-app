import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final int recipeId;
  final String imgUrl;
  final String title;
  final String owner;
  final double starCount;
  final bool? bookMarkStatus;
  final int? duration;
  final double height;
  const RecipeCard({
    required this.recipeId,
    required this.imgUrl,
    required this.title,
    required this.owner,
    required this.starCount,
    this.bookMarkStatus,
    this.duration,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return recipeCard();
  }

  Widget recipeCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.black.withValues(alpha: 0.0), AppColor.black],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.secondary20,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: AppColor.rating),
                      const SizedBox(width: 4),
                      Text('$starCount', style: AppTextStyle.smallRegular),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyle.mediumBold.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                          Text(
                            'By $owner',
                            style: AppTextStyle.smallerRegular.copyWith(
                              color: AppColor.grey4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (bookMarkStatus != null && duration != null)
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              color: AppColor.white,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$duration min',
                              style: AppTextStyle.smallerRegular.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.bookmark_outline,
                                color: AppColor.primary80,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
