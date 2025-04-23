import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FRecipeCategorySelector extends StatefulWidget {
  final List<String> categories;
  final void Function(String category) onSelectCategory;

  const FRecipeCategorySelector({
    super.key,
    required this.onSelectCategory,
    required this.categories,
  });

  @override
  State<FRecipeCategorySelector> createState() =>
      _FRecipeCategorySelectorState();
}

class _FRecipeCategorySelectorState extends State<FRecipeCategorySelector> {
  String category = '';

  @override
  void initState() {
    super.initState();
    category = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    final categories = widget.categories;

    return SizedBox(
      height: 51,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _selectedCategory(index);
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    categories[index] == category
                        ? AppColors.primary100
                        : AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyles.smallerTextBold(
                    color:
                        categories[index] == category
                            ? AppColors.white
                            : AppColors.primary80,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _selectedCategory(int index) {
    setState(() {
      category = widget.categories[index];
      widget.onSelectCategory(widget.categories[index]);
    });
  }
}
