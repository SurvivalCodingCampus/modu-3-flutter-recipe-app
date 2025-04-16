// Flutter imports:
import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';

// Project imports:

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    const double padding = 12;
    const double dividerWidth = 50 + padding;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: dividerWidth,
          child: Divider(
            thickness: 1,
            color: ColorStyle.gray4,
            endIndent: padding,
          ),
        ),
        Text(text, style: TextStyle(color: ColorStyle.gray4)),
        const SizedBox(
          width: dividerWidth,
          child: Divider(
            thickness: 1,
            color: ColorStyle.gray4,
            indent: padding,
          ),
        ),
      ],
    );
  }
}
