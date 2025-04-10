import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const SmallButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          color: ColorStyle.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyles.smallBold.copyWith(
                    color: ColorStyle.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
