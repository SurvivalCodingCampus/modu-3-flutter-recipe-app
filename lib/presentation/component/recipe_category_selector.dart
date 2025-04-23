import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RecipeCategorySelector extends StatefulWidget {
  final List<String> categories;
  final Function(String category) onSelect;
  final int selectedIndex;

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.onSelect,
    this.selectedIndex = 0,
  });

  @override
  State<RecipeCategorySelector> createState() => _RecipeCategorySelectorState();
}

class _RecipeCategorySelectorState extends State<RecipeCategorySelector> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
              widget.onSelect(widget.categories[index]);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color:
                  _selectedIndex == index
                      ? ColorStyles.primary100
                      : ColorStyles.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Center(
              child: Text(
                widget.categories[index],
                style: TextStyles.smallTextBold.copyWith(
                  color:
                      _selectedIndex == index
                          ? ColorStyles.white
                          : ColorStyles.primary80,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
