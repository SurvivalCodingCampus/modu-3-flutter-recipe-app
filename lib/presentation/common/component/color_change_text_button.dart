import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class ColorChangeTextButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double buttonRadius;
  final int tabActive;
  final void Function(TapDownDetails) onTapDown;
  final void Function(TapUpDetails) onTapUp;
  final void Function() onTapCancel;

  const ColorChangeTextButton({
    super.key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.tabActive,
    required this.buttonRadius,
    required this.onTapDown,
    required this.onTapUp,
    required this.onTapCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: InkWell(
        onTapUp: (details) {
          onTapUp.call(details);
        },
        onTapDown: (details) {
          onTapDown.call(details);
        },
        onTapCancel: () {
          onTapCancel.call();
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
}
