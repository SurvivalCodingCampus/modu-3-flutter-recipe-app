import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

enum ButtonSize {
  big(width: 315, height: 60, border: 10),
  medium(width: 243, height: 54, border: 10),
  small(width: 174, height: 37, border: 10);

  final double width;
  final double height;
  final double border;

  const ButtonSize({
    required this.width,
    required this.height,
    required this.border,
  });
}

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClick;
  final ButtonSize buttonSize;
  final String buttonText;

  const ButtonWidget({
    super.key,
    required this.buttonSize,
    required this.buttonText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: buttonSize.width,
        height: buttonSize.height,
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(buttonSize.border),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: switch (buttonSize) {
              ButtonSize.big => TextStyles.normalBold.copyWith(
                color: ColorStyles.white,
              ),
              ButtonSize.medium => TextStyles.normalBold.copyWith(
                color: ColorStyles.white,
              ),
              ButtonSize.small => TextStyles.smallBold.copyWith(
                color: ColorStyles.white,
              ),
            },
          ),
        ),
      ),
    );
  }
}
