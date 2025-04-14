import 'package:flutter/material.dart';
import 'package:recipe_app/presentaiton/ui/color_styles.dart';

import '../../data/model/recipe.dart';
import '../ui/text_styles.dart';


class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    String linesText = '';

    for (int i = 0; i < recipe.title.length; i += 22) {
      int end = (i + 22 < recipe.title.length) ? i + 22 : recipe.title.length;
      linesText += recipe.title.substring(i, end) + '\n';
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                recipe.imageUrl,
                width: 315,
                height: 150,
                fit: BoxFit.cover,
              ),
              Container(
                width: 315,
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54, Colors.black],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 37,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, size: 8, color: ColorStyles.secondary60),
                      SizedBox(width: 3),
                      Text('${recipe.rateStar}', style: TextStyles.smallerTextRegular),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  recipe.author,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray4,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 22,
                child: Column(
                  children: [
                    Text(
                      linesText.trim(),
                      style: TextStyles.smallTextBold.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/icons/bookmark.png',
                    width: 16,
                    height: 16,
                    color: ColorStyles.primary80,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
              ),
              Positioned(
                right: 87,
                bottom: 13.5,
                child: Image.asset(
                  'assets/icons/timer.png',
                  width: 17,
                  height: 17,
                  color: ColorStyles.gray4,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
              Positioned(
                right: 44,
                bottom: 13.5,
                child: Text(
                  '${recipe.cookTimes} min',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
