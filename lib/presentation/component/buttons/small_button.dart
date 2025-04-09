import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SmallButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorStyles.primary100),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        fixedSize: WidgetStateProperty.all(Size(174, 37)),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyles.smallTextBold.copyWith(color: ColorStyles.white),
        ),
      ),
    );
  }
}
