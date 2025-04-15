import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;

  const SmallButton({super.key, required this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 174,
        height: 37,
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
              style: TextStyles.smallerBold.copyWith(color: ColorStyles.white),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
