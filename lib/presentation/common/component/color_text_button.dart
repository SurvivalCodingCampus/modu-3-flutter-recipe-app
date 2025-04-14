import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

Widget ColorTextButton({
  required double buttonWidth,
  required double buttonHeight,
  required String buttonText,
  required Color buttonColor,
  required Color textColor,
  required double buttonRadius,
  required VoidCallback onPressed,
}) {
  return Container(
    width: buttonWidth,
    height: buttonHeight,
    decoration: BoxDecoration(
      color: buttonColor,
      borderRadius: BorderRadius.circular(buttonRadius),
    ),
    child: InkWell(
      onTap: () {
        onPressed.call();
      },
      borderRadius: BorderRadius.circular(buttonRadius),
      child: Ink(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: AppTextStyles.normalBold(color: textColor),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, color: textColor),
          ],
        ),
      ),
    ),
  );
}
