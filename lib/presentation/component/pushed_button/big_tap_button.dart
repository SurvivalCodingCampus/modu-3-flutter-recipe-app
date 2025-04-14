import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class BigTapButton extends StatefulWidget {
  final String text;
  final VoidCallback? onClick;

  const BigTapButton({super.key, required this.text, this.onClick});

  @override
  State<BigTapButton> createState() => _BigTapButtonState();
}

class _BigTapButtonState extends State<BigTapButton> {
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
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                widget.text,
                style: TextStyles.normalBold.copyWith(
                  color: ColorStyles.white,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Icon(Icons.arrow_forward, color: ColorStyles.white),
          ],
        ),
      ),
    );
  }
}
