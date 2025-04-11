import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class FilterButton extends StatefulWidget {
  final String text;
  bool isSelected;

   FilterButton({super.key, required this.text, required this.isSelected});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Ink(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10
        ),
        decoration: BoxDecoration(
          color: widget.isSelected ? ColorStyle.primary100 : ColorStyle.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            widget.text,
            style: AppTextStyles.smallRegular(
              color:
                  widget.isSelected ? ColorStyle.white : ColorStyle.primary100,
            ),
          ),
        ),
      ),
    );
  }
}
