import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';

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

class ButtonWidget extends StatefulWidget {
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
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
        setState(() {
          isDisabled = false;
        });
      },
      onTapDown: (_) {
        setState(() {
          isDisabled = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isDisabled = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: widget.buttonSize.width,
        height: widget.buttonSize.height,
        decoration: BoxDecoration(
          color: isDisabled == true
              ? ColorStyles.gray4
              : ColorStyles.primary100,
          borderRadius: BorderRadius.circular(widget.buttonSize.border),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: switch (widget.buttonSize) {
              ButtonSize.big => TextStyles.normalBold(color: ColorStyles.white),
              ButtonSize.medium => TextStyles.normalBold(color: ColorStyles.white),
              ButtonSize.small => TextStyles.smallBold(color: ColorStyles.white),
            },
          ),
        ),
      ),
    );
  }
}
