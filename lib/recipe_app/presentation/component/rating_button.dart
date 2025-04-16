import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/button_styles.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class RatingButton extends StatefulWidget {
  final ValueChanged<int?> changedRatingFilter;

  const RatingButton({super.key, required this.changedRatingFilter});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  int? selectedRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 5,
      children: [
        _ratingButtonWidget(5),
        _ratingButtonWidget(4),
        _ratingButtonWidget(3),
        _ratingButtonWidget(2),
        _ratingButtonWidget(1),
      ],
    );
  }

  Widget _ratingButtonWidget(int rate) {
    final bool isSelected = selectedRate == rate;
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedRate = rate;
          });
          widget.changedRatingFilter(selectedRate);
        },
        style:
            isSelected
                ? ButtonStyles.selectedButton
                : ButtonStyles.unSelectedButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rate.toString(),
              style:
                  isSelected
                      ? TextStyles.starRateText.copyWith(color: Colors.white)
                      : TextStyles.starRateText,
            ),
            SizedBox(width: 6),
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
