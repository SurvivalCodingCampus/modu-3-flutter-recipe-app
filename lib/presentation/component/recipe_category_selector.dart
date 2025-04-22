import 'package:flutter/material.dart';

import '../../ui/ui.dart';

class RecipeCategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final void Function(String category) onSelected;
  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children:
              categories.map((e) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onSelected(e),
                  child:
                      e == selectedCategory
                          ? SelectedCategory(category: e)
                          : UnSelectedCategory(category: e),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class SelectedCategory extends StatelessWidget {
  final String category;

  const SelectedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      decoration: BoxDecoration(
        color: ColorStyles.primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(color: Colors.white),
      ),
    );
  }
}

class UnSelectedCategory extends StatelessWidget {
  final String category;

  const UnSelectedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(
          color: ColorStyles.primary80,
        ),
      ),
    );
  }
}
