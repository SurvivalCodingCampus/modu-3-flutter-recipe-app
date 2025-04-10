import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String buttonName;
  final Function(int rating) onSubmit;

  const RatingDialog({
    super.key,
    required this.title,
    required this.buttonName,
    required this.onSubmit,
  });

  @override
  State<StatefulWidget> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int rating = -1;
  List<bool> stars = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorStyles.gray2,
            blurRadius: 1,
            offset: Offset(0, 0.5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Text(
            widget.title,
            style: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.label,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              stars.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < stars.length; i++) {
                      stars[i] = i <= index;
                    }
                    rating = index + 1;
                  });
                },
                child: Icon(
                  stars[index] ? Icons.star : Icons.star_outline,
                  color: ColorStyles.rating,
                  size: 20,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color:
                      stars.any((star) => star)
                          ? ColorStyles.rating
                          : ColorStyles.gray4,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  onTap: () {
                    if (rating != -1) {
                      widget.onSubmit(rating);
                    }
                  },
                  child: Text(
                    widget.buttonName,
                    style: TextStyles.labelTextBold.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
