import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/button_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class CategoryFilterButton extends StatefulWidget {
  const CategoryFilterButton({super.key});

  @override
  State<CategoryFilterButton> createState() => _CategoryFilterButtonState();
}

class _CategoryFilterButtonState extends State<CategoryFilterButton> {
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 10,
        spacing: 15,
        children: [
          _CategoryFilterButton('All'),
          _CategoryFilterButton('Cereal'),
          _CategoryFilterButton('Vegetables'),
          _CategoryFilterButton('Dinner'),
          _CategoryFilterButton('Chinese'),
          _CategoryFilterButton('Local Dish'),
          _CategoryFilterButton('Fruit'),
          _CategoryFilterButton('BreakFast'),
          _CategoryFilterButton('Korean'),
          _CategoryFilterButton('Spanish'),
          _CategoryFilterButton('Lunch'),
        ],
      ),
    );
  }

  Widget _CategoryFilterButton(String text) {
    bool isSelected = selectedFilter == text;
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedFilter = text;
          });
        },
        style:
            isSelected
                ? ButtonStyles2.selectedButton
                : ButtonStyles2.unSelectedButton,
        child: Text(
          text,
          style:
              isSelected
                  ? TextStyles2.starRateText.copyWith(color: Colors.white)
                  : TextStyles2.starRateText,
        ),
      ),
    );
  }
}
