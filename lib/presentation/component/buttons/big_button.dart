import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BigButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorStyles.primary100),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 85, vertical: 18),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        fixedSize: WidgetStateProperty.all(Size(315, 60)),
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
