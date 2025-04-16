import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/domain/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final void Function(int id) onBookmark;
  final Recipe recipe;
  final bool isBookmarked;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onBookmark,
    required this.isBookmarked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CachedNetworkImage(
                imageUrl: recipe.image,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 45,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorStyles.secondary20,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, size: 11, color: ColorStyles.rating),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: TextStyles.smallerRegular(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: TextStyles.smallBold(color: ColorStyles.white),
                      ),
                      Text(
                        'By ${recipe.chef}',
                        style: TextStyles.smallerRegular(
                          color: ColorStyles.gray4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          size: 17,
                          color: ColorStyles.gray4,
                        ),
                        SizedBox(width: 5),
                        Text(
                          recipe.time,
                          style: TextStyles.smallRegular(
                            color: ColorStyles.gray4,
                          ),
                        ),
                        SizedBox(width: 12),
                        GestureDetector(
                          key: const Key('recipeCardBookmarkButton'),
                          onTap: () {
                            onBookmark(recipe.id);
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: ColorStyles.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                isBookmarked == true
                                    ? Icons.bookmark_rounded
                                    : Icons.bookmark_border_rounded,
                                size: 15,
                                color: ColorStyles.primary80,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
