import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_sytle.dart';
import 'package:recipe_app/ui/text_style.dart';
import 'package:recipe_app/ui/ui_size.dart';

enum CustomButtonSize { big, medium, small }

class CustomButton extends StatelessWidget {
  final String title;
  final CustomButtonSize size;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double width;
    final double height;
    final double rounded = 10;
    final TextStyle fontStyle;

    switch (size) {
      case CustomButtonSize.big:
        width = responsiveWidth(context, ratio: 0.84);
        height = 60;
        fontStyle = AppTextStyles.normalBold(color: ColorStyle.white);
        // rounded = 10;
        break;
      case CustomButtonSize.medium:
        width = responsiveWidth(context, ratio: 0.648);
        height = 54;
        fontStyle = AppTextStyles.normalBold(color: ColorStyle.white);
        // rounded = 10;
        break;
      case CustomButtonSize.small:
        width = responsiveWidth(context, ratio: 0.464);
        height = 37;
        fontStyle = AppTextStyles.extraSmallBold(color: ColorStyle.white);
        // rounded = 10;
        break;
    }

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorStyle.primary100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded),
            ),
            textStyle: fontStyle,
            foregroundColor: ColorStyle.white,
            padding: EdgeInsets.zero,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              if (size != CustomButtonSize.small) const SizedBox(width: 8),
              if (size != CustomButtonSize.small)
                const Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: ColorStyle.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
