import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

import '../../data/model/recipe.dart';

class NewRecipeButton extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeButton({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            child: Container(
              width: 251,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10), // 그림자 색 (투명하게)
                    spreadRadius: 0, // 그림자 퍼지는 정도
                    blurRadius: 10, // 흐릿하게 만드는 정도
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            right: 125,
            child: Text(
              recipe.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.smallTextBold.copyWith(
                color: ColorStyles.gray1,
              ),
            ),
          ),
          Positioned(
            top: 85,
            left: 10,
            child: Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  size: 14,
                  color:
                      index < recipe.rate ? ColorStyles.rating : Colors.white,
                );
              }),
            ),
          ),
          Positioned(
            top: 105,
            left: 10,
            child: Row(
              children: [
                Image.asset('assets/images/chef.png', width: 24, height: 24),
                SizedBox(width: 10),
                Text(
                  recipe.chef,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 105,
            right: 10,
            child: Row(
              children: [
                Icon(Icons.timer_outlined, size: 22, color: ColorStyles.gray3),
                SizedBox(width: 5),
                Text(
                  recipe.time.toString(),
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
                Text(
                  'mins',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: (250 - 200) / 2,
            child: ClipOval(
              child: Image.network(
                recipe.image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
