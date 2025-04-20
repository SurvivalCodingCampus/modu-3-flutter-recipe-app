import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class NewRecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String chefName;
  final String time;
  final double rating;

  const NewRecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.chefName,
    required this.time,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 레시피 썸네일
          ClipOval(
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // 텍스트 영역
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.normalBold.copyWith(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'By $chefName',
                  style: TextStyles.smallerRegular.copyWith(
                    fontSize: 11,
                    color: ColorStyles.gray4,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyles.smallerRegular.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          // 별점
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 14),
              Text(
                rating.toStringAsFixed(1),
                style: TextStyles.smallerRegular.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
