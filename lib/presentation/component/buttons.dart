import 'package:flutter/material.dart';

import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

enum ButtonSize { big, medium, small }

class Buttons extends StatelessWidget {
  final String text;
  final ButtonSize size;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final bool showArrow;
  final IconData? icon;
  final bool isPressed;

  const Buttons({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.medium,
    this.isDisabled = false,
    this.showArrow = false,
    this.icon,
    this.isPressed = false,
  });

  static final Map<ButtonSize, _ButtonStyleInfo> _styleMap = {
    ButtonSize.big: _ButtonStyleInfo(
      height: 60,
      radius: 10,
      textStyle: AppTextStyles.normalBold(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 85),
    ),
    ButtonSize.medium: _ButtonStyleInfo(
      height: 54,
      radius: 10,
      textStyle: AppTextStyles.normalBold(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
    ),
    ButtonSize.small: _ButtonStyleInfo(
      height: 37,
      radius: 10,
      textStyle: AppTextStyles.smallBold(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    ),
  };

  @override
  Widget build(BuildContext context) {
    final style = _styleMap[size]!;
    double screenWidth = MediaQuery.of(context).size.width;

    final showIcon = (size == ButtonSize.big || size == ButtonSize.medium);
    double buttonWidth;
    switch (size) {
      case ButtonSize.big:
        buttonWidth = double.infinity;
        break;
      case ButtonSize.medium:
        buttonWidth = screenWidth * 0.70;
        break;
      case ButtonSize.small:
        buttonWidth = screenWidth * 0.50;
        break;
    }

    return InkWell(
      onTap: isDisabled ? null : onPressed,
      borderRadius: BorderRadius.circular(style.radius),
      child: Ink(
        width: buttonWidth, // 반응형
        height: style.height,
        padding: style.padding,
        decoration: BoxDecoration(
          color: isDisabled ? ColorStyle.gray4 : ColorStyle.primary100,
          borderRadius: BorderRadius.circular(style.radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              height: 24,
              child: Center(
                child: Text(
                  text,
                  style: style.textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (showIcon) ...[
              const SizedBox(width: 11),
              Icon(icon, color: ColorStyle.white, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}

class _ButtonStyleInfo {
  final double height;
  final double radius;
  final TextStyle textStyle;
  final EdgeInsets padding;

  const _ButtonStyleInfo({
    required this.height,
    required this.radius,
    required this.textStyle,
    required this.padding,
  });
}
