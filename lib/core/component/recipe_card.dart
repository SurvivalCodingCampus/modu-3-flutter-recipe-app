import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:recipe_app/core/component/image_roader.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final VoidCallback onBookMarkTap;
  final bool isNotTitleArea;
  final bool isNotIconArea;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onBookMarkTap,
    this.isNotTitleArea = false,
    this.isNotIconArea = false,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 레시피 상세화면으로 이동
        context.push('/recipe-detail/${widget.recipe.recipeId}');
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child:
                  widget.recipe.thumbNailUrl.startsWith('http')
                      ? RecipeImageLoader(imageUrl: widget.recipe.thumbNailUrl)
                      : Image.asset(
                        widget.recipe.thumbNailUrl,
                        fit: BoxFit.cover,
                      ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorStyle.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: ColorStyle.secondary20,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Color(0xFFFFAD30)),
                    SizedBox(width: 4),
                    Text(
                      widget.recipe.rating.toString(),
                      style: AppTextStyles.smallRegular(),
                    ),
                  ],
                ),
              ),
            ),
            // 텍스트와 하단 정보
            Positioned(
              left: 12,
              bottom: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  widget.isNotTitleArea
                      ? const SizedBox.shrink()
                      : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.recipe.title,
                              style: AppTextStyles.smallBold(
                                color: ColorStyle.white,
                              ),
                            ),

                            Text(
                              'By ${widget.recipe.userName}',
                              style: AppTextStyles.smallRegular(
                                color: ColorStyle.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                  widget.isNotIconArea
                      ? const SizedBox.shrink()
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.timer,
                            color: ColorStyle.gray4,
                            size: 17,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.recipe.time} min',
                            style: AppTextStyles.smallRegular(
                              color: ColorStyle.gray4,
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () => widget.onBookMarkTap(),
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: ColorStyle.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.bookmark,
                                color: ColorStyle.primary80,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
