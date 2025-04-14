import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/button_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class TimeFilterButton extends StatefulWidget {
  const TimeFilterButton({super.key});

  @override
  State<TimeFilterButton> createState() => _TimeFilterButtonState();
}

class _TimeFilterButtonState extends State<TimeFilterButton> {
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 15,
      children: [
        _timeFilterButton('All'),
        _timeFilterButton('Newest'),
        _timeFilterButton('Oldest'),
        _timeFilterButton('Popularity'),
      ],
    );
  }

  Widget _timeFilterButton(String text) {
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
