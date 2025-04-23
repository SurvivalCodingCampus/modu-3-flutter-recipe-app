import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';

class RecipeCategorySelector extends StatelessWidget {
  final Function(Category category) onCategorySelected; // 카테고리 선택 콜백
  final Category selectedCategory; // 현재 선택된 카테고리

  const RecipeCategorySelector({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            Category.values.asMap().entries.map((entry) {
              final int index = entry.key;
              final Category category = entry.value;
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 30 : 0,
                  right: 10, // 기본 간격
                ),
                child: GestureDetector(
                  onTap: () {
                    onCategorySelected(category);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color:
                          selectedCategory == category
                              ? ColorStyle.primary100
                              : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      category.name[0].toUpperCase() +
                          category.name.substring(1),
                      style: AppTextStyles.smallBold(
                        color:
                            selectedCategory == category
                                ? Colors.white
                                : ColorStyle.primary100,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
