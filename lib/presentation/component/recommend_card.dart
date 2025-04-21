import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class RecommendCard extends StatelessWidget {
  final String category;
  final String imageUrl;
  final String name;
  final double rating;
  final String time;
  final bool isBookMarked;
  final VoidCallback onTap;

  const RecommendCard({
    required this.category,
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.time,
    required this.isBookMarked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: ColorStyles.gray4,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorStyles.secondary40,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorStyles.secondary100,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating.toStringAsFixed(1),
                          style: TextStyles.smallerRegular.copyWith(
                            fontSize: 11,
                            color: ColorStyles.secondary100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 이름
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text(
                name,
                style: TextStyles.smallerRegular.copyWith(fontSize: 11),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyles.smallerRegular.copyWith(
                      fontSize: 8,
                      color: ColorStyles.gray4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 12,
                        color: ColorStyles.secondary100,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$time min',
                        style: TextStyles.smallerRegular.copyWith(
                          fontSize: 9,
                          color: ColorStyles.gray4,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isBookMarked ? Icons.bookmark : Icons.bookmark_border,
                        color: ColorStyles.primary100,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
