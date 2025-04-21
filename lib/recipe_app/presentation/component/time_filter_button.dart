import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/button_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class TimeFilterButton extends StatefulWidget {
  final ValueChanged<String?> changedTimeFilter;

  const TimeFilterButton({super.key, required this.changedTimeFilter});

  @override
  State<TimeFilterButton> createState() => _TimeFilterButtonState();
}

class _TimeFilterButtonState extends State<TimeFilterButton> {
  String selectedFilter = 'All';

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
          widget.changedTimeFilter(selectedFilter);
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
