import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                const Icon(
                  Icons.timer_outlined,
                  color: ColorStyle.white,
                  size: 20,
                ),
                Text(
                  '${recipe.time} min',
                  style: TextFontStyle.extraSmallRegular(
                    color: ColorStyle.gray4,
                  ),
                ),
                ElevatedButton(
                  onPressed: onBookmarkToggle,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(30, 30),
                  ),
                  child: Icon(
                    isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border_rounded,
                    color: ColorStyle.primary80,
                  ),
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
                  width: 170,
                  child: Text(
                    recipe.title,
                    style: TextFontStyle.smallBold(color: ColorStyle.white),
                  ),
                ),
                Text(
                  'by ${recipe.chef}',
                  style: TextFontStyle.extraSmallRegular(
                    color: ColorStyle.white,
                  ).copyWith(fontSize: 8),
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
      height: 160,
      decoration: const BoxDecoration(
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
      height: 160,
      width: double.infinity,
      child: Image.network(recipe.pictures.imageUrl, fit: BoxFit.cover),
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
              const Icon(Icons.star, color: ColorStyle.rating, size: 12),
              Text(
                recipe.rating.toString(),
                style: TextFontStyle.smallRegular().copyWith(fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
