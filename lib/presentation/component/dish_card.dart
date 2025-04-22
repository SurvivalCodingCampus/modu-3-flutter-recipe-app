import 'package:flutter/material.dart';

import '../../data/model/recipe_model.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../main/home/home_action.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final bool isBookMarked;
  final void Function(HomeAction action) onAction;
  final VoidCallback onTap;

  const DishCard({
    super.key,
    required this.isBookMarked,
    required this.onTap,
    required this.recipe,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 220,
        width: 150,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.only(
                top: 50,
                left: 12,
                right: 12,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                color: ColorStyles.gray4,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Text(
                      recipe.name,
                      style: TextStyles.normalBold.copyWith(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 19),
                  Spacer(),
                  Text(
                    'Time',
                    style: TextStyle(fontSize: 9, color: ColorStyles.gray2),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        recipe.time,
                        style: TextStyles.mediumBold.copyWith(fontSize: 10),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => onAction(HomeAction.onTapFavorite(recipe)),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isBookMarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: ColorStyles.primary100,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              top: 0,
              left: 24,
              child: ClipOval(
                child: Image.network(
                  recipe.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) => const Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: ColorStyles.secondary100,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      recipe.rating.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 11),
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
