import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-10/ui/button_styles2.dart';
import 'package:recipe_app/2025-04-10/ui/text_styles2.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_filterButton('Korean'), _filterButton('Japanese')],
    );
  }

  Widget _filterButton(String text) {
    bool isSelected = selectedFilter == text;
    return ElevatedButton(
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
    );
  }
}
