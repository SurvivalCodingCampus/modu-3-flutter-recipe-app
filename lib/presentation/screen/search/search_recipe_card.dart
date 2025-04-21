import 'package:flutter/material.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class SearchRecipeCard extends StatelessWidget {
  final String recipeName;
  final String chefName;
  final String recipeImgUrl;
  final double recipeRating;

  const SearchRecipeCard({
    super.key,
    required this.recipeName,
    required this.chefName,
    required this.recipeImgUrl,
    required this.recipeRating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // 배경 이미지
            Image.network(
              recipeImgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
            ),

            // 그라데이션 오버레이
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),

            // ⭐ 별점 (오른쪽 상단)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 37,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE1B3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '⭐ $recipeRating',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // 🍖 레시피명 (줄바꿈 포함) + 셰프명 (왼쪽 하단)
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 130, // 텍스트 영역의 너비 제한
                    child: Text(
                      recipeName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      softWrap: true,
                      maxLines: 3, // 최대 3줄로 제한
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'By $chefName',
                    style: const TextStyle(
                      color: ColorStyle.gray4,
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
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
