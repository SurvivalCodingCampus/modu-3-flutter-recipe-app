import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class DishCard extends StatelessWidget {
  static const String _bookmarkIcon = "assets/icons/bookmark.png";
  final void Function(int recipeId) onTapBookmark;
  final void Function(int recipeId) onTapCard;

  final List<Recipe> recipes;

  const DishCard({
    super.key,
    required this.recipes,
    required this.onTapBookmark,
    required this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 15),
      scrollDirection: Axis.horizontal,
      itemCount: recipes.length,
      itemBuilder:
          (context, index) => SizedBox(
            width: 150,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 55,
                  child: GestureDetector(
                    onTap: () => onTapCard(recipes[index].id),
                    child: Container(
                      height: 176,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorStyles.gray4.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 121,
                  left: 10,
                  width: 130,
                  child: Text(
                    recipes[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyles.smallTextBold.copyWith(
                      color: ColorStyles.gray1,
                    ),
                  ),
                ),

                Positioned(
                  top: 182,
                  left: 10,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: TextStyles.smallTextRegular.copyWith(
                          color: ColorStyles.gray3,
                        ),
                      ),
                      Text(
                        '${recipes[index].cookTime} Mins',
                        style: TextStyles.smallTextBold.copyWith(
                          color: ColorStyles.gray1,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 22,
                  child: ClipOval(
                    child: SizedBox(
                      width: 109,
                      height: 110,
                      child: Image.network(
                        recipes[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 26,
                  left: 95,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorStyles.secondary20,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      spacing: 2,
                      children: [
                        const Icon(
                          Icons.star,
                          color: ColorStyles.rating,
                          size: 16,
                        ),
                        Text(
                          '${recipes[index].rating}',
                          style: TextStyles.smallTextRegular.copyWith(
                            color: ColorStyles.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 197,
                  left: 116,
                  child: GestureDetector(
                    onTap: () => onTapBookmark(recipes[index].id),
                    key: const Key('bookmark_button'),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: ColorStyles.primary80,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        _bookmarkIcon,
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
