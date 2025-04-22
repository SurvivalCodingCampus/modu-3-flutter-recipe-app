import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';

class RecipeDishCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;

  const RecipeDishCard({
    super.key,
    required this.recipe,
    this.onTap,
    this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;
        final double imageSize = maxHeight * (110 / 231);
        final double imageOverlap = imageSize / 2;
        final double kRatingBadgeHeight = maxHeight * (23 / 231);
        final double kRatingBadgeOffset = imageOverlap - kRatingBadgeHeight;
        print('kRatingBadgeOffset = $kRatingBadgeOffset');
        return GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: imageOverlap),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorStyle.gray4,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Center(
                    child: SizedBox(
                      width: imageSize,
                      height: imageSize,
                      child: ClipOval(
                        child: AppImage(path: recipe.image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      recipe.name,
                      style: AppTextStyles.smallBold(color: ColorStyle.gray1),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              // ⭐ 별점 Positioned
              Positioned.directional(
                textDirection: TextDirection.rtl,
                top: kRatingBadgeOffset,
                start: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorStyle.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 8.5,
                        color: ColorStyle.rating,
                      ),
                      const SizedBox(width: 3.25),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: AppTextStyles.smallLabel(),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 10,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Time info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: AppTextStyles.smallRegular(
                            color: ColorStyle.gray3,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${recipe.time}',
                          style: AppTextStyles.smallBold(
                            color: ColorStyle.gray1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Positioned.directional(
                textDirection: TextDirection.rtl,
                start: 12,
                bottom: 12,

                child: GestureDetector(
                  onTap: onTapFavorite,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorStyle.white,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.bookmark_border,
                        size: 16,
                        color: ColorStyle.gray4,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
