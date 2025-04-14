import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/component/image_roader.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned.fill(
            child:
                recipe.thumbNailUrl.startsWith('http')
                    ? RecipeImageLoader(imageUrl: recipe.thumbNailUrl)
                    : Image.asset(recipe.thumbNailUrl, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorStyle.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: ColorStyle.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, size: 14, color: Color(0xFFFFAD30)),
                  SizedBox(width: 4),
                  Text('4.0', style: AppTextStyles.smallRegular()),
                ],
              ),
            ),
          ),
          // 텍스트와 하단 정보
          Positioned(
            left: 12,
            bottom: 12,
            right: 12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 텍스트
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        recipe.title,
                        style: AppTextStyles.smallBold(color: ColorStyle.white),
                      ),

                      Text(
                        'By ${recipe.userName}',
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.timer, color: ColorStyle.gray4, size: 17),
                    const SizedBox(width: 4),
                    Text(
                      '${recipe.time} min',
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.gray4,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: ColorStyle.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.bookmark_border,
                        color: ColorStyle.primary80,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
