import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const FRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.transparent, Colors.black],
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildRecipeNameText(),
                      _buildMakeUserNameText(),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRateContainer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildTimeIcon(),
                        const SizedBox(width: 5),
                        _buildEstimatedTimeText(),
                        const SizedBox(width: 10),
                        _buildBookMarkButton(),
                      ],
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

  Container _buildBookMarkButton() {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
      child:
          recipe.isFavorite
              ? const Icon(Icons.bookmark, size: 16, color: AppColors.primary80)
              : const Icon(
                Icons.bookmark_border,
                size: 16,
                color: AppColors.primary80,
              ),
    );
  }

  Text _buildEstimatedTimeText() {
    return Text(
      '${recipe.estimatedTime} min',
      style: TextStyles.smallerTextRegular(color: AppColors.gray4),
    );
  }

  Icon _buildTimeIcon() =>
      const Icon(Icons.schedule, size: 17, color: AppColors.gray4);

  Container _buildRateContainer() {
    return Container(
      width: 37,
      height: 16,
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
          const Icon(Icons.star, size: 11, color: AppColors.rating),
          Text(
            '${recipe.rate}',
            style: TextStyles.smallerTextRegular(color: AppColors.black, fontSize: 8),
          ),
        ],
      ),
    );
  }

  Text _buildMakeUserNameText() {
    return Text(
      'By ${recipe.makeUserName}',
      style: TextStyles.smallerTextRegular(color: AppColors.gray4),
    );
  }

  Widget _buildRecipeNameText() {
    return Text(
      recipe.name,
      style: TextStyles.smallTextBold(),
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      textAlign: TextAlign.start,
    );
  }
}
