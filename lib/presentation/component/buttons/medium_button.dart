import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const MediumButton({super.key, required this.text, required this.onPressed});

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
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
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: isTapDown ? ColorStyles.gray4 : ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 11,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalTextBold.copyWith(
                color: ColorStyles.white,
              ),
            ),
            const Icon(
              Icons.arrow_right_alt,
              size: 20,
              color: ColorStyles.white,
            ),
          ],
        ),
      ),
    );
  }
}
