import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class FilterButton extends StatefulWidget {
  final void Function(bool value) onPressed;
  final String lable;
  bool isSelected;

  FilterButton({
    super.key,
    required this.lable,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
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
              widget.lable,
              style: TextStyle(
                color: widget.isSelected ? ColorStyle.white : ColorStyle.primary100,
              ),
            ),

          ],
        ),
      ),
    );
  }
}