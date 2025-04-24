import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/domain/model/recipe.dart';

class DishCard extends StatelessWidget {
  final void Function(int id) onTapFavorite;
  final void Function(int id) onClick;
  final bool isBookmarked;
  final Recipe recipe;

  const DishCard({super.key, required this.onTapFavorite, required this.recipe, required this.isBookmarked, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(recipe.id);
      },
      child: SizedBox(
        width: 170,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 65),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorStyles.gray4,
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 130,
                  height: 130,
                  child: ClipOval(
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
                    )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          recipe.name,
                          textAlign: TextAlign.center,
                          style: TextStyles.smallBold(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Time', style: TextStyles.smallerRegular(color: ColorStyles.gray3)),
                                Text(recipe.time, style: TextStyles.smallBold())
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                onTapFavorite(recipe.id);
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 45,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
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
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
