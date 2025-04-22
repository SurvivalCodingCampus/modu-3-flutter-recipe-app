import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';

import '../../ui/ui.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: SizedBox(
        width: 150,
        height: 230,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 175,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorStyles.gray4,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  width: 130,
                  height: 42,
                  child: Center(
                    child: Text(
                      recipe.name,
                      style: TextStyles.smallTextBold.copyWith(
                        color: ColorStyles.gray1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: ColorStyles.gray3,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        recipe.totalTimeMinutes,
                        style: TextStyles.smallerTextBold.copyWith(
                          color: ColorStyles.gray1,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => onTapFavorite(recipe),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.bookmark_border_outlined,
                        size: 16,
                        color:
                            recipe.isFavorite
                                ? ColorStyles.primary80
                                : ColorStyles.gray3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: SizedBox(
                width: 110,
                height: 110,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(recipe.imageUrl),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 0,
              child: Container(
                width: 45,
                height: 23,
                decoration: BoxDecoration(
                  color: ColorStyles.secondary20,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: ColorStyles.rating, size: 10),
                    const SizedBox(width: 4),
                    Text(
                      recipe.rating.toString(),
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
