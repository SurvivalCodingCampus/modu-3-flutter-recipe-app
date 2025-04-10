import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;

  const MediumButton({super.key, required this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 243,
        height: 54,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.normalBold.copyWith(color: ColorStyles.white),
            ),
            SizedBox(width: 20),
            Icon(Icons.arrow_forward, color: ColorStyles.white),
          ],
        ),
      ),
    );
  }
}
