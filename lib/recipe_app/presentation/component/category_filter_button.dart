import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/button_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class CategoryFilterButton extends StatefulWidget {
  final ValueChanged<String?> changedCategoryFilter;

  const CategoryFilterButton({super.key, required this.changedCategoryFilter});

  @override
  State<CategoryFilterButton> createState() => _CategoryFilterButtonState();
}

class _CategoryFilterButtonState extends State<CategoryFilterButton> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 10,
        spacing: 15,
        children: [
          _categoryFilterButton('All'),
          _categoryFilterButton('Cereal'),
          _categoryFilterButton('Vegetables'),
          _categoryFilterButton('Dinner'),
          _categoryFilterButton('Chinese'),
          _categoryFilterButton('Local Dish'),
          _categoryFilterButton('Fruit'),
          _categoryFilterButton('BreakFast'),
          _categoryFilterButton('Korean'),
          _categoryFilterButton('Spanish'),
          _categoryFilterButton('Lunch'),
        ],
      ),
    );
  }

  Widget _categoryFilterButton(String text) {
    bool isSelected = selectedFilter == text;
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedFilter = text;
          });
          widget.changedCategoryFilter(selectedFilter);
        },
        style:
            isSelected
                ? ButtonStyles.selectedButton
                : ButtonStyles.unSelectedButton,
        child: Text(
          text,
          style:
              isSelected
                  ? TextStyles.starRateText.copyWith(color: Colors.white)
                  : TextStyles.starRateText,
        ),
      ),
    );
  }
}
