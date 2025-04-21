import 'package:flutter/material.dart';

import '../../data/model/recipe_model.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 251,
      height: 127,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 카드 본체
          Positioned(
            top: 20,
            child: Container(
              width: 251,
              height: 107,
              padding: const EdgeInsets.only(
                top: 35,
                left: 12,
                right: 12,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 251 * 2 / 3,
                        child: Text(
                          recipe.name,
                          style: TextStyles.normalBold.copyWith(fontSize: 13),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // 별점
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 14,
                            color:
                                index < recipe.rating.round()
                                    ? Colors.orange
                                    : Colors.grey[300],
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),

                      // 셰프
                      Text(
                        'By ${recipe.chef}',
                        style: TextStyles.smallerRegular.copyWith(
                          fontSize: 11,
                          color: ColorStyles.gray4,
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          recipe.time,
                          style: TextStyles.smallerRegular.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 이미지
          Positioned(
            top: 0,
            right: 10,
            child: ClipOval(
              child: Image.network(
                recipe.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => const Icon(Icons.broken_image, size: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
