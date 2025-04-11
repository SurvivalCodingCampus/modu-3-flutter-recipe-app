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
              widget.value.name,
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
