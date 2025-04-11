import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final String text;
  final VoidCallback onClick;

  const MediumButton({super.key, required this.text, required this.onClick});

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (down) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (up) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      onTap: widget.onClick,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: isPressed ? ColorStyle.gray4 : ColorStyle.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              child: Text(
                widget.text,
                style: AppTextStyles.normalBold.copyWith(
                  color: ColorStyle.white,
                ),
              ),
            ),
            const SizedBox(width: 11),
            Icon(Icons.arrow_forward, weight: 20, color: ColorStyle.white),
          ],
        ),
      ),
    );
  }
}
