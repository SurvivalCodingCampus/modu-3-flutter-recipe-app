

import 'package:flutter/material.dart';

import '../../data/model/recipe.dart';
import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class HalfRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const HalfRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                recipe.imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(0),
                      Colors.black,
                    ],
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
                      Text(
                        '${recipe.rateStar}',
                        style: TextStyles.smallerTextRegular,
                      ),
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
                    SizedBox(
                      width: 130,
                      height: 24,
                      child: Text(
                        recipe.title,
                        style: TextStyles.smallTextBold.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Text(
                  recipe.cookTimes,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
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
