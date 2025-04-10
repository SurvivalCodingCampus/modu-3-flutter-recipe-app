import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final bool isPressed;
  final Function(TapDownDetails details)? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;

  const SmallButton({
    super.key,
    required this.text,
    required this.isPressed,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      child: Container(
        width: 174,
        height: 37,
        decoration: BoxDecoration(
          color: !widget.isPressed ? ColorStyles.primary100 : ColorStyles.gray4,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.smallerTextBold.copyWith(
                color: ColorStyles.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
