import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class SmallTapButton extends StatefulWidget {
  final String text;
  final VoidCallback? onClick;

  const SmallTapButton({super.key, required this.text, this.onClick});

  @override
  State<SmallTapButton> createState() => _SmallTapButtonState();
}

class _SmallTapButtonState extends State<SmallTapButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        if (widget.onClick != null) widget.onClick?.call();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: 174,
        height: 37,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalBold.copyWith(
                color: ColorStyles.white,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
