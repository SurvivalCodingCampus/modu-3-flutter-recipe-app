import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

import '../../ui/ui_size.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int cookTime;
  final String authorName;
  final double rating;
  final bool isFavorite;
  final VoidCallback? onTap;

  const RecipeCard({
    required this.title,
    required this.imagePath,
    required this.cookTime,
    required this.authorName,
    required this.rating,
    required this.isFavorite,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),

            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorStyle.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            // Title & AuthorName
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  SizedBox(
                    width: responsiveWidth(context, ratio: 0.6),
                    child: Text(
                      title,
                      style: AppTextStyles.smallBold(color: ColorStyle.white),
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Author name
                  SizedBox(
                    width: responsiveWidth(context, ratio: 0.6),
                    child: Text(
                      'By $authorName',
                      style: AppTextStyles.smallLabel(color: ColorStyle.white),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // CookTime
            Positioned(
              right: 10,
              bottom: 10,
              child: Row(
                children: [
                  Icon(Icons.timer_outlined, size: 17, color: ColorStyle.gray4),
                  SizedBox(width: 5),
                  Text(
                    '$cookTime min',
                    style: AppTextStyles.smallRegular(color: ColorStyle.gray4),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorStyle.white,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.bookmark_border,
                        size: 16,
                        color:
                            isFavorite
                                ? ColorStyle.primary100
                                : ColorStyle.gray4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 10,
              top: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                  color: ColorStyle.secondary20,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, size: 8.5, color: ColorStyle.rating),
                    SizedBox(width: 3.25),
                    Text(
                      rating.toStringAsFixed(1),
                      style: AppTextStyles.smallLabel(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
