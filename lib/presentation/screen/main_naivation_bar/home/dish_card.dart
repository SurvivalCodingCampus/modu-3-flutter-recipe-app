import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

class DishCard extends StatefulWidget {
  final Recipe recipe;
  final Function(int recipeId) onClickBookMark;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onClickBookMark,
  });

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.recipe.isBookmarked; // 초기 값 설정
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked; // 상태 토글
    });

    widget.onClickBookMark(widget.recipe.recipeId); // 상위 위젯에 변경 알림
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/recipe-detail/${widget.recipe.recipeId}');
      },
      child: Stack(
        children: [
          Positioned(
            top: 55,
            child: Container(
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorStyle.gray4,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.recipe.title,
                      style: AppTextStyles.smallBold(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
                ),
                Text(
                  '${widget.recipe.time.toString()} Mins',
                  style: AppTextStyles.smallBold(color: ColorStyle.gray1),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: CircleAvatar(
              maxRadius: 55,
              backgroundImage: NetworkImage(widget.recipe.thumbNailUrl),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyle.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: ColorStyle.rating, size: 12),
                  Text(
                    widget.recipe.rating.toString(),
                    style: AppTextStyles.smallRegular(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: GestureDetector(
              onTap: toggleBookmark,
              child: SizedBox(
                width: 24,
                child: CircleAvatar(
                  backgroundColor: ColorStyle.white,
                  child: Icon(
                    isBookmarked
                        ? Icons
                            .bookmark // 북마크된 경우
                        : Icons.bookmark_outline, // 북마크되지 않은 경우
                    color: ColorStyle.primary100,
                    size: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
