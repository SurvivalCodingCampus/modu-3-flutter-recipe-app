// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/ui/ui.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  const SmallButton({super.key, required this.text, this.onTap});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => isPressed = true),
      onTapUp: (details) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: widget.onTap,
      child: Container(
        width: 174,
        height: 37,
        decoration: BoxDecoration(
          color: !isPressed ? ColorStyles.primary100 : ColorStyles.gray4,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.smallerTextBold.copyWith(
                color: ColorStyles.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
