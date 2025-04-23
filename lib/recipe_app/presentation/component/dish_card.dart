import 'package:flutter/material.dart';

import '../../data/model/recipe.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTapFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 230,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            child: Container(
              width: 170,
              height: 180,
              decoration: BoxDecoration(
                color: ColorStyles.gray4,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 45),
                    Center(
                      child: Text(
                        recipe.name,
                        textAlign: TextAlign.center,
                        style: TextStyles.smallerTextBold.copyWith(
                          fontSize: 12,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Time',
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.gray3,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${recipe.time.toString()} Mins',
                          style: TextStyles.smallerTextBold.copyWith(
                            color: ColorStyles.gray1,
                            fontSize: 11,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTapFavorite,
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: (170 - 90) / 2,
            child: ClipOval(
              child: Image.network(
                recipe.image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 20,
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
                        recipe.rate.round().toStringAsFixed(1),
                        style: TextStyles.rateText.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
