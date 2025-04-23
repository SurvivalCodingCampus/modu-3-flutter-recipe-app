import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FDishCard extends StatefulWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const FDishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  State<FDishCard> createState() => _FDishCardState();
}

class _FDishCardState extends State<FDishCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 231,
      width: 150,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _buildContainer(),
          _buildCircleImage(),
          _buildRateContainer(),
        ],
      ),
    );
  }

  Widget _buildRateContainer() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30),
          Container(
            width: 45,
            height: 23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.secondary20,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 15, color: AppColors.rating),
                Text(
                  '${widget.recipe.rate}',
                  style: TextStyles.smallerTextRegular(
                    color: AppColors.black,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildContainer() {
    return Column(
      children: [
        SizedBox(height: 55),

        Container(
          alignment: Alignment.center,
          height: 176,
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.primary40,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 66),
                Text(
                  widget.recipe.name,
                  style: TextStyles.smallTextBold(color: AppColors.gray1),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                Spacer(),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: TextStyles.smallerTextRegular(
                            color: AppColors.gray3,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          '${widget.recipe.estimatedTime} min',
                          style: TextStyles.smallerTextBold(
                            color: AppColors.gray1,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),

                    GestureDetector(
                      onTap: () {
                        widget.onTapFavorite(widget.recipe);
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child:
                            widget.recipe.isFavorite
                                ? const Icon(
                                  Icons.bookmark,
                                  size: 16,
                                  color: AppColors.primary80,
                                )
                                : const Icon(
                                  Icons.bookmark_border,
                                  size: 16,
                                  color: AppColors.primary80,
                                ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ClipRRect _buildCircleImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(110),
      child: Image.network(
        widget.recipe.imageUrl,
        width: 110,
        height: 110,
        filterQuality: FilterQuality.low,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return child;
          }
          return SizedBox(
            width: 110,
            height: 110,
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
