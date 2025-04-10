import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SelectButton extends StatefulWidget {
  final IconData? icon;
  final String text;
  final Function() onTap;

  const SelectButton({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;

  void _toggleSelect() {
    setState(() {
      isSelected = !isSelected;
      widget.onTap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _toggleSelect();
      },
      child: Container(
        height: 28,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
          border: Border.all(color: ColorStyles.primary100),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: widget.icon != null ? 5 : 0,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.smallTextRegular.copyWith(
                color: isSelected ? ColorStyles.white : ColorStyles.primary100,
              ),
            ),
            widget.icon != null
                ? Icon(
                  widget.icon,
                  color: isSelected ? ColorStyles.white : ColorStyles.primary80,
                  size: 18,
                )
                : SizedBox(width: 0),
          ],
        ),
      ),
    );
  }
}
