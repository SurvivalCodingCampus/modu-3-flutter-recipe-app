import 'package:flutter/material.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class RecipeCard extends StatelessWidget {
  final String recipeName;
  final String chefName;
  final String recipeImgUrl;
  final int recipeTime;
  final double recipeRating;
  final bool isBookmarked; // 북마크 상태를 받음
  final VoidCallback onBookmarkTap; // 북마크 아이콘 클릭 이벤트
  final VoidCallback onTap; // 카드 클릭 이벤트

  const RecipeCard({
    super.key,
    required this.recipeName,
    required this.chefName,
    required this.recipeImgUrl,
    required this.recipeTime,
    required this.recipeRating,
    required this.isBookmarked, // 추가
    required this.onBookmarkTap,
    required this.onTap, // 추가
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 카드 클릭 이벤트
      child: Container(
        width: 315,
        height: 150,
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
                height: 400,
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
                    color: Color(0xFFFFE1B3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '⭐ $recipeRating',
                    style: const TextStyle(
                      fontSize: 10, // 높이에 맞춰 폰트도 줄이기
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
                      width: 200, // 텍스트 영역의 너비 제한
                      child: Text(
                        recipeName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                        softWrap: true,
                        maxLines: 2, // 최대 2줄로 제한
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
      
              // ⏱ 시간 + 북마크 아이콘 (오른쪽 하단)
              Positioned(
                bottom: 12,
                right: 12,
                child: Row(
                  children: [
                    Icon(
                      Icons.timer_outlined, // 타이머 아이콘
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      ' $recipeTime min',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8),
      
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: onBookmarkTap,
                        child: Icon(
                          isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border, // ✅ 상태에 따라 변경
                          color: const Color.fromARGB(255, 126, 174, 166),
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
