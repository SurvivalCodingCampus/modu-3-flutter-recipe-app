import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const SmallButton({super.key, required this.text, required this.onPressed});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) {
        setState(() {
          isTapDown = !isTapDown;
        });
      },
      onTapUp: (_) {
        setState(() {
          isTapDown = !isTapDown;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapDown = !isTapDown;
        });
      },
      child: Container(
        height: 37,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: isTapDown ? ColorStyles.gray4 : ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyles.smallTextBold.copyWith(color: ColorStyles.white),
          ),
        ),
      ),
    );
  }
}
