import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      // padding: EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(recipe.media.imageUrl),
          onError: (_, __) => print('Image load failed'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: SizedBox(
              height: 60,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: TextStyles.smallTextBold.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  Text(
                    'By ${recipe.user.name}',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                SizedBox(
                  width: 17,
                  height: 17,
                  child: Image.asset('assets/images/clock_icon.png'),
                ),
                SizedBox(width: 5),
                Text(
                  recipe.cookingTime,
                  style: TextStyles.smallTextRegular.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset('assets/images/bookmark_icon.png'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 16,
              width: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorStyles.secondary20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: ColorStyles.rating, size: 7),
                  SizedBox(width: 2.0),
                  Text(
                    recipe.rate.toString(),
                    style: TextStyles.smallerTextRegular.copyWith(fontSize: 8),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
