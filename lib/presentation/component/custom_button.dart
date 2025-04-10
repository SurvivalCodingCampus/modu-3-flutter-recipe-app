import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';
import 'package:recipe_app/ui/ui_size.dart';

enum CustomButtonSize { big, medium, small }

class BigButton extends CustomButton {
  const BigButton({super.key, required super.title, super.onTap})
    : super(size: CustomButtonSize.big);
}

class MediumButton extends CustomButton {
  const MediumButton({super.key, required super.title, super.onTap})
    : super(size: CustomButtonSize.medium);
}

class SmallButton extends CustomButton {
  const SmallButton({super.key, required super.title, super.onTap})
    : super(size: CustomButtonSize.small);
}

class CustomButton extends StatefulWidget {
  final String title;
  final CustomButtonSize size;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.title,
    required this.size,
    this.onTap,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double width;
    final double height;
    final double rounded = 10;
    final TextStyle fontStyle;

    switch (widget.size) {
      case CustomButtonSize.big:
        width = double.infinity; //responsiveWidth(context, ratio: 0.84);
        height = 60;
        fontStyle = AppTextStyles.normalBold(color: ColorStyle.white);
        break;
      case CustomButtonSize.medium:
        width = responsiveWidth(context, ratio: 0.648);
        height = 54;
        fontStyle = AppTextStyles.normalBold(color: ColorStyle.white);
        break;
      case CustomButtonSize.small:
        width = responsiveWidth(context, ratio: 0.464);
        height = 37;
        fontStyle = AppTextStyles.extraSmallBold(color: ColorStyle.white);
        break;
    }

    final backgroundColor =
        _isPressed ? ColorStyle.gray4 : ColorStyle.primary100;

    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(rounded),
          ),
          padding: EdgeInsets.zero,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title, style: fontStyle),
                if (widget.size != CustomButtonSize.small)
                  const SizedBox(width: 8),
                if (widget.size != CustomButtonSize.small)
                  const Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: ColorStyle.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
