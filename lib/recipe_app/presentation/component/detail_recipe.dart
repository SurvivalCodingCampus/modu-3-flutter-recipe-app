import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/ui/button_styles.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class DetailRecipe extends StatelessWidget {
  final Recipe recipe;

  const DetailRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            RecipeCard(
              recipe: recipe,
              showTimerAndBookmark: true,
              onToggleBookMark: () {},
              onTapCard: () {},
              showNameAndChef: false,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallerTextBold,
                    maxLines: 2,
                  ),
                ),
                Text('(13k Reviews)', style: TextStyles.regular),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Image.asset('assets/images/chef.png'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recipe.chef, style: TextStyles.smallTextBold),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorStyles.primary80,
                              ),
                              Text(
                                'Lagos, Nigeria',
                                style: TextStyles.smallerTextRegular,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyles.selectedButton,
                  child: Text(
                    'Follow',
                    style: TextStyles.smallerTextBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
