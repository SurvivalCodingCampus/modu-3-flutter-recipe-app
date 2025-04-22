import 'package:flutter/material.dart';

import '../../data/model/recipe.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTapFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 55,
      child: Stack(
        children: [
          Positioned(
            top: 0, // 위치 지정도 같이 해주는 게 좋아
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                image: DecorationImage(
                  image: NetworkImage(recipe.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Positioned(
          //   right: 6,
          //   top: 10,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
          //     child: Container(
          //       width: 37,
          //       height: 16,
          //       decoration: BoxDecoration(
          //         color: ColorStyles.secondary20,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Center(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(Icons.star, color: ColorStyles.rating, size: 7.5),
          //             SizedBox(width: 2),
          //             Text(
          //               recipe.rate.round().toStringAsFixed(1),
          //               style: TextStyles.rateText.copyWith(color: Colors.black),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 12,
          //   bottom: 15,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         recipe.name,
          //         style: TextStyles.menuIntroduceText,
          //
          //         maxLines: 2,
          //         overflow: TextOverflow.visible,
          //       ),
          //       SizedBox(height: 3),
          //     ],
          //   ),
          // ),
          // Positioned(
          //   right: 12,
          //   bottom: 10,
          //   child: Row(
          //     children: [
          //       Icon(Icons.timer_outlined, color: ColorStyles.chefName, size: 17),
          //       SizedBox(width: 3),
          //       Text.rich(
          //         TextSpan(
          //           text: recipe.time.toString(),
          //           style: TextStyles.cookingTimeText,
          //           children: [
          //             TextSpan(text: ' min', style: TextStyles.cookingTimeText),
          //           ],
          //         ),
          //       ),
          //       SizedBox(width: 8),
          //       GestureDetector(
          //         onTap: onTapFavorite,
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //           ),
          //           width: 24,
          //           height: 24,
          //           child: Icon(
          //             recipe.bookMarked ? Icons.bookmark : Icons.bookmark_border,
          //             size: 16,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
