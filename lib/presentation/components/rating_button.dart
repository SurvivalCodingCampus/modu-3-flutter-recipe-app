import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class RatingButton extends StatefulWidget {
  final String rate;
  final Color color;
  final VoidCallback ontap;
  const RatingButton({
    super.key,
    required this.rate,
    required this.color,
    required this.ontap,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
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
        height: 28,
        width: 50,
        decoration: BoxDecoration(
          border:
              isFocused ? null : Border.all(color: widget.color, width: 1.0),
          borderRadius: BorderRadius.circular(10),
          color: isFocused ? widget.color : ColorStyles.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.rate,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isFocused ? ColorStyles.white : widget.color,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.star,
              color: isFocused ? ColorStyles.white : widget.color,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
