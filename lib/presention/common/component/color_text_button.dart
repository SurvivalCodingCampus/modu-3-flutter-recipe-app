import 'package:flutter/material.dart';
import 'package:recipe_app/presention/common/ui/color_style.dart';
import 'package:recipe_app/presention/common/ui/text_styles.dart';

class ColorTextButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double buttonRadius;
  final void Function() onPreesed;

  const ColorTextButton({
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPreesed,
    required this.buttonRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: InkWell(
        onTap: (){
          onPreesed.call();
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
              Icon(Icons.arrow_forward, color: textColor,)
            ],
          ),
        ),
      ),
    );
  }


}
