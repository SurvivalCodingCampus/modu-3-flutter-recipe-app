import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          imageUi(),
          gradationUi(),
          rateUi(),
          Positioned(
            bottom: 5,
            right: 5,
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.timer_outlined, color: ColorStyle.white),
                Text(
                  '${recipe.cookingTime} min',
                  style: TextFontStyle.smallRegular(color: ColorStyle.gray4),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.zero,
                    minimumSize: Size(30, 30),
                  ),
                  child: Icon(Icons.save, color: ColorStyle.primary80),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    recipe.title,
                    style: TextFontStyle.smallBold(color: ColorStyle.white),
                  ),
                ),
                Text(
                  'by ${recipe.id}',
                  style: TextFontStyle.extraSmallRegular(
                    color: ColorStyle.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container gradationUi() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black87],
        ),
      ),
    );
  }

  SizedBox imageUi() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Image.network(recipe.imageUrl, fit: BoxFit.cover),
    );
  }

  Positioned rateUi() {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyle.secondary20,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          child: Row(
            spacing: 3,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: ColorStyle.rating, size: 16),
              Text(recipe.rate.toString(), style: TextFontStyle.smallRegular()),
            ],
          ),
        ),
      ),
    );
  }
}
