import 'package:flutter/material.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';

class RecipeCategorySelector extends StatefulWidget {
  final void Function(CategoryFilter category) onSelectCategory;

  const RecipeCategorySelector({super.key, required this.onSelectCategory});

  @override
  State<RecipeCategorySelector> createState() => _RecipeCategorySelectorState();
}

class _RecipeCategorySelectorState extends State<RecipeCategorySelector> {
  CategoryFilter category = CategoryFilter.All;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        itemCount: CategoryFilter.values.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                category = CategoryFilter.values[index];
              });
              widget.onSelectCategory(category);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color:
                    category == CategoryFilter.values[index]
                        ? ColorStyles.primary100
                        : ColorStyles.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  CategoryFilter.values[index].name,
                  style: TextStyles.smallerBold(
                    color:
                        category == CategoryFilter.values[index]
                            ? ColorStyles.white
                            : ColorStyles.primary100,
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
