import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class CategoryTabs extends StatefulWidget {
  final List<String> categories;
  final Function(String) onSelected;

  const CategoryTabs({
    super.key,
    required this.categories,
    required this.onSelected,
  });

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
              widget.onSelected(category);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? ColorStyles.primary100 : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorStyles.primary100, width: 1.5),
              ),
              child: Text(
                category,
                style: TextStyles.smallerRegular.copyWith(
                  fontSize: 12,
                  color: isSelected ? Colors.white : ColorStyles.primary100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
