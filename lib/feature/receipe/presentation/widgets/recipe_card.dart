import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final int recipeId;
  final String imgUrl;
  final String? title;
  final String? owner;
  final double starCount;
  final bool? bookMarkStatus;
  final String? duration;
  final double height;
  final VoidCallback bookmarkTap;
  final VoidCallback? cardTap;
  const RecipeCard({
    required this.recipeId,
    required this.imgUrl,
    this.title,
    this.owner,
    required this.starCount,
    required this.bookmarkTap,
    this.cardTap,
    this.bookMarkStatus,
    this.duration,
    this.height = 150,
    super.key,
  });

  factory RecipeCard.fromModel({
    required Recipe recipe,
    required VoidCallback bookmarkTap,
    VoidCallback? cardTap,
  }) => RecipeCard(
    recipeId: recipe.id,
    imgUrl: recipe.image,
    title: recipe.name,
    owner: recipe.chef,
    starCount: recipe.rating,
    bookMarkStatus: recipe.bookmarkStatus,
    duration: recipe.time,
    bookmarkTap: bookmarkTap,
    cardTap: cardTap,
    height: 150,
  );

  factory RecipeCard.toInfo({
    required Recipe recipe,
    required VoidCallback bookmarkTap,
    VoidCallback? cardTap,
  }) => RecipeCard(
    recipeId: recipe.id,
    imgUrl: recipe.image,
    starCount: recipe.rating,
    bookMarkStatus: recipe.bookmarkStatus,
    duration: recipe.time,
    bookmarkTap: bookmarkTap,
    cardTap: cardTap,
    height: 150,
  );

  @override
  Widget build(BuildContext context) {
    return recipeCard();
  }

  Widget recipeCard() {
    return GestureDetector(
      onTap: cardTap,
      child: ClipRRect(
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
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.secondary20,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColor.rating,
                        ),
                        const SizedBox(width: 4),
                        Text('$starCount', style: AppTextStyle.smallRegular),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (title != null && owner != null)
                        Flexible(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title!,
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
                                duration!,
                                style: AppTextStyle.smallerRegular.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: bookmarkTap,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: AppColor.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    bookMarkStatus!
                                        ? Icons.bookmark
                                        : Icons.bookmark_outline,
                                    color: AppColor.primary80,
                                  ),
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
      ),
    );
  }
}
