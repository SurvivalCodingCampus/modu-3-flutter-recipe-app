import 'package:flutter/material.dart';

import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

enum ButtonSize { big, medium, small }

class Buttons extends StatefulWidget {
  final String text;
  final ButtonSize size;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final IconData? icon;
  final bool isPressed;

  const Buttons({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.medium,
    this.isDisabled = false,
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
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    final style = Buttons._styleMap[widget.size]!;
    double screenWidth = MediaQuery.of(context).size.width;

    final showIcon =
        (widget.size == ButtonSize.big || widget.size == ButtonSize.medium);
    double buttonWidth;
    switch (widget.size) {
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

    final Color backgroundColor =
        widget.isDisabled
            ? ColorStyle.gray4
            : _isPressed
            ? ColorStyle.gray4
            : ColorStyle.primary100;

    return GestureDetector(
      onTap: widget.isDisabled ? null : widget.onPressed,
      onTapDown: (_) {
        if (!widget.isDisabled) {
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (!widget.isDisabled) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      onTapCancel: () {
        if (!widget.isDisabled) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      child: Container(
        width: buttonWidth, // 반응형
        height: style.height,
        padding: style.padding,
        decoration: BoxDecoration(
          color: backgroundColor,
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
                  widget.text,
                  style: style.textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (showIcon) ...[
              const SizedBox(width: 11),
              Icon(widget.icon, color: ColorStyle.white, size: 20),
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
