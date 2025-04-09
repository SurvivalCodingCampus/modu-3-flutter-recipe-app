import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MediumButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorStyles.primary100),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        fixedSize: WidgetStateProperty.all(Size(243, 54)),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyles.normalTextBold.copyWith(color: ColorStyles.white),
        ),
      ),
    );
  }
}
