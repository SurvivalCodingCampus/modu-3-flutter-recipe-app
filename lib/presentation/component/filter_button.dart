// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/ui/ui.dart';

class FilterButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                !widget.isSelected ? ColorStyles.primary80 : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          color:
              !widget.isSelected ? ColorStyles.white : ColorStyles.primary100,
        ),
        child: Text(
          widget.text,
          style: TextStyles.smallerTextRegular.copyWith(
            color:
                !widget.isSelected ? ColorStyles.primary80 : ColorStyles.white,
          ),
        ),
      ),
    );
  }
}
