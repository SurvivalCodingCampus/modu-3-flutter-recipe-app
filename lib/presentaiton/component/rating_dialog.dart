import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/presentaiton/ui/color_styles.dart';
import 'package:recipe_app/presentaiton/ui/text_styles.dart';

class Rating {
  final String title;
  final String actionName;
  final void Function(int) onChange;

  const Rating({
    required this.title,
    required this.actionName,
    required this.onChange,
  });
}

class RatingDialog extends StatefulWidget {
  final Rating rating;

  const RatingDialog({super.key, required this.rating});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    final send = selectedStar > 0;
    return Container(
      width: 170,
      height: 91,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: ColorStyles.gray4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.rating.title, style: TextStyles.smallerTextRegular),
          Container(
            width: 140,
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStar = starIndex;
                    });
                  },
                  child: Icon(
                    starIndex <= selectedStar ? Icons.star : Icons.star_border,
                    color: ColorStyles.rating,
                    size: 20,
                  ),
                );
              }),
            ),
          ),
          GestureDetector(
            onTap:
                send
                    ? () {
                      widget.rating.onChange(selectedStar
                      );
                      Navigator.pop(context);
                    }
                    : null,
            child: Container(
              width: 61,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: !send ? ColorStyles.gray4 : ColorStyles.rating,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                widget.rating.actionName,
                style: TextStyles.smallerTextRegular.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
