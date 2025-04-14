import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/app_image.dart';
import 'package:recipe_app/presentation/component/skelton_animtion_widget.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

import '../../ui/ui_size.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String cookTime;
  final String authorName;
  final double rating;
  final bool isFavorite;
  final VoidCallback? onTap;

  final bool showCookTime;
  final bool showFavorite;

  const RecipeCard({
    required this.title,
    required this.imagePath,
    required this.cookTime,
    required this.authorName,
    required this.rating,
    required this.isFavorite,
    this.showCookTime = true,
    this.showFavorite = true,
    this.onTap,
    super.key,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            AppImage(
              path: widget.imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              borderRadius: BorderRadius.circular(10),
              overlayBuilder:
                  (context) => Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorStyle.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
              skeletonBuilder:
                  (context, size) => SkeletonAnimationWidget(
                    width: size.width,
                    height: size.height,
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
                      widget.title,
                      style: AppTextStyles.smallBold(color: ColorStyle.white),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Author name
                  SizedBox(
                    width: responsiveWidth(context, ratio: 0.6),
                    child: Text(
                      'By ${widget.authorName}',
                      style: AppTextStyles.smallLabel(color: ColorStyle.white),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // CookTime & Favorite
            if (widget.showCookTime || widget.showFavorite)
              Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                    if (widget.showCookTime) ...[
                      const Icon(
                        Icons.timer_outlined,
                        size: 17,
                        color: ColorStyle.gray4,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.cookTime,
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.gray4,
                        ),
                      ),
                    ],
                    const SizedBox(width: 10),
                    if (widget.showFavorite) ...[
                      Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorStyle.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.bookmark_border,
                            size: 16,
                            color:
                                widget.isFavorite
                                    ? ColorStyle.primary100
                                    : ColorStyle.gray4,
                          ),
                        ),
                      ),
                    ],
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
                    const Icon(Icons.star, size: 8.5, color: ColorStyle.rating),
                    const SizedBox(width: 3.25),
                    Text(
                      widget.rating.toStringAsFixed(1),
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
