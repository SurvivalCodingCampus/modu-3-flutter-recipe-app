import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/button_styles2.dart';
import 'package:recipe_app/recipe_app/ui/color_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class RatingButton extends StatefulWidget {
  const RatingButton({super.key});

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
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedRate = rate;
        });
      },
      style:
          isSelected
              ? ButtonStyles2.selectedButton
              : ButtonStyles2.unSelectedButton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rate.toString(),
            style:
                isSelected
                    ? TextStyles2.starRateText.copyWith(color: Colors.white)
                    : TextStyles2.starRateText,
          ),
          SizedBox(width: 6),
          Icon(
            Icons.star,
            color: isSelected ? Colors.white : ColorStyles2.primary80,
            size: 18,
          ),
        ],
      ),
    );
  }
}
