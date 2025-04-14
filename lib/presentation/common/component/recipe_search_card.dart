import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/enum/return_image_widget.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class RecipeSearchCard extends StatelessWidget {
  final String recipeName;
  final String recipeAuthor;
  final String imagePath;
  final double recipeRate;
  final ImageType imageType;

  const RecipeSearchCard({
    super.key,
    required this.recipeName,
    required this.recipeAuthor,
    required this.imagePath,
    required this.recipeRate,
    required this.imageType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: returnImageWidget(
                imageType: imageType,
                imagePath: imagePath,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorStyle.black.withValues(alpha: 0.0),
                      ColorStyle.black,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 7,
                        ),
                        decoration: BoxDecoration(
                          color: ColorStyle.secondary20,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 8,
                              fill: 1,
                              color: ColorStyle.rating,
                            ),
                            Text(
                              recipeRate.toString(),
                              style: AppTextStyles.smallRegularLable(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipeName,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.smallBold(
                            color: ColorStyle.white,
                          ),
                        ),
                        Text(
                          recipeAuthor,
                          style: AppTextStyles.smallRegularLable(
                            color: ColorStyle.white,
                          ),
                        ),
                      ],
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
