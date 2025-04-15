import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class RatingButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  bool isSelected;

  RatingButton({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: widget.isSelected ? ColorStyle.primary100 : ColorStyle.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorStyle.primary100),
        ),
        child: InkWell(
          onTap: widget.onTap ?? () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text('${widget.text }★', style: AppTextStyles.smallRegular
              (color: widget.isSelected ? ColorStyle.white : ColorStyle.primary100),),
          ),
        ),
      ),
    );
  }
}
