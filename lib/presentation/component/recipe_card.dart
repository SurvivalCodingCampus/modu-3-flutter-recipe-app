import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

import '../../data/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final Function(bool) onBookmarkChanged;

  RecipeCard({
    super.key,
    required this.recipe,
    required this.onBookmarkChanged,
  });

  /*  final String imageUrl;
  final String recipeName;
  final String chefName;
  final double rating;
  final String cookingTime;
  final bool isBookmarked;
  final Function(bool) onBookmarkChanged;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.recipeName,
    required this.chefName,
    required this.rating,
    required this.cookingTime,
    required this.isBookmarked,
    required this.onBookmarkChanged,
  });
*/


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.85,
      clipBehavior: Clip.hardEdge,  //이미지지가 Radius 영역 밖으로 가면 강제로 자름
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // 배경 이미지
          Positioned.fill(
            // child: Image.network(
            //   recipe.imageUrl,
            //   fit: BoxFit.cover,
            // ),
            child: Image.asset(recipe.imageUrl, fit:  BoxFit.cover)
          ),

          // 그라데이션
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,   //위는 투명으로
                    Colors.black.withOpacity(1.0),  // 아래로 갈수록 검정 진하게
                  ],
                ),
              ),
            ),
          ),

          // 컨텐츠
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: [
                // 상단 영역: 별점 (우측 상단)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      decoration: BoxDecoration(
                        color: ColorStyle.secondary20,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 10, color: ColorStyle.rating),
                          const SizedBox(width: 4),
                          Text(
                              recipe.rating.toString(),
                            style: AppTextStyles.extraSmallBold
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // 공간 공백
                const Spacer(),

                // 하단 영역: 2:1 비율 분할 (좌측: 레시피 정보, 우측: 시간 및 북마크)
                Row(
                  children: [
                    // 좌측 영역 (2/3): 레시피 이름과 셰프
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            recipe.recipeName,
                            style: AppTextStyles.smallBold.copyWith(
                              color: ColorStyle.white
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'By ${recipe.chefName}',
                            style: AppTextStyles.extraSmallRegular.copyWith(
                              color: ColorStyle.gray4
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 우측 영역 (1/3): 요리 시간과 북마크 (나란히 배치)
                    Expanded(
                      flex: 1,
                      child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '',
                              style: AppTextStyles.largeBold.copyWith(
                                color: ColorStyle.white,
                              ),
                            ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //const Spacer(flex: 2,),
                              // 요리 시간
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.access_time, color: ColorStyle.white, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                      recipe.cookingTime,
                                    style: AppTextStyles.smallRegular.copyWith(
                                      color: ColorStyle.white,
                                    )
                                  ),
                                ],
                              ),

                              const SizedBox(width: 8),

                              // 북마크 버튼
                              GestureDetector(
                                onTap: () {
                                  // 상태 변경은 직접 하지 않고, 콜백으로 부모에게 알린다
                                  onBookmarkChanged(!recipe.isBookmarked);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    recipe.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                    color: recipe.isBookmarked ? ColorStyle.primary100 : ColorStyle.primary80,
                                    size: 20,
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
              ],
            ),
          ),
        ],
      ),
    );
  }


}