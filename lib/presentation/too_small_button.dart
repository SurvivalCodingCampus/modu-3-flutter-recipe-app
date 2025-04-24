import 'package:flutter/material.dart';

import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class TooSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;

  const TooSmallButton({super.key, required this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        width: 95,
        height: 37,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyles.smallerBold.copyWith(color: ColorStyles.white),
        ),
      ),
    );
  }
}
