import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/data/util/time_enum.dart';
import 'package:recipe_app/data/util/category_enum.dart';

import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class FilterButton extends StatefulWidget {
  final Enum value;
  final Color color;
  final VoidCallback ontap;
  const FilterButton({
    super.key,
    required this.value,
    required this.color,
    required this.ontap,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    String title = '';
    if (widget.value is Time) {
      switch (widget.value) {
        case Time.all:
          title = 'all';
        case Time.newest:
          title = 'newest';
        case Time.oldest:
          title = 'oldest';
        case Time.popularity:
          title = 'popularity';
      }
    }

    if (widget.value is Categories) {
      switch (widget.value) {
        case Categories.all:
          title = 'all';
        case Categories.breakfast:
          title = 'breakfast';
        case Categories.cereal:
          title = 'cereal';
        case Categories.chinese:
          title = 'chinese';
        case Categories.dinner:
          title = 'dinner';
        case Categories.fruit:
          title = 'fruit';
        case Categories.localDish:
          title = 'localDish';
        case Categories.lunch:
          title = 'lunch';
        case Categories.spanish:
          title = 'spanish';
        case Categories.vegetables:
          title = 'vegetables';
      }
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isFocused = !isFocused;
        });
        widget.ontap();
      },
      child: Container(
        height: 27,
        // width: 43,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border:
              isFocused ? null : Border.all(color: widget.color, width: 1.0),
          borderRadius: BorderRadius.circular(10),
          color: isFocused ? widget.color : ColorStyles.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isFocused ? ColorStyles.white : widget.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
