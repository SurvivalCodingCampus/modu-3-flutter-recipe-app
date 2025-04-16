import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SavedRecipesDetailView extends StatelessWidget {
  final Recipe recipe;
  const SavedRecipesDetailView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          spacing: 10,
          children: [
            RecipeCard(recipe: recipe),
            Row(
              children: [
                Text(recipe.title, style: TextFontStyle.smallBold()),
                Text(
                  '(13K Reviews)',
                  style: TextFontStyle.smallRegular(color: ColorStyle.gray4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
