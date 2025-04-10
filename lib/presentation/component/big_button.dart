import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class BigButton extends StatefulWidget {
  final String text;
  final bool isPressed;
  final Function(TapDownDetails details)? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;

  const BigButton({
    super.key,
    required this.text,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    required this.isPressed,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: !widget.isPressed ? ColorStyles.primary100 : ColorStyles.gray4,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalTextBold.copyWith(
                color: ColorStyles.white,
              ),
            ),
            const SizedBox(width: 11),
            const Icon(Icons.arrow_right_alt, color: ColorStyles.white),
          ],
        ),
      ),
    );
  }
}
