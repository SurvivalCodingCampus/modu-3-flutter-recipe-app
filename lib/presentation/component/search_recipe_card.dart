import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SearchRecipeCard extends StatelessWidget {
  final String imagePath;
  final String author;
  final String title;
  final int rating;

  const SearchRecipeCard({
    super.key,
    required this.imagePath,
    required this.author,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
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
      ],
    );
  }

  Widget _buildRating() {
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
            const Icon(Icons.star, color: ColorStyles.rating, size: 16),
            Text(
              '${rating.toDouble()}',
              style: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
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

  Widget _buildAuthor() {
    return Positioned(
      left: 10,
      bottom: 10,
      child: Text(
        'By $author',
        style: TextStyles.labelTextBold.copyWith(color: ColorStyles.white),
      ),
    );
  }
}
