import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final VoidCallback onClick;

  const SmallButton({super.key, required this.text, required this.onClick});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
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
        height: 37,
        decoration: BoxDecoration(
          color: isPressed ? ColorStyle.gray4 : ColorStyle.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              child: Center(
                child: Text(
                  widget.text,
                  style: AppTextStyles.smallBold.copyWith(
                    color: ColorStyle.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
