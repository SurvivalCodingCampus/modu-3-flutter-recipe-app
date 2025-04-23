import 'package:flutter/material.dart';
import 'package:recipe_app/app/ui/color_style.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String category;
  final ValueChanged<String> onSelectCategory;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.category,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = categories[index];
          final isSelected = item == category;

          return GestureDetector(
            onTap: () => onSelectCategory(item),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? ColorStyle.mainGreen : ColorStyle.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  item,
                  style: AppTextStyles.extraSmallBold(
                    color: isSelected ? Colors.white : ColorStyle.mainGreen,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
