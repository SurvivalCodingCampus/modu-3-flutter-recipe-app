// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/ui/ui.dart';

class BigButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  const BigButton({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => isPressed = true),
      onTapUp: (details) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: !isPressed ? ColorStyles.primary100 : ColorStyles.gray4,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalTextBold.copyWith(
                color: ColorStyles.white,
              ),
            ),
            const SizedBox(width: 11),
            const Icon(Icons.arrow_right_alt, color: ColorStyles.white),
          ],
        ),
      ),
    );
  }
}
