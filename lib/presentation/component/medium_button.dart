import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class MediumButton extends StatefulWidget {
  final String text;
  final bool isPressed;
  final Function(TapDownDetails details)? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;

  const MediumButton({
    super.key,
    required this.text,
    required this.isPressed,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  });

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      child: Container(
        width: 243,
        height: 54,
        decoration: BoxDecoration(
          color: !widget.isPressed ? ColorStyles.primary100 : ColorStyles.gray4,
          borderRadius: BorderRadius.circular(10),
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
