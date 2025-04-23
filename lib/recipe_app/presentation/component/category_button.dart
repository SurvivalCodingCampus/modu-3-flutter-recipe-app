import 'package:flutter/material.dart';

import '../../ui/button_styles.dart';
import '../../ui/text_styles.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final String selectedCategory;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.categoryName,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = categoryName == selectedCategory;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style:
            isSelected
                ? ButtonStyles.selectedButton
                : ButtonStyles.unSelectedButton,
        child: Text(
          categoryName,
          style:
              isSelected
                  ? TextStyles.starRateText.copyWith(color: Colors.white)
                  : TextStyles.starRateText,
        ),
      ),
    );
  }
}
