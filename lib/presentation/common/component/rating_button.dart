import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class RatingButton extends StatefulWidget {
  final String text;
  final IconData icon;
  bool isSelected;

  RatingButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: widget.isSelected ? ColorStyle.primary100 : ColorStyle.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: AppTextStyles.smallRegular(
                  color:
                      widget.isSelected
                          ? ColorStyle.white
                          : ColorStyle.primary100,
                ),
              ),
              Icon(
                widget.icon,
                color:
                    widget.isSelected
                        ? ColorStyle.white
                        : ColorStyle.primary100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
