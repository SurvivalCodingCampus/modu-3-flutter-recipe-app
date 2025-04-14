import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final VoidCallback onClick;
  final Color color;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
    this.color = ColorStyle.primary100,
  });

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
        width: 174,
        height: 37,
        decoration: BoxDecoration(
          color: isPressed ? ColorStyle.gray4 : widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.text,
                style: AppTextStyles.smallBold.copyWith(
                  color: ColorStyle.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
