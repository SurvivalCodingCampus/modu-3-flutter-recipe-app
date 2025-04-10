import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const BigButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: ColorStyle.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              child: Text(
                text,
                style: AppTextStyles.normalBold.copyWith(
                  color: ColorStyle.white,
                ),
              ),
            ),
            const SizedBox(width: 11),
            Icon(Icons.arrow_forward, weight: 20, color: ColorStyle.white),
          ],
        ),
      ),
    );
  }
}
