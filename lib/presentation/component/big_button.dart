import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class BigButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const BigButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 315,
        height: 60,
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
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
