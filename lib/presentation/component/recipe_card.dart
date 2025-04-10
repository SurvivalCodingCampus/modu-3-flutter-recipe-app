import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  static const String _timerIcon = "assets/icons/timer.png";
  static const String _bookmarkIcon = "assets/icons/bookmark.png";

  final String imagePath;
  final String author;
  final String title;
  final double rating;
  final int cookTime;

  const RecipeCard({
    super.key,
    required this.imagePath,
    required this.author,
    required this.title,
    required this.cookTime,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorStyles.black,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorStyles.black.withAlpha(10),
                ColorStyles.black.withAlpha(255),
              ],
            ),
          ),
        ),
        _buildRating(),
        _buildTitle(),
        _buildAuthor(),
        _buildCookTime(),
        _buildBookMarkButton(),
      ],
    );
  }

  Positioned _buildRating() {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        decoration: BoxDecoration(
          color: ColorStyles.secondary20,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          spacing: 2,
          children: [
            Icon(Icons.star, color: ColorStyles.rating, size: 16),
            Text(
              '$rating',
              style: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildTitle() {
    return Positioned(
      left: 10,
      width: 170,
      bottom: 22,
      child: Text(
        title,
        style: TextStyles.smallTextBold.copyWith(color: ColorStyles.white),
      ),
    );
  }

  Positioned _buildAuthor() {
    return Positioned(
      left: 10,
      bottom: 10,
      child: Text(
        'By $author',
        style: TextStyles.labelTextBold.copyWith(color: ColorStyles.white),
      ),
    );
  }

  Positioned _buildCookTime() {
    return Positioned(
      right: 44,
      bottom: 10,
      child: Row(
        spacing: 5,
        children: [
          SizedBox(
            width: 17,
            height: 17,
            child: Image.asset(_timerIcon, color: ColorStyles.gray4),
          ),
          Text(
            '$cookTime min',
            style: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray4,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildBookMarkButton() => Positioned(
    right: 10,
    bottom: 10,
    child: Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(_bookmarkIcon, color: ColorStyles.primary80),
    ),
  );
}
