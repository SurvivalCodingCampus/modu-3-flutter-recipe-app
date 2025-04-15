import 'package:flutter/material.dart';

import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class Button {
  final String text;

  const Button({required this.text});
}

class RatingButton extends StatefulWidget {
  final Button buttons;

  const RatingButton({super.key, required this.buttons});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  bool isSelected = false;

  void onChanged() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 50,
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorStyles.primary80 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: ColorStyles.primary80),
        ),
        child: Text(
          widget.buttons.text,
          style: TextStyles.smallerTextRegular.copyWith(
            color: isSelected ? Colors.white : ColorStyles.primary80,
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatefulWidget {
  final Button buttons;

  const FilterButton({super.key, required this.buttons});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isSelected = false;

  void onChanged() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 50,
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorStyles.primary80 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: ColorStyles.primary80),
        ),
        child: Row(
          children: [
            Text(
              widget.buttons.text,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isSelected ? Colors.white : ColorStyles.primary80,
              ),
            ),
            Spacer(),
            Icon(
              Icons.star,
              color: isSelected ? Colors.white : ColorStyles.primary80,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
