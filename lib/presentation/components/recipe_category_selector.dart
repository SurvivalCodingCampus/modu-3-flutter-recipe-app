import 'package:flutter/material.dart';
import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class RecipeCategorySelector extends StatefulWidget {
  final List<Categories> categories;
  final int selectedIndex;
  final void Function(int index) onSelectTap;
  const RecipeCategorySelector({
    super.key,
    required this.selectedIndex,
    required this.onSelectTap,
    required this.categories,
  });

  @override
  State<RecipeCategorySelector> createState() => _RecipeCategorySelectorState();
}

class _RecipeCategorySelectorState extends State<RecipeCategorySelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onSelectTap(index);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width / 5.3,
              height: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    index == widget.selectedIndex
                        ? ColorStyles.primary100
                        : ColorStyles.white,
              ),
              child: Center(
                child: Text(
                  widget.categories[index].name,
                  style: TextStyles.smallerTextBold.copyWith(
                    color:
                        index == widget.selectedIndex
                            ? ColorStyles.white
                            : ColorStyles.primary80,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemCount: widget.categories.length,
      ),
    );
  }
}
