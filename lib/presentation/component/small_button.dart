import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const SmallButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 174,
        height: 37,
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
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
