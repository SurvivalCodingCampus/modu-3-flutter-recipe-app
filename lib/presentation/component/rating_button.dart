import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class RatingButton extends StatefulWidget {
  final void Function(bool value) onPressed;
  final String number;
  bool isSelected;

  RatingButton({
    super.key,
    required this.number,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  _RatingButtonState createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        widget.onPressed(widget.isSelected);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: widget.isSelected ? ColorStyle.primary100 : ColorStyle.white,
          borderRadius: BorderRadius.circular(11.0),
          border: Border.all(color: ColorStyle.primary100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.number,
              style: TextStyle(
                color: widget.isSelected ? ColorStyle.white : ColorStyle.primary100,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.star,
              size: 20,
              color: widget.isSelected ? ColorStyle.white : ColorStyle.primary100,
            ),
          ],
        ),
      ),
    );
  }
}